Return-Path: <linux-arm-msm+bounces-26840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D416939877
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 04:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BAEA1C2199B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 02:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B5F13B7A1;
	Tue, 23 Jul 2024 02:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUBbTU7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11B51DA22;
	Tue, 23 Jul 2024 02:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721703453; cv=none; b=RrnIiobd8dVXmFHHiyEAeHVy8Nk1dv3i4anrL4Ua3hbUO4Tx61oH8k2wqTkMpnd7pD4TLM78PrbBxM7lziO8gwub7ZOu7+tmLtU0mWnhiz0SD7tBkfmFJEVuyXHjdCfNbt1KMtWDxA0slj5NAFRPMSdydy9bO3aWr9YxVa1Qsio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721703453; c=relaxed/simple;
	bh=xHGeQVmisuPGHf8llb2dE/jfNDnDq1Ltx01L+xpb6MU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=d0a82gLmoLDvyKYF1RIBK/rckWxUyeUV/f5GK8YSBA0lmKWDSswGbIosZMH6n/1mU4xQIsCUx0JIqvY8ruFa+djFyoyqkaGoOIm8NObowPgTRVQVmXpdxoK5D1U7BtYF15IQsoA0Mjwx2Uz111IstI4FFK0TJPzROmci3J/QPY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUBbTU7f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFDBC116B1;
	Tue, 23 Jul 2024 02:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721703452;
	bh=xHGeQVmisuPGHf8llb2dE/jfNDnDq1Ltx01L+xpb6MU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=tUBbTU7f5JZX0q12kG5PmR7igIGaPso3qx3LzYX5IZdHycEtpUjNQ2e4DqWKiRirc
	 t4XOhW4LfRftgeMqqiYZdN2yk1pXJbpjFbmZcj0X5+gDyd9qxLvQBP4j469IT1f5Rd
	 oTCMh6PS2uwbxdOIFK6ZHY3oR1r2ii8qWru0ntiSifOOkUMo/ao9cAGgln5imM0b/f
	 AuX+cvLOfqYZp1De0Fws5E/QVe+sHF0AFRH5WhcT/qMWDi0jF+BmalCz/aYqJ0OoOh
	 2exkBj7qIbCmfcbfL8LeONofnfqZiE7UjxMlx+yRZuaVD1cie7ApUyBB1cOiCzrwu+
	 A3Gaf8Woi+YNw==
Date: Mon, 22 Jul 2024 20:57:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240719131722.8343-1-johan+linaro@kernel.org>
References: <20240719131722.8343-1-johan+linaro@kernel.org>
Message-Id: <172170324360.205121.298903694803259916.robh@kernel.org>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100: PCIe fixes and CRD
 modem support


On Fri, 19 Jul 2024 15:17:15 +0200, Johan Hovold wrote:
> This series fixes some issues with the current x1e80100 PCIe support,
> adds the PCIe5 nodes and enables the modem on the CRD.
> 
> The fixes should go into 6.11, but the modem support depends on them so
> I decided to send everything in one series.
> 
> Johan
> 
> 
> Johan Hovold (7):
>   arm64: dts: qcom: x1e80100-crd: fix PCIe4 PHY supply
>   arm64: dts: qcom: x1e80100: fix PCIe domain numbers
>   arm64: dts: qcom: x1e80100-crd: fix up PCIe6a pinctrl node
>   arm64: dts: qcom: x1e80100-crd: disable PCIe6A perst pull down
>   arm64: dts: qcom: x1e80100-crd: fix missing PCIe4 gpios
>   arm64: dts: qcom: x1e80100: add PCIe5 nodes
>   arm64: dts: qcom: x1e80100-crd: enable SDX65 modem
> 
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 110 +++++++++++++++++--
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 125 +++++++++++++++++++++-
>  2 files changed, 224 insertions(+), 11 deletions(-)
> 
> --
> 2.44.2
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/x1e80100-crd.dtb' for 20240719131722.8343-1-johan+linaro@kernel.org:

arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pci@1c00000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#






