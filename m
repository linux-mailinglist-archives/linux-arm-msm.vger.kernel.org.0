Return-Path: <linux-arm-msm+bounces-86179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F95CD54EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:24:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D26D3006AB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0423E1FC0EA;
	Mon, 22 Dec 2025 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUcYiTkj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bimtCLx/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B98522B5AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766395380; cv=none; b=R/IGK4a32rFXDwPMGuKw1lbkSnyfLWlpD7oERZ3CJjv/ksDDKR1QCUF11Wzg61d/yDSmrZF9C29H6DhpELcrm4atJtP2IK2dT+FyN8nX+d+4XYafNVXUn28xil/l7LSC2OLyoa55kKdYFCrmmxb5NN27NukWl39UaL7a1eMhV5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766395380; c=relaxed/simple;
	bh=7yJuxATnyLkfkoLPxrmVGI6MM5nwXmTgqXnq7zpO/1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/kr98K8Dxyg6sfXTIJZjPR6AlANNS6OpICDNM9yFvh4F/n9GaY9L3LSXNxW2XJdOXNjI852Bg2UfESmVT5pspO3HsMz2TaxhH2mYEFOVyvo+pld7V/RB5aVxYLSg8/jAsoNcpD1dWSkahPLYRvJmQQBa42cvONWGG2jdFniPxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUcYiTkj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bimtCLx/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8IYcQ444779
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aREKUxVq6sS5MOhED3wHnKMJ
	OF+zY6ruztOajYpelyM=; b=WUcYiTkjxpAR1gRLAl9Gc1ApII4k3ZxrsyaXBxog
	PtVJ15w7taspKfe+RDjPujjlAeDxLaBR9RLKpKFdoduzoLB47bmniUL9DLT2PnYy
	WJyBQgy/8FZ3kWVqdfuY38DJQFWI6MZ/lsLIzPDT510XT7p1W5DhhIy2QAQHfJY3
	tx1S+xPYZ+6kXB3zizSkHTIZYShcr1qkQSMauoTNP8oWOfV9/sChzWyJ5I8MYg8T
	pxNCUvibI6HIRNzGXUzMmW9prDPMVDaT5vJPHDJ7/wD1tW/oO5rHEYXnmfnITGVQ
	5MXQQe07b5SObQ/dfTx1KwN9AolH3lm2ECGhXWL9aNMyfw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mubmeuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:22:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8823f4666abso92177806d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766395378; x=1767000178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aREKUxVq6sS5MOhED3wHnKMJOF+zY6ruztOajYpelyM=;
        b=bimtCLx/IHbjgBdtltrkfGvvLgHadGJy6dArHq2ITsl6RPm8vCafXje5ORNcAcDLrL
         L/04o6jMquphDyBoTmIgjvZIWPfvw2UWsCZkSbTBF9iPtf2a/GFTBx7RFVTY1CynSO+K
         mySl9Q6rjDn8C7XQRKjudX1uoJam/nsCVZWzk5yzlxlIZoSC1MYzDEMlR+UPkechA++q
         6L3xZt1ag7zIqg82ppQDBNrNSd0SpTIE6O8uHuGBSSEe+pBFas8iii0IVOZSbpEI7wOV
         YcCGKMJjiLdyj5MSOAeylwCA/gQdJuHH3T0aWLqxHyY5q3QDWTb6SNr2FVPrZ/FJduLv
         Oe+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766395378; x=1767000178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aREKUxVq6sS5MOhED3wHnKMJOF+zY6ruztOajYpelyM=;
        b=JJ212fBOAZWfLC12Z6LcnRkcLSsiud1j/JeXCBA+KSV3Nk987wN5DZi6TaX4mQAOQ2
         kBsjLIX/rrCxbYDvjiQ/Ec1SYvjlsywDS/8um8rpkj3C6x7kXb/b9bF8NWK+7dY1adui
         7t2Onr9JV9mGm6rJs6fc1zmsNagsRlkNvsp5DYDbDvs29AFCQ/h///FebSiO2fGtPc28
         iBQIm04krsar9/EG/rGdx2QT9w9YmI3/0/KJQDazEkCr7zhohivXaSqoAGWSdlQz1x07
         toNtspVqbrlwluxJbtuDgLmOZTashxfttI2kvU2IIrdNy0ibKMNGYd2FCY80mye2b+Vb
         KoJg==
X-Forwarded-Encrypted: i=1; AJvYcCVHj4zJlWNkiuRCqeHB5ErMY2a5VOBFkmMqZPhQ60ADxQSbGbsKHYvF5jDPH2TeDjLZy2ZE6J3yDyshgSIK@vger.kernel.org
X-Gm-Message-State: AOJu0YyEw6QUNzS16pMb2SBhreHS9oLve0PMZwCG5OuVTgAudDSqjEbK
	VqX1Aaj8keWBVfPkzp1n+6+6sQPLHj6oztXmo7cRsTifLPZRGloBLVu9geenu/j0kU1nC+Z8u3i
	8zffbSMzPaFl5hZPN02e6twsyrLIJFpplRlozMzOm4WeXUN34o5dRYa3wA0dBRQVNYDhr
X-Gm-Gg: AY/fxX4dZbry4/OwMXcqs8Gwpzfzgec6flnjn2RiCQ3N8XwDv10LyPx9rP8m838bSMv
	99wNaZlFw832CK1ynXNx6cETlultJkwatsYS4SGXvlrf4Xun54KWWMO0U8BWmJzqWpkj+BhdOV0
	8cntAy7Gyuf6ay/iNmgVrTrC51Fb9VAtYRfKKe3BzzUaYXj01crIfxG1szdaf8AMFCRYNvsgkGB
	wpN9Co0cHNMrPkMSrnaRFCctDOWo5DPYYdzlaccGykvuHGPPgOMVg6WBOHxaib25xdZWLgXOyVl
	iu5V11k1uaiRdcADpnaIkT4IM0NjevsW+gkbKXOrmSVsyev7HWPi414GCWgFDJcl0rEV+I71ZbA
	nVi4ZlyKDM3/n4w6c9mvSrqZ5sYWk5l1wvPQO2HsIhNEb5oZdVeUCRirn12a8bCpk3LAtnuD9kc
	HlIjesqJeN0FRhwZw/iOBRzkM=
X-Received: by 2002:a05:6214:3da0:b0:88f:a4a1:bc96 with SMTP id 6a1803df08f44-88fa4b1000amr79460106d6.1.1766395377768;
        Mon, 22 Dec 2025 01:22:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLDuXOV41EBm8nviqCiSFnHZG+qYsOLuSxbAgaqw4VJmP/J18EWVd0wHz5C0Y2gmgf3WN9Lg==
X-Received: by 2002:a05:6214:3da0:b0:88f:a4a1:bc96 with SMTP id 6a1803df08f44-88fa4b1000amr79459966d6.1.1766395377317;
        Mon, 22 Dec 2025 01:22:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812264c8e9sm24494321fa.33.2025.12.22.01.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 01:22:56 -0800 (PST)
Date: Mon, 22 Dec 2025 11:22:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
Message-ID: <woqdn6gvlkgux6nuixpcwmcqkl7siqajgwrvd4x5cuuw3nlrpp@vmq63mgudnoa>
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-4-yijie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222060335.3485729-4-yijie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NCBTYWx0ZWRfX9eSMcqKTSV6Y
 qDWeoIg44Jzdevlvatb5V1vLXcv4wMsgeDELMS1cwhIa5IN9exmNUhyTR1CMwN9p+hxrqNCpQe5
 pt8WgqyB6WgHXIBcJm0hfOjgX+UD4fhvOQ3klAR3mbCpLRGR4OZq6KBPg0AYoDvvqYetNUGbBF/
 rQm8kxuQWzxnS6mjuMN6n2k3xglVICElps61fiO7t9dB5vdmGhJgvkka1SC5Q9xVnCaorE4jetU
 4kp06D8Cv5bD7QC10aTvA5Sp0rL3qm0Wy8I0Qpo56XLiAN7uXieBhTIfP5viwlllb0qNbhyHTrr
 pG8SE7l9TnoiZOnDDH/eB21w1OMp5NTIwHSahrp+znT7C7uui6wIhzdTtmEll05fMQ9o2dDoIzW
 YrCn+Nv00YbtEtaHlNmIzCBbRZWkXNy61sviz1HMH6RbnLxGjeDIJzUPV48LK44NbKrqmVDN2SZ
 4Bx617nlQyPbDf3Hc7Q==
X-Proofpoint-GUID: rIjrMdbfnOqK9qtEBHLY2pCtCnwmmvel
X-Proofpoint-ORIG-GUID: rIjrMdbfnOqK9qtEBHLY2pCtCnwmmvel
X-Authority-Analysis: v=2.4 cv=KYbfcAYD c=1 sm=1 tr=0 ts=69490df2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tQhhYgK4JYXdd8RpFbQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220084

On Mon, Dec 22, 2025 at 02:03:29PM +0800, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
> the Purwa IoT SoM and a carrier board. Together, they form a complete
> embedded system capable of booting to UART.
> 
> PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
> Meanwhile, USB0 bypasses the SBU selector FSUSB42. As a result, the glink
> topology differs from that of HAMOA-IOT-EVK.
> 
> Make the following peripherals on the carrier board enabled:
> - UART
> - On-board regulators
> - Regulators on the SOM
> - PMIC GLINK
> - USB0 through USB6 and their PHYs
> - Embedded USB (EUSB) repeaters
> - USB Type-C mux
> - PCIe6a and its PHY
> - PCIe4 and its PHY
> - Reserved memory regions
> - Pinctrl
> - NVMe
> - ADSP, CDSP
> - WLAN, Bluetooth (M.2 interface)
> - USB DisplayPorts
> - Graphic
> - Audio
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts  | 100 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi |  11 +++
>  3 files changed, 112 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> 

> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1e80100/gen71500_zap.mbn";

This wasn't tested.

> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

