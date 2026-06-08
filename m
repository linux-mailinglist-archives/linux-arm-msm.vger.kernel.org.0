Return-Path: <linux-arm-msm+bounces-111967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ay7yKMcgJ2pBsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 22:06:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB74765A457
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 22:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Je8f5NCE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111967-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111967-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 572723011771
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 20:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8D8395266;
	Mon,  8 Jun 2026 20:06:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EA12F39B5;
	Mon,  8 Jun 2026 20:06:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949185; cv=none; b=eyxHrJqa8w/fhMmvfvhb0hkAZq0sOtt2LDX59OhJ87QW8BxLNttSokevlzuThT4u6tFtoLQvHKHDqoYn9J55+oNvNPKC1+z5d6XIbwJMz5yQWRi1Oj5nPCHxoedPZaJCpDZLEZN7VWkoSjqdJknLdB5OQ4kepm04n8xIv+6AF6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949185; c=relaxed/simple;
	bh=JrXs+tGiY3xKwQKeOwR8BSSl7fQyYyCuApIf+iVWtDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYbS3Axq6ZctS2SolWlFNvL/++O+eW33FBhvnWzvvKW2Aj/36gOqpVmPGqwaaQZRENP5QGnXisbpaoDILzJTApr+num8atYfHh6qGX2OkQpX+beUD7JeVjRnC4OG7cE3aHyq+i2yaw7Byqty0aCegL1JRbtLevtPGZMp2xFIOn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Je8f5NCE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B961F00893;
	Mon,  8 Jun 2026 20:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949184;
	bh=/16MXuPq2Ir5apRNIQjRucdXdMzC6TZraT+bxU+vx6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Je8f5NCEP9ppoCNHr4EasJJjlfLrzVe9yU/TCNegJxJADLkd5aoJWHZ2BcGTrrxvS
	 TzLIm3D+h4er3LTN9FioIxkecqY4T52+BRHeh/U3WfzaiwKd5+38eIW/JpV88Kms2G
	 90r3Eefq4j1erEFdo8SwNSLhyZs1I4VFcuH0M/MPVdugB9PJwqZo6IgYMa6EZ4SJJb
	 3IrB+LnEp770Za0cLVYd3v97C7pOnrgzDVkbUDuMyAvQWBoD2bzpGD21gCSMbU95Fp
	 LRcF2mZ4PHoDrsanl3o4P1FkE6a1R6eNrTyn9GmyMhc93SZiEMUqBWTpcfGQI9mtTO
	 YSXL/h/SzkwFg==
Date: Mon, 8 Jun 2026 22:06:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_wcheng@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3
 PHY
Message-ID: <20260608-nippy-devout-potoo-0b0656@quoll>
References: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260608103344.2740174-3-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608103344.2740174-3-varadarajan.narayanan@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111967-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,quoll:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB74765A457

On Mon, Jun 08, 2026 at 04:03:44PM +0530, Varadarajan Narayanan wrote:
> Add dt-bindings for the USB3 QMP PHY found on the Qualcomm IPQ5210 SoC. The
> IPQ5210 PHY is compatible with the IPQ9574 PHY, so add it as a fallback-
> compatible entry using a oneOf construct rather than a plain enum entry.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 46 +++++++++++--------
>  1 file changed, 26 insertions(+), 20 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


