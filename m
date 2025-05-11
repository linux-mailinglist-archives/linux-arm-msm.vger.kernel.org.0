Return-Path: <linux-arm-msm+bounces-57554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2E2AB2C11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 01:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CA927A9454
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 23:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB8925B1F6;
	Sun, 11 May 2025 23:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tvnI17UX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0532905;
	Sun, 11 May 2025 23:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747004511; cv=none; b=B5fcu4TA6UkYtngmegvl/vOeXeAF/ER9rzJ4wnbi2SktfiA8nmfnkbXOgzM/s9d6zHR8Hq5pK8C/qL2nTOFQT1v5zKzkuAM+3tV3bEAqyLI30+MnaDMqehDqga4eCCG4rYcm4kUqPnVvlsJl31jI3NEDK9UTgViyw7loTUe+fuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747004511; c=relaxed/simple;
	bh=xiwSh4pCNWvKiL0xzNNB9/s7png26xOOUgBZ2O5ViTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ivcDQDDRA9INVzGQv99O7xGSmO7/FIVxt39jYr5w8LAtwazinym7TU+8TJJWO1qXvAmonNxiSF78Vqgm+kdzuR8tY5L9YPe30+AhkNy1Dr3uT2A6tlSr3GkVNcW3kU4HmGavGFfzEapD7wi4vsof+ueSJ9fE4U0tknfeiDp/hQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tvnI17UX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60B9C4CEE4;
	Sun, 11 May 2025 23:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747004511;
	bh=xiwSh4pCNWvKiL0xzNNB9/s7png26xOOUgBZ2O5ViTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tvnI17UXesWSZMd7wU2kukJ/zKNuXbsXsQ6OF65uK5Xno0nhILuh+ciNP2REeSBaA
	 2qP2RcdZtbWXymhsjd8CEPSePdxBWyc/Tnju/cFL9yFGwwpNKBQuVR0nqNKxmPYRlW
	 EuSltVEwsfeOHda7pUdRk7TElrcH6kIaVlVUFzkgXPCGOZsOlCjfFGBp3hErfzoKXa
	 jEAZnVnofpVGW45WM5xW1aa3AyMkwCN28N9HqO2iNEQOiMHEbsYqOjjt0vSUnHf2bf
	 /s4+m4mg922cvsEYyxIAeTGuL0NAO4fpSw8D2yUK8ksUCr5SDNfyUXlNUNw+R3StVq
	 QJEZ3DhLPiTLg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-*: Drop useless DP3 compatible override
Date: Sun, 11 May 2025 18:01:35 -0500
Message-ID: <174700447990.10930.10617167872502545615.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509-x1e80100-dts-drop-useless-dp-compatible-override-v2-1-126db05cb70a@linaro.org>
References: <20250509-x1e80100-dts-drop-useless-dp-compatible-override-v2-1-126db05cb70a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 09 May 2025 10:08:52 +0300, Abel Vesa wrote:
> Back when display support was added initially to CRD, and we used to have
> two separate compatibles for eDP and DP, it was supposed to override the
> DP compatible with the eDP one in the board specific devicetree. Since
> then, the DP driver has been reworked to figure out the eDP/DP at runtime
> while only DP compatible remained in the end.
> 
> Even though the override does nothing basically, drop it to avoid
> further confusion. Drop it from all X Elite based platforms.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-*: Drop useless DP3 compatible override
      commit: 28bce181daf3ba87d414f75ad9f2a680f69f2c25

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

