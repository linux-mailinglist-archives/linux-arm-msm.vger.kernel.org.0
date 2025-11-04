Return-Path: <linux-arm-msm+bounces-80345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C8EC325E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 18:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45520420083
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 17:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D043C33B96B;
	Tue,  4 Nov 2025 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gndwe7/0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bK38pGtq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57353338F5E
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 17:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762277666; cv=none; b=UKM2NtiQOMEUmbrSWRVHyHoHesTgF/EotcFY4kfAxyDI15R+hbbuj3zQySLX1CrA6tU+twHLu/aC3rp2AotpsqlBEPsgwRobFx8c9VjTtQpSysoLRjA/1leueVx+1vYTUgWvsR8LOxTGePkRC6/71qbc4w73ONfszXdbCJIf9t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762277666; c=relaxed/simple;
	bh=7/3XFyqO8yniSuHoLNtZauSEhqabYOLFEEbErOWMHL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOlvo3U5JgTAxELNWgsjoi2moK7uXob+NeAPZE/oEab/8xNeMVyS0dHVEuL1cniMDsgG0GKElwt07YWE3/bakzl09xiT0UGCAR4IfGGMCA5K+GxE4YYKoJfN4ooMvLZbdRRaRDS/JC9v0LYmg1BTuMHHXgksF6pIQlLH51SRxRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gndwe7/0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bK38pGtq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Gg82X2482701
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 17:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BpOzXxLIii33PABcdbzmfPQQSKfiMiKzQ+N00ZHp9XY=; b=Gndwe7/0q3s4gw2f
	RAOq20/zsMveVwGJA/0z380Zs2VFJR5AB9nm+X1T5R/peC2pOafD4fsZf5qsGSAK
	B6++5qBLDaAuEONqb3qVhJGehspVdLoo8PY7wUiSAjFR94CinPgVmxmtW+XhxVX/
	V56TAe0Aw1yrL4G2rO2QU85IebPHeAK4yLDUc11bI1f64/hx7iYosW6ZreplRVNV
	Ie/Q/4dwzCmM4n4L7J4y6NO9U7u3sGXmpv+1FPFIVR9EPhbGq/tJCrZhUCig6ypw
	8EcqT+uOqEOQA50z5wTbbjUn6ZhmjqhgaXW/cYsiRY+fbJAoRbX6fGv6erIHcL7E
	+C8AvQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7heagx23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 17:34:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-883618130f5so225227085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 09:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762277663; x=1762882463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BpOzXxLIii33PABcdbzmfPQQSKfiMiKzQ+N00ZHp9XY=;
        b=bK38pGtq9yIjplSHXR2XZTV+EEmXhImHu6cbCem6Q7DxArnXXRn7sM2FJaeA7ImDmZ
         PnRTt5ilA3QLMmG19KdiagKFwDfqdGH5i2PAA088QSmVXu/cXjQLL8ErjNefHMUXfkUf
         DxGsH8FItyY5OkULGo957+DghphJe1kAN8Rj7zNQCgGlhQJVx4VuVJGHk3CWxQr/oI3r
         c7D2/IKAjEB9sMAQWPYh3EMlT46xmRrJ/xD0qVH3uA2jvROfuX5PSgJDTcCcTURvT8kK
         rwlZno2Et2KU+bB/+IrU2yQor6iJPC/v8mHsCw4/1LS0Bdu1WO8eXId+vrclt+llIycS
         xe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762277663; x=1762882463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpOzXxLIii33PABcdbzmfPQQSKfiMiKzQ+N00ZHp9XY=;
        b=G5vjIbAex8OcUap3ZBaW94BJWg4cG7YdD7TaPX4h/XrXRJZMoOpcL/M2BvYECqFamA
         EDv9zJj6ZKADslCCJQ0qtwNOGiSF22K+CUw4cX9PoiUR5xCYGjD/8kQrs3T/2xvizr9I
         Pfo1KPMG7RtkTVbLSNoX87xdTM+7BRm8kSBg6sSCTpzJu8gi12LAu6i1LFfp6lY34Fja
         U5QArbLFFJA+ki36KKoRLBH3mH3ju6MbSvwfTBBKOB70GI3y5A3gp81P88JKtQSmoW4/
         p72nO3skx1D3VbCKkyoq1bLQX9yxYrDWgta9L7F3PMxzqxoCNeYGY3qTLHoOk91p2hQD
         t2wQ==
X-Gm-Message-State: AOJu0YyGLMZYCUMCFzDR/G5BOL819rhc63tGDxtwuJijR8QQLU6AwaaS
	1ndUPfY8TyUumVF3i/WbuhzjLpqsArLRQYtdDUTylq3ELC7MuOCSA7MVIxOCDuMxJrj0EUGy2rk
	y6q91mPz0TRqKhspqkzZw/BWRow25B5BgyH7xYYI5C4CUeNsOmIUS5xLFli6n3PpBEJquTBMKpX
	vh
X-Gm-Gg: ASbGncuwCsg9C9MuV3PlXZ+j7etTpUGyIw8v7LmMWOA/cC3ftmjwCmgWzlc6v94dfhE
	MxAUKjVjQheM7EEOuK0wRyXMcnRvnX18Ffjq6aQcr/AahyGsfUXpYsNg5loGjIz3MlQhNGjx2W8
	pxx6W5/zJsK6NSaEX8m4vmYRfNXc6tN9RsPOg/KmZN/ORX5BZNL+LugS1c3Hi5pDxGVhOmjZf6D
	SqLPJvO0L32aXYFEHU9NLQxvTRcxjrXwFt6/1yOd/8IpZtvyLGsHuRJwpUbRgkfcHZ+uTiCE2hF
	BehPx8WhZjlsJDNpKceMkLSYBejhhJycA0of4s0X2ewSpWE0RGbWaR99Pjmi0BPJRfGXXdXNwQ/
	6gjHaEY7gbnFrXJK7GvQLeik/wOKGCi/YinGPJjcA3BFvBH3lSitz30ev
X-Received: by 2002:a05:622a:1b87:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4ed725b2536mr2720121cf.10.1762277663115;
        Tue, 04 Nov 2025 09:34:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1LU5jc9pJ2naZFY8KBUTTek6RS7kQbriHmvySckwkZoljhNS4y2f4aBMgyMCSvD48Lg7gPQ==
X-Received: by 2002:a05:622a:1b87:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4ed725b2536mr2719641cf.10.1762277662539;
        Tue, 04 Nov 2025 09:34:22 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6806d82sm2576549a12.16.2025.11.04.09.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 09:34:21 -0800 (PST)
Message-ID: <1d13f465-aa9f-47ca-9721-f48a76ce0e03@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 18:34:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/14] remoteproc: pas: Replace metadata context with
 PAS context structure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-5-7017b0adc24e@oss.qualcomm.com>
 <fc8beead-566d-463b-aebe-407429adf156@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fc8beead-566d-463b-aebe-407429adf156@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GekaXAXL c=1 sm=1 tr=0 ts=690a3920 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=R6ihhxNNSHr7Vl0uh6gA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE0NyBTYWx0ZWRfX5E4Q17ytQNtM
 VF/jNaH+jVBxa/yaJJTNAo/TY4u03z3kXpsbCuK+0WaxuttcQ8J5e2ZrCko5RoaCVzQAsId+19Q
 xcXizauJWVGwoZnh9YzbMcXl1Ktp7S7VQ7uFvDpLeHxEMtJMsDGFdVGtI1tDWG2D1y/Wn2g3Zdj
 q318sI6UEfTZCidB/xEIF1fB4f8vw/bOdA80tYKYN9X69PjMR0xkxRz0rTd+w/ULOO15gUXvXDJ
 eeWtTDPilw66CuxIIgzoKnJTIiqjG2VIJ/Clqzoa42fIdQRV5EX/52nuOCDxsqvq50WkY8c/zUs
 mtp0yGc4DDvG7m9h14LRw/ferey7B5S2HiKuw/S5MHj75RZbzqdsZT2xMK3/rZkYopSJZUZaoTK
 Fnzb3N6n/pntNqTfX8UAIcQpGF6iBw==
X-Proofpoint-GUID: SCppec8ODfQ2bPT8spwkRKMEUZwPM06k
X-Proofpoint-ORIG-GUID: SCppec8ODfQ2bPT8spwkRKMEUZwPM06k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040147

On 11/4/25 6:33 PM, Konrad Dybcio wrote:
> On 11/4/25 8:35 AM, Mukesh Ojha wrote:
>> As a superset of the existing metadata context, the PAS context
>> structure enables both remoteproc and non-remoteproc subsystems to
>> better support scenarios where the SoC runs with or without the Gunyah
>> hypervisor. To reflect this, relevant SCM and metadata functions are
>> updated to incorporate PAS context awareness.
>>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> ---
>>  drivers/firmware/qcom/qcom_scm.c       | 25 +++++++++++++---------
>>  drivers/remoteproc/qcom_q6v5_pas.c     | 38 ++++++++++++++++++++++++----------
>>  drivers/soc/qcom/mdt_loader.c          |  4 ++--
>>  include/linux/firmware/qcom/qcom_scm.h |  4 ++--
>>  include/linux/soc/qcom/mdt_loader.h    |  6 +++---
>>  5 files changed, 49 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 5a525dbd0a2e..9cdd152da592 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -603,7 +603,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
>>   *		and optional blob of data used for authenticating the metadata
>>   *		and the rest of the firmware
>>   * @size:	size of the metadata
>> - * @ctx:	optional metadata context
>> + * @ctx:	optional pas context
>>   *
>>   * Return: 0 on success.
>>   *
>> @@ -612,8 +612,9 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
>>   * qcom_scm_pas_metadata_release() by the caller.
>>   */
>>  int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>> -			    struct qcom_scm_pas_metadata *ctx)
>> +			    struct qcom_scm_pas_context *ctx)
>>  {
>> +	struct qcom_scm_pas_metadata *mdt_ctx;
> 
> This is never initialized

Pardon, I'm blind

Konrad

