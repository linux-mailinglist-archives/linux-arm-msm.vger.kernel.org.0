Return-Path: <linux-arm-msm+bounces-92340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOsmEIcUimlrGAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 18:08:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A553112DD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 18:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D2F4300CC0C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 17:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB6C3859D1;
	Mon,  9 Feb 2026 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbOtU+Wr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8342D372D;
	Mon,  9 Feb 2026 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770656594; cv=none; b=oZ50Jk/ZdxQyGREvsaoUx1CnuCRCRYTnfV+Hhyjg9kAq/7As8rp9cwy7Z1TH2T4NjY/SQBWNlst64dWcSzPiQ99IIfHHqI/xSEfP4qmpMeZryqSoXBnaY9NjcwfyQF5k+UW6aT9SKFPTcOcDYyxFNlK0r2PTNo9XjQBqJhlGds0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770656594; c=relaxed/simple;
	bh=1FlN9TgpQmPj8I8PTCTKarky+VJebIipTUTRMn/3hIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/kddX/PfV88kYGW7ThmQRSqjqOk6fYqLKlJJKPOkWw2yJGZh/Yi2hhau8fnJBzzh1qs94+3A4tXj5N2k9MLaV7slv+oEpqeh4Fb45yye+Wj90UYZeQsdkKuYDEzFwWH3xEfZnGAeY2OWQ+4zK6EVjM0Q3uo56TaiYNlLbora6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbOtU+Wr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF41C116C6;
	Mon,  9 Feb 2026 17:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770656594;
	bh=1FlN9TgpQmPj8I8PTCTKarky+VJebIipTUTRMn/3hIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FbOtU+Wr1aWTYmmrzFfk5lc6Cjs1UKPd3rgkhGDCIt8t0JFq+GQd5maIxkpAho/tW
	 LWeki2XsKYMeCTSLqHQpzSsnYsp867TWhzC0qD3YuwBOaQb7zRGSETc7N8761kfy9X
	 0WnhAwHdsFGuduHq1m3vW3pn5XLgTBquj9h0H9RPw7pGC04HHHowGklziC9/v5u14Z
	 A4HPIilkkaqFakyWgUqC6OKHE2pc4PGD4icy0x5Mk/TXcA5Ebt1xYs2daShegT14mA
	 8zAutYY7tqw2nuqESjPDrWZCjXXOZzsneZUypbvbYcMvD6e+6OlJVrXWCkbSK0imTg
	 G47ebwzNFKM4Q==
Date: Mon, 9 Feb 2026 11:03:13 -0600
From: Rob Herring <robh@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar Sharma <quic_vksharma@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuldeep Singh <quic_kuldsing@quicinc.com>
Subject: Re: [PATCH 1/3] dt-bindings: firmware: Add tz-log doc
Message-ID: <20260209170313.GA1401643-robh@kernel.org>
References: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
 <20260129-sm8550-abl-dtbo-v1-1-abca3be14024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-sm8550-abl-dtbo-v1-1-abca3be14024@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92340-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 9A553112DD8
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 01:46:30AM -0600, Aaron Kling wrote:
> From: Kuldeep Singh <quic_kuldsing@quicinc.com>
> 
> Add device-tree bindings for qcom tz-log. Exposes a debug
> interface for accessing and displaying diagnostic information
> related to secure code(Trustzone/QSEE).

$vendor * $firmware-component would be a lot of bindings which doesn't 
scale. This should be something cross-vendor and cross-component. 

> 
> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  .../devicetree/bindings/firmware/qcom,tz-log.yaml  | 66 ++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,tz-log.yaml b/Documentation/devicetree/bindings/firmware/qcom,tz-log.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e5c67ca1546c2d10f4c3b5979bf7b8a1a7dd2132
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/qcom,tz-log.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/qcom,tz-log.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TZLOG (Trust Zone log)
> +
> +maintainers:
> +  - Vikas Kumar Sharma <quic_vksharma@quicinc.com>
> +
> +description:
> +  This exposes a debug interface for accessing and displaying diagnostic information
> +  related to secure code (Trustzone/QSEE).
> +
> +properties:
> +  compatible:
> +    const: qcom,tz-log
> +
> +  reg:
> +    maxItems: 1
> +
> +  qcom,hyplog-enabled:
> +    type: boolean
> +    description: Indicates(boolean) if driver supports HYP logger service.
> +
> +  hyplog-address-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Register offset to get the HYP log base address.
> +
> +  hyplog-size-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Register offset to get the HYP log size parameter.
> +
> +  rmlog-address:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Register offset to get resource manager log base address.
> +
> +  rmlog-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Register offset to get the resource manager log size parameter.
> +
> +  tmecrashdump-address-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Define tme crashump DDR region starting offset.

Wouldn't 'reg' for all of this? Though I have no clue what's in 'reg' 
region.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        qcom_tzlog: tz-log@146bf720 {
> +            compatible = "qcom,tz-log";
> +            reg = <0x0 0x146bf720 0x0 0x3000>;
> +            qcom,hyplog-enabled;
> +            hyplog-address-offset = <0x410>;
> +            hyplog-size-offset = <0x414>;
> +        };
> +    };
> 
> -- 
> 2.52.0
> 

