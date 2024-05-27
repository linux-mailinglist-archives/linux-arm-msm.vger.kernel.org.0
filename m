Return-Path: <linux-arm-msm+bounces-20517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6CB8CF7DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D6FA1C20EC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA31A13C806;
	Mon, 27 May 2024 03:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFyZmlty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1596BE68;
	Mon, 27 May 2024 03:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778879; cv=none; b=NYC8LevXTli+Nx15liH8psvXw/XdxqgFUuyAmO+6EZHb5kA9IN0FRrlDyLBFbiuM0kVsLXe62bHnatJYMn6ejlI4wMF6oCJFQAvd6YM1LKN02mDx8zPfywxmvHE9fuFFrGULPrBVF9ZLqE2DGCTybhBTaIAEyqt0ZdYlXK5+4B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778879; c=relaxed/simple;
	bh=Ko2iTOSVF0h1jjDGpUxz3eccmnuaGnHYcO/Mfdr0SV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XtjehzvaNM+/bIKOmgDrrlNEDEAiWK2gfBpP+b22yu1PPeFh5nFxxvxIhkcIl5HYTC8oTB+ymcB6jm21Js9/mN4MkEqhMCIdJLxTnGBaZv+hSffcahHfVHeFYtl3Ft8MlytsOaSSTCtbpozaUXPvpUASpus7a69aOQpp4n8OiNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFyZmlty; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8861EC4AF08;
	Mon, 27 May 2024 03:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778879;
	bh=Ko2iTOSVF0h1jjDGpUxz3eccmnuaGnHYcO/Mfdr0SV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HFyZmltytOT1Um2dSBnMroScQwwHwo4CipJn/1GQ9NjxB3QfLXvJTj/iCyGDXw8hN
	 BMNd0MDgjfTOoQq4JVAtFwZsYxlcyybm6o14X46To+anRTX1F2nAXjPvWzjQyWKUrw
	 LRzNII1i5lvSiuYAIjYFmqcDkMjEDaiZTfv73AW24b0PQhpwvl+FuKU1R2yl+qnSgZ
	 sSDz/ismGbQyIc4wBX1oYSo+SAxYz5hRa9/IPT8GNw8pLYLHPIjBY4REZrrtBQgNDp
	 UGxkyNqEIhqCIcFkwcIeO8Q7/vO1coqtkI8TaWA8B8rhQb19xMrgE9ChBEeVTnOFup
	 deZNcLcOBxeiw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Raymond Hackley <raymondhackley@protonmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jakob Hauser <jahau@rocketmail.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-fortuna/rossa: Add connector for MUIC
Date: Sun, 26 May 2024 22:00:43 -0500
Message-ID: <171677884205.490947.1587497842071492135.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424144922.28189-1-raymondhackley@protonmail.com>
References: <20240424144922.28189-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Apr 2024 14:49:32 +0000, Raymond Hackley wrote:
> Add subnode usb_con: extcon for SM5502 / SM5504 MUIC, which will be used
> for RT5033 charger.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-samsung-fortuna/rossa: Add connector for MUIC
      commit: d81348c71028c6049e536799244f2518658b63c0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

