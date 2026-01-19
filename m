Return-Path: <linux-arm-msm+bounces-89560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 409A7D39E78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 07:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3306301FF44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 06:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2566C26CE25;
	Mon, 19 Jan 2026 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoGSw+7B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C0MudQs9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F2C26B76A
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804152; cv=none; b=s2cZsikYhaOt9rW++a8NlaWnpnUlIOSejQMXZGnr15zc6ejsIENOI4GRccIdCHJVU0G5kZBG/+ljeGGnQsvh9mneYJSOoMZDK4c66I9VVbojAey3zL311eDbjcGUGfEwXdwAth0YvWpN+CrL0/Q4tDQKQ2lOosRKN+5bk2ib8Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804152; c=relaxed/simple;
	bh=92WbWPmYBSnb1zGCCEb0Hbj5AfLQODU4DO86S1VvRWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKO4vAiMYJOvwqhK8EAA4oeOkSwYS/jrMPtrjSircJOtMkJ9I4Cs4hVtEgm/8gk9bseAy/NWytvPUEwraM139UQT8IsrLBwIhPo4+zn5dSNxERYQ+atrn/J3q4NQbjGihCu5HtTlnfou4cGbJxXcWOa6WEYI8c5m44NASS2xy38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoGSw+7B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C0MudQs9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J1dDK24133738
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W24wDe3CqMAJnGcDcB5rCLmTTwI8iGgapWRYE+1/FOE=; b=DoGSw+7BIycpikMA
	4U4mTpPizySXGnsqDeIXwGBsE+sd2VhRbF0Gz67OYTj2GsfbPzvbeA8eyseqTpYW
	yJqNsG/61mGu9jNeAqSGlObIBqU/kKPnAfG9ClgR600PWMF8bN1TKM1QWK5Sy/uU
	Yc3AcfA85SiMd9U8ae14tVaFQBzXWG6jB3BfHsfRUkyHia/nm38+AN1rM6+DyTrO
	LwOr+rrHTBZvJcCg3A+htlNwhHoL29Ph9+M62OeEluRRc12ph/+9SJSmtT7+WCj0
	ICIfD7SE4x3RJX44nWUZknT7pxmi0aQn/WK3NkdwFQzGDNcblpdGe0dna76AG7J3
	e0yvRg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4yrmuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:29:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b315185aso599114885a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 22:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768804149; x=1769408949; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W24wDe3CqMAJnGcDcB5rCLmTTwI8iGgapWRYE+1/FOE=;
        b=C0MudQs9IWUz4TxuiPh5y1uGGuIK1si0iGktmAD77kJ3PtKVGN0Hv+ducdWBUh03Ub
         qdh4JuQ0tYEYRG/MOON/A2wIG2NyzvAVO8LLm0sSpmxp4R7iX8IL7LPMwYTmAEKQiaGY
         oRtVcexrbzTP8K+++OQW08MYJM+4qrFcaOzUHgBMMZDd0PoWhByx45oC4i3FDSuighVi
         EacBi8/996H8vsaBG+n8wQgqUbTT9fUsetJZlhnBPOV/vj9lGimZpx+sn6PdHiUfj+Hd
         LJGZvL1C5Zw0dXrQqpAnLXGnbH1vIEIKwQXxVIsNrc3ypBe9stBbcUpCy9ldf0MPQtxS
         E1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804149; x=1769408949;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W24wDe3CqMAJnGcDcB5rCLmTTwI8iGgapWRYE+1/FOE=;
        b=B3QbKLHleqZAqv11s4Cl0Bf3bWCwQo+KkAlBqu1CS8QUni7U+vMEE0Ae1Ik8KpnnZJ
         1jHdccc2RpOsa0R4S1Sy97rMyvwMLMVut9V4wmiU34WdYb150583oW5TrigwqvIQKEaL
         LIYIn+mDIAX4atVW5wD+M/L5wqYAZR+oAp0X+Rpj+AEVxHjLGIl0dFVyLmg3aSQH6zca
         tZ/JFpSq/3WqFade9rFEFQyceVmYYBKfIh6x4YkbOR8dpGSZc9JoY+rZdjNnzC93KFpI
         3KadGY1o+kbu+E2F4blbBXc6Rcc/+schDOmqi3Z2K59mRQzDhXNVlhlys2xkNS96t4cV
         zWwA==
X-Forwarded-Encrypted: i=1; AJvYcCWL1AC4P6Zpz8SbW/ZCwcBGgK9f4Tg1W7ZEpFH/anXQis5KVZIRofchfyyMcB9X7SDsee0fICW/zYPXRnQl@vger.kernel.org
X-Gm-Message-State: AOJu0YxF6IbuzIoOu8Ha+3RbMmd5dwuMkEfOu0Jh/VyeR8lSfIMRbkaA
	WzTd4xk1yEPSq/szaT4Vr3KrxdxjGnWpQTzXbZXqbdDV2qkdwjnTLqZY8EVNtlE578SEvEdKgF5
	5g8Yi7Hww6GGICzWkh49pfYXp4EKaqyOy7Bmugr0Tg52CtIMLON6zUm/tajmnUb/vAj/L
X-Gm-Gg: AY/fxX6G2gfHZMaz0rZpWslpkjsfd+Bs3PmU0QB2L5eO54OiBkYqFhB2z5tOhEJ7tz+
	s0j+pSlDtlq44uyVACFe3AZAvN3SCF5r7lM40MiRhf871EhAY/O+x3RS0jHoQBbhDd1nXbASmTB
	UV4h+9aMte2CIG9WWAYRqVDJ2IiSRzrLQCDzYrnU1+U/IqzGY4ZDmf5PDTU0APwB8RdPRl7E2MK
	AU8h3eynR0c09egbT8STs3xSR51MT+z54TZKlqI98Anlp1wbByynZgeVFsmSyQ7HQ3wa0IlZKsb
	FTZ1C5WjMHTbUJs+pde0CNyJ6gcYNt8mKznQ91+cqhuxbkXwzBcw6YPn/7R+E5rklron5u8z8gd
	ZkvI3k4tEck9UecqEiQpadxbSQWAOg1Ols/51IssT9ReOL8N7OF6dVji6u49jMDwlthJogjwfD0
	pQWZnvy6qflpaku3UmvBSBiOc=
X-Received: by 2002:a05:620a:269b:b0:8c6:b333:8a0f with SMTP id af79cd13be357-8c6b3338c43mr791998585a.4.1768804148868;
        Sun, 18 Jan 2026 22:29:08 -0800 (PST)
X-Received: by 2002:a05:620a:269b:b0:8c6:b333:8a0f with SMTP id af79cd13be357-8c6b3338c43mr791996485a.4.1768804148359;
        Sun, 18 Jan 2026 22:29:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c395sm3021996e87.74.2026.01.18.22.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:29:06 -0800 (PST)
Date: Mon, 19 Jan 2026 08:29:04 +0200
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
Message-ID: <qvuokwiqllm6zmlzj3pfvziylrr5krjya5rnf3ojeycdoutlro@fl5qukh4vorm>
References: <20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com>
 <20260108125200.2803112-3-viken.dadhaniya@oss.qualcomm.com>
 <n6affntgff5wy4xmm255v5h2ejpepicpz2cybcuvsxmry5td6u@jucskv7zrzvv>
 <5cdfe5a5-3c78-45a2-886c-768b224ad776@oss.qualcomm.com>
 <wbx2qrkhpsntggzqkzkpi4sa6qv3buhkjbwmjoa7zgw2oc4b7u@qugyhcxb6qrh>
 <316fa702-6cd8-4842-aecf-c176a5a53e2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <316fa702-6cd8-4842-aecf-c176a5a53e2e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696dcf35 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=40aOK5akGFnnUq9zcLIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA1MSBTYWx0ZWRfX/p8ho+swPI8Z
 WhqpmX2+PvVN+nr3gs2kDsaPGKF3bb3KpD6YTezcWlBrBcURM374qh081cCdy/B86YfFf0Ast8m
 Rh7qPnWLM1en7gSxPvApAJzL8vTm9TxSCPAQa9r/NXkZVQCzUokOSY/AqdKYKwxZ/r2XbMQsn7a
 MSR+9b1YxEmICjl9rPCjYRBc6q4VOebkMTqf3sfiZAdj14eA5ucN4Dev1I7Lrk02GaLsfCt5IR0
 ynxTA+umykMtHty4eCXnsJtjzeawwHPNn3G0pZkUnQx1SA37pOj8bK1lTGpzf433wzKbAP2U63+
 ERTBsT0yo8JoPEOhIb0OzK49jlAOJeqiK1DjC4c4c+ccr2WeStcjLX/IijjVzduQZAspuaDMc4O
 s9ulb1Nppi/NjNrNver2oONZoazenpTV4f0ykGmlIPOC+R2n/AVrKHsv76Avg9MPskPd3yKejI9
 dRKA102tR3jNRkNeDYQ==
X-Proofpoint-ORIG-GUID: ebIDtyt025MIrQ0iBjbn7--hfzOS53TJ
X-Proofpoint-GUID: ebIDtyt025MIrQ0iBjbn7--hfzOS53TJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190051

On Mon, Jan 19, 2026 at 10:21:37AM +0530, Viken Dadhaniya wrote:
> 
> 
> On 1/9/2026 7:35 PM, Dmitry Baryshkov wrote:
> > On Fri, Jan 09, 2026 at 06:23:39PM +0530, Viken Dadhaniya wrote:
> >>
> >>
> >> On 1/8/2026 7:33 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Jan 08, 2026 at 06:22:00PM +0530, Viken Dadhaniya wrote:
> >>>> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
> >>>> The controller is connected via SPI3 and uses a 40 MHz oscillator.
> >>>> A GPIO hog for GPIO0 is included to configure the CAN transceiver in
> >>>> Normal mode during boot.
> >>>
> >>> The main question is: what is so different between RB3 Gen2 and previous
> >>> RB boards which also incorporated this CAN controller? Are there any
> >>> board differences or is it that nobody tested the CAN beforehand?
> >>>
> >>
> >> The behavior is consistent across platforms, but I do not have details on
> >> how other platforms were tested.
> >>
> >> On the RB3Gen2 board, communication with the PCAN interface requires the
> >> CAN transceiver to be in normal mode. Since the GPIO-controller support
> >> was recently integrated into the driver, I configured the transceiver using a
> >> GPIO hog property. Without this configuration, the transceiver is not set
> >> to normal mode, and CAN communication does not work.
> > 
> > How do we verify the mode on a running system? I have the boards, but I
> > don't have anything connected to them over the CAN bus.
> > 
> > BTW: can you recommend any simple setup to actually test the CAN bus on
> > those devices?
> > 
> 
> I tested the CAN controller using the following commands:
> 
> 1. Loopback Mode Testing (GPIO hog not required)
> 
> ip link set can0 down
> ip link set can0 type can bitrate 500000 loopback on
> ip link set can0 up
> cansend can0 12345678#1122334455667788_B
> candump can0
> 
> 2. Testing with External CAN FD Adapter (PCAN-USB FD)

Thanks! It's price doesn't make it esily available, but it answers the
most imporant question: by the USB CAN adapter.

Did you add

> A GPIO hog was required to configure the transceiver in normal mode.

I'd phrase it differently: to pull the transceiver out of standby mode.
By using the GPIO pin you make it always stay in the normal mode. It is
fine, but it is not optimal. Instead a proper solution would be to use
the MCP251XFD_REG_IOCON_XSTBYEN bit. Could you please instead implement
support for setting that bit, based on the DT property.

> 
> 1. Probed and verified CAN transceiver pins and connected them to the
>    PCAN-USB FD hardware.
> 2. Configured the CAN interface:
> 	
> 	ip link set can0 down
> 	ip link set can0 type can bitrate 500000
> 	ip link set can0 up
> 
> 3. Configured the PCAN-USB FD software for 500 kbps arbitration bitrate.
> 
> 4.Sent a CAN FD frame from Linux
> 	cansend can0 12345678#1122334455667788_B
> 	
> 5. Verified reception in the PCAN software.
> 
> 6. Transmitted frames from the PCAN software and validated them on Linux
> 	candump can0
> 

-- 
With best wishes
Dmitry

