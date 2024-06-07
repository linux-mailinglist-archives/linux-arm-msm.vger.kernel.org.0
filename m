Return-Path: <linux-arm-msm+bounces-22008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A8C8FFA01
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 04:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAA2F2868B5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 02:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313171C6A0;
	Fri,  7 Jun 2024 02:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPDCDfuA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0188B1BF3B;
	Fri,  7 Jun 2024 02:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717727646; cv=none; b=Q6FSCORU/N/jGlkj2InqxwY5XaqPkxXtPeXOrqNhMDKIr3wojeX+PswpyFvjaqyMf7ppEfj1PTJ/NfF85+PF/2WImhT/9ZFxE39idPdlx3FJP/eHU4G4UjlzH/ubQi2xqaci8Ps4CWypj4XI2PNkEz88A/7mAZg7/LPuBqEO+RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717727646; c=relaxed/simple;
	bh=ET3BRs4nWWGzBVLodLJZyXl/ZkgOXc6QzAUfUZK42L4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T2gt33i4yFh7Kjw5t6ER3okdtlcB3GM0xZ9tE+5I7tdrMSZjAG0rjhJ86D7RpVuh2BedgSIl22qLSRhtd3+lZy4LWxUiD9s0bQel2TfcIHj71voT84QIeeRZVvy1/hyQ7BlMJxHq6+QAGRhjvB4sXSx25gBTd0NUECJXlTvkAIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPDCDfuA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97088C32786;
	Fri,  7 Jun 2024 02:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717727645;
	bh=ET3BRs4nWWGzBVLodLJZyXl/ZkgOXc6QzAUfUZK42L4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FPDCDfuAVV+IozIEHf1gX3i5u33zqOOm7qP1Whf1CzNoBWj3itmIwh2JshyFUzx9r
	 W9bh3DL3kYrMgyB1Yj+748Epgc/8xkY8tQlwhe+3jcWBRWdkxBEHE1jrjj+dO56dIF
	 OGs6ZUnilzkSxsTQFsNby2IM0VgGRsGd7qPYO2B0oKu3dFxw9dZWpEtZVxcEmS4kXA
	 Yityo4ls/cD/8CGzZ+0IY/KX2Wp4LCnkZQhuY2NJ8wkUzkG8TSl4OGkqGmwBKfgXTA
	 QCIrhpyNCbd91x4bel4wVVbMa1zvPH5iKcPM/NiKVeLbbblfq/xxE8A3sRgonfAJ1d
	 tYXYlTk2NWgpg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	cros-qcom-dts-watchers@chromium.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sc7180-trogdor: clamshell/detachable fragments
Date: Thu,  6 Jun 2024 21:33:59 -0500
Message-ID: <171772763760.789432.7815963903812964889.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240604214233.3551692-1-swboyd@chromium.org>
References: <20240604214233.3551692-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 04 Jun 2024 14:42:29 -0700, Stephen Boyd wrote:
> This is a followup to a series I sent a few months ago[1]. I've split out
> the dts patches and dropped the one that ties everything together for
> DP/USB as that whole solution is still working it's way through and I
> doubt I'll be able to get that done in the next couple weeks. Instead,
> I'm sending these patches to reduce the patch stack and make that DP
> series more manageable.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sc7180: quackingstick: Disable instead of delete usb_c1
      commit: 13f1e1245bb51633d6d1a398fedab7c281beafc3
[2/3] arm64: dts: qcom: sc7180: pazquel: Add missing comment header
      commit: 5abfd513988248b5d27f3a72d71a33129dfb1054
[3/3] arm64: dts: qcom: sc7180-trogdor: Make clamshell/detachable fragments
      commit: 38b68e62c0d662d8a23aa47799b4ac83c54a8de8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

