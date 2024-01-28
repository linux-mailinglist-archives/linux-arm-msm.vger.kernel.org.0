Return-Path: <linux-arm-msm+bounces-8706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CE483F8A0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 18:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ECA81C21B1A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 17:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7CD37166;
	Sun, 28 Jan 2024 17:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJdWUUtJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163B0341BE;
	Sun, 28 Jan 2024 17:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706463963; cv=none; b=VM1QFaPBBSG4JXGuzfP+g+SQkzh3sZcfaAWXR9xsRCXfzGSg4YazjIN2Q9ZBCVvf1wA+vHXdbBbMKmxFbX6lh9q5Cc3J4I8XLanHNxB0U0JWqAJRvobDcu/OMmngygy0f2hOilzAuUW92HmbFFXHw/bFTJJ882jTo9ZlvuQDUcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706463963; c=relaxed/simple;
	bh=sIO3wHHo39yAt+Sx4SEMSlpQbOV/aWbYQX9jy+xoqSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bg6xRJS2FCn6qlB3093J15FLMazlavVEClM9bs+eZrTNyr6PYoHM3Jn+GqbIPwPdMbMMlFpt8Ky3U4cOyqMz4ycLKjpuKpH6QR7joK/poeZgxsreNqFEKDT+BjY1NOOK3cm8dPx8x6NdCwVVI6S8OIgdS6VH+iU78uU27jHkqhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJdWUUtJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2BBC433F1;
	Sun, 28 Jan 2024 17:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706463962;
	bh=sIO3wHHo39yAt+Sx4SEMSlpQbOV/aWbYQX9jy+xoqSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jJdWUUtJCzaGZXb64/lhGNvJxUJg79qynYhztyDX7X/mWwacnn/J9hTegrVUA7Ni4
	 GOztKYiG1JEGoo/zTHd67395Q+w8+pEmy0c3ssxe2Wmtf69lCcb02KlFLi02cb3dwU
	 0Z+30eD57wngdWDI4bYmklWERQCf2wTOP0WTkPZJPo5gjvufITLCH5dCOkCNK9XlZU
	 BS9WbP4Kr4X5txyy8RivxuQsoO1H0cWvYJq2VGMb0QUqKFB2ZSedGpzTe/nES3wZjC
	 vh3Ig6AdoWSwd4WQd8AerkrJRy6dOQMkgUPw5m64cM8jB8u1Lr6UoIvxQyOchbQReT
	 zze27KmWTIwLg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	cros-qcom-dts-watchers@chromium.org,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] Fairphone 5 PMIC-GLINK support (USB-C, charger, fuel gauge)
Date: Sun, 28 Jan 2024 11:45:45 -0600
Message-ID: <170646395045.64610.4594577290385724212.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220-fp5-pmic-glink-v1-0-2a1f8e3c661c@fairphone.com>
References: <20231220-fp5-pmic-glink-v1-0-2a1f8e3c661c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 20 Dec 2023 11:02:55 +0100, Luca Weiss wrote:
> This series adds all the necessary bits to enable USB-C role switching,
> charger and fuel gauge (all via pmic-glink) on Fairphone 5.
> 
> One thing that could be made different is the pmic-glink compatible.
> I've chosen to use qcm6490 compatible for it and not sc7280 since
> there's plenty of firmware variety on sc7280-based platforms and they
> might require different quirks in the future, so limit this PDOS quirk
> to just qcm6490 for now.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add PMIC GLINK
      commit: 4cc920ed7899de91ea39b6c9bdb0ebb6860e8b47

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

