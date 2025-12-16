Return-Path: <linux-arm-msm+bounces-85401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46916CC48BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 18:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FBB030E9296
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 17:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F19530BB87;
	Tue, 16 Dec 2025 16:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIBvJ3Kn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A83F157480
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904384; cv=none; b=pZ4R17bmNTUtRHrbQNQAgvV+lhJ9HlP4t11E7K5b5MuxDZczTKO+K6XOuKEtn8PX1omuNcA0nQ4sOPLlTC4l+Q4VAKeAzMzRLZWL2zliDCzGQSD0Ni5VkQP6lsWmb1rzJbBba0iJksRE3frWCklIeVIK5g0hIWas1Eg0wAyZrDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904384; c=relaxed/simple;
	bh=/ijnLDUb9CQME0qI2gWKSAPbBVhfRXPEwaX0lLnaaas=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=szy4YXZ0g49Wr+Nvb/FGPif/Ia84TFf2Bp1Omjhmqe6rhcOrW6l2KfQtq54n1ody3+q379fkZMkZMe7UF7N+WWHfZwYGf1klmjVE1qDjI9oeFsrr0yvOJwA2RWqCtBGDoNNXBOdgoorqQUca9T/xQXryHSL397MSx5moUlqtvGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIBvJ3Kn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD32C4CEFB;
	Tue, 16 Dec 2025 16:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765904384;
	bh=/ijnLDUb9CQME0qI2gWKSAPbBVhfRXPEwaX0lLnaaas=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RIBvJ3KnAH5vOwS453MxRhzr+wWJFwGuX+1tg/NpRqPq0qaLE4ksqd32E8JvyMT+Z
	 qJRJq6ZKtm4WJQ+DxpNBu5YW2Oiygn/4mtjYNnIaAEnsmCyiQlrgNUxYkSRxz0BTeL
	 eOA009AwfBJFGhQANqPsVQ2DTUsx13YhwiAXyfxbwBCL9cBVWS1HnEWJT753MhmCJO
	 ioD1R/o9Fjg0+OoUAIntOCuZ878WB8YriQUXAGoORgEhOMY6gjtvpN8nU9Ba6Rq7rA
	 2lnhkZDarRjmlZrabydQwzxoYaz/Iorj+Zh/Tk0tfCDO0uQs1Y+xv6k21Vli78T2K7
	 hKwECA0A5K02Q==
From: Vinod Koul <vkoul@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Sinan Kaya <okaya@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Abin Joseph <abin.joseph@amd.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
References: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/6] dmaengine: at_xdmac: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-Id: <176590438034.430148.2613882199706918410.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 22:29:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 27 Oct 2025 15:32:27 +0200, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> 

Applied, thanks!

[1/6] dmaengine: at_xdmac: Remove redundant pm_runtime_mark_last_busy() calls
      commit: bce33c132a2061c9a7958474c3e2d030c22664de
[2/6] dmaengine: pl330: Remove redundant pm_runtime_mark_last_busy() calls
      commit: 5f6f0cad6d2d599b765d572216a290e48bfdcb5f
[3/6] dmaengine: qcom: Remove redundant pm_runtime_mark_last_busy() calls
      (no commit info)
[4/6] dmaengine: ste_dma40: Remove redundant pm_runtime_mark_last_busy() calls
      commit: 01f2bcf06d7e0e3c4badd03c030cf634ca10a172
[5/6] dmaengine: ti: Remove redundant pm_runtime_mark_last_busy() calls
      commit: 35d522a9612f5ba83192416521725acede02c28f
[6/6] dmaengine: zynqmp_dma: Remove redundant pm_runtime_mark_last_busy() calls
      commit: 3b81235280026c551660c6374ede9599fc82f617

Best regards,
-- 
~Vinod



