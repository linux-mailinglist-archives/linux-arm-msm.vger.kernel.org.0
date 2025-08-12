Return-Path: <linux-arm-msm+bounces-68638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EDBB21BFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 06:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 646AA7A2A9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 04:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA232DEA74;
	Tue, 12 Aug 2025 04:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKTVYyRp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B632DE1FA;
	Tue, 12 Aug 2025 04:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754971420; cv=none; b=fQ/9JGr0B6vXEQGj5vXIbSW/FQWLXRLvXhV7aywYMO8koTsBQacvKaqwf1eCjW8Jqfb2Ff7gWkzA20s+lGs7tGjzkvtrIeAZ2uXgkL5vgGbeF5aWaJ+Fw2+pkyaniJ/nFEvDrKSrGzTebfSVi/sLgzrX66s1l7FbPhZK6B8NQJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754971420; c=relaxed/simple;
	bh=XcUN90SIX6F+Zc2KwnFda0c/JQ1wv7pJe7Dj45S2Y6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SIjYtnIU1UtsPsbHF97pQcEsfquxe7gJtbj5lvxe+OmNUpiGCF67gPOYQv98SPHpoj2g+PISROD7Qbh3nFy0UO5mRKM97RBZawsHy07funI8jKuG+9yw/wRmGCNqcBS8Do2Sc3qAWEuksXA3ynJ89vcG5pCeCzFUxNSwiMfELkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKTVYyRp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E72C4CEF7;
	Tue, 12 Aug 2025 04:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754971419;
	bh=XcUN90SIX6F+Zc2KwnFda0c/JQ1wv7pJe7Dj45S2Y6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZKTVYyRpG479K8a1tLBiW3FE6rGJILzVcoT0qUh1YSP2DNmnZH7cJ4k6p5Eth0y0r
	 SFLT8eWH8/KYNUmETCiLX7gNE+O91LWrUvDiN0RkIQ9OyfZDLK+h+4fLGWrQr/lhqn
	 i+6xRF1L2zU0ja+55iNb2av14d+bneWO03jVn1E5JIC4P49hILFisesNRrfNXRzIjO
	 vv51BII/9myYaKlNHMHcjB0mt4sVV69jodKsXvdc0sswXY8zC3bly2Bpb/Ka/nF8bn
	 JaARd49KBc3k0DzOGjh5T/r46vyzVU2E5B1gwknpxyNnibMYsadH5rwAMuEyZ4YIQl
	 P2QKVwDg4zEow==
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
Subject: Re: [PATCH 0/5] arm64: dts: qcom: add empty eDP endpoints to the SoC DTSI files
Date: Mon, 11 Aug 2025 23:03:36 -0500
Message-ID: <175497141341.170566.10974575943237439276.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724-move-edp-endpoints-v1-0-6ca569812838@oss.qualcomm.com>
References: <20250724-move-edp-endpoints-v1-0-6ca569812838@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Jul 2025 15:23:38 +0300, Dmitry Baryshkov wrote:
> Follow the example of other DP controllers and also eDP controller on
> SC7280 and add missing mdss*_dp*_out endpoint declaration to the SoC
> DTSI. This slightly reduces the boilerplate in the platform DT files and
> also reduces the difference between DP and eDP controllers.
> 
> While we are at it, also clean up remaining data-lanes and supplies
> leftovers.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: sc8180x: add empty mdss_edp_out endpoint
      commit: 45cca0f3c8208d210751ec91edf778a18336df88
[2/5] arm64: dts: qcom: sc8280xp: add empty mdss*_dp*_out endpoints
      commit: caaba55bb751133433c1b0806f5ce6b88359f0f7
[3/5] arm64: dts: qcom: x1e80100: add empty mdss_dp3_out endpoint
      commit: 91329efd132bf58aaecb33c07a4e566d9e95ff71
[4/5] arm64: dts: qcom: move data-lanes to the DP-out endpoint
      commit: c361adf09dfc77c62da4c0d548a8c8d50eb9c71d
[5/5] arm64: dts: qcom: sc7180-acer-aspire1: drop deprecated DP supplies
      commit: afde4d8ea536964b7b7fe83cc6736e28475b6135

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

