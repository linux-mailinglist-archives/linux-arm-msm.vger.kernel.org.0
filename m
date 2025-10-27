Return-Path: <linux-arm-msm+bounces-79052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 29785C11C9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C8F70353998
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7003431F2;
	Mon, 27 Oct 2025 22:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQsYu9v+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D733451A6;
	Mon, 27 Oct 2025 22:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604519; cv=none; b=Okzuk62HnNrby1WQH5f9ATzG6WLYX8lBt4zXtf9cu517JtBoVVaytS36jzznnkIlUryGF2pct6piOrtdpTpi1qtPdGbJXTqjM6x8Trqag+zN8q6pEdFLzp2IpLW2EPJftb9/IAZftY1DkRB/bV4UVZwg/+dHI/oqzAL+K1Ms1eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604519; c=relaxed/simple;
	bh=8Ux6dLKKSo7BQ5FREqNLGDxDgTAqQi1BXdn9NHgKCdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X2Rqg91kPxRKr++CEtDDfQd0E0vrxwCDt/uqY4s9mpfFQaMatrDn/uVAHle/PcL/HjtnFwf8kK0qPraIGe22c9hP9M5D4LJY2DxRDFyegmvZnjkGSSaoMlkS8aAAnl0MuHs5DQwXmJYlFlB9/MNzrL9paofEkkoomlyt0h9nL8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQsYu9v+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574D4C116B1;
	Mon, 27 Oct 2025 22:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604519;
	bh=8Ux6dLKKSo7BQ5FREqNLGDxDgTAqQi1BXdn9NHgKCdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LQsYu9v+73bTmT1qZ7uPb+9juHwzNgz0+CT6nAKH8bvcnckzO2jCcE+gBZXN5y+TO
	 nopBGF95dGNMaDwWj6L1RBELG4VygfGYtmdYUw5O6e1FHDCFGFR33FhnZVRyfNEQ5X
	 bR9lkEtbDfEbNYcryrzNDigG5LNSgD0Y86FU3/TQ4rOmivjWv6/p0ynTBK8ST23pNo
	 rZbhiHoyp2R4+kJ7S/Ci9O+lTlPm0mNQE0tDtvCsc3W7misgNm1P6WJ1WtbhIJI/cB
	 807RZInA2Piq+WlnMVDTPp9Vd78CnHMu/Ymdc/3zcZ2ilfiPjpYaygEtQcEQSncZnW
	 FbUYv74ZtdupA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] arm64: dts: qcom: sm8250: Add MDSS_CORE reset to mdss
Date: Mon, 27 Oct 2025 17:37:12 -0500
Message-ID: <176160465204.73268.15670908839852013774.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930-sm8250-mdss-reset-v1-1-a64522d91f12@fairphone.com>
References: <20250930-sm8250-mdss-reset-v1-1-a64522d91f12@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Sep 2025 09:37:22 +0200, Luca Weiss wrote:
> Like on other platforms, if the OS does not support recovering the state
> left by the bootloader it needs access to MDSS_CORE, so that it can
> clear the MDSS configuration. Add a reference to the relevant reset.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250: Add MDSS_CORE reset to mdss
      commit: 8b4faf419d601cead68d7821618369e2c0338b86

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

