Return-Path: <linux-arm-msm+bounces-87983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7AAD0105D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 05:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9581C301E19D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 04:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2302C326C;
	Thu,  8 Jan 2026 04:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ls44GIRT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="diNSPQoz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0982C2372
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 04:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767848317; cv=none; b=c10mg7A9KJucrw8EyfC7kbRARl189oWV00duN4hUaVpWWNi2CGQHZf6F/yv2E/sr8N5ekoGllxecPSFB3Z/oYdtigNy9089Qitb9KG8AWtgh3SJkRCU7+zamlPJhZkohxlu8j5E9CUf+y5LnwM219/AvBWmoI2hTYEPcBUtieB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767848317; c=relaxed/simple;
	bh=5/8v1qa7MDZIB7Kys1KfUbhrpgKuhP4L2dEhcrc+Qps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvO9qUyj4V15hlTF7Lo8avLYDicRv9HTg6TYg+e6nqiB/l/798xI0nxUZ3rXDanb3Qp9r/5J3k+7SDRodZBlCoIUiklo39blQwV3CP4w1ldyNhcgZzgOxxqKqg2fny7MEHm0f2nSfEdiYawU5A2ujEkMiQTS6TnZoMoZKOZOvJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ls44GIRT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=diNSPQoz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60846A1h2779181
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 04:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1oZWKL8WFE/TBScZ84iQCle13ucFqibIGaIK9CHjIWk=; b=Ls44GIRTBwJnmZ2l
	cCVNybIBFEwBR0OmoKChQLF0+FpGPVL6Cd37IN/Sacaz1E17g56Jf4bvsL8ka0AI
	FiV0Iar6JsFLKLlkzztFtZ4MeK7/dVd1qYnuDlA0sFii1ni7yszKQpnzz17DaN86
	Oyj59An+Qx2HqOjTc1893NFKU6+A40TWi+y6SemQXt4+pU3TmSW5YRR9l4gtVUR+
	U/U5s2e8Rj4vxGAP5S8+cU35ut+TqzrQsuguPMos8cEr6gL/6zHWv6LJXUlZQWU7
	993LR8mffu09QuKiCdaAna1hXwcFgt2c23Ho2axVRbQZ/EdGmSB+GPKvN3Z8WKBQ
	FHUkKw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj58ug43d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 04:58:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34aa1d06456so4306269a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 20:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767848315; x=1768453115; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1oZWKL8WFE/TBScZ84iQCle13ucFqibIGaIK9CHjIWk=;
        b=diNSPQozxkOo9NbpPwJiIWPg1Y6scULfJiA7Eq4KimuMxcJixkwxIMevkzaxr+sxs5
         sR8w/5pWyMQG2Rqlu+zsh+cAGXRAqpCnMW/t7qsrItNCFvnLx6QGhSOzSE+Gm6Qag+ae
         TNKg26lhlNgQm8woWmPQi2/GXTfczBy91kmn3QI2o12eF9VadBIyDIEQdMzX08VgYZFS
         Z4yAVWVuc9PxeGR+764kmr+bnFlOTYftZ/qXJL67IwF0cAofnJdu8W7W82lauykyOMef
         5GJIMsPXtjgsE+7gl0rD6L4ZdcSWui20kG4Q7TFu0a1EZ1VWuLjn5RPGPXv4TplLaZqe
         doyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767848315; x=1768453115;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1oZWKL8WFE/TBScZ84iQCle13ucFqibIGaIK9CHjIWk=;
        b=h4B2HQdiRJqarG/rg6HDRHnYP0tPUzFdzvw+f6wZGA7fsYtTbAvk9by0Ye7Kc2HVPC
         8ir4pSFGriVqySHHYtnInbfz3gNeajaPJFVshLefErHK2K0k7X1duXdcNFyU6ST290FZ
         5Gv7mChnWaOY/Z43p8k75i2CQSuKvjJKJeu6ZvuEuHeclFei4AxxsYrAlLiBgvQkzT+H
         qI9GUGkR6NfxItqL3aifohlVlLihcIa+l2B9zAKckg39mwKX5RONibgMD86JWz3r7CbS
         3GWQi9/FJmV10rKlHK598eJM1S0rcc/PRpH9XtLFyZXytoK5V5RcW5ds9MF0IYrj3aTA
         TdrA==
X-Forwarded-Encrypted: i=1; AJvYcCVJFnf0U6OH75UKlFMscP0QDdhDeEWm56uFOmaXZvBPY1bRqJp4cjG07g0KCLR3r1bVmgiR4m3I+safpiOI@vger.kernel.org
X-Gm-Message-State: AOJu0YwVjKACOPam4ft0BGjHehFQ8108yhhJo6JxlIyzr8MixulPD+U8
	Y/n+/33xAb5kL/XIOU+C45OV1C+i2VhLDlORAssJcTslMZn21ZjtRQs0J8fneBIH+eELxGbQL5l
	FTUwPKeZui6x/Pp4wqn3KX4ENpHDRkM53UYAUMaTt3Y5vBp/NLeexwkw31Ff45E1xukuM
X-Gm-Gg: AY/fxX6Dniau6EDSEoxBQagXeRfaVdajZssOxa7cfQDbRDJZ8do/820Z6m8j9MvF0RO
	/+81+TqFo8/ayffwaxXLNveScKpcpHMo1HdAbqlqyT/VazZuLtuLV6HwyLwDtupLloWMotdsXNI
	TerhDaNyWwKzJNCt84iBPKW9km6MBcrZXRy/D5trLi/PzxCLTLpkEn/7/Mw0pLDHEEnt9oO7Dnp
	WzQQuHIMoVW90JlXyr0xNfvY1SHgyxC7NA9hqLK9rkO0WZkcmlqOCROCA9pt3ZBSDA1SIkQ98BU
	WWduaTYv8/tXxwzMg+kloi/fh0XzFkniP9a3+qkHpmpZZBPRCT7zWfqtTV0UpKLUlKlKipPatFX
	7aU99OojXIwnWmnXCiTwRRw==
X-Received: by 2002:a05:6a20:3ca8:b0:343:af1:9a57 with SMTP id adf61e73a8af0-3898f9dd1d5mr3728908637.56.1767848314630;
        Wed, 07 Jan 2026 20:58:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFN6TScipKb3lPetOYRKbU8aWMIDLVoyDaluyKREQZEFcX+18m2Z804vQAWuMfyQ/M0fOsdmg==
X-Received: by 2002:a05:6a20:3ca8:b0:343:af1:9a57 with SMTP id adf61e73a8af0-3898f9dd1d5mr3728874637.56.1767848314031;
        Wed, 07 Jan 2026 20:58:34 -0800 (PST)
Received: from work ([120.60.56.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b7a5a69sm1638678a91.1.2026.01.07.20.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 20:58:33 -0800 (PST)
Date: Thu, 8 Jan 2026 10:28:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V4 2/4] dt-bindings: ufs: qcom,sc7180-ufshc: Add UFSHC
 compatible for x1e80100
Message-ID: <tg2eahc5pf2pqvavihtptbxn6hqftdd6euhhap3v4kkffzgasb@fyq5mxlsu5py>
References: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
 <20260106154207.1871487-3-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260106154207.1871487-3-pradeep.pragallapati@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAyOSBTYWx0ZWRfXzJZqURGJSnGz
 X7CRtNLCLHwoe1Snmdtc1d2dREJ9g0szU2Si/A2FQzHueNr7r6tt0JT2rxmuLsApLn+mw509qAH
 NhRNgQG9z4vJY71orR0PK+g20fr6syN6DUcBGyRlGMU510knCbZ18+uReuQlOcPhNtiDLnbVb6P
 HD++Cj4MtE+IfokZOyUscrATuuiJVEUwl+UvW9TQYaK6fTL9lo6z/5Ld3N9MLtekmApmI5tZbJz
 AhT/vxBum76il2UkJjfgHdAdbU/euWHlvm1liD6cyvgyzwqoJKakCziUJb2jCSbMbgja2ZiLinc
 RtK8uCE/SEjTjLtwlC3KXvTJpV43z5ViST2TgdDpouTCEpg7Iy3i4wDMsh5TTx8+RZCGYYEIGb5
 le61ssRnE9n+aZDUmtWJE6G2QwlUBR/bX215buPmBlCqOUmx7y/gSm10G6lkcqxvWPT17fX8T8A
 6gLT1lh+nJlztjgKo0A==
X-Proofpoint-GUID: n4_nng9SG-_eXBdbSVvhT9j8XRZHOZBy
X-Proofpoint-ORIG-GUID: n4_nng9SG-_eXBdbSVvhT9j8XRZHOZBy
X-Authority-Analysis: v=2.4 cv=CMgnnBrD c=1 sm=1 tr=0 ts=695f397b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=RufU61fwOX414azV3ffNTg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=drqrqwM6pU4QfT7bHcMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080029

On Tue, Jan 06, 2026 at 09:12:05PM +0530, Pradeep P V K wrote:
> Add UFS Host Controller (UFSHC) compatible for x1e80100 SoC. Use
> SM8550 as a fallback since x1e80100 is fully compatible with it.
> 
> Qualcomm UFSHC is no longer compatible with JEDEC UFS-2.0 binding.
> Avoid using the "jedec,ufs-2.0" string in the compatible property.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  .../bindings/ufs/qcom,sc7180-ufshc.yaml       | 36 +++++++++++--------
>  1 file changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> index d94ef4e6b85a..fe18e41ebac7 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> @@ -31,21 +31,27 @@ select:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - qcom,msm8998-ufshc
> -          - qcom,qcs8300-ufshc
> -          - qcom,sa8775p-ufshc
> -          - qcom,sc7180-ufshc
> -          - qcom,sc7280-ufshc
> -          - qcom,sc8180x-ufshc
> -          - qcom,sc8280xp-ufshc
> -          - qcom,sm8250-ufshc
> -          - qcom,sm8350-ufshc
> -          - qcom,sm8450-ufshc
> -          - qcom,sm8550-ufshc
> -      - const: qcom,ufshc
> -      - const: jedec,ufs-2.0
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,x1e80100-ufshc
> +          - const: qcom,sm8550-ufshc
> +          - const: qcom,ufshc
> +      - items:
> +          - enum:
> +              - qcom,msm8998-ufshc
> +              - qcom,qcs8300-ufshc
> +              - qcom,sa8775p-ufshc
> +              - qcom,sc7180-ufshc
> +              - qcom,sc7280-ufshc
> +              - qcom,sc8180x-ufshc
> +              - qcom,sc8280xp-ufshc
> +              - qcom,sm8250-ufshc
> +              - qcom,sm8350-ufshc
> +              - qcom,sm8450-ufshc
> +              - qcom,sm8550-ufshc
> +          - const: qcom,ufshc
> +          - const: jedec,ufs-2.0
>  
>    reg:
>      maxItems: 1
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

