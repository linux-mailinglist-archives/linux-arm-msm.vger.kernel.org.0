Return-Path: <linux-arm-msm+bounces-98305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLuDJO/iuWmnPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 00:25:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BECBF2B4508
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 00:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABEC530952F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 23:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0DE36403B;
	Tue, 17 Mar 2026 23:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="VVSz6MKx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB5C37A4B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 23:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773789378; cv=none; b=Hv5cetNQI3Fl1GKyqrtOpNHU+8c9Tz6kp5HZxKKqgb61k30VU6E7DE+RdwUvio7a8C9QtYHeqIdcYlbEbVDOE8YxXE3I7E7LE5AqWNee8fGyqNVIYjnwp/ksCM7UAEaOXW6dyzgNE7qWN3VIPSziKxGQKnOOszkqqg7T9Tltmh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773789378; c=relaxed/simple;
	bh=8wSicQKYp8yZQoVw2E6pk1euWuEiQYS3kStQpRWSne8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWes9/XoYY/gTqFZWMIkYWbvt+l679/Q/QrEhGTTmiSiq0Okb4Ir7iRV7MMYdwAwqlVKJwlG83ac8E8d/eXklKFbCc2yODe/ncWuRHvUO4Xztqaao1lgW0317dUFBUEAkEEwJYgoNIygSvF9C1NAATbF44ApllfKPUk1U6QmnUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=VVSz6MKx; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <38e87937-194f-43ca-ab27-a3a9cf7267d4@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773789368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VcErkclH3L9E/GXGDuKWGCEmo5BAl3uZEFX21iMwOLs=;
	b=VVSz6MKx0S/HK/I+hQ8gdkNKH3DZwF07Glrv1kU4y/iDx+gbtasS70wScTrnRHqFUxKuYH
	mSDiB/BQYYO6S20zbeW0mcSweYqwFlgbN04EyfvMTTh5sCaSLgOwXebMLWrlbA/KQ89LXn
	snismBRPlCC5pCjn5Idb26ttGZUIM1JIcfYJgzPg7tweaoasoezaMuTSy92EMjC1dGCxwD
	zoYncYLJ2hVbWzoDHb9Q8XOjuyNO9ChQGb3wYRTY1I5oHpIsSaQdhwEC8khGqJu1AxtFGX
	UsgE6cIfAdv4Scnz8JMcq3MUYuyZqBrfT7AHGRg6z7/P9CmOhDRngqi9Vdu6zg==
Date: Tue, 17 Mar 2026 20:15:54 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/10] drm/msm/dp: Drop the HPD state machine
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <9c4dad2c-25bd-47d2-bc40-9b551d023615@packett.cool>
 <a6190a6c-60ae-4d24-b396-089f3b42973f@packett.cool>
 <itszs6eu7l2zix4stdiokftgxjpqlfukbqbdg4u3sestln6pgl@yq3wud26vi25>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <itszs6eu7l2zix4stdiokftgxjpqlfukbqbdg4u3sestln6pgl@yq3wud26vi25>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98305-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,60fps:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:dkim,packett.cool:mid]
X-Rspamd-Queue-Id: BECBF2B4508
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/16/26 12:23 AM, Dmitry Baryshkov wrote:
> On Sat, Mar 14, 2026 at 10:10:26PM -0300, Val Packett wrote:
>> On 3/14/26 9:51 PM, Val Packett wrote:
>>> On 3/13/26 10:09 PM, Dmitry Baryshkov wrote:
>>>> Currently, all HPD interrupt handling must go through the HPD state
>>>> machine.
>>>>
>>>> This has caused many issues where the DRM framework assumes that DP is
>>>> in one state while the state machine is stuck in another state.
>>>>
>>>> As discussed here [1], this series:
>>>>
>>>> - Removes the state machine
>>>> - Moves link training to atomic_enable()
>>>> - Changes the detect() behavior to return true if a display is
>>>> physically
>>>>     plugged in (as opposed to if the DP link is ready).
>>>> - Remove event queue and move internal HPD handling to hpd_notify()
>>>>
>>>> To correctly detect the displays which are plugged on boot on the boards
>>>> which use dp-connector devices, this series depends on [2]. USB-C and
>>>> eDP panels are handled natively.
>>>>
>>>> [1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738
>>>> [2] https://lore.kernel.org/all/20260314-dp-connector-hpd-v1-0-786044cedc17@oss.qualcomm.com/
>>> Unfortunately this currently seems to mostly break link training with
>>> USB-C, on x1e80100-dell-latitude-7455:
>>>
>>> [  102.190083] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link
>>> training #2 on phy 1 failed. ret=-110
>>> [  102.192846] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link
>>> training of LTTPR(s) failed. ret=-110
>>> [  102.211095] [drm:msm_dp_bridge_atomic_enable [msm]] *ERROR* Failed
>>> link training (rc=-104)
>>> [  102.211164] [drm:msm_dp_aux_isr [msm]] *ERROR* Unexpected DP AUX IRQ
>>> 0x01000000 when not busy
>>> [  102.247168] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link
>>> training #2 on phy 1 failed. ret=-110
>>> [  102.252859] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link
>>> training of LTTPR(s) failed. ret=-110
>>>
>>> [..]
>> Actually looks like that might've been due to having applied the [2]
>> dp-connector series from above.
> Interesting. The series only affects dp-connector. It can't affect
> pmic-glink usecase.
>
>> Removed it and rebooted, now plugging and unplugging multiple times between
>> the 2 ports works fine.
>>
>> Except unplug is still not reliable, the "ghost" monitor often remains after
>> unplugging.
> Does the patch at [3] fix the issue?
>
> [3] https://lore.kernel.org/linux-arm-msm/177362655076.7429.3868048981197120360.b4-ty@kernel.org/

Yes!

Overall works better than ever now, looks like I can unplug the cable 
with the laptop closed and then open it and it's all fine, and even play 
with dual-role / gadget mode USB and plug the alt-mode/dock cable back 
in and it doesn't crash.

Still, rare link training failures can happen, e.g.:

>> Almost nothing is logged to dmesg, literally I've only seen this line once:
>> [drm:msm_dp_panel_read_sink_caps [msm]] *ERROR* panel edid read failed
> You might want to use drm.debug=0x100 to get DP-related messages.


[ 3357.388123] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3357.388259] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3357.388383] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] After, type=10, sink_count=1
[ 3357.413042] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=1
[ 3357.413115] [drm:msm_dp_bridge_detect [msm]] aux link status: 0
[ 3357.413147] [drm:msm_dp_bridge_detect [msm]] aux not connected
[ 3357.413179] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3357.413208] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3357.413251] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=1
[ 3357.413282] [drm:msm_dp_bridge_detect [msm]] aux link status: 0
[ 3357.413309] [drm:msm_dp_bridge_detect [msm]] aux not connected
[ 3357.413340] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3357.413367] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3357.413400] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=0
[ 3357.414554] [drm:msm_dp_ctrl_phy_init [msm]] phy=00000000fe5b208d 
init=1 power_on=0
[ 3357.414587] [drm:msm_dp_bridge_detect [msm]] aux link status: 0
[ 3357.414614] [drm:msm_dp_bridge_detect [msm]] aux not connected
[ 3357.414641] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_exit [msm]] type=10 core_init=1 phy_init=1
[ 3357.415781] [drm:msm_dp_ctrl_phy_exit [msm]] phy=00000000fe5b208d 
init=0 power_on=0
[ 3357.415812] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3357.415840] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3357.415871] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=0
[ 3357.417034] [drm:msm_dp_ctrl_phy_init [msm]] phy=00000000fe5b208d 
init=1 power_on=0
[ 3357.417065] [drm:msm_dp_bridge_detect [msm]] aux link status: 0
[ 3357.417091] [drm:msm_dp_bridge_detect [msm]] aux not connected
[ 3357.417118] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_exit [msm]] type=10 core_init=1 phy_init=1
[ 3357.418258] [drm:msm_dp_ctrl_phy_exit [msm]] phy=00000000fe5b208d 
init=0 power_on=0
[ 3357.418290] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3357.418318] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3357.434909] [drm:msm_dp_ctrl_isr [msm]] idle_patterns_sent
[ 3357.435218] [drm:msm_dp_ctrl_push_idle [msm]] mainlink off
[ 3357.450864] [drm:msm_dp_panel_disable_vsc_sdp [msm]] vsc sdp enable=0
[ 3357.450971] [drm:msm_dp_ctrl_off [msm]] disable
[ 3357.452190] [drm:msm_dp_ctrl_link_clk_disable [msm]] disabled link clocks
[ 3357.452241] [drm:msm_dp_ctrl_link_clk_disable [msm]] stream_clks:off 
link_clks:off core_clks:on
[ 3357.452300] [drm:msm_dp_ctrl_off [msm]] phy=00000000646c90e2 init=1 
power_on=0
[ 3357.452354] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_exit [msm]] type=10 core_init=1 phy_init=1
[ 3357.453601] [drm:msm_dp_ctrl_phy_exit [msm]] phy=00000000646c90e2 
init=0 power_on=0
[ 3357.453657] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_atomic_post_disable [msm]] sink count: 1
[ 3357.453689] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_atomic_post_disable [msm]] type=10 Done
[ 3361.476013] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3361.476159] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3361.486575] [drm:msm_dp_ctrl_phy_init [msm]] phy=00000000646c90e2 
init=1 power_on=0
[ 3361.486649] [drm:msm_dp_bridge_detect [msm]] aux link status: 0
[ 3361.486710] [drm:msm_dp_bridge_detect [msm]] aux not connected
[ 3361.486770] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_exit [msm]] type=10 core_init=1 phy_init=1
[ 3361.487945] [drm:msm_dp_ctrl_phy_exit [msm]] phy=00000000646c90e2 
init=0 power_on=0
[ 3361.488008] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3361.488069] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3361.488139] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=0
[ 3361.489325] [drm:msm_dp_ctrl_phy_init [msm]] phy=00000000646c90e2 
init=1 power_on=0
[ 3361.489387] [drm:msm_dp_bridge_detect [msm]] aux link status: 0
[ 3361.489445] [drm:msm_dp_bridge_detect [msm]] aux not connected
[ 3361.489504] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_exit [msm]] type=10 core_init=1 phy_init=1
[ 3361.490791] [drm:msm_dp_ctrl_phy_exit [msm]] phy=00000000646c90e2 
init=0 power_on=0
[ 3361.490917] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3361.490987] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3361.491062] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=0
[ 3361.492249] [drm:msm_dp_ctrl_phy_init [msm]] phy=00000000fe5b208d 
init=1 power_on=0
[ 3361.492311] [drm:msm_dp_bridge_detect [msm]] aux link status: 0
[ 3361.492369] [drm:msm_dp_bridge_detect [msm]] aux not connected
[ 3361.492428] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_exit [msm]] type=10 core_init=1 phy_init=1
[ 3361.493560] [drm:msm_dp_ctrl_phy_exit [msm]] phy=00000000fe5b208d 
init=0 power_on=0
[ 3361.493621] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3361.493681] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3361.493747] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=0
[ 3361.494934] [drm:msm_dp_ctrl_phy_init [msm]] phy=00000000fe5b208d 
init=1 power_on=0
[ 3361.494995] [drm:msm_dp_bridge_detect [msm]] aux link status: 0
[ 3361.495053] [drm:msm_dp_bridge_detect [msm]] aux not connected
[ 3361.495111] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_exit [msm]] type=10 core_init=1 phy_init=1
[ 3361.496282] [drm:msm_dp_ctrl_phy_exit [msm]] phy=00000000fe5b208d 
init=0 power_on=0
[ 3361.496343] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3361.496403] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3361.992555] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3361.992598] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3361.992803] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=1
[ 3361.992823] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_plug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3361.992841] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=0
[ 3361.994079] [drm:msm_dp_ctrl_phy_init [msm]] phy=00000000fe5b208d 
init=1 power_on=0
[ 3361.994688] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3361.995528] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00000 AUX -> (ret= 15) 12 14 c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3361.996132] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3361.996955] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02200 AUX -> (ret= 15) 14 1e c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3361.997548] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.000160] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=0
[ 3362.001067] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0000 AUX -> (ret=  8) 20 1e 80 55 
04 00 01 07
[ 3362.001388] [drm:msm_dp_ctrl_phy_init [msm]] phy=00000000646c90e2 
init=1 power_on=0
[ 3362.001491] [drm:msm_dp_bridge_detect [msm]] aux link status: 0
[ 3362.001595] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0003 AUX <- 
(ret=  1) 55
[ 3362.001710] [drm:msm_dp_bridge_detect [msm]] aux not connected
[ 3362.001780] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_exit [msm]] type=10 core_init=1 phy_init=1
[ 3362.002103] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0003 AUX <- 
(ret=  1) aa
[ 3362.002609] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.002963] [drm:msm_dp_ctrl_phy_exit [msm]] phy=00000000646c90e2 
init=0 power_on=0
[ 3362.003029] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3362.003089] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3362.003161] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=0
[ 3362.003357] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00000 AUX -> (ret= 15) 12 14 c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3362.003860] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.004344] [drm:msm_dp_ctrl_phy_init [msm]] phy=00000000646c90e2 
init=1 power_on=0
[ 3362.004405] [drm:msm_dp_bridge_detect [msm]] aux link status: 0
[ 3362.004463] [drm:msm_dp_bridge_detect [msm]] aux not connected
[ 3362.004521] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_exit [msm]] type=10 core_init=1 phy_init=1
[ 3362.004646] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02200 AUX -> (ret= 15) 14 1e c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3362.005149] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.005656] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02210 AUX -> (ret=  1) 0a
[ 3362.005674] [drm:msm_dp_panel_read_sink_caps [msm]] max_lanes=4 
max_link_rate=810000
[ 3362.005929] [drm:msm_dp_panel_read_sink_caps [msm]] version: 1.4
[ 3362.005915] [drm:msm_dp_ctrl_phy_exit [msm]] phy=00000000646c90e2 
init=0 power_on=0
[ 3362.005982] [drm:msm_dp_panel_read_sink_caps [msm]] link_rate=810000
[ 3362.006035] [drm:msm_dp_panel_read_sink_caps [msm]] link_rate_set=0
[ 3362.006033] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3362.006094] [drm:msm_dp_panel_read_sink_caps [msm]] use_rate_set=0
[ 3362.006105] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3362.006290] [drm:msm_dp_panel_read_sink_caps [msm]] lane_count=4
[ 3362.184415] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.187917] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00200 AUX -> (ret=  1) 41
[ 3362.188478] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.191955] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00202 AUX -> (ret=  6) 00 00 80 00 00 00
[ 3362.192515] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.195938] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00201 AUX -> (ret=  1) 00
[ 3362.195989] [drm:msm_dp_link_process_request [msm]] device service 
irq vector = 0x0
[ 3362.196104] [drm:msm_dp_link_process_request [msm]] no test requested
[ 3362.196167] [drm:msm_dp_link_process_request [msm]] no phy test
[ 3362.196792] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.197346] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02006 AUX -> (ret=  1) 00
[ 3362.198130] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.198764] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02007 AUX -> (ret=  1) 00
[ 3362.198786] [drm:msm_dp_link_process_request [msm]] channel_eq_done = 
0, clock_recovery_done = 0
[ 3362.198900] [drm:msm_dp_link_process_request [msm]] sink request=0x80
[ 3362.199479] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.202837] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00600 AUX -> (ret=  1) 01
[ 3362.203442] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0x00600 AUX <- 
(ret=  1) 01
[ 3362.205529] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_plug_handle.isra.0 [msm]] After, type=10 sink_count=1
[ 3362.205773] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=1
[ 3362.205899] [drm:msm_dp_bridge_detect [msm]] aux link status: 0
[ 3362.206484] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.207282] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00000 AUX -> (ret= 15) 12 14 c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3362.207879] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.208760] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02200 AUX -> (ret= 15) 14 1e c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3362.209308] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.213021] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00400 AUX -> (ret= 12) 00 e0 4c 44 
70 31 2e 34 00 20 03 00
[ 3362.213084] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=1
[ 3362.213202] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_plug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3362.213270] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=1
[ 3362.214083] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.214987] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00000 AUX -> (ret= 15) 12 14 c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3362.215598] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.216480] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02200 AUX -> (ret= 15) 14 1e c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3362.217346] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.218261] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0000 AUX -> (ret=  8) 20 1e 80 aa 
04 00 01 07
[ 3362.219080] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0003 AUX <- 
(ret=  1) 55
[ 3362.219802] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0003 AUX <- 
(ret=  1) aa
[ 3362.220413] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.221259] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00000 AUX -> (ret= 15) 12 14 c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3362.221959] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.222911] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02200 AUX -> (ret= 15) 14 1e c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3362.223519] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.226930] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02210 AUX -> (ret=  1) 0a
[ 3362.226982] [drm:msm_dp_panel_read_sink_caps [msm]] max_lanes=4 
max_link_rate=810000
[ 3362.227098] [drm:msm_dp_panel_read_sink_caps [msm]] version: 1.4
[ 3362.227161] [drm:msm_dp_panel_read_sink_caps [msm]] link_rate=810000
[ 3362.227220] [drm:msm_dp_panel_read_sink_caps [msm]] link_rate_set=0
[ 3362.227278] [drm:msm_dp_panel_read_sink_caps [msm]] use_rate_set=0
[ 3362.227335] [drm:msm_dp_panel_read_sink_caps [msm]] lane_count=4
[ 3362.364434] sysfs: cannot create duplicate filename 
'/devices/platform/pmic-glink/pmic_glink.ucsi.0/typec/port1/port1.0/partner'
[ 3362.364458] CPU: 7 UID: 0 PID: 8343 Comm: kworker/u48:1 Tainted: G    
     W  7.0.0-rc4-next-20260316-00127-g71918c60b326-dirty #66 PREEMPT(full)
[ 3362.364470] Tainted: [W]=WARN
[ 3362.364472] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 
2.13.0 09/19/2025
[ 3362.364477] Workqueue: pmic_glink.ucsi.0-con2 ucsi_poll_worker 
[typec_ucsi]
[ 3362.364505] Call trace:
[ 3362.364509]  show_stack+0x20/0x38 (C)
[ 3362.364524]  dump_stack_lvl+0x60/0x80
[ 3362.364534]  dump_stack+0x18/0x28
[ 3362.364542]  sysfs_warn_dup+0x6c/0x90
[ 3362.364550]  sysfs_do_create_link_sd+0xf8/0x108
[ 3362.364556]  sysfs_create_link+0x28/0x50
[ 3362.364561]  typec_probe+0x98/0x120 [typec]
[ 3362.364587]  really_probe+0xc8/0x3f0
[ 3362.364598]  __driver_probe_device+0x88/0x170
[ 3362.364607]  driver_probe_device+0x48/0x130
[ 3362.364615]  __device_attach_driver+0xc4/0x190
[ 3362.364624]  bus_for_each_drv+0x90/0x100
[ 3362.364632]  __device_attach+0xa4/0x1e0
[ 3362.364640]  device_initial_probe+0x5c/0x78
[ 3362.364649]  bus_probe_device+0x3c/0xa8
[ 3362.364656]  device_add+0x61c/0x880
[ 3362.364665]  device_register+0x24/0x40
[ 3362.364671]  typec_register_altmode+0x1fc/0x300 [typec]
[ 3362.364687]  typec_partner_register_altmode+0x24/0x40 [typec]
[ 3362.364702]  ucsi_register_altmode.constprop.0+0x234/0x420 [typec_ucsi]
[ 3362.364713]  ucsi_register_altmodes+0x13c/0x200 [typec_ucsi]
[ 3362.364721]  ucsi_check_altmodes+0x24/0x100 [typec_ucsi]
[ 3362.364730]  ucsi_poll_worker+0x3c/0x100 [typec_ucsi]
[ 3362.364738]  process_one_work+0x174/0x540
[ 3362.364750]  worker_thread+0x1a8/0x320
[ 3362.364760]  kthread+0x140/0x158
[ 3362.364768]  ret_from_fork+0x10/0x20
[ 3362.364893] typec_displayport port1-partner.1: failed to create symlinks
[ 3362.364902] typec_displayport port1-partner.1: probe with driver 
typec_displayport failed with error -17
[ 3362.375605] sysfs: cannot create duplicate filename 
'/devices/platform/pmic-glink/pmic_glink.ucsi.0/typec/port1/port1.0/partner'
[ 3362.375630] CPU: 7 UID: 0 PID: 8343 Comm: kworker/u48:1 Tainted: G    
     W  7.0.0-rc4-next-20260316-00127-g71918c60b326-dirty #66 PREEMPT(full)
[ 3362.375641] Tainted: [W]=WARN
[ 3362.375644] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 
2.13.0 09/19/2025
[ 3362.375649] Workqueue: pmic_glink.ucsi.0-con2 ucsi_poll_worker 
[typec_ucsi]
[ 3362.375676] Call trace: <cut, same as before>
[ 3362.375971] typec_displayport port1-partner.2: failed to create symlinks
[ 3362.376030] typec_displayport port1-partner.2: probe with driver 
typec_displayport failed with error -17
[ 3362.376669] sysfs: cannot create duplicate filename 
'/devices/platform/pmic-glink/pmic_glink.ucsi.0/typec/port1/port1.0/partner'
[ 3362.376678] CPU: 7 UID: 0 PID: 8343 Comm: kworker/u48:1 Tainted: G    
     W  7.0.0-rc4-next-20260316-00127-g71918c60b326-dirty #66 PREEMPT(full)
[ 3362.376685] Tainted: [W]=WARN
[ 3362.376688] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 
2.13.0 09/19/2025
[ 3362.376691] Workqueue: pmic_glink.ucsi.0-con2 ucsi_poll_worker 
[typec_ucsi]
[ 3362.375676] Call trace: <cut, same as before>
[ 3362.377006] typec_displayport port1-partner.3: failed to create symlinks
[ 3362.377063] typec_displayport port1-partner.3: probe with driver 
typec_displayport failed with error -17
[ 3362.378069] sysfs: cannot create duplicate filename 
'/devices/platform/pmic-glink/pmic_glink.ucsi.0/typec/port1/port1.0/partner'
[ 3362.378077] CPU: 7 UID: 0 PID: 8343 Comm: kworker/u48:1 Tainted: G    
     W  7.0.0-rc4-next-20260316-00127-g71918c60b326-dirty #66 PREEMPT(full)
[ 3362.378083] Tainted: [W]=WARN
[ 3362.378085] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 
2.13.0 09/19/2025
[ 3362.378089] Workqueue: pmic_glink.ucsi.0-con2 ucsi_poll_worker 
[typec_ucsi]
[ 3362.375676] Call trace: <cut, same as before>
[ 3362.378341] typec_displayport port1-partner.4: failed to create symlinks
[ 3362.378398] typec_displayport port1-partner.4: probe with driver 
typec_displayport failed with error -17
[ 3362.379173] sysfs: cannot create duplicate filename 
'/devices/platform/pmic-glink/pmic_glink.ucsi.0/typec/port1/port1.0/partner'
[ 3362.379187] CPU: 5 UID: 0 PID: 8343 Comm: kworker/u48:1 Tainted: G    
     W  7.0.0-rc4-next-20260316-00127-g71918c60b326-dirty #66 PREEMPT(full)
[ 3362.379197] Tainted: [W]=WARN
[ 3362.379200] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 
2.13.0 09/19/2025
[ 3362.379204] Workqueue: pmic_glink.ucsi.0-con2 ucsi_poll_worker 
[typec_ucsi]
[ 3362.375676] Call trace: <cut, same as before>
[ 3362.379507] typec_displayport port1-partner.5: failed to create symlinks
[ 3362.379589] typec_displayport port1-partner.5: probe with driver 
typec_displayport failed with error -17
[ 3362.381535] sysfs: cannot create duplicate filename 
'/devices/platform/pmic-glink/pmic_glink.ucsi.0/typec/port1/port1.0/partner'
[ 3362.381548] CPU: 4 UID: 0 PID: 8343 Comm: kworker/u48:1 Tainted: G    
     W  7.0.0-rc4-next-20260316-00127-g71918c60b326-dirty #66 PREEMPT(full)
[ 3362.381559] Tainted: [W]=WARN
[ 3362.381561] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 
2.13.0 09/19/2025
[ 3362.381565] Workqueue: pmic_glink.ucsi.0-con2 ucsi_poll_worker 
[typec_ucsi]
[ 3362.375676] Call trace: <cut, same as before>
[ 3362.381920] typec_displayport port1-partner.6: failed to create symlinks
[ 3362.381927] typec_displayport port1-partner.6: probe with driver 
typec_displayport failed with error -17
[ 3362.383333] sysfs: cannot create duplicate filename 
'/devices/platform/pmic-glink/pmic_glink.ucsi.0/typec/port1/port1.0/partner'
[ 3362.383348] CPU: 5 UID: 0 PID: 8343 Comm: kworker/u48:1 Tainted: G    
     W  7.0.0-rc4-next-20260316-00127-g71918c60b326-dirty #66 PREEMPT(full)
[ 3362.383358] Tainted: [W]=WARN
[ 3362.383361] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 
2.13.0 09/19/2025
[ 3362.383365] Workqueue: pmic_glink.ucsi.0-con2 ucsi_poll_worker 
[typec_ucsi]
[ 3362.375676] Call trace: <cut, same as before>
[ 3362.383722] typec_displayport port1-partner.7: failed to create symlinks
[ 3362.383730] typec_displayport port1-partner.7: probe with driver 
typec_displayport failed with error -17
[ 3362.384590] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: con2: 
failed to register partner alt modes (-34)
[ 3362.516835] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.517434] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00200 AUX -> (ret=  1) 41
[ 3362.520983] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.521724] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00202 AUX -> (ret=  6) 00 00 00 00 00 00
[ 3362.522372] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.525930] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00201 AUX -> (ret=  1) 00
[ 3362.525982] [drm:msm_dp_link_process_request [msm]] device service 
irq vector = 0x0
[ 3362.526097] [drm:msm_dp_link_process_request [msm]] no test requested
[ 3362.526162] [drm:msm_dp_link_process_request [msm]] no phy test
[ 3362.527011] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.527666] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02006 AUX -> (ret=  1) 00
[ 3362.528307] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.529169] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02007 AUX -> (ret=  1) 00
[ 3362.529221] [drm:msm_dp_link_process_request [msm]] channel_eq_done = 
0, clock_recovery_done = 0
[ 3362.529336] [drm:msm_dp_link_process_request [msm]] sink request=0x80
[ 3362.530205] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.531083] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00600 AUX -> (ret=  1) 01
[ 3362.531727] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0x00600 AUX <- 
(ret=  1) 01
[ 3362.533630] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_plug_handle.isra.0 [msm]] After, type=10 sink_count=1
[ 3362.534076] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_get_modes [msm]] No sink connected
[ 3362.538898] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=0
[ 3362.540170] [drm:msm_dp_ctrl_phy_init [msm]] phy=00000000646c90e2 
init=1 power_on=0
[ 3362.540253] [drm:msm_dp_bridge_detect [msm]] aux link status: 0
[ 3362.540321] [drm:msm_dp_bridge_detect [msm]] aux not connected
[ 3362.540388] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_exit [msm]] type=10 core_init=1 phy_init=1
[ 3362.541639] [drm:msm_dp_ctrl_phy_exit [msm]] phy=00000000646c90e2 
init=0 power_on=0
[ 3362.541767] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3362.541837] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3362.541912] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=0
[ 3362.543117] [drm:msm_dp_ctrl_phy_init [msm]] phy=00000000646c90e2 
init=1 power_on=0
[ 3362.543180] [drm:msm_dp_bridge_detect [msm]] aux link status: 0
[ 3362.543239] [drm:msm_dp_bridge_detect [msm]] aux not connected
[ 3362.543298] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_exit [msm]] type=10 core_init=1 phy_init=1
[ 3362.544959] [drm:msm_dp_ctrl_phy_exit [msm]] phy=00000000646c90e2 
init=0 power_on=0
[ 3362.545086] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=2
[ 3362.545155] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_unplug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3362.545233] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=1
[ 3362.545296] [drm:msm_dp_bridge_detect [msm]] aux link status: 0
[ 3362.545889] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.546706] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00000 AUX -> (ret= 15) 12 14 c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3362.547212] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.547974] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02200 AUX -> (ret= 15) 14 1e c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3362.548485] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.549187] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00400 AUX -> (ret= 12) 00 e0 4c 44 
70 31 2e 34 00 20 03 00
[ 3362.549196] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, 
status=1
[ 3362.549229] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_plug_handle.isra.0 [msm]] Before, type=10 sink_count=1
[ 3362.549248] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=1
[ 3362.549767] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.550522] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00000 AUX -> (ret= 15) 12 14 c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3362.551028] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.551783] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02200 AUX -> (ret= 15) 14 1e c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3362.552289] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.552929] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0000 AUX -> (ret=  8) 20 1e 80 aa 
04 00 01 07
[ 3362.553432] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0003 AUX <- 
(ret=  1) 55
[ 3362.553936] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0003 AUX <- 
(ret=  1) aa
[ 3362.554440] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.555211] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00000 AUX -> (ret= 15) 12 14 c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3362.555719] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.556475] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02200 AUX -> (ret= 15) 14 1e c4 81 
01 00 01 80 02 00 06 00 00 00 84
[ 3362.556982] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.557489] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02210 AUX -> (ret=  1) 0a
[ 3362.557496] [drm:msm_dp_panel_read_sink_caps [msm]] max_lanes=4 
max_link_rate=810000
[ 3362.557516] [drm:msm_dp_panel_read_sink_caps [msm]] version: 1.4
[ 3362.557533] [drm:msm_dp_panel_read_sink_caps [msm]] link_rate=810000
[ 3362.557550] [drm:msm_dp_panel_read_sink_caps [msm]] link_rate_set=0
[ 3362.557572] [drm:msm_dp_panel_read_sink_caps [msm]] use_rate_set=0
[ 3362.557589] [drm:msm_dp_panel_read_sink_caps [msm]] lane_count=4
[ 3362.735545] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.736142] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00200 AUX -> (ret=  1) 41
[ 3362.736705] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.737305] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00202 AUX -> (ret=  6) 00 00 00 00 00 00
[ 3362.737847] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.738357] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00201 AUX -> (ret=  1) 00
[ 3362.738364] [drm:msm_dp_link_process_request [msm]] device service 
irq vector = 0x0
[ 3362.738401] [drm:msm_dp_link_process_request [msm]] no test requested
[ 3362.738420] [drm:msm_dp_link_process_request [msm]] no phy test
[ 3362.739147] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.739710] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02006 AUX -> (ret=  1) 00
[ 3362.740220] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.740926] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x02007 AUX -> (ret=  1) 00
[ 3362.740955] [drm:msm_dp_link_process_request [msm]] channel_eq_done = 
0, clock_recovery_done = 0
[ 3362.740993] [drm:msm_dp_link_process_request [msm]] sink request=0x80
[ 3362.741526] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.742240] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0x00600 AUX -> (ret=  1) 01
[ 3362.742802] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0x00600 AUX <- 
(ret=  1) 01
[ 3362.744562] msm_dpu ae01000.display-controller: 
[drm:msm_dp_hpd_plug_handle.isra.0 [msm]] After, type=10 sink_count=1
[ 3362.744737] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_get_modes [msm]] No sink connected
[ 3362.793900] [drm:msm_dp_panel_init_panel_info [msm]] SET NEW RESOLUTION:
[ 3362.794035] [drm:msm_dp_panel_init_panel_info [msm]] 3840x2560@60fps
[ 3362.794103] [drm:msm_dp_panel_init_panel_info [msm]] 
h_porches(back|front|width) = (80|48|32)
[ 3362.794163] [drm:msm_dp_panel_init_panel_info [msm]] 
v_porches(back|front|width) = (60|3|10)
[ 3362.794223] [drm:msm_dp_panel_init_panel_info [msm]] pixel clock 
(KHz)=(631750)
[ 3362.794281] [drm:msm_dp_panel_init_panel_info [msm]] bpp = 30
[ 3362.794339] [drm:msm_dp_panel_init_panel_info [msm]] updated bpp = 30
[ 3362.794401] msm_dpu ae01000.display-controller: 
[drm:msm_dp_display_host_phy_init [msm]] type=10 core_init=1 phy_init=1
[ 3362.794464] [drm:msm_dp_ctrl_core_clk_enable [msm]] core clks already 
enabled
[ 3362.794523] [drm:msm_dp_ctrl_on_link [msm]] rate=810000, num_lanes=4, 
pixel_rate=631750
[ 3362.798148] [drm:msm_dp_ctrl_enable_mainlink_clocks [msm]] enable 
link clocks
[ 3362.798207] [drm:msm_dp_ctrl_enable_mainlink_clocks [msm]] 
stream_clks:off link_clks:on core_clks:on
[ 3362.798266] [drm:msm_dp_ctrl_enable_mainlink_clocks [msm]] link 
rate=810000
[ 3362.798326] [drm:msm_dp_ctrl_setup_main_link [msm]] enable
[ 3362.798396] [drm:msm_dp_ctrl_config_ctrl [msm]] 
DP_CONFIGURATION_CTRL=0x4277
[ 3362.801890] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0x00101 AUX <- 
(ret=  1) 84
[ 3362.801943] [drm:msm_dp_ctrl_setup_main_link [msm]] using 
LINK_BW_SET: 0x1e
[ 3362.802738] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0x00100 AUX <- 
(ret=  1) 1e
[ 3362.803338] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0x00107 AUX <- 
(ret=  2) 10 01
[ 3362.803374] [drm:msm_dp_ctrl_set_pattern_state_bit [msm]] hw: bit=1 
train=1
[ 3362.803495] [drm:msm_dp_ctrl_train_pattern_set.isra.0 [msm]] sink: 
pattern=21
[ 3362.804149] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0010 AUX <- 
(ret=  1) 21
[ 3362.804185] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] voltage level: 0 
emphasis level: 0
[ 3362.804316] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] sink: p|v=0x0
[ 3362.808024] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0011 AUX <- 
(ret=  4) 00 00 00 00
[ 3362.808948] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.814044] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0030 AUX -> (ret=  5) 51 51 80 cc cc
[ 3362.814111] [drm:msm_dp_ctrl_link_train_1_2 [msm]] link training #1 
on phy 1 successful
[ 3362.818952] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.819651] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0020 AUX -> (ret=  1) 00
[ 3362.819681] [drm:msm_dp_ctrl_set_pattern_state_bit [msm]] hw: bit=8 
train=4
[ 3362.819852] [drm:msm_dp_ctrl_train_pattern_set.isra.0 [msm]] sink: 
pattern=7
[ 3362.820550] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0010 AUX <- 
(ret=  1) 07
[ 3362.825989] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.826718] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0030 AUX -> (ret=  5) 44 00 80 88 88
[ 3362.826749] [drm:msm_dp_link_adjust_levels [msm]] lane=0 
req_vol_swing=0 req_pre_emphasis=16
[ 3362.826910] [drm:msm_dp_link_adjust_levels [msm]] lane=1 
req_vol_swing=0 req_pre_emphasis=16
[ 3362.827003] [drm:msm_dp_link_adjust_levels [msm]] lane=2 
req_vol_swing=0 req_pre_emphasis=16
[ 3362.827087] [drm:msm_dp_link_adjust_levels [msm]] lane=3 
req_vol_swing=0 req_pre_emphasis=16
[ 3362.827170] [drm:msm_dp_link_adjust_levels [msm]] adjusted: 
v_level=0, p_level=2
[ 3362.827253] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] voltage level: 0 
emphasis level: 2
[ 3362.827357] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] sink: p|v=0x10
[ 3362.828263] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0011 AUX <- 
(ret=  4) 10 10 10 10
[ 3362.829446] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.830219] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0030 AUX -> (ret=  5) 44 00 00 cc cc
[ 3362.830269] [drm:msm_dp_link_adjust_levels [msm]] lane=0 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.830428] [drm:msm_dp_link_adjust_levels [msm]] lane=1 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.830519] [drm:msm_dp_link_adjust_levels [msm]] lane=2 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.830627] [drm:msm_dp_link_adjust_levels [msm]] lane=3 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.830709] [drm:msm_dp_link_adjust_levels [msm]] adjusted: 
v_level=0, p_level=3
[ 3362.830791] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] voltage level: 0 
emphasis level: 3
[ 3362.830893] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] max. 
pre-emphasis level reached 3
[ 3362.830975] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] sink: p|v=0x18
[ 3362.831727] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0011 AUX <- 
(ret=  4) 38 38 38 38
[ 3362.835630] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.840955] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0030 AUX -> (ret=  5) 44 00 00 cc cc
[ 3362.841024] [drm:msm_dp_link_adjust_levels [msm]] lane=0 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.841187] [drm:msm_dp_link_adjust_levels [msm]] lane=1 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.841279] [drm:msm_dp_link_adjust_levels [msm]] lane=2 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.841363] [drm:msm_dp_link_adjust_levels [msm]] lane=3 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.841445] [drm:msm_dp_link_adjust_levels [msm]] adjusted: 
v_level=0, p_level=3
[ 3362.841528] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] voltage level: 0 
emphasis level: 3
[ 3362.841686] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] max. 
pre-emphasis level reached 3
[ 3362.841769] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] sink: p|v=0x18
[ 3362.842745] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0011 AUX <- 
(ret=  4) 38 38 38 38
[ 3362.844085] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.844983] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0030 AUX -> (ret=  5) 44 00 00 cc cc
[ 3362.845034] [drm:msm_dp_link_adjust_levels [msm]] lane=0 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.845193] [drm:msm_dp_link_adjust_levels [msm]] lane=1 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.845283] [drm:msm_dp_link_adjust_levels [msm]] lane=2 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.845366] [drm:msm_dp_link_adjust_levels [msm]] lane=3 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.845448] [drm:msm_dp_link_adjust_levels [msm]] adjusted: 
v_level=0, p_level=3
[ 3362.845530] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] voltage level: 0 
emphasis level: 3
[ 3362.845650] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] max. 
pre-emphasis level reached 3
[ 3362.845731] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] sink: p|v=0x18
[ 3362.846654] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0011 AUX <- 
(ret=  4) 38 38 38 38
[ 3362.848029] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.848710] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0030 AUX -> (ret=  5) 44 00 00 cc cc
[ 3362.848742] [drm:msm_dp_link_adjust_levels [msm]] lane=0 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.848901] [drm:msm_dp_link_adjust_levels [msm]] lane=1 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.848992] [drm:msm_dp_link_adjust_levels [msm]] lane=2 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.849075] [drm:msm_dp_link_adjust_levels [msm]] lane=3 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.849157] [drm:msm_dp_link_adjust_levels [msm]] adjusted: 
v_level=0, p_level=3
[ 3362.849239] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] voltage level: 0 
emphasis level: 3
[ 3362.849340] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] max. 
pre-emphasis level reached 3
[ 3362.849422] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] sink: p|v=0x18
[ 3362.854846] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0011 AUX <- 
(ret=  4) 38 38 38 38
[ 3362.856226] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.861388] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0030 AUX -> (ret=  5) 44 00 00 cc cc
[ 3362.861456] [drm:msm_dp_link_adjust_levels [msm]] lane=0 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.861677] [drm:msm_dp_link_adjust_levels [msm]] lane=1 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.861769] [drm:msm_dp_link_adjust_levels [msm]] lane=2 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.861854] [drm:msm_dp_link_adjust_levels [msm]] lane=3 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.861937] [drm:msm_dp_link_adjust_levels [msm]] adjusted: 
v_level=0, p_level=3
[ 3362.862020] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] voltage level: 0 
emphasis level: 3
[ 3362.862123] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] max. 
pre-emphasis level reached 3
[ 3362.862205] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] sink: p|v=0x18
[ 3362.866462] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0011 AUX <- 
(ret=  4) 38 38 38 38
[ 3362.866528] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link 
training #2 on phy 1 failed. ret=-110
[ 3362.866760] [drm:msm_dp_ctrl_train_pattern_set.isra.0 [msm]] sink: 
pattern=0
[ 3362.871130] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0010 AUX <- 
(ret=  1) 00
[ 3362.871970] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.872606] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0020 AUX -> (ret=  1) 00
[ 3362.873148] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link 
training of LTTPR(s) failed. ret=-110
[ 3362.873322] [drm:msm_dp_ctrl_train_pattern_set.isra.0 [msm]] sink: 
pattern=0
[ 3362.874047] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0x00102 AUX <- 
(ret=  1) 00
[ 3362.892535] [drm:msm_dp_ctrl_on_link [msm]] disable
[ 3362.893940] [drm:msm_dp_ctrl_link_clk_disable [msm]] disabled link clocks
[ 3362.894108] [drm:msm_dp_ctrl_link_clk_disable [msm]] stream_clks:off 
link_clks:off core_clks:on
[ 3362.894236] [drm:msm_dp_ctrl_on_link [msm]] phy=00000000fe5b208d 
init=1 power_on=0
[ 3362.894325] [drm:msm_dp_bridge_atomic_enable [msm]] *ERROR* Failed 
link training (rc=-104)
[ 3362.894423] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_atomic_enable [msm]] sink_count=1
[ 3362.894509] [drm:msm_dp_ctrl_on_stream [msm]] rate=810000, 
num_lanes=4, pixel_rate=315875
[ 3362.894614] [drm:msm_dp_ctrl_on_stream [msm]] core_clk_on=1 
link_clk_on=0 stream_clk_on=0
[ 3362.894660] [drm:msm_dp_aux_isr [msm]] *ERROR* Unexpected DP AUX IRQ 
0x01000000 when not busy
[ 3362.898143] [drm:msm_dp_ctrl_enable_mainlink_clocks [msm]] enable 
link clocks
[ 3362.898226] [drm:msm_dp_ctrl_enable_mainlink_clocks [msm]] 
stream_clks:off link_clks:on core_clks:on
[ 3362.898308] [drm:msm_dp_ctrl_enable_mainlink_clocks [msm]] link 
rate=810000
[ 3362.898404] [drm:msm_dp_ctrl_setup_main_link [msm]] enable
[ 3362.898496] [drm:msm_dp_ctrl_config_ctrl [msm]] 
DP_CONFIGURATION_CTRL=0x4277
[ 3362.903345] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0x00101 AUX <- 
(ret=  1) 84
[ 3362.903410] [drm:msm_dp_ctrl_setup_main_link [msm]] using 
LINK_BW_SET: 0x1e
[ 3362.907853] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0x00100 AUX <- 
(ret=  1) 1e
[ 3362.908716] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0x00107 AUX <- 
(ret=  2) 10 01
[ 3362.908746] [drm:msm_dp_ctrl_set_pattern_state_bit [msm]] hw: bit=1 
train=1
[ 3362.908915] [drm:msm_dp_ctrl_train_pattern_set.isra.0 [msm]] sink: 
pattern=21
[ 3362.909789] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0010 AUX <- 
(ret=  1) 21
[ 3362.909839] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] voltage level: 0 
emphasis level: 0
[ 3362.910017] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] sink: p|v=0x0
[ 3362.910931] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0011 AUX <- 
(ret=  4) 00 00 00 00
[ 3362.911852] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.912490] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0030 AUX -> (ret=  5) 55 11 80 00 00
[ 3362.912520] [drm:msm_dp_ctrl_link_train_1_2 [msm]] link training #1 
on phy 1 successful
[ 3362.913296] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.913935] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0020 AUX -> (ret=  1) 00
[ 3362.913986] [drm:msm_dp_ctrl_set_pattern_state_bit [msm]] hw: bit=8 
train=4
[ 3362.914153] [drm:msm_dp_ctrl_train_pattern_set.isra.0 [msm]] sink: 
pattern=7
[ 3362.919517] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0010 AUX <- 
(ret=  1) 07
[ 3362.922815] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.923667] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0030 AUX -> (ret=  5) 44 00 80 88 88
[ 3362.923698] [drm:msm_dp_link_adjust_levels [msm]] lane=0 
req_vol_swing=0 req_pre_emphasis=16
[ 3362.923859] [drm:msm_dp_link_adjust_levels [msm]] lane=1 
req_vol_swing=0 req_pre_emphasis=16
[ 3362.923951] [drm:msm_dp_link_adjust_levels [msm]] lane=2 
req_vol_swing=0 req_pre_emphasis=16
[ 3362.924036] [drm:msm_dp_link_adjust_levels [msm]] lane=3 
req_vol_swing=0 req_pre_emphasis=16
[ 3362.924120] [drm:msm_dp_link_adjust_levels [msm]] adjusted: 
v_level=0, p_level=2
[ 3362.924202] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] voltage level: 0 
emphasis level: 2
[ 3362.924306] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] sink: p|v=0x10
[ 3362.925224] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0011 AUX <- 
(ret=  4) 10 10 10 10
[ 3362.926580] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.927474] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0030 AUX -> (ret=  5) 44 00 00 cc cc
[ 3362.927524] [drm:msm_dp_link_adjust_levels [msm]] lane=0 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.927709] [drm:msm_dp_link_adjust_levels [msm]] lane=1 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.927801] [drm:msm_dp_link_adjust_levels [msm]] lane=2 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.927884] [drm:msm_dp_link_adjust_levels [msm]] lane=3 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.927967] [drm:msm_dp_link_adjust_levels [msm]] adjusted: 
v_level=0, p_level=3
[ 3362.928049] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] voltage level: 0 
emphasis level: 3
[ 3362.928150] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] max. 
pre-emphasis level reached 3
[ 3362.928233] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] sink: p|v=0x18
[ 3362.929028] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0011 AUX <- 
(ret=  4) 38 38 38 38
[ 3362.930175] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.930889] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0030 AUX -> (ret=  5) 44 00 00 cc cc
[ 3362.930940] [drm:msm_dp_link_adjust_levels [msm]] lane=0 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.931099] [drm:msm_dp_link_adjust_levels [msm]] lane=1 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.931189] [drm:msm_dp_link_adjust_levels [msm]] lane=2 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.931272] [drm:msm_dp_link_adjust_levels [msm]] lane=3 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.931354] [drm:msm_dp_link_adjust_levels [msm]] adjusted: 
v_level=0, p_level=3
[ 3362.931436] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] voltage level: 0 
emphasis level: 3
[ 3362.931536] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] max. 
pre-emphasis level reached 3
[ 3362.931646] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] sink: p|v=0x18
[ 3362.932371] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0011 AUX <- 
(ret=  4) 38 38 38 38
[ 3362.936053] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.936963] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0030 AUX -> (ret=  5) 44 00 00 cc cc
[ 3362.937016] [drm:msm_dp_link_adjust_levels [msm]] lane=0 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.937177] [drm:msm_dp_link_adjust_levels [msm]] lane=1 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.937268] [drm:msm_dp_link_adjust_levels [msm]] lane=2 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.937351] [drm:msm_dp_link_adjust_levels [msm]] lane=3 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.937433] [drm:msm_dp_link_adjust_levels [msm]] adjusted: 
v_level=0, p_level=3
[ 3362.937514] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] voltage level: 0 
emphasis level: 3
[ 3362.937641] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] max. 
pre-emphasis level reached 3
[ 3362.937723] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] sink: p|v=0x18
[ 3362.938501] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0011 AUX <- 
(ret=  4) 38 38 38 38
[ 3362.943935] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.945316] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0030 AUX -> (ret=  5) 44 40 00 cc cc
[ 3362.945367] [drm:msm_dp_link_adjust_levels [msm]] lane=0 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.945529] [drm:msm_dp_link_adjust_levels [msm]] lane=1 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.945635] [drm:msm_dp_link_adjust_levels [msm]] lane=2 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.945718] [drm:msm_dp_link_adjust_levels [msm]] lane=3 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.945800] [drm:msm_dp_link_adjust_levels [msm]] adjusted: 
v_level=0, p_level=3
[ 3362.945882] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] voltage level: 0 
emphasis level: 3
[ 3362.945986] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] max. 
pre-emphasis level reached 3
[ 3362.946067] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] sink: p|v=0x18
[ 3362.950952] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0011 AUX <- 
(ret=  4) 38 38 38 38
[ 3362.952314] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.953207] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0030 AUX -> (ret=  5) 44 40 00 cc cc
[ 3362.953258] [drm:msm_dp_link_adjust_levels [msm]] lane=0 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.953419] [drm:msm_dp_link_adjust_levels [msm]] lane=1 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.953510] [drm:msm_dp_link_adjust_levels [msm]] lane=2 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.953609] [drm:msm_dp_link_adjust_levels [msm]] lane=3 
req_vol_swing=0 req_pre_emphasis=24
[ 3362.953691] [drm:msm_dp_link_adjust_levels [msm]] adjusted: 
v_level=0, p_level=3
[ 3362.953774] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] voltage level: 0 
emphasis level: 3
[ 3362.953877] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] max. 
pre-emphasis level reached 3
[ 3362.953960] [drm:msm_dp_ctrl_update_phy_vx_px [msm]] sink: p|v=0x18
[ 3362.954679] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0011 AUX <- 
(ret=  4) 38 38 38 38
[ 3362.954711] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link 
training #2 on phy 1 failed. ret=-110
[ 3362.954801] [drm:msm_dp_ctrl_train_pattern_set.isra.0 [msm]] sink: 
pattern=0
[ 3362.955398] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0xf0010 AUX <- 
(ret=  1) 00
[ 3362.956028] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> 
(ret=  1) 00
[ 3362.956599] msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_read 
[drm_display_helper]] dpu_dp_aux: 0xf0020 AUX -> (ret=  1) 00
[ 3362.957142] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link 
training of LTTPR(s) failed. ret=-110
[ 3362.957304] [drm:msm_dp_ctrl_train_pattern_set.isra.0 [msm]] sink: 
pattern=0
[ 3362.958191] msm_dpu ae01000.display-controller: 
[drm:drm_dp_dpcd_write [drm_display_helper]] dpu_dp_aux: 0x00102 AUX <- 
(ret=  1) 00
[ 3362.976554] [drm:msm_dp_ctrl_config_ctrl [msm]] 
DP_CONFIGURATION_CTRL=0x4277
[ 3362.976783] [drm:msm_dp_ctrl_on_stream [msm]] misc settings = 0x41
[ 3362.976877] [drm:msm_dp_panel_timing_cfg [msm]] width=3840 hporch= 80 
48 32
[ 3362.976969] [drm:msm_dp_panel_timing_cfg [msm]] height=2560 vporch= 
60 3 10
[ 3362.977067] [drm:msm_dp_panel_timing_cfg [msm]] wide_bus_en=1 reg=0x10
[ 3362.977152] [drm:msm_dp_ctrl_on_stream [msm]] mvid=0x12822, nvid=0x17bb0
[ 3362.977264] [drm:msm_dp_ctrl_on_stream [msm]] n_sym = 30, num_of_tus 
= 480
[ 3362.994315] [drm:msm_dp_ctrl_on_stream [msm]] TU: valid_boundary_link: 30
[ 3362.994401] [drm:msm_dp_ctrl_on_stream [msm]] TU: delay_start_link: 20
[ 3362.994483] [drm:msm_dp_ctrl_on_stream [msm]] TU: 
boundary_moderation_en: 1
[ 3362.994680] [drm:msm_dp_ctrl_on_stream [msm]] TU: 
valid_lower_boundary_link: 29
[ 3362.994763] [drm:msm_dp_ctrl_on_stream [msm]] TU: upper_boundary_count: 1
[ 3362.994845] [drm:msm_dp_ctrl_on_stream [msm]] TU: lower_boundary_count: 3
[ 3362.994927] [drm:msm_dp_ctrl_on_stream [msm]] TU: tu_size_minus1: 39
[ 3362.995259] [drm:msm_dp_ctrl_isr [msm]] dp_video_ready
[ 3362.995423] [drm:msm_dp_ctrl_on_stream [msm]] mainlink READY
[ 3362.995579] msm_dpu ae01000.display-controller: 
[drm:msm_dp_bridge_atomic_enable [msm]] type=10 Done


~val


