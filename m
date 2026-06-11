Return-Path: <linux-arm-msm+bounces-112777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wr1ZEH7WKmp9xwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 17:38:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B58267321F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 17:38:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fYzhtRuY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112777-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112777-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C17DE3265101
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 15:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA964183D9;
	Thu, 11 Jun 2026 15:35:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E681B428842;
	Thu, 11 Jun 2026 15:35:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781192148; cv=none; b=iFI9bGeMEeLKjdUKiA6BA3d3ogDoBGInhX/uuc4wwcsE68xr44rY1nr//UHVuT5YjZytuA6uQ46L0NItP8QoGs3wJLtkodX8qUTIXdaNdojKjVssKH5QYMnEcQ7Ctg3NuTf3CNJSILvG6GcVYIkTmIPleLy8Fieyl2rOkJB435s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781192148; c=relaxed/simple;
	bh=efC1ixYMBEGZnG16VJ818bD+9q8EyNhzSEjsq7Yms70=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QtJS9s6/cIgk202HJMnoIk4+x61DsGjkZoda/k2Cmq3U+qRQncIvbdDci7KDWVQfp9ZRh/2uBONmURBBOqIx1zihOJNmZd05F9EA5hxu85yZWGTgy9eyXr7Ynzb87Ak5U6fpYK2zaft6DeqeEgP6FH7DJX9Nqi0oZ5Bmp1SQRlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYzhtRuY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3751F00893;
	Thu, 11 Jun 2026 15:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781192145;
	bh=E24s/V0gP4pvIVYXL0IxO3RudIxFGgl7ueNQ5LXIy+k=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=fYzhtRuYXY1nC5cxz6JrTldD2vkeA0uuqS846tXbE1yFizXlO1kAU6MxOD4briwe8
	 JmUCvVQislDbrwWR1OQ1Vr08MudIb0qsQKH8ueZ5tJTBI1ugGhBpY6YJDAqG4Ztf2J
	 yDRpCisOnqfZZy7ZN97veJfWj7X9CePp2kfyfEZ/i9MIZwtvzhAmksgurmaz5Zj1l8
	 rYwTIS27ouuk2WRqPtMD2WBss01WBByRayUbO2VoTSr6VY81qO4G8QpIpK890zHGQP
	 UgYFxYw6NoXjsT8QiFfK6zje+1DKKn4oTyiSyc1oS8Y0aj8zVSCmcmi9gKsgueLMYN
	 FNRmGdV1T2Rqw==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, quic_wcheng@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
In-Reply-To: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] Add ipq5210 USB phy support
Message-Id: <178119214219.568088.11214023955554602445.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 21:05:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112777-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B58267321F


On Mon, 08 Jun 2026 16:03:42 +0530, Varadarajan Narayanan wrote:
> The ipq5210 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
> can connect to either of USB2.0 or USB3.0 phy and operate in the
> respective mode.
> 
> v2: Use ipq6018 and ipq9574 as fallback compatibles for qusb2 and qmp
>     phys respectively instead of introducing ipq5210 as a new compatible.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: qcom,qusb2: Document IPQ5210 compatible
      commit: a9a9bae2174bbad63fc73a0d445b7437f63b2498
[2/2] dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3 PHY
      commit: 609878c1b684ea3f77ab72237511eb9bec927102

Best regards,
-- 
~Vinod



