Return-Path: <linux-arm-msm+bounces-117710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8Tf3HjdsTmq6MQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:26:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 228D5727FE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:26:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=inhPbYKe;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117710-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117710-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FFB030D4C31
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD004D8D97;
	Wed,  8 Jul 2026 14:57:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3F4D2EDE;
	Wed,  8 Jul 2026 14:57:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522642; cv=none; b=eNiqp5RKQKag3nwJQLJYpO3bem920To9ligZq4GFSOhg6z1cTGymZ8/fRKTl6OXDh1lRmyS3Qo7NBn8YymCvCundgOqBXUzwydsdaJVorkRq15kbwgc5H2+t58NRau8pGFTCsAh4OUrKpBYIE9oGeVv3VqjT2x/0Os0bs/wfrxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522642; c=relaxed/simple;
	bh=C39h4EoX5rwyA4ScaxvfnwlTBOmGN4/JZovrS/bVO2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pockPj8UAggczEMlqsCPprWFCZJ1JS9WKhY3SFLh9xl47w4PM28BLOHunBTthkFRfBR6rHat0oC2Ma84oUzB+sWyw2CU7NgSGELMqDV80Fgvb7KrjHLIjXz2s23LdCtGtt8xBv1GuSWtT8zNd7KjWaMdh9vcPoLFdy40Bvx164o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inhPbYKe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B621F00AC4;
	Wed,  8 Jul 2026 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522641;
	bh=S0HXdlCKUOPyCD1hYmyUZ4r9fNQqrS3h+fV68YzAwBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=inhPbYKea8diHFadvyybo30wFczOSxrAAJXgW52adwsx/CF64kUyDAREDQBMzliou
	 xMVjeJ9qBUDbl5aLTtgd7b5RA+k662PBsJrML+ljWL8ll0kb/UNKuiXT69ju7hc+OM
	 J+yFdRFxBdrviCUnxjF+zWLxE4tbCvkijVU6RctudANKFD3HdbFCWKjA//KPsN2zLZ
	 e1miiUqf97oy7FSUxoHOBBKXaSwX7yVcl8AK6zu04nv7rWrnbe06AA1XPJnjae9YCz
	 zjRfH7IoGB/ebGYbIwsdVxFmAldlvde/09jqf0mXrAIzoTaVi5+X2UHOaxySGfz0kJ
	 +/Ydp8chZKqYg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/1] Add support for Microsoft Surface Pro 12in
Date: Wed,  8 Jul 2026 09:56:22 -0500
Message-ID: <178352261633.2235436.7857749386725006103.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609145906.40854-1-harrison.vanderbyl@gmail.com>
References: <20260609145906.40854-1-harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:harrison.vanderbyl@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:harrisonvanderbyl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-117710-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 228D5727FE4


On Wed, 10 Jun 2026 00:59:04 +1000, Harrison Vanderbyl wrote:
> Changes in v4:
> Device tree:
>  - Fixed some formatting nits in the device tree
>  - Clarified NFC only available on business sku.
> 
> Changes in v3:
> Rebase:
>  - Rebased on next-20260528
>  - Removed ice device tree changes
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Add Microsoft Surface Pro 12in
      commit: 447f8053b1849b22bbf6f71a2cbb1a81fb931d48

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

