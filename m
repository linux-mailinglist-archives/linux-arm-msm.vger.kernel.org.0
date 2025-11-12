Return-Path: <linux-arm-msm+bounces-81505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E637C54AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 23:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CFF13A9C92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 22:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC7B2E7BAD;
	Wed, 12 Nov 2025 22:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YaOQ2gMv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZ18OKPh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114EE2D6E51
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 22:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762985380; cv=none; b=iYxyJCyLEdwbU6MFNHgMKLRvZo9vkRahNShxwHbp7I5KIdhiDrHuAww8VvIDxHLkJbxalxtsh4CnnxKKH2Tani68fHNR3Dopmm4BEm1Q/y2h6FoeE8w7p+w254fFptJ+qspowjFR3H56XX9peLsDHnkylyDSfM51RBfcYQKjI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762985380; c=relaxed/simple;
	bh=uu/OVGsmPgjiqEif9CsqNjLeyI55qyMfIViXNJbj+t4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GaSe443xhw9suE3SOcmi/Z47+dTFfiGXIgNGwtw39hUPHMq5ANPnKmmc5tGrnjvehoKwEB6p36JGp41BC31i6Hu9b0NxZMgbysmBNVZLX750XO31PRwCS9t6WoAF/lgpmKInKKg3BX2slwB0gMz4RNh5g1G77Je3y+EVpvp2sYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YaOQ2gMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZ18OKPh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACH2BDY721887
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 22:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PKqNXD1DollfLI5h1J2Xseqpi/6Yas+Ng79HmXPNvu8=; b=YaOQ2gMvd3/T2S8/
	MFfA/GNKngL5oDoYFpGPtoDfaZtgNEd3XKI7mFuEDVr3AoHNMLQ1RveVof/P4K1C
	MBTr1vFrsSX3rd8CT/nDm0Cx7/HQSUMMxBkD2xD/pggoeQbc4UdQ0At17NM7gWW9
	5m2RJOwq74SAEruoLtIqCJDADeMt6FI2XMOwC3eITawkofhDN8nltztqtxQRHftW
	foR+RMjQpLY4n/Nag8BcHwprobmGjkMqulU/Feeqm5lHY85HMukVa2nwk57pu4Nv
	QPdO5BzUJ37cd+3xC7xlgxq0B5paVicxwtHp1lLFddI5EtFgX5NYPRo3fQUlSEkf
	j0E5tQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqu1t95a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 22:09:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297b35951b7so1380405ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762985377; x=1763590177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PKqNXD1DollfLI5h1J2Xseqpi/6Yas+Ng79HmXPNvu8=;
        b=NZ18OKPhAeAK8EHfC+AYdIt2zS43K/9QIpRSHYgFiZToc+hECIDcBr3+OOvD4+RUNr
         mI7UgJHBJNZ1e2qSghf8GC08PWTxs1hpaITp9kkUZYf6X178Jg00QyYd2fK5qdM3R90A
         otZjKgD7XIXPZBTeM0PAXO28kl4MqQoxZetWXMzSKdnDUbFgK1mvAXatwphY9mZ5JAxW
         QJLgOHYqMgHsWfhg/YhsVJFoZPxuCPCprGHSjjXHK0n7knU39O/F0UkVbgL3+mJ6doYC
         j4lepXTTyTxF9TMEw/N/I1B76czk7xDZZuKuxvBLDJuZ5ySeTip1mbAK15hQqQK7dH7a
         pKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762985377; x=1763590177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKqNXD1DollfLI5h1J2Xseqpi/6Yas+Ng79HmXPNvu8=;
        b=W2D/OnijKzXuV0DvrF7X1Cgc7LzkZsQeHVYq/vuWMpG8lljpn+0ZY1ldFfbUNqYd7D
         dJR+nQI0sdXfA14xSo7pUY63FnkEURRmPRPhfr2fBWTFqgoVoHEav2SZuo6mFUicrejC
         L0zoOmv56yErxF79CbTcAMgDHmQrmE/YafSIoI9W9pM0zuxAEjjhP0PX6js5Ch+npz2K
         ZhKligZtl3MGjWGurHqctRplgKG+4viR06uqePPJ32M8/sFWilSKqy1H++zjs73XsPIP
         xdgJTOzjILVXl20CROG63xirNZs4YD0uU7ntGLqMmnixOHEuaaJ4gDR2BCM6n+EoPsN1
         8yVA==
X-Forwarded-Encrypted: i=1; AJvYcCVmoa2qMynCAWUi7oGsZFAex1aHHzNwJBuEZsDmSLncloKrCnWLxjsOrWT+G0IPJtlmFqxD7yHKobNJGSgc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfp0G9zlGleMvIzC9+M0DHOpC/IRtPfUtLit6rwjzS9dfISCMe
	1OObaVzN9eHkgcA7w34N1BIwDfgYnoiN6GEFkH7wzk3q9is+BK+L/3VBRZyMBenINeGqzXhSxKE
	mhA4rrWBmkk3LVC4ITQ5UgQaEfh/bwsfsW3DwYh+OEMDArQYrVvpKpOMW5rYRTfri6L+e
X-Gm-Gg: ASbGncsPR6klH6Qd7ga8fW5pf3SUCuVmmEIwhpPV9KDP9f/TM5bFHKsGSI1UlappAqn
	7mxATSdubg/ON3c6XH8X78lY2IA45BkJZn/D+lbWm5otrOUG66dcXyedmaxwHrtjddnnS18LbkZ
	iKPLZkICp0NQg9ZMcdiOFuAwjt2RNIApAYI6ZYrs4bxgcDzRrpFMGdP9nwmcbICkkNBf+EcKTK9
	59TISkZk+kSyEkAwz4TqCGa1UavpREVbmf+Cm6YTlYaYiqULHMLPpZJR1sfDyjK2yN474El9lso
	3MhZVC1kOIz1rUYGdhBiM19oRdfFPspReDN4HTXkuVJP6kRbWxlO//DBaHxC79fbFkZBFaVbWU7
	H1dFbLeiuHhGTjt+AenxIbg==
X-Received: by 2002:a17:903:1b6b:b0:295:4d97:84dd with SMTP id d9443c01a7336-2984edd59fdmr58284415ad.51.1762985377570;
        Wed, 12 Nov 2025 14:09:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbDPQwjbxvdgWkQp34t9iHfLbIFLfFbNnosXkOr7CJTuwb5+1HxivTIaNHyQXba3NQUZhkaQ==
X-Received: by 2002:a17:903:1b6b:b0:295:4d97:84dd with SMTP id d9443c01a7336-2984edd59fdmr58284135ad.51.1762985377049;
        Wed, 12 Nov 2025 14:09:37 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0c9dsm1704455ad.67.2025.11.12.14.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 14:09:36 -0800 (PST)
Message-ID: <d4753c6b-b3cc-423b-912e-61f8b7bc3c1a@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 03:39:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/21] drm/msm/a6xx: Fix the gemnoc workaround
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-2-bef18acd5e94@oss.qualcomm.com>
 <a1273bdf-d926-48b4-877e-48d5ff45e7d9@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <a1273bdf-d926-48b4-877e-48d5ff45e7d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9OtWrwR51eHGoLgHwUC1WXG1oo8gmHLd
X-Authority-Analysis: v=2.4 cv=Hpl72kTS c=1 sm=1 tr=0 ts=691505a2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=2IP1oaZ8+KUWsYovLW0HHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vAHTylR2Z3b6qOykXHEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 9OtWrwR51eHGoLgHwUC1WXG1oo8gmHLd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE3OSBTYWx0ZWRfX3MxwTWBHdhuZ
 jNeQoTFgQJgFe5xpUs4W1LgF8YifN1A4BdZZZ0nWUD5MYGDh+t8KjvGB8PrIqG3k7xEMebYdRVW
 EKUbtoujOaPnTKVu1Snga06LHjZWMNGrHa1hdt7JtAQ5YGk3yzm3OFT3Li1Om0AA5v5gsRj0Tq1
 Ce83ejYNgiNhpPmwo/IHPT0/j46ZV0VXwoTaCbyTI2u9Ly6U+pZgwPxDZuwj+O6vheY4tOHuUth
 r0/rH3zEnQmqexrcx0eLV4GrVQZsMOkpeEGohFoUYklP8KEwuI6UKvzwr0UGauoTqYHMN6MCJZg
 IcA+jELQ796pEUZ+W7HdQ7rZQFsaxhMQGi3RADpDniuHL1z+oFKfnrQzh9uK5qIg9J0iZ25GYHX
 MJ3mgiS7qu1J84XtkPPij4bUFFhr8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120179

On 11/12/2025 3:48 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> Correct the register offset and enable this workaround for all A7x
>> and newer GPUs to match the recommendation. Also, downstream does this
>> w/a after moving the fence to allow mode. So do the same.
> 
> It does so for _notify_slumber(), but not for _pwrctl_suspend() in kgsl,
> but in my understanding, making sure the bus arbiter doesn't gate access
> first makes more sense

Yes. I didn't change the order in a6xx_gmu_force_off() (equivalent of
kgsl_pwrctl_suspend)

-Akhil

> 
>>
>> Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 4e6dc16e4a4c..605bb55de8d5 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
>>  	 * in the power down sequence not being fully executed. That in turn can
>>  	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
>>  	 */
>> -	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>> -		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
>> +	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
>> +				adreno_is_7c3(adreno_gpu)))
>> +		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
> 
> Arghhh copypasta, thanks for catching this!
> 
> Konrad


