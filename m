Return-Path: <linux-arm-msm+bounces-22009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A52648FFA05
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 04:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C40F1F23801
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 02:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53612869A;
	Fri,  7 Jun 2024 02:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAJaZAp2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB07A225AE;
	Fri,  7 Jun 2024 02:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717727646; cv=none; b=Nl7M1kOtRuP75QmhsOWM62XBg2517yq+9weY9+9go0vNq3ed2e+peltBEGrON06/+sv5HBntbejfo9i7XfAiQiSVfJiJdgtRs9Ko8oZ8nuvxn7Xiwx3MlJ2MtiV+1LkUiVnIb9vHwmGqM6kV2/kSpS0nyedEnkYXvjYWtR0Y/4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717727646; c=relaxed/simple;
	bh=GtcydzMI52lqrpxZAkUIBdlbrp6IcPVsrQ6V3FuwH90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jLp+7vTfGVhC1UELQwapSbzip+ola+aHgyx2gV82Z+1fnwfaK+9uNpUTsOmBGvft69ym6B4tc7C28TxGp692U1pwuzZVhXsOZfaP5UrN5TsvFp2vk3TOtlzOj8d0zaEejip7LGKQdnLN7duG4EI4y+FTwrowJcUvkEnVgDaGRvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAJaZAp2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2ECDC4AF0A;
	Fri,  7 Jun 2024 02:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717727646;
	bh=GtcydzMI52lqrpxZAkUIBdlbrp6IcPVsrQ6V3FuwH90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SAJaZAp2n4lPatV6FY+vqBZOH433lEa5yc408IWPYwVtzqRE3KIlyr4FBMFe68RLy
	 K3Rffzo+rYu2vFi3x7z2n6YG/0/nLZIEq6SCQWZuyfNGA6DIjQwHaCYEOMBgry06ZK
	 vQqROlEBYkVc5fpElTFbBYH9KrOYzQ3bxMhnLkbcDwOnr4rVHfIMhD50/mFVQJtQg/
	 fKHOgaoQUbnKbcprBKfz1vGWxBnA4WIGIoCyHV5J21bWuisVzZZOEKCWRTykCTO/GI
	 MQRN5HFfKbN7I/DTOuB9DnZXPfcXy6TbQgCIyUHqlXQGVfwqYNvS86+e+Rbksd94Da
	 R9yCuM/dLvh0Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aboothahir U <aboothahirpkd@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: pm660: Add rradc, charger
Date: Thu,  6 Jun 2024 21:34:00 -0500
Message-ID: <171772763756.789432.15044754751485044337.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240606-pm660-charger-rrdac-v1-1-a95d4da24f3b@gmail.com>
References: <20240606-pm660-charger-rrdac-v1-1-a95d4da24f3b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Jun 2024 16:47:28 +0200, Barnabás Czémán wrote:
> Add charger to PM660 PMIC. Readings from round-robin ADC
> are needed for charger to function, so add it as well.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: pm660: Add rradc, charger
      commit: 0354ab18ef5ef11f3139c7252f573c5d4af87c60

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

