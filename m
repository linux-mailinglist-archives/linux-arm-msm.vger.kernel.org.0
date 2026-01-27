Return-Path: <linux-arm-msm+bounces-90684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK4qLjqJeGmqqwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:45:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3106891F5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 404D9305FBE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959EB332EA5;
	Tue, 27 Jan 2026 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="i6hy5OhT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7743358B0
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507031; cv=none; b=AITTcCoFX2f7dgsA+fUwtAH7yo4n9S1XZGxfZryTLe3i6aQhAKP+dn7cy496nvPaTovmGc7dXkiMAwDw9Xp9Yof75oddJnKCZxskJ9qtLwUsk2anvFK7SMdC3IvppgbP5rMJJN/LsMzXg7EY3lEk7NtyIZyClaJS1mpEfQkT+eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507031; c=relaxed/simple;
	bh=G01lHAfwUNP/fW/Xl9YZTCoD8RDMZu5h9EXF8RjXpMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9DFGRyLDR8RXgeSnVbKj9F93rZJ01oLvKEzvkm8n8heMNmKSqTy8KpSvKcUuVwv8f2ufhgFXMSaAyFKLhf4I0qRoWkbI3Nh1+yYNoTrKwiJlvGYjznU8wgAlYtw2L70cbD06QL4gGQDE8/ZWuO6xWs7EzHTHLIgmx5lf2cEmDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=i6hy5OhT; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1769507026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bdTrt5yTViLMoxGqfPI2tzzVWJf6+qHces4GsCpsQDw=;
	b=i6hy5OhTkrEK1JWbJlqEJ6KvqNDCm4DL9hLJul51zp0E4tHfqYHY4QfWaTutTtwgajhw+A
	k4CFnhPvrInf+TwZPm2/+/6Msf48vLqeJZbTqt1wM7hEJlbQczpQc+krZK+FbG96NuR/55
	q0tOiHQzlscw/JxmGwq6n1ThmwY/X1LHXI1g1s7XVXKJcl5goG9f10/5wE1LsJDc0g3a/z
	Dx016l4YYXoOoVWJGpH0304hs9WEVndY/6PK4Wb1RBc1cfyKd8akP3KhMEeWDFRhUeCJRK
	oiEgfnO9cvUeY2uMJ0xKU/JpPQ8slVJ4NES3f4m25kXNOWM7VcdN2fb22NRgfg==
Date: Tue, 27 Jan 2026 06:43:32 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-90684-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:dkim,packett.cool:url,packett.cool:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 3106891F5C
X-Rspamd-Action: no action

Hi,

On 1/15/26 5:05 PM, Dmitry Baryshkov wrote:
> On most of the platforms only some mixers have connected DSPP blocks.
> If DSPP is not required for the CRTC, try looking for the LM with no
> DSSP block, leaving DSPP-enabled LMs to CRTCs which actually require
> those.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 52 +++++++++++++++++++++++++---------
>   1 file changed, 38 insertions(+), 14 deletions(-)


this has massively broken things on my x1e device (latitude-7455):

- upon booting into gdm, the internal display is all dark blue
- suspend-resume makes gdm appear fine, then logging in results in 
another blue screen, again bypassed by suspend-resume (vt switching back 
to gdm makes it appear fine but switching back to the session, it's 
still blue)
- OR blindly logging in on the blue gdm makes the session appear
- plugging in an external display makes the blue screen flash constantly 
over the contents, there is also a flashing vertical gap between 2 
halves of the internal screen (amazing effect) and the external display 
doesn't actually refresh the contents under the blue 
(https://owo.packett.cool/dbg/dspp-lm-boom.webm)

Consistently across 3 reboots.

Reverted only this commit and it's back to normal, so I'm pretty sure 
it's this.

/sys/kernel/debug/dri..: https://owo.packett.cool/dbg/bluewtf.dri


~val


