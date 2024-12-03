Return-Path: <linux-arm-msm+bounces-40036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F4A9E1718
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 10:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB881B2A048
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 08:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93FF1D90B6;
	Tue,  3 Dec 2024 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjKxZikH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9011BDA99;
	Tue,  3 Dec 2024 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215087; cv=none; b=K4jw/yILsyidaV3kuGwGxhLTRoiy7Ky0X4CGp93qcIZ4jsV2ogqrRY2BGbiS4Mpgx0iSa2hl5JCySF9U0fJM8ZvNQxLMCBV4my4OJowQA2hL3xQN8zzsw6YclGOqvHr/6uGyGWX/gwcFT4QwKsDutx0Bom9pxTDgUsHmmelb73M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215087; c=relaxed/simple;
	bh=EEN1Cbtnu30oJhZa4Ggbw/HZvQhEXZ3X2p/PEbvDRik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4coKOxqhNfUStl9XuUfFhj9Y+xL3hPIUDcpEm0n4MU16msuZlJ0DqIx1U2JFagXZoiisUguO/AWMqwkHN5FVE78TrgM8Xo3Kn1lBBUbNNYoeoNEzu6O4sQjgBXE3OWTgjPlNQwYmpEAECInlLYwZCiMXpJvkaKgrDxiqzqXxNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjKxZikH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3800AC4CECF;
	Tue,  3 Dec 2024 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733215087;
	bh=EEN1Cbtnu30oJhZa4Ggbw/HZvQhEXZ3X2p/PEbvDRik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jjKxZikH8LatyV5Wx4aUTq+2qMt84/c3J4n537fV+WZKC5M0ZGp/lLi5+/SxyPc2m
	 chaiYsNErlQI0STtql8m1WmIzR1kDYCFPeNl+stOIf/R/sO/zu6CEJRKKfw+lGk4FL
	 2zyQ9fVawJySolcZMxjS35RdXNB3VbQ4d4kI5NYX8iXEFFYF7W10Bt6NJjihUSfP6m
	 gXAEWzurzpoljl104gOPlLm4ER+JVo832M349LGsTDhC6VqQVsuvDPBirfyGuL0ttk
	 Vw748zOIo62BpCktNl4+ZCOfRoEZv2ohldoAhgGHP67v/U/QrzWlfN1VUscatF4UVE
	 6MTUYZk/PnIBA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tIOPz-000000008Ne-05rI;
	Tue, 03 Dec 2024 09:38:03 +0100
Date: Tue, 3 Dec 2024 09:38:03 +0100
From: Johan Hovold <johan@kernel.org>
To: maud_spierings@hotmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: x1e80100-vivobook-s15: Use the
 samsung,atna33xc20 panel driver
Message-ID: <Z07Da9S-t_od-6Cd@hovoldconsulting.com>
References: <20241202-asus_qcom_display-v5-0-e0d3752ff71f@hotmail.com>
 <20241202-asus_qcom_display-v5-1-e0d3752ff71f@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-asus_qcom_display-v5-1-e0d3752ff71f@hotmail.com>

On Mon, Dec 02, 2024 at 07:18:11PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> The Asus vivobook s15 uses the ATNA56AC03 panel.
> This panel is controlled by the atna33xc20 driver instead of the generic
> edp-panel driver
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>

> +&pmc8380_3_gpios {
> +	edp_bl_en: edp-bl-en-state {
> +		pins = "gpio4";
> +		function = "normal";
> +		power-source = <1>;
> +		qcom,drive-strength = <2>;

Please use the Qualcomm drive strength defines from
dt-bindings/pinctrl/qcom,pmic-gpio.h here (e.g. PMIC_GPIO_STRENGTH_MED).

> +		bias-pull-down;
> +		input-disable;
> +		output-enable;
> +	};
> +};

Johan

