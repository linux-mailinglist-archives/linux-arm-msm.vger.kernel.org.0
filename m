Return-Path: <linux-arm-msm+bounces-118516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T/3ONLieUmpQRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:51:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C77A2742BDB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:51:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TmBomZ9O;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118516-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118516-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5DBBC30135DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964CC326942;
	Sat, 11 Jul 2026 19:50:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9F5321F2D;
	Sat, 11 Jul 2026 19:50:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799404; cv=none; b=de/dCvFWhV3Hq4lezVWcL5oQe9jSJg+WJ/0mtkVpVKfu1tPxV2E+oh5cUtpIV9W1tXo+NOvdB0MVfUIq1QeK/Y7vdYc92QrhqQLnoLbtKVyJyW0zQr0OAdQ4fpmSxCC7BK5GgJJ18QvewKm+64WfIlFaUealUNobRdE5mTZbjB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799404; c=relaxed/simple;
	bh=8/Q5mDWXhiwKvNLCp9AotYNxjJ+/7xo2GEwDK05MDNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IBqBJDzOqQpNPTKQlU682Zl8Y/0TQe+vLZ4iYAZkeAlO/ctMsckTzpP3bjwp5yC41eFbbwlky6SfUOk23UjsgifkcdsMGTAR/tm5MfXi5J3Vu/4ij0zoP9n3eUWG1WVMf/YBJ1kzwAHr5M06WwPhIQmRjVEafeVBMp19nnswyrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmBomZ9O; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12CB1F000E9;
	Sat, 11 Jul 2026 19:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799403;
	bh=962WI+WFrEgveuIYGHxMy53wrwxe3EZr+9F07EUoRAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TmBomZ9Oi9R6ZGBX/lkMHcvwr5Vwje4Ggmr1FEwBFoCcTJZjBTJJ253t03km8hEBL
	 F4pEON5Xbp4n9y+n/ceCapR4juW9/4dujhRkUhLO0AVhYXmCFBvqMGFNZCrSnyB+BP
	 F2K4KthN8CSkQsezEmi7QSq8kPcHgRwPiz8uYBS6PlJOegBN1lkiul+wYfyXCXB483
	 lZ9Rs2YS2ktzbzQno+8mN6qGvTF14y1ijbNju9DF2vHZO13WS1gzj5wdYo4iN9WP2F
	 qgbH8lEqTNCUqHsTLQp6HBJTnOiySF6IC8xJFRNKnUkmhVDq+6hpBfPukAkqWHtnjX
	 txXyUQrMzhAnQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	George Moussalem <george.moussalem@outlook.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] IPQ5018: Add and enable GEPHY RX and TX clocks
Date: Sat, 11 Jul 2026 14:49:42 -0500
Message-ID: <178379938611.163099.4515812802119059592.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608-ipq5018-gephy-clocks-v4-0-fb2ccd56894b@outlook.com>
References: <20260608-ipq5018-gephy-clocks-v4-0-fb2ccd56894b@outlook.com>
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:konradybcio@kernel.org,m:george.moussalem@outlook.com,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:conor.dooley@microchip.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118516-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C77A2742BDB


On Mon, 08 Jun 2026 09:09:15 +0400, George Moussalem wrote:
> This patch series addresses a missing hardware description issue for the
> Qualcomm IPQ5018 Internal Ethernet PHY, where the data paths fail to
> function correctly unless their dedicated RX and TX clocks are
> explicitly enabled.
> 
> Further testing revealed that leaving these clocks unmanaged by the
> kernel, they were inadvertently left enabled by the bootloader / QSDK
> platform, which masked the issue. Testing a fresh network configuration
> path exposed that the data link fails to work without explicit software
> gating.
> 
> [...]

Applied, thanks!

[3/4] arm64: qcom: ipq5018: Add GEPHY RX and TX clocks
      commit: 20959cefc27e7e2e506b4e789b728e5702c77f95

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

