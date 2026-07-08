Return-Path: <linux-arm-msm+bounces-117722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PBHfJ3dpTmq9MAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:15:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE3C727D7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:15:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WoVP50l8;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117722-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117722-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17D9631518E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47064DD6E0;
	Wed,  8 Jul 2026 14:57:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5491481AA2;
	Wed,  8 Jul 2026 14:57:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522654; cv=none; b=Nkd1OsFso2ByH/5mrQjpy2XDLqaz6nPEaaWSHCVJrL0+/yXs4uTtpBTBx0zHL/cvT8My1WuMUTTvyz3GhDZtToi8JFZ1X9euqEBFIFRuU2dVOQsC8M8Al5QFXPZmCW0cwSLpycA6QWgk/Ih+/NchxUTghyYc8w+/fRSrZYxBAMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522654; c=relaxed/simple;
	bh=H5UNhHNF9ZEx4X6nbiytNR1sMHCh8+LPGKoOr31hNIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fxJuCgrHPf6oP9g4Ij2RflB4CoMfcFDA0chuyT7lw7kRObCqnse5I2VTgB6SS2trJVtWH4iD6uOayZvMP+L+A9ePm2gYpEa8Pt155bevamKBW0TZ9xxOYGET24Tgw5lJfjRhnqEMH62/YGJKSv5MTQGizPVQvrJQoPlIuBI6A+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WoVP50l8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481731F00A3F;
	Wed,  8 Jul 2026 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522653;
	bh=rQDDAh1UqzZleTCamOtk+oazQ+HIsh2cI0Oi5RA0Wgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WoVP50l8Zpgc4BXcmg5/HI0saMNJXHuOfnKAo7H7bMmjthOyrDVUXXMgBG7gUcj1J
	 XEwe15H7EHn+bY+2JDmYey5/vMQ6uf6+yirCbVx9HU4TaW/ZiC5YePPcuoP6qXmOVi
	 TT4H3l1xZ98w8efc9jHasFtH/F/S6ocZhae0n1aZFsNsAVNcNXxLQs/aF1t8rUKc6R
	 JDwOI9m8zHR738KS0qLcp67QuIL5A74RZMksoAr7C1q4hNTP/cd0hMiBTQNRFYbauS
	 R0ofBJKGxN06eDafdfpftR5gLwtOK7M/QAzbm2yehugkyRlbNv/73T4CLvWaSxmMme
	 g4mbaa6zddrJA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: llcc: Add configuration data for Shikra SoC
Date: Wed,  8 Jul 2026 09:56:34 -0500
Message-ID: <178352261587.2235436.1532281778388805932.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260531-shikra_llcc_conf-v1-1-fa405f5a2404@oss.qualcomm.com>
References: <20260531-shikra_llcc_conf-v1-1-fa405f5a2404@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117722-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:komal.bajaj@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAE3C727D7A


On Sun, 31 May 2026 03:09:01 +0530, Komal Bajaj wrote:
> Add Last Level Cache table and configs for the Shikra SoC.
> 
> 

Applied, thanks!

[1/1] soc: qcom: llcc: Add configuration data for Shikra SoC
      commit: 3467fec5322678463fa5e43556eb0216f6a0ca22

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

