Return-Path: <linux-arm-msm+bounces-86399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 902B0CDA255
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8828B3013737
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4BA3128A3;
	Tue, 23 Dec 2025 17:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k40Xmgns"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA1C199237;
	Tue, 23 Dec 2025 17:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766511863; cv=none; b=KQplbySebHKPfeAeCZD+x6ZPButq+s2VmCDt8vULCzuKvodjGe8qjx10rM2jHIeaz8iY/OsbTO8QDuBAm+8md+Ek2Ie+dMrNEkJmRP7T8+ALjxkjle8Pj1NMesc8ZORsKjCtRiUefzQp43oTfC2T6QWQIS9NiD0uxGJn78Ub4QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766511863; c=relaxed/simple;
	bh=9WXabfp5pMYZMhxZhMEvt3+Q8tDLq01QxcspbG8gunQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FfhcZjZndSl2gEm+pDo5cj+WK6LdlA/u7mHtrGHM+4krjiyFPyOuHv088LBUqwbGiDruASkvarBpHzj7PnCffy9hRtXvxuKulhvI953q/AgB0QegwwUKtyTMAfEHzgcpyneKyz2oYEBxNaxh4HfbH1WltC84b0QnkjeZtDSrezA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k40Xmgns; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11E9C113D0;
	Tue, 23 Dec 2025 17:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511863;
	bh=9WXabfp5pMYZMhxZhMEvt3+Q8tDLq01QxcspbG8gunQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k40XmgnsVaWCxing7hg9ejSS2FEsM28q//aDws3hh2YeFidSOmP513N8Dp7amknPb
	 hGIjaPJDFmj9lG0/Ow7zq2wxnocmMf74aM6qsN3lu5yjiaia8f9rKAif7fnyxR96CX
	 NX0SV1qTGqUN0Tpo7b5kM8xICkHl7UYEu9nJ5Vxk5ACFUbr0mYEut6hqobj4aj66fz
	 0ozqDWPRDGnyTs+qmob0qw4n5CSwZciehe4+HnpCPG2z5WGlmKug2Yu1gtyoGBw23p
	 PeS+SAdgWT83v0X6O/Vszs6hE1yRvp03iGI87z9dHsSMoXBCe7cYYFbKdnmj8zVWPp
	 P2pdyY/mNFi5w==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251103-kaanapali-pcie-phy-v3-0-18b0f27c7e96@oss.qualcomm.com>
References: <20251103-kaanapali-pcie-phy-v3-0-18b0f27c7e96@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/5] Add PCIe support for Kaanapali
Message-Id: <176651185961.759340.1420380637615043254.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:14:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 03 Nov 2025 19:08:12 -0800, Qiang Yu wrote:
> Describe PCIe PHY. Also add required system resources like
> regulators, clocks, interrupts and registers configuration for PCIe.
> 
> Changes in v3:
> - Rebase on 20251017045919.34599-2-krzysztof.kozlowski@linaro.org
> - Add reviewed-by tag
> - Remove [PATCH v2 1/6] since it was applied
> - Link to v2: https://lore.kernel.org/all/20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com/
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



