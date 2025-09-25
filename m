Return-Path: <linux-arm-msm+bounces-75069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83423B9ED94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 892141B23D43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8A82EE274;
	Thu, 25 Sep 2025 11:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UaHLNbYI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8AD74040
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758798124; cv=none; b=b68++34PMxusoO0M5strYG0lQejb89zOTbVWxNvKD4nkw/9Tk1M8Y4Q8r7S2VjuY7epIliFvHkR+qMiiQO6/Cv/9GrCCP6B5fiaIYUDgqR0yhD6DwB2KmyEAv7Z1nw9XmRYuucvmr8JSkcv1U7xEiu/KzbmLYCqgu+dctce3IOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758798124; c=relaxed/simple;
	bh=lyqvYkaj60Ar7s+jyDByOfyVX7oJIz27/Tgp2lKRwyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C5C+WVkWweJnAf3l8DCKSU+AxrXlACXiVRbaTIQUYVQjmzrvKGYDEZ8C9rD2krYvsoc+//vDmoHIL+kOAO3JSROvG3xqBcNeySt4sjS8eu3lPJKP0Fejc3H1iSLt20fzfC2Ei2QD8xlPL1jjAydImxWulMvUa7Pin0RqnkZfPwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UaHLNbYI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9jESD025075
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uoboDRGVeObKR91G3EO3aEnY8YgnQu8Hx+ipZZBWW9I=; b=UaHLNbYIpjYG/4wn
	quPNAWqtEhVSvsEzGl1GkBOBf6skkFbgERjI7EXKST7okCHpgHtWkNHO+7h8JeGl
	UjG1qAsUIKa0AYHzX3JVeW9Yi4H1YnB00WbyN80qMmn5Q9TnwBOUl2XgjpZRdoGj
	8kLDX8QJLE+sjRFYydm9yr3492/Z/k2hu4GvMFuJ/4i/do3MEA1pFSBbZiYkhb+x
	9or1Vtp1PNpMiQy8TgqJcrAjpXMi3lAzTk98FdooinCUn78/PfR9jFD12Hs1HU4C
	VX6BNedjwID2pk02u7Ds3vjUnLyMsqKQATKIfJ6RGy1ilVmiDB5+Bez/NKOPNi4m
	vYBZQQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyf05jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:02:01 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-8f0d2fef86eso60351241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758798120; x=1759402920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uoboDRGVeObKR91G3EO3aEnY8YgnQu8Hx+ipZZBWW9I=;
        b=PLuMoCVyq/zkm0F2bVuSutzfEEsO9t2UCPsK7V93LTKhMwPS/MpJz22ehnVcwo5ws5
         dE7EXWmITzzzRARPVwaLOBXtyQoQGXOUnzHA8+FgzR+GRDr9p0CSejBj2xo6XVO0Uik8
         itgE+XpHFN+5tHMZNslYCltxvMM1fmnEd2x4o9fQ5DFLxF+KFTxTilrvgT8whaenOhtd
         4kanBtHfqhNMmRgwISrybuoYp8anbop7J5bRgUVr5JG74RrkiJDo2TePimVx26PU7n9i
         rH/Nrz6ohkyRKnCb4A2GbKi1JvcjvefdE5KNoJhZF65JQaxXh87mQxW3e3S1rTnlvT33
         EP7w==
X-Gm-Message-State: AOJu0YxjID5KiSO1PFPmfK6vNNnRlcA4Iop0x7QT4RuckNB00Dy0jqPn
	Pr/ssjYgqA5ooSIECYbTjogtL+v7CUoJ/AhorS77xjOZRItkycQl7M60ky/ROq3IZFLLVxlI+lA
	1r8jQaSiIhdxJTLP6Z9TO2GO1olELinPo2k5CXdikViJFLyesiwIEZYyVJrHK5poBrugn
X-Gm-Gg: ASbGncvx1loKL73aZ8N6vYJ5pFxtT6fNWwV5U2dlDLjqSTWMMZuBm/hOX4oFxjT2sQY
	t2IoeWT74uSjYUA7C+o2sl3Qa5BA4Hcu/byRNMh15sGfKZ7owl/wYbsyD0vRuK8TAqCQPQH37Nv
	DAcrFdeCNefG37OYcF0HGjCarmvuvb4FklSxaJ3k2qMJbeWPkAMwu87yEJXiowBDo3ldmmTCyIj
	ZDJNKcNs8GP9BLn5pK4H7Lw9CDm0x4vjsBVzVYeiHF+grc/oZJuFzVz7Acdy3u/lFkiEhVF7Tj3
	Jin8CLuyRAOzjtNYVhIUWDO4O5cb8v0PWGVuOVxjUTKDDu6ApKnlDU0fILpm0usDzhvTx1+j4WZ
	jZEeShEnsof6eT5G1TEnQSw==
X-Received: by 2002:a05:6122:5206:b0:544:6d56:eef1 with SMTP id 71dfb90a1353d-54bea256d02mr371008e0c.2.1758798120528;
        Thu, 25 Sep 2025 04:02:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUnV9/bgYJlti2LIjsmZdaGX4KyPswd967D0dRbVBEJzWZibflvSmHCF+zSid3IwWgYek4Lg==
X-Received: by 2002:a05:6122:5206:b0:544:6d56:eef1 with SMTP id 71dfb90a1353d-54bea256d02mr370965e0c.2.1758798119699;
        Thu, 25 Sep 2025 04:01:59 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab31bdesm70750585e9.11.2025.09.25.04.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 04:01:58 -0700 (PDT)
Message-ID: <a49f3f75-c882-4635-9be3-a433b7fe32c8@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 13:01:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/24] arm64: dts: qcom: glymur-crd: Add RPMH regulator
 rails
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-9-24b601bbecc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-9-24b601bbecc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ujWcA42ECj2mCfNIoccO261DiVxhV-ui
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d52129 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=mWQtOVyK00dPacU1zP8A:9
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX127d2EzqQDL+
 8hWwM+SaqfTY1jXdRTqDLhKXQ9reRHgI5xhVt2ux+knUYUmjYNMTYj7aCCNu+WTWn9TK7qMfgFY
 wk6687+HskCV+4epYDeQFel9vZd2k1e2w42Su8OXYY8S2r2VkrNj2KwEWCJD/Ox23/21E3c+Yul
 BJw9hIgZyA1VDezO39bFtZZaKUu9cX8i9TJIdu/Qj8tjDMjmjINl+xaXVy79+3YzMLcHPuENGBm
 F2Db719z9xLbhjWjXDa92FHS0ZywKAIZH1xvc0Z/fNLU2HpzNK/pQjXYXUtUb0u/j7B9BTz6V7O
 y0vazEw3mzkx9ZgSbqa/Qc8osX+jMdysR5HSV8k51W0PUJUgW4OGrLhvEzGXcuXfDALC5obUiD0
 VVZMVhNC
X-Proofpoint-ORIG-GUID: ujWcA42ECj2mCfNIoccO261DiVxhV-ui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On 9/25/25 8:32 AM, Pankaj Patil wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add RPMH regulator rails for Glymur CRD.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

[...]

> +	regulators-1 {
> +		compatible = "qcom,pmcx0102-rpmh-regulators";
> +		qcom,pmic-id = "C_E0";
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s8-supply = <&vph_pwr>;
> +
> +		vreg_s1c_e0_0p3: smps1 {
> +			regulator-name = "vreg_s1c_e0_0p3";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s8c_e0_0p3: smps8 {
> +			regulator-name = "vreg_s8c_e0_0p3";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>

Both of these regulators, having no consumers, will be parked to 0.3 V
(the lower bound)

There are other similar cases in this patch

Does the board still boot with all the expected functionality with only
patches 1-9 applied?

Konrad

