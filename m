Return-Path: <linux-arm-msm+bounces-72793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C8EB4FE93
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFF365E2151
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4213C2264A8;
	Tue,  9 Sep 2025 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VPx1l0T9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39924238C0A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 14:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426570; cv=none; b=cigVRLGnTzx9RecCmGT75Lo506qb8hjcTqPZvrDK4PPsXNSLW/1ZhN2MxvftdoTcJG3ejXRyp1j8G6LalAFRu9DUVKfJJeVzxKhZGsMMUli+9k9h4w6gGRB+Ao3tsvBivwVeoW8vB+knUVXPX2ys9V0ucb9Vv2qZtekTu1CVWxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426570; c=relaxed/simple;
	bh=bJDPOaYhrJgnzTxZIu8POOipEZb0RjnC1CgvuoSxu2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/hsjNnD7LKqLGJ5TUXBMGtVVl/tPtO0fgjDb1RlEuojt8t4ilwlZvYSXORgJP2D+vbnxBy21XSVTfvM9MblNxmFc5tgheU/vsbJKKfbuNTW2kMuSBZqMdPJEYRZl/+w0NsHPqCn/x+XyzSrH+qmTJNXXpNXNGGOg5Z1vKoL430=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VPx1l0T9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LS2J030484
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 14:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JOw1z5sVNtTfRj+xa1tk7uDf
	0N4y0ILLz8O38jaB7uA=; b=VPx1l0T9twFG4Y6p7RRugzzpYWBNQvZ6uEzklj0o
	1uXohYCkqo6UcclKrJUJGfsFq7n9Cd4ILY2cA5oxMAJS6jka1WvZG7qJ8tSJUsIH
	V/uV1ctoA1tsXSOcpbBR4UFVqQTGiOjz5e7MLdcLILHDwOt6VVVmOLUS5v4TL/Lc
	xAvwNKuHN1kRr/wvoTvJYSZGf2n1Q/9kmCmWxnfC1bzsZwbBYopIFJwyQyclsGg9
	OheTG48O8tJircTj2wlOSz40jrdtHfp0Gga9YauaFjQ/+dcQ0tA6x3/YrDQxsHS7
	/hFS5kWPhfMbjidsN1yDsceOiRd67eIsUm6fvhw0f7MTpA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j8han-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 14:02:47 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-8920b261104so6532539241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 07:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426566; x=1758031366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOw1z5sVNtTfRj+xa1tk7uDf0N4y0ILLz8O38jaB7uA=;
        b=Wu4Esv3YLZCj3dAg1jd9YaqslXULXpuhGBTQpucqT3V6NBVIFN86brEFemOn5De+lz
         CKRWORIvVEyEhum9iM8mwQ95gIkmM4sNuZPzKRGgPMOk8byxzWhxeM/LHNGW83lEPluq
         zVNCVUZYFwAfb7hikd8WBT9ZWqkhBJnd/ynnFo+Tgm/xKwGHjWxsfqETRdK/76q35bq7
         xOsNNISELuwtJG1RoIK/Mjn8AmrUx+umiuw808+7gwCTJe47NQfWzHu2yAs4bKFWtIda
         Cifc6PglM1MW15Q8X/Igxz3xSOTtPNPeRQTFJMKx0rTa1eC4rRcYWMz+K1PBp5Tq4f/p
         tY/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMooHnGv/htzoELwIK7E/vf+1vvp3xnIXOwQD8BM7jzc8UUcaXWKV+wWSAbxyNW91gGDHQfmvJjobr6O0d@vger.kernel.org
X-Gm-Message-State: AOJu0YwKPt0tCeMEwgbZBFU1UIPppp95/n91iQKuwj7h++B7mi6ScqKu
	6HzqCOPlXf4dGikECnn+B0BMsqfDSRPQm10U5I8boqSSxvLEkoOGdYZv228R19+eBX24Hg5EdsU
	5ecQlKFw42x466DjN90fVJ47ehGs00Ldoijkpfo7rK6FFYtcT4XEuCQF+1+Rq5BrXpzuK
X-Gm-Gg: ASbGncvOMy27xddAOg9dBd9UZ4oGG/SuNDpBhdyxxXj5b/VkIznWJuAllKiHOSybQnk
	pvMimaDFlptiCLj96UVpbtEVGEGrAmYbuzyUzqRzRrjjKfIAwha0KSpGdpjE79kGSiMxMNnyd1a
	nyerRQv4tCkbbXwJTqOdEusCJ7hWb2L0M3xHYYmE56wyvDnzwz4TfBBMLrBmHDJQq/98iNnZVJK
	IWBuQzTX45Mw/GxWwNi/pMlQ44V8cr7v8PtS0rnN6G4QPzPRUQOSPf5v4S4BgQELILXjkxV9Y8U
	lOU/Xb/qdR2s6fcozSzfAq0oXPsaCIDg0VGdHUAt56wokbgPQy4HbI6Wnx775QzklBB21M39NAu
	7VJz4BdSOrWS0ui3kct5QaBFEf7sknqwWPwEmoKPiGFWwduaCpy7L
X-Received: by 2002:a05:6102:1449:10b0:535:2921:ff3c with SMTP id ada2fe7eead31-538eeea6e2emr5482414137.17.1757426565676;
        Tue, 09 Sep 2025 07:02:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTiBB9xu/gj4kgce3Wxm4mFaVVVWJ31EwOjxvkEQXaamlM/G2KCDUh9c7HFp4BRfs2Sui4Rw==
X-Received: by 2002:a05:6102:1449:10b0:535:2921:ff3c with SMTP id ada2fe7eead31-538eeea6e2emr5482310137.17.1757426564621;
        Tue, 09 Sep 2025 07:02:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5681795d63esm546273e87.66.2025.09.09.07.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:02:42 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:02:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingweiz@qti.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for QCS615 talos evk
 board
Message-ID: <5oytapnerwmttc62q7s2vxlrtmcfg3bhiycpw4enak6zyaioyh@s4drz5x7hoi4>
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
 <20250909125255.1124824-2-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909125255.1124824-2-tessolveupstream@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX9g1KWsL3Rscd
 gVVsTI4YJ2VC/o6GhIsmRn5MIe8fd6ua5rKA7wzZN8M0wTRlugedMeUbkxj7qo6aEM1sqSw2svf
 bSgMeaQq/msXXARsvE9RtN+3uOFSo3/f5iWEHR4fDFedpscF03cLCSQRHhKguNAmZY8oLe7lmvM
 JzowaA8rwwpjSounc1n81JaOEr+Mvhnhs8a5jibOIeOGHNA70W5JmEH3zF+q6bg6f8OXJbKksui
 3BDbLzbtfnmjs5Mo7+oKlhYkvwVgF5SaymUbix4edLiNfXc3znEe2Qm3/OKkSUASev+5aqrxuTg
 dPrkdotPfV6IiShnwsIlaimfdNYKwHZ0Nv7CFHjQanbaOR91tpCIY3rSG13x85XAg3Q9ubxwuhR
 QQETreeF
X-Proofpoint-ORIG-GUID: QRpYmomf-5JvByFeMBkTCprbwvhBlEwW
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c03387 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=kIIBkZXHDdBR5UhwVmkA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QRpYmomf-5JvByFeMBkTCprbwvhBlEwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

On Tue, Sep 09, 2025 at 06:22:55PM +0530, Sudarshan Shetty wrote:
> Introduce the device tree support for the QCS615-based talos-evk
> platform, which follows the SMARC (Smart Mobility ARChitecture)
> standard. The platform is composed of two main hardware
> components: the IQ-QCS615-SOM and the talos-evk carrier board.
> 
> The IQ-QCS615-SOM is a compact System on Module that integrates the
> QCS615 SoC, PMIC, and essential GPIO connectivity. It follows the
> SMARC standard, which defines a modular form factor allowing the SoM
> to be paired with different carrier boards for varied applications.
> 
> The talos-evk is one such carrier board, designed for evaluation
> and development purposes. It provides additional peripherals
> such as UART, USB, and other interfaces to enable rapid
> prototyping and hardware bring-up.
> 
> This initial device tree provides the basic configuration needed
> to boot the platform to a UART shell. Further patches will extend
> support for additional peripherals and subsystems.
> 
> The initial device tree includes basic support for:
> 
> - CPU and memory
> 
> - UART
> 
> - GPIOs
> 
> - Regulators
> 
> - PMIC
> 
> - Early console
> 
> - AT24MAC602 EEPROM
> 
> - MCP2515 SPI to CAN
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
> 
> This series depend on the below patch changes
> https://lore.kernel.org/linux-arm-msm/20250625063213.1416442-1-quic_ziyuzhan@quicinc.com/T/#t
> https://lore.kernel.org/all/20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org/
> https://lore.kernel.org/linux-arm-msm/20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com/T/#t
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |   1 +
>  arch/arm64/boot/dts/qcom/qcs615-som.dtsi | 414 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/talos-evk.dts   |  42 +++
>  3 files changed, 457 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs615-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4bfa926b6a08..588dc55995c5 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -117,6 +117,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb

BTW, 'talos' > 'qsc6490'. I think the list is expected to be sorted.

-- 
With best wishes
Dmitry

