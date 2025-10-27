Return-Path: <linux-arm-msm+bounces-79063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 507F5C11D40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D494D1A22092
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C48D34B408;
	Mon, 27 Oct 2025 22:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNmH8h93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124C134B1BB;
	Mon, 27 Oct 2025 22:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604531; cv=none; b=lZkMdZ8Dt2DSJP6OcNvIvgfujq22MBYtJQxwZLvhjZEDgurVEDkWntX+u0bAdDLKOfuL8Ju55QkFiwOKReudGbUvuKTzEg4GZJeR8v+aP7JrvhHmKoYVtar0l6yB4R6ECilGPLa2en9R68N6KafuwNO8HgKb4sQN7qW9loYMZXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604531; c=relaxed/simple;
	bh=gf9iB7rjuKFnti/sQeX6uoMja3ILBa/o6HB/Y58ZfW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vzybwzytiusbt0yfEhpzyqwfY3mJ1OqrK/VlL6/bE4lVuziHRMqaOi982YazQiRF0vYIbn9CTA3VC1JLw+aYy/uyW9DsSAYy721yU7v2Jos1K+j8dF+MWwD+WGiIQihTxM509S0kiY/Mhnl1BISd9MhmjaqkHCmekoZhbna31sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNmH8h93; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0207C4CEFB;
	Mon, 27 Oct 2025 22:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604530;
	bh=gf9iB7rjuKFnti/sQeX6uoMja3ILBa/o6HB/Y58ZfW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KNmH8h93UtOSQzArR0uQmVfIy5M/cs+nX3NjGM1ewsOxZ87BUCwKk6IExX/wHIoQC
	 YKV7H2QQtz9r0EFsfKucvAJz76I6T44vvRNxIoif39y4cKZJ4Q0CwhilAJopbW+yDY
	 kAMtd/V3WpnYqGqmq5ZVnfb5biGcZXq1DVikVrOwy0WPN6f0HWSjPXXSc98QOGZjd9
	 fMiuGkhz/hkxU5SxmICxdb/oDAmJ3UE+nJKyRj49FaXNG9JMO6p4ByG+DoLPLgVo12
	 qKcO/iQIVwRSS5y4L7mi6APLTJgbPcyeB/v87H+q7KLdCQo/bdY1xAILYss8yxoAIv
	 0H0rfuWxhpx0w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon Q6A
Date: Mon, 27 Oct 2025 17:37:23 -0500
Message-ID: <176160465203.73268.1417721719455303293.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929-radxa-dragon-q6a-v5-0-aa96ffc352f8@radxa.com>
References: <20250929-radxa-dragon-q6a-v5-0-aa96ffc352f8@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Sep 2025 14:46:40 +0800, Xilin Wu wrote:
> Radxa Dragon Q6A (https://docs.radxa.com/en/dragon/q6a) is a single board
> computer, based on the Qualcomm QCS6490 platform.
> 
> The board ships with a modified version of the Qualcomm Linux boot
> firmware, which is stored on the onboard SPI NOR flash. This allows
> booting standard EFI-based bootloaders from SD/eMMC/USB/UFS/NVMe. It
> supports replaceable UFS 3.1/eMMC modules for easy user upgrades.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add Radxa Dragon Q6A
      commit: 8388ebac980201382941600d4d9a2dc0bc1c9db4
[2/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon Q6A
      commit: ef254b12ec60c2672c18dbf423bd16476a7fb62e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

