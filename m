Return-Path: <linux-arm-msm+bounces-74262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F757B8BD86
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 04:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6542E566AD2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 02:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9EE1F463C;
	Sat, 20 Sep 2025 02:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPeHtY/t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6401A9F84;
	Sat, 20 Sep 2025 02:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758335976; cv=none; b=gvgaVwdfs43xMclL4arSOo4Mo3QQHW5AFYEfotgdn7FgIJKKggPuFl9NqH29hhQFOmyEnzOYUoRDZNbOjmRROwdRykKR7+CONAiNiP3q+M5ZjiL+CqHzVkm6CWOgJDG9mnx0YF4tY3bNbfLXROaod2WDh0tyFz87ESow4O76b9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758335976; c=relaxed/simple;
	bh=k/FTCnl96MXSP+fDHycI6rpSXi1muA+ifuNnSEKRkhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B4pp9wUkyYwIzxX90sS1JEL4jJ24fDAeOO1HVQSwLtGw0ZWTrW1qPpTdVd2CaldPNCNim5um8kEdNVlo9UwYgTc39tOW4wLVp8r8t/Bl88FsZU1r/fi1vklM+baC0LLfTFg8J2yzDC6lS514F8hhoaQXCot0ZhcSqo60VaOM6fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPeHtY/t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52BDC4CEF0;
	Sat, 20 Sep 2025 02:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758335975;
	bh=k/FTCnl96MXSP+fDHycI6rpSXi1muA+ifuNnSEKRkhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QPeHtY/tD4wGBP0/ZK3YB1RP3Bi2fBiPf7JivsZ+2FOB/EC9+JwISbekDxnJAxira
	 r5XwSbsGF/N64TIvG30RNo1O3243IMNfoAYNu3GteqKIcEVh0kv2PnDfNbsRGBdGx4
	 yQwmk9hD6kYnnI741KbLX4OBVGHdrOTlK0CBs7J90Lu7KDpLdas28TYM6mY5f/qL3t
	 oUFARJi+xLD5zecIc3ZFPhofXrV0tk5Rm3vYt4mVODt7TTw1UyYmk9Jrr/2WRs2dZA
	 g93Ga9afg9G3C70VkZKne8xyfVIC64iu8ESTDyD8SLxrh1ZxTKYtzkVDnNOQ72oC16
	 hXZF/205IjXbw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/2] arm64: dts: qcom: Add support for 4 pixel streams
Date: Fri, 19 Sep 2025 21:39:33 -0500
Message-ID: <175833597012.494389.4056335450832869480.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916-dp_mst_bindings-v9-0-68c674b39d8e@oss.qualcomm.com>
References: <20250916-dp_mst_bindings-v9-0-68c674b39d8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 16 Sep 2025 20:18:27 +0300, Dmitry Baryshkov wrote:
> On some MSM chipsets, the display port controller is capable of supporting
> up to 4 streams.
> 
> To drive these additional streams, the pixel clocks for the corresponding
> stream needs to be enabled.
> 
> Fixup the documentation of some of the bindings to clarify exactly which
> stream they correspond to, then add the new bindings and device tree
> changes.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm6350: correct DP compatibility strings
      commit: f2983d8a1ea2812a4ccf6693dcd59118ac3f0a8e
[2/2] arm64: dts: qcom: Add MST pixel streams for displayport
      commit: 2f695d3eac36601d383155e3bba189f06a0f750c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

