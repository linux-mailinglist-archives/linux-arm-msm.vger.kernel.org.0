Return-Path: <linux-arm-msm+bounces-71817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD6B41D46
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33E687A80CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312112D3EE5;
	Wed,  3 Sep 2025 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XG/cnvoE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1197A281509
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756899908; cv=none; b=SF7IN80c9UQvs8O8g+MSUK37YHD1Pp1Rc7ZnzjPSv7lfVwCqisScvnrRsw8JUBeHBW5ArBH/jK1UsCEcVFWlvsJa3rqtnBWQOzoMC3MkN0VOeR+C+HZWfhP6T3Hq9NhU67MiXEWeuaGIlULF4vbChKt+wjWNizCPaMM1tdIZg3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756899908; c=relaxed/simple;
	bh=ZFslkzkzaO3P6RbCdZ+X+S96dhqu96FyFhmeWdrTj9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2y7VQBKhYY97XJgOb+sOMbZaJ0vDRbPAFbmXgfj2mUA60vPBvd4yRsRHmNkO6VioHMv2UpWY9PjdVpH1zYGSwCDItQd7WmJcm9N5ntxf1Pp3EJ2CjWc+dJyDTsshLH8qPrBn2tWDY+yrhMaR4aquUHTPV3ahXprid9RMUvZpfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XG/cnvoE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF2CL010113
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Jvu4Jo+Bcxn48m/sFZ4fPyHv1yzkWG77RqatHLjJQY=; b=XG/cnvoEHIXbnjYz
	At85xcBTmQvHSJkXbLBmeazu3gEoWD29R/XJ5+ljMYfrRhnA50NVc3afFEiRyB1F
	gjQw19lxa0+DtHiQGeVdB3J+poF+v4gRR5gfnyIg9I83ht8cP1htZHVIf2xvaqbq
	0KY3dorzCg+5rLhsf7AVbREdpQCu7QHu5GTVjfqrqOnhl927m2jxn0CJYlbmRJfs
	0k+YKJoM7ymZOspOE8BeRwqrHGLS9P5yW3GOpVB16BsatTvOMCga1SfQ8Sagmuzl
	3XHmXMAKhj54DJYp1rFZpZCzfyimbKeypOKi1aEwjLoiToBS9NOD/Ea1FFYVUkmM
	qA4bXw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8uec8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:45:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b32dfb5c6fso15447881cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756899903; x=1757504703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Jvu4Jo+Bcxn48m/sFZ4fPyHv1yzkWG77RqatHLjJQY=;
        b=aqAVddtejFZZ+Ak0KLHFJbFaeL0Z8de9d/Uu0bFofbM3JR8I63+03rfdZ5JpQBDoOE
         SlMJm+dJu9L38cPwg12nq4GAIkD6uWcgQMS4d6d+vVgzA4B6pQnLMDUPHFx1dJvefs8C
         zDZKm295wx8Y04kRJGWvfY7n1/YeEyLuulhT2LvBaBP6EgdbW4j5u/x0Xq60Mk5YoTwA
         qOwEJTWs6voi3QCm2T9De8tFrFfL9zIgLi7Y9w0N2FTvZ36np+5FFKC+yBg+hYjVyCgF
         bOVvpHhd05nICrYEthLoMgrI6iC8wC/ZjMaGSY2dOv/a3j3Ta5lvwXCqoIBWMS/ADV0J
         Xosw==
X-Gm-Message-State: AOJu0YzwhF45JAzo9jkMOImeCmN5V4/HQxDJKk/c9l83LnXOsa9iY4GQ
	koiBSQQ2g5YIIFDIgSLVc+0tb++Lzew5emxG5ULn6E0fsNNo/YACjOMCnWMyQySUF07zj0PcBxS
	iOHgOTJ7XVgWXamKr1+YnP4li9G2Ho6qbvqIKQcHF1UrQSY2DMRXax6epjqpLH4HjMnnR
X-Gm-Gg: ASbGncvysJ5Pvv2iGb5YxQUe282fFeQXe/82MOrHw4uluNIBUcCPrRXoijHJFFV6lXG
	T9oxSPyp3nflPKKasH/Ok9qpA8pINNovxfVWjdwhwaFOWlSc594TfYKP80cbeZYn2Yh4RHa+gZM
	j6nPie3VQQ8m55Fk+74/+5v9G4+1c0RzJ+IyL2FkLqQ5Zu534JJ8+JWy+UnmRPFm6EsFkMouWZD
	yMi/5QrGeT1AW7ORQSMgZdE+QErfThRU6AZBwGNF+L+MiI5iM0KJAXMOp5fDicnKZcjIq5jkTSi
	zLmKZpz2lW3w7Uyd4VADpzedZb7I1f2VP387FUx39AliMvnLYhRp8HGbcRyE78Xu4WTszCPz40I
	ew8+aJChSDdZzj2wpWJOJKg==
X-Received: by 2002:a05:622a:15d4:b0:4b2:d8e5:b6e3 with SMTP id d75a77b69052e-4b313dfd74dmr142095781cf.1.1756899902991;
        Wed, 03 Sep 2025 04:45:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIcR47zNDXHKfbpE1KNZpjx/ssXLf8dHQ7yihm/3EKuTDfb+SvfOKxZop6+eyhWbcM3uGoFw==
X-Received: by 2002:a05:622a:15d4:b0:4b2:d8e5:b6e3 with SMTP id d75a77b69052e-4b313dfd74dmr142095421cf.1.1756899902272;
        Wed, 03 Sep 2025 04:45:02 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0432937e0esm701176566b.3.2025.09.03.04.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:45:01 -0700 (PDT)
Message-ID: <b3455529-1356-43f4-9d5c-ba6ddc52a250@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 13:44:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
To: setotau@yandex.ru, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Richard Acayan <mailingradian@gmail.com>
References: <20250828-sdm660-lpass-lpi-v4-0-af4afdd52965@yandex.ru>
 <20250828-sdm660-lpass-lpi-v4-3-af4afdd52965@yandex.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250828-sdm660-lpass-lpi-v4-3-af4afdd52965@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: heC6-StOx-X_svEBZEkSsGGAKOsASNUe
X-Proofpoint-GUID: heC6-StOx-X_svEBZEkSsGGAKOsASNUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX5tywEI3ekeBR
 3hB7YXViwjHfj1znbjKLvmgN2y+xIG3QK9/sWh2fMEc0gPJINVhRJEgfsQLAzxZ7uN4HHITucIv
 HWYzZmsXrOKy0dbUHU9hBRcYGQyrRq5+dUvI/6g7U3Aw1lDbXbpjs6bbB+wb7O8YeP18WaI3sU5
 FKbaccdqFnE6GxxfKnaxutRUNZTR1Mw9k0ObgChKXJblre34/ITzpEd13j6jSm20VYFAQf+TARQ
 G4IDBuYCLZOL8mABsJ2TNiE6oPD61sVYBM7CHT2ANQJtx0k/EiqrRveu+YNLsGb+/pmPj32Y8jg
 AScK0eFTwDi+D3zbekvHumSfTshk3D5gcPaoIb+6s5T9Aw9fDaOkFitl68fKE7uJFsvW4b1Y5Xy
 6dTCxlmf
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b82a3f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=pGLkceISAAAA:8
 a=vaJtXVxTAAAA:8 a=30MhwtsY_Fg2L1vrzq4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On 8/28/25 9:23 PM, Nickolay Goppen via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The Snapdragon 660 has a Low-Power Island (LPI) TLMM for configuring
> pins related to audio. Add the driver for this.
> Also, this driver uses predefined pin_offsets for each pin taken from
> downstream driver, which does not follow the usual 0x1000 distance
> between pins and uses an array with predefined offsets that do not
> follow any regular pattern [1].
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Co-developed-by: Nickolay Goppen <setotau@yandex.ru>
> Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
> ---

[...]

> +	/* The function names of the PDM GPIOs are derived from SDM670 */
> +	LPI_PINGROUP_OFFSET(18, LPI_NO_SLEW, pdm_clk, mclk0, _, _, 0x8000),
> +	LPI_PINGROUP_OFFSET(19, LPI_NO_SLEW, pdm_sync, _, _, _, 0x8010),
> +	LPI_PINGROUP_OFFSET(20, LPI_NO_SLEW, pdm_2_gpios, _, _, _, 0x8020),

pdm_tx

> +	LPI_PINGROUP_OFFSET(21, LPI_NO_SLEW, pdm_rx, _, _, _, 0x8030),
> +	LPI_PINGROUP_OFFSET(22, LPI_NO_SLEW, comp_rx, _, _, _, 0x8040),
> +	LPI_PINGROUP_OFFSET(23, LPI_NO_SLEW, pdm_rx, _, _, _, 0x8050),
> +	LPI_PINGROUP_OFFSET(24, LPI_NO_SLEW, comp_rx, _, _, _, 0x8060),
> +	LPI_PINGROUP_OFFSET(25, LPI_NO_SLEW, pdm_rx, _, _, _, 0x8070),
> +	LPI_PINGROUP_OFFSET(26, LPI_NO_SLEW, dmic12, _, _, _, 0x9000),

dmic1_clk

> +	LPI_PINGROUP_OFFSET(27, LPI_NO_SLEW, dmic34, _, _, _, 0x9010),

dmic1_data

> +	LPI_PINGROUP_OFFSET(28, LPI_NO_SLEW, dmic12, _, _, _, 0xa000),

dmic2_clk

> +	LPI_PINGROUP_OFFSET(29, LPI_NO_SLEW, dmic34, _, _, _, 0xa010),

dmic2_data

FWIW there are (multiple) additional functions for each of these, but
I would expect most remained unused (or perhaps unusable even)

Konrad

