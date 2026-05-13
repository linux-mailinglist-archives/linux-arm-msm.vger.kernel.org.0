Return-Path: <linux-arm-msm+bounces-107472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJIDB5TOBGr0PQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:18:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A96539C78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8349F3039704
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090043B2FEA;
	Wed, 13 May 2026 19:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSEh8ebP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206793B1009;
	Wed, 13 May 2026 19:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699571; cv=none; b=Ik00sltpuJN/T+5P+yjHvQvnLagvsJLQwPbrRQ8TNznLUC7Vitd09ygCfoRQLUK5+y2i8lrJh1+yjdN2/Th8uqaKbfCBuzMMK6Y+OJmfc46IynVA0N6wkgSvex1P7RONzuf0LVqw5lkBbmF4u8i4s8BaiyOgtBnTXeG20BMWgCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699571; c=relaxed/simple;
	bh=ByO3UDk1bD7UWyiAS+/7bd2l/UItToX1RFnexJVVuBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaH0z1YG5oLL48P5XasSfDIPkKrHq/e4luNUMuq6ogu0KmiEOp48PZbCf/w0kqLN2euyBtyfwrR/2daGWnJLEHTkKXgCqqm4fmQsqLqJXLLkKp9vLtKqT1IYQfoyAu6MyrWh17ZfDiTN9D/eeZCXf887PjsuUMhxBAzhy2tjvvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSEh8ebP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B321C19425;
	Wed, 13 May 2026 19:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699570;
	bh=ByO3UDk1bD7UWyiAS+/7bd2l/UItToX1RFnexJVVuBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tSEh8ebPPoDvLCOivTGQDD8UQC5ue9skRt3JrfoTA0akFw3dOfbuxpHQCw7HA5Fqt
	 lB4PhZNnZosJJVyIi32Oy47qxcdy6fjvmotJP6MPAGewetYNPlKleLjLOckHLNRBcj
	 jB0gmJv0Aj/mvztLiYYFhsLICOmOyJWoOORpYDwaF1VHEDpZRBx9/QUpgU3YKle8Jd
	 w8e9viTEtG4MmNMGzOOE6TM2Jhg2RuWfnhTV9HnnUQrMNcBBwav16nsRAz16SQA1fZ
	 xC68DodgS3DpMu/oP9s9VSm5R4fThueU5fl5P4PLFX48E4gk7sSzuQUgqSIWeWlMKy
	 5T4qGMwQexIXg==
Date: Wed, 13 May 2026 14:12:46 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Elson Serrao <elson.serrao@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Enable eud support
Message-ID: <agTMzwEX1Nw-dZht@baldur>
References: <20260512091422.1395490-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512091422.1395490-1-akash.kumar@oss.qualcomm.com>
X-Rspamd-Queue-Id: A0A96539C78
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107472-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:url,0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.1:email,88e1000:email]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 02:39:26PM +0530, Akash Kumar wrote:
> Add the EUD controller node in lemans.dtsi and update the USB HS
> endpoint routing on lemans-evk to pass through EUD instead of linking
> the connector directly to usb_0_dwc3_hs.
> 
> Wire the OF graph endpoints between the connector, EUD and DWC3 HS
> controller to enable the EUD path on lemans EVK.
> 
> This change is part of series "Improve Qualcomm EUD driver and
> platform support" and has been validated on the Qualcomm Dragonwing platform
> (RB8 board), confirming successful OpenOCD connectivity to the EUD
> interface. For detailed usage instructions, refer to Qualcomm’s Linux
> kernel debugging guide:
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>

Is this based on the work by Elson at
https://lore.kernel.org/all/20260501170635.2641748-1-elson.serrao@oss.qualcomm.com/#t
?

Help Elson to conclude (get merged) his efforts by code reviewing and
adopting the improved bindings before reposting this.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 12 ++++++++++--
>  arch/arm64/boot/dts/qcom/lemans.dtsi    | 26 +++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index c665db6a4595..96d316867c0e 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -55,7 +55,7 @@ port@0 {
>  				reg = <0>;
>  
>  				usb0_con_hs_ep: endpoint {
> -					remote-endpoint = <&usb_0_dwc3_hs>;
> +					remote-endpoint = <&eud_con>;
>  				};
>  			};
>  
> @@ -510,6 +510,14 @@ queue3 {
>  	};
>  };
>  
> +&eud_ep {
> +	remote-endpoint = <&usb_0_dwc3_hs>;
> +};
> +
> +&eud_con {
> +	remote-endpoint = <&usb0_con_hs_ep>;
> +};
> +
>  &gpi_dma0 {
>  	status = "okay";
>  };
> @@ -985,7 +993,7 @@ &usb_0 {
>  };
>  
>  &usb_0_dwc3_hs {
> -	remote-endpoint = <&usb0_con_hs_ep>;
> +	remote-endpoint = <&eud_ep>;
>  };
>  
>  &usb_0_dwc3_ss {
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index fe6e76351823..a8ab11681476 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4003,6 +4003,32 @@ opp-384000000 {
>  			};
>  		};
>  
> +		eud: eud@88e1000 {
> +			compatible = "qcom,sc7280-eud", "qcom,eud";
> +			reg = <0 0x88e1000 0 0x2000>,
> +				<0 0x88e3000 0 0x1000>;
> +			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +			port@0 {
> +					reg = <0>;
> +
> +					eud_ep: endpoint {
> +					};
> +			};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					eud_con: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
>  		usb_0_hsphy: phy@88e4000 {
>  			compatible = "qcom,sa8775p-usb-hs-phy",
>  				     "qcom,usb-snps-hs-5nm-phy";
> -- 
> 2.43.0
> 
> base-commit: https://lore.kernel.org/all/20260501170635.2641748-1-elson.serrao@oss.qualcomm.com/
> change-id: Improve Qualcomm EUD driver and platform support

