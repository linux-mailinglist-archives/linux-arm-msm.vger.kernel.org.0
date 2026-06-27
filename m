Return-Path: <linux-arm-msm+bounces-114735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QznCJ2MNQGrUbQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 19:50:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4516B6D2702
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 19:50:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=oMZ39IuF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114735-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114735-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BC76301F9B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 17:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3C134389F;
	Sat, 27 Jun 2026 17:50:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A253112BD;
	Sat, 27 Jun 2026 17:50:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782582618; cv=none; b=eAAeIGq7Xy6uzjwu8r7x4vGCByuUYOStDx1bUoAEBKPAS686wKPeKdlMXGC4bYtlPhPtDZvJBznoB+ng8Hn7lz6WfvdiKiRhJgysnIOBVwu1A6GxWcGKmU1qGy2deyk2NRatX6msTWxlXOUWMlzODeBsGGp/11j+u4LFYZy5gqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782582618; c=relaxed/simple;
	bh=I3bvbarQGG1JG360vnVYjew40hnVIm2x4NllJX1eEF8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QSIaUpP//YpQB4AC9Dvkt9czIqfadKk83X0Myt1w6Qhp12IHFUXdQkJG3vMgcTlfbfC8C/IhLNnm6Zk35DMS7Ddw6WqENN7SxvIdlkKm0k708pE64CK29c5TNiQ/4SSDk+gcWOiDFbwwmYn3j2+i9TsNnuopfMRV3lBMfoxOwz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMZ39IuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C406C2BCB3;
	Sat, 27 Jun 2026 17:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782582618;
	bh=I3bvbarQGG1JG360vnVYjew40hnVIm2x4NllJX1eEF8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oMZ39IuFSYd2MaFVv2vdzVEtNC5InwOYoAaXUXWDfLdZ3NFbS8X27lB0O46gWTr5/
	 upcESnnojgL3NbeHQ1D0nOBIcTdTgvsDCN6+FBoU0ws856rrimmbeU3neXGRvzk+Fv
	 ml8SWfBAkDIRKTQCo/vTA6TLLbRYW3Jw3n5ZgTtrBB04L51x+bdw5l/OoEW9cWXYUI
	 lb+j/sNz4jZbA+xtd8Yi7Yz+QqBUFzbDkLJ3khqB9mw5hi90yqmB7duGAxxZsITYyR
	 VF0hat0WD4jg+LBZB1jWVSNdVDmVOz/mUqScWIypYibBCjLwWSdU2S85V34w0PNqZp
	 IroHL3+OshHBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426F5C43458;
	Sat, 27 Jun 2026 17:50:18 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/2] Recognize Snapdragon SDM850
Date: Sat, 27 Jun 2026 19:50:14 +0200
Message-Id: <20260627-sda850-v2-0-44bf46ade42e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYNQGoC/2XMQQ6CMBCF4auQWTumLbRpXHkPwgI7o8wGTEsal
 PTuFrYu/5eXb4fEUTjBrdkhcpYky1zDXBoI0zi/GIVqg1HGKWdaTDR6q9A9bNDcdc6ZAPX8jvy
 U7YT6ofYkaV3i53SzPtY/ImvUSESeq+Et+btssl7DF4ZSyg+ZKh5kmgAAAA==
X-Change-ID: 20260623-sda850-6b5c1e44662c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=766; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=I3bvbarQGG1JG360vnVYjew40hnVIm2x4NllJX1eEF8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqQA1YK8glQipsbPDu59baTNOyWXpD07/knJtmu
 1MsIYw1FFqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCakANWAAKCRBgAj/E00kg
 cghdEAC3bJd1iiMqAS4n+igQBHlJZI6soKc3516kYlKVnjZjAS6lTiFzcRyjs5Q2tlv71lyybdw
 8a6eh4b8oKwocHHvgkJtpQKIU3UatIi7qUNwqrVXDJQ0XxQHvHa8AvlscO3qseB/b8XRmY5JuMf
 CkHzbkfdXpEP3dB1b6xlxHbhiHWmMQ+tE7gMxUXVgiuXdi3wjWMJD2T7Hy8AsNk0mjUI9oxe2zZ
 rCPQACacNgu9ufz1KkbyKjHCUfq3EZKuAM2happ7qGBKLjsbyywZIzRqkBoKFlfVngfHhHV7SLH
 xkeliIp1PURR4huylAXI5kcLzA+VTy4WOjbjlKuIlFuTArT2tkj8lA2nFJvjOPBV6XchzC5pmJf
 dV7xn8Q3ntyqWO6LUXlZPTTC3L2DAiRuimMLZeqZfLJS5thZYAlJYketE3EJ8wqQHLssm3BQRtW
 mWUyGF4IHIHUOCIo7kLrTuajEjrXYwhpD98BYy25fClteKTKoT3y17RcgKaCfjcDa/jE3WBCSz4
 seKvgG7vB0asSR72ttZfQRDnA26WHlMDafMOYktOcvofpNaqVFLj6HiEARSo7aw6/v8+KNfwIDP
 nBPYZUPidt0rkqnbgCQQoh2iN3efM+sg/xGmekgCvqSrpE/dpZAKropGCdlZkrRxXfryfUCN7h0
 PQDKiKARvKHRVnQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114735-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ixit.cz:replyto,ixit.cz:email,ixit.cz:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4516B6D2702

Useful for sdm850 devices in tree and also will be used by Comma AI comma three

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- It's not SDA850, but classic SDM850. (Konrad)
- Add consumer of the define (socinfo). (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20260623-sda850-v1-1-ddd8e62c85d8@ixit.cz

---
David Heidelberg (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon SDM 850
      soc: qcom: socinfo: Add SoC ID for SDM850

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
change-id: 20260623-sda850-6b5c1e44662c

Best regards,
-- 
David Heidelberg <david@ixit.cz>



