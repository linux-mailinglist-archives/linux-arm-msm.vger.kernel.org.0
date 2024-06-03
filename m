Return-Path: <linux-arm-msm+bounces-21489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4668D84E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 16:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD4961C20F26
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 14:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2036A12E1ED;
	Mon,  3 Jun 2024 14:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnyIc7q1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF75212C554;
	Mon,  3 Jun 2024 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717424781; cv=none; b=bZI1hqlWqjtNYhAPSY0c5wQm/B03WIkLZdacBZBOoRnx6Gpe/RSCiZP1j+QvpDi3SRlmk3jDD2U2gN8lQYEZFRTeTsfHU3kcKiicebmpSO7qi6E+jrOGc3e8xXoQ8Gvy0lDevTud7qi5iQVt+ZdPKFyJ8Z6S+5Saw7e+ZKfYnjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717424781; c=relaxed/simple;
	bh=YqSAUIrmXDsmPykiWr2zCB7ZKvMjgIMT+q5ZXvGYhUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U6wHuMuChA1BsQuivGHHXQspPJWfANhX6UAVVZsyyYbTjF+t0neb7F8hxjhyIAGjOFVz4rqAaLiO9dwEfkx0Aech8HCqLgTSGUuFMZF+CyN92boVKfAV1RZ52QEgBHSpacIMsPDDa9Z/pka5ZBr6JRS3450Lrk54Rnpen9Sh6uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnyIc7q1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8611BC2BD10;
	Mon,  3 Jun 2024 14:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717424780;
	bh=YqSAUIrmXDsmPykiWr2zCB7ZKvMjgIMT+q5ZXvGYhUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QnyIc7q1zGvzOSVpTVCHpx4BPU0by2RQL2W0ZKN8QEFC5G2/x3Sj1SKahkcoJ8e/j
	 2s6lc5p8xPastD514m+z9ynAA7alOtvR2wJy+fn4rXrcZ+VgJr+tfL2EcYMsiHPY2W
	 Rw9evUM7qcoC3F1Xhkai8PqDo/XiaJGNcuAhVAnRPnsh9BHXiGCZCUTeCXGzWPlUgy
	 4GB1YFN/TTVxvgCe6PrxCybyquak/JYMkkK7gBQuJ4UqZjA/wW4qb4Nvg+Xrt8ibFy
	 mgSxickTj2mC5dzLzqSrZPrQy3DAHEgAcCT4G1Heut0f2sWQEdoz2g15iV0h1oojL+
	 9j12QeOEezCkg==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240527-x1e80100-phy-qualcomm-combo-fix-dp-v1-0-be8a0b882117@linaro.org>
References: <20240527-x1e80100-phy-qualcomm-combo-fix-dp-v1-0-be8a0b882117@linaro.org>
Subject: Re: [PATCH 0/3] phy: qcom: qmp-combo: Fixes needed for DP
Message-Id: <171742477811.106652.12217474825972080387.b4-ty@kernel.org>
Date: Mon, 03 Jun 2024 19:56:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 27 May 2024 10:20:34 +0300, Abel Vesa wrote:
> DP is not currently enabled on any of the X Elite platform boards
> upstream yet. These fixes are preparatory work for when the support will
> land upstream. The USB part of the PHY doesn't need these fixes in order
> to work properly.
> 
> 

Applied, thanks!

[1/3] phy: qcom-qmp: qserdes-txrx: Add missing registers offsets
      commit: 5314e84c33e7ad61df5203df540626ac59f9dcd9
[2/3] phy: qcom-qmp: pcs: Add missing v6 N4 register offsets
      commit: 99bf89626335bbec71d8461f0faec88551440850
[3/3] phy: qcom: qmp-combo: Switch from V6 to V6 N4 register offsets
      commit: 163c1a356a847ab4767200fd4a45b3f8e4ddc900

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>


