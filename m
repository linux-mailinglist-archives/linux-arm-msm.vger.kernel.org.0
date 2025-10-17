Return-Path: <linux-arm-msm+bounces-77705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC92EBE70FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A0D44F389B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BFE26CE0F;
	Fri, 17 Oct 2025 08:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qj/wHkov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FEA26B098
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760688581; cv=none; b=AKwSdJVvXlrEyHKTlzY4NwdL9maZkIqHbLQWO0IzA571qzec9ZcAGR73h47VpROrUUoICFgfIZL2FVNk0KTERmPmDNaahmxEPhpFy+5Lb7FdEMMz468cBhF1P1xrtgVbvNAlDLdBmj5ChuFNvmcI423zA5Z/OMzZwbIU3gcHfek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760688581; c=relaxed/simple;
	bh=LNWrns5YhKuMQe54rxHgfd2FWlF/9ht7hOYxgPyf8OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkTl7SyzDNBqUMEKHrZTNZcFNU8y/WcYaSrdanG31I3YyrciiucmDtUSzRa4yVKRM2/o6HZDyUVMgq6eOo6oz5Mn+YQRTL2rGORv4+OnUemkXUMUH5/cnI0YrGhS9WZG2qZY2ABkSkUCx4yvuh65BbMmRn3d4paDm1RhPM7VcEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qj/wHkov; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLRLC016175
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPz2SW5yw+njOwx1gSPLkLuFrcs6TqRr7O65/b4k2Kk=; b=Qj/wHkovQgn0aqLs
	ER3PzqkN7inUYLnBdXm+t46oBUht4q1t/a8ssfezM1LoHadHe8xDPN2ac2vCXLOq
	W6pTc0XYGbGsueYpaIgEG9hwyp1yoz0R9WkLhFwql3HfvmeKDfmkuBCiQRkbFzdw
	x77v8z47xo/+Ts10bzhB//qz8em3OcVNg9WLft1bbg/QZibNGW0P7QAUHaWeqed9
	gPt27I3cr8FIdxyGdCQ4rCEsE5eqgG3NymQYXDtmyJ0VF/YJD9nZU9gl/OY+urD/
	3BxnA92ZIS0OugTs8tTn9UT+j2sC9/uf/ZRu/MsHfe/uyub0mdQbEmhMZjvVkQvK
	bkQ65Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5ujvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:09:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7f5798303b3so5600906d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760688577; x=1761293377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPz2SW5yw+njOwx1gSPLkLuFrcs6TqRr7O65/b4k2Kk=;
        b=wBQFny1LnSFWOlC24FM5IbHCNNbct4Fgr2MzQ6eO94ckZcz2eL7Mx6mWrwJbJjyHEw
         Bg3vcAXoaiG5O9o3l72GSEoDEx/shBGbIqNfM/4qgEO80A61IyqxM0KzT4o9Kkn78O0t
         y8Tj1E4/DYFu8bj5LJF1bOW8kqKuWFibPeIrZ84Ug7GZOTn+E39vLvbJmQX55HswagD/
         hxTd/Vg/IlhONeX70PkqsOZbR7thM7YSQCQ9KeX7jSAe9i9zWk6725g5+KxoRBvCmlsZ
         E42QNNuBQffxFa9KjDjpD3uJIM7IVF8GoW4V319KaAYAQQm2EkymY6EEUTcjLZRoI0uj
         cxHg==
X-Forwarded-Encrypted: i=1; AJvYcCUgAx4daGsq7XHkBbVKgaVniBoNrqpL3cd1X1yeMz7Wy+pfNzPdPMpsUHbWB5uago/DIs3VnUlktJ5/ulDk@vger.kernel.org
X-Gm-Message-State: AOJu0YwHfdKPPb/fxrnTZ4gN1OtCCngKbimx2UmKCrQen8AewmeKtRCQ
	j+hutSaLKYgsdkV6ajWPpjasloDCBWUNcDw123EzJCagKI4B6516qY78RnI+xB+4rfLgPtWfhFO
	8HNIUNO8nrgOO6VUwV+8C5R/GqtH+sk+o8C0h1VNqBYuAjOtgqHqHLopngwQIS19/5rgD
X-Gm-Gg: ASbGncuxqMGdphJ0N1jAy9dBr9kHkRmZGQyt+ZGb66aoaOLU0N9YMZAThsSzzNmHGVa
	IksD6XOfZxM6cOsQxSO5FC43bqoKLphKkFtIRNzk2saSyWtXgzaq0AFJr2+g/5dYOwU8aZXC6UV
	lOrGs5wvje3HIkVMNFgASIOtA/9/sKyp2UGlLMnSTuTrI9mh5iokH27W0aOFZh/3/YMmcY86bYR
	UdW/fRvi6NlYIBbC6T4AZTGXteGZm+QahW8ak50hPL5saX6T/X975x9eN8BueVCko/pBWzPxTrQ
	SF0tr7BOh6ARaBbbqgr77npTUlvo36f06VUnBhoH3cNaaqKyP5AXKZ8hp+3rPiK7YvIpBcbqQdq
	KvRlADtYQZvMYLgSk/aG7UnTKyr7Ie54KxA+38Bc3oSPhy2MJeNVRpe2P
X-Received: by 2002:ad4:5c4b:0:b0:87c:cec:70c8 with SMTP id 6a1803df08f44-87c2068e2f2mr26023646d6.7.1760688576564;
        Fri, 17 Oct 2025 01:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRldwlmoIjqUWs+B70gDTcINWBj5aJRWNo73VY7mhDe+mTNIb2HTahu2VSMQY0UuncTX+YHQ==
X-Received: by 2002:ad4:5c4b:0:b0:87c:cec:70c8 with SMTP id 6a1803df08f44-87c2068e2f2mr26023486d6.7.1760688576165;
        Fri, 17 Oct 2025 01:09:36 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c0c6cc6bdsm3188044a12.8.2025.10.17.01.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 01:09:35 -0700 (PDT)
Message-ID: <cb973808-005e-4920-a35b-3f02a402a78b@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 10:09:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: enable pwm rgb leds
To: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
References: <20251017-add-rgb-led-for-hamoa-iot-evk-v1-1-6df8c109da57@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-add-rgb-led-for-hamoa-iot-evk-v1-1-6df8c109da57@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 69Cp5odqSrDXEVx7rbTUe9Fk5a7V_Ao5
X-Proofpoint-ORIG-GUID: 69Cp5odqSrDXEVx7rbTUe9Fk5a7V_Ao5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX1y3GzgfV0djX
 vfeJk3dM6sQQCKKa9E8BmeKDYq/nWGGCgGJTATwFLmV9GqJajhdh7FQO1ZLAvYX9+dhney1fcOL
 k4+Fh8ei9iq3eMoEPvRX2hmLB9ZVHkvq7GsNXEjLP4w5ULBpr9VEOcQZT9FGqRmO+x87s4EQhls
 JiNxGZdszhnB1D5Sn/8aKtaz7imt9LTebB7ZEkc9F4ChOHVYlL5LPxCBm65EZekKUmYjl22tFdk
 ETdZZ/gnv+c0yE61/HpwQWJbYrTrC9jvyY9zatP8TVhSnN1Q0Ubv0r6t7Nq48DRPZEtvDIeHu/5
 mT4vmOUIrS6ozgRKHjvf8R1Oy3s6iOm1GO7VBo5c4WoJcYEk9UQ/0jiHSu4m9pNQHDk5QrDnydb
 Sc9/VhCtZPSHFHeoVHB3Bz0NpLApIw==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f1f9c1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=faPRZvVwotbPnOTzeFAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

On 10/17/25 10:06 AM, Tingguo Cheng wrote:
> Add red, green and blue LED channels for the RGB device connected to
> PMC8380C PWM-LED pins.
> 
> Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> ---

Just to make sure, is this a "multicolor LED" consisting of 3 ones,
and *not* three LEDs that are supposed to communicate different
functions (i.e. network, power, disk i/o)?

Konrad

