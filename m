Return-Path: <linux-arm-msm+bounces-64051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFC6AFCD37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 828D7164F1C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EF32DFA46;
	Tue,  8 Jul 2025 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVDyXk3d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97481E22FC
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 14:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751984252; cv=none; b=Kgu0+oSesBN3dsVuNJHq8M2JQhpc4ZqdT1UaMuK3f+ap2jvgVx3YyJgfKHTx1MzYmqGa46D+ttVtyGBl922lrvf3TKqC9yWldJyu3gzc8RnIP4yDO0oanKjgsf7zLaetmcfjMNtMapk0UfitJsXQpIrHxdrQy1o8knXlpdf7hiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751984252; c=relaxed/simple;
	bh=EK3JQ72228TObN5zkuJ5CwU2D6RvYU19Tiz1TPq4xKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJrXpCyc2ifQqcqvvZ/8IgCMpffMQzBoYww9owsBlKmUySBwGc0GpGVQxZM3X2emOawUsm07+iUwtp6gabHg5o/1gy/1d60SRe9NRqXO9otsEeg+qNGV1sSwCjTpxriO1sW4MdU58kvP/46cOC9tpZfAI+KCPVruWYOerlimvdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVDyXk3d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAFsf000333
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 14:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jUymNgRTuJ2Et2D33iAba7wwkT0pE+8xLTY7OHijpI=; b=aVDyXk3dnCP8zUYu
	QhF7mFr8bvmdclv4MqkpaK2Djo/WvHo2YqMeXl0muFRnrKglwBB9H0luyo/aPchh
	vLvSxSzwMhAiloiR15MqoHdIo7EoW0ciMQk28DkzJkWkuUut+XY+aU7aIFz2UinA
	xMSclaJ5gGh+dPXktJtxZl0extOXGzX5yTwixSHrZkWbRgKq4iiLrl2XOR85oKSB
	BBbHigHHZtLzYwSBg0pDS1zUkgDXkGo6CfLVcXTo32/9AR3b/VuKH7eP8TC0OgoM
	CwecJw8drMG49gi0iwqAi16SHuleve2DNmQP1U/3LWMaMK+Ihi6UzUvwjKkY4HKu
	NM6/cQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrkp398-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 14:17:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7cfb7ee97c5so25425485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 07:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751984248; x=1752589048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jUymNgRTuJ2Et2D33iAba7wwkT0pE+8xLTY7OHijpI=;
        b=q/wcX6iHUvzXcoIom5Cfdqxu9lRFe8APvTPGlgNLRxikDES62pdzJjj4YcyOHHeYke
         Dp/uwF1QsQu65rh0LmMolr3BoXDwVODXvw/WjYktltBGLCn1mxdJMnT9Fucr54IkwEvY
         SR89+eacVjGZCrL00KzLN9B5leK3xDQLYMKVQrKvOD20vflUtOYfvpdeDxlIa+f4f+8f
         MVUWU4sGdQRoDzjQtgMc6ouXxIBsvM4zC7JUf9uC5JG+BGeN6htr66xLahPMr9uLsrd5
         0HzoVmgUaK/MHWD0rVvYG3epeHo/rhOalokjCN2/YH2AbMw82HK4JA6Duv2DQdyfdCeu
         fvGA==
X-Gm-Message-State: AOJu0YzAw1dXdMKmCWtaWCdUQpjAdANd43hOP7D0jVvyl/Qg8EYIRZwn
	d4Kmdej4qqiKQnLkjdyFE/wYjWMy2zK6OM1QiApziZ1JiL5N8+Dc/HLcN9IPlSRboMLgn1sWSUB
	baRSLnzJzLV+t5nqpstEUls0Cr1NUBD6ULvDtB6QYSN+V7rR6F7qmomn2Y7wR6SI3YfvJ
X-Gm-Gg: ASbGncvIV0X/7Gsv3ZBKD7vTNRcb2CpXQgMi86BKDxJTjp+5SsRtD3JLoVxjSB8hHEq
	9lvOa/1EuPmlkgi8hEUMeiP5JQfAz5Zla7mxRCecZEbjZI66h4EIG79NLFa7+bs2uSACUwQ4WqQ
	eZ5iQLT2uYO52i4RIActTKLqwyOFykjjs0A+dnEO/V3JILCoh3cA7c3jwFWt/dEw6aF236jHBHA
	zSeczq1+sfwTyuBKjewHQcUpdMkeQaDHfCAoz/gvKEmxjgrda4NzYiDlAEShVdwHWNeElgcaiw6
	3IosX5b3Nbzy8WImzFFSEYunh7fFYCiBCBDwCB73N1nUtjLkR1GoRzxABzTwmvPNm1c4QMdsba5
	AIfk=
X-Received: by 2002:a05:620a:6284:b0:7d3:c688:a590 with SMTP id af79cd13be357-7d5ddb7222amr681898085a.4.1751984247849;
        Tue, 08 Jul 2025 07:17:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGat+j5WRhRm+vXxC+HtFHxmxDl6pmEScjJVFrSTRuySFhBrkKDrxmWK7sjjXVTwi5HDCjg+A==
X-Received: by 2002:a05:620a:6284:b0:7d3:c688:a590 with SMTP id af79cd13be357-7d5ddb7222amr681896585a.4.1751984247374;
        Tue, 08 Jul 2025 07:17:27 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb6dbbe9sm7163457a12.69.2025.07.08.07.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 07:17:26 -0700 (PDT)
Message-ID: <a8d28a19-0730-48be-8e0b-21892a89aa7b@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 16:17:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: x1-hp-x14: Commonalize HP
 Omnibook X14 device tree
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250705-hp-x14-x1p-v4-0-1c351dbeaf18@oldschoolsolutions.biz>
 <20250705-hp-x14-x1p-v4-2-1c351dbeaf18@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250705-hp-x14-x1p-v4-2-1c351dbeaf18@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0NY2YhjMNRNNRgmsV7lSfO6GCmW5G3JB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDExOCBTYWx0ZWRfX/yBbjxHowj27
 f3DgYY1Xnl4tTuUVA6sXjAEagAgrIwYJRu+FH0dFeIaGYq9vi05kaQYBos4NIYfQPWooRu+IceR
 H+lCXgVO8Dti2FzmFL+tyxJV2BIlxBIxoZlh9y6oudZJrCSyop5DoTRLhqJLe4FAiqqGBKb7E+k
 71sUhyXaT0jHdwhYjMd1KAapvFokagDuhDuwrjiqo0JyNrm6uHQjag8mHZQ+LUrmM6A29SAvQSU
 Uvp6xl5bfVjG/zAEZ4ztvhBQT7+9fMoMdQk/aQXFnVvhGCUTYTqeGhQJIOfyvWhQjw4u8P0kgJc
 szP3AD7E7fLYhMKVEUGGG+qctqPwqTu7nxcXB9AVIPSicsnE72e4c2+csqZr1YbjZ23kpXfM1lh
 dm+y/DYq5mJQifjqsomYYFcZiqwOhFPHtruBwmuzTmtMXnO9Z5skdFOSjdwfrBdTC1hP2FTI
X-Proofpoint-GUID: 0NY2YhjMNRNNRgmsV7lSfO6GCmW5G3JB
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686d2879 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gxl3bz0cAAAA:8 a=cAM1RvHTojyOkAC3-G8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080118

On 7/5/25 10:31 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Commonalize the HP Omnibook X14 device tree for derivation of Hamoa (x1e*/x1p6*)
> and Purwa (x1p4*/x1*) variants. Required because the device trees are not
> compatible.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---


> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "x1e80100.dtsi"
> +#include "x1e80100-pmics.dtsi"
> +#include "x1-hp-omnibook-x14.dtsi"
> +
> +/ {
> +	model = "HP Omnibook X 14-fe0";
> +	compatible = "hp,omnibook-x14", "qcom,x1e80100";
> +	chassis-type = "laptop";
> +};
> +
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {

Ideally you could switch to using &gpu_zap_shader {}

Konrad

