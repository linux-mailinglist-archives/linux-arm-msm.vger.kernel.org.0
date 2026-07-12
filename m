Return-Path: <linux-arm-msm+bounces-118555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D2tAMHZ/U2qJbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:50:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D10744874
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:50:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=VyLKFN2N;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118555-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118555-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B935301DCC7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 11:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBD4399013;
	Sun, 12 Jul 2026 11:50:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D013310645
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:50:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857011; cv=pass; b=eWNcsX3pvi2H72osAkrFz4gDc3RewGLd7RpXU89LHJcwginOw4Us4wZfO1iasdmoa0oHo6bGihChpE1Y4TSkccBuFRA9ov9TWsY4Av4Bzg+ijT+OZWpB9iVFHOVSOTlNe8XwirK+/JhT6N6RKKr0L2i+B0ZQIfGyx3Z4pfbasG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857011; c=relaxed/simple;
	bh=zTSiCktsBx0Ihn0W6dMmRNBU4InDI+KPZnpX31zPVF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fU9FqH9l0IHWtQ/P0fjrp0NkV7z+4G9xUPAr+mpqKYWJ4zkpNs1eYxIt/w9PP8hDhNjdI/rUNHMQXggMsyjWuZ+19a+rzlPuAOfCE61jFkAIOk0/DCS4YwFCb804t7ojWpMlzhtSdlkJF75JPAhw36eV7avtXAKQETxqHurttp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=VyLKFN2N; arc=pass smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381216921aaso2546093a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 04:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783857010; cv=none;
        d=google.com; s=arc-20260327;
        b=AMkK1vbIYe19jpI/MAPS93PYmYv388bkE5ec/LJS9SKlhzXxZn3Gs/j44QHw6j2dRX
         qhJrMmI7l58Lgbx4DT8DLyURknCacC3MMTV4yhhshg1GL3Ielxxg6UdfhXpArz1PgK32
         55UnHi/HUEKfcolXLMqb99wDVDR7dDckklAcf93trW3kwdurLLmkKeU+SJyBK6P7HePW
         waG8BLXhDpYNJdaED6GP05hRHa6ccA2vdeIwIhoPsY65NqNTF5z3UDI+3Ow6bz8cj4vC
         wNTaqx23RCb6/izgXveISr7mgv8Verep6y3IspGkriWI7CTVPKQ6aFFdIivkpXCdmOhf
         6Aag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sp9a2KMToJnfNko4S/JCutxocl3+KvZJzirc4K2SinU=;
        fh=gw/e4AiI+dNfQE+mOx7T/I4jAOlroh4oTLnpz8HKofI=;
        b=Fm5ElcE2jCYmFjxj2J5UH0JTY7RyyolAROfIHFdKaf7tkJEI+4Bp7S84d5PfIXCuKq
         n+o3CVRmLm8xabNiBtXWk6MtoffgCVqaSno8ujmgEN+DeNtMz+wwbDBYbeBG3048K4wJ
         kfKD2jev6QEnFYQWDLOGzZAbViaMEQZ/Q/bbWjtNI+d5h3gqqxoulnYYlajhmT0UGMpw
         EZPQUdQT04Pgo1vy6pgHHyoEmNHxMvaid7j9jKOqWMeffQDz5Nt2EleXalyZRf/5VRs/
         hVXPaDUSWfu2uWhuXn+c0wRFGrgTdyf6MJhZSSfpwxTvZOhVuCrnYYRt6GMYlLbpVpfy
         5oGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1783857010; x=1784461810; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sp9a2KMToJnfNko4S/JCutxocl3+KvZJzirc4K2SinU=;
        b=VyLKFN2NRJDZOsCeYGy2eGvQliap8evsLmOy5Tj0XWMSPM+R00J9hSelyg2rdrIUME
         utFHxUI3MdKOhiN6XRhachLhv3lrzJHmDaLzkWTMl/CBQyovFIs4xIVDCyZhzYCR+D96
         /8FjafnxYNdojHtuCmkIElpTpUqROCvFvx7xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857010; x=1784461810;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sp9a2KMToJnfNko4S/JCutxocl3+KvZJzirc4K2SinU=;
        b=PWc+5Mgf1xsVo6fzlC+y2iFOD1pdkRnAsxK2zYK0cZMV6VZYstLKkbygvO12+aaAVw
         48yi7lxUH098yv/Lgy6s+ZRXCUyIZbOGJB5mZ3RaSl/zBkNvR00qwO3oFmEbkakjwwjb
         Fauthx4nN1NCNuMA4JfJZK9TuhWSCT0eFymFWjqkfqmv+w08RlvU1AIrxoC4yxj8+MEp
         sC0aOykY5q9E3DVHi5vuOyehaRKbNhVdzNqIp8EG67ht4QqacxOQBx6UIGta9b91Jsqr
         NeywUw242Xp2/QApk+HuEzoxxoI0+bOvyqaoLeAeJjDqnYIy0OLCtwaHQPWgo+m8NiRc
         xgJQ==
X-Gm-Message-State: AOJu0YwEGDqPiXhcJAnvrMQ+WJETQa0oDw6vetVUzDqccdl7rPN3bAAB
	Z1dt3yicm9QwmQ7DIBtMUr8Aah+/hLLo2f36Jy09kLqzmReD30/BRZTy20HmIWF/hFSaLCbJm+c
	aUihnyFM714jZA92Q86bIKKTIQf34unkwKSkhxb3SkiudB4mFrqFG5dnssQ==
X-Gm-Gg: AfdE7cmsLlqPo7eZZk7Evm7d2o13nR58AeVYnVsfWDrDjRa13WWFIldgs42yyS4qCSG
	rSth23esb3qkDZw4yRna6nGWBdb3bn/J0yuJ1OehXz+/rkPElqdSG3bUxFU8u3UURj3xLptJfWd
	1ZMJP2XVNfyEvaV6kjzKYYz+rf9FJvSqZkU5KbpqdRJVJMbKlLdAJ+PZoCbkBl+QF/8Xg56NIIr
	Aw2tJ6lhHeUrgEAmvmOmnJELni8D1HBDW/ekVRzfMxy6H0rv0FMB0fc3ZNfyJbmB+xC27FWSizH
	vwObqaY6DtCV6/gjHBfk9WcVcvmNeRxhAAxxq/5lp7VcGz6W4LAFwFaCty++FkbLWIpKUZy6uIV
	30vOMql1FFpoDk8REOnnoTkWE2PwRzx6EDanE1n2HdichR3GCaQazVu1yX2h00IEuOUck6x+5pd
	p5x1cCinZKdqmpdzHbcd96ynBCd6HdCpK8oIIMZM8981VMWQ9kJKwg4UuxhpvTDWGTz5Flcww=
X-Received: by 2002:a17:90b:314c:b0:380:94de:155e with SMTP id
 98e67ed59e1d1-38dc73c1d67mr5199069a91.5.1783857009794; Sun, 12 Jul 2026
 04:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMVG2st2udHCUHZ_2j=jNmwTAVi2Cvda0qGgH4tDZHwsGVfLKQ@mail.gmail.com>
 <CAMVG2stuY5aTwfmJkL_cLDn86hfuFD+sT-LdqdmN5m21y2aL5g@mail.gmail.com>
In-Reply-To: <CAMVG2stuY5aTwfmJkL_cLDn86hfuFD+sT-LdqdmN5m21y2aL5g@mail.gmail.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 12 Jul 2026 19:49:58 +0800
X-Gm-Features: AVVi8CfnlO117VJ3lWa7mSJR7b-rlpaw2gAO1sdjMy1bq3J7HIu3u3SqtlgnsgQ
Message-ID: <CAMVG2suBZFMbUmUaAdyOhZ=WNysecPQCD5rZpj96AUi7Au_xHw@mail.gmail.com>
Subject: Re: [BUG] qcom: x1: GAMMA_LUT corruption on DPMS wake
To: linux-arm-msm@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jun Nie <jun.nie@linaro.org>, 
	Federico Amedeo Izzo <federico@izzo.pro>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Randy Dunlap <rdunlap@infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>, 
	Val Packett <val@packett.cool>, Steev Klimaszewski <threeway@gmail.com>, Sean Paul <sean@poorly.run>, 
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jun.nie@linaro.org,m:federico@izzo.pro,m:neil.armstrong@linaro.org,m:thomas.weissschuh@linutronix.de,m:rdunlap@infradead.org,m:linux-kernel@vger.kernel.org,m:val@packett.cool,m:threeway@gmail.com,m:sean@poorly.run,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:marijn.suijten@somainline.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[quora.org];
	FREEMAIL_TO(0.00)[vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118555-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linaro.org,izzo.pro,linutronix.de,infradead.org,vger.kernel.org,packett.cool,poorly.run,lists.freedesktop.org,somainline.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[21];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0D10744874

On Sun, 14 Jun 2026 at 18:27, Daniel J Blueman <daniel@quora.org> wrote:
> On Mon, 1 Jun 2026 at 13:37, Daniel J Blueman <daniel@quora.org> wrote:
> > Since Adreno X1-85 GAMMA_LUT support was introduced in Linux v7.0 (eg
> > Ubuntu 26.04), when waking from DPMS-off, palette corruption is
> > frequently seen; this manifests as purple banding. If GNOME night
> > light or similar is enabled, the visual impact is greater.
> >
> > Further, on larger panel monitors or laptops eg the Lenovo Yoga Slim
> > 7x (2944x1840), a second INT2 block is used for the right half of the
> > screen, which may remain totally blank on wake; major usability
> > impact.
> >
> > Intuitively, the symptoms feel like the LUT SRAM clock isn't being
> > driven soon enough during the wakeup, thus state loss may depend on
> > silicon binning/variation or related. No such symptom is seen in
> > Windows on the same hardware. I found a workaround supporting this
> > mechanism is to activate the GNOME night light and adjust the slider
> > to update the LUT - any black right half of the screen always
> > reappears.
> >
> > Please can someone with X1-85 Adreno insight check the Linux clock and
> > power domain behaviour around GC_EN, Layer Mixer, INTerFace and INT2
> > on DPMS wake? Happy to test changes; this is a stunning platform
> > otherwise.
> ...
> > Link: https://gitlab.freedesktop.org/drm/msm/-/work_items/89
>
> Just a heads-up on this with additional findings. Note this issue
> could be the only remaining daily friction on X1 laptops with suspend,
> once my video decode reboot workaround or similar is merged. Also note
> in my case, without GNOME night light active, only a few LUT entries
> render purple so visual artifacts often go unnoticed until a gradient
> eg in an image is visible.
>
> From DPMS wake on a dual-LM panel (>2560 pixels wide) with
> INTF_5/DSPP_0 (master) and INTF_6/DSPP_1, I find DSPP_1's registers
> are intermittently unresponsive just after MDSS resume. DSPP_0 doesn't
> exhibit this issue, suggesting some missing slave/second unit setup,
> despite booting clk_ignore_unused pd_ignore_unused.

Guys, further debug reveals the Windows driver (which doesn't exhibit
the issue) doesn't use the same register access as Linux to reprogram
all LUT entries on DPMS wake. Instead, it appears to submit a DMA
descriptor to fetch LUT values which get internally loaded in a stable
manner.

Is it possible for Qualcomm to attempt a minimal fix, or share the DMA
description struct and doorbell/completion register offsets and
related so the community can?

Also, it would be good to hear if anyone with an X1E running a 7.0
kernel or newer with a 4K monitor *doesn't* see palette corruption
across DPMS sleep-wake, as this could indicate another possible
solution.

Thanks,
  Dan
-- 
Daniel J Blueman

