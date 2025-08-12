Return-Path: <linux-arm-msm+bounces-68790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CE2B22A00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A561E1C23675
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32FE2882C4;
	Tue, 12 Aug 2025 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nb+FuEM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE852882A2
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755006847; cv=none; b=evcuX8b/IxnFxahrXFZvsadniVyvN5XWJrb5HHGrr2k8iEZbmprgVp4LGMfoqMk3qcyvJ37YpfzXevN7Rk/e/WkRJqiSBpymbRH35sdDPwNBySdLmdnL21Iq0iOkb74iCu+chzNPT89pbndYsKdfdhoSM6w4qDUSlUD6F2If0yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755006847; c=relaxed/simple;
	bh=Q//s+/zCNBEzjNslOllCQGV4nFuLBeOueQxvALXBZS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEXyfLQP4TbrZpIPQNGm9J1dXaeHPxn4u3vhuwcHa8TbZrn9WOz+Y1Ih8KL11EbGnb2P7e4K1pS73DoxgM5eaBxHWd8GO+1By4hOiwS9hIlUAZCd9Wra4SUtUzp7LO2TrVFsGer6WCvLC9Cu5UssfFibHA5f7kgkhWlHmYadPa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nb+FuEM1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755006845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q//s+/zCNBEzjNslOllCQGV4nFuLBeOueQxvALXBZS0=;
	b=Nb+FuEM13ufwK+wdBEE7potiNvbe73C+R+GfaKPY+CfiFfZHfoIyUMRGAjGpSip+aR49Tp
	eKBTM0WCGhlfo/xo7dxN7ZGbo0iU2LvILac+T2sPaWy4H351XrjYD1HcSahH18HgxK6Llp
	fSamHVKVY76BkyOHlhibqXgKzmxk4fw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-FQZ6ctk6OHeULAQMTleZUw-1; Tue, 12 Aug 2025 09:54:02 -0400
X-MC-Unique: FQZ6ctk6OHeULAQMTleZUw-1
X-Mimecast-MFC-AGG-ID: FQZ6ctk6OHeULAQMTleZUw_1755006842
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b092c12825so151121521cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 06:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755006842; x=1755611642;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q//s+/zCNBEzjNslOllCQGV4nFuLBeOueQxvALXBZS0=;
        b=BOl/U7Yh1ibAI7Via1SwWLI9thoTwk6Ly2JheZT2j2RlvmvmDxJRiFLnZTd//6gMyg
         UjdGDsFOhDelUSUyw+Dxip9Uy8+72i4+ANv4VPwbVWbowltoelWnV2UihbQTr+RDBW+U
         z4f5eCberTBlnZfpr6xY7bo4rt4hvwbtb5dsd1MWcQ5A6Q0qZrwIMeMoY/LjvSssS38x
         r9qafg1+qcHBODlsACjGKCrz8Vl08dgp97/1erU71zyFu5UnumYX89wbAp+gKG0Yuic0
         ZAQMjDYMsCA1BqSEJBTd4OxwvkjdIU/EfVAcFk2hyhJLEnQbnFaG9WspJKZAvMuG7We9
         PTSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR2jqggSRvXOzfCQAgr16OyFb1SCnEaRe+hs91c41YPG+nn4HhuTAh780G97TdCBPPk0MNeRxlSCyly5mB@vger.kernel.org
X-Gm-Message-State: AOJu0YzTV/JwYvWf6cN1hbTMsLVNRY5KXjCMUcw/fj5ExrtaNmpWkQx3
	dTQ8aOszgyXeTUM5wORFzsa02nJYBawT/1olRN/X9iSVW/eaEqAW+0HwkHwD4NRoEcR0HlDba1/
	rWdZy7kV/o59QDcl/KloMhko4JkiP8atu1hS2YPHPa2ftUXIKajsHpuXfouRw3Adp3PU=
X-Gm-Gg: ASbGnctPJnOruYLCLxpPXpxOR4Z0jTFcJ/TLxEBqKrHACtXNL5IGDzlG7Z7NvxIdrWt
	neqowgpNBe0zQ0QPKM4g2S18fkTvQ0GBkXIjggUwaztBHaCRrfsihrMd+8Gdhfzgc2KheaSWtwv
	b5kCGvywiYY6pvIFKxsvQItqvmqkeqPTfI9LwNValGwuO3CksfHPOKbR7zuERnxzPYqirNUzMRu
	hOvnrtYjOKva6tD7inhyBp6erflucAbDqp/cF8jJQKjz3ACUQdV2eW00hehWSj/EIBgNM9Z4gI/
	IBAOtnXHegGju3kzpXyRKeesjJ7Z1kaU+jUe6v88yxE7bseny5hAhg9gWEk01t0=
X-Received: by 2002:a05:622a:30c:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4b0aed36723mr265510301cf.38.1755006841691;
        Tue, 12 Aug 2025 06:54:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL0wdDdlaxY3Jk0TgFfLYMOMEPwCaVnL7cxWLBN3HaRHoOlakRNGI4PvbhwBJNSUpcz9s5eQ==
X-Received: by 2002:a05:622a:30c:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4b0aed36723mr265508911cf.38.1755006840909;
        Tue, 12 Aug 2025 06:54:00 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0aa1efe78sm75493211cf.8.2025.08.12.06.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:54:00 -0700 (PDT)
Date: Tue, 12 Aug 2025 09:53:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated
 round_rate() to determine_rate()
Message-ID: <aJtHcs8_671G33Ez@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <a151ed7c1caac83e872cf6075c215fa55bd21f82.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a151ed7c1caac83e872cf6075c215fa55bd21f82.camel@icenowy.me>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Aug 12, 2025 at 09:39:45PM +0800, Icenowy Zheng wrote:
> I was doing a patch to add divider setting support to clk-th1520-ap
> driver and sent patch now, should I remove round_rate from the next
> revision and just keep determine_rate? Is it safe to do this even if
> this patchset is not merged?

Yes, you only need to implement the determine_rate() clk op. Please
remove any references to the round_rate() clk op from your driver. If
you implement both, then only the determine_rate() clk op is actually
used by the clk core.

> In addition, will the clk_round_rate() API exported to other subsystems
> be affected?

No, that will stay as is, and with the same name. The underlying
implementation in the clk core uses the determine_rate() clk op.

Brian


