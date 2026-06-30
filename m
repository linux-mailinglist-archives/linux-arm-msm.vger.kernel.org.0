Return-Path: <linux-arm-msm+bounces-115366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cNwCLqudQ2rOdQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:42:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 288536E30E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:42:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gB3wi7NH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X6nx4EK0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115366-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115366-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02573315E44F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D813F1AD3;
	Tue, 30 Jun 2026 10:33:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39B53F39DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:33:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815601; cv=none; b=NAYiJAEmv/K2AWjLkhKOhDgj7/icv1m6Du4KcDXdP9A9B2FAiin3vQfuO+xFO02c5BcsCoAT/oRNez0ccKwaImCBm/WVkI5reWsgZG7Ny2EiY5E4h/uufONXTD7QnhkummfoWaZPVoIm06rNSujkJZUvIZ7FNqTPZdhXl5PcBtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815601; c=relaxed/simple;
	bh=eA/yiQ1+Hh/G34yHokcnj3DEgShIEw7WxmJ6apGeyFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rYILPN0jLQ08kabTkIhgymnY72RnjoQibsX7vMZ5qFdQTppXLj5WD2DLVEBgP6z/LYDnETKMGVcju733CZa0mp12/vCFFlLtPWfsZUkLOoD/8R8YkRUwyEyXAs9ym/3PkxPnvgsjWL+QrmXbly84sq3KVIHoDk/pcuLJRy58g4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gB3wi7NH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X6nx4EK0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n3Ft1508485
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FfjNnxj9Su3+fGP4UChYxeiiAzrDMTzE/s8VvuDbhNI=; b=gB3wi7NHU105NzWX
	1McQP/56VfVYN1pWr+bshRZoMzxzxCo3xKp8NOgNQzUVGNglE0BeW/zOSEAk2+MZ
	CQDzrTRS2Bqyh/8USoppJayxOsbuQeocUKg0bYP0tSAMlE+5Gvw0Pp49+n74qKtT
	IpBdS/fWo7v8cxT+kqbwA6IE+shz8C2XSktmVDGIA6dvImGxiE8BcDHYea5KvunI
	LQepEvHDO+qjAXo9dA5E2iHFgr2O/LQHyHpJ6CyX4xtjlJX4psoJGc4KON7goWG8
	7fopjJWahmQCW65fEBFxNe4N5ojIl0GNA1ZF3CmU4agGUVxcHi5yRUFeqjLHPAID
	kZCESA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j30dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:33:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737c728b37fso94502137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815598; x=1783420398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfjNnxj9Su3+fGP4UChYxeiiAzrDMTzE/s8VvuDbhNI=;
        b=X6nx4EK0y4oONBtwNuXvWao1YhI8trrEFjrocXSrYUR0tBOnb158SXHNtVFxF25CeE
         NxSanS0lXUH6wjPYdcNDGm6jWwdUgCd9Kqh9UNj7YWNfeWHF3uuN5tOIIKTgI1TE72vo
         YGxkNx3Bb8ZWhMAaMpGYb0Owi1bWgNWVPX/roA8PWG839n5mRI36fzqC2IcuE23gIo9W
         8xGklGOly8cdXj7FIMsnfvJQXhfrR/Nf25BppJqG9ZnaSydyayOpshUcy6NbrCZoc6Gc
         bnuD+4JJUYILYHe/XT6dG8Jxcxu5Cd3wOAF7Ej1HI0nYblKOWQr56YskmrLdsM4NJogo
         WpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815598; x=1783420398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FfjNnxj9Su3+fGP4UChYxeiiAzrDMTzE/s8VvuDbhNI=;
        b=j2SFoPTxEKECnafJDYoGPzC+zVKrl0Mn2/RQ+nhpQuauBf7CJPn3ZgOMJ1EbEoYmrU
         EX0HCtWPeB6E6fArPZOocXGFX7BGqPPpg3Fba5fl5uRETFO9K+r8GD5FoC9RPALrTdZt
         FUV3/LfTTw8vcX+83L5eEIAqgLynBGPn3sBNuEz2NdUEho7oRJU1PDooh+8jZkARXLbD
         Da6dDBHrgwo/J72Im2nbmab5LlvfQr/SQ8wDj+NbHrxyvciSs1L7WYpV3nN+DkCfxm5u
         GDElyrOWP5z9lvF119zZFxBvf5dprUZTK/tMsctwxWs/OXdO2PFVdmFvop2PHN3il0ee
         OmcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFMhCiOYYICgFRxtHNy5g/MUqxqZczQ7V+eqh84Opt7D52YaavzfCkrdOJijoQL2F8301Il9OMpQhGKsuo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn7E1kKe6aCEfoolQQs506fPV5NldHagx+hgbEjv4lB2dPz2EE
	utSxqbn/xFbt579oxzy2X8JAN2pGHf1kEMN8vspQK5+9jyKHSCgkjs0/ZcaLPj9s1A25XGEG0sn
	DxRh7ELcbtz8vn9qNfyQcgvNOga7zOEouO41DyLqXieO5FT42fPOIisAL3tLoYc5R1qyZELXrki
	3r
X-Gm-Gg: AfdE7cn3Y9Yyby8v1PD2RI9pSktRK0FWPWN4PjNe9kyU36sPsQMeH7W6O1TZYEAvFF1
	HWrXvDGlEWtY28ACuzDSvy2f8S3grKPcS68M1BUhy6EezvoLh149RCasoZjAUknl8huyexTYb1W
	yEBvj6wb3PcJy542pfjy1RySyaft4Xdy9S/UDn8F1sh9XpYyNkopv6CWhmSlfLR8dBZ4Zdu1+mo
	56OpWOlGULmCngo68HNogRK9wfTOjlSbzRSgch1kel/W2AJFPhbQzoGT7C/f3WEOrMl0cpm9XR/
	yaZUFTSfRIBjG2CvEsuntltp55Slg413rv/rB/3IOzxJKY+7QsQvQ/gyzN33vXWHcH52gfyMZwL
	BVxhsOxFa2lc5b3CVbS5mQH8J7dakm/z3taY=
X-Received: by 2002:a05:6102:8016:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-73a363e173bmr506272137.1.1782815597851;
        Tue, 30 Jun 2026 03:33:17 -0700 (PDT)
X-Received: by 2002:a05:6102:8016:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-73a363e173bmr506268137.1.1782815597386;
        Tue, 30 Jun 2026 03:33:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c3b5ca9sm985330a12.9.2026.06.30.03.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:33:16 -0700 (PDT)
Message-ID: <50c3d0d6-f394-485b-afa2-37b0bf4b63a8@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:33:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SM7225 (Snapdragon 750G) Mainline Bringup Status & Blockers -
 Motorola Kiev XT2113-3
To: Angel Saucedo <anyeloxd13@gmail.com>, linux-arm-msm@vger.kernel.org
References: <CADi_M0x5BnGamkMZ4oZFZwj=m6Cw1s6vn74VqnSuk3nGqfhM_g@mail.gmail.com>
 <60f18b2d-2481-4266-99d5-e0373345d993@oss.qualcomm.com>
 <CADi_M0x=LaMVWz1ckPnsTMQE6D4RKBqocPsJCWwHHTnKWBR=Pw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CADi_M0x=LaMVWz1ckPnsTMQE6D4RKBqocPsJCWwHHTnKWBR=Pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LBPTKhHDrhgOWHYx3OvNGmd_nB2p-V2Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX58b3cxftM7Um
 /Y+yjI/merzjIVZlxeb5wDaO1rbqu4XaLOtlr49MI1GCouDKk5jqO3XpKafWgwqP5T83z8rhKPd
 7XRnX/ywjjXRigdeJdXUtqoMVRRwfEH9pWczMj2yn4qO349fcrpJC6A5r7Ojfsg0WSq0rRtMOOa
 +Mz1LBLYu/n/aKPgSow/5ADnr7+rib0IN7ExFMkIov+muqaJ0KMwCdw23DuYlYx8QUCV6b/j6v8
 AQLDb+tU8id89gCv/k6JhN+Va5GFzKqSgCbRxED4W1W9zbFhwCMHXt3QdxfmW7pRx59wPhU8FGF
 N5T6O6EwBBgj5kdr9JojjAXi5IIBTdSQiZil83QG8gNn+9rTlQGl+MIoBU5m8VE1gIqLM4SSTma
 dY8fiHhplSnI57beuWnlR9d+LJ8RQXenxukIv7ONEfZAHg7Gc5Hg3QMpjcABl5Mosg+2FlYMSqr
 /+fa3pF+PrOiXNpvHZA==
X-Proofpoint-GUID: LBPTKhHDrhgOWHYx3OvNGmd_nB2p-V2Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX66YMCYrX0X//
 ruLw5rOOYS/AePzw2AOVv2ZH2vt1hFxzlshj7VuoyfM1oZR0PkoQW6/+HqA6pFTzQo0H492m7iO
 Vi/sDlp5m+7MR53UKLXFklmjJ/H/K1Y=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a439b6e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=jXtbBqSXKBoYJ-gSgDUA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115366-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:anyeloxd13@gmail.com,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 288536E30E7

On 6/20/26 2:54 AM, Angel Saucedo wrote:
> A quick follow-up on my previous email. I have made significant
> progress but hit a physical PMIC blocker:
> 
> The xHCI timeout (-110) is now completely RESOLVED (via a temporary
> kernel patch):
> 
> The DWC3 core was hanging when xHCI tried to register the USB 3.0 /
> SuperSpeed shared HCD, as Kiev lacks a SS PHY and its pipe_clk is
> disabled.

The SSPHY is physically there on the SoC

> Although my goal remains to run a 100% stock kernel (DTS-only
> changes), I patched xhci_setup_port_arrays() (xhci-mem.c) out of
> desperation to debug the timeout. Forcing allow_single_roothub = true
> and usb3_rhub.num_ports = 0 bypassed the USB 3.0 initialization, which
> successfully registered the USB 2.0 root hub without bus hangs.
> 
> I would like to find a clean, upstreamable way to achieve this
> single-roothub behavior (via a DTS property or driver quirk) without
> modifying C code.
> 
> New Blocker: PMIC WARM Reset (PS_HOLD drop):
> 
> The system boots stably to the shell in peripheral mode as long as no
> USB function/gadget is active.
> 
> However, the moment the physical DP/DM lines change state (either by
> enabling Host Mode or by writing the UDC name a600000.usb to bind any
> USB gadget function in Peripheral Mode), the PMIC (PM7250B) triggers
> an immediate hardware shutdown ("WARM reset by PS_HOLD").
> 
> I instrumented the driver step-by-step. The crash occurs exactly
> during the register write of the first control transfer on EP0:
> 
> configfs-gadget.g1 gadget.0: HOST MAC c6:57:d3:9b:75:22
> configfs-gadget.g1 gadget.0: MAC 16:dc:c3:bc:46:ef
> DEBUG: dwc3_gadget_pullup is_on=1
> DEBUG: dwc3_gadget_soft_connect started
> DEBUG: dwc3_gadget_soft_connect: dwc3_core_soft_reset ret=0
> DEBUG: dwc3_gadget_soft_connect: calling __dwc3_gadget_start
> DEBUG: __dwc3_gadget_start entered
> DEBUG: __dwc3_gadget_start: writing IMOD interval 1
> DEBUG: __dwc3_gadget_start: GRXTHRCFG = 0x00000000
> DEBUG: __dwc3_gadget_start: writing GRXTHRCFG = 0x00000000
> DEBUG: __dwc3_gadget_start: calling dwc3_gadget_setup_nump
> DEBUG: __dwc3_gadget_start: DCFG = 0x000c0804
> DEBUG: __dwc3_gadget_start: writing DCFG = 0x008c0804
> DEBUG: __dwc3_gadget_start: calling dwc3_gadget_start_config
> ...
> DEBUG: __dwc3_gadget_start: enabling ep0-in
> DEBUG: __dwc3_gadget_start: calling dwc3_ep0_out_start
> DEBUG: dwc3_ep0_out_start entered
> DEBUG: dwc3_ep0_out_start: preparing one TRB
> DEBUG: dwc3_ep0_out_start: calling dwc3_ep0_start_trans
> DEBUG: dwc3_ep0_start_trans entered for ep0
> DEBUG: dwc3_ep0_start_trans: calling dwc3_send_gadget_ep_cmd
> DEBUG: dwc3_send_gadget_ep_cmd: cmd=0x00000006, epnum=0
> DEBUG: dwc3_send_gadget_ep_cmd: reading GUSB2PHYCFG(0)
> DEBUG: dwc3_send_gadget_ep_cmd: writing DEPCMDPAR0-2 params:
> 0x00000001, 0x01ce9000, 0x00000000
> DEBUG: dwc3_send_gadget_ep_cmd: writing DEPCMD(0) = 0x00000406
> --> [CRASH - WARM RESET TO PBL]
> 
> Writing DWC3_DEPCMD_STARTTRANSFER (0x6) to DEPCMD(0) commands the DWC3
> core to start listening for SETUP packets on EP0, physically
> activating the transceiver/pull-up on the D+ line.
> 
> This sudden line transition triggers the PM7250B PMIC's autonomous
> Charger Detection (APSD). Since the mainline kernel lacks the PM7250B
> charging/power-negotiation stack (pmic-glink, typec-ucsi, charger/FG
> nodes) to handle it, the hardware panics.

Is this an observation backed up by some firm evidence, or a guess?

Are you perhaps missing an interconnect path or a iommus entry?

Konrad

