Return-Path: <linux-arm-msm+bounces-109544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGDcIn9uE2oCBAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 23:32:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D08985C45BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 23:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42663300B601
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E4C332EC8;
	Sun, 24 May 2026 21:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="aHUkg6Qj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4474D281532
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 21:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779658356; cv=none; b=iGiNWltNkzsybVzyiYQl7m2eYiQ+iak1Vj0Kjs1+5QT5RFiJhjfatYjjuEOgR7ehaFm+0tQkxV5VpsdLVQi3JWX3jERIP/kRhk+tybg38C1VnB1sucRB4eNT20EaANCHGB0rtcePQOE9lbZKJUgWLkxhYeMgj/skFKnszjm5EBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779658356; c=relaxed/simple;
	bh=5a2+HLxQMUMgJINKrm43eiIZm/4ZJtV4Eg6Rj2K4T4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D5Mg4VwtJWJbV4LN690RrsYfB7L1sS5xX012gJRpkUgxfIQ/A/+WGQlqGaSnRpVC01z2BC5ZOXUzCx/YBR6E4otDPgj1i6hQo+WcxnYzsY/tnJCOQwWVSolV6MmaxnOSrQ0k1wGw0ayl7I3K9hPpKmIp4ZDaG5ekeagT7XCgIKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=aHUkg6Qj; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <ab26ea90-5f28-4582-8f82-3925471d917f@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779658348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zt5RINp/uhenX2tIAWFcoDiZdc5YR75o2ZI4vamwopM=;
	b=aHUkg6QjBBpY4qCrK6aP1U4dLQHIYBJXCQNXfRDk51+Oa635VMYkA/Jd+kEm+xvm5vXhjn
	sZMBPzLPVrEdwF+VQ6g/tzt4elO+h7Tdz3TQtP+QJVH5/O4jaQu/5l3r3VQZCzAPGgR/Is
	+j520yplIVv/Fkp9Z/Dp0uwIW06yHCTHpc/K1nVJ8wHHzVzTk78u/GoaEeNsqb8OWpK5ZW
	nZ2h6g5e+meRSy9/hfeg+QCqOqQTG1C9mTrpUDukNHq/9poMA1twK/ZQUrtxQl1cIEOQfL
	xpg61jZ0Lm7WrjasBzFL3bifVY26kfQLjDpz/sqi1lddC/xtivo8Vpe6b9qxzA==
Date: Sun, 24 May 2026 18:32:18 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v6 00/10] drm/msm/dp: Drop the HPD state machine
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	TAGGED_FROM(0.00)[bounces-109544-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,patchwork.freedesktop.org:url,packett.cool:mid,packett.cool:dkim]
X-Rspamd-Queue-Id: D08985C45BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/24/26 7:33 AM, Dmitry Baryshkov wrote:
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
>
> ---
> Changes in v6:
> - Corrected mismatch between Jessica's From and SoB emails
> - Corrected documentation and fixed style comments for
>    msm_dp_bridge_detect() (Bjorn, Konrad)
> - Changed msm_dp_bridge_atomic_enable() to bail out earlier in case of
>    link training failure (Konrad)
> - Corrected commit message for the link training commit to stop
>    mentioning event-related changes (Konrad)
> - Added kerneldoc to msm_dp_display_host_phy_init(), describing return
>    value (Konrad)
> - Switched to guard() instead of raw mutex_lock() (Konrad)
> - Link to v5: https://lore.kernel.org/r/20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com

Looks like v5 is already in linux-next.. merged in:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4d28d7f4c69895437aeb0337d5e8d3dc2a5395cf

~val


