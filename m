Return-Path: <linux-arm-msm+bounces-57989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 726A9AB7789
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DE9A7AB43D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A87F296D2D;
	Wed, 14 May 2025 21:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jbj0yXI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B5122D7BF;
	Wed, 14 May 2025 21:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256645; cv=none; b=HCP2nG4d6lYnxEmob7Qu+lTxNF3ioGjR5h5zFPzhHzB7Gx4H0yLLnzaufJyptWn+4o3pahF2RVLDIobiHCx2+wga1Gq/mWIyHFRm/CwUucRnDEGwD6AkCJzyXWXM29tuhYHc5GCuDqQ0DhMVd5JxSCT9uM4iRfUjxAjbd5l671Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256645; c=relaxed/simple;
	bh=YK2Wb13IA5O7C1R7NhXWTVh8yHOiRFimDI/mEuiaCEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OLWQuXGaIBd99DSbDwM5UuUQ4rBbzszChqcfaHOYCCDMaRwVcttxG7c35DPaPqsZZCachQJzFT+3+9cSPvEECFUZuuufu5GLgGv+9C+gzRMhMUhROtqKxPk1MgmkVCa8tF9crIsiBECx6wuEh+LlA5GCamfb7ofuhQ7NS5AKrlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jbj0yXI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3DCC4CEEF;
	Wed, 14 May 2025 21:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256644;
	bh=YK2Wb13IA5O7C1R7NhXWTVh8yHOiRFimDI/mEuiaCEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jbj0yXI/7OP2DOSP1VfieJpqGo0fa0+5tV7dX1z1ec5A7p9bSkwlqJJBFm2qP2kyg
	 AbHBB/DlRjNjmTw7cwHLhVLhRVmllRXs66Hkn5TWxvjf/CS49jdxg05HAUm3uOgK6h
	 GyAMbvGPbjiE581AW408ptLx1VB+loNpdfCJGkSrnORL5Y5DW+DrBO6kC6VzDDv94W
	 LTgSAGQqRZjyY/HhaKdNGteHrpIELggEQVquGOHURiunyTrG8GcbiH+jPSdLnawvtZ
	 6lgeB7U+zVPw37msVFE5oPbaqAwHYizRrnokgNmz07EsTMntdNocAM61v+0o0vNkPq
	 uf3PoSChfqTtA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998-lenovo-miix-630: add Venus node
Date: Wed, 14 May 2025 22:03:43 +0100
Message-ID: <174725663055.90041.2422560165813953879.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425-miix-630-venus-v2-1-cdfca385a0c8@oss.qualcomm.com>
References: <20250425-miix-630-venus-v2-1-cdfca385a0c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Apr 2025 21:26:13 +0300, Dmitry Baryshkov wrote:
> Enable Venus on Lenovo Miix 630 and specify corresponding firmware file.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8998-lenovo-miix-630: add Venus node
      commit: 25f185524c4722b2c18e2746c7c4aeb2107d571f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

