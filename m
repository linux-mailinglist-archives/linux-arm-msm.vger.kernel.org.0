Return-Path: <linux-arm-msm+bounces-26139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A80093111E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 11:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E155CB22AC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 09:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0AF1862B2;
	Mon, 15 Jul 2024 09:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="TZuRyNHR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6C46AC0;
	Mon, 15 Jul 2024 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721035416; cv=none; b=arx75wd5NvZIbzMeQlvZ2HbSGaym7fc8OwUu6Dia+0ScYhwkctMrhlBXWc86JWezzaUU8+EBsMWHJqHuwiaCzYPN8IzHrMeH9+aJlv6dCJviR/H0pTV9oHdctEm7dkjF6eLbSl9VON2sHqJ4/sGbxuUeJ9DqldrDWRtQVswmMbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721035416; c=relaxed/simple;
	bh=LNctksWt/BWgWvKVNP6PVGbSb9J4ENKZHbaJ//1oUz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gxoQlQbUD6iYzWxUCSS3c0MLRwSanb7OUXjfRygKmp+yCQNXNI8BXVjU2k8ZXFJrL6KiDKpPGnsai81GYq97d7rhECf7DVKcRyLItkAP7nwzpezmF4f4dLGdW8EoEQAzUkMklCl5X+ScuyguXkeiOsfHYF6HbaLOWfrv7W896Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=TZuRyNHR; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 54E5538A399E;
	Mon, 15 Jul 2024 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1721035406; bh=LNctksWt/BWgWvKVNP6PVGbSb9J4ENKZHbaJ//1oUz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TZuRyNHRvhN/c2+bLuqy1Nxps7C3yx1PoVwcQ9t6JsNPcVWrl8JfHmh8Sq5/5U1FS
	 vQm+bd+SEhi+XxzcbVQtKy9qQpkwJzNiKwM5DDLiJBkZedDH/jtfnpUokiENA2tGRF
	 RkKQn5Oucg3No/30IB3+mqC3n9eMakoliJVyVhXcwEs4CMUs1p+txPs86j+IQpWZDC
	 Y5TnnqFEeITxshq38kg8NenTtOcedKve+ls2Cx9r1DVYW7DkiWiYuSlT1Q0RxRzbbn
	 fKXDnOgHvOom+TLuBmklDgRwEZLxmT0y+HmFpv15OU3XitTHXr1BnQ2e4uZrGgw6bY
	 VWvoN3OVMNXYugsRrfEabD++OcZq/lGSF/VOVXbMavVW3a+B4qU8Vonm7F9D06pc3p
	 roojW1VUu5nnTSGzZlRorDptnKn3J3nTPpinL8BMcr3ZZkt7PojVbuD2A+/7NOVgBa
	 F3NQY/nZVgeqPcM1PHX8fAmNqGVhBI7wOLEDffqFmdIieacymB54QhNgbqtAIvtqXm
	 D+gbqiXb5kMexS9y+vrjyJgyOU2HL3uqZqNCk0SwAUwPYvpUKGzcCuSwIU9q1F9elv
	 +0W+zbPcSQdIo3Gu18yNNxCGKjYrVUBx7qe+hhaFJAVwKQsw80AEW4hIOfQWJQI8gM
	 ucPFyOMBrChGgFtq61/oouio=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ipwIIj5f6IhW; Mon, 15 Jul 2024 09:23:15 +0000 (UTC)
Received: from xtex (unknown [120.230.214.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Mon, 15 Jul 2024 09:23:15 +0000 (UTC)
From: Bingwu Zhang <xtex@envs.net>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
 ~xtex/staging@lists.sr.ht
Subject: Re: [PATCH] ARM: dts: qcom: msm8974pro-samsung-klte: Add pstore node
Date: Mon, 15 Jul 2024 17:22:48 +0800
Message-ID: <3900804.Uhmku2k1av@xtex>
In-Reply-To: <552dac56-8915-4b26-8c90-769d09924861@kernel.org>
References:
 <20240715083245.80169-2-xtex@envs.net>
 <552dac56-8915-4b26-8c90-769d09924861@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, July 15, 2024 4:57:54=E2=80=AFPM GMT+8 Krzysztof Kozlowski wrote:
> Don't duplicate the nodes, but rather extend via phandle/label. Or at
> least drop duplicated properties.

I was referencing other qualcomm devices with ramoops enabled,
such as qcom-msm8974-sony-xperia-rhine.dtsi & qcom-apq8064-asus-nexus7-flo.=
dts.
They seem to have the same issue. Should I make another patch to change tho=
se?

Best regards,
=2D-=20
xtex / Bingwu Zhang @ Mon Jul 15 09:19:42 AM UTC 2024




