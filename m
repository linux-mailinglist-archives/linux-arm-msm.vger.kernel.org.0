Return-Path: <linux-arm-msm+bounces-82475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A15CC6E001
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 11:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D05804F717E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0471299959;
	Wed, 19 Nov 2025 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fof5NDdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEsZhNAv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485D6328B7F
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 10:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763547911; cv=none; b=aP31rRLFYCgmWmougHqJ8sJnfEe5ViYk6m789w4YlWbPElZk737WaeoeUAhpftQ7EXkwRdLY4n3K6VmdF2THu/M/KogYhMDb5rNokpwcfR/13UMQyUU2dzflVfV1Jai6y4eBsdX7OG4j2stWklZ0NwUqAqToyBfv8w6rOITP0KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763547911; c=relaxed/simple;
	bh=ym5N+NqN9gnH0rLWboUPWanOhy/OGcrXxbUH557pk40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CP46hgR7g+750z8P2rL4N3MjrAjZT3In13B+gfxPJdAnXNVsbcmWnaKiN7MqkOUHrwm9N0CgLZ86oi9B/52OK4c7Nn35U0fS00h0hjOFhfhs3XQ6sEpz4iDeIJvHwi8DJdFHzsbaLHb+msJQjYdABjyk2gUIR0bsqGh2v1Pl8uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fof5NDdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEsZhNAv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ2v8PZ3165141
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 10:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zOYGYPzsas4Ye8z2cQQ9l8Pj
	B0eBVtk3ZyKewT1i9Bs=; b=Fof5NDdjJ0KAkI/R/4P9SmQR0qc0lEVETgqcjn5c
	nV8xRAFzJHur+rao4pN9SCfY9RV7TuyXdSydgfSi+ToQjUvvKGVLBOBWhr+r8MVw
	MKZZ+HkxT607IBE+1vEgKckcRNFZunOFlG0ViBjfuEiWeH/FeKiXUwED7Bz86CpC
	njtpRHPwcQ+/x0pXCyGQgtDwodn1fXIixp3yxhrCCdUsxUCY75SO0/PNSR1crrzt
	d7SVpxA/dWEhBF84/FTcIwU3WuorXBEd84JWiOiFAkyXY9dl7yMPjcoj9ewu42UY
	r+uR+o+1pXbK43Afo9XewEcAkVKa3FyFjvQ/6o/2svuBXg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agvqgttnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 10:25:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb6a94873so145976301cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 02:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763547908; x=1764152708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zOYGYPzsas4Ye8z2cQQ9l8PjB0eBVtk3ZyKewT1i9Bs=;
        b=XEsZhNAvhkB7O04DKKtqiuzig5t/xjRTrlroi7ybas7vG2y8dPCar6ji0/Svml/NjE
         zWRbDpSuwbXsFG3tgPX33+AYyC1xbDz6vpTY8peGvoXJePfmgBVC+7ZdBFbwRjAndwue
         tlFRVFkHwuRXKLDXFQPW5n6uty6l00w90OVGIDEwpHYpoDP4bVM8wapNQOWzi6VOF04C
         CGhB/tjffcHtz1/Eoha+u7rR0UragoQt3o4Dnr95Szxn2LyrGrJ/4rrm0z7tRxH7Gcsu
         P+2tMEbPxYdRilpAb9WhNIcZShWlq6mnYa9ZUaaP5QsTKd5jchH1E1q7RN1XHq+ZL916
         XGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763547908; x=1764152708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOYGYPzsas4Ye8z2cQQ9l8PjB0eBVtk3ZyKewT1i9Bs=;
        b=MQatt6+A08H8r986rFjKXR1Ig5p+Y6D7ZuCrB9ySQzHCbeNYZfJ4azwqs3JUVzDiv7
         etrkN5SSnhMFiySg/bjr0O6aHLeVL2Ej9k+i99kncasZb04QasZ9RtgfBPbRp0VihWdP
         mm5iytMStOdnIcJmq9CdUA7MOlMO5lQ2jckb/7b6Uib8uJNeOwlKGFngOkrIp7fCZwzP
         Ih4nyhK2Y7DgMFJu59te2wTH4EK4GXBJjm0pBWjaYdXzTCI/4fVeST6CL8fi+raEmI4x
         7g4hnPpxvpmwBDYAFjcXkj5efdLX0eEW91529HL5mfTfvi8F4C6IzUANy4e5sulxhc3o
         symw==
X-Forwarded-Encrypted: i=1; AJvYcCUzpFi7wxPE2Gwj8ZE+oghhN26qIDRI4CQfOndHxjOAQQ2mtU2utZcNNhDwrcjN1ERd9rp5RQJAwDksT+JN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl8tg5rIPeh1YoDqnpV8ObuHK2SNcj9KgsxA4IZjbQgEQIF7+U
	GZ2tyDRmnM0Wa6coS9IIDYnnWZiDU5hRr3TPPjH8hiCbnFjcmRbh0iGJXbfsaqRuDk500he1HMe
	Ub/yp+6j4IlpAVQV1D4oN0QgGq056fsjWarEDkslYZC8j99gk2J4VP8Gc/HohxS3CKd6Enpj9jh
	QI
X-Gm-Gg: ASbGncvJ+30uin/KA5yjA4IlgWf9HNj/WcoJtRQA7OapzjJgVEfeGhNTFL6kQoWEehp
	d15Qc4yRZTw5GrhHRiGFs09IHlO7OFlpDJ6h6cBhoDds1s51J/2xM8xP4XGZXKnfIuwMum45MY5
	2z1yH4XCTsN57kLtFElLHbHo059AbYcW6q6zfocbvaC8mpDP7kTmfKAB+VsfqO+bdD4Ut/oyDTj
	RQam5SfDcuXEWaVN0dL4eqFG9PRSazG5/5nmS1kVfvLKWdr4xTWeD5eBdrDSwOVdzfo4gNuSwfS
	tMxj8Ifn/QnMp35Fd2m7mVSAavF6v7IVBHaPV4V5/Zue2mdNTYreGxM60fSLdt5g4Jq2jReRTKA
	iAwuXV4WYBPGqiMYDo85b+K5ob8V9SW0LW6xqBs7E8QskPVlKKriXS13ckYk5l5ZHnLEbUJAmiN
	bYRh7b0T8S6GLx36eCf1g80l0=
X-Received: by 2002:a05:622a:1787:b0:4ed:dcf0:6c42 with SMTP id d75a77b69052e-4edf20ed317mr240567801cf.40.1763547908091;
        Wed, 19 Nov 2025 02:25:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMvBRUVJt9SF9A31IZ5DavkEhnPNzijPYUPOqFxcOXgDWtfwRwMxFg48oSC74HCwIeYqiIbA==
X-Received: by 2002:a05:622a:1787:b0:4ed:dcf0:6c42 with SMTP id d75a77b69052e-4edf20ed317mr240567541cf.40.1763547907688;
        Wed, 19 Nov 2025 02:25:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce1abf9sm38262851fa.19.2025.11.19.02.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 02:25:06 -0800 (PST)
Date: Wed, 19 Nov 2025 12:25:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
Message-ID: <ug4n5dpsg5v5jwhwmjaktvydhtfx6gagoum6lul2a27h44xexz@uvdu6ma42wei>
References: <20251118130814.3554333-1-tessolveupstream@gmail.com>
 <20251118130814.3554333-3-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118130814.3554333-3-tessolveupstream@gmail.com>
X-Proofpoint-ORIG-GUID: x7OsyuCOB-VnH7E4WhDsXA3fiWuvs3BV
X-Proofpoint-GUID: x7OsyuCOB-VnH7E4WhDsXA3fiWuvs3BV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA4MSBTYWx0ZWRfX0ObGd/MUW3+K
 VYPdzbc40GIkz8Yn5M9OQ0DGqbyaLe4QoEgc+1kl4VNEGf+7sWwg1kLn4RNVhl7vfcjpPdErxGn
 0smVU8wC94bsDVlqliatSRFXtIOq8xfW/ha3v1ZiIrGW+PFUAciv63xuViycrZppvI70OrCtdBA
 nJjtnGk2/vXaGMJgcayIQyRVQCV4Upmh+GEiom2I7KEXmluC0s9nANSve4XWMkS54Pw/0bB/NF6
 vCUj+y1Qe5pXhH9WwwfhiIH2ofJFyC+AOuSdAvKWHdVCnyQjlaNAq3uSMYORQM2g1P9SGnM64ht
 8N2uQfa3Oepfh0o4Kv0BTlmE+515vNBCYWcvbD+mKrPX+xWOBVtXCh5hnPlXm7r5TJ6SW/CO4VG
 prGFK80PyK3caFl6if8+e1U3VwqyNg==
X-Authority-Analysis: v=2.4 cv=LMJrgZW9 c=1 sm=1 tr=0 ts=691d9b05 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=6q-ckXwDscysDfU1ynwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190081

On Tue, Nov 18, 2025 at 06:38:14PM +0530, Sudarshan Shetty wrote:
> Add the device tree for the QCS615-based Talos EVK platform. The
> platform is composed of a System-on-Module following the SMARC
> standard, and a Carrier Board.
> 
> The Carrier Board supports several display configurations, HDMI and
> LVDS. Both configurations use the same base hardware, with the display
> selection controlled by a DIP switch.
> 
> To avoid duplication, use an include file, talos-evk-cb.dtsi, which
> defines the interfaces and peripherals common to both display
> variants. Two additional DTs (e.g. talos-evk and talos-evk-lvds)
> can describe the selected display configuration.
> 
> The initial device tree includes support for:
> - CPU and memory
> - UART
> - GPIOs
> - Regulators
> - PMIC
> - Early console
> - AT24MAC602 EEPROM
> - MCP2515 SPI to CAN
> - ADV7535 DSI-to-HDMI bridge
> - DisplayPort interface

You got the question for v6, responded there but didn't update commit
message. What is not enabled here? E.g. why isn't venus enabled?

> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi  |  56 +++
>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 447 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/talos-evk.dts      |  94 ++++
>  4 files changed, 598 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> 

-- 
With best wishes
Dmitry

