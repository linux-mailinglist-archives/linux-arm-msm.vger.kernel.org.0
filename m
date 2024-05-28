Return-Path: <linux-arm-msm+bounces-20685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E628D12BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5145A1C211E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2555473443;
	Tue, 28 May 2024 03:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uxvCwmkC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3037317C;
	Tue, 28 May 2024 03:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867176; cv=none; b=lcYTkGoACfk6R4R5TC+vj4d/yIAtSwTfpTs2NxfKpo2RDNN+oxMYeiAJ3DAf1UNR+UuzBetVtCLIpg3EwBCNVcUkMpc0cOiFgpPzS+LyiAjpNrmUuMXjlotQOwmhuCyWdzFl3nwwYv8l/Ex2IY3d7+Jeru/kOTxCgqWvwUQ3254=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867176; c=relaxed/simple;
	bh=5nwP7OjLi2RGIh7MP14x2pmpSczG7BFG6j6QzJqIDdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UyVhJevTNVqXZORbrf6AA561OW8L9JEJbgARgr+uWdy+upiuCKH8ii2aOAoagdhdJzHXuZ4Yeudmlb3kdqL9kp4Bv9ycClpcNz9QYJwBrDC/PVTvImunatF9ec/NR7KMQ1spNknSCnjG+7p/8rBCMjVnVNB4Dn6XJmK211br93k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uxvCwmkC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A262C4AF0C;
	Tue, 28 May 2024 03:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867175;
	bh=5nwP7OjLi2RGIh7MP14x2pmpSczG7BFG6j6QzJqIDdw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uxvCwmkCFo2NyRxHJol1M0tpIBphvwEJkTa6tX+5zlF7gC4OUNX4wBITUlmiAuugl
	 M5lewK9+FqT1BZg7hYRyQsJsOYUNsbWyU8niNFTPs42Z3CZXPwkNWJZM1MYLU0Y204
	 npCOGEIQ99NJKcl0KQJM+D3Z+iDtWMTtOPVxoFfsqyu36lF1mTL2wDm33mkh1DmNFF
	 0IO/yQpj8FT5/rcoJoYmfebjDQJgl5KnboirxHkiQ1X2xsleT7b7H+niS9brXjAyxL
	 tF/93VGrj+jZG6oHWvzMm2q7Kud3L46+0wxcXfA5r45J/XMoFOrGO3kPlWZVmfg7ff
	 SLmpDKWd+XM/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Add basic APR sound support for SC7280 SoC
Date: Mon, 27 May 2024 22:32:18 -0500
Message-ID: <171686715157.523693.15335950403059672023.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510-sc7280-apr-v1-0-e9eabda05f85@fairphone.com>
References: <20240510-sc7280-apr-v1-0-e9eabda05f85@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 May 2024 14:27:07 +0200, Luca Weiss wrote:
> Validated on Fairphone 5 (QCM6490) smartphone by using DisplayPort over
> USB-C audio, connected to a TV, with a basic UCM to enable
> 'DISPLAY_PORT_RX Audio Mixer MultiMedia1':
> https://gitlab.com/postmarketOS/pmaports/-/tree/master/device/testing/device-fairphone-fp5/ucm
> 
> Unfortunately all the device-specific things can't be enabled yet
> upstream as detailed in the second patch, but the SoC parts should be
> good to go.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sc7280: Add APR nodes for sound
      commit: f44da5d8722de348ff2eb8b206c69b52809c1772

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

