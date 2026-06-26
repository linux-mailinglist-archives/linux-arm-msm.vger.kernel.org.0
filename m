Return-Path: <linux-arm-msm+bounces-114653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2FZ4FGN2PmolGgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 14:53:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A11436CD322
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 14:53:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hY44oIO9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114653-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114653-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9026B3034BD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EB53B71CA;
	Fri, 26 Jun 2026 12:53:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C16F3F58C4;
	Fri, 26 Jun 2026 12:53:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478414; cv=none; b=ushTMxfhU1mHI/BfVRu4ktuBs7hJ1fWHKseQVfC5xvvvzwBIcaKaqZMQYwjBHtxXQ8CV6y3ol2CZc41WgWUPWDqmfURzGXilBqM2SQQc1vmQPamNSeCUrhqYate7PoP22nY0s1WukicoeeWik8n1kqUWhMZqz67EqKXaHjOMTvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478414; c=relaxed/simple;
	bh=ylGkz0ljor3cC8CfKfI7ou8Mru2PLeKoLNChukkb/T0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=poJYYhtDlUsLVyRIhxOwDPDdGXn5ELD5GTHqYB0A0M9gY0lohxWMViWjNi0yelpeCC3Syc/kR3Uc1s6Iyn+0Rom/VWRu8vj1OvPxtozZQpxBNWIZYrPQE1SfWbUjpSeLCFozpZSasSn+BBOGtYXBxS/FSt9ekMiq4EIKCskU7do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hY44oIO9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD4E1F000E9;
	Fri, 26 Jun 2026 12:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782478411;
	bh=inqiLlFzC3EqKHKd6BLqFXojis+b17gbXMWe4FkxZmo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hY44oIO94vh1PwMC1h0FesTuo705xZn5QvE/zYqD0tTFvNyL8xV900uDNhW8TSq4B
	 dvtoRtQ7oo5c1gZY+SehF6qxMKQ15SYbYNoN3S7BHfQge8c3DfO44YWkG7ccbJ/W3O
	 UnoJ5NjddoucUuaY7YNBPn2l3DAGbQ/t2PipCMCGYrx9v8pwdeg4hXB1ggb1qwa8ft
	 8jJfEyu8Hlnk+Si2MPLYd8AXls78rtFtbArTYgtHByryPElT/iT1UgJf0tHyCxfrZ3
	 PC3SyLpriS1ysoKcjSWLj6vNBzWwNebUFy+zjtjNeeIwtPf4fK/M5WohlsEWS/1K5i
	 M7NAc6Yux4xFw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, bjorn.andersson@oss.qualcomm.com,
 Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
 chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
 chiluka.harish@oss.qualcomm.com, Nikunj Kela <quic_nkela@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] Enable SPI on SA8255p Qualcomm platforms
In-Reply-To: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
References: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 14:53:28 +0200
Message-ID: <87v7b5foon.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114653-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:quic_nkela@quicinc.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mkorpershoek@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkorpershoek@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A11436CD322

Hi Praveen,

Thank you for the series.

On Thu, Jun 18, 2026 at 14:36, Praveen Talari <praveen.talari@oss.qualcomm.com> wrote:

> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
>
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
>
> The SCMI performance protocol manages SPI frequency, with each
> frequency rate represented by a performance level. The driver uses
> geni_se_set_perf_opp() API to request the desired frequency rate.
>
> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
> is obtained using dev_pm_opp_find_freq_floor() and the performance
> level is set using dev_pm_opp_set_opp().
>
> Praveen Talari (4):
>   spi: dt-bindings: describe SA8255p
>   spi: qcom-geni: Use geni_se_resources_init() for resource
>     initialization
>   spi: qcom-geni: Use resources helper APIs in runtime PM functions
>   spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms
>
> .../bindings/spi/qcom,sa8255p-geni-spi.yaml   | 63 ++++++++++++++
>  drivers/spi/spi-geni-qcom.c                   | 83 ++++++++-----------
>  2 files changed, 97 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml

Tested on top of linux-next-20260625 with my Ride SX (SA8775P) board:

/ # uname -a
Linux (none) 7.1.0-next-20260625+ #3 SMP PREEMPT_RT Fri Jun 26 11:53:34 CEST 2026 aarch64 aarch64 aarch64 GNU/Linux

With spidev_test, we ping the on-board mercury codec and get a valid
response buffer from the codec (b6 49):

/ # spidev_test -D /dev/spidev16.0 -v
spi mode: 0x0
bits per word: 8
max speed: 500000 Hz (500 kHz)
TX | FF FF FF FF FF FF 40 00 00 00 00 95 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF F0 0D  |......@.........................|
RX | B6 49 00 13 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |.I..............................|

Tested-by: Mattijs Korpershoek <mkorpershoek@kernel.org>


