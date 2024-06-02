Return-Path: <linux-arm-msm+bounces-21386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3298D7394
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 05:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F31C41F22769
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 03:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C888E20B35;
	Sun,  2 Jun 2024 03:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTCodGpd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EE7208A1;
	Sun,  2 Jun 2024 03:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717300435; cv=none; b=O0+ZDIrFDeTJNRU4Sct5OPK4rnWCJ2nHEll8Cn0hh1zjneSqgcIxrFqSBTSCt+zjvRxmt8aSP4n4lx0ceABWS6Yt95RRaw/h61oJzNmNHJdntjkGtOFfENTj+KBxarSouD9pK7Qli4zGRYwwPxLs75S499KVPC4e+oGlOUPsCv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717300435; c=relaxed/simple;
	bh=oUSwG+Am0JsjdfOh2+lRQKB4VpVQz5v6V2MZpjHJAyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jWBQ2NKx1KDjcBUDZ0rCIKxMvYOnzaK9qlKwMKv1RupsRrS/EYKeEuP1dma3ADxy5LYRxqK1iWy2/0FxD5OPMQRwBOWvh++zbVgGDvij/HwA5P8pLgnKE/vpCzmd4PkB1Xn6XmzL4fMtYIHaQcP7gSImHHfGGg6zC6a0JI/EOR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTCodGpd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5728AC4AF0A;
	Sun,  2 Jun 2024 03:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717300435;
	bh=oUSwG+Am0JsjdfOh2+lRQKB4VpVQz5v6V2MZpjHJAyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gTCodGpdhM3m6/xJUwznyh784amDLblZxsIiEWoAn9fAFfkFhXVbBHaxkUMSNXHao
	 1/d2Xee4AYUHOdyb0DS9GWyerZaibHzYfRTLCAYIhvSVJoiZzZaMwRbhlz//F075Fa
	 4tp7AMcZv/Hmye/n2mcNslvo67DsosZvr+ByOJrI8U4V+hMH4sHRs7f/NPRovt2GO6
	 ktZwAxio2jPYy+f2xd3ZcQ6b4srL1ILPn7zCSrdAtpLzzbDNnfjM8W5CqHL00y1GVj
	 Y50b0ntWwp6BaIBSRHAvkvGCh9RTyiNSpd7EWeJR5HBk1qmLvkF9xpU2a3v6maJAuX
	 wfx6D0cVz4YFQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-hdk: remove redundant properties
Date: Sat,  1 Jun 2024 22:53:41 -0500
Message-ID: <171730042586.665897.8636814648753995668.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240530-sm8650-hdk-redundant-v1-1-c39c2ae65f3b@linaro.org>
References: <20240530-sm8650-hdk-redundant-v1-1-c39c2ae65f3b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 May 2024 11:31:56 +0300, Dmitry Baryshkov wrote:
> The coomits 65931e59e039 ("arm64: dts: qcom: sm8650: move USB graph to
> the SoC dtsi") and fbb22a182267 ("arm64: dts: qcom: sm8650: move PHY's
> orientation-switch to SoC dtsi") have moved some of the properties from
> the board DT files to the sm8650.dtsi. As the patch for sm8650 HDK
> predates those commits, it still had those properties inside.
> 
> Drop these duplicate proerties from the sm8650-hdk.dts.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650-hdk: remove redundant properties
      commit: cf2a08e149b28b4c8d9c63f84348f8d7fff0b5a7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

