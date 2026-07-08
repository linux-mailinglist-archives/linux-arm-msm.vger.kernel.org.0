Return-Path: <linux-arm-msm+bounces-117711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SUJUC9hsTmr3MQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:29:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5F3728087
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:29:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SQYSoeZw;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117711-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117711-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A19B30665C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667264D8DB3;
	Wed,  8 Jul 2026 14:57:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3206D4D8D8C;
	Wed,  8 Jul 2026 14:57:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522643; cv=none; b=mn/3I7tzxp5iXFbyxmFdF7ImxE+GD5V8S/N5i4TlOgf8T9EKVWPSZ+lPQ8ikjsHDQGsy5ue53wNahEZXWEt/d8JoJPYC3AuTuWA0CxsZAmMAdzK8hU5BXoCGPMZkpm1KmbORIbtPB6NrUtQmwW9IiSshQ3/Z3laXV9NetiXsil0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522643; c=relaxed/simple;
	bh=zgassmI9Tho835Nv/k6WnI2iSww+R8L/7zn/Ab92AtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bXUpiyEh3bi5iHViqExKmJz2Iy06WhSohsapVWVASFZuR+ZTon2Um+1TTXm+4QrZVKf1z1X+bjwRELi9/2YQw638YeDM8NW1yhLz3JsNJqkJvcfGcY+e77sYiLxjCcenVAaNhi/sz/EAPNjodQY0GjYo9e27O/3STN8epi9PANE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQYSoeZw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E54B1F000E9;
	Wed,  8 Jul 2026 14:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522642;
	bh=p28OcEFsrBPQ7YSH8DANqz0QjAvt6mili/kTNj/Ahsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SQYSoeZwTRzkdNSFRKYnpKo6ASK9wxgcJBEWSuOCICgQO1Y9gjARK4IQied9/Bpn8
	 ajXP54y0J23bpZLh/Og6adY1nYysSn52WyGevG0ap8SNDXBsgeUdL6/RsUibutuHEn
	 +v/f89PLObqHPDA2laybPkLlc5TyMF7jo10cY6W9AX6a0D0PRIKdnrOoyxWKKsZiON
	 0S9co8TuX3Yknt8I6pSWY1MyqtWZ2aSNuuEbcxNuCyvEUzKzni7KesVmV36z+2rc+a
	 IPIKkJyTfwNiyGgvImDUoUcUs9JxIppSAmmDSXShBa/4mkQjbvxbr68Glerri+46RW
	 1Eo9EMygULj+Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rosh@debian.org
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: Move PCIe GPIOs and PHYs to root ports
Date: Wed,  8 Jul 2026 09:56:23 -0500
Message-ID: <178352261584.2235436.10506465887010340820.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260607-rubikpi-bugfix-next-20260605-v2-1-7bf229978bcd@thundersoft.com>
References: <20260607-rubikpi-bugfix-next-20260605-v2-1-7bf229978bcd@thundersoft.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117711-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:hongyang.zhao@thundersoft.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rosh@debian.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D5F3728087


On Sun, 07 Jun 2026 12:17:26 +0800, Hongyang Zhao wrote:
> The Qualcomm PCIe binding deprecates perst-gpios and wake-gpios
> on the host bridge and expects board reset and wake GPIOs to be
> described on the root port. PERST# is described there as
> reset-gpios.
> 
> Move the PCIe PHY references in kodiak.dtsi to the PCIe0 and PCIe1
> root port nodes, and move the board-specific PCIe reset and wake
> GPIOs in the Kodiak DTs to the corresponding root ports.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: kodiak: Move PCIe GPIOs and PHYs to root ports
      commit: ea85f665ffa09e2b7b9b54dac50dbaf0cd88685c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

