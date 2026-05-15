Return-Path: <linux-arm-msm+bounces-107730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI4+OZ7TBmqKoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:04:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 701B154B025
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE6413007358
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 08:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3AB3F9F2B;
	Fri, 15 May 2026 08:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qjy/+/gw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D3D3F7AA2;
	Fri, 15 May 2026 08:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832109; cv=none; b=sp4c8kjoCGS5FBDIjSyyLomFCzJMVKBtdo/l0HvUFBpYumLFw5adxlgI2YZCJ6FD5N/ru5qDt1M5BVbHdFiYMgqwj7ZKMMkXD6wnAt/UMe8ZCmb6LyjmUjtuGk0I7NRFO8MF1M8ioxWHyQ0QdkD6J2Vz3U6Kd9Zc/z7jTuVWYhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832109; c=relaxed/simple;
	bh=KTmdPV4qoaGGOX9f3AE5CjI1jv70P/nJEBWa67Hoo1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h75RYcLIMm/kdJSWrZHvgS99+AbjxShj68FgXQu7ye7PTuRKLX/yhLtKWLar2th5liUa9WA4pYpqcPqvpxfEesfXbFk4zO4k3JZGChgo3j+LB5+3cMkvFpOhm+tS0MwRdihYWX00KplCwF/OHma58pAt7Yn/lpR/aAPl8oy9kGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qjy/+/gw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FDFC2BCB0;
	Fri, 15 May 2026 08:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778832109;
	bh=KTmdPV4qoaGGOX9f3AE5CjI1jv70P/nJEBWa67Hoo1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qjy/+/gwa+24zOaUSNouUa570s8Xu0FyZ1rTQJ1LZv8pkw/KukdwH9KOQbVqMH81f
	 +9Prx8YkFIVD3H521Q+ceHcvXwA0swRxQ5P+ZYYNn1s4uwqhk4jygitDHKmzh3OMBw
	 vubf9xLjXch49trVYUYWGcJTe6K+G9W0lS7K/D28qwnDHrx6N3c0rYQnJWz2iyT5+s
	 JOnJpy60MflD2Lv18KgkaeTDPgupY/a/X8LdU65drlKdNYgq8QwzVVdcvd8YCW9p1t
	 CrpHCkkRGOZ458wdZNNP6uJiQEmQYrMEmsRhilMB5qIF6hti9449ZwajWHGopqYusP
	 44x7Pu3U12c9g==
Date: Fri, 15 May 2026 10:01:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Document the IPQ5210 TCSR
 block
Message-ID: <20260515-loud-diamond-bulldog-2a38ab@quoll>
References: <20260511-ipq5210_tcsr_binding-v1-1-c8d20fed014f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511-ipq5210_tcsr_binding-v1-1-c8d20fed014f@oss.qualcomm.com>
X-Rspamd-Queue-Id: 701B154B025
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107730-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 04:28:21PM +0530, Kathiravan Thirumoorthy wrote:
> Document the TCSR block found on the Qualcomm's IPQ5210 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


