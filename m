Return-Path: <linux-arm-msm+bounces-88097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B88ED03F1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97A6B3182375
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AE34BF3CF;
	Thu,  8 Jan 2026 14:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJ+sVKVU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FrB6L0hG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58259423A7C
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 14:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881000; cv=none; b=K567Qi4cnr0btN6e5MdP469vn28ehqhojh6jxVlj3FYrJ/2mYWLyUVgC3RHqpH4e+QIp1n5gq/s6JUTC2ejYGYlmcaO8aRYvGfZU7JKW+T4AUk4TBRkgUcKTc6fjwUY/CjdwAKDEEsuDsxklb1kb6Qb7IzjM+dF/6+Kd5J8ELhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881000; c=relaxed/simple;
	bh=O39RT4mKZRaavt/btcDjvj1hMxrekOAFfr/h4cMIwOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzEiOctHvMFWf8S3B6rpM2fb0/nEpBP6DMJg63QrZP/OmMFsGZm68bIu0ZsTRT080tx37V2X9e0Z5Gd4sWlT92BM/UyPr17jbFK3cXH7Smud1OusomIrCwK2QY7t4c5s5IoSLCO/sdv9ICDU5A8vYgPpxsYvpmhyF6iVPGJdjL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJ+sVKVU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FrB6L0hG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608C2Y4L3751414
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 14:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/rikJvWWJcqzvlAQE9QpGvX0S3pzPLa+z+Q2zk4Dv4w=; b=gJ+sVKVUwlk6O/GS
	GysaPtQM6AwluJeSO20A4Qg6+IxWEInxm+0MYFmOIH2/pK21B0yRov2s+9hYVKF3
	tHRJl+Bmv8h0OxMh6aqqwT6IRomDfEWzd/Snpttjh0ON22rFloiXruwiHuZb0zVc
	1n6gcEXQZ7k5Vqw7xNJVYphi7uyvl6SLT3WYGVkn+Xgtaruc2dyvDTEjUGi3dWQk
	U6H9Ov2piSCt97TOPINJKjT/Z26SaRvPoWKQ3Bmnoam78p0I5U4QvsvxEO6bbzyy
	SWUC/iV/hHGFHzB0fqkN25Zyd9IIh0SDZxUwQ+FtQeDNqY8EI0xd/CJdKprELTVh
	iS8UBw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxcuft4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 14:03:18 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-65b31ec93e7so7643395eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 06:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767880997; x=1768485797; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/rikJvWWJcqzvlAQE9QpGvX0S3pzPLa+z+Q2zk4Dv4w=;
        b=FrB6L0hG59Owt356Yhcn+nYhDZW24eR0KJjII+OmXwoeQFP+Ze6Jl+nE6HohJn/z8O
         4Qeq11X7VIu9fRvipftajCwsvRaUoMBrk5nd6Zx8Cz9RAFRNzSksEcmx3A6t9aGJ07GR
         0pJYFJRVBSnJKjvRsgEsQ/952NJVUYTz3hjxgiqb/flPTxf0IiXOrVM7aHPqjedTZa/b
         zZzbvoMgG3BFkPZfAVUYSQg0PweIoxbl7ZNDn7CkU6drcAqGrWqC/6PWfHFHd53uynQc
         AaePr/65+sy2nMfm/DspIW70xVsRrbB6w0H/MnHkw44sC5umQ+uGyEIsBhzzQFdvsaRz
         uQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880997; x=1768485797;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rikJvWWJcqzvlAQE9QpGvX0S3pzPLa+z+Q2zk4Dv4w=;
        b=DFtK9d6bOrEyWqMecFezeqe7/LWfyrj0F6Y8f0+DuGf7BrGEgpJVjeSgL7vK9yuZwZ
         /EmHuy1lyGT1ynhUICfs2debUnogkfBVzHB4hRPEIHw6n9iIv/3jDRnZcydYU7QZ1rB5
         DlVzhPgs1IVAXnjIewjQycZlsrsIF3LRgDXPrBwhHggv/pWIi5iTREI1QI1VeMdYccbC
         xuG6uqjpjSqviLem8pPHNPMtujmKTzmMcEsVNTMtZDpjUjCPg2V4O0rRiP+D8aIHrND9
         jwHv17xfs3D0UJFHyJxbiULfn/X8nA9cdYV1dqo5am6ZScAyk9HbG/T+aVI0BNfy3ex4
         9BuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp5gTc23lvs5u/TpWZFlrDRQ4xJeHscFFEjw0X9bJzsAmjFekWFiM140vxI9/KiYDcn1nUfDzTtKkw0dBO@vger.kernel.org
X-Gm-Message-State: AOJu0YzZzF923R0hieDJbSWbWemoL8jXlsBf4iwaydTZ777ZvsFFcKi4
	HuOIljXzNfyGvt3MnCGnJhgoyfI9msrTn/LDqm3De7DZPP6jRu5e3IQ/TTvzEMV3fQ1CTC02erm
	cTMb8K5MBncZstFLj9LU++ZjAAKCaJBDnsAJx8O6m62+h5ilYerFcLOSidI8Yrc6WjN/c
X-Gm-Gg: AY/fxX6s2UD25+Nea25tIYITCJmG2847kxWfpdnylBS5PEj1JslkTKdcb6m3OSDnYqQ
	MvaVqkGp5pY3awk5Fo01OZ3QH15x2Qk4jr8gVtn5Sry9A7kh8BKo0o7hjFJDreZzrTsRRVGps2I
	Q9+gUB4m47pjgkLJYFH4XHwi+9Ktg60d7h5Cvd3qbNAXupK9x09iQ55d/LFSPl7oH7GbNsJMQlg
	4Iibg3mvisGIL+/LyYutK1mhCmWwgVMkAbqVO0LxkJiwUMLDzGZua7KWb6cVaoTE72zHqz7Z8If
	/77GLkbz1u2cblhGZaUWSn1aTyuzkFO/I4dEohPB/sGfusbKknHNZgqLYKc1jjpCWSqREQvsYUc
	mNmgY7pG2DtlFhzvj4PPuiojnK0+x5nQk6LGU/0trBMwDFPk7GUpoQfzWRg87LG8aPKKAMTQsfa
	PmiGuCeHU8bTpI1qk5Aa8oKvg=
X-Received: by 2002:a05:6820:618c:b0:65d:829:bad3 with SMTP id 006d021491bc7-65f550a39a8mr1747776eaf.60.1767880997411;
        Thu, 08 Jan 2026 06:03:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfyQcszuRRVSI6qdE95keUSR8R2mGsIFOnBdHxqgA3t+DEGEa/dLp6DleIwZNy5fV0t5UNMA==
X-Received: by 2002:a05:6820:618c:b0:65d:829:bad3 with SMTP id 006d021491bc7-65f550a39a8mr1747718eaf.60.1767880995427;
        Thu, 08 Jan 2026 06:03:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b717e7f34sm1150193e87.61.2026.01.08.06.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:03:13 -0800 (PST)
Date: Thu, 8 Jan 2026 16:03:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
Message-ID: <n6affntgff5wy4xmm255v5h2ejpepicpz2cybcuvsxmry5td6u@jucskv7zrzvv>
References: <20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com>
 <20260108125200.2803112-3-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108125200.2803112-3-viken.dadhaniya@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwMCBTYWx0ZWRfX0xgfWT27vzk+
 YyxZl/Jo8e0Uq4e1HL82lrEvD09cljB9t2D5UgXyi3FbBVfymwyEK2YPXyME/TKR59kIeaclg68
 H7bYQbtEqzdhnzHvvjfNJOrqNHAuLMnDsNSyHXz7xvMsX9hPt1qeohLr1PjUhrgO8hTYdPcsfaA
 7DThDUehMsgdVTRGJEEFeN7wRD8HC/l261lKysPYshcICsQcPj98DXVdK6HfTk5DGGaPygZE12r
 x6wGxZ33URvUhcavQllDNQcKc/0X57anxmO65WhzFp7SlRDI8++N4zNpLSfFvEIU26G/7D6RwYG
 C5zO5lQVChpIjYWVlwa98481S+Vpzn2raVHJ9x4CzyZxFKdb2lruL0OyqrRoVnwh/AsLFPwo4im
 CR65ZTwfhHWLwyl0La0/ptNhsErw7RTRav4gJgobdDqLdLVGnp7XZcUipMChzugIW6El0my1Ukt
 UAeAHcvMcZ9TdPilvpg==
X-Proofpoint-ORIG-GUID: oc9dqGId3Do2n-TNibkeD-cRfhK7W_BS
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695fb926 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=U-AYQkQNoRZMNvosi9oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: oc9dqGId3Do2n-TNibkeD-cRfhK7W_BS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080100

On Thu, Jan 08, 2026 at 06:22:00PM +0530, Viken Dadhaniya wrote:
> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
> The controller is connected via SPI3 and uses a 40 MHz oscillator.
> A GPIO hog for GPIO0 is included to configure the CAN transceiver in
> Normal mode during boot.

The main question is: what is so different between RB3 Gen2 and previous
RB boards which also incorporated this CAN controller? Are there any
board differences or is it that nobody tested the CAN beforehand?

> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 30 ++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

-- 
With best wishes
Dmitry

