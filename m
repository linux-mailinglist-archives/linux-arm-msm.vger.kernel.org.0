Return-Path: <linux-arm-msm+bounces-79296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D7543C17039
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8556D35737C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0320C2DE6F5;
	Tue, 28 Oct 2025 21:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1bvISX9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3CD2DE6E3;
	Tue, 28 Oct 2025 21:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761687031; cv=none; b=ggdQxJDsE/wCbUCRz9Une06obRxSzak9HiArhecw3WKZPmrmeW4j5c1yKm3Ks0OQOsDzO3TtvZ8OReRFc0GmW/BC8h9/Vrzrw703JAEQv2Kqottj/H/U3WXkG9cOpJeayfNizWhS5bgNDQ0ZBEsqNrUX6axe1N31DF6uWEldSVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761687031; c=relaxed/simple;
	bh=eFtJ15StyaaHQlL+PLTy1jwHuJuBtYiw2acnSMmyTOs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rKgmyzjd4WLb14U2CPX7sn1Cm3d4XkTeC7nytnTLBOWfxnSE2iYAm+rokFQi1z1FyCN7iYFy4ZsKXK5gst8iLGm8/qo5qY9jdbFZvC3zANREGezwdvIRvzzAy2hHo3GxMwXXhcD8lFXkCuVFZb7hgnuV1Ht85uctePBLrnA7mck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1bvISX9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D177C4CEE7;
	Tue, 28 Oct 2025 21:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761687031;
	bh=eFtJ15StyaaHQlL+PLTy1jwHuJuBtYiw2acnSMmyTOs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C1bvISX9212KUFDtka3yYt4PXfw1h9EX0UzIcaRtbB8X59yIo1XHcBaidXOQHVCNj
	 yvlao8C1h9i8eXbm5d85mR7oKgWMro7FmfG1eOmdJOIfE7ZLEpjGoYud7Kw+LQcFkZ
	 fsXyLAICA29cPBJ3kog63mVFNfjeFSFYLzkA6YkFMUMPZVtwQ3It3vhSoSk5C/naVX
	 zijUws5wxYfSQA7CA9gtpjcOWE+nQBm/wFi2Cp+RFEoDAHVizP/CaWypHXIuUHSxoz
	 hTRF71P/8Kn7wk9kbLV8iYSVcEfOQpURteAxWzh4o8P9KIw7iIW9FWNK8uhoRBSNxB
	 YMzUaBMpb1nHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33EE739EFBBB;
	Tue, 28 Oct 2025 21:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: MAINTAINERS: Add Bartosz Golaszewski as
 Qualcomm hci_qca maintainer
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176168700894.2391991.2092450571253780212.git-patchwork-notify@kernel.org>
Date: Tue, 28 Oct 2025 21:30:08 +0000
References: <20251028155320.135347-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251028155320.135347-3-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: brgl@bgdev.pl, marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 28 Oct 2025 16:53:21 +0100 you wrote:
> There are no dedicated maintainers of Qualcomm hci_qca Bluetooth
> drivers, but there should be, because these are actively used on many
> old and new platforms.  Bartosz Golaszewski agreed to take care of this
> code.
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Marcel Holtmann <marcel@holtmann.org>
> Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
> Link: https://lore.kernel.org/r/CAMRc=MdqAATOcDPhd=u0vOb8nLxSRd7N8rLGLO8F5Ywq3+=JCw@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: MAINTAINERS: Add Bartosz Golaszewski as Qualcomm hci_qca maintainer
    https://git.kernel.org/bluetooth/bluetooth-next/c/91a22e93e960

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



