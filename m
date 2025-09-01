Return-Path: <linux-arm-msm+bounces-71443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D3DB3EEAE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA2BA1A8826B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70111343D8C;
	Mon,  1 Sep 2025 19:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYlvnyTQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4679B343D72;
	Mon,  1 Sep 2025 19:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755979; cv=none; b=pH5D03H1gyCnrKquRJDUNLJE6x26bBFILV8YRF886g5QkHnufHKzHfp96xeYcwmFatuFKIzy0mrFJmuJa3zwWVy15DD6eV37hiqfIQ0v9RqwKYGtwo3d4gX948plIViwDD2CxgVpdofdO1/e562NQxPOxy/rprS4Vf4XeSCZVVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755979; c=relaxed/simple;
	bh=+I4dnJqvlWmEnld8ly88CK019g7EkC5BAmsD+fwdbg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qc1a1DXL9Ax+Ik0VA7HdPq9e+9TIJDNUcCuOzX98b7U7A/+gJcB8g8xA/HU+zGvCzifvgzHkcJKfyaBGj+2OJaJtfFWC+UR7kJ81NavyYXUi6PrJyV3AL3GC7mfuYqXOiXvF8JFkTLFQNAoHMnpnUTUKDe496SAKP0e0yRrR3eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYlvnyTQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CB6C4CEF1;
	Mon,  1 Sep 2025 19:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755979;
	bh=+I4dnJqvlWmEnld8ly88CK019g7EkC5BAmsD+fwdbg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dYlvnyTQopAPd39t04d8a2jmqH9NOmvdpZukytAS29riluseEYXDzcRgtuSf//7y0
	 8a638A9xd1w1iDU1UUheub3P1WtB8UVd5tAzjb/BRiq+wsfW5R85RDJ6lbCtPWxrf0
	 o9HzmRwaAlJuIuyAezg12BfTwhtQi5FHMQfxL0ZDekuwB2+WLSlCxrALYh/3hLqje5
	 7EHS/pdoGvKrEAd0lwgNtlvuXOKOmMWmPwjchCXTwXXeFtzX8RQasw2qdDmsn6Ys3b
	 PF3vJTsZUGlmmOgWRsX4Tcsg4S9DSzPD0NvnIt7uftiyDOMbML58w08KPhGKtpnODS
	 EH0PaDZIUcgbQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: (subset) [PATCH v4 0/6] arm64: qcom: allow up to 4 lanes for the Type-C DisplayPort Altmode
Date: Mon,  1 Sep 2025 14:46:00 -0500
Message-ID: <175675595931.1796591.1151712153506063234.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 07 Aug 2025 18:33:18 +0200, Konrad Dybcio wrote:
> Register a typec mux in order to change the PHY mode on the Type-C
> mux events depending on the mode and the svid when in Altmode setup.
> 
> The DisplayPort phy should be left enabled if is still powered on
> by the DRM DisplayPort controller, so bail out until the DisplayPort
> PHY is not powered off.
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13: Set up 4-lane DP
      commit: 7a6ad5dd551a20672edceed087408ea6bcbfe8f2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

