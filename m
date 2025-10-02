Return-Path: <linux-arm-msm+bounces-75746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E2BBB22EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 02:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 151781C6C31
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 00:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49C1F513;
	Thu,  2 Oct 2025 00:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2tOQqxH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B84DF59
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 00:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759366564; cv=none; b=hXlQ0JLV5LMSI62AcMYeXWcdkx2pGQcZxtz51b5pLHEhgpQDp4eNjn+uLi/YLtkqiEd6v4PfdzEF/5nOWrNXzL57aqxltQ3OPGLtnuiUzxDR2QzMI5Y8Wg2mSpSdihwaxozmf6fKY1Tka1JoIzl2AAvmGeXodN4RgFSOriM7JIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759366564; c=relaxed/simple;
	bh=Mnra6sxDGNMUqaO+Vm3H9zPCZysENcOo0QQWNFnugoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQQgQFuEK+AeTPKfK+7hq3vv3Y7nerx10U0S+/Mb1lKF1JoJ95qhPITa/0jz7h/rttr5Q/TVaOtBGv5MpquScpWKhonMNfq52Kgv5IY22VLlYWOEylIWLZCHM4LPYJ1AE7+8r1hDYAxCzUOgXWzDr+z7fXlmptPMtDF/lFSl54Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2tOQqxH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic5Th000841
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 00:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8PzQc+BmJiwVOLFHqrykB34m
	n5pDbaOYFIBrZaxzwsU=; b=I2tOQqxHbLH3mAXAEts/d7DiOVYDuGA82QegSdLf
	vAZ4A+rYVfab/A9wCZ8Dv/yYgp7fkMtxOBmJMzEhTw+qrNjG35UVaL9oEWe6wLHT
	G2VXD8qx8L6vRfY9iz1q7/XtJvNN34W5yJUBsgpjcFX6uNVUc01lWv5SU6EhZM4H
	4NpqV4smMyCJdmLWwo0lwzTajvaonYJ4psS7gc1DXzFE+SlN9ZXGP9Y6ngM/eGME
	2fSZGnXo6BgR2I2QgBZsXkqR2I5x7Q70cxb8Wi5LgcxbUNaxwM8GdL2MdQdBd5EL
	LDGaWXTHQEO0JS8sB2jbzDP63Xin008qIii2EfXZ/v1R4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5xdt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 00:56:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de53348322so20673621cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 17:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759366560; x=1759971360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PzQc+BmJiwVOLFHqrykB34mn5pDbaOYFIBrZaxzwsU=;
        b=az/lUf314SYMCt1nbnhj2VhOf0LQ6B59oJB61dNZ0stwtPe1h2Iee8/iIIQX8QOplE
         Lb6CFzM9FgFC/TvAXT4vYbS848OOH8jv8xRweRpGkA3y3jycoKKPYGAg7KX1fd1f5VY2
         /Xpn8tulMYeKcCOxDSM02H9nswDeZaxDPs9Qsh4hE4AZFk3vpx46YnxXDhl0EEsReiMD
         vDZoWdsQDwIQnPFBxY0OH1GU63AiNexvJdXHS4eYRydok1t3jvvj6E86DBkHn7Ckkgp+
         TWyhLDpvA5Pg9EhdRiQj1KuvopPqkAVVZFQ27ivfzrDT0mCDFjMEhHEeSPLawgFbXkvn
         1rxg==
X-Forwarded-Encrypted: i=1; AJvYcCXwwWeBl9M3aUfP5Ynpp+2d7SmulSOwMJpiMMCeWnYaye4vZAreD87hug3YbCz0tiKAtFksXYVdo2PWCWmk@vger.kernel.org
X-Gm-Message-State: AOJu0YweLGIUYaSwCSp/9sj8K76MNaaRS//MsbzVWLTeCF2OoeGCrQod
	DHiKktfS0Vcr86KVDxV+zqYHy/sSUvK3eY2leVoX/1uxopWHTJBXAVQBJCQakgDVDy2lGDYt96Z
	cmM0aN8PJt/zJbajPjy1efsHgbRWDyb8wHZSt3+he6iSj8AkZvVWTpY9ceAYhNzLllkx8
X-Gm-Gg: ASbGncsD5GhlSDkUXgKo2BNHfyjCaKPygy1OebsQaX8pMquke6OQING+wFm8pGvsG6M
	9J7EmNkYc0rhE1kW8iLJlTbW3IY3DV8VwEQAJwMTWNVQDAS50ZyFaghugj9GQdAbRcbGpx4yzLQ
	b3dLY5x1GaGcQm04CFZLDCdD/C5krkslqmz2ZxKB1l8bwd1CnYwk1OIAYMJrUIswhjj9FT2gZkL
	CjIqPBMc8+hxjw6de6/ap6BGofpaBKwlc+82T55V/BfVm/Dca4nokx4/t9AcYO/6GzJ2yypB9i3
	1d+SHFsO/G7bgH+dXIwR5x5rowOyV2Gy/2j8jPpsTpwGVcsyzXdQcr8a6tlkusQpiF/FAcSE872
	tho0lO84vKsnbc26m1qHdcsxedS0mSy/yoZ3VM4QN+skJIwymg3OfH6h4rQ==
X-Received: by 2002:a05:622a:5518:b0:4dc:4828:b7a6 with SMTP id d75a77b69052e-4e41e5416famr78963241cf.59.1759366559952;
        Wed, 01 Oct 2025 17:55:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtplyOrthJ4uP+eWCWIt60T2cvFyskp9IejhadjkX5IEu1X/U3y4cM2LWQ0k7UzPqTkzQ8qg==
X-Received: by 2002:a05:622a:5518:b0:4dc:4828:b7a6 with SMTP id d75a77b69052e-4e41e5416famr78962981cf.59.1759366559465;
        Wed, 01 Oct 2025 17:55:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba4a6015sm2742211fa.45.2025.10.01.17.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 17:55:57 -0700 (PDT)
Date: Thu, 2 Oct 2025 03:55:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/10] dt-bindings: phy:
 qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Message-ID: <tblxljq2wmbbb3cpzv3xd7koc6j224ts3kd5mhx7hgpatenond@dqu3gunfocu2>
References: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
 <20251001220534.3166401-2-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001220534.3166401-2-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-GUID: AgHyJcGZh7t5uAAWb92gn7yARPccjnBU
X-Proofpoint-ORIG-GUID: AgHyJcGZh7t5uAAWb92gn7yARPccjnBU
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68ddcda0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=poLWbaA-Eiv7kSeqQ60A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX1B+W0tmo8z+Y
 M6vn6GM0u1/4KJaNxIEcPz5Ga9BS3Q2dKOSzwV6pJnojNpmvWGFCYNHGXSS/b0PtbVTvf6TUn/b
 yrZjzIvTZibBK5ScRAvMvqXmEb2R7xugLyDwiNujOQh1wG0A1CEYIDrKz1/jbDaQII3IS5hnlEn
 O9weh6MAfxEF1uxKwHMZsM0kwICT8Yif6n5RKjk3bxa/SiR2l/dIcrhNNmt7YNa2wXJqMN/R/fe
 hqMDwuTeIaICeZKjWzz/wB0Cx2lh88a3bTThVO2o88spEYUp7wJJkC8sb1wB4MmpxktfWkxsXB4
 gLhfr+OQNTBf7mIYOvbWA+MwmRUc7Yt92ZTtZQH02zJMFeT4H5n+wEFE78vthNGHtznxFNGZwXc
 KaofgM5q5kWISO/2v7TUuSYj76aL5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On Wed, Oct 01, 2025 at 03:05:25PM -0700, Wesley Cheng wrote:
> Define a Glymur compatible string for the QMP PHY combo driver, along with
> resource requirements.  This adds a new requirement for a clkref clock-name
> for each QMP PHY.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 76 +++++++++++++++----
>  1 file changed, 63 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> index c8bc512df08b..377d830f0855 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> @@ -16,6 +16,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,glymur-qmp-usb3-dp-phy
>        - qcom,sar2130p-qmp-usb3-dp-phy
>        - qcom,sc7180-qmp-usb3-dp-phy
>        - qcom,sc7280-qmp-usb3-dp-phy
> @@ -41,12 +42,7 @@ properties:
>  
>    clock-names:
>      minItems: 4
> -    items:
> -      - const: aux
> -      - const: ref
> -      - const: com_aux
> -      - const: usb3_pipe
> -      - const: cfg_ahb
> +    maxItems: 5
>  
>    power-domains:
>      maxItems: 1
> @@ -63,6 +59,8 @@ properties:
>  
>    vdda-pll-supply: true
>  
> +  refgen-supply: true
> +
>    "#clock-cells":
>      const: 1
>      description:
> @@ -105,6 +103,22 @@ required:
>  
>  allOf:
>    - $ref: /schemas/usb/usb-switch.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,glymur-qmp-usb3-dp-phy
> +    then:
> +      properties:

Missing constraint for clocks.

> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: com_aux
> +            - const: usb3_pipe
> +            - const: clkref
> +
>    - if:
>        properties:
>          compatible:
> @@ -113,21 +127,45 @@ allOf:
>              - qcom,sdm845-qmp-usb3-dp-phy
>      then:
>        properties:
> -        clocks:
> -          maxItems: 5

No, you can't remove this. clock-names doens't provide constraints (or
description) of the clocks property.

>          clock-names:
> -          maxItems: 5
> -    else:
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: com_aux
> +            - const: usb3_pipe
> +            - const: cfg_ahb
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sar2130p-qmp-usb3-dp-phy
> +            - qcom,sc7280-qmp-usb3-dp-phy
> +            - qcom,sc8180x-qmp-usb3-dp-phy
> +            - qcom,sc8280xp-qmp-usb43dp-phy
> +            - qcom,sm6350-qmp-usb3-dp-phy
> +            - qcom,sm8150-qmp-usb3-dp-phy
> +            - qcom,sm8250-qmp-usb3-dp-phy
> +            - qcom,sm8350-qmp-usb3-dp-phy
> +            - qcom,sm8450-qmp-usb3-dp-phy
> +            - qcom,sm8550-qmp-usb3-dp-phy
> +            - qcom,sm8650-qmp-usb3-dp-phy
> +            - qcom,sm8750-qmp-usb3-dp-phy
> +            - qcom,x1e80100-qmp-usb3-dp-phy
> +    then:
>        properties:
> -        clocks:
> -          maxItems: 4

Same here.

>          clock-names:
> -          maxItems: 4
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: com_aux
> +            - const: usb3_pipe
>  
>    - if:
>        properties:
>          compatible:
>            enum:
> +            - qcom,glymur-qmp-usb3-dp-phy
>              - qcom,sar2130p-qmp-usb3-dp-phy
>              - qcom,sc8280xp-qmp-usb43dp-phy
>              - qcom,sm6350-qmp-usb3-dp-phy
> @@ -142,6 +180,18 @@ allOf:
>        properties:
>          power-domains: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,glymur-qmp-usb3-dp-phy
> +    then:
> +      required:
> +        - refgen-supply
> +    else:
> +      properties:
> +        refgen-supply: false
> +
>  additionalProperties: false
>  
>  examples:
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

