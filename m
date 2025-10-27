Return-Path: <linux-arm-msm+bounces-79057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D1CC11D19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B626219C1C12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808E5346E76;
	Mon, 27 Oct 2025 22:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xr9sE97B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FC8346E4E;
	Mon, 27 Oct 2025 22:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604524; cv=none; b=cvbz/y2arDFfPbtiXT9C2MHEsd66wB0PhGxLQVYXvrdGobnD455SNirN4OE39EU6VBaXr+l7pLF1KPd1bOnQtG1vk8IJFVeors5sQgeKrUnRGvLI4J0mTssoDOJ9+0FFR1CZKCk28FPteMBDFE0BtnU1+W1mBT4ixFtgzarrtjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604524; c=relaxed/simple;
	bh=q57sUkRH3NRp7V6gPTBU/beFfJPJmbdKF8Lyt8uP6hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kr44iDCVd/pFN6+yD465acz62/VGaE1WiRJ2mzNw2X1ewSKoCYG3eB8fcOIhh/yuh8pRuwOgkDQEWkmjr0jpzQZyW6+z/w4KpIY95D8cLRquPmaPXlkjdbYalMLIRdjCD9P4REk5i9+rdBwnEHYuaOUzQ1yCNRfGVqhcg/YUR/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xr9sE97B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BAFC116B1;
	Mon, 27 Oct 2025 22:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604524;
	bh=q57sUkRH3NRp7V6gPTBU/beFfJPJmbdKF8Lyt8uP6hc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xr9sE97B65s9NyksWBn5K7bz4U8r3/Pxnc74t/lHCyiJ5EFG8VJwsMNoQZsgWVoqs
	 46U7kK73SdeBuBMNCdmKaxyj0w38sohCIa74sS2yet/L1Ckz9ElgBt9Tm9KbQDZllq
	 a6eTQEwODNGI09RBOLRg5bpp0X4zqKMfcm3TNlqb3ACTwJTPzZqvdA0Bjz+Jc0BgbX
	 wrkTjFR7a04gjVwD6AQdRaObHsm03T9scqZVtQljlIQUCp0dCjbUu/FeHzuhFIkgyb
	 IqffMKR7NJmpBq6pgt/hz3Yl5UHoHjLpf4e7HEVZ+yuCOEy7y/IIsvxKZlORS7EngZ
	 rhsXkA0ZX4oLA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Jingzhou Zhu <newwheatzjz@zohomail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] arm64: dts: qcom: Introduce Huawei MateBook E 2019
Date: Mon, 27 Oct 2025 17:37:17 -0500
Message-ID: <176160465207.73268.2260831988082398324.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008130052.11427-1-newwheatzjz@zohomail.com>
References: <20251008130052.11427-1-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 Oct 2025 21:00:50 +0800, Jingzhou Zhu wrote:
> Huawei MateBook E 2019 is a 2-in-1 tablet shipped with Windows on ARM.
> It is one of the early WoA devices powered by Qualcomm Snapdragon 850,
> or the sdm850 platform. This series adds mainline Linux support for this
> device using device tree.
> 
> Changes since v1:
>  - Removed 'enable-active-high' property from &vreg_s4a_1p8 and
>    'input-enable' property from &i2c5_hid_active to avoid warnings
>    mentioned by "Rob Herring (Arm)" <robh@kernel.org>
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Document Huawei MateBook E 2019
      commit: bfc5cabaa4979f6645c851759b4242f9efe4f106
[2/2] arm64: dts: qcom: Add support for Huawei MateBook E 2019
      commit: aab69794b55d7f60d94305961be264cd230112ba

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

