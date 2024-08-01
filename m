Return-Path: <linux-arm-msm+bounces-27655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB269441C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 05:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7615128450E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 03:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE74C14B090;
	Thu,  1 Aug 2024 03:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqONjEU4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E82E14B06E;
	Thu,  1 Aug 2024 03:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722482407; cv=none; b=lxVydyFv0fmDQntpno5l3bN8EG68Ea3bXcTFN8gA7JQll3pVBXTUau5FcxriubhArNFz8bfe60fq3HUQwNhxsmoOPKBlDNWfizbMwTY8hvPMWq/B3skdoPtOMzAkdSAsGqM9Q33NIMLp4OLIqS605QbpMDGP+xSL5K63wLgTsyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722482407; c=relaxed/simple;
	bh=NPDnxqoGeG1tj/Br1Mz6ALdJhdHfEc7EQxfanZLFBQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IEltEMpNU8QZ4xVPe2kaSjmKAp0CjCe14lK9TFRrgaaX55Bl0RCFACgWIgXfBBw2XbHp2Cbm6pJ9eZsAh+9qpKTCg+kZLC36xZYcRF4LFxuOKY5xA3/b7TYUJLjAvTl7gXVfHfH4L2wYEUwybXWiV7+Xw0HzzPNLCxmfRVR5BGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqONjEU4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF07C4AF0E;
	Thu,  1 Aug 2024 03:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722482407;
	bh=NPDnxqoGeG1tj/Br1Mz6ALdJhdHfEc7EQxfanZLFBQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cqONjEU4Sj94/hQV3IMGI1TqCxY4ELmBHpaXZPMCZVutz0ETD4F5HTfJ5Qbj8PbIW
	 y5cUcgBAmAdLRadXqezImPpXNKEvIm+jQxbmxJX09gAHqM+9/39oRLDBKaaLQn14eg
	 htttqYD0xIIwNUTTDVW271rWhwrUZPEgF8ydHX8+IUicjiNXU+ebA4uUC9/0dzVkKz
	 mqW1Cl837ybAYVOn1WBFZFbU9bCLcgkROLbYdzoKFFv8IIFt9yE8Uvu5G9BpiaNRTX
	 UM0ZO3QFix3FCOR+oT+E82Ly+ljkyMtG6yFWzKCxmD1aR+rmACUXmQkKFN8N8dQhbG
	 TCRmYgnAIxjoQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Abhishek Sahu <absahu@codeaurora.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	stable@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: (subset) [PATCH V3 0/8] Add camera clock controller support for SM8150
Date: Wed, 31 Jul 2024 22:19:48 -0500
Message-ID: <172248238599.319692.12998742883120092670.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
References: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 31 Jul 2024 11:59:08 +0530, Satya Priya Kakitapalli wrote:
> Add camcc support and Regera PLL ops. Also, fix the pll post div mask.
> 
> Changes in V3:
>  - Split the fixes into separate patches, remove RETAIN_FF flag for
>    gdscs and document the BIT(15) of pll alpha value.
>  - Link to v2: https://lore.kernel.org/all/20240702-camcc-support-sm8150-v2-1-4baf54ec7333@quicinc.com
> 
> [...]

Applied, thanks!

[8/8] arm64: dts: qcom: Add camera clock controller for sm8150
      commit: f75537a42afbbe3f652c73493741448586df7719

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

