Return-Path: <linux-arm-msm+bounces-82396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1D4C6BD09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 23:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 65D4F4E2DAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 22:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA2E2FAC18;
	Tue, 18 Nov 2025 22:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eiNk87KU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AFA18FDDE;
	Tue, 18 Nov 2025 22:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763503670; cv=none; b=RjsRCPcIRQgvbMg6TYoJ7mfreJtGxYtyq4v79y6GXarTDd8LSYyu9vDFVARE8oI9mr4uJdrP30E2WwLkzTmv35hScimcjypaeV84H5XlpzvQmkdvA17rG6iWKZQ98GutZck6N2/0oRDcYY9gEBknijnWxT/ZQCQjiRn1RFdE2/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763503670; c=relaxed/simple;
	bh=MJ5lOBmt3g8qnRm+ZGpE+A3Y2T8qzHL6e7LGA24vJzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cp5XWfLcpJO5pDGSutUyjY5S4UXQh2PKkcoykmZkbKHJ7si8HfhX1t0ZExwacCt5RccO5lSrHMRNHdLICLQTUWQfyIunniECsRtrJ3Qk8fbyg93EdwFKfNaSVP3+15W0b8/MqDRATP576R7e2VNeGzuP1l9fEQ7KqFSbHmQixNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eiNk87KU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F51C2BCB6;
	Tue, 18 Nov 2025 22:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763503669;
	bh=MJ5lOBmt3g8qnRm+ZGpE+A3Y2T8qzHL6e7LGA24vJzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eiNk87KUY2hKsM1yfChfMeWiIwKrBd8vl3mCUcKUKV/Oiz77aDmbMX8iD2owRQi1n
	 cYKmsn8Xo7Nh83m36SmS2Gtle+x7oKup7R6RlL8arU1VEDu9GSSz6XLtyTjCAkNnS0
	 0o/L5dio7o3VKD5LveZXPjHzcdIu/2AUbvd8Kh/X9dWcKHQgPiYGHWoojEHsVP4zBq
	 lqozJwYBD+x+Bo08zfJiSmwSdDx4XYm0AyFbzGNCsdzvGsNIfX6Ow7kf41J6YaLciL
	 WAhAQdW42/CQ4BNGXBgP4Ea44L2/tZIUHhJ3muc7HfLwveuxKepXTUO7vxmzVT21Hw
	 R0oaqm21S8rfw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] Add DISP_CC USB4 router link resets for X1E
Date: Tue, 18 Nov 2025 16:12:33 -0600
Message-ID: <176350395166.3382332.6010155143876932907.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118-topic-usb4_x1e_dispcc-v1-0-14c68d842c71@oss.qualcomm.com>
References: <20251118-topic-usb4_x1e_dispcc-v1-0-14c68d842c71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Nov 2025 18:33:10 +0100, Konrad Dybcio wrote:
> Those are going to be necessary to toggle as part of the topology setup
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: qcom: x1e80100-dispcc: Add USB4 router link resets
      commit: c84b824d3a8f14bedec8108cb8061da761180f49
[2/2] clk: qcom: x1e80100-dispcc: Add USB4 router link resets
      commit: 3664282f3345fdfa6a154feb6ed6c3217a8b3b0d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

