Return-Path: <linux-arm-msm+bounces-87111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A043ECEBFD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 13:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AA34301CC66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 12:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED511329E6A;
	Wed, 31 Dec 2025 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lrBBKipC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="US40zznq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B15131A570
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184060; cv=none; b=qWAikVZIynLcdP6CES/NJ3UK+VZ/fmVR/5PlCVY8HE5ppUPsoOEw8n2nuBnPFwXLXbNAl3Z8iPVeWH7oAwddeRmDYEtONrUwT9b45Ldm69Izya3c0wJTlhi+iahrUJGctu48qUQHUk1bP1pPlpHns4+ZHMRlHwmxDfi1BXz73vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184060; c=relaxed/simple;
	bh=ACksNw+NYkkl0s0wHrxcavYpqmO07bWYFMNNNVklzRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTLCsy9VU43RmzapKPW56zprONtPS5KQNjPA2myAsa70vjdfem6McVsOfCZBdmG8COMWqcQ1a47uDak9Du+jeL3II5ZeG1cN4FRBgiYUZpxlGW6pxPhvpb0WZZ76GYaosPSlNFQ9nietJMjQjxIR4GSS4JjC3y8K+Z5AYa2Gua4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrBBKipC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=US40zznq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV4ohdM1429931
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+VMa1aZZxFb7V0dJ2w4Qwd1Wv7+cAd4IqsBj+pDQQ5Q=; b=lrBBKipCAIGuRvyR
	WzkF+dHmJbPsluaqkz/uSHYarUFNJQ4268ATtpU5fWeqDYgb9240JGV4rBTLls2A
	1pPJ1FpTbB6use19naR4Ew+hWZpej0B6V7C50dP3rXhqKKfdSML9uq36Cf0SqcwJ
	41/pdAdW5oxRBpz2Bc8iqMRLCPdRrKYfJkDtkMeAKq7QaFedtni4efqJNsVk2yW0
	8/Btk+vWxIWyICE2OpvpcPSAIrd0veJRUAYvml+w8KNTkyyqFbwJjVSSB8xVXQj6
	Y0lwVe/Qq+JPyRmp8qZ8NVi3qA6qu24Ki44H1LeL1BilJd+yHxBwuiKw781JwngE
	hHEw4A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcw5e0r7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:27:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee409f1880so29289081cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767184058; x=1767788858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+VMa1aZZxFb7V0dJ2w4Qwd1Wv7+cAd4IqsBj+pDQQ5Q=;
        b=US40zznqzFQAqvOFHP8/6wIHyvWIaf5AUrmHfXWmvMLAAse6B/I4DPGNpwrtDxjGOX
         aOREcj8eKLjSICg6MzqdrL7lSBBSGJd3BerqRZ/YQYLCMOiw3VOc/T36JzO1TlyQDPWZ
         0FlJVCmW0DiPQ++XUZyRC2YwftOnEYk2+CWTISNWQXqmCOt3ai1CK3kDbTeYCR0dnkZm
         zRQu2pAz6IEfqFQA3ejfleetcVzQ7gbUX6Rkr9uk7Pe6jKkRiT7otLtuRyT8bo71mr/m
         SMJA6R4ggjmEiB4Yjt+D4I6FW/JigrqDmSEVh5vGugGbgEqJdIf/jcebnC1tA3jKWBgx
         19Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184058; x=1767788858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VMa1aZZxFb7V0dJ2w4Qwd1Wv7+cAd4IqsBj+pDQQ5Q=;
        b=oA7Aycn3bLnsdcjnNRLB9sPSiGVRfNR+ygbl8vVBx/hxzt2Bxx6ZHVxGOyj4JBJYZV
         Tg612Bq//DuAS31VFCd03Ueqn6Rb5aRyAIPzx5B3LkyNhYhgYuKyTymIPpCNX8JY5op3
         odFSDlxXiUCXrqe87sDT7qtKXeJwoDbEn6rbOWcUw3JBBzRCFR333oX8uLo4maC+fAN7
         LKWwe3y614oA3JINrOuSGJBj0ipiVuUvFtY4aW9thlP6F7lzqIR5TTly4YJaGE41knIe
         02K1QeexeECFB7HVllqqoHlesRho9jCFVuYymloWUe9gzHrI5lTt1L98lzouMgiSVTQN
         8ieA==
X-Gm-Message-State: AOJu0Yx0gGUXxeMetzjZJaCzNQDnLI4X1mwVCqSku89KTZTv02eetm+r
	ylGmC/QOvpYZgL3tZnCqaC5IigFC1CxtGvHoXRX1yvXfwrMoMOf7hqatKeYGNEfMSGjRpH5efBr
	URJZ5pE5TO1x9kFicIuQQreRhcVi0k+BIn+9u6e/VJ43n1hIR9Y5iKyWJfYx2mErlupd+
X-Gm-Gg: AY/fxX5kFUIpkL3Sfly2eqsygmQCKpObYIQLXUdE4uHIh+8XrS/HxXH5q+oi0yq+jdi
	YV6QC5ydb7qMMzPXeFxgnesEvASakGJdkgC70C2VgXH+S65zgeogq1LbBzpjTwZB86mpUYCuweR
	BW7CotquF+HmbvxgY7A0Byaft009CYJaIXqgPPRjakp/lYvWb0cgh/mAcc8JQx0PzXRH58l1QV0
	AQ5BfmQ56MpPxowp3BBfXdpAT3y2oQ4whznL2vSDTvWZin6NsiW7UyL41CHDXUVwTn6IhJDRomH
	RwNSMNcH/x4xvWgPCVXDc58ZwwCloqmkDRLUAhCJFzsDQFzQEZejm3tp4O5YRfSwoiZ7p3+EQDl
	fyYCoJL/uDBHoC5p1GKVWrYaqTkk8K+pZZNmv9/rHY1FOlkAS1kKbMJAVAds/zFkKmA==
X-Received: by 2002:a05:622a:247:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f4abce7d98mr420636451cf.4.1767184057901;
        Wed, 31 Dec 2025 04:27:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHB3TY6zH62/Mf3iEP4dkTisCB/m9YsUB739Jw0dZNO0RNTE1eGtqKAq+EBlz1huXNzUQ0PVw==
X-Received: by 2002:a05:622a:247:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f4abce7d98mr420636091cf.4.1767184057424;
        Wed, 31 Dec 2025 04:27:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f18575sm3859646466b.54.2025.12.31.04.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:27:36 -0800 (PST)
Message-ID: <e4e94f2c-98f3-414f-bad4-d23f7cce8047@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:27:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251231-mss-v2-0-ae5eafd835c4@mainlining.org>
 <20251231-mss-v2-3-ae5eafd835c4@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-mss-v2-3-ae5eafd835c4@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOSBTYWx0ZWRfX3GyR2G3WmX0z
 Cvlex/zyP18raWM1MACvDppbgXeLpE09LDtkQOlGMpSrQ3zHP0YES3z8BftNtA6qElhk509seLW
 2oeDcPMHhs5TDS0IBlPVYorjGjdSnSAtRUtERZGNdsdfQvPSLfsTwi0uXDNx0mCLhWhA+dVwyYz
 +8hE6RDoY1NSX+R8aZP09dsqgo2qmZPNnRKpZK2tJYWIPv02h/NGsajAxJryh64/uEDljC8Ylbu
 aoRqcYhvgU8nCR6ol456fpTQOo1ikXt0WtRPcPMCSNEbxaZ9o/HnAkJQDe8S4+vv+PRIAo0LUqV
 2PM6oCStK2EEfunyn2nJLWZr3qTDx9WFhP/gqojm5ya+h0VouIpumjyqabjuWVEA2uII2I9rtpH
 MFTdqrZt7I0XVmHjM3n1TJiAxS2g5RDIQOnRvRWutg0TtOWvACLIId7J3VBHejzF2BbJWXiSb4f
 5lX1vb6uou5YMJhR73Q==
X-Proofpoint-GUID: hnxA1GvLQX5RleWybUJOau-VVVjjBb5F
X-Proofpoint-ORIG-GUID: hnxA1GvLQX5RleWybUJOau-VVVjjBb5F
X-Authority-Analysis: v=2.4 cv=Mdxhep/f c=1 sm=1 tr=0 ts=695516ba cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=j8Cu_9a8AAAA:8 a=OuZLqq7tAAAA:8
 a=1VDwhlkcsf7JRsAq08cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=A2jcf3dkIZPIRbEE90CI:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310109

On 12/31/25 3:29 AM, Barnabás Czémán wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> Add support for MDM9607 MSS it have different ACC settings
> and it needs mitigation for inrush current issue.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> [Reword the commit, add has_ext_bhs_reg]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

>  			val = readl(qproc->reg_base + mem_pwr_ctl);
> -			for (; i >= 0; i--) {
> +			for (; i >= reverse; i--) {
>  				val |= BIT(i);
>  				writel(val, qproc->reg_base + mem_pwr_ctl);
>  				/*
> @@ -833,6 +847,12 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>  				val |= readl(qproc->reg_base + mem_pwr_ctl);
>  				udelay(1);
>  			}
> +			for (i = 0; i < reverse; i++) {
> +				val |= BIT(i);
> +				writel(val, qproc->reg_base + mem_pwr_ctl);
> +				val |= readl(qproc->reg_base + mem_pwr_ctl);

Downstream doesn't do val |= readl() in the inrush-current-mitigation
case

Konrad

