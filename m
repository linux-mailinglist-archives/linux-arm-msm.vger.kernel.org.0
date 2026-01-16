Return-Path: <linux-arm-msm+bounces-89467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E350AD388A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 22:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A25330F88D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 21:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030B031195A;
	Fri, 16 Jan 2026 21:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyPcVqzM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07B43112B3;
	Fri, 16 Jan 2026 21:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599561; cv=none; b=cIvQUUJ9ZClH/KYbH9wmU/1fmYRJF1fGqfrXCS7OAyuGAiShz/6tmgccVPJecNdzROVaks2UZUej4lhAssTnFzD9qi2BgiG2N27MSQQgPXi6D8+2PbKQB4jpNgOgtsrYmRWcdeD2LWgTcNZX8ll6b08HUFNgpL4EzGe+0OkFMwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599561; c=relaxed/simple;
	bh=cZY76YlnwdfJOaZ8LeSnOWzi2DS3jnU6AY/wsJhkTmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GXwb1G3R9iXJ92Xop+GfX2pa+YC6dOUmBNr4HyeliwBbIfwupUN0zlf8OqM0XOx6PGDlU53om9OAfeEzp/YCfFvU8jz4cx+5YfCiTdJtyyeoPvaIUSUwgVTybhNps+lrkZGtj9Vy4qCgyylYOqoYEUlAja7kC83yVTs2mJATyHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyPcVqzM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A807C116C6;
	Fri, 16 Jan 2026 21:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768599561;
	bh=cZY76YlnwdfJOaZ8LeSnOWzi2DS3jnU6AY/wsJhkTmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lyPcVqzM6uV8UVus8CnUvyJMI/mmJ7weQ2RhGukFOrt+ZIlAi9yCQENQSGlPuCeuJ
	 CG/VbczbuCRF+Eg8lHnc0F+eGLddukEFhv47UIV4x8EJT6UPSQMTkkzIOiwnkDV+rw
	 s+y4hQtDnrH9cTDHLwAoLImXYAzT6yAoxKeXqQEs/YemRIdrY/AEeSjwez5SM6eNFv
	 gFL3AsQkALOaXZJQrcQEH6060bvyAAtZyKGNrF+LLWuKPfPggkdrsbMgeljE17y5SQ
	 d3VFCMsRXJXR0syf5cmdHBRQXFY8VHJ5qYTA4a541LDkRoirg7v2YJW0vFX2MvSwDO
	 3KjkyT6/t5BWw==
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Xilin Wu <sophon@radxa.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: (subset) [PATCH v7 0/3] arm64: qcom: x1e78100-lenovo-thinkpad-t14s: add support for HDMI output
Date: Fri, 16 Jan 2026 15:39:12 -0600
Message-ID: <176859948746.425550.6113900486040899869.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119-topic-x1e80100-hdmi-v7-0-2bee0e66cc1b@linaro.org>
References: <20251119-topic-x1e80100-hdmi-v7-0-2bee0e66cc1b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Nov 2025 09:45:39 +0100, Neil Armstrong wrote:
> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
> connected to the third QMP Combo PHY 4 lanes.
> 
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 1/2 DP + 2 USB3
> - 1/2/4 DP
> - 2 USB3
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: add HDMI nodes
      commit: a1338b39c14ddf50b841e891833786037dec6de4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

