Return-Path: <linux-arm-msm+bounces-43413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3759FCD04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE6F4163108
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871CC1DFD89;
	Thu, 26 Dec 2024 18:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6PwqRtV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ACF1DF998;
	Thu, 26 Dec 2024 18:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237672; cv=none; b=HUbsnp2lcOVTen2kbTE+eAojOTrsonErHbF/CXc8M1kUyvWE/2FPUgkjQTYaI2LaXf99wDB04ljf+CWBXTfc9ifdnlPh7pr8dVGWh/5y26GlTkxu3o+DZaDt9Q3ziaXFul5aS+7CcowDjG6rER0qqQum6762654dAi/dcSYQSn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237672; c=relaxed/simple;
	bh=gtMbYk3N6xgXQ7sqpgTBbuRqKJ5+ElAd4Ea2Xf2ZLSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eQ0/3R/+W1cL9VE7eNQ7T4oFz283ogvPdtTsmQW6kedkqTzKyJdzfbg0ELkLdQBwHy6eTCITjJMYx/VB3ZWKfts9tq2/ATzm2KsFL0FSiq4BXZTFIbrZZK/pT2EUoI7GNTf5gkCLiyIxzYJqEsbtMxt5zuT7PNdwEvc6XMwOg+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6PwqRtV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D84C4CED1;
	Thu, 26 Dec 2024 18:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237672;
	bh=gtMbYk3N6xgXQ7sqpgTBbuRqKJ5+ElAd4Ea2Xf2ZLSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A6PwqRtVPQ/meAuloC8xJzVHe6Lm979qIRNZ1mhu9xpernVmPo5emfnn1g1KMqS98
	 7s2eG3DH9/ncsqVltSodFZ34+P3ext+Hjah8JmOnaLpdegV3PcJUG5/HTpHdNg+RuI
	 kck2uZD92XLeu7RwodKiaygBi03OWpRoywoSIp0SvJQfvbsq43EtgIeTubdS62kd84
	 NWS2uTJFhBUtVDxrl98ixzYxVb4NHX1dztUjLywXHFenhYiGallN9FfYGDaSKHfCcb
	 xWXrXpuoxk+GGopuMRX9Y5busNnuOfIS1w71o6IAByQQRMCOeLh1g1kRh4Z/N35ST6
	 kHmvDqJ1DdOdA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v4 0/4] Add GCC and RPMH clock controller for QCS615 SoC
Date: Thu, 26 Dec 2024 12:27:06 -0600
Message-ID: <173523761388.1412574.15312254477268678919.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com>
References: <20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Oct 2024 17:22:49 +0530, Taniya Das wrote:
> Add support for Global clock controller(GCC) and the RPMH clock
> controller for the Qualcomm QCS615 SoC.
> 
> The QCS615 SoC is added as part of the below series.
> https://lore.kernel.org/all/20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com/
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for QCS615
      commit: 94465062260063143ab806cdd16d5e183643343d
[2/4] clk: qcom: rpmhcc: Add support for QCS615 Clocks
      commit: 42a1905a10d622ab0a4ff564b0117444f4384c35
[4/4] clk: qcom: gcc: Add support for QCS615 GCC clocks
      commit: 39d6dcf67fe955eadd787052a8963837be801794

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

