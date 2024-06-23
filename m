Return-Path: <linux-arm-msm+bounces-23797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7AA913E4F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 23:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B160BB20A49
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 21:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56D7185098;
	Sun, 23 Jun 2024 21:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kj2oNCAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98016185093;
	Sun, 23 Jun 2024 21:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719176544; cv=none; b=RUBQGGbLS00coVQOBeysX9JwSwBrn00bVHYGMbdu74Qu/RCfNMFXAwNOPpUrqvfFumLgeVJXhBNFPOPoXLM04srGfPpiSOglxXsAX3Nz2fUhW2Tw2YJGFbxSM6sGDCtVRXC5gzHEggnd/K0nuQ8CSS3O7A5EQywIlqShVKlwqsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719176544; c=relaxed/simple;
	bh=jbeIn4+CBL0EfOHFDB0YonTaoHiUvbYluP4SzykUnEE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c1XKOgPIZbRHiRzxZsPMZ+czUHOE6ZV/czlo1j9FAP9DPr2WPY7TgqKWYisYq0oWyzLlRbaJ/ze7iDqDQnb71YNVFym5QZQgLsBtkv1Pjkb+FvMHWcEUKBIt2DlGC9NfXcWkakhrT1/zqGIkbXqR9FxrM28vah2oX6LpciAOMiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kj2oNCAx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717FFC4AF0C;
	Sun, 23 Jun 2024 21:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719176544;
	bh=jbeIn4+CBL0EfOHFDB0YonTaoHiUvbYluP4SzykUnEE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Kj2oNCAxyO1nMyfhUMJRUARFy4HLPrc7NXl41JX1mbowBngxysIsLQEBfgh2j3JLo
	 afA5XB7nuzqpqMiyUYA3bVkRBCZuPJwfa28rjanvOnML90IcDe1Zi5InrIu1Ey2/Yv
	 vN/UQeiJwOx3pZ+w6Y/W/mvY5xsurCU1NfN5NuDwwsDX6COgIqElM+41AQQ+S1Q4nM
	 X8IXhyXjjmp/y79wET2sU9quj6gnMFAiM3iYtzgAMLUl5Oqz7c8/TeuSbM0p2eHMDW
	 6vHouhinfDYaTC/NAUwnmonQesH0TqrUsmACAFxi70UAWmFHHdAKRKembFPO8pgqq5
	 6p8ABOgvI18zg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: qcom: use generic node names for Adreno and QFPROM
Date: Sun, 23 Jun 2024 16:02:15 -0500
Message-ID: <171917653471.4580.9431450557222191260.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240623120707.45764-1-krzysztof.kozlowski@linaro.org>
References: <20240623120707.45764-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 23 Jun 2024 14:07:07 +0200, Krzysztof Kozlowski wrote:
> Use recommended generic node names for the Adreno GPU and QFPROM fused
> values device nodes.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: use generic node names for Adreno and QFPROM
      commit: 81fc54e62b5b391d78f741bf33c3a91f18464ffb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

