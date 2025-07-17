Return-Path: <linux-arm-msm+bounces-65350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F18EB083DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7188D3ACC16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8502135A1;
	Thu, 17 Jul 2025 04:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idxAmB17"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD88A212B31;
	Thu, 17 Jul 2025 04:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726683; cv=none; b=aN/h95Om2H/Psa+QNN4/5lsC59cyqFWWgSelohlB0J4Jw2vqr9YglZq2A2tHqbxt9ZVxnOyzCgFlKIuXCdXXd6uNkwDbqRiy1CTU6i6uAITFV1d+tjuZ6mrrB6Ik7qltZdqxl46hJxuWM3tAmBj6r/9mElQGBRgG2qPaAs3TP0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726683; c=relaxed/simple;
	bh=edfDTGmOfJeXidNfxDIR5uleBhBQYCUMQ/3UFSsqxFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O/cgoyK0VvjXfdIUzjdgtLMjvpw3vsgoxtHw8osFfNCDr6Y2lj+TK9jRXA4Xt9Ybv6e6SKfS9vbkSkR8ixi/j+kuRq7Q0dw03ffBHkbrDAw5CbvgsTJ51LKDtW4+uN8J5OIPmlSinOA5aJ2Wxl/xc6pKAIlxTpFzQzqWWQCFCzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idxAmB17; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F423C4CEF4;
	Thu, 17 Jul 2025 04:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726683;
	bh=edfDTGmOfJeXidNfxDIR5uleBhBQYCUMQ/3UFSsqxFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=idxAmB17I0aRmg9niQNlmyQJLIeaxBXs+5Z5pHysU1lHIswUx5C+dAq04JpUMeXK2
	 eIP+VbwwwMj3yjsp04yPrvEH0W9Vy5/F+GnLs3ITz2yTLb6mvPGusdMuXeTCoRspWU
	 NxgGZ11fdbjcKKlaEZnptvF9PsF26OL0TjlU+R6aIEE6NFMpEYj2Jhvg1p9UzyzDSk
	 /PCROZ07R0THjr7nnteqoAkRmOlf6QZOyuvf9e49UOOEI4CEbb+0aG9ei+kuXjSYiT
	 81iRN++4JXSbvgMYV/RiPDoqAruK53zrjgq1LK2B5TJWv5OI2znjHbn/ijxfAi50Jv
	 UlPDlf0hm4mWw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 0/3] Add support for the IPQ5018 Internal GE PHY
Date: Wed, 16 Jul 2025 23:30:56 -0500
Message-ID: <175272667146.130869.10854668334213374970.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630-ipq5018-ge-phy-v6-0-01be06378c15@outlook.com>
References: <20250630-ipq5018-ge-phy-v6-0-01be06378c15@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Jun 2025 16:34:59 +0400, George Moussalem wrote:
> The IPQ5018 SoC contains an internal Gigabit Ethernet PHY with its
> output pins that provide an MDI interface to either an external switch
> in a PHY to PHY link architecture or directly to an attached RJ45
> connector.
> 
> The PHY supports 10BASE-T/100BASE-TX/1000BASE-T link modes in SGMII
> interface mode, CDT, auto-negotiation and 802.3az EEE.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: ipq5018: Add MDIO buses
      commit: 23b3da8734e94acad2b98180cacbedf97754e1c1
[3/3] arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus
      commit: a150a9c4807ab37d9f63112ef8e11710104a9d09

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

