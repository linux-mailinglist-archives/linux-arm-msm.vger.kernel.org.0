Return-Path: <linux-arm-msm+bounces-98309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL5GJBkHummmQgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 02:59:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 085942B513B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 02:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C86A300D939
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 01:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C2A450F2;
	Wed, 18 Mar 2026 01:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="stt9YDRu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B49224FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773799140; cv=none; b=hPJJvIOuzj9aCvApa1btnmt7jk72bB0hZNDzJ55R1YDESmsXGosY8Ur34UPc4Bp+Uso/ihh4BDjGQxr+2fajLM0FMBSvDMZq0Jx19AATk4ym9fJrVSVlcEJTAk3rjwTHKup1dsOKNmdkRsICXg4ajN/Pbe1FgCv8qirTdR9jBQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773799140; c=relaxed/simple;
	bh=JyMLJhd1UGbaqIUpV83QvoOoV3NMwwly5W6iPBOnkCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KnRxB1QrW4hrEUXDgofr65OY/pEqGarXr575VNuP66/5Ph4pKPXSFdj4428+gOTcCSTQ61wK+bx5tGczneWhNvvTPXchDZs8mbEKhnUqlb5hexkVcw86CTee7Cyfv0e3jv8bl/u4Us5SJ1nzhmizZ2w/yOUBayHIvGuU4iz9Wlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=stt9YDRu; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <aacb16c4-e9ad-4455-9636-740464c3273d@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773799136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2SvxubjTMbqqciMbziqIiQ2xfH3+6n9bjV5XXagZwI=;
	b=stt9YDRu9sZ/tnpYW1DfoMeG0rtqzqyOh7Glq+7bYo7dHcEKNOOfHe2hB+AZ659O9dMIMI
	GDFRZCZ1eIaMB0bf1yRfJOpkUjRWcWehCwi968j28AfggeIIwwkBaomKvhw73++mHtEatY
	Xk0/XVSXGGOyE14pLb1e0+tU1fpghmpaV1IhXaN6nrrQ3GbmKH+doWf7desEoBMEw8CD4C
	RvFzJYeC9Vq/B/5KLPnoDwFwtBo2b7lY73/IjZnkEtKU3nK7uL1YJSgmPu+5OEd9MqSVSC
	7zDvJOyUa+89aTg9K9XZs2ze5B9jWUgvWyap4fKAqDtyR8R9r4djPXHLbB+IJw==
Date: Tue, 17 Mar 2026 22:58:44 -0300
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
 <38e87937-194f-43ca-ab27-a3a9cf7267d4@packett.cool>
 <qr4anmqwa5imhx2gsftggqitasqdhr4bpqimn3e74zj5csgtvy@ozbsty6o33vg>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <qr4anmqwa5imhx2gsftggqitasqdhr4bpqimn3e74zj5csgtvy@ozbsty6o33vg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98309-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:dkim,packett.cool:email,packett.cool:mid]
X-Rspamd-Queue-Id: 085942B513B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/17/26 10:03 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 17, 2026 at 08:15:54PM -0300, Val Packett wrote:
>> On 3/16/26 12:23 AM, Dmitry Baryshkov wrote:
>>> On Sat, Mar 14, 2026 at 10:10:26PM -0300, Val Packett wrote:
>>>> On 3/14/26 9:51 PM, Val Packett wrote:
>>>>> On 3/13/26 10:09 PM, Dmitry Baryshkov wrote:
>>>>>> Currently, all HPD interrupt handling must go through the HPD state
>>>>>> machine.
>>>>>>
>>>>>> This has caused many issues where the DRM framework assumes that DP is
>>>>>> in one state while the state machine is stuck in another state.
>>>>>>
>>>>>> As discussed here [1], this series:
>>>>>>
>>>>>> - Removes the state machine
>>>>>> - Moves link training to atomic_enable()
>>>>>> - Changes the detect() behavior to return true if a display is
>>>>>> physically
>>>>>>      plugged in (as opposed to if the DP link is ready).
>>>>>> - Remove event queue and move internal HPD handling to hpd_notify()
>>>>>>
>>>>>> To correctly detect the displays which are plugged on boot on the boards
>>>>>> which use dp-connector devices, this series depends on [2]. USB-C and
>>>>>> eDP panels are handled natively.
>>>>>>
>>>>>> [1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738
>>>>>> [2] https://lore.kernel.org/all/20260314-dp-connector-hpd-v1-0-786044cedc17@oss.qualcomm.com/
>>>>> Unfortunately this currently seems to mostly break link training with
>>>>> USB-C, on x1e80100-dell-latitude-7455:
>>>>>
>>>>> [  102.190083] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link
>>>>> training #2 on phy 1 failed. ret=-110
>>>>> [  102.192846] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link
>>>>> training of LTTPR(s) failed. ret=-110
>>>>> [  102.211095] [drm:msm_dp_bridge_atomic_enable [msm]] *ERROR* Failed
>>>>> link training (rc=-104)
>>>>> [  102.211164] [drm:msm_dp_aux_isr [msm]] *ERROR* Unexpected DP AUX IRQ
>>>>> 0x01000000 when not busy
>>>>> [  102.247168] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link
>>>>> training #2 on phy 1 failed. ret=-110
>>>>> [  102.252859] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link
>>>>> training of LTTPR(s) failed. ret=-110
>>>>>
>>>>> [..]
>>>> Actually looks like that might've been due to having applied the [2]
>>>> dp-connector series from above.
>>> Interesting. The series only affects dp-connector. It can't affect
>>> pmic-glink usecase.
>>>
>>>> Removed it and rebooted, now plugging and unplugging multiple times between
>>>> the 2 ports works fine.
>>>>
>>>> Except unplug is still not reliable, the "ghost" monitor often remains after
>>>> unplugging.
>>> Does the patch at [3] fix the issue?
>>>
>>> [3] https://lore.kernel.org/linux-arm-msm/177362655076.7429.3868048981197120360.b4-ty@kernel.org/
>> Yes!
>>
>> Overall works better than ever now, looks like I can unplug the cable with
>> the laptop closed and then open it and it's all fine, and even play with
>> dual-role / gadget mode USB and plug the alt-mode/dock cable back in and it
>> doesn't crash.
> Tested-by?

Yeah, since I guess the link training is kinda orthogonal to this, sure!

Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455

>> Still, rare link training failures can happen, e.g.:
> Thanks!
>
> The link training is one of the items that I want to check next.
>

