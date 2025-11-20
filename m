Return-Path: <linux-arm-msm+bounces-82719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 15026C75974
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 18:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4BC92352EC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C2B3A1CE1;
	Thu, 20 Nov 2025 17:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KP5PQJQL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669E0366DB0;
	Thu, 20 Nov 2025 17:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658702; cv=none; b=YWlWlErfEVdJA0UVvsAhu/nfKgAFG9bPXRTkJAP/VTZgbd2nd7ePjex9AckJolYgXDOQjXjZnLBPjuE9KbUzJTFY7LWhMt6NXQX8RNqKS4htbjTPFI5OON/nvQHlz35GN/sKNRgCDm8kooOrm88VZmd9JZ6lGQ4LLs4cPSOQC9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658702; c=relaxed/simple;
	bh=mvW1lwQp9k6xmFvEFz7FUTpGedosXwSsqWMpbLCH6p0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PoX+pNdWGdJwUQBcUsoFHDHiW4IqqUGqhgIqrDVZai/VVTamJZ7C1c0wktVIUMe8fuqX+/hNn4Ah+7fU/eO9de3FOP8NVB+3h62pCwPW99pvrf4V2GPC1iOwaVONxbTEC4OE1HqSJejn3HDg6jHsZdlb7yBW7rVRokjOY4jCcwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KP5PQJQL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45803C4CEF1;
	Thu, 20 Nov 2025 17:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658701;
	bh=mvW1lwQp9k6xmFvEFz7FUTpGedosXwSsqWMpbLCH6p0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KP5PQJQL+4n7oYYjHFAVH003Ft19/YwBi43sHrHFCof6Tw/+Yp4RRNPrd9yVj6PAY
	 wgO5HRLMKYGBRjT16Iis/iZDU+hYU0wJ5qTWNlVEX62Nl3keCKbfaRLXyBeQUX7VXg
	 KZ+cnYffptCypo71P/50+eHTvSVA8c2Rvy+wfcT+vk7b7jof5hFoUTkzrodRANCYDW
	 l34kBVuW08ttC64A5ot34gahF/EUTT+XhNGkDO4WmOfAfWkZ+SJVZojG/KyjypYjh6
	 n0P1d2v/C1GzeD8MNOXm1WRTC+36xyPpwVlpDIR5ZEeetixAdi8v6tW6SChtOvA6TU
	 vq3wY4yfSZKEg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ronak Raheja <ronak.raheja@oss.qualcomm.com>
In-Reply-To: <20250920032158.242725-1-wesley.cheng@oss.qualcomm.com>
References: <20250920032158.242725-1-wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qcom: m31-eusb2: Update init sequence to set
 PHY_ENABLE
Message-Id: <176365869990.207696.989282902866699019.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:41:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 19 Sep 2025 20:21:58 -0700, Wesley Cheng wrote:
> Certain platforms may not have the PHY_ENABLE bit set on power on reset.
> Update the current sequence to explicitly write to enable the PHY_ENABLE
> bit.  This ensures that regardless of the platform, the PHY is properly
> enabled.
> 
> 

Applied, thanks!

[1/1] phy: qcom: m31-eusb2: Update init sequence to set PHY_ENABLE
      commit: 7044ed6749c8a7d49e67b2f07f42da2f29d26be6

Best regards,
-- 
~Vinod



