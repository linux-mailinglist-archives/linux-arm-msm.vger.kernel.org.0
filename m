Return-Path: <linux-arm-msm+bounces-61326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66584ADA2BA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 18:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8700E3B0924
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 16:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4406A27CCEB;
	Sun, 15 Jun 2025 16:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIbhoEGu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146FD27BF86;
	Sun, 15 Jun 2025 16:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006380; cv=none; b=b/nUSsD6DpTZ4TTo5ePEoFMLcEYa7UuQxeTrtjyrZwLTMCfLLLnefGDyFzdd+Hz8ud7uHbrg0mJLNVH8qJCB27kFu0feWlod3FKeCmuz+OtIDfEPjDHw5vY+Y4qQLzkm/miq8aL2A6IL7PgF5tin5442mhceJenrAgUd8qIbw94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006380; c=relaxed/simple;
	bh=vX5HGgA8fC7YjZ06YgAI2G0Iz9bLuEWdLseKSEem3jM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g7bUHL9IxprNRJgHI6L5et/FAbONWJyojYqm3LsVqLqhaK+TIkUoE1qIF7cyqDqIbLRx5ky4wiIjQctNRxsC5Y8L5yv1F33uj38Gm1PCU5eupSqSRm1S4pQdBGjZjhy16Eu4Jxh/ZBtTgoatXHIXbH3pMk5EDNBGyhthaULoG6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIbhoEGu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F86C4CEE3;
	Sun, 15 Jun 2025 16:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006379;
	bh=vX5HGgA8fC7YjZ06YgAI2G0Iz9bLuEWdLseKSEem3jM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dIbhoEGu2cJUWtgIefClLundN6NQBYR/s6XRyLA5x6eah5qTnoOufS8JJ0A0r/GTH
	 3554rdwXsHPEWfc1MtI6iG/OffR4J+2kTwQOZGc7RT0Rv6SRJexDL3CkGG0m4UJOb6
	 Bs5hZUm1is6XIp5UlWmLbpnhRLmrbwKcSI64eo2uReEUdrv3rb2m3J/MgT+dqMGn31
	 a53L01h7MYNpUzIwTZ83mL8l+gqQUz1xS4nxpJmkD1aqdl5MdCDJ8VP4msh6Ff4UAm
	 15n+2fvR+jVBMHc3rELXtjDspjemffNThae+AAH/EAVb4FGRy0Jx03XLlqUIi4sgGQ
	 4IHN6T7TVDVVA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 00/10] phy: qcom: Introduce USB support for
 SM8750
Message-Id: <175000637361.1180927.2580740047031375607.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 27 May 2025 14:04:36 -0700, Melody Olvera wrote:
> Add support for the PHYs and controllers used for USB on SM8750 SoCs.
> 

Applied, thanks!

[01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8750 to QMP PHY
        commit: 439cdb309c3cf630b11661872ace09e1a7c5d630
[02/10] dt-bindings: phy: Add the M31 based eUSB2 PHY bindings
        commit: 1166a2ca0900beafbe5b6d1bb357bc26a87490f1
[04/10] phy: qcom: qmp-combo: Add new PHY sequences for SM8750
        commit: c4364048baf4878c270e94aa224bb114b445704d
[05/10] phy: qcom: Update description for QCOM based eUSB2 repeater
        commit: b0d8d731b4b0fc83bb4826a2c805f4c877c98cc1
[06/10] phy: qcom: Add M31 based eUSB2 PHY driver
        commit: 9c8504861cc4102463f31fe1f5e120a6deb15c15

Best regards,
-- 
~Vinod



