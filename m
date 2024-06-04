Return-Path: <linux-arm-msm+bounces-21632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB638FB7AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17A01285F50
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 15:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10A0144D23;
	Tue,  4 Jun 2024 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1p0RL9O1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D47E144303;
	Tue,  4 Jun 2024 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717515749; cv=none; b=sgxijqImJpsq58BnlGfeI7umX9GhDlv0TsaTe7tmam+80MsbI+2P8vdslokI1iHXEVJk7vwROpDkMmRnjOKwYu330e4GwsRIvo/RP/CCr9o33MmoOOe/oZbgwBpiRlXAYMxB26cclPtIlZCc6Wa3yEriCNBKxAlnh46wyKzdj0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717515749; c=relaxed/simple;
	bh=gvxpfHQ65oWsKW/gpsh/uvOZGyM//B6SX2D/4rQ0Nsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlwVQTTYvgoIMsEYPvFrQvG9MxB8eOpDjkoHlIqxiJrK9K1lHQOtwj9UxrJSEhtGfJQuFsxFvy7Jc2NGZR9WCVY6Wrf2iW0tzErYhsutb6tmHUX8rKh/DQERthyFJDZrz92SLZ2vlP+rvtn6KlpE9T+yIzYaIH4z//L4aw4NckI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1p0RL9O1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB18C2BBFC;
	Tue,  4 Jun 2024 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717515749;
	bh=gvxpfHQ65oWsKW/gpsh/uvOZGyM//B6SX2D/4rQ0Nsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1p0RL9O1txeF88r7BI4R3mZCPecX9o5eCeU291B62J/7N4Hkguvf1lfLd3cqQUs8P
	 4Y1/0W4FQ0ElqLZ7UU0nmattnWlXk/Z10eyZip8sZHsKgLIIU/ogQGQB9n7FHaJ/iv
	 fP0oOcb6nC636FrLvgUA+RegIdHHg80BK9dpAXYI=
Date: Tue, 4 Jun 2024 17:38:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joy Chakraborty <joychakr@google.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vincent Shih <vincent.sunplus@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, manugautam@google.com
Subject: Re: [PATCH v3 1/1] nvmem: Change return type of reg read/write to
 ssize_t
Message-ID: <2024060445-amaze-sitter-88da@gregkh>
References: <20240510082929.3792559-1-joychakr@google.com>
 <20240510082929.3792559-2-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510082929.3792559-2-joychakr@google.com>

On Fri, May 10, 2024 at 08:29:29AM +0000, Joy Chakraborty wrote:
> Change return type of reg_read() and reg_write() callback to ssize_t for
> nvmem suppliers to return number of bytes read/written to the nvmem core.
> 
> Currently nvmem core assumes the amount of data read/written is equal
> to what it has requested from the supplier, this return code facilitates
> better error handling in the nvmem core.
> 
> Signed-off-by: Joy Chakraborty <joychakr@google.com>

I thought this would be two patches, one to change the return type, and
the second to change the logic involved here (making it easier to notice
the logic changes.)  But it seems ok to me:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

