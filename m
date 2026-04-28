Return-Path: <linux-arm-msm+bounces-104871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL+WGtpQ8GlNRgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:16:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B69C647DF83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10455302BDE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 06:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA242D0610;
	Tue, 28 Apr 2026 06:16:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66F73A1B5;
	Tue, 28 Apr 2026 06:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777357015; cv=none; b=pnhcbCaCMpYlEWCCzfjvURu8MvkyMKF/aDntRGY1cz2dq6qwYz6PL7wIdalZaDJjD2yYvXDXZyQHnSDdgatarpyntlSSq/A2QfSJy80+dH6CEcL26Jwyq68Jhh1TPnWeSUz1Vmaf9pYxCayYI1CVPnRjGWzkMtwx/x2si4xG+d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777357015; c=relaxed/simple;
	bh=hvM2Q4TQe2NMYsC3w07qoTDzh3tdOWhRG+Qh8HoK73w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfdIcTGx/iGedanbexRObTPGR250uggSxCBbVEGufsPQ1lBEuBUX1i6eNuro8GC/g4DQAFglMJU8fGGs+m7LGu5Ham4IldhcZ4VkWGbyPfc1DQwMmUgUgW1qj45f7hX5iT0h922G2+cQkO69Z6toRrn6LrT1lHOOvzqj+zztrzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.192] (ip5f5af76e.dynamic.kabel-deutschland.de [95.90.247.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2B5A14C4430D2F;
	Tue, 28 Apr 2026 08:16:35 +0200 (CEST)
Message-ID: <abde8036-4f8a-4056-84ee-0237b37a5a1a@molgen.mpg.de>
Date: Tue, 28 Apr 2026 08:16:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: monac-arduino-monza: Add Bluetooth UART
 node
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
 jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20260428025652.662502-1-shuai.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260428025652.662502-1-shuai.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B69C647DF83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-104871-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[mpg.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmenzel@molgen.mpg.de,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.987];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,molgen.mpg.de:mid]

Dear Shuai,


Thank you for your patch. gemini/gemini-3.1-pro-preview found a typo in 
the summary/title and commit message [1]:

> This isn't a bug, but there's a typo in the board name (monac) in the
> subject line. It looks like it should be monaco-arduino-monza.


Am 28.04.26 um 04:56 schrieb Shuai Zhang:
> enable bt on monac-arduino-monza

Please elaborate, that it’s UART 10, and how you tested it – including 
the low-power states.

> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4..092ca0b59 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -21,6 +21,7 @@ aliases {
>   		ethernet0 = &ethernet0;
>   		i2c1 = &i2c1;
>   		serial0 = &uart7;
> +		serial1 = &uart10;
>   	};
>   
>   	chosen {
> @@ -454,6 +455,16 @@ &uart7 {
>   	status = "okay";
>   };
>   
> +&uart10 {
> +	status = "okay";
> +	bluetooth: bluetooth {
> +		compatible = "qcom,qca2066-bt";
> +		max-speed = <3200000>;
> +		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;

Next comment [1]:

> Should this node also include a clocks property?
> The device tree binding schema for qcom,qca2066-bt explicitly lists clocks
> in its required array to specify the external low-power 32.768 kHz clock
> input. Omitting it will cause dtbs_check to fail.
> While the Bluetooth driver treats the clock as optional, missing the sleep
> clock on Qualcomm platforms typically prevents the controller from entering
> low-power sleep states, which can lead to increased power consumption.

And this looks valid. From 
`Documentation/devicetree/bindings/net/bluetooth/qcom,qca2066-bt.yaml`:

     required:
       - compatible
       - clocks
       - enable-gpios

> +		status = "okay";
> +	};
> +};
> +
>   &usb_1 {
>   	status = "okay";
>   };


Kind regards,

Paul


[1]: 
https://sashiko.dev/#/patchset/20260428025652.662502-1-shuai.zhang%40oss.qualcomm.com

