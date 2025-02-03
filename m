Return-Path: <linux-arm-msm+bounces-46760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F606A25B85
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7C51167A5D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFE6205AD8;
	Mon,  3 Feb 2025 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmNuGbpu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9493205AAC
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590804; cv=none; b=IX++n9V8eKf7gNGlJoPz65UKk0yZI6yY2fZ+N0tn6EU4qAFppDQnyvfLC7mE7rl+59/lAT4rP2Ls+zvmAOe6Di4Mg+Soasur1u2PAZrzKXlWjZPgCieED3MNAF1Z0knnkqrgwh/hHBezsTQHz0uLFs8QK1gMdifO06nXJQZCMjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590804; c=relaxed/simple;
	bh=BDaTRPRB1+xDmux3TdJKzmueBfcUfMxtJ+8A1GnOBwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HwGdQtEvcg8R+mNZj1Wq+8kDx++n39YXBWkzyqD9GSDfQ23YrUxZf5Vw3qaUZ3unjUnl5AahE6A+/EUSQ8k90/InkNqENUmnM/+ox1Ohg3VXTlAVFMyRlcn4iB3MGP8bQo8UOGrQtbkhRMkuyMkfNI9eYLbAO25dB1wqif23lTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmNuGbpu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513BESB6002245
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Feb 2025 13:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1my9vn2BynZGg5rPWbUB5/Z05wI52PF0CqTy6aaA3E0=; b=AmNuGbpuWXWCJK2V
	7udmnfL2FzWril8doULY1ShjJcg94lhhLnQBwrSPNMBhromsJZ7JX9YQO+Y91qIx
	idVVvRDpMFgo6AMJWmkEDgnI/flO2NeAfFQ4GCr2/G8uvbU7EbnY9N4/A0ErpkJS
	DMieKKwaG9YZuPQ9s6tUtu760xePTO+YD3sUcgSVWHjZSmKccCwnjdk8k1DGV9Vs
	HDsTwPBYaJ6T/Fh5LrB6RiXyjl69rTP/YEJbKGUYUbQ4z05iA51CdbKN/3IQSmEe
	hYWJV++FuBlRvpfMN1cAB6q7Snuw3h3kDdKb5ErM7YDL/BbzCWkMVYR9OfK5/9qP
	lTw3Dw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jvrkgh3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 13:53:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6f499dd80so30120485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 05:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590801; x=1739195601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1my9vn2BynZGg5rPWbUB5/Z05wI52PF0CqTy6aaA3E0=;
        b=TLmAPKC0F8oKiKDTZMeOdwYrPYImzvXzEhthuguLnBnz53H1MSG3N08uQVQJqpsd8Z
         UdWjYj9+Z1xRizZswdBK5T3TVdyXwQBtNoHp4RBiXIkts/g5k69hh1K4P6ry6fYty2NE
         uZDBpUuAlYQ9hvywvHIoRhUXhZWpvNICuIZ6cKS6P5DipHFp9PKIwYGnBz8jC4amFhYi
         uQm2d21wr0Q7TFd/XoRQiiKs5hWUUh431IlOHI7dim4PdtyYTzsJsJnyd6SKLbbQYVLB
         1VnBHN9XSui8yI5dKHDqc7w680RF4IPxmNb/PHd/A3PvoCpEb2UvOxincCa3bDZEStq7
         taWw==
X-Gm-Message-State: AOJu0Yx5CDWK/0ol0T2whQvF24ihoouUjAI3mi5EGcks2peDhZeShaiO
	ZE9wfy7M4+KS4t5uU4yU1SAZ1QKyhTb8vQnkvf6yA1IEAr7OkgH4AB2kYofx6cOOe0hHLDqnDEK
	fCv+GDxnM3C+OgOtRlvytSjlGw2zNypNP2mg7LxsYz8aa6uhd0/rLp/UlUpF//rwx
X-Gm-Gg: ASbGncubp8fwkw5PmaL5nGXrt/tWv4ePoNQkOHZppnI1TareWy0AvWlu5aovrvvubxG
	ukQ00fTC8tAsKzAUbnNd3iikj2mbotpwSE9BK6HFSdIsq+tcG8kOZLEYPhlFqvKpINZiNcnRkDM
	OJgXhLbSaeC74I2kqNqNZe3bL4N+jIfTiPWWQ5eAiWfWFkpWseQi0fq56SH9pi2oHhEAZ3kFjr0
	FVqxWJRFX8jGIrzr4i7bjVbgeYOUIlV0OnpxVc8fk2Mj8cICJyZCrooPGg5M4TRB6R/Cb4WXJ1U
	xDEfiZdxQl4dNe67qDjxY9xCE6SLZhzklSBSW34he7NN3Aj0I09JkbB+h5Q=
X-Received: by 2002:a05:620a:3197:b0:7bf:f916:faf1 with SMTP id af79cd13be357-7bffccc9225mr1263566685a.2.1738590800774;
        Mon, 03 Feb 2025 05:53:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoz4zJLV52R3SeV3FERp7sQHSO7BCfUwtoXieuP2UYa736qUJQrEWnCeNYRuw1lj4Hh2NZiA==
X-Received: by 2002:a05:620a:3197:b0:7bf:f916:faf1 with SMTP id af79cd13be357-7bffccc9225mr1263564485a.2.1738590800391;
        Mon, 03 Feb 2025 05:53:20 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d0feasm770707666b.52.2025.02.03.05.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:53:19 -0800 (PST)
Message-ID: <7778b91c-aa94-4010-89bc-5e86f78ae275@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:53:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs8300: add display dt nodes
 for MDSS, DPU, DisplayPort and eDP PHY
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com>
 <20250114-dts_qcs8300-v3-1-d114cc5e4af9@quicinc.com>
 <e66dd1b2-3257-448d-9c41-9be643652962@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e66dd1b2-3257-448d-9c41-9be643652962@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zJE2_Oyk5gpGFzKd6w_W6Gn9k7eWNldu
X-Proofpoint-GUID: zJE2_Oyk5gpGFzKd6w_W6Gn9k7eWNldu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0
 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=947
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030102

On 3.02.2025 2:43 PM, Konrad Dybcio wrote:
> On 14.01.2025 7:59 AM, Yongxing Mou wrote:
>> Add devicetree changes to enable MDSS display-subsystem,
>> display-controller(DPU), DisplayPort controller and eDP PHY for
>> Qualcomm QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Wrong copypasta, please use this one instead:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

