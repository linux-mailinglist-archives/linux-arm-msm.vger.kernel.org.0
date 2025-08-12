Return-Path: <linux-arm-msm+bounces-68653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 021BAB21DD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 08:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C28B43A57B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946411A9F9A;
	Tue, 12 Aug 2025 05:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjfgSUic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3068629BDA4
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978373; cv=none; b=k16sDC3iwAtAZO1YIqgnHga2z85eQi9LSslRolR85zTtAuhZ0l/fWurm9MX92EXVwMdXhXVBZdat8P95SBpsForw07cnVIw/TN6P5Fjw2qp6G6jp4eKHNBv5+AsDSIAF1WkXtM9e7eN+4U6qCjtTik1DUWV57JhjFJBQsiT5xAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978373; c=relaxed/simple;
	bh=MZYffmo89cYE8maSdSo0z0Jwfu3QhnjLnWg1HHvDDWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LptkDhY3b4QIydeOql6Vl68QP0a1bMuUkqd/zk9VCBjm9InAN4ou9EjxtOlkS0r53Y6fFBduyCcyN3xfsOUMLH2z//MLADDFziOchUe3i97So7qC3JIeFVdQ0+I+OODjGMZtaRvpBcWEBzd5FAcFcUIPwspp8nwDH0RQ9Qlqm/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjfgSUic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BNJgVG002240
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UVs1qOUwwZ9Ygbyop1f7a1vL6vie0gD3Yyv8YMlSSUg=; b=JjfgSUicPYhkaNMH
	ta2JmlpPCCMD7Nf8UnH93O46VdDpISPs86GqyO4AXno7PTVVdKGd0s9gzw8grMKa
	YtXrbqCmURAsIkJTK4hnGDJtDJZKUlkrMgAqwggCB0/Oyi0aoSXAI8srDYa1AqI6
	2IKrDcOw1xHqxWcW8RHBx9CiHvoB9OzIFOFLOLZVjJHkKNAv5hB+JZqLnzqwkBQL
	1GxKrXH6TpWkslxGINc1KqfJP7H/24TJaNGAc4rWht4OdZFiuPqb9UYnQ9F3etfx
	yudSr4l3RQI+OcUsDef+akAwr3VMf2d7tFANHZPKYv/j+N0/5xG3UkEDDCFGxfn2
	Tlf2Hw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g6xna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:59:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23fe28867b7so68689265ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 22:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754978371; x=1755583171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UVs1qOUwwZ9Ygbyop1f7a1vL6vie0gD3Yyv8YMlSSUg=;
        b=MdABhNrmGGxRjm7r4cHYV1z1CiOH80PB4aOI20tQ1J/Hrz2Z8Xi5DnEMAVeOLpfXbo
         fO+6xkLWq8cBhMwT0VP/i2qlU9j5VPxleYRHs2ccbr6DUii+wUG0rJ5i7Jia4WhKEBHo
         mH2Dq3DUgFn9oj/1JcH5+iKGov0Lw27/I4n+KXGoQOQZpB9v6e/JHSDBr22ZNU2QII8q
         jtMB1IWtPxKgaJ++/Co1VBJMKs9Jbgh23D4aH4Vc6xkAF83RdDYnpHFnphl4mfwXV5o/
         n1uAwiKMwvhNimR2fIP8t3/9YBqhLae9EdRbNMWV8ypbio3bIF9lZixAFr35s6oOQiru
         B9AA==
X-Forwarded-Encrypted: i=1; AJvYcCUzqb5fKZ0pYRlr6OXQAC9x5m5p8wmsGPDCHjkbqDZXFVcXKCI1TFML99oLP1/I6W+Qja9YqArFKFTIB+q9@vger.kernel.org
X-Gm-Message-State: AOJu0YwGt/8KvvIefP7eGEBB5XHZh7LujSv9mNhny3nUHuq5QTlMyDEl
	kXf6zt2Cz5oePvwRCrginKdTPLYFPD+8q9mTOrq1Z245vTtTYQqjcACVvqPVUAKbXRNZwMs6vOu
	PGrZH3oFv+lrhZgGQm64QmF9Oh4W3Mevcnzeph5p7oSnTEyfkngTwKV3hlCekUVcAYrns
X-Gm-Gg: ASbGnctBwkEQNpdUbam7ci+NjmmK1ZfJYpH/RyvMscx4lfdjeU2ps8CU4tFLlP9A0WI
	lKXV09sEGi8SkOcz6fgFzGWV5V1aLeooT8fAeFXH+aGplSkKzpNePHJcV/3AWcy82q8nDPNEqQR
	73rqnpjDQava1ObKMVnsvYwtR7Y+g+xpb8psbs1GPH+rAaTCKc6M+03JDDCC++b2qAU0x4RgxxG
	Lxcu3HrutlI7bJ+OKiHYuWH7XWUFZjZmQw7MuIhm2NWzaLL2DQM0d58kyOhw3IWHpx2nPZXF/5d
	i8wgPVV/In+JvfbfbXLp/KtK0v9r7jJ9Wr6nF0f7QKZzHvW13iuunXdck7hvd5aRvctnSvc=
X-Received: by 2002:a17:903:3b8c:b0:240:3909:5359 with SMTP id d9443c01a7336-242c222c92cmr223933695ad.40.1754978370733;
        Mon, 11 Aug 2025 22:59:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn6qxc6dEvtwqsdAG3FWWRuYtHLzpWr8RjIwuXy8tAJXkzisuhVTlP6xpTp/Z157QjqC6fXw==
X-Received: by 2002:a17:903:3b8c:b0:240:3909:5359 with SMTP id d9443c01a7336-242c222c92cmr223933365ad.40.1754978370317;
        Mon, 11 Aug 2025 22:59:30 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b5bbsm286877015ad.128.2025.08.11.22.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 22:59:29 -0700 (PDT)
Message-ID: <beba23d3-b7e6-4368-b2bc-b802bde4166c@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:29:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/5] misc: fastrpc: add support for gdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-6-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20250716132836.1008119-6-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689ad843 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=OU-qGZapnvjOigiI56EA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfXzOiNIH62cY1i
 bngDISrk+wRfpAkcfgBkT4pgYw2lTOh5G9gdMOhZ05bRbQYJLgR7vFrAePymK4EYbGOez+g5Ilv
 3M1yyhP7iaVpb/wp7vQlIlHyLXOYhY/rZeeqfrpxFA6LWVWfQXmXnbPccfQb1p3Tcic4KckmLQK
 cTkWTx+saqmlfcRWjBQsc2+XVvC5YODL3h0aOD/rHOFHQbM8sw7DDDuGUiXKUxVQfN6qPesyEEF
 cJ9Za+EjUao72jea5/LWKLrhSiQiIvPvAyX228QbCgmDAWl4HjrdSj8TCy/75Z2jaYZzL0gwJqT
 QIu+1auNZr0lvgb+J92GY6pwRSMd9q2RUUecqn+XqzX9p8ph3qpoHb3S/Pz6XJ81i+5udIWOC4J
 WYDPcqr5
X-Proofpoint-GUID: qOfL0v4SqhFNAVM37EWOYoHGfcm7iMRt
X-Proofpoint-ORIG-GUID: qOfL0v4SqhFNAVM37EWOYoHGfcm7iMRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031



On 7/16/2025 6:58 PM, Ling Xu wrote:
> Some platforms (like sa8775p) feature one or more GPDSPs (General
> Purpose DSPs). Similar to other kinds of Hexagon DSPs, they provide
> a FastRPC implementation, allowing code execution in both signed and
> unsigned protection domains. Extend the checks to allow domain names
> starting with "gdsp" (possibly followed by an index).
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>



