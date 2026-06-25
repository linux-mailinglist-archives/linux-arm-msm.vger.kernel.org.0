Return-Path: <linux-arm-msm+bounces-114541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BU0EFzkzPWp+ywgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:55:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A876C648D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:55:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BSIIZb8c;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114541-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114541-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F507302EA9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902AA348883;
	Thu, 25 Jun 2026 13:54:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247382571B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:54:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395681; cv=pass; b=rzL6kHt3vCRRFxdUIyzfg79MtAP92P35+SMSmXtE3UWbuWkdqxWFfJidMrx2qC1TI4tJFzlNJ/ms+S4ZVtKkcGc4b+Zg8BERlDjYVsgW+DOsyjcfuP+FoZAVlLWY5vpG9kNb2cL9Qv2TZzvROZfDfq6I7yOfLZedDoq9gz0UtCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395681; c=relaxed/simple;
	bh=7XRVG3OG2OGai7BMvMkmW2H7QvfOOUayHbIKz8xje1Y=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZkTF+bgkx0DRd1DFVQi4OSZYZaHdqVWZmOwkVwGF+7NDGnPRGuuTnqdjKmMBbjilDUSVX6U9um7tEijhysmFxyLPmPxUFU/7QnrfYjtQuuvrnEYyTjpirrTBwdOv4ioi6rq9+xVe/wy2XJ+McGVpSWhD4MleuWfGFkqiMm1PCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSIIZb8c; arc=pass smtp.client-ip=209.85.128.171
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8050b4da489so19109797b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 06:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782395678; cv=none;
        d=google.com; s=arc-20260327;
        b=PaqLs6K+uDD1yHfyvTQbq/ELvV7Y7UErLM4l+a44lwigRygLogC+GjcAgoro4oqzIH
         NCl3OhFgcDfv0MtTabYqgo/CK+znSmoZmL+hV4x6fFBh+r++++2LtGr7AU4gePWlKQpV
         iiJHqGGa0RUJE5DJpK2CE6dyDxX+02GOI16QBKqvZ5xqBnPBocpR1ONISyCHbJSxKEd4
         lQ51q0BiC8Mp2atkOBhn89OKXk/Prabqa5u+ACbWCdAuWG24z0HOVn7Zu1On8ctvQdHi
         /hrkYENVgR90t0ALrQc0RyugTAiHbMZd0RVSgiyyD5Rf/R9R9sdS7RutNwVXF8i5PGRE
         UB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=7XRVG3OG2OGai7BMvMkmW2H7QvfOOUayHbIKz8xje1Y=;
        fh=/+tyPhtBo4VFGohIaI45hQdvPJZ9asx1pAnjjD5d0m8=;
        b=fpvqzCg77K6RWXewB5UXxz9inVoNsMKn2PAz9m3sGZ8arvgSPoWttvA75twU9I2uKQ
         Hx9OyAI6l2fe8lmCWcd/hn4/hEH6hlBkaWTzQt366li4VSGXpl33are1YjidHc/TuAZ5
         FuGn2eFdOhFKIGAgJUn08pz1GrTKn/3FDwbZeclJZkta3lKRtT00ZUiRoqNzKJv9A3l1
         3RTffkg7t3QL7G+iqLju9ykDLqiQzVxb5SkhY7xfvHiQAACdK6mlnVBI6akXgjQjTScw
         NnzF7JIGIXWieGqMb4tvurr8rveKyBkf6tX6eIDm4RmF2BfRCi+zSphFO+sqBFHuePZ0
         0QOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782395678; x=1783000478; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7XRVG3OG2OGai7BMvMkmW2H7QvfOOUayHbIKz8xje1Y=;
        b=BSIIZb8cMB/D/Nu3nRz0IVBA+jjkcBtZFvBRFib7izauHyEQnfMxz8i57R6Uwb/Vco
         USuxaSi3Hw/4ed1R1YbRXOntH1CH1XvlYKZKFbmnL71hIb6dbYqqdXE+czfQNCJvCNgn
         NYpm2sFl7yFjow+31ubAt4p2wtplsyYjt2VpqzmTS++nBe8kptMJCn6S8l9/6cK9qp8X
         WYTo6SrI2mAUwiZXVtu0ITKHCXMJqXWmwDy2NNhYrzRdOKH3I7s8tyEJqv/waz9V3AAQ
         PmDvlYHutpN79mmvPUWP9u2G2DKJGMYo1zMFqk6hFAe3WLILHB/8y+VkLTjc8WbsEExB
         XDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782395678; x=1783000478;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XRVG3OG2OGai7BMvMkmW2H7QvfOOUayHbIKz8xje1Y=;
        b=k8nONNggUOYOdFofjVl4wya4XUBwfKolftLplcO186Xwky3db9zvk6L6nepgVFnlOM
         u1Tz4sGSU7bxNF9YdAsA5LCeZ7LHkw1o4Z8Bn9bx9S7JzfRp0iFlxgrJaEtzMSGo24ky
         b4iINguZu/jp1jGh5XqJ+2lGsFiEStw8G0mGuS4aE710AmgxK4curX5eoxqzqk6srCMp
         JySs/DiF8q4e+wkheWOWexbzjzpApaNGFIxdZxE6OnF2hnyAtMgAb3pWBKXOpjBYvs6g
         ONoy98Hd+nTfXKjjWIiZGvlGaSl9bHpsNwyXh3tTvY8jn1QFOBzlOekZKSVEr2s+MH1y
         YvzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdnMl32HOZ8D/QaO/bChRfxjXxldBqXqx+b9/MeWTARDNxQGc+HU71UlHQV2Daa+YGOjFnYfx7JW0rj7/k@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5CIXbCaPHezkU3CxOJH3CfAATz2939NAQw9ZE1f43AUBta4Mg
	6YtNZapoSK68+kGQgIIxXffXUxpWyPTQar0sKFRinXyex9NLxWb30MjfVAIJp+N3RGgyqc1rjEe
	dYZqb+HLLKGjLUx/k2b8xqu5opCSBvAc=
X-Gm-Gg: AfdE7clPTov77nnKgZ37Ip9LTfBxJLYYdDOiqq4Mc8gXmDu66NfbJLzCjC9dwpmuMPt
	vgIp2VJ0ZLNVKxearplqXJ/id283/KZgkfqyl1Ct7lYKj10H8NSSU1X0MmNWKrEEfOFxbszrkMp
	xoeI6s14iNufKB9TJOPe8sI40vik4dcyjPzPyobi9iyoxQfdSSHJoyANikPnz9yHjsZDsEPkAZM
	fTC4yxSH/b9T1KoV7XkvxU4gwZE3SgSsTikr0DRKWiIaf94xu32mEswsbGAnmkgdRhdf/UT7g==
X-Received: by 2002:a05:690c:601:b0:7cf:a117:4ece with SMTP id
 00721157ae682-80a6aa9a701mr24334237b3.10.1782395677680; Thu, 25 Jun 2026
 06:54:37 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 25 Jun 2026 06:54:37 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 25 Jun 2026 06:54:37 -0700
In-Reply-To: <2026062536-protrude-cufflink-9026@gregkh>
References: <20260625085659.4469-1-alhouseenyousef@gmail.com> <2026062536-protrude-cufflink-9026@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Thu, 25 Jun 2026 06:54:37 -0700
X-Gm-Features: AVVi8CfB6xgxNSJRVg7IHhBqLykN6qmH-xFnKERq2pkqqLxtfb0UcjcnMm6tmx8
Message-ID: <CAMuQ4bUtbJmDqLyipzhd8K4+PJcQ546g1=mF+rR17gZQfARnaw@mail.gmail.com>
Subject: Re: [PATCH 1/3] misc: fastrpc: reject oversized DMA allocations
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Amol Maheshwari <amahesh@qti.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114541-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,linuxfoundation.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4A876C648D

Hi Greg,

I found these by auditing the FastRPC ioctl and invoke paths after
Konrad pointed out that the related fixes should be grouped.

Testing was limited to git diff --check and checkpatch. I don't have
FastRPC hardware, and I could not do an object build in this tree
because bc is missing here.

I'll hold off on more FastRPC changes unless I can back them with a
tighter review and test story.

Thanks,
Yousef

On Thu, 25 Jun 2026 10:48:00 +0100, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Thu, Jun 25, 2026 at 10:56:57AM +0200, Yousef Alhouseen wrote:
> > FastRPC keeps invoke and mmap buffer sizes in u64 fields, but coherent
> > DMA allocation takes a size_t. On 32-bit builds, a size above SIZE_MAX
> > can be truncated before allocation while the larger value is still used
> > in the message sent to the DSP.
> >
> > Reject sizes that cannot fit in size_t before allocating the DMA buffer.
> > Also make the inline payload alignment step overflow-aware so a
> > near-U64_MAX accumulator cannot wrap before the later bounds checks.
> >
> > Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> > ---
> > drivers/misc/fastrpc.c | 13 +++++++++++--
> > 1 file changed, 11 insertions(+), 2 deletions(-)
> >
>
> Are you forgetting to include the tool information that you used to
> find/fix all of these issues? And how are they being tested?
>
> thanks,
>
> greg k-h

