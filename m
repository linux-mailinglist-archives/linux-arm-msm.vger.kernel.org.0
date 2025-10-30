Return-Path: <linux-arm-msm+bounces-79755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAC6C21CFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C99D61A62861
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A6036CA95;
	Thu, 30 Oct 2025 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTsLzGoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431453644B1;
	Thu, 30 Oct 2025 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761849819; cv=none; b=gv0iYwjJjwNKwDNHziMPDXHezJ6DLDT/J44u6KiPOmsd35pTEslelTmDxhoZ3u4cc4SrAP+SMcbs/KgbNbUjqinGX57PzTyuSfGD4kcBIMOTMRRo/GGLocHd8GSdbhr2IvTL15f38MjnNU5dlQhqHixGbCCzTEwR5fewKXB1Hiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761849819; c=relaxed/simple;
	bh=4IKj5E9abqrJecDQCcjIqlBIeXr8vDnE3i2n4ayL0Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CZosfYoOSvZyb+YfOIV6k6wO2d7XU+qy1OGm0+myuo99UzwzY53jQye1pxIorOQf3Kfze+HQ7MUkgegzEUW037RYhY7Fmn4nJG8P/20BSDWfhHp/01wUzsvhJNPjj7BuU1qkCdvdfR712g63YafUQy+gX05hJQMr9pl3GYhJTis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTsLzGoZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA81C4CEF1;
	Thu, 30 Oct 2025 18:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761849818;
	bh=4IKj5E9abqrJecDQCcjIqlBIeXr8vDnE3i2n4ayL0Q4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bTsLzGoZ+g8TACjbSXRFBkm6SsVUDEV5MKNdiiG0le+7cv2+3Exey3M5wfdCkDQrw
	 dJLncoaqEmCzhEsk0VKIQxo9/brRfW0bQKEhiWk4kkvLbjLsc/FwSz11dB7oGlbM8L
	 LrnGhJv83IVHv5wkyd3NGjhCdRYmnZXmz0wf9Rkd6o82HiGGZvhhV0Fuo9/U1cqa6s
	 9Xn8v8Qgun96sIVsSsDSnw0ayuBm0PYMFwubChbQ3BhM+l287mVfdmo4hYW6v3934j
	 +i3t2CaPVMzhD8dAkb9Y2Hs0orz5Kf3oyQk4CdMoYCxjWChRqXvK1gJBJHB0lJDIMZ
	 2yCx1ldgQ3U9Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: cleanup GPU's zap-shader node
Date: Thu, 30 Oct 2025 13:46:46 -0500
Message-ID: <176185000295.492730.10106519443122331720.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Oct 2025 22:59:59 +0200, Dmitry Baryshkov wrote:
> Historically all devices manually defined GPU zap-shader node in their
> board DT files. This practice is frowned upon. Add the zap-shader node
> on all platforms, define a label for it and use the label in order to
> patch the node with the firmware name.
> 
> 

Applied, thanks!

[1/7] arm64: dts: qcom: sdm670: create common zap-shader node
      commit: f85592223d5bf983b6c495f33cfa0344a9930d5b
[2/7] arm64: dts: qcom: sdm845: create common zap-shader node
      commit: 8464b804bd35cf4068e3a7cd19163c0f8a063852
[3/7] arm64: dts: qcom: sc8180x: create common zap-shader node
      commit: e3f81bdd46dc4120e9ee373aa8794b84c7dfd2f1
[4/7] arm64: dts: qcom: sc8280xp: create common zap-shader node
      commit: 6e9612ced0c90fc19d9b27508f84ebcf5718b8a2
[5/7] arm64: dts: qcom: sm8250: drop duplicate memory-region defs
      commit: 00d3f7b0536dec3b5660e25d0767f61ee38941a7
[6/7] arm64: dts: qcom: sc7180: add gpu_zap_shader label
      commit: d994ae0427a83087bedcfbb8afabe620529ef594
[7/7] arm64: dts: qcom: add gpu_zap_shader label
      commit: 2377626fd216ebdf17294ac0cabc27614fff07d1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

