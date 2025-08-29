Return-Path: <linux-arm-msm+bounces-71229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81131B3B550
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 10:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80AF9A03C47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 08:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39186287254;
	Fri, 29 Aug 2025 07:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7Oie+gi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBAE286D7D;
	Fri, 29 Aug 2025 07:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756454393; cv=none; b=PgwqAONfs2jHo/FVHoipTYBc8wxHRLMN4LD3IKZiMhhPNhlCXgxtxShDfPTSlf8X3W2d0qvZbEYoA+MVtkFavK9BQDf+DCfrGRfGbrHbJGVLe0v4UN2wgrNmEzAaun2F00aaNJ907z/beTQHsVxo47yQbQjjwz838tQVAvZh/6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756454393; c=relaxed/simple;
	bh=S4lynDX4uSnk0tcp2B+Ehjj3+5PiFwLfQmzoqZweNMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vdfsf/PtAJ+NXKY1E0BdKV9ZuEVbmLN+qswiuKO9lknsOW+3ZMeBDqAihn77mgvUCxjMS7Oc7fRbeW2/qGdNGnaCuk2srbkDnDLtxSb5U8KZ3jAsW0jog/5dBfDwpgw8GfqEm578ezgVS8Sv8ExrZrUTp9CTSqVi9MvQ6qiXy64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7Oie+gi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DBEC4CEF0;
	Fri, 29 Aug 2025 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756454392;
	bh=S4lynDX4uSnk0tcp2B+Ehjj3+5PiFwLfQmzoqZweNMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J7Oie+giVqVks7TsedW/oSB3e0FI7Fjq2hjOSKQzgAOKGQGdCx9+UJWbcZpbvrktn
	 v1yxEoytDTLSk67LmRqUNPf9uCjBw14+n623/xcx7tnvh2AkKe/R4LeVibbwUk/tfy
	 jPKKGZJGwEMBZsw98KjCksNqIRMxVE3l1A6a6K2wj+VifaugcBppxQ9xpkghgEXO+n
	 7ZYkZAuVOwFPOvWcQBMW7nFx9h+mhHNs1piHWgAK5RrhA6Fh5mwnL+2IgFkNAWY6qU
	 UZPTaYr009X/ltsMkULsybgAHNMd6RJg4zO5DZOp0cb59V6iQJMgZB0dOGyRcEZuf1
	 maCJcfpnIgufg==
Date: Fri, 29 Aug 2025 09:59:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rakesh Kota <rakesh.kota@oss.qualcomm.com>, 
	Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>, Arun Khannna <quic_arkhanna@quicinc.com>, 
	Monish Chunara <quic_mchunara@quicinc.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add Monaco EVK initial board
 support
Message-ID: <20250829-clever-analytic-pudu-96cda0@kuoka>
References: <20250826181506.3698370-1-umang.chheda@oss.qualcomm.com>
 <20250826181506.3698370-3-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250826181506.3698370-3-umang.chheda@oss.qualcomm.com>

On Tue, Aug 26, 2025 at 11:45:06PM +0530, Umang Chheda wrote:
> +&i2c1 {
> +	pinctrl-0 = <&qup_i2c1_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	eeprom0: eeprom@50 {
> +		compatible = "atmel,24c256";
> +		reg = <0x50>;
> +		pagesize = <64>;
> +
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			mac_addr0: mac-addr@0 {
> +				reg = <0x0 0x6>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c15 {
> +	pinctrl-0 = <&qup_i2c15_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	expander0: pca953x@38 {

Same problem as in all other recent qcom boards.

I heard that some teams in qcom have weekly meetings and discuss what
did they learn from upstream review.

Please organize/join such meetings.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Best regards,
Krzysztof


