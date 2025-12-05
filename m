Return-Path: <linux-arm-msm+bounces-84480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D0DCA7C59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C931B3250E4F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B463385A0;
	Fri,  5 Dec 2025 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vx13eF+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXMZjkN5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8984232FA16
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 13:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764941262; cv=none; b=MkoqP/SQXPB4Ww85bvemN/faxn1Fo9AktvYqbch8E9dYvfswbz/0zNxdjox2bmYpRw27J6GyW5yESTnlz4s5PUUVDaYyzD3rh1rXF4mC+nY5kk9uHJqeoU/3zvObM9rMCUM/pcnEjuYogYfQX/J/Qa2qasNmGOoFtbYS26QyWtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764941262; c=relaxed/simple;
	bh=jVThZqtcyTXWu1N/qKfczl99tuecBZusvkeG3oOjl1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qejziRdj8aDyNaXRqWZFr7xARdUO5Mkz56lpWyJ9o4a4eJY/8T+KLILtQzEkJZoZe8ErTbHBrOjqk9xLMB3WsLj2JEyaYgbgzaELEsfOE1ofY1qz3wV/8IhdkqFWOoYdOW5Gvkd3Z36oD8aVtj2dnbfaRag6X3JknN1ilcQafxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vx13eF+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXMZjkN5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5AnZen3135920
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 13:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hCQDwAEGjTsUJbQElMMhlWhifDFPm1MUSTsyf5S3D8Y=; b=Vx13eF+Cciy0i13X
	OgxTjqqHG3sDxlpUizXl1yvksjZvVWo9Ii+tTAQvk/6+qjxMizZeY8AcM8H3VeLE
	sZ6c5U79WkSiTVel1tnV1kKGXazPvbQCh/XYIez9nVnsDbZsWZJhipkfz/E77w9q
	jHe6NOXprxiny/ZzmYxeZbF8eWBf8/C7Y/F5hLHXKIGa3wZiCgedlBmxtfwKjyrF
	mPPJtNVsNo6ba1Zgz4xRgwbPTy1D0LbfDnORsMUDLCqgm+9vt+mFEWuKV7GShdYb
	xZ3JidG/pqmRDhFr7I6DSHpUqrUIt6RWtQaPCF4b5wbE1GfIrRZhaJMxemvgNYNo
	LkYsPg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aupa8sqy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 13:27:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88046bc20faso5937386d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 05:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764941256; x=1765546056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCQDwAEGjTsUJbQElMMhlWhifDFPm1MUSTsyf5S3D8Y=;
        b=EXMZjkN5iZquYdsoRlvRo0kAMx7D0Pj9I47FOV7kv+aQJhpT0aRxkLZvzmNiw1+ZI5
         eXYKCkK2dKmsu9I7aqWjWp/wnbHPyW2Azd0Hd2Pa/uf1aPA/O2YZrVQ4U/vlZHIzStL6
         /WksOOPfnDRXx8CtdRySlu8thKTSd/che4DeQBz0wx2enm9GAEHpy/Y4sVGBHNEKQeGB
         92AItEB/6GJfhJks03CFVs3FV/QH+OugN4S2It8CWFEiZdRrkARRJX+w6/OlyeIinOjF
         qOpgFgFLtmwpi7nMi0+pyCmLqIvLmC4U8kyL+mrAZawwano+Tyhxt0gv/BJ1hPL9mhT+
         k6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764941256; x=1765546056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCQDwAEGjTsUJbQElMMhlWhifDFPm1MUSTsyf5S3D8Y=;
        b=h8IWoOEk9qpTmQD3iNVsc2SvR9AX72fv/io+D187aLVOkXCNcEKPTM1DwHD9Bc0J9P
         ENhHqWT2M4W3bnDChf2bPuhqcfArBZkurp/xc8wKmJH8LfAzBsSH9etDEjX9GCUkPEUt
         KmlQJKUgQVleOFIyk/W94/lQI0r0j0itAb4CE6oV4yBq0LnkZ50mmDjwhFV+KXeyJe2N
         msgtNRssftbnZUVyu0IfU/bO4PfkbfezvAO+gPEvRNyvcOy2lDBRpKtPIENV+ANvfmKW
         anOEZTqmX3MzmvqKvZZ9hGUb2fH51+cyKCXttXuVjg49dUij41zx9/k0c40m0fLri4Kx
         gzvw==
X-Gm-Message-State: AOJu0YxmG8/ete6wm6sKupD4dBeyT/ecLIkJlDckBxAEW1R3+4k2yc/p
	xo1HQcpiI/epHitCmyK533jOon/HZnC6mQhjxeh0Ie/HnN44FQiVorUaanCGbri8vmdXRbCbZcQ
	I0WbksarSL3fDAK/MS7mLZiGusivIEz8CBKe7aaw2uOy9AC9rZ6pbUrz0qJ8Dprk/JNtkOudcMK
	TW
X-Gm-Gg: ASbGnct3+idrQuVTZy86JSznD3PjeIP5RrTMZH5+sFUja+hc1tqlKxjEVzovRope9OR
	kW63J+XWMS4uc0x4l3BsDQ2BdwDoxGf1zsSQocB9vucjvXtn0QGKoegJmjJH8pSjwOq7/rhYB3K
	URdh/Ydk/agr+rI+08vBgi8f7m555UlpGLJQsCsgk7mWhlIOFUOgvFS2k3zY/k+HoaYzhQMgXcl
	db//fxbsyirfxnIcPzbmmbIJ8LjniW8K5XTjsKmHuG5ri7EzxWr1mA44MZY58PiVX6Od64JzPhC
	1EcxS9OMXZb2C8CRQE+dxXvlounBsrvKmMyzVG2yU3NB/bsecAjl3javhNMhyIsl4KlApT+C8iI
	mHl5EaT8Holjmx1voO5k6/IlD/uuCRqRy20EiY56y+HUBub4V4scZm9IHVFZli3Pa+g==
X-Received: by 2002:a05:620a:3708:b0:8b1:c1d3:8e7f with SMTP id af79cd13be357-8b5f8c0e8fbmr954702285a.4.1764941256136;
        Fri, 05 Dec 2025 05:27:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGI9mo5BIwftqdjJVfsHeIFBWOngs5z5y9sX8W9ISgUAEJ2cJJxx/cWbPUZJjc8uaGbKmV5wg==
X-Received: by 2002:a05:620a:3708:b0:8b1:c1d3:8e7f with SMTP id af79cd13be357-8b5f8c0e8fbmr954698085a.4.1764941255522;
        Fri, 05 Dec 2025 05:27:35 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b41219b6sm3839981a12.25.2025.12.05.05.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:27:34 -0800 (PST)
Message-ID: <2bd146fc-06a7-4f62-b542-fe24cb9150fe@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 14:27:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 SLPI
To: longnoserob@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        david@ixit.cz
References: <20251205-slpi-v2-0-dfe0b106cf1a@gmail.com>
 <20251205-slpi-v2-1-dfe0b106cf1a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251205-slpi-v2-1-dfe0b106cf1a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=6932ddc8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=RWXG68yAir6K0NoWbU4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5NiBTYWx0ZWRfX28SRe1rR7moD
 o3dIr/30Yqf8Iwsa6OcC5Ck05lWDz8RInmQ8gz3QHwxGjIVfUQ4tkuJERyZw5fz1vNt/vm5zctw
 B0YjsAgYkiQddvn5SBs2gaMC+3x1xue1p2fmvc3YH5sjP2tB6HOP+9SNBLbGhVr0UhjaebhQBtl
 ietvcyeEVnhuqHIe3mhiXEmOMUK4aiI2SiidOPqw8iwuNBIyXgcplQA8f8EEasELuChNAXIPCpH
 qgO6w3+mwyxVsTATYWbPRj4tYIeM/Z9NV6C82N8Q1smrIns+MQcaiMZK+nZKgKwrf7bdBUGguy5
 A2U6czHp33PbKi+Jd8uBy6B2WuvLYH0+iRuKydccxccqZfZohMsdxyHUM9Jpb4x01cLh6kqtpeQ
 lonitr6K5CauouW5d4zINxI7zDodNA==
X-Proofpoint-ORIG-GUID: QblIg0IQ9Rs9ITQRN00tI38NLLPqGY_Q
X-Proofpoint-GUID: QblIg0IQ9Rs9ITQRN00tI38NLLPqGY_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050096

On 12/5/25 2:00 PM, Robert Eckelmann via B4 Relay wrote:
> From: Robert Eckelmann <longnoserob@gmail.com>
> 
> Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.
> 
> Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 785006a15e97..cadddcf63ef6 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -425,6 +425,12 @@ &sdhc_2 {
>  	cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
>  };
>  
> +&slpi_pas {
> +	firmware-name = "qcom/sdm845/Xiaomi/beryllium/slpi.mbn";
> +
> +	status = "okay";
> +};
> +
>  &sound {
>  	compatible = "qcom,db845c-sndcard", "qcom,sdm845-sndcard";
>  	pinctrl-0 = <&quat_mi2s_active
> @@ -637,3 +643,4 @@ &wifi {
>  	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
>  	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
>  };
> +
> 

Stray hunk?

Konrad

