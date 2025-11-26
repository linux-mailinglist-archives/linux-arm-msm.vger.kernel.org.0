Return-Path: <linux-arm-msm+bounces-83512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCD0C8BC44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 21:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ADB01359C3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 20:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D86134320A;
	Wed, 26 Nov 2025 20:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsfO09IQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8143431EE;
	Wed, 26 Nov 2025 20:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187524; cv=none; b=mD/osqdCV4PM7BeOSbh62FXH0EL8mlrspusraH2VEYzhjPdyAq8t126sYjGycnQNiTOQPD2VSCGNsDh1jfKlF/qEENpogCZ5D+1Azej42icWrDyZTTkwOUUiEqQchzNq/rMZSqIBtMSx+G5hWzluHyirIg7fXCCEc+74O+hvTOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187524; c=relaxed/simple;
	bh=HNlhUSAZHy9m56st5YpHKHIBWXjQyR/HAaQSnTKncP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ac9NirmYsgYe2idvxxVQ+rN//ggY5d1Ipl9G2NwDCEN9WVk5Po5Wpq9KaMP2wQZWP4rxFBrd+bZGPBXPIRXnKAEYpGvTgBCglM/NezuuqB2NX3Fpv26lvhjw5qpdRL6zXkejsBxRPtmFB/v8EheRwNNlPo8c+Wnfvy8Fze3fwP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsfO09IQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19FFC4CEF7;
	Wed, 26 Nov 2025 20:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764187523;
	bh=HNlhUSAZHy9m56st5YpHKHIBWXjQyR/HAaQSnTKncP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DsfO09IQ7Lkx9NQNdoXXALYCw6/Y+5nkpb1agRzj+bq84MnIhGTWVEkGWr6lUisaT
	 VHjPQ0z51ZaTH/jLPk/Ja4K0UdBdhAwk9JZxzeJOc9QSqd0Fv8b6wEFeNZe4wROGKu
	 5jk5huuvl8PyOb2tggpSokOb3P5DTRD0l2DZcGME0bk8pv7shYn2dQjk9+GjHEeuBy
	 MPUahTrySMeEorKMaMQSodcj+IzINh78BC4fAZmc90eSIkpOpeqXYIuq0mnPdWQ+mw
	 xK9vHsrlNpSFqTmL1To7CNwdzUq5XJIaUOnZ0EvviEvH7iHEoFdgUE/7WFW6na9f70
	 pmOfqvYI2pi3g==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Nickolay Goppen <setotau@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux@mainlining.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] Add SDM660 cDSP support
Date: Wed, 26 Nov 2025 14:10:45 -0600
Message-ID: <176418784440.1591314.3239085261697231881.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110-qcom-sdm660-cdsp-v3-0-cc3c37287e72@mainlining.org>
References: <20251110-qcom-sdm660-cdsp-v3-0-cc3c37287e72@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 10 Nov 2025 21:29:42 +0300, Nickolay Goppen wrote:
> This series adds an ability to load and boot the cDSP remoteproc
> found in the SDM660 SoC.
> 
> 

Applied, thanks!

[1/3] dt-bindings: remoteproc: qcom: adsp: Add missing constrains for SDM660 ADSP
      commit: db03780e43781d48effef75c9b1960987f6751d4
[2/3] dt-bindings: remoteproc: qcom: adsp: Add SDM660 CDSP compatible
      commit: acd6c28a2503f1e53ef06fb3dc1b6cbf9cc6cec3
[3/3] remoteproc: qcom: pas: Add support for SDM660 CDSP
      commit: 950c74fd6cd80ae6773aa3bf4cb4321b83f194d2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

