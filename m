Return-Path: <linux-arm-msm+bounces-43918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF4FA00F3F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 22:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB8D0164896
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 21:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDBB19E999;
	Fri,  3 Jan 2025 21:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHTSXcuh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3E61C36;
	Fri,  3 Jan 2025 21:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735938335; cv=none; b=eSc0+k4xP+vr/YO4LEggOAZqaBo+BJvPhScgQmXY7d5+gWcGpE5ock1jiMsz9t1kBH88FrAC0BRmDIN3pcGlrNZios58wEIR6vWzNEQ+9YwrWxbedKCqtsQTiS89ExLo50UIBSMpOMSMtYeRmwp1dnSrj4HOSsJ7s2jdYYjPvtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735938335; c=relaxed/simple;
	bh=PaIwlgSyLG2dCgbk37fGNt16J+VdY8YgCXdYQp69ZrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=S8Q34gp3fJZz2nG8Q7Lr4fR0dRk0s/nwcEFBsAK4o0J25W0uSW4nwtaNgHX7V4gXfVXFmXG5OMZCMkCf5atmLdmToYycFz/2O2Cldzk2frmnyTH9+EV2ayZuepOEgWczPUpEs69YbQKUv/kkfSHbBFTDBItiZlru7ZQkc3+fVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHTSXcuh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE84C4CECE;
	Fri,  3 Jan 2025 21:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735938334;
	bh=PaIwlgSyLG2dCgbk37fGNt16J+VdY8YgCXdYQp69ZrU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iHTSXcuhDlYbmTGjnHfZFeuV0R3FiZ7rhhtbHTWzMApNmdRG76NyZYRx8yoiycjDX
	 RPAdPzWWfMzjScIZaBBkYMzn82z+F5SdKOL3CEqsYOqHQITSe35ELtmYNwn6IvB0MK
	 UHnyC/U6dV7PEFIi70KCL+W1y1lDSbmaombRhke3TD+OkM6RySLyiSjCpL4pbeibZL
	 CInneksH1q0qTzsOi6aAx//QNAfzf/JXxk0ETyxQfQjWBfpYL8pflab48viLVH01Yq
	 57hFtGDtAdf2LCsORp/U0Aj3YPKhq4PRz7JCM1SjAF1fjgEXoiie0c2QRfGYR8z1Ci
	 Y3GZt56x8UEWA==
Date: Fri, 3 Jan 2025 15:05:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/21] arm64: dts: qcom: sm8250: Add PCIe bridge node
Message-ID: <20250103210531.GA3252@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321-pcie-qcom-bridge-dts-v2-1-1eb790c53e43@linaro.org>

On Thu, Mar 21, 2024 at 04:46:21PM +0530, Manivannan Sadhasivam wrote:
> On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
> for each controller instance. Hence, add a node to represent the bridge.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 39bd8f0eba1e..fe5485256b22 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2203,6 +2203,16 @@ pcie0: pcie@1c00000 {
>  			dma-coherent;
>  
>  			status = "disabled";
> +
> +			pcie@0 {
> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;

Hi Mani, most or all of the patches in this series add this
"bus-range" property.  IIUC, these are all Root Ports and hence the
secondary/subordinate bus numbers should be programmable.

If that's the case, I don't think we need to include "bus-range" in DT
for them, do we?

Bjorn

