Return-Path: <linux-arm-msm+bounces-20504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9278CF7A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD5AC1C20F02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A834369A;
	Mon, 27 May 2024 03:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuZ2Kty0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1FB3FB9F;
	Mon, 27 May 2024 03:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778862; cv=none; b=P78FCIxEy1MX/ezGsN9bNBKPSWWeRwf9NrP63XhlVMKrjwKG40fcNSpXa8iSME553OQPAt6UO37pdvz5zCbwQamZNFE4vqISzPpKAoUKahvaMfKpXcjSuzPxUizid0lS3RF1aQGM3Fs18K3lvD8TlH2uIOx3ssPBpSADyyIjRr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778862; c=relaxed/simple;
	bh=Y2kvM7LZ2t8bh+QFhR7I3RBDLz5h93DW3TB2SFNmbwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CCci748nDOtiInmoBNx2n0x6M75p/XFxZ8a7+3DGYJ4SQRrw4Ob99DliD09BUw6WDwIiCdTJ4b6q72jXD2v5xmoXkJT1pRY90W5SzWgLv+gxTxfj/8NFUAGIDhcj5yJYoSBytCqk29fID1msiR6nhVVnAfruTPSJk53LL5ebGdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EuZ2Kty0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9628EC4AF09;
	Mon, 27 May 2024 03:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778862;
	bh=Y2kvM7LZ2t8bh+QFhR7I3RBDLz5h93DW3TB2SFNmbwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EuZ2Kty0cduXc+9GBE60D52nI5GozRBKx61tyJyfpWCrQ6tXh8CpJDOViQdL1BpAG
	 ckjpr5qkcu+H9eBtlghyJSZP4N2El7n6bwbaG86l+pnILu0h6EGJxSM+vx8e6DMJrx
	 ZxS2Ta8EE2ziH1R7tQ8i2UCop7n9O2HG1jtj2F1fwaxgtVYi20jI+bjf5u9rKfx/4a
	 TrAdE4+XAPPQ1x9svjq8ZiQhJy8cCHwHYB9lGVK9UjqnjYTlPP9Jb5GnSoq0Pc1wCa
	 /8ECW0b+VkqLnsSZs2GaTgZvmokmGy/fgSDA2bnVWcW5VrE+W/OxmWzKrZEQn5UmVP
	 u82bt9g8kQYHg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Rob Herring <robh@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH v2 00/21] Add PCIe bridge node in DT for Qcom SoCs
Date: Sun, 26 May 2024 22:00:30 -0500
Message-ID: <171677884197.490947.9756729539444770432.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
References: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 21 Mar 2024 16:46:20 +0530, Manivannan Sadhasivam wrote:
> On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
> for each controller instance. Hence, this series adds a DT node for the
> PCIe bridges across all SoCs.
> 
> There is no functionality change with this series, but the PCIe bridge
> representation in DT will be necessary to add the DT node for the client
> devices like the one proposed in power sequencing series [1].
> 
> [...]

Applied, thanks!

[21/21] arm64: dts: qcom: sm8650: Use "pcie" as the node name instead of "pci"
        commit: 2f2120a15251097f9afcab5b4db7894ce03b2933

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

