Return-Path: <linux-arm-msm+bounces-3085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E59E8020AE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40E881C20845
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0101217FD;
	Sun,  3 Dec 2023 04:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhd5nNqW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D006F15CC;
	Sun,  3 Dec 2023 04:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B21C433C7;
	Sun,  3 Dec 2023 04:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579101;
	bh=S0yq8trChhQB2QxtIfpHYOXLs2J2fS+sqWGhqbXRkuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jhd5nNqWV4U1XmA1QMb2m+SmDA38x6TgCz5gTaUz/pWG+WHhRFjK5p96Yq46v/lMx
	 cyX/GPDCrT3SW4HOL7hhiWBXzHQ8/8XEq7xNiX+1x5aKwATEPkFd4/8gPnNniCv6i2
	 wL1bNgXnJ55HrenTRcdbf2kMIObZu7OM8nuSKuw2oLLa1lJ0wNMvdEswa3sSPDeRDq
	 nS2O6jrRPttLUjr44sHmZQYaWivlW8+OT/cEnLPfO5QDVdy4ZO5Jts76FfXloVsiCQ
	 mYeGhIXQOVflTYElk0vr7e140HUWH2+XzqRuCNQys83Vt6F3bC/JVqXbwGG0Zb675d
	 BCRIV+pqZ4teg==
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-crd: fix eDP phy compatible
Date: Sat,  2 Dec 2023 20:54:32 -0800
Message-ID: <170157925833.1717511.5166881247887847999.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016080658.6667-1-johan+linaro@kernel.org>
References: <20231016080658.6667-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 16 Oct 2023 10:06:58 +0200, Johan Hovold wrote:
> The sc8280xp Display Port PHYs can be used in either DP or eDP mode and
> this is configured using the devicetree compatible string which defaults
> to DP mode in the SoC dtsi.
> 
> Override the default compatible string for the CRD eDP PHY node so that
> the eDP settings are used.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp-crd: fix eDP phy compatible
      commit: 663affdb12b3e26c77d103327cf27de720c8117e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

