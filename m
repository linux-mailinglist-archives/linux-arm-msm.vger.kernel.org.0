Return-Path: <linux-arm-msm+bounces-56810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9E5AA96D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 17:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D35C3A4088
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 15:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BE125D528;
	Mon,  5 May 2025 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJZJdjQT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B7D25D1EE
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746457287; cv=none; b=NDXPuc4QR+gTR9FjWeZyJO1GG2SoubKjyVHQYWCCBZ2NOUEDvoZihlnIuZRdI2tuzPyEy409YNjQPOzWeePGGfw6z+2LQ00p/REV1CN1fWMV3A3QiE0xJsRvUxIv5LLXHVwN4dUzxrmn8H3qLMHoIx+gm7kkcGZCE/qm6zrRP0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746457287; c=relaxed/simple;
	bh=sTFrqUoMPE+d50wwTLkKW0DzluLk78DIDqO7e8ImJek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3UX9AhEuRMbpe7sCBnNGAJGZKf3LBVaqxNZFXcmmz/B2I5pKrokqpbRVLOQrwOcJWPzbGKlVAHEJHDYaJ1hG4w8p6mnNMv8bsGmbSpVo3hd/tsiPe1hNvBBGCtc9MjumrCA1SKFDRprYvqi0QbT4dIWBOId9sDxVhcdtFHmZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJZJdjQT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545DBLrp010355
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 15:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ajIwN9ybFynnOoUBfqw560tK
	D3pLVfHj6Y3hXWa2aUA=; b=lJZJdjQT+SGbsmSHoVruH15IgghckrcmGxAU5AGx
	YvsS+TbzRMNfC26GffQYr4lBRj/6zBlGZAXvjtaeWVogMI1XclocAIR7MtGzgfni
	5PloLC8gH4kQnVEPkn/D028O/PfvRIMLp2z/utOYhOZXLQpdkRDJyIP6ThpiZ+HE
	gZDekTShyXdJK4JTMTfFZ3qEWJTq/U94VICWKpRLPm+hwgJEOOOb6Qmh2hssIPxB
	Xp89nV0ROUut3A9JYQ+H3vbo9a6+tp64ElUTTemxnycaS2CEjlE9Ctj87q72bojV
	9y8cIG9BXTMVXxpEyISgyEj0NguSwl20L27V9KdVpE4txQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55ve0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 15:01:19 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7300b3f221bso3778621a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 08:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746457278; x=1747062078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajIwN9ybFynnOoUBfqw560tKD3pLVfHj6Y3hXWa2aUA=;
        b=m/rti1dxpnmf7S3gwB151B3HDUc650TDqPeUiTSq/4W/if0X/Mhr/n9n5C00j2KL5N
         yz7Jk0gVirbdzFpffQVZKTuzufBoSGr0vPMFMj/TyT2PYAmYwvhFq2Hk3dQcSoRtORwg
         fL82atwCUjzH0vvXlGPX6MH3UXkl0T0zit5MLOUrcXu6dFicAHJwfp8N7ln3IPNLNyyA
         MNKr6qybMwx3zTLq+Wfr10DyNuA4TpO05SMm9VCpcKNfG4E59AXWmMbJLbZ4aZQRHr9a
         cRVXvpOiurbQwO/bx5ihUaoDOxeZVfvJfOeeKzI1Px9CvMWqRC0h6z24kE6lPKGoVUNR
         krVw==
X-Gm-Message-State: AOJu0YzCvjJHAPwMv/8dMmalw/Mly+NKUzekxVC7sA/tXAzem35k9lqc
	kjekvrlDT5keboIhWKfSq0AkxK2GnKA1BeUGaslLBYJs0wPpRQSpSM0CDSQdaUv7LOZVaYFB6jI
	+bDP1xsmB9HQV9cV41RicBtCwNH2zceIXTViHxONCNWDvmfPVLO+YrGZRJxiIia2w
X-Gm-Gg: ASbGnct3APJw72oWk+6Y93pQQIW4eyZH8nNRYwBLJaMD+q3VCtB8UIqpardiNJoRGO2
	nDmWUE216ycmhNmXbpweG3UiulGLv9z4isZfLUs9lVqt8ZvTLjWZe/9VAkuFaSaXqpfvs9rXm1i
	+yTyUZIjZidM3Mlh1SYfKtqBEmvz+iMFE5XGOkiWr4JEXTi12ExAIJpeld/0JR1g2VEffUO7+FR
	lkZgg20vo5+wRtd3tKAsIcN4QjNcFELcjUDM8Q+fafGrcuZOk72A6XGE8qtUoEppZXg8zSgGJJo
	C/w1UtluTETfIgc2Ath+k/2kjmtkznJ/5C7cMXdY/FeQjj2Q1sKrk7taU7U+FO9xawUseYLWToo
	=
X-Received: by 2002:a05:6830:6b04:b0:731:cb3d:67db with SMTP id 46e09a7af769-731e560184fmr6735254a34.16.1746457278361;
        Mon, 05 May 2025 08:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl5sM6QT1am070BqEbNtN/0tNEpvKAt2e2B2h/I/PNOETxxTlIHhgZfMD5SpwtZsT4oyPj5g==
X-Received: by 2002:a05:6830:6b04:b0:731:cb3d:67db with SMTP id 46e09a7af769-731e560184fmr6735162a34.16.1746457277726;
        Mon, 05 May 2025 08:01:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94befe3sm1749608e87.53.2025.05.05.08.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:01:16 -0700 (PDT)
Date: Mon, 5 May 2025 18:01:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS
 compatible
Message-ID: <liflz2mkkc7jiwtiynim2g2oxewdckbxo7y3m7tevbncqizfjf@ethwzfe3ft5b>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
 <20250418-sar2130p-display-v5-9-442c905cb3a4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-sar2130p-display-v5-9-442c905cb3a4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE0NCBTYWx0ZWRfX6c4nJiey8afA
 xVUoPZK+WPLIVJSuahDNW72dV2B0tJ+3pDCs3My84ugN5cIk6tnHtaboBezjLNJJ3U18I2qWD2p
 GOlFdB3Py1DAjuJN52FeDWmlCWA9YK3eiAzYC1xFiTcovV85Lcy+uyXF8lWW7uIzhqQFuQP/FKK
 6hesq+JjIT7fVF3aVsEj2E4qCXJavSDN7Vuxn6gtQytg9XyO8X184KpyC/S7PjO1/V4Di3LlK37
 TvSfViI2sgPydcZvVMM3dUkSB+RE44utar23Otsss+0KjoIJXiToIXJEyp8UxCn3stDN6K5PewP
 EQp54g2L57yNOrmXHPMxb1RmkuAqaS4sXjuyv/Nm1AOmizBE71T4U25cHUk0iKmDZlTEGuAuUE1
 GIi9Q69ShMoSWWytP7VJ2x3maDFLcq6S4EDezzx8P4AoedI8CODGhTkv3mjV69aBI52Vvnff
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=6818d2bf cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bEtjVc3RIV5_29FDWJ8A:9
 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QzpF8hGqr7msIFXSt0-ngk0esz1GJ39M
X-Proofpoint-ORIG-GUID: QzpF8hGqr7msIFXSt0-ngk0esz1GJ39M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050144

On Fri, Apr 18, 2025 at 10:50:04AM +0300, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add the SAR2130P compatible to clients compatible list, the device
> require identity domain.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)

Will, Robin, with the rest of the patches being now a part of msm-next,
could you please pick this one too?

> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ecc4a1bc9477b766f317a58ef8b5dbcfe448afa9 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -356,6 +356,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,mdp4" },
>  	{ .compatible = "qcom,mdss" },
>  	{ .compatible = "qcom,qcm2290-mdss" },
> +	{ .compatible = "qcom,sar2130p-mdss" },
>  	{ .compatible = "qcom,sc7180-mdss" },
>  	{ .compatible = "qcom,sc7180-mss-pil" },
>  	{ .compatible = "qcom,sc7280-mdss" },
> 
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

