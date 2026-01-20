Return-Path: <linux-arm-msm+bounces-89857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yER+KRCvb2lBGgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 17:36:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3115A47B48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 17:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8695A9CC80C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 15:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0504245BD5A;
	Tue, 20 Jan 2026 15:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fuiLwAjP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qIejbGZg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE0C428834
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922080; cv=none; b=aV0hDYCS8KIOAk2759Rj222Kf8L0WeRxXB/3au5I/iinbX5bHaOEPr6O3eSvQw9Bxkb16Vc8t6/DSzEor+JI10NQVfFISwA6CpvtGAHWkZV/Lp7Xjuvi0+CNGzkbnvtH6ojeOaf14vwUJxM4itmAgMMeRK5lowYu8gMo1ML5ovY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922080; c=relaxed/simple;
	bh=zctGoCy9tj06FxCF/1MEy/+RkDyWDn4JObiaM6T8qrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tv7c3ElqWOO/PuoEFt7xXLoJdlb3hS3SgUR5Laj/gyrOZlQsLf/ubG642UeHj87Ayc7mrVUzFxBEJ1DMxQjzYuJbeBAEbe2RzhUaajesN3c6dn40FYP1Cls969LuYIipa/bAfCxQBgEpRFNnKkn5X4cgQJjfvYbK96UGJcjnyn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fuiLwAjP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qIejbGZg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768922078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fMaak1xtD3IGbAXkM0qNP33HT0c4dctivzgnO4kRoKw=;
	b=fuiLwAjPxBZGII2j56pSln4Yjhve0q/0dE8Gk6brgciI0vRElg2IAfqJj7PsLXaOZ62cPl
	1zW+i5fu9cgL+dFiXFAJK9+YSLigKrZ7eaifeMpLGkuoP/vTjmSY1kLL5/nfExJq6WbU5u
	dpG2QKj7mKbSLCEnfVj1bUFbFVPX+J0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-HDcrZVYnP5mA9BRXXb8vxA-1; Tue, 20 Jan 2026 10:14:36 -0500
X-MC-Unique: HDcrZVYnP5mA9BRXXb8vxA-1
X-Mimecast-MFC-AGG-ID: HDcrZVYnP5mA9BRXXb8vxA_1768922076
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89463017976so18443816d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768922076; x=1769526876; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMaak1xtD3IGbAXkM0qNP33HT0c4dctivzgnO4kRoKw=;
        b=qIejbGZgKamY4rFzHLL83mnZxmxYlNkYzHuhzFCuUmVKbQMZDQKvJ7sRI0bwumDziy
         pc9UXdCLKaDNL7g09rIc5uT9boJoTG85cffw/xUmrm090O6wsQl6tH00NOC9tdZFZuGD
         kRDPdGeO1zff89wihMvd4J4xigGh1kaS5weMQyueaaVsq3gvf0tzS5FfS2/1CeGOSmfd
         n0khonoKHvSM55rdEmANHcksCKRif0/MewXEcjVJ8ARWfnZMHW9P+c9tqQ0/FIgVtqO+
         PKQ+G0qhDaigWjHUefdedvAKo89+h8Yla13NmkKSapxsJOQ3naP+qQgnX0q6ek7M+oaf
         BdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768922076; x=1769526876;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fMaak1xtD3IGbAXkM0qNP33HT0c4dctivzgnO4kRoKw=;
        b=EByiImrgSmwiS6vCE4r1yOM4K2gLexLKrDMYFcBnGucT+Uv9D0qSCYOI10yvNMj40u
         wM8kwGYLl0JyFbxenBcbryvr48k8oIIOAyWu8uNRUGPVLV5RCC11yXcUENErEOyFd6af
         IRY8kmQ4eW3jSxUKrQsed/qOo8dlILyDdpeGCdoFwfeu6ZXiU1u3bPqyGe39+s9olSZ2
         1d7oRpD5+k1Cud2HW80DOntIdOrbnJbCTkLUi0fz7nO6GfEING1dyH2EgxobQXHf0LER
         uPkZxS9r27dw5RsuAvKRGDJN86ZT+SgpnMIMyAFKWeqHrD4qGdORW2oJRHtMvno5o1Vj
         BEYg==
X-Forwarded-Encrypted: i=1; AJvYcCXjIiE3rNVBbAUL4rxPWIN7AQzwg5mjSo6a5TXFHp8ZZhlsDvp3xqNrWaipBr6ntMP8u2p/03D1ExXrIVD3@vger.kernel.org
X-Gm-Message-State: AOJu0YwiisZQiCIaF0UNKbU6jzK2ENlne15NxP80JmPkK2dCTNZR0lYj
	gGdHkWXEwnX1yaiA2X0lm2FoU5RkJFokdYAyraMrsWjFEtpoR7o2bZXd3n3MSwl1EbY1Poo0KJD
	m3m0u/SSE43t8ZMutk/lesjskL8+Txb1SB3w9HT/o353pbSN3VAEIqWkMUOWrXCF/lxU=
X-Gm-Gg: AZuq6aLDiCxfGwU7/4cJwegOlk+fIGAL5pRmcQ9rzZ3ZfvO/rZ0Ms3v3y4dz/nONOQo
	gQYB3l8L9qPgkAvSNdYVkvM940YJP58djwVG4Hv/IPEPGAYwc92fU+U8kxIZZNpxX02H1Adkq4T
	8k61KA3SnrCDBF00v9Nue/nmjtqOjfhYaW1vAOibvXt5n3SproL49XK/cn6HenF5Jxdg57rLK88
	kw99XJsYPxYIyb5U2SYVID6KcrYnjGL+Qj1wLIj7oB2ELShpcu4S+lezjbgiHs+ylDe/p6Z9ax9
	yb/28/5p0O+C3xVxOINQOSmQurjklNtMkDM0ESO6rgb1VePY0kuNYxE/Xr3PSyjY7gHGSBJrG3O
	NuCOSz8u5r6VV/9launbDsh9OEowfTuin8cj1qYcKYa49
X-Received: by 2002:a05:6214:1cc9:b0:88a:3b1d:2f70 with SMTP id 6a1803df08f44-8942e0c3442mr216662316d6.10.1768922076050;
        Tue, 20 Jan 2026 07:14:36 -0800 (PST)
X-Received: by 2002:a05:6214:1cc9:b0:88a:3b1d:2f70 with SMTP id 6a1803df08f44-8942e0c3442mr216661746d6.10.1768922075621;
        Tue, 20 Jan 2026 07:14:35 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e5e49f2sm109107766d6.6.2026.01.20.07.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:14:33 -0800 (PST)
Date: Tue, 20 Jan 2026 10:14:32 -0500
From: Brian Masney <bmasney@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gfx3d: add parent to parent request map
Message-ID: <aW-b2EmynhZlp0mZ@redhat.com>
References: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>
 <vlvp4od6ykhneabgtpln7vpyyfpfuilasbmbfu222zgspc2ppl@iuuzldtoejaj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vlvp4od6ykhneabgtpln7vpyyfpfuilasbmbfu222zgspc2ppl@iuuzldtoejaj>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-89857-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 3115A47B48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 09:39:30AM -0600, Bjorn Andersson wrote:
> On Sat, Jan 17, 2026 at 05:54:47AM +0200, Dmitry Baryshkov wrote:
> > After commit d228ece36345 ("clk: divider: remove round_rate() in favor
> > of determine_rate()") determining GFX3D clock rate crashes, because the
> > passed parent map doesn't provide the expected best_parent_hw clock
> > (with the roundd_rate path before the offending commit the
> > best_parent_hw was ignored).
> > 
> > Set the field in parent_req in addition to setting it in the req,
> > fixing the crash.
> > 
> >  clk_hw_round_rate (drivers/clk/clk.c:1764) (P)
> >  clk_divider_bestdiv (drivers/clk/clk-divider.c:336)
> >  divider_determine_rate (drivers/clk/clk-divider.c:358)
> >  clk_alpha_pll_postdiv_determine_rate (drivers/clk/qcom/clk-alpha-pll.c:1275)
> >  clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
> >  clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
> >  __clk_determine_rate (drivers/clk/clk.c:1741)
> >  clk_gfx3d_determine_rate (drivers/clk/qcom/clk-rcg2.c:1268)
> >  clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
> >  clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
> >  clk_core_round_rate_nolock (drivers/clk/clk.c:1710)
> >  clk_round_rate (drivers/clk/clk.c:1804)
> >  dev_pm_opp_set_rate (drivers/opp/core.c:1440 (discriminator 1))
> >  msm_devfreq_target (drivers/gpu/drm/msm/msm_gpu_devfreq.c:51)
> >  devfreq_set_target (drivers/devfreq/devfreq.c:360)
> >  devfreq_update_target (drivers/devfreq/devfreq.c:426)
> >  devfreq_monitor (drivers/devfreq/devfreq.c:458)
> >  process_one_work (arch/arm64/include/asm/jump_label.h:36 include/trace/events/workqueue.h:110 kernel/workqueue.c:3284)
> >  worker_thread (kernel/workqueue.c:3356 (discriminator 2) kernel/workqueue.c:3443 (discriminator 2))
> >  kthread (kernel/kthread.c:467)
> >  ret_from_fork (arch/arm64/kernel/entry.S:861)
> > 
> > Fixes: 55213e1acec9 ("clk: qcom: Add gfx3d ping-pong PLL frequency switching")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Why didn't Brian get Cc'ed on this patch? I'd love to have his input.

Reviewed-by: Brian Masney <bmasney@redhat.com>

clk_alpha_pll_postdiv_round_rate() previously had this code:

        return divider_round_rate(hw, rate, prate, table,
                                  pll->width, CLK_DIVIDER_POWER_OF_TWO);

divider_round_rate() called divider_round_rate_parent(), which had this
code that set the best_parent_hw:

long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
                               unsigned long rate, unsigned long *prate,
                               const struct clk_div_table *table,
                               u8 width, unsigned long flags)
{
        struct clk_rate_request req;
        int ret;

        clk_hw_init_rate_request(hw, &req, rate);
        req.best_parent_rate = *prate;
        req.best_parent_hw = parent;

        ret = divider_determine_rate(hw, &req, table, width, flags);
        if (ret)
                return ret;

        *prate = req.best_parent_rate;

        return req.rate;
}

I coverted clk_alpha_pll_postdiv_round_rate() to
clk_alpha_pll_postdiv_determine_rate(), and that now directly calls
divider_determine_rate().

I'll look through the other cases where divider_round_rate_parent() was
called just to be sure there's no other cases of this.

Brian


