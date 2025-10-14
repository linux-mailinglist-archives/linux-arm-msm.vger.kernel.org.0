Return-Path: <linux-arm-msm+bounces-77143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D6DBD8A61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C40483AB794
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7843F2E7BC0;
	Tue, 14 Oct 2025 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEOJVKLG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD3C19E97F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436105; cv=none; b=uvrW3PXEHaM8gSMG2UdStTdn/dgnFTZe+DrX2Yhb55fxEICpvyspOGY9rJYdTGeyX8Jn8U36aAxzNws7gruoKyDsn3fdhwH5FnZjN6GvoaI0H4IXoBt6WeXWY8ovm+hUlyewrK/5ORWioxkol5Y7km0jUDXvJEDIuWgQOQ3ZPdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436105; c=relaxed/simple;
	bh=D3JssWtrvIhSzBbDco8w9yHj80wIIo1ixaviq+V/bGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QxqOJqzBcPu5jMphK7Id9RX8gYF2nA8YyxpNH21xXl1OXyogAyAB5Y/Li5dVnwfPKV5f33nbO/eNvBqBvapmSssapc57NA79/2LZXUILznnjvlTicPswAKJCiT/5S9WYAlfe7bNTXyDi6yOyZTlwRG5d/LalzHAOy/JhLgHaVxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEOJVKLG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87LUl025916
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D3JssWtrvIhSzBbDco8w9yHj80wIIo1ixaviq+V/bGw=; b=BEOJVKLGT5h1eESr
	G2O9Wpjvvw6V8dnmnR3mAwWPSVJ949z9s/j/Ip3AzvILr2noC6K+7zFgashQmOs2
	aWIjkBOp+OMthuHfiQ4xpbkBw5Gim7/ei68Gx7BT0b6lWcxt9dOhWGZIUoeYaxLg
	wjlH4gyJHUngvsRhJcKHDrCi9v5o8dDTrvQlSGPoYoPbxy7IYfDX0TCSzQycYypt
	enidv5hcBWl46qGrI/DD263X5zKdn7KkirkdoRo+wESw3nNv5PeTtHdjDfgmW4vq
	Bv0dV00kk6nCt8f8qEZnuw9GxEonvXO2cvN/QZ6GslFmhr/BMgJktrdm1FM/K1A5
	+/RLJQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfyvv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:01:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5d3fd09aa9eso876315137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 03:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760436102; x=1761040902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3JssWtrvIhSzBbDco8w9yHj80wIIo1ixaviq+V/bGw=;
        b=qiUfwJlN9f1kqlwsDwv9TQa4/N1vzkAQXweM7khyyUqV+LdBTzb3qJyFEwH7sDa5k2
         /pLImW65u1QualxQWbJ2fPTZnONhUHboUUeV7ZQ4xt7yaNhNzR/XYr5w5y3bgLLQjgrm
         o8Wa6VLnfXoBmqWixfiY0T+jhxSdAV0SiOZNzNOhyadNPG22X2uz7M3PUt1L9wcacahO
         INRlG+EK2eooMIKkKakL1yvFh6jDYrRdnu4pGBvOHpJBZ1knYbBZiaOZtwNSrHggfYmO
         wJTP5ZAJpt/4V4dkLyoKLebrVtvqTaYSLSgmyi2AjGNZaiMj6W8qadYuOhEhiKcUMJLC
         ZiKg==
X-Gm-Message-State: AOJu0YxH+auvQlTN+fD+SftZq3L+CttHjDG5xT+uwMif9uElIVFhRoKO
	SQUnHUlftRAwr6LF/mWzc+z77G8Hz9gHa5DRw6WAGEhqkgQPNr3eeOifs9lSS9PLjfXSIfJRJzn
	ps0DbbiGEPQ70xNbf5uhePkZxZl4XDDmuJZ79zqKHJL7lGaXy3YxXxNmwGPRINlRSmC6D
X-Gm-Gg: ASbGncu39gDoQpEGPeghdszdGmrodBbvqU/2OOSjgdxEmT8OJUDRz4tv+RfgZMzQFCk
	pzcjQCWmkTvZPTWyChpd9DCh8dMG9O6Vh+6JcsLeRJgX/k8HBKefMhSHWe4Ye/lHWO+k7sk2eHM
	wujvki0j7ZbFgAs73h2yofttNLBgLfHk4k1kLyWn1Fk7CYHb9nrePLEpWg5kkGpTgIDCShFGDsU
	T15xoRyIt3HrvWaQDSpb09mrXJmLNIqTrTPKbcV2KivmKQgg4rR5t97J72Tl5Cff43iht1dc7Lq
	2y4Il5TdONALYcw7alLNmZZJdlhoSdzZDoqAAtmYzApoR8VS84UaRYAU1jcOcjJkYLG2+H7zY1g
	Li2ooSfhg+zQaZToWOwNy4g==
X-Received: by 2002:a05:6122:2a92:b0:554:fdff:f3ba with SMTP id 71dfb90a1353d-554fdffffbdmr659641e0c.2.1760436101838;
        Tue, 14 Oct 2025 03:01:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTz9yawJiPf7YIyriQbzNgRPBm+dfvbCiuWFvtl/QW91dwMWxpX+kI9Ls3+XCel3PRAPzGHw==
X-Received: by 2002:a05:6122:2a92:b0:554:fdff:f3ba with SMTP id 71dfb90a1353d-554fdffffbdmr659621e0c.2.1760436101312;
        Tue, 14 Oct 2025 03:01:41 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d9526885sm1120614566b.84.2025.10.14.03.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 03:01:40 -0700 (PDT)
Message-ID: <e114504e-4bdd-46b9-b708-8eebc3075163@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 12:01:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: r0q: add touchscreen support
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251014044135.177210-1-ghatto404@gmail.com>
 <20251014044135.177210-4-ghatto404@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014044135.177210-4-ghatto404@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX0Ckj1m8Yn6i2
 V3Ftaje+00+vhorTQOYaLloP2nSU/kX8YPy81q/jLyRWwheCWrvMHV1xMV0GxO40AyhnshNs7SC
 A8PNYlp7sztBo89ELCsYpcH5vnT2rdkH8hJBt5eijdmUxSJzAlA4VY2A+ay73ZZLe5OGybKDMC8
 NLjzD73hxFLMoPVErLtU6cHhrbz2iEMvg4uQ42xC2qAFSArir54BbjvUqd4fkUG5ahUC6RxnkaM
 IR8+BJvUocTFR31JtPjLnXYUcqR4U4IP2mejC057ROZw4MSTx13blSAwu1JswnXy8TSoO9k4W/G
 MNanOr6ZrI/r/VfOVcksD2hTN+XexfoatgD3YsnjKyJ+ht4bwol5YsU8jRCqcJBcdOvWN048lzc
 t7zHOaGZdFALbpQgbpoKmb51PLHOMg==
X-Proofpoint-GUID: gNo7wa7B25tnWGmpChjpWS_WiXGdk_JY
X-Proofpoint-ORIG-GUID: gNo7wa7B25tnWGmpChjpWS_WiXGdk_JY
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ee1f87 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dCpwloqO8bWZMPXPVoYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

On 10/14/25 6:41 AM, Eric Gonçalves wrote:
> Enable the ST-Microelectronics FTS2BA61Y touchscreen. This patch
> depends on "Input: add support for the STM FTS2BA61Y touchscreen".

The second sentence doesn't really make sense to be included in
the git log

> The device has an issue where SPI 8 (the bus which the touchscreen is
> connected to) is not working properly right now, so
> spi-gpio is used instead.

Some Samsung devices used to use spi/i2c-gpio intentionally, also
on downstream. I'm assuming this isn't the case for r0q.

Did you enable gpi_dma1, qupv3_id_1 before spi8, when testing
that? I don't see any obvious errors in the dt that would cause
problems

Konrad

