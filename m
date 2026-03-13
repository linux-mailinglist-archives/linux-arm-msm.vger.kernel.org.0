Return-Path: <linux-arm-msm+bounces-97588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eACpBthBtGk4kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:56:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA3F287A8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FF1B30C82AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC513CA4AB;
	Fri, 13 Mar 2026 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ahcJfZCC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="R+xuJulT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D5F38C2DB
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420886; cv=none; b=l4eESW0jvypffFttiQWxgc9ocosv0lViFgfhAShsnLruAMzEVunsl/gLF0/I+FaA5j/T19WzPP5Yg48Nn07v9w9hBM3Cwko7P+PR4EAeU7AssEdFVr7ykyyuAW55oZ5UQPZylVfnqXwBhURHoT5lc653s7sRmlWnNTSgBYq02s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420886; c=relaxed/simple;
	bh=MYqtvmPMBbkzVH2cDaVgumHB6+1nChu4X6wiV57iB6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjlZbxWNtR+zw21w4Xhv91NeDHM9C0AtZNWC+2xmubJ2reVCb/fulH/X6RzomYPGBYJlr1Rr9oouvd0XejQz9UYsLBW0bQVmrUgvyfs/iZ/ZgW5UzjGQJTEaBLvXJm0XQlqcF5C2meK/G+nSR2GBinSqLP4JDQ1sSbUAdBO3ttU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ahcJfZCC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=R+xuJulT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773420884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mqxWsYIPaTBPPrjermq+DtfpUjguE2xkVbOTdTjdzII=;
	b=ahcJfZCCy/5U8KbTecQ4JqGEDqCt32qnkLrUJLMRBQpxPV0Zk0zA0kj/uOqZg/QPCZVJiQ
	W5OVkkxPc3b4H7AjLEJmr+dPjpshXLGwL7lywFnrZ+gBEWJs8RJdJxCz+fn657wq8FtwiU
	nZ2LRC2Z4yuqky7ofSdKNTTDh8OyaXo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-rDmauVTCO1CdbCxFhkw2Ww-1; Fri, 13 Mar 2026 12:54:42 -0400
X-MC-Unique: rDmauVTCO1CdbCxFhkw2Ww-1
X-Mimecast-MFC-AGG-ID: rDmauVTCO1CdbCxFhkw2Ww_1773420882
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50921f7da67so166379701cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773420882; x=1774025682; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mqxWsYIPaTBPPrjermq+DtfpUjguE2xkVbOTdTjdzII=;
        b=R+xuJulTdn4NVCcS6LekFfD5KIiNQk0gPD+plDlLjhm372BUytkcDv7oinoWmOmzcn
         Kaglql4V+pLjmSD1oPJILoXyS+1ey7+rUgueVnWxRNuI565XpEojHRHcwJWa9KQTBHyt
         92sxI/sTPtsWFSuzMHSm22Hlv1n8vLPK2t3HohyDZMCdUwvfkzUIY4Q7hGa0+dBBDHcq
         HMKjOlSlqjVvFV10rIP0SAbXFOVT2moFbjOwDk434Qpexf50+Wf95rgrgpqedHuApf8a
         zoqaFysBcAGR9rxQ/od2jdjOgPqJDCKliiYvudqwMo4HdghjkNh12CfbvccmOkF3FLsA
         TaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420882; x=1774025682;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqxWsYIPaTBPPrjermq+DtfpUjguE2xkVbOTdTjdzII=;
        b=cb4hQiltBZSXoAafROZskWfk/c9ZPV0+c6R70LPw3p2o/T9GyIAXMVhjJASHmXjYoP
         cGzfWNNfFlAfFMKTB9NKgyLcLBDDwcQHHgpfXlP3VJffteygR8xX/g1OhIkRWv1h711H
         O6hak61WRUeDcIoEX+C7h39RQku0eB6DMCesowSaVwvL3Yd0MB6ijzxmTn6bY10BFnJ+
         BKyrOw87cAH0Ej0MquWk9qtDOCVkHKeIN8UOrYhJrLmH+9mS9YUOaH7WhiiHV9l1/0xn
         nTWNHKbSTDCCTN5/CK8oC/oZ5KKMutwHiJFcZHy/A1jys8eyE81Ncsjq7GsJA7HMKBpB
         jGEA==
X-Forwarded-Encrypted: i=1; AJvYcCWq9viFTIwhBTJZujKKrXXanCc1cOZqCogqkUhvtCuncbcAQ46KEN90bBd1Dqk7IFT3k8Zzqm8Xc8AkXtUc@vger.kernel.org
X-Gm-Message-State: AOJu0YzuHZDm9haEOSRfJEAQZN4JR0VfAEfwlQ5NE6zjF10TMfjpG1p/
	Iw5/esH/YDmS7Fxmqm2kfSKeJI8W2luA5FHQ1irqSmKinHq646ACp1KqAsNV5ATxT/l00ne6UTL
	0gVDIhQ4i8jfG4CL6K5Y6FAEEt0AeEkEAtwnqWcjQuKl6Xj9m2BXbPgY4WVf9eHbBKww=
X-Gm-Gg: ATEYQzxUkkitGaY/NmZNq85eGkAE6DrXTz8H1Vd0VhJ8QXRgIHSEB/hy7nLVnGfkNK/
	3ly7V2wTWjH5LiAErG25olKtEbSag8lz86icx9J7dwab0KkyYKDBLVK1izjmGXDs6ml37cULf9w
	IeDPwHwVv4LluR0jU/JwUZeu5ylAIvs+9gkT8oWhJSzLbYfXFlcvRr7fMrj4uNB4geDFv1pcc6j
	b+vDvLotGB/8wHIHIG0V4jG7FFt/sKt1yjLGPzTJqMzRyIspLq54RqiZeh9zIGmCq1RNGPLF/xY
	904kEw9hg+MbsMJn7ggFGxf/V9mdUm6B+S9oco0Ob8ZYNuZl8462lROns9EV7/19iDNmpG25y3t
	+hyJPNH2diexN3xaUwukzDGQ6p1csi0EYBjug5kNFpbP/2cVhQZtRDjFn
X-Received: by 2002:a05:622a:4e:b0:509:1c5e:1062 with SMTP id d75a77b69052e-50957b88869mr55996931cf.3.1773420882186;
        Fri, 13 Mar 2026 09:54:42 -0700 (PDT)
X-Received: by 2002:a05:622a:4e:b0:509:1c5e:1062 with SMTP id d75a77b69052e-50957b88869mr55996521cf.3.1773420881696;
        Fri, 13 Mar 2026 09:54:41 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65ce3924sm60581406d6.24.2026.03.13.09.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:54:41 -0700 (PDT)
Date: Fri, 13 Mar 2026 12:54:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengyu Luo <mitltlatltl@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
Message-ID: <abRBT4niX2CB9XVR@redhat.com>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
 <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
 <aahGtIkxtNPeeWKc@redhat.com>
 <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
 <CABx5tqJ_spoZrhX7n91rTOaMcp1G_n8jB5aJV-rNbSPYZBZxEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABx5tqJ_spoZrhX7n91rTOaMcp1G_n8jB5aJV-rNbSPYZBZxEA@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97588-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ACA3F287A8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Qualcomm Folks,

On Fri, Mar 06, 2026 at 06:27:20PM -0500, Brian Masney wrote:
> On Wed, Mar 4, 2026 at 10:08 AM Pengyu Luo <mitltlatltl@gmail.com> wrote:
> > On Wed, Mar 4, 2026 at 10:50 PM Brian Masney <bmasney@redhat.com> wrote:
> > > On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
> > > > On 3/3/26 12:55 PM, Pengyu Luo wrote:
> > > > > From: White Lewis <liu224806@gmail.com>
> > > > >
> > > > > The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div_clk_src)
> > > > > had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate() on
> > > > > byte_intf_clk, the rate-change propagates through the divider up to the
> > > > > parent PLL (byte_clk_src), halving the byte clock rate.
> > > > >
> > > > > A simiar issue had been also encountered on SM8750.
> > > > > b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent").
> > > > >
> > > > > Likewise, remove CLK_SET_RATE_PARENT from all four byte divider clocks
> > > > > so that clk_set_rate() on the divider adjusts only the divider ratio,
> > > > > leaving the parent PLL untouched.
> > > > >
> > > > > Fixes: 4a66e76fdb6d ("clk: qcom: Add SC8280XP display clock controller")
> > > > > Signed-off-by: White Lewis <liu224806@gmail.com>
> > > > > [pengyu: reword]
> > > > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > > > ---
> > > >
> > > > Looks like more platforms have this issue.. thanks for fixing this
> > >
> > > I hope within the next week to post a new draft of my patch series to
> > > keep certain clk rates intact when sibling and parent rate changes occur
> > > [1]. This will be for certain critical clks, such as the ones used for
> > > DRM and sound. I have it working with kunit, and just need to clean up
> > > some of my new clk helpers and commit messages before I post a v5.
> > >
> > > I'd like to test this on some real hardware and I have the Thinkpad x13s
> > > with the sc8280xp SoC. Can this issue be reproduced on this hardware? If
> > > so, can you provide me detailed instructions about how to trigger this
> > > scenario?
> > >
> >
> > Quick answer, no, x13s uses a edp panel, not dsi. This issue is
> > related to dsi clks.
> 
> I posted my latest clk scaling work in an attempt to address the
> underlying issue here.

Ignore my previous patch set. In my v6 that I just posted, I updated
clk-divider.c to support the new v2 clk negotiation logic. The
clk_regmap_div_ops uses this driver, so you shouldn't have to make any
code changes.

Anyways, would someone from Qualcomm be willing to test this? The
procedure is fairly simple:

1) Back out the patch:
   clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT from byte_div_clk_src dividers
   (or one of the similar patches posted for other SoCs)

2) Apply my v6 series:
   clk: add support for v1 / v2 clock rate negotiation and kunit tests
   https://lore.kernel.org/linux-clk/20260313-clk-scaling-v6-0-ce89968c5247@redhat.com/T/#

3) Boot... everything should behave the same as prior to my patch set.
   The clk crash will still occur.

4) Reboot, and boot the kernel this time with the clk_v2_rate_negotiation
   kernel parameter to globally opt into the v2 negotiation logic. The clk crash
   hopefully shouldn't occur.

Thanks,

Brian


