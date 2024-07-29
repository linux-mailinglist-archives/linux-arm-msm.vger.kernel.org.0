Return-Path: <linux-arm-msm+bounces-27165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B3E93EC19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 05:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ED751F21E5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 03:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E3484A3E;
	Mon, 29 Jul 2024 03:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjoqFBFU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB968405D;
	Mon, 29 Jul 2024 03:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225523; cv=none; b=i1JMS1KY8Yph9yohu2I4mAeB87/QbINp3y9yrvxRxLgvR0VqeF/CKeRcdA8S/kDc8wlwixlrgF7sLHXXSEAKP0rT2XuBMgXVq1Kt/ge8w/B7ivPWipH1n2TAB+uPOdg+v51XNsoyUsMpq0AeLPHEB4iud+89Yc3+DHrcql/+MOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225523; c=relaxed/simple;
	bh=LmVqQmuz9xZZcRUniQRMKVTeGtz3bp9z68kpBWoskVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O5oltAohDjJzZBzmM4H4PV7T6S4yVzyYUEIGtvDSQe9gxm9dseAvpjoy5Gonxyav7AKcgOO7YCzygl1Tj1pDD22KCdB102AtIX2hl/Vr1Hdm70Pr0DhdeKvLlwRlsyoHvL3qBqa+OxlpQnBSG8Ln7S4Ou3EizJHOxeneK020GTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjoqFBFU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C11C4AF0F;
	Mon, 29 Jul 2024 03:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225522;
	bh=LmVqQmuz9xZZcRUniQRMKVTeGtz3bp9z68kpBWoskVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EjoqFBFUUhrGqyEse2AQ0xsVvTxjp0gdne4Cjoo2GA6sinUyMhuGK9+55lya1Ymbz
	 JEB8sfEQFI+tr7G8lTdWbjbYxAl24fc1OSsvIiwwtVqIpsULFf0B2ryW6IPCPxexNp
	 PlMWIcgdTzo3Dxrwutn/iNCm4FSr6IFXvff9x7IUqEcIOdCVAxZcaUMjfhukCp87sT
	 8y3Ds0p74jUpQhYAKaUQefVas0oEbW6hZF87ROHe6DVPK5qjrmo8rFK3rP9vJYQktZ
	 hRgWuYjPA8Vl1lQ2uKmj21EKmpnxzQmoe5PaSFJDYd6WqCVtqULtJ1ImF06s2b4X2+
	 cvURMqo6LK81w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?St=C3=A9phane=20Martins?= <stemartins@proton.me>
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-longcheer-l8910: Add rear flash
Date: Sun, 28 Jul 2024 22:58:09 -0500
Message-ID: <172222551323.175430.4176360480927663011.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722-x5_sy7802-v1-1-b2ffeeaf8d2d@apitzsch.eu>
References: <20240722-x5_sy7802-v1-1-b2ffeeaf8d2d@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 22 Jul 2024 22:05:01 +0200, André Apitzsch wrote:
> The phone has a Silergy SY7802 flash LED controller.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-longcheer-l8910: Add rear flash
      commit: 7a373bbc1b50de75572b00063b52ac79eaeb9701

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

