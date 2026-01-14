Return-Path: <linux-arm-msm+bounces-89016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA0CD1F456
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 15:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 967133010578
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 14:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758FD2BEC2E;
	Wed, 14 Jan 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTbhI3eY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C802BE647;
	Wed, 14 Jan 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399303; cv=none; b=NGFCOoLbki0YC9CmVRudHm5QZWrzPNo1JXGuQyEWOn6qg3UQq77dOCZv4BrPBuqkmplo8Q/S4CKUH40AOcAoN8iJSwTqKMITz54EIBYGMnycT0SuVWz56CVJnOpi/kudTt145r8ad5BCLGzUHaBzP9Igrw94k98oGMO6i7Y4eTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399303; c=relaxed/simple;
	bh=enCvrz8y/9rxsUlw1ssbCZBDFIf1yBnbNn8Z6/4K4hA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dA0VEJPgE6OGtPdvRNSPKZtG9u6Qtkr39ArtkXvtqAPBGZQ+h+t68HUAAwyIiojzGjS97tJtvQPlzKei1TC6XR2C9O09WHdbfevh4Ol5Totuu54hYqvtkK1KjTOpyPy8xPnN7QeBmBr3jXNQkitu6vLlvc8uKKx5/H00gonqxSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QTbhI3eY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1AFEC4CEF7;
	Wed, 14 Jan 2026 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768399302;
	bh=enCvrz8y/9rxsUlw1ssbCZBDFIf1yBnbNn8Z6/4K4hA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QTbhI3eYuVO9pJXj0FPP9M9Z53GRE4eX9s7MgRSPPMH6LfCa2vPcyrbsf/sJtwCID
	 BT+gk+12FZyqsoZvMHQHzLHsyrc6Ut2vZOuB2VuMcZFd1rBiAsk9ZIfjahQDGXeh9x
	 1A8Jrm4lptla50UGAqWVu4gCqX+yO+cGkKAc4k9Py6hN5Qq11GWn1O2/wvLY8XLFwB
	 2+0MWgPfMi/U/NxKOMSPpoKczXetlS4IcWSv6DqKhVIeL40k8aH9JPcBohB7RjApXJ
	 Wx1jW3LAPcfdcH4OMkzVsVqjW/KnDuUkbSeP+5rLeHXe9qQ2oM1TSmWSRcIqxojxHf
	 i4QxvH0jplnTQ==
From: Vinod Koul <vkoul@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
Subject: Re: (subset) [PATCH v2 0/6] Enable UFS support on Milos
Message-Id: <176839929655.937923.9686904791516121188.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 19:31:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 12 Jan 2026 14:53:13 +0100, Luca Weiss wrote:
> Add inline-crypto-engine and UFS bindings & driver parts, then add them
> to milos dtsi and enable the UFS storage on Fairphone (Gen. 6).
> 
> 

Applied, thanks!

[3/6] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: document the Milos QMP UFS PHY
      commit: ed0a26aa453b6ec7faec32ddb4fb3d4360e1676c
[4/6] phy: qcom-qmp-ufs: Add Milos support
      commit: 3554ded4f02aa8e95af66911aa666b2cd192022d

Best regards,
-- 
~Vinod



