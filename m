Return-Path: <linux-arm-msm+bounces-86400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D66CDA297
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 585A53078EF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901163491F3;
	Tue, 23 Dec 2025 17:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgSAqNdE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EE13491CF;
	Tue, 23 Dec 2025 17:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766511892; cv=none; b=gqHNAg7EV/ycU0NclLyPSeKS0L2XQ4o1jV/eC+RdNdYJF5GORyOMEO/s713+vWK8boOyxk1DYHVjpiSFBuOxXjJ4SRadaYHYo8PLScEg6CZCdw/vZCrfa+/B75KEL4jtGbeQVmGDgY9QW2CRup70St3nfsSYpw4d5Pp6PCiXuM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766511892; c=relaxed/simple;
	bh=B7kk1fNbDuaJ0RLmnK/wGum7XnzjK0H2uFMdwBbzvoY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fpBZLFj1oRulZ1AgzUkpUcqwXkEHPnpNqpjwBUDthshDjT36mSYOVkiRvBplAAG/Zus/0/AxMP2Aa+/z4FMFETYWcL2VqDP8gxAjwVrH2HzhG0YKRdEtU8xRxKE+h4gHmdKNMP84QTM6/rO7O/UVW9/K2GwaxFznuNee/onS3rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgSAqNdE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4049FC116B1;
	Tue, 23 Dec 2025 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511891;
	bh=B7kk1fNbDuaJ0RLmnK/wGum7XnzjK0H2uFMdwBbzvoY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DgSAqNdEWYeWPdXOl8vXtp473yh7fHEbN8FC1+qS8TVyjyO2ST3sIauqXt9mX/IqZ
	 X+W7nUtyvAxeMSkENSqooNfk/TrEjOUD2wjaWWuyAsqnxqYNV8zt0tmNMrsKEpSv5I
	 L74TqG/n2+O0x/qDEAy6cqzLIhE1fiIlX3/sI6rkGvrtEL0O4bZMYU+k1OdmwJZRdK
	 9EoRinx7UB4+34HLdqjP81pzoduIZM0GtOwHAz14fDbkTylrRZm6XP17tEWtNn/ODi
	 A2Tel6axY0al8wsU3J0qXkhsERz8wiCnjY11ooJkFXT7uAsS5xw4L7KaToz3tr7bvG
	 M+ZPsxlRwD0WA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
References: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/5] Add PCIe support for Kaanapali
Message-Id: <176651188789.759340.17238105488730853325.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:14:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 24 Nov 2025 02:24:33 -0800, Qiang Yu wrote:
> Describe PCIe PHY. Also add required system resources like regulators,
> clocks and registers configuration for PCIe PHY.
> 
> Changes in v4:
> - Rebase on latest linux-phy next branch
> - Add reviewed-by tag
> - Link to v3: https://lore.kernel.org/all/20251103-kaanapali-pcie-phy-v3-0-18b0f27c7e96@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Kaanapali compatible
      commit: 4968df19d5dcb22fa2b797b64eb3c2880a239e12
[2/5] phy: qcom-qmp: qserdes-txrx: Add complete QMP PCIe PHY v8 register offsets
      commit: 5359da47e066edb3fcd36c7349726913ee8628f2
[3/5] phy: qcom-qmp: pcs-pcie: Add v8 register offsets
      commit: ecc12453c8b1aabdedcd663b7e0587f372a2a90d
[4/5] phy: qcom-qmp: qserdes-com: Add some more v8 register offsets
      commit: ba13ff85d3cfb92bd0502a8f93366ddbb5d91105
[5/5] phy: qcom: qmp-pcie: add QMP PCIe PHY tables for Kaanapali
      commit: e5b4d5935f758c6d685c624343d7615d76bdc931

Best regards,
-- 
~Vinod



