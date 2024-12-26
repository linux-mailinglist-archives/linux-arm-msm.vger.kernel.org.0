Return-Path: <linux-arm-msm+bounces-43338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3FA9FC819
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 06:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5C8118821B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 05:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AAC1547EE;
	Thu, 26 Dec 2024 05:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rLC9FyvN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B131531DB;
	Thu, 26 Dec 2024 05:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735189745; cv=none; b=L1kVebkbKfCfc2wo6jXI+iPlvXPlXPcxG6kLV6eI4zZ4EF6UbfYGxQZSK5L4+FkHrJMuI9ycffPqf+udPZUL4f43QyUcTYEGjOtfGYHK84Mb2XfssefmDsAMIyir7+LhNooUzVaTCj51Zx/VXt0NOMHuSrhvUSEVmlg7CfKyZxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735189745; c=relaxed/simple;
	bh=vbEYz7VTSc/9TiJZ9hHDACf4zMFs+jaf6mhgV00O4jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0mU5P3ZpguNhQhnsJAsXxhIU6sisXzLopa+LZ7Cp/sNhOP610vpvZJ1xMHsgqirQFMUSUOV0+nPSukXRiPX8Dsyxh3IsAVn3q1myZw5NshcAalSF1WAB/f1u4o5cca/Ie4gzVzAhhwhOf8ICIFeE33ywTcD4Xe5a5k8aomWeD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rLC9FyvN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62300C4CED1;
	Thu, 26 Dec 2024 05:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735189744;
	bh=vbEYz7VTSc/9TiJZ9hHDACf4zMFs+jaf6mhgV00O4jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rLC9FyvNEZ9Nkv0gv6iW1sx1YqhP716br9UjWB9P/LsrNIQzvkGjQdcSvMcSDWOEI
	 1pvqCy+d4Wa7aFj9AqKImFJdbT4kM7vewpL32xmewDJYqmuhteVb1WWW3IVJm3k3eE
	 4NUlMl3DEWWDQ1iU7zbgI8ZKPW0NJq+6Se0AAAl9zBZdUjbJ+mBjhsZF2OmXjyeVaq
	 kzvkiJVyDX99yKOIDMog1l4Ws76v1+8w//TLqlj/oye8xKGUxCSzDzFJATcr7fDRoY
	 p/TkyCI9lBnJNhWhNTzLKVL3SCYBNmfysigQ5BtMOT5RRRzZzH0pJx8KDr2aAn2yky
	 b5WTkdn9pnpXw==
Date: Wed, 25 Dec 2024 23:09:01 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, dmitry.baryshkov@linaro.org, 
	abel.vesa@linaro.org, neil.armstrong@linaro.org, manivannan.sadhasivam@linaro.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs615: add pcie phy max current
 property
Message-ID: <hughcvp6indpkjadvx3z3s3umkgqkbnqfp3wvle4jm4xdzkniy@e2oqjinaaa65>
References: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
 <20241204105249.3544114-4-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204105249.3544114-4-quic_ziyuzhan@quicinc.com>

On Wed, Dec 04, 2024 at 06:52:49PM +0800, Ziyue Zhang wrote:
> Add vdda-pll-max-microamp for vdda-pll-supply. The value of this property
> is from the power grid guide. It is the maximum current the regulator can
> provide. The property will be parsed by PCIe PHY driver to set the current
> load.
> 
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 18f131ae9e07..6d93ef0d886b 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -215,6 +215,7 @@ &pcie {
>  &pcie_phy {
>  	vdda-phy-supply = <&vreg_l5a>;
>  	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-pll-max-microamp = <165000>;

It seems from the driver patch (patch 2/3) that you will apply this
load-request at init and release it at exit, which I believe will hold
the regulator at HPM always.

If that's the case, why is vreg_l12a declared with
regulator-allow-set-load and support LPM on this board?

If the regulator needs to be in HPM on this board, remove
regulator-allow-set-load and the LPM mode from the regulator.


In fact, you (all of you) should remove all regulator-allow-set-load and
LPM modes from the DT until you know what that implies - and then
provide specific patches with clear description of the impact when you
add it back.

Regards,
Bjorn

>  
>  	status = "okay";
>  };
> -- 
> 2.34.1
> 

