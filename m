Return-Path: <linux-arm-msm+bounces-66655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2E5B119BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 303EC564B68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 08:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1EB32BE7DF;
	Fri, 25 Jul 2025 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gcKJRwA6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A47C192D97
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753431763; cv=none; b=WI6ul4xIyQVm6im2Y7zVsBcvJXdL3xE01w7Im5T56UnN5LRvfLKjNi3OTMxiQ74o5FMTeJ6jvWorV0Q3PES+ifoP0EtIFFVlB1KtoKmkq2G9rbvj8WvW0UCugPfI9XxZQ6r3dueV+iEu9mT6DP8hsJPzuMVWh4Qo6sTBCCjNo0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753431763; c=relaxed/simple;
	bh=tAq/SqO5yTKsbl8iexike5OsMdJZOe+rhnywnp60BIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0dYwRrf0Q3jHgSVH5W3ClFNeNREpsIXVTsK2zR47dGj3BrTHP/NUoQeyqXITNrowZVc7ADRUw3S0PW4yYBHyG4+3+YEPiKhbcvHom0wFg3b/iFx0xXxK4SXLXGmunF9NEY1YNWg3/wIPA8kyJWcqKNMVQeqwW4CWXPJr4rtH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gcKJRwA6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OLmVfX009335
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UMDm2fXHNCh3LgW6f0uPopRqEtk82wFNcazajJLD31w=; b=gcKJRwA6ZsYKFwOW
	4HdqsjTqf9QkX6AWCa5BN5b8/J77zqjRTMo0JdtwwTlw3IFzJe0OkaWBDEiNuqhW
	WRmHcn6qk508749V/2g2L3WH3FkrDgURWp6/PlGvz3jEWYVWRcKiAZVlqZS7+RVT
	MA6xPyoAvrZ+DF9sKokE7fs4oleX8HcTR6rmoD6GwChPshBj1MPtNrAn9M2IbTpf
	G2Cx2zM8nHyOgck0xY8dWshWP5sV9zVHFNfVJ7KScgXxAQv/ggV3J0dm6PX9hdlD
	f+OpQ0QISTfMF9qm4nPtuUVyF5I932kdllYICwj40p4eCzctHmiDLB8V4txwW1nZ
	IFp+wQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2t1bx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:22:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4aba4196db7so2216121cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 01:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753431760; x=1754036560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMDm2fXHNCh3LgW6f0uPopRqEtk82wFNcazajJLD31w=;
        b=tminWfCdnwvH2maYlR+W/WOEZHMQP43+ZLA9nJFdLlXo08tyW3Tolu4Qkbn4W58lzq
         XjgAVoq5sGHYGfNusJZMcRztMUUDFmH9ujVC2Kc8J/Qdqmkfed+erkyiM6AebES38ZSQ
         72PSSiN2Y04gnNnPzD1tz/0g8lTQHHNQW5PNjI9hb8yojSRxz6l8umba1Qh0ueN0zFVB
         rV4BPiIjHONwgWFXWr98FRuv47+p3uU1lN+P8CG/TpbX3YxPZk4gUmJZuL3g0t8BWFTG
         6O3p9EmGHKpaSuqKqnkmkNd3pB/AWo574TG65EIa+BZ/IhfMaMcdm0+28wNn7BiuaMH2
         7QzQ==
X-Gm-Message-State: AOJu0YyyizjF9QbXVcu8+a2njk8ev3BgDk18/cj2JkKyJdy8FISjUXH3
	EkPnkwCghrOF9lJZbTsB0uCsauNNudNSqzjvE4wvVPxEfZXrzdZt8OLoGrMNWZPfyihkwpzsndL
	fx2IAxAp+i9b4uW4dZdb60acjwVVN0SPb4ikHEJDH5lJSp1UsOZOUmkdS/Fn8jqbDZpIg
X-Gm-Gg: ASbGncvqIr2jKRyU31WAtreqt5Imb56xfGh84hcGYk1/ICP2FrBkoml/rrwXBf1a1lv
	GY1eus7Ys9d0ZNYB++A/xjxHuLFUh01gJk/lgiaqEUGb+VhgkmJK9iCOh1z1RjmFGxaEl3LWOUp
	LzB2Z9F3UrF4UKdt7OpRayxr6RSYOBp6gOcPxgXUPvfOc42fawpinTQ5wEHyUQtwYPnTcvCUQVU
	NB8dBzaN1Pbi2pbOZ1eCtjJFan8yxoi8xXXOlUlhUztYcX4G8SK8b2vZ6nxY3XsHlYhvBxMnhMJ
	Yn4are4cjMnM/eX5le/r3HH6Z/kauFqiTuAattX3ky4BbhfJ1dHwd7Pdwf3fLL1QVmPmhEDT0Mb
	I7NyBam8gzsVT7o4cQA==
X-Received: by 2002:ac8:5dd3:0:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4ae8ef34affmr4792951cf.6.1753431760237;
        Fri, 25 Jul 2025 01:22:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuWomd2vdk9aPHDlgia6FxW++avBnZSibV7JMRZycFiIZcbVvohrAq8kSwrDLCAE+kEsk00w==
X-Received: by 2002:ac8:5dd3:0:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4ae8ef34affmr4792791cf.6.1753431759808;
        Fri, 25 Jul 2025 01:22:39 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cc6bdb6sm229547166b.39.2025.07.25.01.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 01:22:38 -0700 (PDT)
Message-ID: <36c8affa-336a-412d-8002-095fdf23a287@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 10:22:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: use DT label for DSI outputs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250725-msm-dsi-outs-v1-1-18401fb9fc53@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250725-msm-dsi-outs-v1-1-18401fb9fc53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BMKzrEQG c=1 sm=1 tr=0 ts=68833ed1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Yi-8vXkECB-a3imGwT4A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ofkMk0uSXpUneAFwWNVQ3DydcWyNR2fT
X-Proofpoint-GUID: ofkMk0uSXpUneAFwWNVQ3DydcWyNR2fT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA3MCBTYWx0ZWRfXxf+OEbDMiZRO
 lS68mPjrLFluY9ql6MFBNleezL2umw8AUov+I1H/npBp4w+QdT52ujXIj9QfLFw6HD34tFnR2f9
 IVZ0WIGRH2L0oC06VSMXJ2kiwiEWOOBdeZHgMp4lXz7II5ELGy21j7mBZNkcrqPaiPUYvrisRKm
 q3/f3fBRovTSP8e7n6ar0lAMPKxAWBEMH2Jtqr8VkOZH+u8FqxTmuWpwc3KOQApUWkfyzFLixC2
 YGXM/H7HIHSWgHxCN8h7+JIPSLSeZsBkAXBxjeCnNoCEkduFa/88GPC9IPSNhnospROK9UZaT08
 hVgdfGSNxm8MlzsSQDUO1inKHkPVAhFWItrILCFKZhIe85F1kD98Xsf5nWEM7IoxVWc8FOJbYEN
 AyYHREzTClghPPsilsmn0Xd/mdEtJ7/2IOu8gCDt4Ez2QBuEC+Oe30ctl/Ch22ZI+C4QsNAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=711 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250070

On 7/25/25 4:59 AM, Dmitry Baryshkov wrote:
> Instead of keeping a copy of the DT tree going down to the DSI output
> endpoint use the label to reference it directly, making DTs less
> error-prone.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           | 12 ++++------
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts            | 12 ++++------
>  .../dts/qcom/sc7180-trogdor-quackingstick.dtsi     | 12 ++++------
>  .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  | 12 ++++------
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         | 12 ++++------
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts         | 24 +++++++-------------
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts            | 26 ++++++++--------------
>  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 12 ++++------
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts            | 24 +++++++-------------
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts            | 12 ++++------
>  .../boot/dts/qcom/sm8650-hdk-display-card.dtso     | 15 +++----------

This file becomes different after the patch, but upon manual inspection,
it comes down to a phandle index shifting around (i.e. no *real* change)

Nice cleanup

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

