Return-Path: <linux-arm-msm+bounces-80324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0732BC31851
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 15:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96B331895688
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 14:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0675832D7F4;
	Tue,  4 Nov 2025 14:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJUOWZ3X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwxD78op"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F0232E745
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266484; cv=none; b=ZpXPZosHG3NYXXmN9Mu6ZMR4+tGFLcS2MLhGs+PoNGY98sUm+5st1bZHFFv+X5DokHwSzwfBNRup4VATj13BoP6a1I40jbVvesZ/oRgV8KwOzd/2d9rgZ8lVb30zd6A5i3l82jcIoM0jWHChRrql6Z8vr4bpg5kYH6ZjC7icBmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266484; c=relaxed/simple;
	bh=FlnDwNrJFJmqPBwkTdjJOC5TZs/1XiJe4Y8W0n/8/Bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VloTMIXg/DLDvFsCkWbK4nn/FO+mDiO2ttsw40MfBQWEjKKfKWzBoycO+XvG4vzXakVM5R2seCcJlsxKXkpEUA78uXw5sgbjpohzwxNknFEEdT2b//GYWK52UWuyhCoiADMYS+TIt+pllBhKjHotWJTTVamJhpjMKR+vJNUWkAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJUOWZ3X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwxD78op; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4CfjcY1974131
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 14:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6vMooj6nQEjhpvsQbqOx+QSNSWMlut6t0Tcg77EZzlM=; b=HJUOWZ3XZK7vGT5H
	C4nJ5B3RjqZhrfAZ4xDMHZoLUy8GZDjM8aBPWxSy/9xdnm3fMQkn+R5i5qX8qIGD
	fmjCn80SvSOFtiwcD2OnMoL5SAs1CO6tcJm1S9ckEozoPKg2PQ2lAk3qCx7T4aD7
	Abh1MC4dquOmkRfDmib7Z2bT4+ZbDAj7/K+XzReEB/K8iy2CYm3C9RZfVrQQ7B0A
	ANz+dbTgoQopiN0QUvUn9Qa/5FoOISTEueyYgPu58nPA5sMNnwQcfiSHXfdV/M3V
	G9IJm+xQ0FFxARZmo/0G5nNcIDHDcVOKjUqAlUuQZRSsJ6Y5+/hDAtZmNwL/ig7j
	GaJA/w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7heaga7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 14:28:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8934ae68aso23690741cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762266481; x=1762871281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6vMooj6nQEjhpvsQbqOx+QSNSWMlut6t0Tcg77EZzlM=;
        b=SwxD78op8asA1uEdGgrMqYo2OMt+O/BxOWyLUpA+XPGj4glrCX9mOm/9AgV42SH4VF
         2jIwxcp9OG6FdBq3d4znVoXVwZOQUDTpVvCHEoRD+54oykXiB/G25jN9QoaqjfPtdBWv
         WKpDLCjJ9cR6BmPIB9cg6yJZ4SPDdY4meAxI4OFUgNzKgkTbTu2lIY61NFdUASj5TjuB
         bOiARQoV8OL4zSsT2VKJFFIWKqWA+JXbhnU/Qgx/0Rnr99fJ6k6f+OkgtY+gvBt6Gd7D
         l5/lhFw4md88UA1T4a5Vq2se4N2D/BB3kVaX1J6EmRu21oocV+jYwXIARDtK1zCWu84n
         WiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762266481; x=1762871281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6vMooj6nQEjhpvsQbqOx+QSNSWMlut6t0Tcg77EZzlM=;
        b=HRjgsXP5jJgi37SqsBW4q2we5A+foU7mXRW7I4vdfHX4VsBMbpgSOqaPohrQVqRPta
         2y5UmlqjIX5psoRN5B6oKpDSyclrav2ho7Auoam9utaWf5T3qRmqjxN7zuZ+xnYwGh+Y
         XjyMh4aUmRQXQdvD7KOzVKX23VJBVfe0nnYYaSWSvDARj9AU8Gr1B9KmiwSQODyCaT7d
         kE+e/HBlDYJdxBMFWiQbXEgz6WHaiiGtAo4482ENWIfNjHRbMqcW4Fc8LzQElruMhgD2
         b3QC40AmUXQ75bEinTK0CZseyQLNkok4ciY3VwIAJ7uNxA3+hdXO4Tr79r6qrgw3Fdjx
         A0kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzbU7g58m5Ci+UHQAHILcAho8fcsUAF3VqTXeRMLqx8v2CLpapFl3tUFWxpIYJPIc8/D1eievSd+Wgew6q@vger.kernel.org
X-Gm-Message-State: AOJu0YzyfDBrBlidGJPkqYZxuS72aS6Hu6lXxRFOxnXRMaAM+odyzUYa
	sxewvJhL5/YPBEopD/d91KUbIHCLuVVehq64SdgBvooD17SwOIQb2spmVjCgibDySOxKEDhwXHl
	v4z5cRuMiFZkxKXuehRk5h4OnOa6aSWG0hMQDpvuPg1yHvJMr0HX8/BWVlC2rhFrdRKWo
X-Gm-Gg: ASbGncvASdNIwuflm6lkftqDpNWT9j3A14n4MtgDkegMzjVEdgGiG38w3GDCoJgOAEd
	ZW9IY8A2B4Jp7X3s0NzNq9KBJHCRxFGDu1O7BXdcoSNKfa5Z+SDWvoN+BKAG0j1deqfFdqaEgqw
	niIqOUuW+8I0pCJPV60+LirT5y64EQi11LXSlNbo+/6NNS0zP4cUHLRJiA+wwS9cyjeIuzZFdLc
	9yybNGkIdtbWI5+8DOBXnN3WRazunTvOgh41FoFaNDE8wbHnK+7qrtEg/cTiTiMh91oexZZ4T1i
	Y+m9KV89ELey9kpVVfYC9MAJnikPw3/rP1UMr7JlCqcQDnRgE0wJCcYJIKIKHo4kxMs9IK6sbZa
	+8M3zXAMNZWN+vdFKsEC5QGPJ1Ulw7IDlAKHsjrpVD/3ml5MsTro8+sOF
X-Received: by 2002:a05:622a:1a93:b0:4ed:6ea1:ceb6 with SMTP id d75a77b69052e-4ed6ea26d3dmr5168721cf.3.1762266481072;
        Tue, 04 Nov 2025 06:28:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcuy8dFebGaXBPucoUYrFWUWiOv4h9ZlBQ/EW+321APZlZZj9bXttm3CnufIKewnbdiOh2Jg==
X-Received: by 2002:a05:622a:1a93:b0:4ed:6ea1:ceb6 with SMTP id d75a77b69052e-4ed6ea26d3dmr5168391cf.3.1762266480564;
        Tue, 04 Nov 2025 06:28:00 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f273fsm221158366b.17.2025.11.04.06.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 06:27:56 -0800 (PST)
Message-ID: <27f51013-9276-4e41-b57d-fb0baaec5bc6@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 15:27:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Sudarshan Shetty <tessolveupstream@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251104125126.1006400-1-tessolveupstream@gmail.com>
 <20251104125126.1006400-3-tessolveupstream@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104125126.1006400-3-tessolveupstream@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GekaXAXL c=1 sm=1 tr=0 ts=690a0d72 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kaRI8otYv47dkxnPBlMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEyMCBTYWx0ZWRfXz3vDFiUM9c5X
 kc2xZX+zl/K8AVCYZ3d+/8e2/pupaiJCObpk4/I0rXDg4Vw5r2SGMi08nawuCxxzpAyG5vpplq2
 nsgDSZCygpL57/NSSC7XpR7knEJNN4vYgn1VmHalV33KAjSXRd20ELOW0LCpeskI2J5GzK2KQrr
 WAf2CqixwWXuhQE2giYVKQrxgJB5YvslOF3cqcPfmTkeP7qzBPk4O60a2eRlOthQrOEBoYbZAZt
 tbXQ+6yHb1ZpN/Kgy7bp0ZO+1tJOe+UkwdVWAFHcZtPHx5EfsnMYKpwNAdAf7KLhb0ezwkRk77o
 eXge+0hTZ82xBHfOzLkHJIF7q9VsrSmVtxXe31NV50ctt9XPzsOYcvuvMd8FQgiPQ3lRduktpgE
 gI1I6rCtN4jIJMy/HJAQWfbljsac0w==
X-Proofpoint-GUID: uol4pumnzCbYYMEWOTkKF3FueTU2H-HP
X-Proofpoint-ORIG-GUID: uol4pumnzCbYYMEWOTkKF3FueTU2H-HP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040120

On 11/4/25 1:51 PM, Sudarshan Shetty wrote:
> Introduce the device tree support for the QCS615-based talos-evk
> platform, which follows the SMARC (Smart Mobility ARChitecture)
> standard. The platform is composed of two main hardware
> components: the talos-evk-som and the talos-evk carrier board.

How is the carrier board a separate entity from the "talos-evk.dts"?

[...]

> +&mdss_dp_phy {
> +	vdda-phy-supply = <&vreg_l11a>;
> +	vdda-pll-supply = <&vreg_l5a>;
> +	status = "okay";

Please apply a consistent \n before status

[...]

> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				adv7535_in: endpoint {

and between the last property and the following subnode

Konrad

> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				adv7535_out: endpoint {
> +					remote-endpoint = <&hdmi_con_out>;
> +				};
> +			};
> +		};
> +	};
> +};

