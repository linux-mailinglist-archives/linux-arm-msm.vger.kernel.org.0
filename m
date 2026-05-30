Return-Path: <linux-arm-msm+bounces-110379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NxyMNPZGmqE9QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 14:36:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2609960CD7C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 14:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20988302659D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 12:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842A93AC0FA;
	Sat, 30 May 2026 12:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhdovVW1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FF8369D6E;
	Sat, 30 May 2026 12:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780144450; cv=none; b=HvSrYsuy3/Uy4bx7jHAOflfJ1uItvOIRtopjE/GPPgjfENoiiDfr5WESeDMqrM8zNEfULqsVw0FV6/T1cQYX2e87KeS7fYEx0k1vztbwJLskoIzzqREA6GBDDNup5JDjbjyuuNJCx/8az1wdTpKOEDzVT2IuRNE0uvC6NrGjz30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780144450; c=relaxed/simple;
	bh=wOJmFdNftqS+GQHtzstTgN9VYhidAKXLhVYbHxC5jRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcVn2YBEzS5sgw8twxF5P71ojb2aYeREVEazkztfycf9cUhJADohopEYG8x28ij/w6SIH+ch2lGEZDipnTWYC/MQQ8YMwB7j4j2OPGEnRMBhDcF8aMXNw72myGmr790H1WloSublmJ/v13aaGo7PvTk7l6l81qSrRHARAmHUuy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhdovVW1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3701F00893;
	Sat, 30 May 2026 12:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780144449;
	bh=tUUwWoV95jfPZcfMUOFNCFZmKQsy3guUqU++k2IZgZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OhdovVW1yii1GYnkHVpVXXOSTK4vEiQz7tLegvBXUeTPAhoD8tH2Ui/lz6yRG4F8/
	 TzI43xBY2ZuPC8KjK6533naMB+LG+zLyX8ZKWbjQWr/w362fZoOsWAlOaRtW1lQGPu
	 gUBpxX5bYrH8U2+GfQW5URan9uqo1+B4j5Cwo9GtQCD7icehXDRvWevcRn5tambs5/
	 XYz7qlOTmDI08F4AaA4MxBk9KHB0WrEPiKDqZZSej5OyHVglpb1SjTv3iB9VhNSC+m
	 vVMOzSkzDkOD9XLYEBirjUYkQ6DH2+31Y4Tl8H+C4ptvM0nNnNQmMNZNHapKDV3ap6
	 /L59AIO4uEx8A==
Date: Sat, 30 May 2026 14:34:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com, quic_hbandi@quicinc.com, 
	rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com, dishank.garg@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: bluetooth: qcom,qcc2072-bt: add
 bindings for QCC2072
Message-ID: <20260530-funky-mackerel-of-current-878e2a@quoll>
References: <20260529175342.3363935-1-yepuri.siddu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529175342.3363935-1-yepuri.siddu@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110379-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,bootlin.com:url,qualcomm.com:email,quicinc.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2609960CD7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 11:23:42PM +0530, Yepuri Siddu wrote:
> Document the YAML binding schema for the Qualcomm QCC2072 UART-based
> Bluetooth controller.

Where is the rest?

Also:
A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Unlike other Qualcomm Bluetooth chips, QCC2072 requires no external
> voltage regulators. The schema inherits common Qualcomm Bluetooth
> properties via qcom,bluetooth-common.yaml and serial peripheral
> interface properties for the UART link.
> 
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> ---
>  .../net/bluetooth/qcom,qcc2072-bt.yaml        | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
> new file mode 100644
> index 000000000000..8e2f15a75d62
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/bluetooth/qcom,qcc2072-bt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCC2072 Bluetooth
> +
> +maintainers:
> +  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
> +  - Rocky Liao <quic_rjliao@quicinc.com>
> +
> +description:
> +  Qualcomm QCC2072 is a UART-based Bluetooth controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qcc2072-bt
> +
> +required:
> +  - compatible
> +

Looks heavily incomplete. Devices do not work without power for example.

> +allOf:
> +  - $ref: bluetooth-controller.yaml#
> +  - $ref: qcom,bluetooth-common.yaml#
> +  - $ref: /schemas/serial/serial-peripheral-props.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    serial {
> +        bluetooth {
> +            compatible = "qcom,qcc2072-bt";
> +            max-speed = <3200000>;

Also incomplete.

Best regards,
Krzysztof


