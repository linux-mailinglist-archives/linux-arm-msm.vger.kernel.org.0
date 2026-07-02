Return-Path: <linux-arm-msm+bounces-116120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WekmHSf3RmoDgAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:41:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B36CE6FD6BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:41:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MDlpzWTC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116120-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116120-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E5F9301830B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 23:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CA73D7D6B;
	Thu,  2 Jul 2026 23:40:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFB63D6478;
	Thu,  2 Jul 2026 23:40:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035652; cv=none; b=lCXqf6Uo2yb5nAWbl3OXcLAKmE+9JTbtn0EDM3V8Na50lEVgBd5AEf8YE3jlepNDC2nHHzBWcIQKFGQsWcqMDwHEPBFzGJZbe1t/7sxHhEyqGLkHgwEYZ4ePmAklFFXA4hL9gU9ylL+kqh+YDa5ubDx0MPJY8QOEed6mk0ps+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035652; c=relaxed/simple;
	bh=6s0879r+N4k6Na6e6PyD5vvCFRroQR7RIF21FtmNGAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQTojetrIv0cHMsogDAurDTE5cMIJXK7+qegN4weJiclgmaRkRGl1yWQwR3RaKt2rNnfONX2YsEzVMDTwzCW9SjuQ4S6+oheuZjYHvxZ99Yevp2w2tnUBeSlE01ZuEf5plOvWb+cDK3YvP/Z1xe+BxQRFJFdMHrWqhuPh+IIlcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDlpzWTC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0C31F000E9;
	Thu,  2 Jul 2026 23:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035651;
	bh=J+4YVp+kUS/7oTXXVzSsaAgqXX69kg91kfy+Lb0T0Lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MDlpzWTC760QT1GBSjJk0DLTUDnrJSlcy0nupX4aCIHfTjGlcDPxbFZY3v/mfw2/y
	 W4xi+WMygl0WGl1dx15SWmEZNFc948Mij6raqSpDWuCyDe/UAKVFzDKVdqxSioxO82
	 //NVY2PKPV1Ii9tAZT0E9ibbD2bZH/ZrfPuhqph7p8OGMKdW8WlwTQoi4YI8RoXhci
	 FEVqbXFwrqSao1KyyDaTIu3tON0IVz0rBg9P11vebTk8yhBTlMUun8wHxcnd4vAU2U
	 H9Cuo9GWeRppRy7RWUE5WfpZA9/u39J000+CFeAbqKCG+dCuv1oO6HZxgWOZw3+tYF
	 hrBLtYAT74DZQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] arm64: dts: qcom: sm8650: Fix IPA IMEM slice
Date: Thu,  2 Jul 2026 18:40:25 -0500
Message-ID: <178303563655.359079.3192597246585865210.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415-fix-8650-ipa-modem-tables-v1-1-95f8f425e416@pm.me>
References: <20260415-fix-8650-ipa-modem-tables-v1-1-95f8f425e416@pm.me>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116120-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:akoskovich@pm.me,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B36CE6FD6BD


On Wed, 15 Apr 2026 23:45:18 +0000, Alexander Koskovich wrote:
> Downstream the IPA IMEM slice for SM8650 is described as:
> qcom,additional-mapping = <0x14683000 0x14683000 0x2000>;
> 
> Update upstream ipa_modem_tables to reflect downstream.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650: Fix IPA IMEM slice
      commit: 41d237b1546af5d5cf877175930cd23163422c83

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

