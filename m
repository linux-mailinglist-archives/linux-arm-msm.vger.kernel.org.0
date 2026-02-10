Return-Path: <linux-arm-msm+bounces-92364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JLWEV6EimmfLQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:05:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ABA115E82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 22F1B3006232
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 01:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED1B26B955;
	Tue, 10 Feb 2026 01:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EI2ow6Tq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D1F17BEBF;
	Tue, 10 Feb 2026 01:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770685529; cv=none; b=CjKCjQpsbr/B7SG27WDhTbDHNFoI9FhOhs1B9iMbGmCHQuBAUrqLY1ziCSulO1l28VO50eIZId5Ey6L/nUUB1Ujo0NQHdOOeqtbTo2MOmJsgGoYN+i2O2ZDrdyYhwi5Y/Ywo5YLNUasH/oX3rps/WDNc7OTTudH+rC7iX5wZlU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770685529; c=relaxed/simple;
	bh=NZ1UpPJkKt7Y0uFrtl79h/DhcaOBliCOw0Lfi+31IJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtbTA9RIDLAdM78GioGtmsuKL7dTOXTxUk9QbTA2iL96ur9Ssolzn40SaSQxnJ0m6tcs/0Qqnw1rB6aLkUhqJ/ZPF4YKCYZmVZqy77Gxwl8v5cqjlIousr/4Unj/O5FKZQIScHg4iLHHv0La8PikYZh//bqk8hzMDHk2cI8xgDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EI2ow6Tq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0ECFC116C6;
	Tue, 10 Feb 2026 01:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770685528;
	bh=NZ1UpPJkKt7Y0uFrtl79h/DhcaOBliCOw0Lfi+31IJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EI2ow6TqStbzo1Vb5o4Yn11slfVMB/EOsSvoYbUCntZzZMs9MvRs+o+mqaX8DQaV1
	 /PCBh47WKFkOrF07Ctz0JE0uyz69fweA/j44oD7fCf7uC4/IjMDumukgQAXR1nlgnZ
	 V0Yt6VB0kun+ZK8oPHoI6tAyTzuH0cgeAoOr2SA3nLJOd1DNoGx/ZFM1I3oK0h/ILY
	 4py8a91JBsV2qB6HgP4tN45mwyCi0LgHNY3BqANVGq1V4JIxZ3jQi2dIZXb/gbVL+7
	 pc6X+MIZsaoGUwkcGZdtNTcsk7gBAEQg79pANBNEYVuJoF3ojnDMEgGP9PT+kB6qxz
	 JkKz8EWuO9VQQ==
Date: Mon, 9 Feb 2026 19:05:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	andersson@kernel.org, linux-kernel@vger.kernel.org,
	konradybcio@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G
 (taoyao)
Message-ID: <177068552739.2245926.6013795880835087773.robh@kernel.org>
References: <20260204115645.1343750-1-zstaseg@gmail.com>
 <20260204115645.1343750-2-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204115645.1343750-2-zstaseg@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92364-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B5ABA115E82
X-Rspamd-Action: no action


On Wed, 04 Feb 2026 12:56:44 +0100, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G (xiaomi,taoyao) is a smartphone based on the SM7325
> SoC.
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


