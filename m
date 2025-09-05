Return-Path: <linux-arm-msm+bounces-72282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33328B457CA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D44891652FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFC734DCE1;
	Fri,  5 Sep 2025 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThIs20tG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171B534F474
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757075188; cv=none; b=A7lxaAJuEazB/dafT3TbyP9gZHvSPUWmMBn4pOktzdQe28Wn80UsL8pZhHsnUPsvPx4/u8Gwexaf9UF4zYO9IBMbvaZG75T5JO/ilZGRtNOLQ6uLeBFDRFCL7Vfejl604aXJQknJh5kPtU93XvNJJR9W578H2yzbvw7EIFURMQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757075188; c=relaxed/simple;
	bh=JkUf2vIGxOiyFPoVNdwA17YFnAIws6TxkLfW0TPXFlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkPzJTGNY69XrX/aw75oyWrqZSYxOO+7W50G7NkiHtHMozmCkYGG7wAyCXNACxJCG156YCChnaTwJVcZc/U5TWFcXLv3ARAkYrw1LD71rj1pKvMO3Zegqo87Imrx4fZt9coifUSm3CE8Ty6xq/bDCMNeB2fxfFaTw03xQKANWhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThIs20tG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857Ll8u008288
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 12:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kyI0487W0JqbBUoFU2qAu9jSBfGKKX4t5Zjxjpcd4FU=; b=ThIs20tGdSL4xOLh
	zGd7ULBE2BUErfKiBlNO5oeUXwhrBE5DtRFI2Jkq4mM86mMQcoAuB/N9FtJc4kjD
	5mfvZW3bdqw0RouzAjSFZkcxe2BNrVv16FrN9wXzRhj+DnWzGAH3xS/jPi5LUJ92
	oOg++dYIYcYZ1M7VsEv2krWlmLwpFZ4/a7kSpqFc+XIG3GUr10Y+y7AbD87x5MAD
	O7Ei1ghpuyNUCV3HRSOU+epkRljIFcBTI9qcB+tmk4io0y9wVxKl1GjPMmLAaYj2
	ONYPAV4BUGdA1EOMZfdQPN6jCvjHZNuWi0Q5nh9rHV1ZyIehNux6vnrz+NAn748c
	TtxMhQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmju241-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 12:26:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-720802c209dso718776d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 05:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757075185; x=1757679985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kyI0487W0JqbBUoFU2qAu9jSBfGKKX4t5Zjxjpcd4FU=;
        b=C+YCS+0pRqh7X6SudoUqqcr8vUA7SCfGr+8W72zNpyNbqQ2Mv4SLp+xukJOJSCk8wN
         KYVkDYd6eMneZciA/ZSe7prOuQTyt56Y1aS//NKt3+6fFowrYQBLHqYxAtZroq7Vg1Fz
         t/iE1CYk0/JIEG6x39yjJxod2zyFBCAks1XaXyGd5P1TmTGNdrd0FIiXAjXi4QpT7Dzs
         n0/JSjIcLI/v3T+0Iw1o+l9fIbVXfLVeEYObvei18EgCJpP/A07B0+a72BrT84a+Tkkr
         4JNrM4hQHw2lLzZKNl57sakExnqnnmafxoibgU8QlPkQTovyXYNhx41WmTTI4gytQPQ1
         tkmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWovj+NAJoXBmpVRcQtzd4+VD4Vd/SMpVdxNIBzZC73ypB9gk03o6jiY+XQSRGMwlgjtSYgSbkUgaJ2XBab@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5F+ouJnQHokkccgRQrW4xov0Y71tbtilmdgp8qkYVExNZmP1N
	kFXzEOWIax5OMm3Jdv9OSPvNpaLCvVwMHOiLCbJKJB9rDWhq5mkFS52uhPHCISPfJOh7u0Apm9s
	GSlqIMGwbvgsLogrvItQfkD70SMAF0z3Z1Npx7DiKo3YPhf9cYDJ00dv0/gA9/nyUOjmI
X-Gm-Gg: ASbGncu/GYe6yxs4JXtltPwrrjuuaAMbuSzLDzvuf8GM4+MqFHjHsn+6yvRb6A1Oi14
	7UVD+noSI70u7doctnIuG+PpblTYgFAZTAdvDrGDMw1njIrTUBQaA2zeXjAYEcyLseNFgEdW5sL
	D7ja3/DBuvbShe+LdqJUs0DHCpa0KJvC1oyRPtx0+Tlhv7FeDCzSsjmnTHB3n/i6yIeqOyG2r1o
	av0Wc1wcQ8xVvLuU5mJ0X/1DT6T9J59EaOBFOcMU9lqPGkvwUVLQ6mS2RdH4hbprjQImNInTvu5
	13AnXB2+pIa340OVp6VQccRVcYkyTYUrjnIOEI/BHwqCqnWNB39UqXILJ4a4aRemhPZLG/aqMBy
	WrlxfgE/GiUz/WPmB6RTMgA==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b5a0fb5d27mr60505221cf.2.1757075184956;
        Fri, 05 Sep 2025 05:26:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHIZ1IK9XJ4FfWiCBoKZm9Dc77t4hxWRO8SKHBZ1qvz1azh9QEBjD3+6lYU1NQiV7h5+pluA==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b5a0fb5d27mr60504851cf.2.1757075184359;
        Fri, 05 Sep 2025 05:26:24 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm1546636466b.12.2025.09.05.05.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:26:23 -0700 (PDT)
Message-ID: <34d9ce02-5711-42ec-913a-772ee744b7e4@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:26:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/14] arm64: dts: qcom: lemans-evk: Enable first USB
 controller in device mode
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-10-8bbaac1f25e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-10-8bbaac1f25e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68bad6f1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B3P4ua6ZyXwAq7e7NPAA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 5dsjcRd_Fy3qN8eRVaY6Xm299wpA-mBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXynGIJkh++NEe
 pWCh/klAnmsC+PXu7gUrlXVgYE+g+YUUgx1kHmQyUurOAaC1nZza8lYJuwt31EBpKBeqihJWe3y
 qtCdoP43T+dALm1nXh+K7yqd1L+N4RBYaj8uOTOhQsQh5oT6q2L/kSuVXxZvwADEAe0XIJUi8m7
 ebUQkNEDhqHhl+VjzEEZAwTnK6W01byoyt2vc30TdrrFB0vqKu3NtqyMUuQ93YYpmlGdfKujNGR
 pD7eV1spxVrTQKR1EmgoUj497kKLHRHolM4ht4S77EQ8hFGpV6mfvLjv/Z3FDv1ZzgWhVWIeo47
 6Wx3DyGx3DGkZ0p53mkDmyZzzX5Z/asiV2BmhnOQNQnLLUbZ0zF8EHtaguJhsklsnkLbgjg9vX3
 07fimt8m
X-Proofpoint-ORIG-GUID: 5dsjcRd_Fy3qN8eRVaY6Xm299wpA-mBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On 9/4/25 6:39 PM, Wasim Nazir wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Enable the first USB controller in device mode on the Lemans EVK
> board and configure the associated LDO regulators to power
> the PHYs accordingly.
> 
> The USB port is a Type-C port controlled by HD3SS3320 port controller.
> The role switch notifications would need to be routed to glue driver by
> adding an appropriate usb-c-connector node in DT. However in the design,
> the vbus supply that is to be provided to connected peripherals when
> port is configured as an DFP, is controlled by a GPIO.
> 
> There is also one ID line going from Port controller chip to GPIO-50 of
> the SoC. As per the datasheet of HD3SS3320:
> 
> "Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
> not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID
> pin low. This is done to enforce Type-C requirement that VBUS must be
> at VSafe0V before re-enabling VBUS."
> 
> The current HD3SS3220 driver doesn't have this functionality present. So,
> putting the first USB controller in device mode for now. Once the vbus
> control based on ID pin is implemented in hd3ss3220.c, the
> usb-c-connector will be implemented and dr mode would be made OTG.

Hopefully that's somewhere on our todo list

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

