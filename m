Return-Path: <linux-arm-msm+bounces-61056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A43AD668B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFC417AB49D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F6F231845;
	Thu, 12 Jun 2025 04:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtOzaxSQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046471E5718;
	Thu, 12 Jun 2025 04:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700872; cv=none; b=FMEsa8kW49d+pvhwOGk0q1b6sTclqno55Kbo4oWW+JbdkUxkVWEb0jLuvRxTynmB8WgkZsCM6VnNVuPlJJm7o89RQWrcVvUfyZz/tWrx6tTUDu9gsgmAZbGcYKYJaRNraJ0fPSLmFjYV1XqKGZPU1zRF3kDB5mR4IKkBU1y6U04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700872; c=relaxed/simple;
	bh=oQ4osCgHbzemXS4dxxFdiShB4rZ0fXLkCLHJI3UQ/zY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IkIHwtDq2Mux/jXK7Wb6DjHVqBCva7UvSLfvbhABay7WVhdorNU+u349HEC3FupAaGnlqvlWRcisXmz0AS43i1H8F32DRVYCsN/ZK9tDQQ7pYsPhAkaT6ze6b9rW5AoCmQybgqnZj8jcjVJXBTn3vaBre3dzGS0xzxI6rCUghac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtOzaxSQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A03C4CEF0;
	Thu, 12 Jun 2025 04:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700870;
	bh=oQ4osCgHbzemXS4dxxFdiShB4rZ0fXLkCLHJI3UQ/zY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EtOzaxSQDyydkxX1KAIFi79hwUVZzSxAAXfSsnAjynZATN0HqUcr+YcrMVmVYd2sR
	 zaJ1hHDgWxqJ1KQkTEyA3rVjc09k4zR/OoVHjP4K2+lUquhsaZm/+sJF0k8gOgXRnn
	 RzXLhtJylaf7nYlk8mVcvk2l4QaeMXbHIXOCmrPM98cXMD5YjbkoP6aAbLFIPgXge2
	 neLcBV2ZpU/djkGE1LJdU1z/seJCYYo9fcGJIPe9tAzt0c+53lG3SSY6OqGZYcYLJh
	 PTZlNm/MUZ+kkMuxRxFiJ4vv7Cvlk9s56Sr3zNY2zf4D6APvSYbb6U1MjgmTsD3y+i
	 5L4P8+GiC6akA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] clk: qcom: Add camera clock controller support for sc8180x
Date: Wed, 11 Jun 2025 23:00:49 -0500
Message-ID: <174970084200.547582.10866755491364924120.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512-sc8180x-camcc-support-v4-0-8fb1d3265f52@quicinc.com>
References: <20250512-sc8180x-camcc-support-v4-0-8fb1d3265f52@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 12 May 2025 10:34:35 +0530, Satya Priya Kakitapalli wrote:
> This series adds support for camera clock controller base driver,
> bindings and DT support on sc8180x platform.
> 
> 

Applied, thanks!

[4/4] arm64: dts: qcom: Add camera clock controller for sc8180x
      commit: 277d48b2ab1e1150993ccb233156d0916b0cebd3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

