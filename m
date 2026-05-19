Return-Path: <linux-arm-msm+bounces-108402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHo4H60eDGqoWgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:26:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C988579FE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33E6630243AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFED3E1200;
	Tue, 19 May 2026 08:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LF2ml0jg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCC439C62F;
	Tue, 19 May 2026 08:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179048; cv=none; b=LNEfa8EZ/qW3RM8uMJNffEsrvjOpkz/XdvZe/LNFb4sSWThHXrbp/Q6dmCJ9gzpHISQ1qMf5L46pW54uCvJzlUNLNiKftSEO8km0jmuIgzCPs8NsSPcF1iYLezuvqxSdpbm99SZcV5q45KdegF05BPNGraCIiMX0RdqgZjBObws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179048; c=relaxed/simple;
	bh=9CCkUm3jEDCsFO9m5pAfY2otbiWfdOJ8ZyEKe+9OYFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdgrmRJXj0MGy9OKFAMkw+jNg7+L0g3KCszfkfZGsmHftjwHxMnL1fut8BdyV9j9NA7ncXc5zJKBLceNfclGTwRFTTPEo6yVe0z+splulsw3pE/HutAc5FxjubCzcTtQoqmqrnhM8wPjvwqwAoXqrgGB9iyCsWhGbHs6Vhqc2NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LF2ml0jg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA6BC2BCB3;
	Tue, 19 May 2026 08:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779179048;
	bh=9CCkUm3jEDCsFO9m5pAfY2otbiWfdOJ8ZyEKe+9OYFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LF2ml0jgrc7glDulAIfPDcx2LAyqMsPk1qAXQbnA7w/Qd7mDBOPXyvGZsy4j3N1Cc
	 UxZYI0fwWmv9CMVDfop8yZtjw4EvkYL6vKSUXy96DSrQKJ0T9TWR4MAs3Bb94dBJ0J
	 LwK6fkfqaKoQbNhe6iwqFKqpAN8jwIThK11r1tY8ageVfJy3wXXOHkbsEfxRhlZNXU
	 PIOSR8aQKEtJN3TDHXU9HhcTCRmIygB3NFP1uxeaZJ71T2pEONDXeiLvd3TGHeDX2w
	 mQNDXhJ6PkEF1yeGc1arYoLGejWGrUdDAcKtO8FNvuHhhfhxQFmMlFDbsMcIVNrQW/
	 YNcYudwgoyX1A==
Date: Tue, 19 May 2026 10:24:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <20260519-industrious-wildebeest-of-action-eabf20@quoll>
References: <20260518110435.16262-1-blfizzyy@gmail.com>
 <20260518173039.20592-4-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518173039.20592-4-blfizzyy@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108402-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5C988579FE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 11:00:39PM +0530, Ajit Singh wrote:
> +		sdm-skin-thermal {
> +			polling-delay-passive = <0>;
> +
> +			thermal-sensors = <&pmk8350_adc_tm 3>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		xo-thermal {
> +			polling-delay-passive = <0>;
> +
> +			thermal-sensors = <&pmk8350_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +	};
> +
> +	vcc_1v8: regulator-vcc-1v8 {

Drop node, unused.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		vin-supply = <&vcc_5v0>;
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vcc_3v3: regulator-vcc-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		vin-supply = <&vcc_5v0>;
> +
> +		gpio = <&tlmm 113 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&vcc_3v3_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vcc_5v0: regulator-vcc-5v-peri {

Drop node, unused.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_5v0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		vin-supply = <&vph_pwr>;
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};

Best regards,
Krzysztof


