Return-Path: <linux-arm-msm+bounces-95926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPXcOe5iq2mmcgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 00:27:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85546228AD2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 00:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3DEB9300C017
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 23:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4189B8479;
	Fri,  6 Mar 2026 23:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V0smB4rc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lw2uoQlm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9451A262A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 23:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772839657; cv=pass; b=Q7ecuLPrmzW8neH+PjvU17njs79yeTjfHJFCxFVonocHq2g68SEBFD6uKdU4orpAhXlWbNprbLFEwwVcbSUri7SUziNsuaNqfidnqXaNqf6iJbF41OdpUDSPO+BQ9iRUHyT2PfgGmLIcGtRovGUUvLpCDE70ghpiL7i1Pkt+L6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772839657; c=relaxed/simple;
	bh=miLnnTGHi5wNa5u8dKX4lrgopohiQ/GLithTECaVPHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=avfibkBbeCyj4Z5XiZtr6ofE4X+Hrj5CJbB0gokGzfKsWUmOOWdDt6NsajXuP4aOLxw4mGr/i/fVtqLRQWgb974OD52MefvUJJsUfIqZl2FuEiUhjWZcIepSLuDMi10mGbJyGcfVOxZGA75iOZu0fIu2lOnJT1TYHDnn3T05WSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V0smB4rc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lw2uoQlm; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772839655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=miLnnTGHi5wNa5u8dKX4lrgopohiQ/GLithTECaVPHM=;
	b=V0smB4rclnM31HdcCQJHRi3ZGWZ7OajQOKzOQb4WQLxvrjubsipMx0zjB22CLKwU8AKbD9
	GxXebOoD4/HgU7UaFaov8E0yiUBehvuF2ZgtcUZXxMEN0eCTK/Zx2C2sQnPrWN6rGvJR23
	AdiVtwGAQk+XIq0K5dYrhYL8pFTR32g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-36tfKfi5PEawVDnl_hyhGg-1; Fri, 06 Mar 2026 18:27:34 -0500
X-MC-Unique: 36tfKfi5PEawVDnl_hyhGg-1
X-Mimecast-MFC-AGG-ID: 36tfKfi5PEawVDnl_hyhGg_1772839653
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b941f6209ccso282375366b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 15:27:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772839653; cv=none;
        d=google.com; s=arc-20240605;
        b=lc8ww9N/YGoSGKgDAS8DBDkzNZNa7wA0HHPc1iA87rXcyVbJ/56iM22BTd40WfJS4g
         ggVQCd8aFIfwyIlTtfWccH4BOcwodJFVZRA6XmO7epvyRohrcNiP8yN1bCZulx7DSR1l
         NfNKTXNWaTYhOG9HAxQmoyWyqXPNyUPY+Lf4MD6OWX5QomAvfHI6biWNsZrMvzWSkA5V
         X7bVn7Vi+3LaXHpOtNVbtwb5VmGqlAXPfEgzUF5Ixyr5S99QSjQLgM48Y+KdFsgAQKpq
         SEDA+b5vzdjmn5WuG9/8V4u1/8WhJz1aigrgoOgiJyLdFWhFJ9j0qdSsRNdYrNB1nnAm
         YsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=miLnnTGHi5wNa5u8dKX4lrgopohiQ/GLithTECaVPHM=;
        fh=QcRSwC9saqLOIzQ7/RY26oYLnfhm19Y/+FvC2XxsyMY=;
        b=ZkfLFqsFVAp7a1IFqpXyJuECtcfQASum4zUHe0+cP/vTyVxj5gnnKjAtkNGkR71Wj0
         SHEoEFS8xEaASRVB9ghz1qmG+hRYB4J/J0uXHyw6M7xTpaS4mxLbu5VTUi/ar8CAlDz6
         OoihiAe8aSa/qT8SwlpJR8+5yceFtsvqO/FY3cpjDCcg9BKPMODEZLrNVW3Ob1yfSkVM
         9bETkSc15oFWESPOkbuz383WY+RkblcqL4tkq4gwl8dirAMnKFcdMRSlk+VPogW/Iv28
         7PfOu2lRjLnFLcrX+V8FsGWtg1M0W79YdXVqss3oJItvrdr3hNIJM/cvOMPlsL4G1a4s
         4YJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772839653; x=1773444453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miLnnTGHi5wNa5u8dKX4lrgopohiQ/GLithTECaVPHM=;
        b=Lw2uoQlmSh3y323NZNg3c+e0/V2EkG1rPAwmqhowW8yMnM+W1JPww3OB4j0VaPN2++
         s25PoH2M2ifS+pfhJgiT3V1TiG4yj9fsNrx/Vj/aH3bxEvxt2PmaKOQQxZA4ycsO5hre
         6ZY1EMhiZ0r54nG3gtDUmbqKKQ5e5RuUcIs/FVRz8LPOYVOmark3so22jM8cyuS0DZzw
         tWmiuGm8aN5kIYfbcy71/aoXe5cKou4pTxWU2WgrnhPC/sJimR5Qmb+0HeePObPhZnMA
         LlVZhKpJsemhsUqEJXm6B3k3e1WqbqqWOCZKK5y7EZHkqA/NdohI+83gX7wXAB+Dvhvo
         /NdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839653; x=1773444453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miLnnTGHi5wNa5u8dKX4lrgopohiQ/GLithTECaVPHM=;
        b=A2DlBvcN4wdq8xOqKsDwaeX2Ib5XQK5V086qdxNbAPxGSmN9fnq9V1FKQulgxEWES1
         ccMjNW7yb0Hv9CwD5PsOOJtTLTcpoQEr8kfq7Ue6aXy03WhObv++ucDfNocNvwrLwR1l
         Hed6FIhO09csi5oSVjupUvQ3amvUz0azmdmt8wIYfeaJ5mwuwHWh5WQT6yA9cBhKZg8r
         VbUlB6Swsp+d6zl2WhgqDUpmaw38AIrcNfeFgiK0gxJ7iGhs1TMeSIkp4h4Fljv9U/8i
         Tcs9mrTW7Ij5oqyU5L207eWxgRo7owAOFgdO5YORCyu2rentF58dz0/oFoTnOQxyL6PY
         htuw==
X-Forwarded-Encrypted: i=1; AJvYcCUM16UrdDbehkgYyHv3U6MTvstcOaTfo1CCaEUHwaw1PuVL5HLYZdatHajqGrbe0+UxZPKIUggAva+S4jLA@vger.kernel.org
X-Gm-Message-State: AOJu0YxD5sPWstY6rcH/MpA/zDKJ+RhRgfgnpiZHDAVajqhGzHl/hmNH
	6Fe88rz87N2KksaFga708cC2wfWgYHe7VDvGyLy8mHFqnJutdpxVdj22MhReWri8Q/hC7RSz2Rp
	4wTDTs4HBVjFaXJS5p7aJ1PQLu8tLZsm0jJpF5gRvBkl6nd3Szpjw5/LRYNwu+vcccQO+Tse30D
	F8m9emW3dJzXJDmDp63O2d9gABMXewoLAku3vaD0WRlQ==
X-Gm-Gg: ATEYQzyKqSasJmJRIB3/tksi4+yVyfa0xDK1SsWykQqhO+SOsX52+vvvosmHwW+gPfI
	8BAFOjfXYvpGcxYARZE7HZ8PRePO7LxD4nZCAZHUbT22MOA35AWhKyKcjCpjv4pQkD8zzdLV5Tt
	IPtKgao/TjnbXC+faulkD3PhouF+4t1MlJ1jzYWkmEkOnhc0Agi7tUqwF7n0U8yv1lRiCSH2FHF
	tasjikGC0UctQ==
X-Received: by 2002:a17:906:ef06:b0:b94:1224:c605 with SMTP id a640c23a62f3a-b942dbc8cb1mr222235366b.19.1772839652701;
        Fri, 06 Mar 2026 15:27:32 -0800 (PST)
X-Received: by 2002:a17:906:ef06:b0:b94:1224:c605 with SMTP id
 a640c23a62f3a-b942dbc8cb1mr222234466b.19.1772839652254; Fri, 06 Mar 2026
 15:27:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303115550.9279-1-mitltlatltl@gmail.com> <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
 <aahGtIkxtNPeeWKc@redhat.com> <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
In-Reply-To: <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 6 Mar 2026 18:27:20 -0500
X-Gm-Features: AaiRm53k_VlQZv4zMVb4sFgV2r0nAPClUd_D6xpjJDMSvftewW2Q5sUxd4oiHeU
Message-ID: <CABx5tqJ_spoZrhX7n91rTOaMcp1G_n8jB5aJV-rNbSPYZBZxEA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	White Lewis <liu224806@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 85546228AD2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-95926-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 10:08=E2=80=AFAM Pengyu Luo <mitltlatltl@gmail.com> =
wrote:
> On Wed, Mar 4, 2026 at 10:50=E2=80=AFPM Brian Masney <bmasney@redhat.com>=
 wrote:
> > On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
> > > On 3/3/26 12:55 PM, Pengyu Luo wrote:
> > > > From: White Lewis <liu224806@gmail.com>
> > > >
> > > > The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div=
_clk_src)
> > > > had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate=
() on
> > > > byte_intf_clk, the rate-change propagates through the divider up to=
 the
> > > > parent PLL (byte_clk_src), halving the byte clock rate.
> > > >
> > > > A simiar issue had been also encountered on SM8750.
> > > > b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RAT=
E_PARENT on byte intf parent").
> > > >
> > > > Likewise, remove CLK_SET_RATE_PARENT from all four byte divider clo=
cks
> > > > so that clk_set_rate() on the divider adjusts only the divider rati=
o,
> > > > leaving the parent PLL untouched.
> > > >
> > > > Fixes: 4a66e76fdb6d ("clk: qcom: Add SC8280XP display clock control=
ler")
> > > > Signed-off-by: White Lewis <liu224806@gmail.com>
> > > > [pengyu: reword]
> > > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > > ---
> > >
> > > Looks like more platforms have this issue.. thanks for fixing this
> >
> > I hope within the next week to post a new draft of my patch series to
> > keep certain clk rates intact when sibling and parent rate changes occu=
r
> > [1]. This will be for certain critical clks, such as the ones used for
> > DRM and sound. I have it working with kunit, and just need to clean up
> > some of my new clk helpers and commit messages before I post a v5.
> >
> > I'd like to test this on some real hardware and I have the Thinkpad x13=
s
> > with the sc8280xp SoC. Can this issue be reproduced on this hardware? I=
f
> > so, can you provide me detailed instructions about how to trigger this
> > scenario?
> >
>
> Quick answer, no, x13s uses a edp panel, not dsi. This issue is
> related to dsi clks.

I posted my latest clk scaling work in an attempt to address the
underlying issue here.

https://lore.kernel.org/linux-clk/20260306-clk-scaling-v5-0-d21b84ee6f27@re=
dhat.com/T/#t

Feedback welcome!

Brian


