Return-Path: <linux-arm-msm+bounces-115491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BckaKDndQ2p5kgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:14:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 371AE6E5CD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:14:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b="C/zHF2KD";
	dkim=pass header.d=redhat.com header.s=google header.b=FRKnqZFa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115491-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115491-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9879303F4BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39D930D409;
	Tue, 30 Jun 2026 15:11:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162F32DB794
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 15:11:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832264; cv=none; b=ud1qNycVvbjrvaLjCPJxrfpcjw8dAl++hFthiMk++Y7TSXcr/2R7TOw+j3Whqx6YQlbwHe0QI/OaWd+i45hrZj+SpdHEcFUbmFRe9rOVHhg1bFzpEwEY061y/Nj+owHHmKK6DTTuokVWdxc4pPl31YLeqPQkFemp7UrIwMijfWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832264; c=relaxed/simple;
	bh=EztkVPde0K4RhcRhCzcZiteVfT7iLfKSd3EI0JGqJYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbTalc1Gl++CeC3MUgmI4CzYbWlrf2ssNlKU6gYlk+qVM4YLRdZvkXOAPeeBmJVPA8t6s5mZaBHDe5OLgEzTwm4pnC1eFu5VmIIHbyIzmCqfTitmFqnKkxB73HUQrR4Tmfmnvn9iRmQPlm1/ZdrX5uEXqc3/0TuvPaErcGEaS6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C/zHF2KD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FRKnqZFa; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782832262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dxNdwb9OubOVP7bA4ip00MLQGUYebP1qlx3Z9ezHW48=;
	b=C/zHF2KD/JP12MyNeCDsSIVIsgmIPvDnhqWYshyiWQ1Np2Q/6RVo0VlkYOU/kUWqyF87im
	VQYQH14ut4pu3WaDO8683Bm40CdI8WTm0+AslWSqQXXVsdjw4uPRMxGFpJcIahKEzixcm1
	Pw20yVxd6AYiYog6cInVQp04abWAnX4=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-hOmP9MdjPseLeALvUqdg3A-1; Tue, 30 Jun 2026 11:11:00 -0400
X-MC-Unique: hOmP9MdjPseLeALvUqdg3A-1
X-Mimecast-MFC-AGG-ID: hOmP9MdjPseLeALvUqdg3A_1782832260
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5954c5fbcc7so4273704e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 08:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782832260; x=1783437060; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dxNdwb9OubOVP7bA4ip00MLQGUYebP1qlx3Z9ezHW48=;
        b=FRKnqZFaoinN3L5tOFflQQFOVaSW8wMW5klBePfWEPxctvXQdoaOJazzYD69LzVXSv
         IM7BTg8YY3kaWnW93tieYGZZvwTag4yDhWV1o0LTzWbPIPdXEBiyEDWS+N41wNRVhMWo
         L2gTdk5/KpALg/Iy9x825JrxRwPNidyrP7mFXh8ZvLuehOa5XJo9pHZQoYudkBfPYzdv
         H4jUSqanlAiWxrl1kZGRvc6DOooYbVCGW8/J0RdYNv2W8OOOpsP8QL+Dth1F8r3fQ+IZ
         zFmrRwR+Av1D6APo3w8QDn7fGIQTjClhv9R1nkmfrZc6X9pI4PA8JYJ2HsymlQdYP+bQ
         gRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782832260; x=1783437060;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxNdwb9OubOVP7bA4ip00MLQGUYebP1qlx3Z9ezHW48=;
        b=N9YXGxQD6J+jaqq7EeRl/jaq3tAZVipy+dQ7T5Tuy3/jQxqh4EHRK99XSSJlleoCKo
         sYRB9qZjoFaoBQ7gQPWtc7nDLsbGSuC7lrPJ8NCcI5vfzG5iXKAzgqe45nVqbuXDshxt
         iUKaessU8GfXktek2vMIx54zXBdwGyhn8v4cHnrklIGxz8lzGjNje3/1AMoSCxGB0+Xm
         yYM9mhtsVmUO0ciE2XRMZ5SGSe51nZZt+uQFASrtzOCScWc0t2s+yG6/WR79ydAyMzZE
         +wxi9oszQE07Og66+nDzdj2Vr6txQ6haaYsv9OQ24XzTiIZTVKJA6lwssolvvo3EzFUr
         S1/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpHVOBky6MidGBOKrcoXgoLWLRnjY50xFtQsvatlZYwnE1lvPkFGwH5K0q2F0oDIprlC3ls8YGQ/qMc+hqy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79D8uRz1oA8EQqhDc65EhDHeXbytmqm/CUQ4ob1yt3Jib5Lxy
	y0kjgm6K40jdQ1bi7yTnHEzD84+FEgaEriuE5VN7ffC/nkk0B1JB5MOkLSx5UrzLXeItxuRWLeK
	1dv++WYr93Iw0A1qwRMPvz6CLWhnOllDAC/9vRrwUg0S1IZskHr6nNooult+1rlyW4QI=
X-Gm-Gg: AfdE7clMskcNrFRyZ8pl9Tf2E6ddGjQmVWMs8BZudNIURLG4qaOJDQVj7yEc7XrJ3Og
	NNwqb/hOBh0OFqJzHYtNVMjquRt8o7kRvBB7vVzw3oqeITC9Zk84ZHWDwDzHb7sAl8Tcurn4AWR
	InmNz2TD/PqG5HWALto+86jYjVnNMfuwkSR0iX3Rr3x4ZLJlIP75PZG927cajeYWdOz8UrER0vC
	0ZC5Aq+f06DVLWQqIqE2vNI5L7vHcWprjcvY0gM5gYh0NarR0TuNZLgJlGPs1GgYBXs1N/Aa5UW
	ok3m7m/KdXpRFiFkM1kHX46k2HV9qc4yFsJGkQj8wfJGkX6yXQY8bvL7qplJYnBxGgMp9z2Etmi
	GodlG2FWEebRu6w0VImb3c5pzkoCDXYt5VtlLpXiMCHbEEQ==
X-Received: by 2002:a05:6122:17a2:b0:5a2:5669:d6d7 with SMTP id 71dfb90a1353d-5bdbee26d80mr1876945e0c.9.1782832260047;
        Tue, 30 Jun 2026 08:11:00 -0700 (PDT)
X-Received: by 2002:a05:6122:17a2:b0:5a2:5669:d6d7 with SMTP id 71dfb90a1353d-5bdbee26d80mr1876885e0c.9.1782832259439;
        Tue, 30 Jun 2026 08:10:59 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a26f21e4sm25766926d6.10.2026.06.30.08.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:10:58 -0700 (PDT)
Date: Tue, 30 Jun 2026 11:10:57 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	White Lewis <liu224806@gmail.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
Message-ID: <akPcgdjlDxd-JmYb@redhat.com>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
 <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
 <aahGtIkxtNPeeWKc@redhat.com>
 <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
 <CABx5tqJ_spoZrhX7n91rTOaMcp1G_n8jB5aJV-rNbSPYZBZxEA@mail.gmail.com>
 <abRBT4niX2CB9XVR@redhat.com>
 <22a469ef-0a25-48f6-bdc7-95ae5541e834@oss.qualcomm.com>
 <CABx5tqK3MymYQZ4owofnzFLnjt+96njw5RG2Vwxo7UJ93A-42g@mail.gmail.com>
 <798d2516-0772-4f98-8fad-959a1daf71bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <798d2516-0772-4f98-8fad-959a1daf71bc@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115491-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:liu224806@gmail.com,m:mripard@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 371AE6E5CD8

Hi Konrad,

On Tue, Jun 30, 2026 at 04:37:12PM +0200, Konrad Dybcio wrote:
> On 3/23/26 5:07 PM, Brian Masney wrote:
> > On Mon, Mar 23, 2026 at 8:48 AM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >> On 3/13/26 5:54 PM, Brian Masney wrote:
> >>> On Fri, Mar 06, 2026 at 06:27:20PM -0500, Brian Masney wrote:
> >>>> On Wed, Mar 4, 2026 at 10:08 AM Pengyu Luo <mitltlatltl@gmail.com> wrote:
> >>>>> On Wed, Mar 4, 2026 at 10:50 PM Brian Masney <bmasney@redhat.com> wrote:
> >>>>>> On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
> >>>>>>> On 3/3/26 12:55 PM, Pengyu Luo wrote:
> >>
> >> [...]
> >>
> >>> Ignore my previous patch set. In my v6 that I just posted, I updated
> >>> clk-divider.c to support the new v2 clk negotiation logic. The
> >>> clk_regmap_div_ops uses this driver, so you shouldn't have to make any
> >>> code changes.
> >>>
> >>> Anyways, would someone from Qualcomm be willing to test this? The
> >>> procedure is fairly simple:
> >>
> >> Unfortunately, I don't think it's easy to get your hands on a 8280
> >> device with DSI.. maybe Pengyu could test that on his tablet/laptop.
> > 
> > It doesn't have to be an 8280 SoC. It could be any device that has the
> > issue where the parent rate change screws up that portion of the clock
> > tree, and crashes the device. This has been a long-standing issue in
> > the clk framework.  I know you recently posted a series for 5 other
> > SoCs with a similar change [1], so any of those other devices should
> > work as well.
> > 
> > [1] https://lore.kernel.org/linux-arm-msm/20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com/
> > 
> > The kunit tests in my clk scaling patch set demonstrate the issues
> > that I have worked on. For example, in my test scenario, I start with
> > a parent, and two children. The parent can do any rate. The two
> > children are simple dividers. This is the current behavior today:
> > 
> >         KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
> >         KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
> >         KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
> > 
> >         ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
> > 
> >         /*
> >          * The last sibling rate change is the one that was successful, and
> >          * wins. The parent, and two children are all changed to 32 MHz.
> >          */
> >         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 32 * HZ_PER_MHZ);
> >         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
> >         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 32 * HZ_PER_MHZ);
> > 
> > With my changes, the clk framework will land on 96 MHz for the parent,
> > and 24 MHz and 32 MHz for the two children.
> > 
> > Anyways, it would be great if someone from Qualcomm would be willing
> > to help me test my changes on real hardware. If it requires code
> > changes to a specific clk provider, then I'm willing to also do that
> > work if someone can test for me. Getting confirmation that this is
> > fixed on real hardware will help to land my series that will provide a
> > solution to this problem that has existing in the clk framework since
> > it was introduced over 12 years ago.
> 
> Was going through my inbox - do you still need the testing? I see that
> the last revision of the series (v6) is from march

The latest version of my clk scaling is v8 from March.
https://lore.kernel.org/linux-clk/20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com/

It's honestly stuck in limbo right now. It fixes a real issue that you
can see from the kunit tests, and I'm happy with how simple it is now.
The series is kind of stuck though. It would be very helpful if you
could talk to some folks within QC that work on the clk drivers to see
if they would be willing to help test since it's making systems run
suboptimal. Crashes can occur on some devices when you switch between
different types of displays based on older reports.

I submitted a talk to Linux Plumbers for the Power Management / Thermal
MC to talk about this, and current state of sync_state support in clk.

Brian


