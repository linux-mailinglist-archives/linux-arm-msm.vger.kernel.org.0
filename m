Return-Path: <linux-arm-msm+bounces-89019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A7776D1F46E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 15:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2595B303094B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 14:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774FE2BE7B1;
	Wed, 14 Jan 2026 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOIhG+T8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536D429E114;
	Wed, 14 Jan 2026 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399318; cv=none; b=mVIwKx2Mv+yMH/iOnn3a5ddfQVyStrxyzVIEhkICJWc+mkh1Y7IIrfbNYY80LdZfhWuPqnB6Y+Uo5zgZsYiwhq41yTZ97SG6+G5w+UyGzCj/g4Ey/uTHpvDVuckUbAb+0/jFA3EU0r/MPPY8EjO+KiaCchIT7m3V8uGVPM0mfb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399318; c=relaxed/simple;
	bh=kJhvl3EkrS4B0d2VSCeSVXXCmsFOhMvFP2J20W/nJW4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WdqMykARm0Yan+R74TdNQaUkbYb7d7kkPvDi1EeMD/2GMhN/o7noTjVGju4ccUxRPGwPn+CvmLdzbN0XE3CVij3RoaJp/YEBJ94SoOI9HAUAClMjbwjyWKNuWjLmEwJRvO1nh7kuiTDTfqP+B1KVIqMpMkpEj2+X39khpz2CbA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOIhG+T8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CE2C16AAE;
	Wed, 14 Jan 2026 14:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768399318;
	bh=kJhvl3EkrS4B0d2VSCeSVXXCmsFOhMvFP2J20W/nJW4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OOIhG+T8Lu31VSqPSEo81r4DzfrvCUJ8Iuj5SP8MXGkRkkM2iMy+T2o60MWfSskfR
	 RTMu8aXCJWxluNabl8JiTX6GRnxHlLnCrHBdtSiTNJL8gR7iTi+t73WbRdAtJX0p4d
	 x/gHVyGiM7ee8ffelzXQcAqRXnBa7iOXslDhBUMMvtCl+EB6XGMfTkZ48Vgz8IRANN
	 mqjTKQYHzm4LwkV4xR6y4sMB7Hwpw6Jh5wrfpZa2caA3Vav5zsTmkROQvkyl4+PTfz
	 G2c32phJuOC01ddzzZDLlgq15+GWGAiOhSoKHaq+1xtJeg+i+dgc/GqDXNL9mrE+nt
	 Wr5UCYnib6uAw==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, martin.petersen@oracle.com, andersson@kernel.org, 
 konradybcio@kernel.org, taniya.das@oss.qualcomm.com, 
 dmitry.baryshkov@oss.qualcomm.com, manivannan.sadhasivam@oss.qualcomm.com, 
 Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
In-Reply-To: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
Subject: Re: (subset) [PATCH V4 0/4] Add UFS support for x1e80100 SoC
Message-Id: <176839931330.937923.4419261616983851594.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 19:31:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 06 Jan 2026 21:12:03 +0530, Pradeep P V K wrote:
> Add UFSPHY, UFSHC compatible binding names and UFS devicetree
> enablement changes for Qualcomm x1e80100 SoC.
> 
> Changes in V4:
> - Update ufs@ with ufshc@ in SoC dtsi [Mani]
> - Retain complete change history in cover letter [Dmitry]
> - Remove "jedec,ufs-2.0" compatible from ufshc dt-bindings
>   and SoC dtsi files [Krzysztof, Mani]
> - Remove RB-by tag from Krzysztof and AB-by tag from Mani on
>   UFSHC dt-binding file as it has changes and needs re-review.
> - Add RB-by for QMP UFS PHY dt-binding [Krzysztof]
> - Add RB-by for SoC dtsi [Konrad, Abel, Taniya, Mani]
> - Add RB-by for board dts [Konrad]
> - Link to V3:
>   https://lore.kernel.org/all/0689ae93-0684-4bf8-9bce-f9f32e56fe06@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP UFS PHY compatible
      commit: be9d2cf10b46bc2c177aa9cb27b71d665d1e0e7e

Best regards,
-- 
~Vinod



