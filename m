Return-Path: <linux-arm-msm+bounces-28697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE1D953BEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10A1A1F25B2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904EB16BE1C;
	Thu, 15 Aug 2024 20:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgUezHkE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E24916BE0B;
	Thu, 15 Aug 2024 20:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754491; cv=none; b=oncUMsuuQZqexgC4mw+UIO9E+Pc2YyicN4RgsKQ6SSl2HqNKs9cuPXRPpomEsGO32cuAdPsCCqJsko0Yckq5jfCJO5YEFe6o8YdBDDoeJgclxA1QGfAIcpweqfzXE37GATujkLo34upyWZFKqe9tf9aA/tPtE1x6wdI306mwC8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754491; c=relaxed/simple;
	bh=W89vbj7rNZqAtvfxhDgdhSh59QxfYWItZUMoYV2E8Dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gd2Wy/v56Grv2iwh7Le3aZEWgW3hYDE1YdMkcdG9uwm3GY/C6I6nrhps9WWTj6eoLTPbtrM5BX92wY5HAgGvbCz+QyUUmKbYt9riavFCxxOS+GE9ePDSh13GL8Ss4rSOCDgeM5pW1KtnOzU6C1dHBdPdt1knUR8snDgjSRlXhqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgUezHkE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FE5C4AF0E;
	Thu, 15 Aug 2024 20:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754491;
	bh=W89vbj7rNZqAtvfxhDgdhSh59QxfYWItZUMoYV2E8Dg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TgUezHkE/rKS9af+oOq5GzFeKNgTX4iU/4i65J+x0Wl6xL3j/YdkTtKxAdCc0F4xw
	 RLEoiCpBdtLuHkd+gs6Kq2cv689qqYYJRrBlwDFXmRJWm6tmswHxViCPuA/rmFXvOf
	 qoIen33HaELWnuqfb94OOKgwY0nM5kEmKhCRr/cenZWvYS/QzC8KrgM47fumJvVAVF
	 9Lliun4CmTH1I8jAaHI+5ZG6v+IH9hRrJQgGcet162QHmN0sIuV359BP2jYQZupvQE
	 N/FPyKgD5Zd+TX9nhgBHaOBDscSyye7UE8s0qohUwykcbtA1yS6pFlkjUpqAuNNBlH
	 jhzp8jJEOjTBw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/5] clk: qcom: gcc-sc8180x: Add DFS support and few fixes
Date: Thu, 15 Aug 2024 15:40:43 -0500
Message-ID: <172375444833.1011236.438148282820758163.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240812-gcc-sc8180x-fixes-v2-0-8b3eaa5fb856@quicinc.com>
References: <20240812-gcc-sc8180x-fixes-v2-0-8b3eaa5fb856@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 12 Aug 2024 10:43:00 +0530, Satya Priya Kakitapalli wrote:
> This series adds the DFS support for GCC QUPv3 RCGS and also adds the
> missing GPLL9 support and fixes the sdcc clocks frequency tables.
> 
> 

Applied, thanks!

[1/5] clk: qcom: gcc-sc8180x: Register QUPv3 RCGs for DFS on sc8180x
      commit: 1fc8c02e1d80463ce1b361d82b83fc43bb92d964
[2/5] dt-bindings: clock: qcom: Add GPLL9 support on gcc-sc8180x
      commit: 648b4bde0aca2980ebc0b90cdfbb80d222370c3d
[3/5] clk: qcom: gcc-sc8180x: Add GPLL9 support
      commit: 818a2f8d5e4ad2c1e39a4290158fe8e39a744c70
[4/5] clk: qcom: gcc-sc8180x: Fix the sdcc2 and sdcc4 clocks freq table
      commit: b8acaf2de8081371761ab4cf1e7a8ee4e7acc139
[5/5] clk: qcom: gcc-sm8150: De-register gcc_cpuss_ahb_clk_src
      commit: bab0c7a0bc586e736b7cd2aac8e6391709a70ef2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

