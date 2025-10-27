Return-Path: <linux-arm-msm+bounces-78997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A423AC0FA00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 18:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D17524EA754
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 17:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F7831578B;
	Mon, 27 Oct 2025 17:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0aIeD7H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BFC2D23B9;
	Mon, 27 Oct 2025 17:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761585961; cv=none; b=nnH5sh0WpqSO1+6ccli+TudvCUWWrMWMVkRA2Me/mlEfcruuSe7yqiPiTyTHIvZ6QQa/nEWvxJAcLK2qApmebfa6W0x7ypwr+Q6bgr6SSqUTgf3Qf9Fl3Bk/0GFAF1f1rJbc96Auz87gqo+yhS01U5+V1egsDBNqR9hc2CXVwms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761585961; c=relaxed/simple;
	bh=wD7HUE/w+36qJT00srkAtWlKdKG6Y3KVTganlRqWHwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYzPza1Zj5cym0NhVc6qkasy6fbGJpQglHwR7AaM7UgWNZgUBs+SkHYcAQNM8966gg1OCa56Hgxp1Zt86oB+rcwyYof/vc6uuR/7NTd1zBQSO4dr4iNoGvG/7uCmfpVFmrYpqDkWxdn7tQAlKA3lhm8UbtoZfVFedqTvrN63a3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0aIeD7H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98522C4CEF1;
	Mon, 27 Oct 2025 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761585961;
	bh=wD7HUE/w+36qJT00srkAtWlKdKG6Y3KVTganlRqWHwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e0aIeD7HZV6GlKrdjGzuciKufd2xox77a9PQWeCniGvRRwQtqPq7DE1jOBBxngqfc
	 YpCvqjVEmWpqMj/qB81tdD4Ex09qipQSmB5OQy411on9DRbOfezF7SpZ9zSopsBIbj
	 Fg0+S72d/AzvDU3JzmF9lygn+72iAkOjhqqCgWRXz1+4KTdj7aJ08KwtNPe0cAYq7M
	 fMTDGEnWLBGanFvp4IS15JIjkz+LjZPt9RTSPE/eGcGWvYbcNMXTHe6RgMAbM1wQTB
	 AR6/Bgx8RBl0ACoRlgqTiTW0Tl1aqLtYu/pO14iyeQ7KKF1modUF24brxsItTxa1k7
	 OaI+UtPmTEq+g==
Date: Mon, 27 Oct 2025 12:28:54 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Add RTC node for PMM8654AU
Message-ID: <kdufgqkfpe6sw2bpcxe3yjihj5hpsyilk7sid6ndyyukq5ozwc@sj7zphcrgjc4>
References: <20251015-add_rtc_node-v1-1-601c9663422b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-add_rtc_node-v1-1-601c9663422b@oss.qualcomm.com>

On Wed, Oct 15, 2025 at 07:12:34PM +0530, Rakesh Kota wrote:
> Add the RTC peripheral node for the PMM8654AU PMIC,
> which is controlled via the SPMI bus.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>

Subject says this is for the EVK, but patch changes the generic Lemans
PMIC definitions.

> ---
>  arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
> index 1369c3d43f866de9d8cd5cd4985241b99c0a0454..4eda7043b851f363d0bf053587fb1f5edae0c4cd 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
> @@ -142,6 +142,13 @@ pmm8654au_0_gpios: gpio@8800 {
>  			#interrupt-cells = <2>;
>  		};
>  
> +		pmm8654au_0_rtc: rtc@6100 {

6100 < 8800 so this should be one step up.


But, then it won't merge, because
https://lore.kernel.org/all/20251017-add-rtc-for-lemans-v2-1-0aaf174b25b9@oss.qualcomm.com/
already added the RTC node there.

In other words, please search lore.kernel.org before posting patches, to
avoid sending the same patch multiple times.

Thank you,
Bjorn

> +			compatible = "qcom,pmk8350-rtc";
> +			reg = <0x6100>, <0x6200>;
> +			reg-names = "rtc", "alarm";
> +			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
> +		};
> +
>  		pmm8654au_0_sdam_0: nvram@7100 {
>  			compatible = "qcom,spmi-sdam";
>  			reg = <0x7100>;
> 
> ---
> base-commit: 13863a59e410cab46d26751941980dc8f088b9b3
> change-id: 20251015-add_rtc_node-13490b702486
> 
> Best regards,
> -- 
> Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> 

