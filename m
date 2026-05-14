Return-Path: <linux-arm-msm+bounces-107589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFzVE23CBWpMbAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:39:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E15541C33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EADAA300D1EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2333AE193;
	Thu, 14 May 2026 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTvRpM8m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CF3371CEA;
	Thu, 14 May 2026 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762346; cv=none; b=Ke0zvj5nx7Rp00lo1tLm2gCfUcpdQi0LSqgy4dLFedPnwOFuhPVLz7DCfcxkNoWy/EZ3fljjR5P2ZW6IYONq62t1QDel6AcUTMDTpHsKNL/WCyM3+kK8ds3VoG+MkrXTuu32WWEldUjCjXjUD1wg/OoDlO6m1PCXlt4oKAN8NTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762346; c=relaxed/simple;
	bh=POrPysSV9eR4uGERcjpXWWNDTI1hHqPiXelGKH+Dlgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzDPp5fHA4UpTWhqWXxUoS4eN6uWWPWhMdr9FD/4/b/tUCNnc6Iydf36smZW61cPSJiGgjYfsAhJR6H6vqhXXuwbCSfJ9wvRGSJqZzQAXq1vMlf9lbaehHfZosbQD/xJmfFzoC5fju7wRyYQie+RmhjCZmrsD8IIrGLdbXR6E00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTvRpM8m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F60C2BCB3;
	Thu, 14 May 2026 12:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778762346;
	bh=POrPysSV9eR4uGERcjpXWWNDTI1hHqPiXelGKH+Dlgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTvRpM8m5yg1o9tmC2kSQRWm64GVFY+9AlcjpIoyzV5oiOzn4iVGBb/c9veO9G6Mm
	 2KlFtz+UdSBVCJskdJN/rwWdbUwKrpMTlKcpXmNWb3fMzCH6z0PeODneTpGMe/Z6Nu
	 hj1mpo92dq5jTHWgyyFLHvbiTlJT1ZuI75Rsre+vaBoqYiwyNfzQ0ASLy3GeobXbEO
	 IXc7OQuqggIGr1Jy5N4Lh5Y8i7BpNbqdtU9Q5yeKMzd5hOi+DehjSr7o17jlovf4W7
	 TqBVu3ICWiqcbzdKasOsI8mLZFYw+QTDcp5KTTRYDYJLyaUSvLXZEzh2dBYARloDbQ
	 TSjQbMJKcYyiw==
Date: Thu, 14 May 2026 14:39:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: watchdog: qcom-wdt: Document IPQ9650
 watchdog
Message-ID: <20260514-spicy-rare-jaybird-6edb2a@quoll>
References: <20260511-ipq9650_wdt_binding-v2-1-dca22892d3d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511-ipq9650_wdt_binding-v2-1-dca22892d3d3@oss.qualcomm.com>
X-Rspamd-Queue-Id: 99E15541C33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107589-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,msgid.link:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 08:10:23PM +0530, Kathiravan Thirumoorthy wrote:
> Document the watchdog device found on the Qualcomm IPQ9650 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed the commit message title
> - Link to v1: https://patch.msgid.link/20260511-ipq9650_wdt_binding-v1-1-d2779e756bf7@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


