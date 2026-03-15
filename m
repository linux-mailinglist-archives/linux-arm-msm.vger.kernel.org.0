Return-Path: <linux-arm-msm+bounces-97711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IrWFosCtmk98QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 01:51:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AAC28FAC0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 01:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06D2030530F7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 00:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3347B78F4A;
	Sun, 15 Mar 2026 00:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="DRvR4QUU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F3F286A9
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 00:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773535880; cv=none; b=eGR5R/ixFjkZE3cecPO2cn16VwJ7oXAOrC6HjEjn8EJJe1hVVYFKGMB6ROEEf+BT4QFAlSelajKYCYAtD/Tm02CNM2OWEmdsgbraJnUcMZ5F5LU8gRVoNSjku9t/gt4iZSHr1ozyab1QkKzAYleyE+Jvc7pr3sa9Jjv+eoHo4Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773535880; c=relaxed/simple;
	bh=log4Wo3l5RDbgapviPP+X1VkM+IbIPb2uLC6TKfEvr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A9GbPoOZ/a4xD9OOW3FYSfSrGIYFEoUwq+/boAaJsakfjCelZZfenfG9Sgh4jbxRUBBb4B+o7FINYAiDi+iPtUAXybm5f+Clqg6J9NyHOkFVE3WYMq7IyeFeExlUtyZPImVPLQjuyDMeNoSbwn8cMaT/bQhTnIhWwIDQkdUFbmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=DRvR4QUU; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <9c4dad2c-25bd-47d2-bc40-9b551d023615@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773535875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZtyxbHkiRBLwkPVgVeFtZ6s5sbnrf0HLktsBRDQ70o=;
	b=DRvR4QUUdqxmEinGhXNRb4gRM7g8mkFIpCHdTiH6PJE7H5JhibRgd4pS88h+hZv59j7Ex9
	76KhGcl5ZJR+X8ifbpSeb7q7+4mP+da/nIYk3R5rhRn1y1v9Xm8FJXmrMNQ2TzW2PcbkO6
	8XzVMUvK1nur0gdbg5XHAtwD8Qbzelbc0vIGw70deJxpjaQTE1Oal9Ehz3HBy+XlyedRcf
	nRVzZs8RN+56vj4D7Unllkyts2uMchL+tYWHYqCvpgaXXtvjih1K5x87r6Qt1KyIVN59R/
	kK/WxLHJssPmgb4vtvzRJQoPl7p5VZcUmtcAReEfU3E6Roa4mxem0VJoRZ1Xag==
Date: Sat, 14 Mar 2026 21:51:02 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/10] drm/msm/dp: Drop the HPD state machine
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97711-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,patchwork.freedesktop.org:url]
X-Rspamd-Queue-Id: A8AAC28FAC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/26 10:09 PM, Dmitry Baryshkov wrote:
> Currently, all HPD interrupt handling must go through the HPD state
> machine.
>
> This has caused many issues where the DRM framework assumes that DP is
> in one state while the state machine is stuck in another state.
>
> As discussed here [1], this series:
>
> - Removes the state machine
> - Moves link training to atomic_enable()
> - Changes the detect() behavior to return true if a display is physically
>    plugged in (as opposed to if the DP link is ready).
> - Remove event queue and move internal HPD handling to hpd_notify()
>
> To correctly detect the displays which are plugged on boot on the boards
> which use dp-connector devices, this series depends on [2]. USB-C and
> eDP panels are handled natively.
>
> [1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738
> [2] https://lore.kernel.org/all/20260314-dp-connector-hpd-v1-0-786044cedc17@oss.qualcomm.com/

Unfortunately this currently seems to mostly break link training with 
USB-C, on x1e80100-dell-latitude-7455:

[  102.190083] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link 
training #2 on phy 1 failed. ret=-110
[  102.192846] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link 
training of LTTPR(s) failed. ret=-110
[  102.211095] [drm:msm_dp_bridge_atomic_enable [msm]] *ERROR* Failed 
link training (rc=-104)
[  102.211164] [drm:msm_dp_aux_isr [msm]] *ERROR* Unexpected DP AUX IRQ 
0x01000000 when not busy
[  102.247168] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link 
training #2 on phy 1 failed. ret=-110
[  102.252859] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link 
training of LTTPR(s) failed. ret=-110


Once I did get it to connect on one of the ports, but then on unplug it 
didn't detect the unplug properly and continued trying to use the link:

[ 1418.418954] disp_cc_mdss_dptx1_link_clk status stuck at 'off'
<trace cut>
[ 1418.420950] Failed to enable clk 'ctrl_link': -16
[ 1418.420959] [drm:msm_dp_ctrl_enable_mainlink_clocks [msm]] *ERROR* 
Unable to start link clocks. ret=-16
[ 1418.421058] [drm:msm_dp_bridge_atomic_enable [msm]] *ERROR* Failed 
link training (rc=-16)
<trace cut>
[ 1418.423228] Failed to enable clk 'ctrl_link': -16
[ 1418.423234] [drm:msm_dp_ctrl_enable_mainlink_clocks [msm]] *ERROR* 
Unable to start link clocks. ret=-16
[ 1418.423325] [drm:msm_dp_ctrl_on_stream [msm]] *ERROR* Failed to start 
link clocks. ret=-16
[ 1418.476234] [drm:dpu_encoder_phys_vid_wait_for_commit_done:543] [dpu 
error]vblank timeout: 808208c0
[ 1418.476272] [drm:dpu_kms_wait_for_commit_done:527] [dpu error]wait 
for commit done returned -110
[ 1418.509204] [drm:dpu_encoder_frame_done_timeout:2731] [dpu 
error]enc37 frame done timeout
[ 1419.163337] [drm:dpu_encoder_phys_vid_wait_for_commit_done:543] [dpu 
error]vblank timeout: 808208c0
[ 1419.163365] [drm:dpu_kms_wait_for_commit_done:527] [dpu error]wait 
for commit done returned -110

But after reboot, link training was failing on both ports..


Thanks,
~val


