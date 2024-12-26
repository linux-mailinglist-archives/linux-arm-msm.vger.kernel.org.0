Return-Path: <linux-arm-msm+bounces-43418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 454089FCD25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 876477A0712
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA0C4437C;
	Thu, 26 Dec 2024 18:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ye+0/MZ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313F923DE;
	Thu, 26 Dec 2024 18:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735238403; cv=none; b=hs2oWaFbzN286tRdMKrqAlEFy2+EDjuaP6riuqeG9MHSaTy+pxvWcniI7hhwL7mXxHfx+kpp9tP5sOKN3iBdbapnZ4nA41WHl9sPAZ1GJOSRqWwk9zrM0m4O7V687wZgq93FiG2ZqDBdk+ss76CzuGXOouGpZI0ZL94jnZBc0q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735238403; c=relaxed/simple;
	bh=c514MMBdp+ikeCh+XTWV9xokcSE8oVrrw01/InAbK20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O91CKRZWI1d8XxEKA3Gg7sjMbr6ghEpM9qGF2xuNrR7KKFTskGHK6r9GVwC2gC6FKhG1zeBTQBNYHmQGZw8MX0Olzzg8i4RlgEdH24aZkDPiFqR2ActB3W/JGQ7cQndalKf/BqNF40pIwLPSL24qDhSgu2sn/uvKB3gtlp7e3/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ye+0/MZ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC260C4CED1;
	Thu, 26 Dec 2024 18:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735238402;
	bh=c514MMBdp+ikeCh+XTWV9xokcSE8oVrrw01/InAbK20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ye+0/MZ50DGZCnljATB2ZS0EMk+RijeAPVmp6+dwDnvOsBKgSaevX1G13aTdAyGY+
	 XcPMhiAp/s2eum3y6f+zu9/D0mN5yK5d0gHFpQlmxwLyeXbDTWC/bwlK865XfVhol9
	 QUZ2OB+MQJEJ75r7t3495A2zqsb6724FTPnkZvXfYAlYvvqu+i2Fgs+cZj6JYdUkyg
	 myUkY0cR7hONyLFWwy7Muy3QwbTwPmBLFEcrsZYj95pfYG5gWTZTGY9XepF+IdZmiA
	 5lCf8AQJybVbwCnpaNHVCO2pATTi3Ow5L5FiOvG7v9d5QSEuk6OB3tOUoOBXsZI9Pk
	 lNk6+2YSLzriA==
Date: Thu, 26 Dec 2024 12:39:59 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: qcom: x1e80100: Describe SDCs and
 enable support on QCP
Message-ID: <rldtbuqtfx32hwdeoqcohsn26chpnfczuxcu3mcrt7xy2thnwg@7qibugnhyjz5>
References: <20241226-x1e80100-qcp-sdhc-v5-0-0b28f2e13c85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226-x1e80100-qcp-sdhc-v5-0-0b28f2e13c85@linaro.org>

On Thu, Dec 26, 2024 at 01:47:37PM +0200, Abel Vesa wrote:
> The X1E80100 has two SDHC controllers (called SDC2 and SDC4).
> Describe both of them and enable the SDC2 on QCP. This brings
> SD card support for the microSD port on QCP.
> 
> The SDC4 is described but there is no device outthere yet that makes
> use of it, AFAIK.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Seems we hit a race condition, I fixed up the icc tags while applying
v4, but I didn't adjust the status. Could you please double check what I
did pick up and send an incremental patch with the status update?

Thanks,
Bjorn

> ---
> Changes in v5:
> - Switched the interconnect paths tags to QCOM_ICC_TAG_ALWAYS and
>   QCOM_ICC_TAG_ACTIVE_ONLY, as Konrad suggested. 
> - Actually enabled the sdhc on QCP (status = "okay" was missing).
> - Rebased to fix conflicts due to smb2360 nodes which were already
>   merged.
> - Link to v4: https://lore.kernel.org/r/20241212-x1e80100-qcp-sdhc-v4-0-a74c48ee68a3@linaro.org
> 
> Changes in v4:
> - Squashed the pinconf for SDC2 into the patch that describes the
>   controllers.
> - Reworded the commit messages a bit.
> - Link to v3: https://lore.kernel.org/r/20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org
> 
> Changes in v3:
> - Reordered the default and sleep pinconfs. Also the bias and
>   drive-strength properties. As per Konrad's suggestion.
> - Link to v2: https://lore.kernel.org/r/20241014-x1e80100-qcp-sdhc-v2-0-868e70a825e0@linaro.org
> 
> Changes in v2:
> - rebased on next-20241011
> - dropped the bindings schema update patch
> - dropped the sdhci-caps-mask properties from both
>   controllers as SDR104/SDR50 are actually supported
> - Link to v1: https://lore.kernel.org/r/20241008-x1e80100-qcp-sdhc-v1-0-dfef4c92ae31@linaro.org
> 
> ---
> Abel Vesa (2):
>       arm64: dts: qcom: x1e80100: Describe the SDHC controllers
>       arm64: dts: qcom: x1e80100-qcp: Enable SD card support
> 
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts |  21 +++++
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 146 ++++++++++++++++++++++++++++++
>  2 files changed, 167 insertions(+)
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20241007-x1e80100-qcp-sdhc-15c716dad946
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

