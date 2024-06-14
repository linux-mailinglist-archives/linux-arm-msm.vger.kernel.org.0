Return-Path: <linux-arm-msm+bounces-22759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AB7909455
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 00:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6E42283F6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 22:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F05118FC88;
	Fri, 14 Jun 2024 22:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYyaczLY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BE518FC80;
	Fri, 14 Jun 2024 22:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718405348; cv=none; b=t+RRAcNmVb9u5KZopBW8mVQzvWoGd2k+ZRkgWuHMaSQLdFzsQU7EO1EEIwMsDvBmvh2sCk6rzVIlwahdoX5c7YoSx5Ziv7Nu7uxCj2OVxXZnWMWMcRTBb6ZSqIS6JdOUYzCpMUWd8nqqFguRL0FA8RE5ijsb/neG+jre0EQbz9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718405348; c=relaxed/simple;
	bh=i9mKO1Ky+GnT89l1nKu+HCJqwmbV8hQ6PWi+/4aX6bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4Scf3xbkT6I4A2LkYyKLCxs+u0128XLsrzc6sAQ08IIgTtspnF+Y9Mx5XDTZZxZfmPafPtU8VKBDHK6sQXx2zeGf3K4YzJk7w3KrqfWHNw/aGIeR2G/LvxsPERQmRZAEpfbbasLgl2LZCKnkQaX1BC4BFWo9xo1vRPG2FBzHjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYyaczLY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50546C3277B;
	Fri, 14 Jun 2024 22:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718405347;
	bh=i9mKO1Ky+GnT89l1nKu+HCJqwmbV8hQ6PWi+/4aX6bk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fYyaczLYon7c77HUJr3iJhqz37cwLp1tblnt1HhhisR5B1i4K8AWSVK/lyWcTTkrP
	 eNubGfO/szDk1CNaNqZrJ6aYLjwkd9Ef/43OBZ4+DtgNtzEDUzUsDwfGhj6UYIawM7
	 dpmjigqjn9GEQnlsRmdLR6lTeONnV/sXC/zRYbfyL/8CSOsrH1E3F3q963fDw+S52B
	 pzKPgWOhcRZKygyCIniZ1MaeKxoecb1r0d8PZj6YuwDOWHz42uvn5JgCXY/OMm1YGO
	 mRXBF/bWea36uJzwIzZ9OBmcj5hX5yn0xCGsuXwL7CqMT45PMva7g4IrWzVOcREbG3
	 W76P/XVUP/u0A==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Raymond Hackley <raymondhackley@protonmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-acer-a1-724: Add sound and modem
Date: Fri, 14 Jun 2024 17:48:55 -0500
Message-ID: <171840533355.102487.9243196311938042326.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240609100243.834169-1-raymondhackley@protonmail.com>
References: <20240609100243.834169-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 09 Jun 2024 10:02:45 +0000, Raymond Hackley wrote:
> Enable sound and modem for Acer Iconia Talk S A1-724.
> The setup is similar to most MSM8916 devices, i.e.:
> 
> - QDSP6 audio
> - Earpiece/headphones/microphones via digital/analog codec in
>   MSM8916/PM8916
> - WWAN Internet via BAM-DMUX
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-acer-a1-724: Add sound and modem
      commit: f55a758fd355c1b5ed7c73434a99ae07d5741226

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

