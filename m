Return-Path: <linux-arm-msm+bounces-89882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH3vH/zob2lhUQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 21:43:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4124B81D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 21:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 53D3E884866
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F8A397AC7;
	Tue, 20 Jan 2026 19:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4ytq5VT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA2839341F;
	Tue, 20 Jan 2026 19:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938581; cv=none; b=T9Hhl2p2tF4Ol4F+w7yvfhaE/9BT9oTbxjmKocmmu8oHF7kvVOWAyNsxFeTueVT/8EZmAitIIYqftsNSMHWV+eXnqekhDAu3hbMPfIQ4xpf3MFHEcEw+TepagBznP3GElxJJkjpG2HFkwuwJyqCuZO9EJEQY5JpfnVKqSPkSKnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938581; c=relaxed/simple;
	bh=tsWM3d8iCmhp/RJs7MDgtxaiXZPebNGaqNIDAPcjfF8=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nBf7tFNNS5bpfqOhkOmBJxiOuDzwuNrwOLg5egSXkjHfI/AjLI+F1SRMMYVFqgNV9f6wGsVSwyEjuT4oOT54H9tktqx9zq44Ggghv28A7dynYJy3/ua/MSV4+96zMbXJwaMrOsghi9Y1safpSJS8Zlf1q+dsCN2bmVIRHsKLNgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4ytq5VT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48313C16AAE;
	Tue, 20 Jan 2026 19:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768938580;
	bh=tsWM3d8iCmhp/RJs7MDgtxaiXZPebNGaqNIDAPcjfF8=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=Q4ytq5VTWaZ3xt7D1EYAwUwA92owOwswff7/a8MsB/Zbd2cn/WdHd05QQneYLZQ5O
	 AKR8mBWapfeHqnmmcu+BdINnqKY4coZNidCAgBaaomZvPm2+NBpq8g4yahUkN95F2x
	 o64vwsUiF3iYpK+Vm3Hc/zaVkWJNwljdy+dH1nlEVIJvsspWDZPJplyT+RlymeIAaG
	 BXfw3HP1YDtMKYfYAxMrPVbEf2g8bQF7RPUL8cP+DZ/CC4kRSsV6ykGugP/oQRlaJD
	 ItXjqpRT4ixgBevEoU6pz3MjK5zklPwLSyVrhm+rywSQsXduA5pperiu9Wkyi5fVGF
	 TN+VTIl6QWe3w==
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Jan 2026 13:49:39 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
To: Petr Hodina <petr.hodina@protonmail.com>
In-Reply-To: <20260119-tsc3400-v1-0-82a65c5417aa@protonmail.com>
References: <20260119-tsc3400-v1-0-82a65c5417aa@protonmail.com>
Message-Id: <176893840646.630967.6863112889558802076.robh@kernel.org>
Subject: Re: [PATCH 0/3] iio: light: add AMS TCS3400 driver
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89882-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.39:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,protonmail.com:email]
X-Rspamd-Queue-Id: 1E4124B81D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 19 Jan 2026 18:19:05 +0100, Petr Hodina wrote:
> Hi,
> 
> This patch adds an IIO driver for the AMS TCS3400 color light-to-digital
> converter.
> 
> The TCS3400 is an I2C-connected RGB color sensor supporting RGBC and
> RGB-IR measurement modes, programmable integration time, selectable
> gain, optional interrupt-driven sampling, and regulator-based power
> control.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
> Petr Hodina (3):
>       doc: add Device Tree binding for AMS TCS3400 light sensor
>       iio: light: add AMS TCS3400 RGB and RGB-IR color sensor driver
>       sdm845: tama: Add AMS TCS3400 ambient light sensor
> 
>  .../devicetree/bindings/iio/light/ams,tcs3400.yaml |  54 +++
>  MAINTAINERS                                        |   7 +
>  .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |  36 +-
>  drivers/iio/light/Kconfig                          |  11 +
>  drivers/iio/light/Makefile                         |   1 +
>  drivers/iio/light/tcs3400.c                        | 505 +++++++++++++++++++++
>  6 files changed, 613 insertions(+), 1 deletion(-)
> ---
> base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
> change-id: 20260119-tsc3400-68a91d8c1355
> 
> Best regards,
> --
> Petr Hodina <petr.hodina@protonmail.com>
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


This patch series was applied (using b4) to base:
 Base: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


Warnings in base: 229
Warnings after series: 235

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260119-tsc3400-v1-0-82a65c5417aa@protonmail.com:

arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: tcs3400_sensor@39 (ams,tcs3400): 'ams,rgbcir-gpio-vdd', 'ams,rgbcir-vdd-supply', 'ams,rgbcir-vio-supply', 'vio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/light/ams,tcs3400.yaml
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: tcs3400_sensor@39 (ams,tcs3400): 'ams,rgbcir-gpio-vdd', 'ams,rgbcir-vdd-supply', 'ams,rgbcir-vio-supply', 'vio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/light/ams,tcs3400.yaml
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: tcs3400_sensor@39 (ams,tcs3400): 'ams,rgbcir-gpio-vdd', 'ams,rgbcir-vdd-supply', 'ams,rgbcir-vio-supply', 'vio-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/light/ams,tcs3400.yaml






