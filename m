Return-Path: <linux-arm-msm+bounces-24848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B9B91EA52
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 23:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F20B31C21224
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 21:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F6A171650;
	Mon,  1 Jul 2024 21:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDufTpQW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9A884A32;
	Mon,  1 Jul 2024 21:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719869307; cv=none; b=WcPv6hmVs0tv2XKEKd4pvX9p8r5EugL7/qf9uqeafpf5wAenhSr72VXX/tFNzD2pDogLiHgwNyt2y9mC0Ub1caaBoWvDaUCaCEDjjtaGDNGLQt3/cOAgBkdLCd2fGskbtNxrjVowDWU1hzD6XK5uS/K/GbOTs5mIWOqcZUT+WDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719869307; c=relaxed/simple;
	bh=3EZcXFlOOkubFO5EKsszk15HVDKuJ+iEX+67Sj1Hswc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4xj4xKEOoxwpw3+uanC6XmlvTWqSTYvjTkjcA0tHz5qqNtnYYZ8du0GMN7dBCXcGxW1C2eAm1hPlcbRjW5523Cz8Xr+2HNOSZZkSmSl5mh/hCpVfExZ1xPrmcICq+CfRzG15ycUU6waZB92dZF4XHkm2TfprN1ePOvt1Ta3qL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDufTpQW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD33FC116B1;
	Mon,  1 Jul 2024 21:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719869307;
	bh=3EZcXFlOOkubFO5EKsszk15HVDKuJ+iEX+67Sj1Hswc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CDufTpQWq9CZD/cbL4YGD7JsivHT7+dOSHRELR+950oJN0WdrGj7/aTA0QbJ6Q4QY
	 EaUTLO+DajdIjZNKm8EYcZBbftdPp8NiFgqmTaWem6TgPsX6w6G3Oen2wDo+FfnuDi
	 SxZxjF9Ezf4lx8jw8HK38eybN/ygnI+MKg7Cy67Rj1p1HrQtk4Ma4imq7eFGvHL7Vx
	 A3Ohz1dGxIbsPysjLQwzBJ4n1AjtX4IC5GNROUZyIrqNclw4OOFyvHLNWWt9j0mIfo
	 NZBBvaGp2iD3NrvmXwIX4tlfEHiXOsTzoWw1nS4Ut200KG4j/+TfLlN7pGleR9PDZn
	 cjOU/WKuMaYjA==
Date: Mon, 1 Jul 2024 14:28:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: manivannan.sadhasivam@linaro.org, loic.poulain@linaro.org,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, quic_jhugo@quicinc.com,
 netdev@vger.kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] net: wwan: mhi: make default data link id
 configurable
Message-ID: <20240701142826.25ccb798@kernel.org>
In-Reply-To: <20240701021216.17734-3-slark_xiao@163.com>
References: <20240701021216.17734-1-slark_xiao@163.com>
	<20240701021216.17734-3-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  1 Jul 2024 10:12:16 +0800 Slark Xiao wrote:
> For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
> This would lead to device can't ping outside successfully.
> Also MBIM side would report "bad packet session (112)". In order
> to fix this issue, we decide to use the device name of MHI
> controller to do a match in wwan side. Then wwan driver could
> set a corresponding mux_id value according to the MHI product.

Sounds like Mani wants to take these so:

Acked-by: Jakub Kicinski <kuba@kernel.org>

