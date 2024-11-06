Return-Path: <linux-arm-msm+bounces-37088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC609BDA99
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 01:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C81A81F23D99
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 00:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A44C80035;
	Wed,  6 Nov 2024 00:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6HsM8i3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388992D613;
	Wed,  6 Nov 2024 00:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730854432; cv=none; b=MnZ39Nux73Ok3BDZj1uf1wZlPZlG8dYohE808hb96CIpBx3F0FI7krS7V2BKbCH6qTAxlTQozJeSCeILP4f/fTWiZe524wyNHeP+e4F5AbTUNptoSlqzYc+aTptWhsFfpvAZRmjK95nKFcecLsfyTgEl2a94qA4Uy9HXvuYEOpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730854432; c=relaxed/simple;
	bh=HDy8obacGOm/SKEFHCJbOmZGEmFOiUpAxI2JVV5qdn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lv+Sj5fjM1pavTHLwU73bc/2quZ2L5Dar5Z7RBR7VgPzbKnXvutIfK0u6qXcAatOjk/oJ5tNZ3ci4Bz6CtXfTrFNqEoPHYqs8xnxzxuWqWFfmm9V6q+Lk4ieAVEkDHSyOcmTfsWHokg6iMjtR3nlI5Sa2ymn5wuxmr/hbQxzr3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6HsM8i3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89286C4CECF;
	Wed,  6 Nov 2024 00:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730854432;
	bh=HDy8obacGOm/SKEFHCJbOmZGEmFOiUpAxI2JVV5qdn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D6HsM8i3fLJSOuXZ6n56hQwxdF139XpZxH/q2QUnOzy0HopY0XFUOLW22i6xqA2bJ
	 0XNsY4BDXJ2HkT3uWdeeAkE4bFywPrRLzXaK6oHetQf4Brb9nTZftRfGoEPsiX/k3E
	 i+Yz6gjESScFHQsdolwUpIJRWck0pDgM2M0qVIZzanWf3Uz1mp9QsBc8tIk0BVpJSh
	 v/sRv2oJHkyxIcyWQsVoj9QDjajPc8yCq75UHZLS5zwta2ZMmpOkzNCExa/4vNNMiY
	 iNxb2h1DlGcTz8ioNWX1KVLx+5S+jCsAKNxNIRESsqHxgnahFAnBUH34avMyj+bj54
	 b3kx/UuyqOIEg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/3] arm64: dts: qcom: add QAR2130P support
Date: Tue,  5 Nov 2024 16:53:41 -0800
Message-ID: <173085441669.26510.3464557959226675311.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241102-sar2130p-dt-v4-0-60b7220fd0dd@linaro.org>
References: <20241102-sar2130p-dt-v4-0-60b7220fd0dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 02 Nov 2024 05:03:11 +0200, Dmitry Baryshkov wrote:
> Add device tree bindings for the QAR2130P also known as Qualcomm
> Snapdragon AR2 Gen1 Smart Viewer Development Kit. The device boots,
> provides serial console, I2C / SPI interfaces, WiFi (requires external
> BDF) and BT (requires external firmware).
> 
> Dependencies:
>     - https://lore.kernel.org/r/20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org
>       (clocks bindings)
>     - https://lore.kernel.org/r/20241017-sar2130p-nvmem-v1-1-6cc32789afc6@linaro.org
>       (critical bugfix)
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: add QAR2130P board
      commit: 23bb55173078ef454868aa814d4273f190afe7da
[2/3] arm64: dts: qcom: sar2130p: add support for SAR2130P
      commit: be9115bfe5bf612455968724361a96b135d1f677
[3/3] arm64: dts: qcom: sar2130p: add QAR2130P board file
      commit: 6339e41fa39b498b0c9417925e33c80ad61b0e63

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

