Return-Path: <linux-arm-msm+bounces-405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1BF7E795E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 07:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C0B828105F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 06:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC341FAB;
	Fri, 10 Nov 2023 06:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="gEE+MfXa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="riSI7q9y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282A511C94
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 06:32:45 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2D2768D;
	Thu,  9 Nov 2023 22:32:43 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 01E4B3200A68;
	Fri, 10 Nov 2023 01:32:40 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 10 Nov 2023 01:32:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1699597960; x=1699684360; bh=vpqlrKxX6mSBUJFrH57/cRKqR73F6veHo7/
	WoW+1YPE=; b=gEE+MfXa/NACn9/dTW54Jhx+0xprgHek51JOAX1KpBGCYxNsgpf
	wUe9213m5iv96CUcGrt22/DYYoHaji9XCKDOJm1a/IgZGvN8kNLjcoVH70/Few+Y
	MEHveRKRG8zVdv2EWE9+inKAwE+V4af2prhBx87pN0hw3oH1Bvir6if2pWT3yiAW
	dLMjJVjvRbsypVRxRzwl/+jjIdCTi+U/SznbtZoTHClfz/e0C979r24j20I0Qwsw
	rwiYyj2PKoMTPkbBcq8s+SNqJyvezBEhkp1l72MJJ2+l4+xII1zJ8bc6+bZ3TK0Y
	3cxzsdcViGrMOAupQgSBx6Qs1h0z+KNjQyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1699597960; x=1699684360; bh=vpqlrKxX6mSBUJFrH57/cRKqR73F6veHo7/
	WoW+1YPE=; b=riSI7q9yFK52nLj5y2/FhQK7u42nxRuJyTWKkRdzvSVl6wC6mAw
	xU9k/JxKtz/itp7hC/eSicq96jJ6Q2b3pEUSVR0mJ5Bsrc07D+/F761Dn8EpmxPb
	O3PaQbuX3iVugyRWU4wFmunQu11KY3gC9L+VeYQuIoCMYmXD57BVvJQIDv1277x5
	KsAaMHoM5yJbxPfN/BGPOE6XE+TNiO+g5BhisoIjTTx4l0aSWlptqSG8wPhFS5Y8
	gvkGA4EuonjQXupHPabc1leSuKpV6oP1DoSdWWpq5WscZJ6p+MARCM7ADwmI4SlJ
	9BWpyaQKSfoqQh1XyKMQvotw33YWIVKDMdQ==
X-ME-Sender: <xms:hs5NZXUXOWXp3isMudOyVbUJomXV5TqgLfelZrQGQ4U3vopl8xTy2g>
    <xme:hs5NZfk2NMKyF11VPQWcBiRov1ujMcAnYpIJ36mz_fHvaiAEcJwn7nFcYa1SQwGuq
    epS4wRWIbyLoykxTz0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddvvddgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:hs5NZTZ2iywI27swS8tz5PiX2BoWXHWfdfaq1uXcxdPMTedVJInxQA>
    <xmx:hs5NZSVFQVZ_It6ReJCDW3YpFrBeITbMNopkTRsCgIUgs1b8MX3Ryw>
    <xmx:hs5NZRlzSW6u_AI5qVkrDrL0JB-DAFqwGeLmGLGBXn-9e3QtzUIoyQ>
    <xmx:iM5NZU5XlSlNHx-hJA-LY3kTEZ3cPwD-t-BglpUXGwb2yxO8KZTZVA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 28EA2B60089; Fri, 10 Nov 2023 01:32:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <1e5e1008-707b-449a-9dbf-48324eb2b248@app.fastmail.com>
In-Reply-To: <20231109202830.4124591-1-u.kleine-koenig@pengutronix.de>
References: <20231109202830.4124591-1-u.kleine-koenig@pengutronix.de>
Date: Fri, 10 Nov 2023 07:32:01 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Jay Fang" <f.fangjian@huawei.com>, "Rob Herring" <robh@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Laurentiu Tudor" <laurentiu.tudor@nxp.com>,
 "Tony Lindgren" <tony@atomide.com>, "Sicelo A. Mhlongo" <absicsz@gmail.com>,
 "Andy Gross" <agross@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Liu Ying" <victor.liu@nxp.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Luis Chamberlain" <mcgrof@kernel.org>,
 "Nick Alcock" <nick.alcock@oracle.com>, "Chen-Yu Tsai" <wens@csie.org>,
 "Samuel Holland" <samuel@sholland.org>,
 "Hans de Goede" <hdegoede@redhat.com>, "Yangtao Li" <frank.li@vivo.com>,
 "Yuan Can" <yuancan@huawei.com>, "Thierry Reding" <thierry.reding@gmail.com>,
 "Jon Hunter" <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 00/12] bus: Convert to platform remove callback returning void
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 9, 2023, at 21:28, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> this series converts all drivers below drivers/bus to struct
> platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
> Provide a remove callback that returns no value") for an extended
> explanation and the eventual goal.
>
> drivers/bus/fsl-mc was already addressed earlier with a separate
> series[1].
>
> All conversations are trivial, because all .remove() callbacks returned
> zero unconditionally.
>
> Some of the drivers touched here don't have a maintainer and there is =
no
> maintainer for all of drivers/bus. It would be great if someone could =
pick up
> the whole series, maybe Arnd might do that?

Sure, please send a pull request to soc@kernel.org if there
are no further comments.

      Arnd

