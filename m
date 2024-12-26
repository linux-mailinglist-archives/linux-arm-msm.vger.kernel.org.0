Return-Path: <linux-arm-msm+bounces-43380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B43889FCC9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AA9318831DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726B8140E30;
	Thu, 26 Dec 2024 18:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7/fjo3Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4330F23DE;
	Thu, 26 Dec 2024 18:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237636; cv=none; b=RWVzM5fxFdHgirLBUpU294eiGIZuTy/CmQvR5lCmlUHSLU76DE/Zbhp7zeCVW3kBI52HS6STcLg4/xo2HEDmmtWXnzgOEkum/NSIEufGRPuLAm+y+OMgRx3ynccox+oNmJlXojLjmBqXrQDouxJaBpQslgj4Yxjhai8TBMPMja4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237636; c=relaxed/simple;
	bh=An3fKUyfA9q8Ed2sZXTaDn2Z6UT8d+JdPejgkKLgkyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gReGwi1oy5JFS63U0z/1dy+w3hlcLai1iJyvF9XiZ92tIO3R7uDGvhoMwDdDJ32zreT/BJjqXpjmvZSr9cy2qD7xO1pJpc4yn8NLZj7Mnwp3XZfjs+ukxq6AVu9cW+i8qzf/+Jh4+1BHF+P/7wb+zMWpSSvTVNYNz1NWaINYEQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7/fjo3Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21224C4CEDC;
	Thu, 26 Dec 2024 18:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237635;
	bh=An3fKUyfA9q8Ed2sZXTaDn2Z6UT8d+JdPejgkKLgkyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C7/fjo3Y6lOWQZ1xZIcOaY83EV3YhvzFa2enq8+iFOPmCHYWYXlvcfjZtr9t2mh/B
	 wVsYRnh1dypMT3ZG+sglasNSWuHd0P1lJv3vqbaP8aDIjNkvFUHFI1Leu2CpobP5Xk
	 ME8WRSRp5xDFA7BHcbOFSGiNNsfDukMcl8mA0oKbnB8UleyEincqFuBVKtvqqiclC1
	 DDP7yNPy2M7Sgn+zsxN8hs9jW1ycQAgi9tw0Mvsx6ggl7cdU6LNI2AgbjXwkQWiXnp
	 Dyyo+KIJTwJU9FqkGgoQn+6nVI60OtBAAOmqjtDsZEfHiBbtHowsmzU9enSaJD8wu1
	 xLsI9sVAGMHGw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anthony Ruhier <aruhier@mailbox.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add lid switch
Date: Thu, 26 Dec 2024 12:26:34 -0600
Message-ID: <173523761378.1412574.8287690464874311392.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219-patch-lenovo-yoga-v3-1-9c4a79068141@mailbox.org>
References: <20241219-patch-lenovo-yoga-v3-1-9c4a79068141@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Dec 2024 17:05:08 +0100, Anthony Ruhier wrote:
> Add the lid switch for the Lenovo Yoga Slim 7x.
> 
> Other x1e80100 laptops use the GPIO pin 92 only, however on the Yoga
> Slim 7x this pin seems to be bridged with the pin 71. By default, the
> pin 71 is set as output-high, which blocks any event on pin 92.
> 
> This patch sets the pin 71 as output-disable and sets the LID switch on
> pin 92. This is aligned with how they're configured on Windows:
>     GPIO  71 | 0xf147000 | in | func0 | hi | pull up   | 16 mA
>     GPIO  92 | 0xf15c000 | in | func0 | lo | no pull   |  2 mA
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add lid switch
      commit: 7069abcd5340f4c8dc4a96b814609b25d7e332ee

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

