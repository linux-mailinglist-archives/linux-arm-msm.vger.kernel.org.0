Return-Path: <linux-arm-msm+bounces-57833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD23AB6A42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 13:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC9613AC251
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 11:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE5127D784;
	Wed, 14 May 2025 11:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRQnb8Wf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E347C27D77D;
	Wed, 14 May 2025 11:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222671; cv=none; b=b3YaIXYc0EI6rN8kn5eXTOQA0fXzzsVUnfHyhxTFt90exqJ5A9Nzcg2EscyHIQulSuDSAe4mVr1Kfkeg8w2Csv5KY9yWvszdL50anNCSeVWROqXAokFwSnKGMkXrTowdeUVvlf8kaCzlL3e/Rn/qUlXljHkdt3FynfrzRobEHeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222671; c=relaxed/simple;
	bh=0F01DWP26YYgS1PPdTSuMQtQtJxshmUQ6mSt4A+utgY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K10D70mwe1c3H1jFXnkzG4nF139PqGI76kr8AMXLv4/pLPFe+in6Q0dEHT1mJYoqriEI93EkjPLwzl7hYDDgRQdnelmitlRtpksxqtfcXfm2XRV+gn2Oir7M4FEowKGXLGQ4QS0TUwjOosaeMJq2x2nlPR2J6CRyBb84GkDGE/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRQnb8Wf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659AAC4CEF7;
	Wed, 14 May 2025 11:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222670;
	bh=0F01DWP26YYgS1PPdTSuMQtQtJxshmUQ6mSt4A+utgY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BRQnb8WftKdlkP5oGSf5HoMasCRIMWeAvcu3TQDmCOC3I9ljErJZ6RTN1Tqu4i+Vs
	 i4F2roBZZ+D9qHJGbxdxmzsmC6KD7WYptbl8TWIeHpqeoc2EH4X4yhvuyHbGOY0pj5
	 +ILAZpFMrQ1kulgAj/8Dd+0RSQhCSyMG2OFC+fZkuKpqOh8LJQ+zc677t773QaoniU
	 WQEO0JRWkvSUBF1O+IMYIGYw8py4zu3KxAVkyos+kgAljVYff/qYTcfUIZWwRkuJWs
	 V4bR6U3I2USosOjHLPK/CMWSPfIcna51PUKDvLFc4SjA/bKbUbwHN+8B3mEq87Fn7L
	 iZJmK7OEQWd2A==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v5 00/10] phy: samsung: add Exynos2200 SNPS eUSB2
 driver
Message-Id: <174722266707.85510.6309026442043319817.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 04 May 2025 17:45:17 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds Exynos2200 support to the existing eUSB2 phy driver,
> as well as USBDRD support for that SoC.
> 
> The SoC features the same (as far as I can tell from comparing code)
> USBDRD 3.2 4nm block that Exynos2400 has, hence the common denominator.
> It consists of a SEC USB link controller, Synopsys eUSB2 and Synopsys
> USBDP combophy, which are independent underlying hardware blocks of
> the USBDRD controller.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: phy: add exynos2200 eusb2 phy support
        commit: 59cf7546079e3d08d105369c48f8834970290082
[02/10] dt-bindings: phy: samsung,usb3-drd-phy: add exynos2200 support
        commit: e4c9a7b475e5d0d9b2440ee48f91d1364eabd6cb
[03/10] phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
        commit: 8d3b5f6375466ffcd2cd98a0c84d31295470fe9d
[04/10] phy: phy-snps-eusb2: refactor constructs names
        commit: 93dbe9b5b3a265c7e5466c7b6ada439b01577de5
[05/10] phy: phy-snps-eusb2: split phy init code
        commit: 3983b4e9746da1b6091f1d9083f44ed3f12717cb
[06/10] phy: phy-snps-eusb2: make repeater optional
        commit: d460be705ae599c0cbfc1ee4ba6a41b225525609
[07/10] phy: phy-snps-eusb2: make reset control optional
        commit: aba7a966b50d11deeb3e2f1a66182d150eeb7843
[08/10] phy: phy-snps-eusb2: refactor reference clock init
        commit: e36a5d1ecc5f2bda92e4f954f41d65d1ddd5728e
[09/10] phy: phy-snps-eusb2: add support for exynos2200
        commit: c4098f3e6134e79e070ec44c58976e1f00d9bfad
[10/10] phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller
        commit: cc52a697f87e8b2d88298827aca3f81398385572

Best regards,
-- 
~Vinod



