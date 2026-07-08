Return-Path: <linux-arm-msm+bounces-117748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WKFsLSNuTmpPMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:34:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B374C72817E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:34:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kqz6QPRA;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117748-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117748-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4174F310E205
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CCF496906;
	Wed,  8 Jul 2026 14:58:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E8A438026;
	Wed,  8 Jul 2026 14:57:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522680; cv=none; b=U/FjMag0zWPYjQS/9gUW1IfI6kS213y9OG60jBt+sTXqKTYVEa1s8/H4tiy2+4qMWAlXGGiz+tir9dd7YtLs0jwYu377rDPPxI7tlH+4NWvvuJHKrKlgp6WKayxlVBrzCmP9ix/MYnjHIAqi0+hxJUyMbnAGCNthqoHcUfTQ8sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522680; c=relaxed/simple;
	bh=Vf80Ob9xP9krtdO6lBCxOck5UC2MOn3OOH6FIzWek/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pPC+6+evpm+McMhM4AQnp70R9ISrlo5zKbX0lKIZZDZJd39X5TZWJ/9us72T+/c4IXlql/1TLtA12OO/vngRD6U3c0WXsGuGQ9j2KOlZYbsurBZbkwMfwcaLMhFsSM0uVMZthNuJ3mLYke+ye1F2TsyUrKDUMOy+b2/RLxeVPUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqz6QPRA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558BD1F00AC4;
	Wed,  8 Jul 2026 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522679;
	bh=TaO5vibGTWkJfrwKgsX0w++Qq9jVQy25oFhI9/ONpS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kqz6QPRAUxfdRvgDJBEUFmmThVRqPgT7tEQf2PvodLNzRp4vm96swFK5UNR8/5vOw
	 OqKPNGg4YQzAW+BOWzALwz8gzkKHvb5mGfUhLK9T+yLaX2jXHd7V7uG/HJlzIdET1s
	 x3oiPDfYPxfVCLPpcBW0r5QYnt/lfHWdAEupek8ed8V6S3MEpL+4zbpqD4Lp4+57eq
	 Sqp7Q0yfQlaWR8yVXxbVQ2Jgo19toYcxknlP5mksxCn/PHoHUdBYIQdpDbpBiBtj+e
	 jQkAi8nRgA4VbuzkPQvDeURB0A89IIZRDQY9VbRHcsx6A7NPxAFBu/LUIndyWEKF7y
	 unqMWNpDkxLFA==
From: Bjorn Andersson <andersson@kernel.org>
To: devicetree@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v9 0/2] Add Xiaomi 12 Lite 5G (taoyao) device tree
Date: Wed,  8 Jul 2026 09:57:00 -0500
Message-ID: <178352261631.2235436.14670744762244435617.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608143329.252033-1-zstaseg@gmail.com>
References: <20260608143329.252033-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117748-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:zstaseg@gmail.com,m:linux-arm-msm@vger.kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B374C72817E


On Mon, 08 Jun 2026 16:33:27 +0200, Stanislav Zaikin wrote:
> This series adds device tree support for the Xiaomi 12 Lite 5G (taoyao),
> based on the Qualcomm SM7325 SoC.
> 
> The display panel model is unknown, so bootloader-initialized
> simple-framebuffer is therefore used to expose the display.
> 
> Changes in v9:
> - Fix SBU endpoint port reg: 1->2 (patch no. 2)
> - Link to v8:
>   https://lore.kernel.org/all/20260601150752.666393-1-zstaseg@gmail.com/
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
      commit: dbf48f009161162147c8df3cb3a47e8e7a3a0442
[2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS
      commit: 28705df5d0df5f8ba34c7ca3fcc5b46e7799b7c2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

