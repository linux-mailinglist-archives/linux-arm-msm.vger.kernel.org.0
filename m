Return-Path: <linux-arm-msm+bounces-47205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C4BA2D123
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 23:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C35E3AE5FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 22:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06D01D619F;
	Fri,  7 Feb 2025 22:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="khZQ4epe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CB31B040E;
	Fri,  7 Feb 2025 22:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738969068; cv=none; b=XgIC9insLci28CjH3RyOuTJlIAkwSTX8rrA4n9Dh+exaRw53NR4qsjofuIMXtUl9wyk4Li4gA4iB0AcCQPCUMKQWIKYFBTuAlT+1rMgJAeadantMYFLn8CRNyAwg3pTlXT0mNop1M+cxfW8wLv7dYgNYCwwC21IUzuHpZNdIi7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738969068; c=relaxed/simple;
	bh=EwOX2LqLoUX8hLiZVUKBjbkzVRQ+eP2S6JYm3fpKpZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eI9M4Aq6ypq3nm5QkaleMzAAPRe+351KSLrjHswfI8Wqfv1zTVSQMRxxXXCjvoAEChlHlQm6UeW04zy+Np/fbMvzKGlxhVJIdEmlBB5qe9QN7aIfe5vw44bgLtNx15mfXYQRthAM82jfECRLWEZlMp5NTIf/jSKv5Ih/CpbI3U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=khZQ4epe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517EpWSH012653;
	Fri, 7 Feb 2025 22:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NyLXnX2Tiy5mf+72FCcjR9z6tIQv9KqGrAYNYPa0/Qc=; b=khZQ4epea1lnLjmt
	ISwcz3LJ6khuU90NAMshikoYRUp172ZjcxLTN9/xvtJB7qpvN2JRluqbKXY4vCey
	s090kib1WuiXk5zCI+chUFJE45QU4loIeYmEwqvwnJtksZmskySmfhMU/92TsonT
	HepW6C8CqvUbkoP0XiP1ITBUQ8xVpEGDgtwmSWhq2iepFtnKYJhGRKYHTzeFb7dg
	3j5IO/FN92yqPeJtNhXFrNaHD5KDRGxWb78NRmU1oLzlKp+aIwpTdv9ZMi+MfpoT
	Ku88o6qhCBzhOrxg7zWT+gMab8QUirAZZl/ibk+M54vf5ok02rTSWwNyLmI3WBsT
	5PL9hg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nmaah36u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 22:57:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517MvZeb001765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 22:57:35 GMT
Received: from [10.110.94.65] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 14:57:31 -0800
Message-ID: <04adfe6c-5f04-4e28-a52d-b8cb5654771a@quicinc.com>
Date: Fri, 7 Feb 2025 14:57:30 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] arm64: errata: Add KRYO 2XX/3XX/4XX silver cores
 to Spectre BHB safe list
To: Douglas Anderson <dianders@chromium.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>
CC: Roxana Bradescu <roxabee@google.com>,
        Julius Werner
	<jwerner@chromium.org>,
        <bjorn.andersson@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Scott Bauer <sbauer@quicinc.com>, <stable@vger.kernel.org>,
        James Morse <james.morse@arm.com>, <linux-kernel@vger.kernel.org>
References: <20250107200715.422172-1-dianders@chromium.org>
 <20250107120555.v4.3.Iab8dbfb5c9b1e143e7a29f410bce5f9525a0ba32@changeid>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20250107120555.v4.3.Iab8dbfb5c9b1e143e7a29f410bce5f9525a0ba32@changeid>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BmfbeKS-e0ck2Bd04tpftWN13s_vAgSN
X-Proofpoint-GUID: BmfbeKS-e0ck2Bd04tpftWN13s_vAgSN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_11,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=718 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070173

On 1/7/2025 12:06 PM, Douglas Anderson wrote:
> Qualcomm has confirmed that, much like Cortex A53 and A55, KRYO
> 2XX/3XX/4XX silver cores are unaffected by Spectre BHB. Add them to
> the safe list.
> 
> 
> Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
> Cc: stable@vger.kernel.org
> Cc: Scott Bauer <sbauer@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v4:
> - Re-added KRYO 2XX/3XX/4XX silver patch after Qualcomm confirmed.
> 
> Changes in v3:
> - Removed KRYO 2XX/3XX/4XX silver patch.
> 
> Changes in v2:
> - New
> 
>  arch/arm64/kernel/proton-pack.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index 17aa836fe46d..89405be53d8f 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -854,6 +854,9 @@ static bool is_spectre_bhb_safe(int scope)
>  		MIDR_ALL_VERSIONS(MIDR_CORTEX_A510),
>  		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520),
>  		MIDR_ALL_VERSIONS(MIDR_BRAHMA_B53),
> +		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_SILVER),
> +		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
> +		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
>  		{},
>  	};
>  	static bool all_safe = true;

Acked-by: Trilok Soni <quic_tsoni@quicinc.com>

-- 
---Trilok Soni

