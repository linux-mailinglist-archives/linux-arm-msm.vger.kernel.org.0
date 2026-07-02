Return-Path: <linux-arm-msm+bounces-116134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VoAvKWr4RmpNgAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:46:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3773B6FD7AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:46:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=I6aHjh+r;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116134-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116134-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5D2530E0F0A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 23:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A9D39E6C9;
	Thu,  2 Jul 2026 23:41:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790E2395AFA;
	Thu,  2 Jul 2026 23:41:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035666; cv=none; b=Spy9Ae5GYCI4rieUojkS+qe5Q3z5hEZbDCW5pyXhiwW6A9+qZzoKxhKvL0PN/d/u7wBus7nam5zi6k7qhIT5dobBRLVDte2gP+FEN/pdj5NbuwfxcEfqvHBwRTGFFzy5qxU6FT+uyoB0zwBtcbDpC0UO4goNDjpf1mQTcW9KESs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035666; c=relaxed/simple;
	bh=VWBe4qeQKbSPAFW/Soyk8TnvXZV5R9GHyvUIGuPB3sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BYSR3K1SE2oXi5Sh3NzX+hXK5y5xgS6BGu12NWNxR0SZYpKrPxA+8ofSxwQQHKaJFv0N7ycqmcnZ6X9fGGJ3+19SHaWUuCXQv/BwRucM1rrnSzZ94oYVx1jVhz+SlLm/jlBysqXfU4SLaIAiE+AYOKVKWULkNG2HZgl1thy61Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6aHjh+r; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561131F000E9;
	Thu,  2 Jul 2026 23:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035665;
	bh=b5iAkywzsA6Uwn7YWW077Q0aBOPUzk09mNaluShF4xM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I6aHjh+rr9W4lDyGkiN+PlObSGzTyf60RIuWerlBblKhSNq6XUyy8M/xbzofK4UrX
	 ge8TLz/hDMoaDj76DNFy0WClrLF70A7AnQrjokjXKDtTs+qS8EvTMftrXw7Rp8xvSO
	 0Nfh65wSNfPIOi1zRfUwRtKhVn9QgKDpCsSFTVFGJy6X8tnRFnylGQrNffjuWlKoAb
	 QS9iIfuO6TCoZ+lqIM3BjY9pq+eJ2H0+SCNauNbep/Yw4ZZRJJ1Z11mGr/EeXzU7Zz
	 LFCeKjUVEdpPtRliuLYSmC+INvOsR8wMp1psBIdX4Amrqv2tr2y+Ck07wFt+choRHt
	 F1fPeZ/meaugQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/2] Describe IMEM on Milos
Date: Thu,  2 Jul 2026 18:40:39 -0500
Message-ID: <178303563650.359079.10125285909588967551.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
References: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116134-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:luca.weiss@fairphone.com,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3773B6FD7AA


On Fri, 10 Apr 2026 09:31:05 +0200, Luca Weiss wrote:
> Add a compatible and describe the IMEM for the Milos SoC.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: milos: Add IMEM node
      commit: 1b3ab2f3f1f4970cbd992a02bcc5f90551d67966

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

