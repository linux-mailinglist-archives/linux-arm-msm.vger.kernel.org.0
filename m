Return-Path: <linux-arm-msm+bounces-103969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOIsFV+d52ml+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 17:53:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF943CF9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 17:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5CC43014124
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9E528C2BF;
	Tue, 21 Apr 2026 15:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="cqcQxAX3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B1C313267
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786779; cv=none; b=UKRE0D1DeL9P856CJgWzeamO3nsGME002YqD/0ywa3+QdefLEkIMaQ7svac8aumcqai7q23M6AMaFmJECieXmxQ1HaNoh2D8E1RXEdvrveDWSDUH4nW6cfkYSSKpAB20nvvQYkfGAcX+GcHE91pflKETIg5H0p9VyoBVSDYi6Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786779; c=relaxed/simple;
	bh=ADPTNPcNngsBtU+kO72lu0Cf8uZCTIyjUrmakA9Qf1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCjupcVoQNHruXOt7Zy/OIV076X9RRwTwvjy9AqOaj5aVTAT5ISfEC37Xd560O50dDepO+eGTki860BivGQtSyLq5bw0ve8JzMQoTc6XR2LXeniB3rdASC8NQ2yTQersHCFTZXitomqLBUMuETgu8kEDgllNwZxPIFm8djqE778=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=cqcQxAX3; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <c9af4767-da4c-4e65-9e97-47434a893a73@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1776786766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUpEzNKW8mpVwevIJYS1mzUUZaX2RonolbUtkCtLrbs=;
	b=cqcQxAX3jV2NQtqyPY3WjUylp94HQCuI4o7uEIqwZ9YxUK6bJTBVOz0Ub3wyWP7TLtzlJG
	ERe42IGUSVr0B+IJht6wGFSiU4B7GKw/v5AE8IrBovscWpg8dVaE5B7d+3GO66UtKzcwkm
	4P1gm6KC/SXyriMMGhdHCAmVzGCBryUIB16X4CYEwuCzl1OUrkcii5CfEvuBosFKI+fDaK
	c2V3XJiPSErk3uuOqXiYZlmuItJ4JegjkDFt24/YWbKxTMnyZesARaMBk+I1GuoIiHBZ58
	9f3a0+f02YPhEOFPIh2zVJykEi4bMmPWN/dJwXXiJnJRmNQustLzFBHRp12uRg==
Date: Tue, 21 Apr 2026 12:52:37 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Re: [PATCH] arm64: dts: qcom: kodiak: Add missing clock votes for
 lpass_tlmm
To: Bhushan Shah <bhushan.shah@machinesoul.in>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260109-kodiak-lpass-tlmm-clocks-v1-1-746112687772@fairphone.com>
 <6749502.DvuYhMxLoT@antlia> <5976946.DvuYhMxLoT@antlia>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <5976946.DvuYhMxLoT@antlia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103969-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.7:email,packett.cool:dkim,packett.cool:mid]
X-Rspamd-Queue-Id: 0CEF943CF9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 1/20/26 7:53 AM, Bhushan Shah wrote:
> On Friday, 9 January 2026 21:08:32 IST Bhushan Shah wrote:
>> On Friday, 9 January 2026 20:44:34 IST Luca Weiss wrote:
>>> Without the correct clock votes set, we may be hitting a synchronous
>>> external abort error when touching the lpi registers.
>>>
>>>    Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
>>>    <...>
>>>    
>>>    Call trace:
>>>     lpi_gpio_read.isra.0+0x2c/0x58 (P)
>>>     pinmux_enable_setting+0x218/0x300
>>>     pinctrl_commit_state+0xb0/0x280
>>>     pinctrl_select_state+0x28/0x48
>>>     pinctrl_bind_pins+0x1f4/0x2a0
>>>     really_probe+0x64/0x3a8
>>>
>>> Add the clocks to fix that.
>>>
>>> Platforms with this SoC using AudioReach won't be impacted due to
>>> qcs6490-audioreach.dtsi already setting clocks & clock-names for
>>> q6prmcc. The sc7280-chrome-common.dtsi has also been adjusted to keep
>>> the behavior the same as they also do not use Elite with q6afecc.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> Tested-by: Bhushan Shah <bhushan.shah@machinesoul.in> # On fairphone-fp5
> As a follow-up;
>
> While this fixes original abort, it seems on some coldboots or as such(?); it fails
> to vote the clocks and then eventually soundcard fails to probe, so there is still
> some issue that needs to be solved.
>
> [   17.944296] Bluetooth: hci0: Frame reassembly failed (-84)
> [   20.961100] qcom-q6afe aprsvc:service:4:4: AFE failed to vote (3)
> [   20.961131] Failed to prepare clk 'core': -110
> [   20.961137] qcom-sc7280-lpass-lpi-pinctrl 33c0000.pinctrl: error -ETIMEDOUT: Can't enable clocks
> [   20.961144] qcom-sc7280-lpass-lpi-pinctrl 33c0000.pinctrl: probe with driver qcom-sc7280-lpass-lpi-pinctrl failed with error -110
>
> So far I was not able to find a precise pattern to this, but doing bunch of coldboots
> is most easiest way to reproduce I have found.

This issue has appeared for a fellow postmarketOS user in the audio 
chatroom on the sm8250-xiaomi-pipa, the most interesting thing is the 
error code that was returned:

[ 10.823380] PDR: Indication received from msm/adsp/audio_pd, state: 
0x1fffffff, trans-id: 1
[ 10.823413] qcom,apr 
17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: 
aprsvc:service:4:3
[ 10.823476] qcom,apr 
17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: 
aprsvc:service:4:4
[ 10.825541] qcom,apr 
17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: 
aprsvc:service:4:7
[ 10.826034] platform 17300000.remoteproc:glink-edge:apr:service@7:dais: 
Adding to iommu group 28
[ 10.826399] qcom,apr 
17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: 
aprsvc:service:4:8
[ 10.827469] qcom-q6afe aprsvc:service:4:4: cmd = 0x100f4 returned error 
= 0x16
[ 10.827512] qcom-q6afe aprsvc:service:4:4: Unknown cmd 0x100f4
…
[ 14.052896] qcom-q6afe aprsvc:service:4:4: AFE failed to vote (3)
[ 14.052934] va_macro 3370000.codec: probe with driver va_macro failed 
with error -110


Uhh, 0x16 is out of the known range of error codes!

q6dsp-errno.h both upstream and downstream ends at 0x15! Wat?!

(Also the "Unknown cmd" error message is confusing, it makes it seem 
like the ADSP had told us that it doesn't know the cmd, but in reality 
the *error handler* hit a path where it's an unknown opcode for its 
processing of the response!)


Thanks,
~val

