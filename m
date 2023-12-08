Return-Path: <linux-arm-msm+bounces-3969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF4780A5F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4850F281C4F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E57D1F164;
	Fri,  8 Dec 2023 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9dX4hfa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E861E538
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 14:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6ACC433C9;
	Fri,  8 Dec 2023 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047073;
	bh=IeciPaIg6PS4Nd89NCbeYUimfqv3vbcKAKqdtLZpbEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h9dX4hfaf/yHFs4MtcRyXJ3dYQc8xKSq5SAblD8Hnl4JiT3aR5I4ZXWB4guIh+JLB
	 VpnX6+9zKAWr5uWehztbWMd+jfzgglCT1NkxCtFXnJj3ZjnXUoEsy2pxSQXbJ+Oz9U
	 Nc0s+JgYfNdLY4jSFNctiHxSRd08TQg6zgxW/dB8gKwFkzjb5pY8rxcl8Sd/xZ+80T
	 pxEoJPPiR7bBTIKeM0FdQ+cPIgomgE7lfcx7gFIOfy3c97Y0r5getZlsTv0X5sGSCl
	 01aeOTLJpyH/5CxUDLAI5I6xcCKCYS/QvtHzuJIiQ3bAbFg3JaEUPXVxrhthwOetcl
	 pWjsXBcIau1bQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: deconfig: enable Qualcomm SM8650 SoC drivers
Date: Fri,  8 Dec 2023 06:55:22 -0800
Message-ID: <170204733625.342318.16325609104952222149.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121-topic-sm8650-upstream-defconfig-v1-1-2500565fc21b@linaro.org>
References: <20231121-topic-sm8650-upstream-defconfig-v1-1-2500565fc21b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Nov 2023 10:51:11 +0100, Neil Armstrong wrote:
> Enable Clocks, Pinctrl and Interconnect drivers in the ARM64
> defconfig for the Qualcomm SM8650 SoC to boot the SM8650 MTP
> (Mobile Test Platform) and QRD (Qualcomm Reference Device) boards.
> 
> TCSRCC, GCC, Interconnect, and Pinctrl config are marked as builtin and
> not modules due to boot dependencies.
> 
> [...]

Applied, thanks!

[1/1] arm64: deconfig: enable Qualcomm SM8650 SoC drivers
      commit: 17fc6f391932dfc8c11634667ca2d1d24c961cf5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

