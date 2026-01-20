Return-Path: <linux-arm-msm+bounces-89892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGAoIL38b2mUUgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:07:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 476654CC17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2475092CB85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 21:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715A63D1CD4;
	Tue, 20 Jan 2026 21:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNCvNBL3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DC43BC4E6;
	Tue, 20 Jan 2026 21:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768945520; cv=none; b=Bw+Wx9DIGZFITqAGngJwxlkP0bZQBJGsZcUyBteRmvhNc62JExgB1t/oDMjdwcOFMw/NMW0aaPLaxtWZF7/MsvTgLKd//oOKQT9iaiVmPDg77h83NUGWkcaaMkD3j9W7AMbWzXwlmYUMd2Se2BuyV4INc46IEI1+g7iXZm1GpVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768945520; c=relaxed/simple;
	bh=B/Jpd2h10wvWa+lrJ6oaIxQzQ53idOkFruEhSsWvmd4=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=f0293+sa7kWt9T7ytzk9NV8sSAY2LJSKQeH4mzlZONKPiF0wzIXOjrAi4k8/NAn3Ayjbbma0gH3bLtgTS0nGHjl0IChn8pfpQ5kuHujViNC7Swu3DAc0ENBPpcVXydBPDWK2lVfFeFw8FZtRy37Ydeb4Pk2BnBJ7cied1s5WOFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNCvNBL3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD51C19421;
	Tue, 20 Jan 2026 21:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768945519;
	bh=B/Jpd2h10wvWa+lrJ6oaIxQzQ53idOkFruEhSsWvmd4=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=PNCvNBL3rplmrx3H378LbvSJ7Cqd20YVOmWRxWmtxYOXkmKJo3oKdfynLXcvW78Ik
	 cJ+tvz6pBkcaA1ZR7f3RLJ8MglXUnpBJZpsjJAHD2JdjDC3GLnbUrWNQlQjFBQr6G5
	 XYWaoQDOIQSipph2yePrN4npMNrLYq0e2+ECZeYMugtNzSK6XpCC/8i1SHMSV45fpN
	 KhvTLe6WphISgjyE4XEeYSsClVInCna6H38wcrgLmgYaK7xo51K3hoMOopAlbSeDNv
	 S+l0COi8I2cRyv4NExoQyqv6A2NJhdEcSfHyLdJfVRXcWIz3YbMywA7K6nxkXpLAic
	 QjpOAHza0SL8w==
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Jan 2026 15:45:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Taniya Das <quic_tdas@quicinc.com>, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-clk@vger.kernel.org, 
 Kalyan Thota <quic_kalyant@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 Val Packett <val@packett.cool>, cros-qcom-dts-watchers@chromium.org, 
 Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Harigovindan P <harigovi@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
Message-Id: <176894531206.1201519.7083808409439106818.robh@kernel.org>
Subject: Re: [PATCH 0/3] SC7180 MDSS core reset
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-89892-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 476654CC17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 20 Jan 2026 12:19:24 +0100, Konrad Dybcio wrote:
> Add the missing reset for the display subsystem and wire it up, so that
> drivers can consume it.
> 
> Compile-tested only.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (3):
>       dt-bindings: clock: qcom,dispcc-sc7180: Define MDSS resets
>       clk: qcom: dispcc-sc7180: Add missing MDSS resets
>       arm64: dts: qcom: sc7180: Add missing MDSS core reset
> 
>  arch/arm64/boot/dts/qcom/sc7180.dtsi           | 2 ++
>  drivers/clk/qcom/dispcc-sc7180.c               | 8 ++++++++
>  include/dt-bindings/clock/qcom,dispcc-sc7180.h | 7 ++++++-
>  3 files changed, 16 insertions(+), 1 deletion(-)
> ---
> base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
> change-id: 20260120-topic-7180_dispcc_bcr-f7ac25c21f89
> 
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


Warnings in base: 429
Warnings after series: 164

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com:

Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb] Error 1
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-idp.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb] Error 1
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
FATAL ERROR: Syntax error parsing input tree
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb] Error 1
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb] Error 1
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb] Error 1
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb] Error 1
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
FATAL ERROR: Syntax error parsing input tree
FATAL ERROR: Syntax error parsing input tree
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
FATAL ERROR: Syntax error parsing input tree
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb] Error 1
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb] Error 1
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb] Error 1
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb] Error 1
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
FATAL ERROR: Syntax error parsing input tree
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb] Error 1
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb] Error 1
FATAL ERROR: FATAL ERROR: Syntax error parsing input tree
Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb] Error 1
Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
FATAL ERROR: Syntax error parsing input tree
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb] Error 1
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
FATAL ERROR: Syntax error parsing input tree
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb] Error 1
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb] Error 1
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb] Error 1
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
Lexical error: arch/arm64/boot/dts/qcom/sc7180.dtsi:3224.22-42 Unexpected 'DISPCC_MDSS_CORE_BCR'
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb] Error 1
FATAL ERROR: Syntax error parsing input tree
make[5]: *** [scripts/Makefile.dtbs:142: arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb] Error 1
make[5]: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.
make[4]: *** [scripts/Makefile.build:544: arch/arm64/boot/dts/qcom] Error 2
make[4]: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.
make[3]: *** [scripts/Makefile.build:544: arch/arm64/boot/dts] Error 2
make[3]: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.
make[2]: *** [scripts/Makefile.build:544: arch/arm64] Error 2
make[2]: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:2080: .] Error 2
make[1]: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'arch/arm64/boot/dts/qcom/' not remade because of errors.






