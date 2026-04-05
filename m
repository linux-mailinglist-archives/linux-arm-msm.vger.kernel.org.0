Return-Path: <linux-arm-msm+bounces-101876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI/cC7O60mm8aAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:40:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3439F7F8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E134F30022DA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 19:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C9C30E0ED;
	Sun,  5 Apr 2026 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUzYFxxc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFB3EEBA;
	Sun,  5 Apr 2026 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418031; cv=none; b=kXJqRxpZ9f20wJyJURDxULh8ggOFDMVAl0XmMNzahWxPXn/HDe8Ac9B6+2ORs6YKIWYfgOzL09Wkz33tOHvRbEquw90NlUozmhdNDs2XisHQg6xQVTrvccEWvEP7wpZFRnEGp7KxzbRJucBwBg7NOU45NCcfFLdUv9177FiUlxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418031; c=relaxed/simple;
	bh=I/LXPhVZUXpJLFAt2eNg78hLH9qBagkX0Ukc+vgDL+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZV08fdnTHhcSyFzE2m7Yp/wZnrE3KAmRSbEy1/UDTU7jTEfS2XAAAD2cObZDOyU40ZTHapgZ4Y/QCgmEoBAUbNyWqAz2vD7q4TQ9qJrzZJDCPKIOWtf9qJT2FZaYkkn3jMXhfU8yl3vsKatDiMPwEUKDGvynDmrYss1pZk6LwYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUzYFxxc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DD1C116C6;
	Sun,  5 Apr 2026 19:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418031;
	bh=I/LXPhVZUXpJLFAt2eNg78hLH9qBagkX0Ukc+vgDL+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TUzYFxxc69ufAtW99TBPI5GuVOmVQ5x22CvwsYiaJWT+bZ6Hc+JF4PV+FX9MFjSIf
	 uIOjPST7XMm8XxiaCCu6CGPZjhyQqhf28jpccIDRU6/h6Kw7HlIdez1htuHUl1pl7c
	 fcGGrXQxKttNcQdDAc1ai3XTztgEMJOgTV63PzUNcgGEqZjsLeLhF4/z/a6JSOpWAL
	 PASfgWQW4KFOtiL30jLnxz9V9Rxve/ZRgHT1sj9CDoYvvCdqf9KzO72lB/xarxYRO/
	 FcyvAyCj4ga02OIjj5nePnJrr1V1Ao0pSeyDdxPy4unns6Lk080Fwm6VoP4pGqkzFO
	 0OAGae5ycyc0A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable DisplayPort support
Date: Sun,  5 Apr 2026 14:40:13 -0500
Message-ID: <177541802139.2061229.1405284827659543234.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330-glymur-enable-displayport-v1-1-1543ad6dac3a@oss.qualcomm.com>
References: <20260330-glymur-enable-displayport-v1-1-1543ad6dac3a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101876-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C4D3439F7F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 17:24:08 +0300, Abel Vesa wrote:
> The two Type-C ports found on Glymur CRD are DisplayPort alternate mode
> capable. Everything is in place already for the USB, but for DisplayPort
> the controllers need to be enabled.
> 
> So enable the related DisplayPort controller for each of these two
> ports. Also define the supported link frequencies for each output.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-crd: Enable DisplayPort support
      commit: b4cfbee0df3540b36b78e9d8e3c6d93f3206fecc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

