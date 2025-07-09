Return-Path: <linux-arm-msm+bounces-64121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B391BAFDFB3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 07:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 164417B9FAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 05:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027C226A0F8;
	Wed,  9 Jul 2025 05:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xnpsv73p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7796726A1B8;
	Wed,  9 Jul 2025 05:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752040361; cv=none; b=FNUeU1Ol+1yXkX8Ebc9dpEOTg6Qk5tb8pidj8AjYtG8DSiAVmeiJusJr1Ar6BfstmGRTgeiqQKx584Y+oOTsn54QFD2WeLIyb98U6ML2ZMniTOEHiYBeXJF7ilIAFJJITwddHGoGhnq7LgHrV5q01Mq0whidCVfSgb2wvSoTlQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752040361; c=relaxed/simple;
	bh=S+1VASoZueqLOAiuv4KSYJwjBgeX4pD7ZAVc/lOBC4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aNXc4/zlZcc/tWEmG19YsUpiBbxnJN6ZLCvEZzfCUR9jtN6rOElNpdgLM+IrIaocLJp9pHk2erbMF7SjdPJeMvIwws+Ch5hBl6lp23nLLXV22lEyZJWjeo0c4QWQZhPmh/a4tiYc1MFhWoWxSCP+YS1zTmjToeHwbAodUNlmfDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xnpsv73p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568KFXLD031854;
	Wed, 9 Jul 2025 05:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BG1f/MJuwVAMeJat5sVGuFV65B8wUI7Ih4DusnJQ5BY=; b=Xnpsv73p7vBgmt4g
	YthfV2nMMjE0xnNMzf2hHBEtQJaX+Bpz0fPTUrzX6ag0kQs0qeAB7OhbjWUJlA+C
	qehx/wXcYfqXDEaJ4ADqAQYOk6gCbHWyZScyYRQGACks6KBlKQFFwSEvW5PYytH4
	Mb0htmUotq9Iq+lk+A/ELNjI1I9MMg8yxry/PB+770l0zL69ZnuDc3F2MNKbV/c0
	VWGXlgHq6BHsXVqdxXScujxjyWsmhBcCH9AQ4+Gm2GBrEvbENKHA3wMnPu08YGF5
	IzixXIgzNvafw9Jgxpgnv4RB3iBiKM22AG4pSAGetRyPfbAG5sXI/T8xdJm9LI4X
	PZm13Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qtd61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 05:52:34 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5695qY1D021666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 05:52:34 GMT
Received: from [10.239.29.49] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 8 Jul
 2025 22:52:31 -0700
Message-ID: <2dfb6c0a-df7b-4039-9a65-0f1036752bbe@quicinc.com>
Date: Wed, 9 Jul 2025 13:52:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] misc: fastrpc: add support for gdsp remoteproc
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250709054728.1272480-1-quic_lxu5@quicinc.com>
 <20250709054728.1272480-5-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ling Xu <quic_lxu5@quicinc.com>
In-Reply-To: <20250709054728.1272480-5-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA1MCBTYWx0ZWRfX0U4mLAgBCtUn
 Hz8wcx9R/VBptwfo/DjWUnc/0MCUqd10MsMqrBrLMhhZuWQzSoPL4farBksgI5cEPW2ZhV9JRQf
 aLt1WkfW033WFL8tHZ5b6HKahL/uqubHEAAum2NK4kOdWpxRe5y2vhb/xpAbzyjTP3NdfaLnZ7M
 HD40njXT8xb38eWLw4mbAjn/OWdR7Fguawsto69tyElNxknr0TTv78wyh/ZIrIPwvbnxxqn5RKj
 3J810uFKwbnyQZwZJZuLm52+40CRkoTcC/e5UmIMknAaMAIM7qW5v5nDJqWriG/LY47IzXuX46J
 dDI45MCwWMWRp9jNv1aTlQaFT6ruMgmPZ9hg3rCKk+zHod7GfNhY7cXB/0TblDfbk+MjYv3TACI
 +Bg3tR2pgH0g1/Qs15EaytJJQyL4fyGZm398N90uVuK0Fch/diyFH0ORnB4t400YUF3UyXkP
X-Proofpoint-GUID: B7Mt4l2B-nmTxkjZWs0eT5-wSq3bk1ur
X-Proofpoint-ORIG-GUID: B7Mt4l2B-nmTxkjZWs0eT5-wSq3bk1ur
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686e03a3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=z5t9ctGjsfNMbOfKQ0kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_01,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090050

在 7/9/2025 1:47 PM, Ling Xu 写道:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. GDSP is General Purpose
> DSP where tasks can be offloaded. This patch extends the driver to
> support GDSP remoteprocs.
> 

sorry, please ignore this patch.
I haven't change commit message here.
"Extend the driver to support GDSP remoteprocs."

> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 85b6eb16b616..d05969de406e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -27,6 +27,7 @@
>  #define MDSP_DOMAIN_ID (1)
>  #define SDSP_DOMAIN_ID (2)
>  #define CDSP_DOMAIN_ID (3)
> +#define GDSP_DOMAIN_ID (4)
>  #define FASTRPC_MAX_SESSIONS	14
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
> @@ -2249,6 +2250,8 @@ static int fastrpc_get_domain_id(const char *domain)
>  		return MDSP_DOMAIN_ID;
>  	else if (!strncmp(domain, "sdsp", 4))
>  		return SDSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "gdsp", 4))
> +		return GDSP_DOMAIN_ID;
>  
>  	return -EINVAL;
>  }
> @@ -2323,13 +2326,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
>  	case SDSP_DOMAIN_ID:
> -		/* Unsigned PD offloading is only supported on CDSP */
> +		/* Unsigned PD offloading is only supported on CDSP and GDSP */
>  		data->unsigned_support = false;
>  		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>  		if (err)
>  			goto err_free_data;
>  		break;
>  	case CDSP_DOMAIN_ID:
> +	case GDSP_DOMAIN_ID:
>  		data->unsigned_support = true;
>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>  		err = fastrpc_device_register(rdev, data, true, domain);

-- 
Thx and BRs,
Ling Xu


