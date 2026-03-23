Return-Path: <linux-arm-msm+bounces-99345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GJBG6BvwWnmTAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:51:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6542F8EF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63A4B30D3942
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0BA3491C7;
	Mon, 23 Mar 2026 16:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YR/oE/DY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zp8+J9CK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339FF253932
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282090; cv=pass; b=JUsE09EigkLwjTMqscniBq/upmmRCVDy3uY9Oi0+Q8mEiJE5SmBFW9XnkXBuc1QHmvoBiD4uiVV3h3B0Q6rf2VvEoA3uWBKgQgMWnKXH0JLcWXaeIwULdYRtzmV8V698pYaSFDDQzTKDh88rCwJlzVcFZtpRNi0Bnls3bOrGhe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282090; c=relaxed/simple;
	bh=iKHq+WQ5shR1PuWWlRfHcjvkyXm7PwO1wqXAron3psY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P2/FWBMM13xBCBlbSdM42M93TD30Yc4ET8jX3dS7dgtbz+5ZyCaYPQHhdrOUVp2bzDGXG+RFikbWa4KwcLmGPrILNv8jH51/ygnHfi6KD2rmlAPJ0kXdweGb+Bf6c+v9h+rBeIC1Rndl0/zsNIDyqtXd8aI0LgCPVOIGk33jwI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YR/oE/DY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zp8+J9CK; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774282081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OlpYSn4iu4HLAmc0XU2T1L/rpeJuBDganTKgWCdzs8w=;
	b=YR/oE/DYFeDes7++DJLbaPIbYGAT52DR5X8b0Egg6g/8kG2luUAJLVQ7zl+/fmN5ZV6LbS
	rOHsqC/4hIlo2ZOZnKgPYTznY/O8BZiUDYMyq1ta6e0HqZ6VUPwLUPoDNcbuVRh3hPGneY
	tBXTFcOaiYlgScGrO2WVBhCUZbY+Of4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-MD6cHavXPxy0tL2QIxgzOw-1; Mon, 23 Mar 2026 12:08:00 -0400
X-MC-Unique: MD6cHavXPxy0tL2QIxgzOw-1
X-Mimecast-MFC-AGG-ID: MD6cHavXPxy0tL2QIxgzOw_1774282079
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b90484c398cso360173066b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774282079; cv=none;
        d=google.com; s=arc-20240605;
        b=bWNL9KBlY2k7LVbvzdzqoQs6nIl6YpHfXune5bvVkavqkvakXCXi7tIbESg7U6Ahnh
         z76uthTJ2ytNiskPUW+x6b/wwoNbdm3zVTb/iz6lRkGN1Zq4H7/H0BpMoFz1dEmUnhNZ
         YmuuiU/7f5+By0skMSvGbvDa9Kkn0qwj+/hE1nxkA5mEAEcahLnB9UA9YsTMXY21Yxkh
         El4AMJRlNOAiyll+sWVEc2q9E2GxbtGEAgz8MvP+sq3gQrrkTm9J8jozF9pK91QKF+6l
         zQiQiAB3gilo3OjZBK1E4ZVSKv7rk7mdvzs4z+S9Q4w+cwKGq0/Ue2lbzirXCOOs4FRS
         Orbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OlpYSn4iu4HLAmc0XU2T1L/rpeJuBDganTKgWCdzs8w=;
        fh=LfxAcmtwSfttO2a7mSDNQ6waFGWuoGYRCLHxqTRYY3Q=;
        b=Tu7Q1PyZyPCZLraWNPpPSZKvTCn84joSDhr1aVwcXTmsO+sqIZSX6JIJDnx5GYHP0I
         Xi+/fgCR2NNi3Q0xKavByuSA7MjZLXZyRCYcfslM2h8/F+EB6myrdXodWHy1eBWGIXjn
         KCI65CZcp0mGG12o7rFNln+UU8jk827BovB4uz4iu8gqu6i4ET7mApwUEOLs/b5d/lqj
         tk9cxb8odOnOOVRTfJnKvpSgusenUC5AiuW4r/MGIUtkrRuDnXP7ZRCkPMCxTy3DAQpn
         xukLD5Gai+rWwvuc7g3Y8NMzUh92L8tW6YnCsBhfDdl7LmkdjbK7BYrS1SroVRx9Ho0q
         g19g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774282079; x=1774886879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlpYSn4iu4HLAmc0XU2T1L/rpeJuBDganTKgWCdzs8w=;
        b=Zp8+J9CKiaNKxIvDN1scLhWcTxcnl1bi8ny4CK7U9tG/J00bMJRDKpNtvGCI93+Zcq
         RpoHv7qTRzohDRZRJXl4h5cax1d0vbWHLo7bXgnyIHM7+ydY0CKs7SVQa8apyxgXSQR6
         T6tXfUpjD7q5cnEedUtgkNhyloeDOWFRshFhkALW4TQsluSRtoQlXudYRY6oc0eaNb2s
         +ZZ2Qu+rcjRHy3TuLBySBHTMQ2qyV2NxVbJVEleEorvuKH4a4Cksr15z5yv3XU3O1oO2
         TsE7b40ZkezgC3pC9HVLsdjwlUImPJiOj7Oah86Kh0zCYpVk7hzM9SdGeeM7c0Run5Sx
         JQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774282079; x=1774886879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OlpYSn4iu4HLAmc0XU2T1L/rpeJuBDganTKgWCdzs8w=;
        b=IBVZNDThY/gwqP1B0cxKesde2PSQjZgfQdbn4TMdUALoGwgOgFAe8rNVtWvVFiua3E
         aHIdCgbhJMXeVTR5G+KyKkDvQnRMW2nK0q0iHInXwWZ9CK15Lqui1c+RIdcBXalLrRsN
         lbKMv3U6YAJSwyGLqSl5sg71A1J/h0rYJhCpEqwWdy7DdEU2gR7kWI8Oc7KZVU4OC2qx
         yiIlNoT8dGBh2iaTV73i9fe7qYP56Of8MGdQDRSdVzIhGAWCRU5CS4SbzTE8t5+9M4Tr
         fUOPrukwFsmCKn+8C0kEB4pQtebWnE95Y/UoW48vXVUZe0UpE8tYHuMc5uqpMUte7zol
         Zdfg==
X-Forwarded-Encrypted: i=1; AJvYcCVBDRkV8Lat3uayW6/qsm7dicUX0y5rQaK3GWGnk7R09RvAGlA0OX6MtLyNAdE8WsY33HHlbbRBtKc3oBk+@vger.kernel.org
X-Gm-Message-State: AOJu0YyPsT6iKjkPKZcimvhaBROsLIrHiyW+pCHvwMibE61dxreeXJwt
	KFqSYWxTdA5Qsh0cUgPkcCFNz1Sdasqjk9YtAZokHDk5L4GLXqBWqTfsPEJ+z+iG8urAJs8IH7I
	kW5Ta9T4TVxdDo/0TrokSyxaAw2Iyc+7DiHIn813EO3c0fJLrCgFnEMJV4owqHfcRjKDD+RRIGu
	eHvad8kt8Dcqxh0a8j3IdTQUqpN0PEvbMmXOYXy/vUZA==
X-Gm-Gg: ATEYQzy2Is/e0BVLkJBmyqcn7jWcJ2rAI/48fr7Afz5SP2OX4ZzkDcJbw8J+gK6qnE9
	ehdodfMMLKUn7wTl0hHvtps0beLCNihstDq1h/INyt39q0eFhShUtnLRxd43ZiLvUoe5ksk0dQV
	stdESy3jr8rwnwPSMWBF1/Q9mj4J2272vikPGXXQwL0yjyYP7JmwG8nH38JDS48I6AflT/nPYcm
	dXFiQ==
X-Received: by 2002:a17:907:2d22:b0:b98:4abb:cc49 with SMTP id a640c23a62f3a-b984abbd83cmr576686466b.5.1774282078847;
        Mon, 23 Mar 2026 09:07:58 -0700 (PDT)
X-Received: by 2002:a17:907:2d22:b0:b98:4abb:cc49 with SMTP id
 a640c23a62f3a-b984abbd83cmr576684466b.5.1774282078277; Mon, 23 Mar 2026
 09:07:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303115550.9279-1-mitltlatltl@gmail.com> <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
 <aahGtIkxtNPeeWKc@redhat.com> <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
 <CABx5tqJ_spoZrhX7n91rTOaMcp1G_n8jB5aJV-rNbSPYZBZxEA@mail.gmail.com>
 <abRBT4niX2CB9XVR@redhat.com> <22a469ef-0a25-48f6-bdc7-95ae5541e834@oss.qualcomm.com>
In-Reply-To: <22a469ef-0a25-48f6-bdc7-95ae5541e834@oss.qualcomm.com>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 23 Mar 2026 12:07:46 -0400
X-Gm-Features: AaiRm52Fb_ecUHD2iOtrqixZEdn0xZt7-HVJ3bLxAUlwoeK0LemmZuTmskYK78g
Message-ID: <CABx5tqK3MymYQZ4owofnzFLnjt+96njw5RG2Vwxo7UJ93A-42g@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	White Lewis <liu224806@gmail.com>, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-99345-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EE6542F8EF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Konrad,

On Mon, Mar 23, 2026 at 8:48=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 3/13/26 5:54 PM, Brian Masney wrote:
> > On Fri, Mar 06, 2026 at 06:27:20PM -0500, Brian Masney wrote:
> >> On Wed, Mar 4, 2026 at 10:08=E2=80=AFAM Pengyu Luo <mitltlatltl@gmail.=
com> wrote:
> >>> On Wed, Mar 4, 2026 at 10:50=E2=80=AFPM Brian Masney <bmasney@redhat.=
com> wrote:
> >>>> On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
> >>>>> On 3/3/26 12:55 PM, Pengyu Luo wrote:
>
> [...]
>
> > Ignore my previous patch set. In my v6 that I just posted, I updated
> > clk-divider.c to support the new v2 clk negotiation logic. The
> > clk_regmap_div_ops uses this driver, so you shouldn't have to make any
> > code changes.
> >
> > Anyways, would someone from Qualcomm be willing to test this? The
> > procedure is fairly simple:
>
> Unfortunately, I don't think it's easy to get your hands on a 8280
> device with DSI.. maybe Pengyu could test that on his tablet/laptop.

It doesn't have to be an 8280 SoC. It could be any device that has the
issue where the parent rate change screws up that portion of the clock
tree, and crashes the device. This has been a long-standing issue in
the clk framework.  I know you recently posted a series for 5 other
SoCs with a similar change [1], so any of those other devices should
work as well.

[1] https://lore.kernel.org/linux-arm-msm/20260304-topic-dsi_byte_fixup-v1-=
0-b79b29f83176@oss.qualcomm.com/

The kunit tests in my clk scaling patch set demonstrate the issues
that I have worked on. For example, in my test scenario, I start with
a parent, and two children. The parent can do any rate. The two
children are simple dividers. This is the current behavior today:

        KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MH=
Z);
        KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MH=
Z);
        KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MH=
Z);

        ret =3D clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);

        /*
         * The last sibling rate change is the one that was successful, and
         * wins. The parent, and two children are all changed to 32 MHz.
         */
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 32 * HZ_PER_MH=
Z);
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MH=
Z);
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 32 * HZ_PER_MH=
Z);

With my changes, the clk framework will land on 96 MHz for the parent,
and 24 MHz and 32 MHz for the two children.

Anyways, it would be great if someone from Qualcomm would be willing
to help me test my changes on real hardware. If it requires code
changes to a specific clk provider, then I'm willing to also do that
work if someone can test for me. Getting confirmation that this is
fixed on real hardware will help to land my series that will provide a
solution to this problem that has existing in the clk framework since
it was introduced over 12 years ago.

Thanks,

Brian


