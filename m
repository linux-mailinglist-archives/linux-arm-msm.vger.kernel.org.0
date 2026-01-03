Return-Path: <linux-arm-msm+bounces-87320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7192DCF02AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 17:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E88D3009FB8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 16:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AAC30DEBB;
	Sat,  3 Jan 2026 16:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSE5xDuT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3492530DD00;
	Sat,  3 Jan 2026 16:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767456191; cv=none; b=JhbO34ReDPRLrVPDZK2QehCGqe9PH3TnDkHGCVS0+biS/aBtLo+HTU7I9qOBInSZGvFh0Hk1o9nkDZgN2ip2rGHtrfKIsccFHhfLfxPAy3rCOQM8iXKN62jQxxQBNkZ5z4aH/4+8H0vKYGubS17NY3G71eyzjQ3Zn8XmopQmnE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767456191; c=relaxed/simple;
	bh=D2Xh6mKgHoiBVvjOe1bvGggrrhKnFiTBC2sznr1RLE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BQyADFgKT7gGWkEuKqaXCKCZY+lKUEMCMK8Tk2uGVkCzYtD8DhZLwek2sDZMKlc07O+sa7dPFTzyY+tyuJOPPyACmxiv0TIyHLgv+EIMspQDyP/BpQ1wVYcG9jpc07FmcOQGKh4uAsY0NWk8/vE5n4NztjAs9H7MS27rrR77Iww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSE5xDuT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681C1C19423;
	Sat,  3 Jan 2026 16:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767456190;
	bh=D2Xh6mKgHoiBVvjOe1bvGggrrhKnFiTBC2sznr1RLE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RSE5xDuTAaLPBpP5LkEJrkUKa5Gp/HSCqo3ZuFkCkF9PaQBhUwx40o5qNSmAP/JE5
	 1ERD4ZKc9kNjqghCWm9KvjGbl/a+HAYt6vfoxAw8n7JI51qmtR2sqoCB3pN6lP23Pz
	 IVgYIj9AwpEg/7PJLmi3clckoKysKJll4lW/KtJyC7eiinKw3TZI7ZE+xRP7noHmDN
	 /fiVoGGeeC7q9EpCofxuy2PYPBXPTfyGhKA2RRAwye94OmgCvrnH/Y8PPmB13wWMY2
	 X0EnLkvTKy46FAbcQ1mK8mXQ9Ltb/leZBRcRcIBKaNrRc7aLv323nUd+gJ/IPF11Mi
	 WrPUjmBSqPfWQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/3] Add missing UFS symbol 0/1 RX/TX clocks
Date: Sat,  3 Jan 2026 10:02:58 -0600
Message-ID: <176745617451.2631416.1453200716418508403.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103-ufs_symbol_clk-v2-0-51828cc76236@oss.qualcomm.com>
References: <20260103-ufs_symbol_clk-v2-0-51828cc76236@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 03 Jan 2026 11:27:04 +0530, Taniya Das wrote:
> Some of the UFS symbol clock infrastructure has been left undescribed.
> Add the required muxes in the global clock controller driver.
> 
> The UFS testcases have been verified with these clocks.
> 
> Changes in v2:
> - Update the commit text to remove "Add indices for them to allow
>   extending the driver." [Krzysztof]
> - Remove unused parent maps and parent data from GCC file [Dmitry].
> - Add RB-by for GCC [Abel]
> - Add RB-by for device tree [Dmitry, Abel]
> - Link to v1: https://lore.kernel.org/r/20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: hamoa: Extend the gcc input clock list
      commit: 65b705cca009ffdf00ad7b649ac8a7e063373ddc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

