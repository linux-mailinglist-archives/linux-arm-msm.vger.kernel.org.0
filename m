Return-Path: <linux-arm-msm+bounces-97712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBb+OBoHtmkC8gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 02:10:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9226E28FB49
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 02:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05DA03030FEB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 01:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30701D61A3;
	Sun, 15 Mar 2026 01:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Yhg6erNA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7544319DFAB
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 01:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773537047; cv=none; b=YQY884ioJ8hyh/NIKSKZdaw/01MWBKv0h+0XLFv6cB7av3OV4BVT8nzcnyZGyydwcVIXpRKknR6R085gZR1w88CWw/Qr3V3YIEvIwWLlZlDp17WMAkVprWox5Opjvf1UzkV9NiAXXtKJJJD0YjnzMNYAwcuStpglcXaUZASU3vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773537047; c=relaxed/simple;
	bh=3nRRNPYLErfflMV9/mB3oHuDOky3TPQ9fThXjoPbOyY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nKEoNfV9qOVPKQyD19K/dMktH/giM61G5snobkBIAB5krG+bASimytnx2ihQlGXgrKYbRaRziu5YOGVwFKNb5xsvKmwjQPk6S82yqCfMGqd3okoOlBkXnWjTYT8qopzd1T70D0IQ8F4+PUggGrN6TcYkhNNPPy+Rltxl+p2gB30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Yhg6erNA; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <a6190a6c-60ae-4d24-b396-089f3b42973f@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773537043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+M2XqJARgeruA5d7QVU8YedDhdC+J9lANvOsOGmSaa8=;
	b=Yhg6erNAzKMdqlQPS1Nb0IKtxcaawk5s6Sk5aNdYCAb9qp240eoN0ifGv/odNOgnbs1K0n
	kvjFuDRAP399aafLtSjZwNfx5Qy6ld/1uaGC6hfQrWYolhSKkPWnrnKgNnTuq/+hpAISx5
	OKIq0f4UFQzX3VU+EMBiCWuI67r0vXiGu6XPstSgsJ8Lv5XirrtGxxt4su4EiIuVgTnzTO
	BkGvmmWcZPNhFd+6g/aRSjmccBOZwdWNHK8YiTSyUPhgNnJgkHsROBzHyo3dWzW8JOXEdP
	f51Ni8RZToT0AAcGzsP2c9EX0efujnjKFckPv5lgmLW36KtEk5NQkb+zScKC5Q==
Date: Sat, 14 Mar 2026 22:10:26 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/10] drm/msm/dp: Drop the HPD state machine
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <9c4dad2c-25bd-47d2-bc40-9b551d023615@packett.cool>
Content-Language: en-US
In-Reply-To: <9c4dad2c-25bd-47d2-bc40-9b551d023615@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97712-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9226E28FB49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/14/26 9:51 PM, Val Packett wrote:
>
> On 3/13/26 10:09 PM, Dmitry Baryshkov wrote:
>> Currently, all HPD interrupt handling must go through the HPD state
>> machine.
>>
>> This has caused many issues where the DRM framework assumes that DP is
>> in one state while the state machine is stuck in another state.
>>
>> As discussed here [1], this series:
>>
>> - Removes the state machine
>> - Moves link training to atomic_enable()
>> - Changes the detect() behavior to return true if a display is 
>> physically
>>    plugged in (as opposed to if the DP link is ready).
>> - Remove event queue and move internal HPD handling to hpd_notify()
>>
>> To correctly detect the displays which are plugged on boot on the boards
>> which use dp-connector devices, this series depends on [2]. USB-C and
>> eDP panels are handled natively.
>>
>> [1] 
>> https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738
>> [2] 
>> https://lore.kernel.org/all/20260314-dp-connector-hpd-v1-0-786044cedc17@oss.qualcomm.com/
>
> Unfortunately this currently seems to mostly break link training with 
> USB-C, on x1e80100-dell-latitude-7455:
>
> [  102.190083] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link 
> training #2 on phy 1 failed. ret=-110
> [  102.192846] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link 
> training of LTTPR(s) failed. ret=-110
> [  102.211095] [drm:msm_dp_bridge_atomic_enable [msm]] *ERROR* Failed 
> link training (rc=-104)
> [  102.211164] [drm:msm_dp_aux_isr [msm]] *ERROR* Unexpected DP AUX 
> IRQ 0x01000000 when not busy
> [  102.247168] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link 
> training #2 on phy 1 failed. ret=-110
> [  102.252859] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link 
> training of LTTPR(s) failed. ret=-110
>
> [..]

Actually looks like that might've been due to having applied the [2] 
dp-connector series from above.

Removed it and rebooted, now plugging and unplugging multiple times 
between the 2 ports works fine.

Except unplug is still not reliable, the "ghost" monitor often remains 
after unplugging.

Almost nothing is logged to dmesg, literally I've only seen this line once:
[drm:msm_dp_panel_read_sink_caps [msm]] *ERROR* panel edid read failed

But I have unplugged the monitor now and I still see:

crtc[108]: crtc-1
         enable=1
         active=1
         self_refresh_active=0
         planes_changed=1
         mode_changed=0
         active_changed=0
         connectors_changed=0
         color_mgmt_changed=0
         plane_mask=2
         connector_mask=2
         encoder_mask=2
         mode: "3840x2560": 60 631750 3840 3888 3920 4000 2560 2563 2573 
2633 0x48 0x9
         lm[0]=2
         ctl[0]=1
         lm[1]=3
         ctl[1]=1
connector[38]: DP-2
         crtc=crtc-1
         [..]

and the compositor thinks it's still present, I can move the mouse to 
where the screen was etc.


~val


