Return-Path: <linux-arm-msm+bounces-34759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC579A26A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25273B28A4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 15:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7851DF245;
	Thu, 17 Oct 2024 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ot76Chu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CD01DF242;
	Thu, 17 Oct 2024 15:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179085; cv=none; b=oucx5d6j9xT2Kk4EpHegUyDdH2UwhHkQplKVPTINmpEB70GLn6mWGOE64a8a4AsZ+dXe4ogBzGmo/EGiQGLDQlEiD44MUF691o2Y6gwlpECwuQLvczMhWF2pEc1SRgL/ZZadLfrmOtvj1L44kp9Oyim4JN04AFDRFaWGzPR4zkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179085; c=relaxed/simple;
	bh=vieJQes47g+OA0SB8CvhHf0OYDbiZxyy/v7m5nYIs80=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GlGWE+YyE8AfF9uC78BrCW/BgD3N03ARBLCwaP2jqxPlbyF4CYtfNVxkB33s+3DMDag1pKtDVxYBk7PaVCYnSHrO98it3dcZEftKUDEH8GMTZOfM77xyM9W7By5CBWsGIrEMqmmA1ufOCLfyj7Osv//uHZkYMg6uZpNYzAKbEIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ot76Chu5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8CFC4CEC3;
	Thu, 17 Oct 2024 15:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729179084;
	bh=vieJQes47g+OA0SB8CvhHf0OYDbiZxyy/v7m5nYIs80=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ot76Chu5TodD1919cJi+65JJ9Xhs+aC7GVlLcylqSctx00QpCcGV8UzFzfjMcge8l
	 TluKUtkEqcDy7wkD+krSS2KfaHDIfUhemK3C7bzdwsjysnTL9f8424MPx/qwRec0mT
	 CiLIy/Tp7AuLc0vKybw8UNo0LHt/1arn41+QVD1usZ1JUWBrFmBVV3pd7oAWg92ZM2
	 YwsLJmyOUxg6I4g+47MGA7asVF8Wa7v4d9r+cTjpfXHIelz3sO0GeucjOsqNctQ933
	 pC+uavXG0n2az2J68R5oBEVx+U4BjA3FDyarSu2Yer/V9qMOIRiM56Qb7N3E3CmAh3
	 Zwq8qq/3a9eOg==
From: Vinod Koul <vkoul@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241015121406.15033-1-johan+linaro@kernel.org>
References: <20241015121406.15033-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies
Message-Id: <172917908201.278159.9935539018681259704.b4-ty@kernel.org>
Date: Thu, 17 Oct 2024 21:01:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 15 Oct 2024 14:14:06 +0200, Johan Hovold wrote:
> The PCIe PHYs on x1e80100 do not a have a qref supply so stop requesting
> one. This also avoids the follow warning at boot:
> 
> 	qcom-qmp-pcie-phy 1bfc000.phy: supply vdda-qref not found, using dummy regulator
> 
> 

Applied, thanks!

[1/1] phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies
      commit: 031b46b4729b1a6ff8484a1e29cdb41b710ed740

Best regards,
-- 
~Vinod



