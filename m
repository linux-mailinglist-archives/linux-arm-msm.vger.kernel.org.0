Return-Path: <linux-arm-msm+bounces-104174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCS+JEcp6Wn9VAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 22:02:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBBD44A687
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 22:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6DD2301F9D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476213F23AE;
	Wed, 22 Apr 2026 20:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BG/r+/Ms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQnypruH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED5A3F210D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776888131; cv=none; b=Un0rPjlzwXD9VyPquWKsLYgcSSzb8oYMZDpL+nwnWfBNMB/zochmiUykR6qSbfyvdDzP2LFlLb+mYKa+V896Bi2aIOimOkqzNG5jktlbv6K4tETHSMcUjSl7GYECMOOaljmEJ8Ca3NUpSZzakUxHa+t9NAKPcszEFc+XQ9EdHYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776888131; c=relaxed/simple;
	bh=Q4pwvI0KRwdRWq767+fFiz9GrBlPylpoplyaIZLTJhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4BLB05Vgs//jvEWuhbTFi4eW0UUFCUIlfQdE/wjA/Fp81wKE6XM94UX/fZCiY9OiQI/f/AUAdUizjVxXK1qtYUcq/fkDMzTrqByozsx1XqiLAhHxVk3gKVyr2mtCdbHBMWIWycbZZ2H6rAqahNKnERmhYrl3alkaxJc5k4SSoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BG/r+/Ms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQnypruH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MGA0qw3173279
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 20:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	flGJcdIDIQbWdmekaKBUj1NUx7N5shdwh7EfzrIz2ow=; b=BG/r+/Msh1Lj3jCB
	49Q2Zy9NtdU03frorgIroMEWGWlP1wefISYQ3D/j0A4q2UDyiZXfFwnCnuA4VpuZ
	7mw7pBTxXwW+d4R3oyui0TjuABoxPcGhdfeoGgXxOG4ZOgQKSiawIdi8enw+Njvw
	DV85p5qsoJvBK21ZciVB9+g6GrP9PxsiTP/cARkMShQqvtbwMDlwuIeTceuYHXAm
	IuS6ioA4Iinkbmh2pMh2pFuOq5+zpJKgbUf8IRn7DB6uhNidyHAgXjdl4BpvtUYd
	sek+U0f31PmcjlSEQW6LmrQO5Gr0WwxBKojyD90bOK0OI1322RJZN4xpiv3BnlGm
	MR9tYA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1m30t72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 20:02:06 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-471618e2082so5366812b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776888126; x=1777492926; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=flGJcdIDIQbWdmekaKBUj1NUx7N5shdwh7EfzrIz2ow=;
        b=bQnypruHZT/I49dNpYbWtPmluppMTBIuTw7PmW0nqRiT+InKmcFx7v+/fHQI9kV3R2
         XB0nPeeaInbJ5ahtg5ho+KdS/PqIOJSQUJU69tPM/o1UHJkn6hIHAKVY74jt9W9vDGrR
         Mlnl6k3o5qc1t+GDwWlyCxJ1S2D4LhbRArbkFU9Foxmc3EeIMOy5q2TJ+2fcC+EXpORE
         u3FWUrR5rYWWyK87diKsqlX/ZQR2+w8Hit65f4sRDZtdSaO5n5sHlx5xmqe3gYSA4cTy
         lfx/K3duAZlgvLsMI9CxYhdmONPeDmtCktxnc8UfC3nqfrY3pzMOf6phRixOCm5bFKl3
         p87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776888126; x=1777492926;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=flGJcdIDIQbWdmekaKBUj1NUx7N5shdwh7EfzrIz2ow=;
        b=OYQxY4jH9ORD1bwIftwMezSQe8iUyctIzNTRMa/xsjYuNEYF7iu2VfgUJ4tDK5EO2k
         6EDHGHsyOUPthZwWGvJN5JPcd0xVWtR/iZKsEq2NwrMfZRndPt+BD6y4LvJWsREaXt2T
         GcxiG0zIZF8/3K/5bcNTdeNdTW70HM4velV2KzTpNo65hAb/ri7DiDLrv/d773GgrTUf
         yJKrIs7Xg4LImSrICUiuUO/Lq8rJKaOedax3uhjLUYWgMEfuOoxqScC+pvImAf0Ns8oJ
         rplTfdJmQU8xS3nBc4ERf3CVlSI6cvRF2wMD7uyFIGn9pD35/Ln6cfwy/q9hfX9j2Z4Q
         7i6w==
X-Forwarded-Encrypted: i=1; AFNElJ9hToFuf4AuFrGVTqheoaiPJZD2CyJswh5ThZy7azLF6gtdP5yn4034mKqPqu0bincErmFvjmPzMQ13EdON@vger.kernel.org
X-Gm-Message-State: AOJu0YzG98OluytzQ70UCaC2OD3q747GzOHzYdiLnnxf2N5gY5igpBEN
	zuTTy8DeGuRZdfup3gVwgHdYJixDx11/WxUUk0aHNCGUUpdCWjHT84tCxfPX7ck7y/t/HfaH4Z1
	1L9TTq0cO4GwBq9/VXdX6e/uTKC2sPkds8q99V2uwp5B+yl28Qqe4D5UcDPEZ/Tzfu4uP
X-Gm-Gg: AeBDiesqgy3cCDv703kEkWQBLeTnAFQQ11CkEuQ3dkZL9Y62ppAp02LrAx1fdque1ba
	1/8EM9MuW9QB98tAVGfKNn/1RZvgyAd7tjytif13j341r1d5L5/Ra38bhN2CmqELsthhWVB0OJm
	7wb/XKVnsOAeEeZ9ou7qn61N2Q/voZBI/a5hHhlpagcTaQPuPaqxFchojM3t0v6XgjYeBIlIfmd
	LGgvZC9FX46F/OQzzKuAEJFFPzerTlaj5tz89QmMefD0bBvJBh05xTE7ePZKeiaoGFZr8v0d6DD
	c+WcwjsknWkDZz0a1N/dRsdwbRE5jZdrhT7UiHjYAjkmHVJTKYYgwItgEE/e5K9BRctXf0u0FeU
	PxY95HQ9hxm4ju24ajJfuoCpoKWd5DJJyqWsbvYN+88VKDGIqvOiXq4opaWgEp8G+oGrZ2hYek+
	JjPSZFlXXv0IvBcm/bMBq9WIptnRde4Lr9KBjYXIxOUStllw==
X-Received: by 2002:a05:6808:1190:b0:479:f7e7:4a81 with SMTP id 5614622812f47-479f7e75c2cmr3946544b6e.0.1776888122836;
        Wed, 22 Apr 2026 13:02:02 -0700 (PDT)
X-Received: by 2002:a05:6808:1190:b0:479:f7e7:4a81 with SMTP id 5614622812f47-479f7e75c2cmr3946458b6e.0.1776888122003;
        Wed, 22 Apr 2026 13:02:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41974167fsm4641810e87.60.2026.04.22.13.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 13:02:00 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:01:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable primary USB
 controller in host mode
Message-ID: <6ijpvrd7mm5c6zsvogzm6uwsxpwqugur7oles5i55cqyage2hd@rig24poqt27g>
References: <20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com>
 <5l46jjjywvg2gtkrmazswyprj4vqlwbo54jpbnuh7scc6clesg@zxsnca6uzbev>
 <CAHz4bYv_gyCU0sPi1RCrB7=x1noW6+QCFuuCXgAXymbTsWgwQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHz4bYv_gyCU0sPi1RCrB7=x1noW6+QCFuuCXgAXymbTsWgwQA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: qF0zJ2WkUPO7t7uMubYhhjfpEHvXwVLu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE5NCBTYWx0ZWRfXxZa+S8ldewhg
 vHXih8lIJ+SxiNJw0ON0w7yfyq8IG7atvKsjv72Wh88FcsJ9H6vD5to9/K20kHEUeHmiNNOOlUo
 AT6gvPm/dsXqiEFakrWwuqBQm7QWqWmvCsdHY8PvwuxiC8r7LJM3rLAAJdaLGi5daYhAKTNcnRu
 f/gk8nop2BR/Dw7cEtyo1QKoqasn1wBX1Hqgd/hhr3Q9rMxFXUCjnxIubIzqB3kSEF6C8u1EE3a
 jpVQ/O4F/Zf9KGndK6t8qyYd2ppXPWqUewAid59MQ83idCPmVwGX5awzllPpeQjJ9bJ3pbR6m1q
 TG1r8RWz7mdk0FQ8FwEARwrg8/2tsvFP/4BGra6V9284RLBErvOxVeW9320QBe1gYj9evg6McBj
 sMh1kpW9mJVQ86DoHpRdLKVb4VQTYNBIdYT1brgUvRX3xjZZTBpfPOgIZVm3pmwfXJ2SKVfssbx
 2hbRkS1eTOSk2720afw==
X-Authority-Analysis: v=2.4 cv=PsOjqQM3 c=1 sm=1 tr=0 ts=69e9293e cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=EPEYJcUAfpNgXvpEDeoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: qF0zJ2WkUPO7t7uMubYhhjfpEHvXwVLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220194
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104174-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.4:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.1:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CBBD44A687
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 12:45:22PM +0530, Swati Agarwal wrote:
> On Sat, Apr 18, 2026 at 4:10 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Fri, Apr 17, 2026 at 08:50:14PM +0530, Swati Agarwal wrote:
> > > Enable primary USB controller in host mode on monaco EVK Platform.
> > >
> > > Primary USB controller is connected to a Genesys Logic USB HUB GL3590
> > > having 4 ports. The ports of hub that are present on lemans EVK standalone
> > > board are used as follows:-
> > > 1) port-1 is connected to HD3SS3220 Type-C port controller.
> > > 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
> > > for Bluetooth. This port is to be used only if user optionally replaces the
> > > WiFi card with the NFA765 chip which uses USB for Bluetooth.
> > >
> > > Remaining 2 ports will become functional when the interface plus mezzanine
> > > board is stacked on top of corekit:
> > >
> > > 3) port-2 is connected to another hub which is present on the mezz through
> > > which 4 type-A ports are connected.
> > > 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> > > connected.
> > >
> > > Primary USB Controller
> > >           ↓
> > > GL3590 USB Hub (4 ports)
> > >     |
> > >     |-- Port 1 → HD3SS3220 Type‑C Port Controller → USB‑C Connector
> > >     |
> > >     |-- Port 2 → Mezzanine USB Hub (when mezz attached)
> > >     |
> > >     |-- Port 3 → M.2 B‑Key Slot (when mezz attached)
> > >     |
> > >     |-- Port 4 → M.2 E‑Key Slot
> > >                          (Default: BT via UART;
> > >                           USB only if NFA765 module is installed)
> > >
> > > Mark the primary USB controller as host only capable and add the HD3SS3220
> > > Type-C port controller along with Type-c connector for controlling vbus
> > > supply.
> > >
> > > In hardware, there are dip switches provided to operate between USB1 port 0
> > > and port 1 for primary Type-C USB controller. By default, switches will be
> > > off operating at USB0 port. After bootup to HLOS, it will be operated in
> > > USB1 port.
> >
> > Why did you choose this configuration?
> Hi Dmitry,
> 
> Thanks for the review.
> 
> This configuration follows the Monaco RB4 hardware design and intended
> usage model:
> 
> The primary USB controller (USB1) exposes two Type‑C ports: USB0 and USB1.
> 
> USB0 is intended exclusively for software download and recovery use
> cases (EDL, ramdump, fastboot).
> USB1 is intended for normal runtime operation after booting into HLOS.
> 
> The hardware provides DIP switches to select between USB0 and USB1 for
> the primary controller. These switches default to the USB0 position to
> support software download mode.
> 
> To avoid manual intervention, the board also provides GPIO‑controlled
> equivalents of these DIP switches. After booting into HLOS, software
> switches the configuration to USB1, which is the intended runtime
> port.

I assume this behaviour is documented in the board documentation?

My main concern is that with this approach it is not possible to enforce
any other mode of operation, even if the user wants to keep USB0 to
continue to function even after booting.

> 
> The external USB hub (Genesys Logic GL3590) connected to USB1 is held
> in reset during download mode and is enabled only after the system
> transitions to runtime mode via software‑controlled GPIOs.
> 
> In normal operation:
> 
> The secondary USB controller (Micro‑USB / USB2) is used for ADB.
> USB0 of the primary controller is reserved for recovery and debug use cases.
> USB1 of the primary controller operates in host‑only mode to support
> downstream devices via the USB hub.

Is the USB0 suitable for OTG? Is it possible to connect USB devices to
that port or is it peripheral-only?

> 
> This setup ensures reliable access to download and recovery paths
> while allowing the runtime USB topology to be switched automatically
> by software in accordance with the board design.
> 
> >
> > > @@ -742,6 +822,28 @@ expander5_int: expander5-int-state {
> > >               bias-pull-up;
> > >       };
> > >
> > > +     usb1_hub_reset: usb1-hub-reset-state {
> > > +             pins = "gpio7";
> > > +             function = "gpio";
> > > +             output-enable;
> > > +             output-high;
> > > +             bias-disable;
> > > +     };
> > > +
> > > +     usb1_id: usb1-id-state {
> > > +             pins = "gpio13";
> > > +             function = "gpio";
> > > +             bias-pull-up;
> > > +     };
> > > +
> > > +     usb1_hs_sel_switch: usb1-hs-sel-switch-state {
> > > +             pins = "gpio14";
> > > +             function = "gpio";
> > > +             output-enable;
> > > +             output-high;
> > > +             bias-disable;
> > > +     };
> >
> > Why do you use gpio-hog for SS switch, but then you use pinctrl for HS
> > switch?
> Initially, I attempted to model both HS and SS select signals (as well
> as the USB hub reset) uniformly using gpio-hog.
> 
> gpio7_hog: gpio7-hog {
> gpio-hog;
> gpios = <7 GPIO_ACTIVE_HIGH>;
> output-high;
> line-name = "bootup-high-gpio7";
> };
> 
> gpio14_hog: gpio14-hog {
> gpio-hog;
> gpios = <14 GPIO_ACTIVE_HIGH>;
> output-high;
> line-name = "usb1-hs-high-gpio14";
> };
> 
> However, placing gpio-hog nodes for HS select and hub reset under the
> TLMM node caused dtbs_check failures, This resulted in schema errors
> such as:
> 
> make LLVM=-15 ARCH=arm64 -j99 CHECK_DTBS=1 qcom/monaco-evk.dtb
>   DTC [C] arch/arm64/boot/dts/qcom/monaco-evk.dtb
> /local/mnt/workspace/swatagar/upstream/linux-next/arch/arm64/boot/dts/qcom/monaco-evk.dtb:
> pinctrl@f100000 (qcom,qcs8300-tlmm): Unevaluated properties are not
> allowed ('gpio14-hog', 'gpio7-hog' were unexpected)
>         from schema $id:
> http://devicetree.org/schemas/pinctrl/qcom,qcs8300-tlmm.yaml

See how it's handled in the qcom,sdm845-tlmm.yaml and patch the bindings
accordingly (ideally move it to qcom,tlmm-common.yaml).

> 
> To resolve this in a binding‑compliant way:
> 
> HS select and USB hub reset GPIOs, which are TLMM‑controlled SoC pins,
> are configured using pinctrl, which is the supported and
> schema‑compliant mechanism for TLMM.
> The SS select GPIO resides on a TCA9538 GPIO expander, which does not
> support pinctrl. For this signal, gpio-hog is a binding‑compliant
> mechanism.
> 
> 
> Regards,
> Swati
> >
> > > +
> > >       expander1_int: expander1-int-state {
> > >               pins = "gpio16";
> > >               function = "gpio";
> > > @@ -784,6 +886,12 @@ expander3_int: expander3-int-state {
> > >               bias-pull-up;
> > >       };
> > >
> > > +     usb1_intr: usb1-intr-state {
> > > +             pins = "gpio45";
> > > +             function = "gpio";
> > > +             bias-pull-up;
> > > +     };
> > > +
> > >       expander6_int:  expander6-int-state {
> > >               pins = "gpio52";
> > >               function = "gpio";
> > > @@ -863,9 +971,72 @@ &ufs_mem_phy {
> > >  };
> > >
> > >  &usb_1 {
> > > -     dr_mode = "peripheral";
> > > +     dr_mode = "host";
> > > +
> > > +     #address-cells = <1>;
> > > +     #size-cells = <0>;
> > > +
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&usb1_hub_reset &usb1_hs_sel_switch>;
> > >
> > >       status = "okay";
> > > +
> > > +     usb_hub_2_x: hub@1 {
> > > +             compatible = "usb5e3,610";
> > > +             reg = <1>;
> > > +
> > > +             peer-hub = <&usb_hub_3_x>;
> > > +
> > > +             ports {
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <0>;
> > > +
> > > +                     port@1 {
> > > +                             reg = <1>;
> > > +
> > > +                             usb_hub_2_1: endpoint {
> > > +                                     remote-endpoint = <&usb1_con_hs_ep>;
> > > +                             };
> > > +                     };
> > > +
> > > +                     /*
> > > +                      * Port-4 is connected to M.2 E key connector on corekit.
> > > +                      */
> > > +                     port@4 {
> > > +                             reg = <4>;
> > > +
> > > +                             usb_hub_2_4: endpoint {
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > > +
> > > +     usb_hub_3_x: hub@2 {
> > > +             compatible = "usb5e3,625";
> > > +             reg = <2>;
> > > +
> > > +             peer-hub = <&usb_hub_2_x>;
> > > +
> > > +             ports {
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <0>;
> > > +
> > > +                     port@1 {
> > > +                             reg = <1>;
> > > +
> > > +                             usb_hub_3_1: endpoint {
> > > +                                     remote-endpoint = <&hd3ss3220_1_out_ep>;
> > > +                             };
> > > +                     };
> > > +
> > > +                     port@4 {
> > > +                             reg = <4>;
> > > +
> > > +                             usb_hub_3_4: endpoint {
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > >  };
> > >
> > >  &usb_1_hsphy {
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

