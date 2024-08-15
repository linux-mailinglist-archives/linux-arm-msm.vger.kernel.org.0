Return-Path: <linux-arm-msm+bounces-28671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF4F953B8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05EB31F25A64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DDB149E17;
	Thu, 15 Aug 2024 20:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaT7rdeK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3408149DFC;
	Thu, 15 Aug 2024 20:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754457; cv=none; b=QEgu2MsmRxVAOtE8DIXB2N3HtICj+eJZkCsGRHY32mnNwetU+Z/qd2q0GGskxPCVlHGZkWsqKxLuTlerCdSlJi0ttZ/gthz7jLBhS+mi4/vp6x7ok/SpPjTNRBcsh/mImBtNDVT8avtd/4TaW/MSZN0n6YVhydwlEBkaHB1byic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754457; c=relaxed/simple;
	bh=d3sfWeHxva1JfLaQJzj6iXdO0zdjlM4Noz+FAhMcASs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f0OwaMulOeplcLf6TTdLfp5RJvDvzziKU19TfcTozy0S9fSnI9aIxksykBiADKUwuSrvl6Mv1F9/vOt5QmK7ROdM+U2rVKHZxN7lh9cJ03MOlvgEI+JIuJPubC+JwxKPDhvTqW7Pq8XrLa8yyBllN862mBTGAfw/4xIzmPtL0TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaT7rdeK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3FCC4AF0B;
	Thu, 15 Aug 2024 20:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754457;
	bh=d3sfWeHxva1JfLaQJzj6iXdO0zdjlM4Noz+FAhMcASs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KaT7rdeKNU9E6hil0Er8AfjXXsE3x7pr6RCfK49eUY0QZEVaDkfhC3RDGba2llv8h
	 hCeONfKvRTwOB4NdH6lo8ANZUBeYHBz9OmcXCkuae+aJgjC41arLOGHk7sUQFBSMir
	 t875nA+2f/YRVXyJtfmmcFY3If3LKsm6hoNwkeNzcAzpdvIw5H5iwpUSlqX6Axp9FP
	 HxXd37dhQTEKS7dC6aBpMbCsAlxS3D5H2z7lViRDTCQjliI9bO9iE1qPZ1qL16bU1I
	 6YafNVv7XeDh/j+1OFBJHnQkGcZ5yEIyaQpxYFD/uJOKnrKSRywqope3R+O9atCfbu
	 0PhIbO4dq0+MQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Fix USB 0 and 1 PHY GDSC pwrsts flags
Date: Thu, 15 Aug 2024 15:40:17 -0500
Message-ID: <172375444790.1011236.4126358525646189263.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801-x1e80100-clk-gcc-fix-usb-phy-gdscs-pwrsts-v1-1-8df016768a0f@linaro.org>
References: <20240801-x1e80100-clk-gcc-fix-usb-phy-gdscs-pwrsts-v1-1-8df016768a0f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 01 Aug 2024 13:21:07 +0300, Abel Vesa wrote:
> Allowing these GDSCs to collapse makes the QMP combo PHYs lose their
> configuration on machine suspend. Currently, the QMP combo PHY driver
> doesn't reinitialise the HW on resume. Under such conditions, the USB
> SuperSpeed support is broken. To avoid this, mark the pwrsts flags with
> RET_ON. This is in line with USB 2 PHY GDSC config.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-x1e80100: Fix USB 0 and 1 PHY GDSC pwrsts flags
      commit: f4c16a7cdbd2edecdb854f2ce0ef07c6263c5379

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

