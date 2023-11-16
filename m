Return-Path: <linux-arm-msm+bounces-810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C937EE3A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 16:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38A6C1C208A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 15:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7471C3455B;
	Thu, 16 Nov 2023 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9lGiUnQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504FD34556;
	Thu, 16 Nov 2023 15:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81440C433CA;
	Thu, 16 Nov 2023 15:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700146812;
	bh=l6PrBLJDmc84ulXQqyIUcQml/OreBNZEwB2nLOYE9xQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=D9lGiUnQoS3CEz3XVhRjeaTBbQGXOyFcXarfe7yNRZxnMOqm+ClbgnZabbwm2hqxY
	 cTxzzgJ7pCXs4DoEG/f1ui2U08A9z6uayLZa60yCxY8HOZXDIuEgGIfv9kZce6LRfh
	 9rH784618/FpAxEL2rjm004HdzUebrt4Ai8Maixut+HzpsrUOz1FGuf/fwQNr14Ed9
	 7aS8XVSnlaZoailkXinAxmY2eiOF7h9KYo8x7Y26qDFcu9uddopeFnPcZKYdSUHN2H
	 rSg7tr8xzfUD6DC73yx6/MS6ZIgXIDyDDEVWKmv5uVVDA3XzpfS9n8t5vscni10j68
	 ofR8bnfDNgjUA==
From: Vinod Koul <vkoul@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-phy-v2-0-a543a4c4b491@linaro.org>
References: <20231030-topic-sm8650-upstream-phy-v2-0-a543a4c4b491@linaro.org>
Subject: Re: [PATCH v2 0/7] phy: qcom: Introduce PCIe, UFS & USB PHY
 support for SM8650
Message-Id: <170014680803.545052.6114642671955484471.b4-ty@kernel.org>
Date: Thu, 16 Nov 2023 20:30:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Mon, 30 Oct 2023 10:48:16 +0100, Neil Armstrong wrote:
> The SM8650 PHYs are similar to very close to the ones found
> on the SM8550 platform.
> 
> Only a few changes in the init tables are required for the
> UFS, PCIe and USB3/DP Combo PHYs.
> 
> The Synopsys eUSB2 PHY is the same as SM8550, so only a fallback
> is added in the bindings.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: document the SM8650 QMP UFS PHY
      commit: 8c91ef9883bfb5a6315917a7104dd1e06c85b278
[2/7] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: document the SM8650 QMP PCIe PHYs
      commit: 9e3f381986f6be1a7199587f8921cbb7e89a733e
[3/7] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: document the SM8650 QMP USB/DP Combo PHY
      commit: 685c00ac4240c1205005f617916f68b76da78908
[4/7] dt-bindings: phy: qcom,snps-eusb2: document the SM8650 Synopsys eUSB2 PHY
      commit: 330df15dab25931c9214bfa279319755d2201d7f
[5/7] phy: qcom: qmp-ufs: add QMP UFS PHY tables for SM8650
      commit: 7c4bf8cb9d40a7222bb5d641979952b196707985
[6/7] phy: qcom: qmp-pcie: add QMP PCIe PHY tables for SM8650
      commit: c954b6d347e78690f053342b2d2759c650e61a43
[7/7] phy: qcom: qmp-combo: add QMP USB3/DP PHY tables for SM8650
      commit: 80c1afe8c5fec68d9467c543551a0b2fddd463ff

Best regards,
-- 
~Vinod



