Return-Path: <linux-arm-msm+bounces-91056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLniCy0yemlo4gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:58:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F61A4D9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7FBC304A8B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CB5308F05;
	Wed, 28 Jan 2026 15:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aV6HDSK7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1892F745C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 15:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615485; cv=none; b=outwfsbl/K1FALk14Z/48gyerQi6OpwzEEZhwUEpWENpaIfisTT+29eVVqulRlXk2eIggiF/yV9Jrrap8nb1/LeGGSrb5NHl0mygEM87xHouqtfkHKgPG1arWP8oyRPBIRcrX9KfjAcJ2zNixn7YkOuDT2BrOcYaOyeLN/swH5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615485; c=relaxed/simple;
	bh=s2XftgRLoQjS+g/1qoc7zKuSMJw+yLwcSC76tOy1XDY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LwR5n61iRTacTEIz6lmAg3ATyrxUZcL9/PGN52Dwjfj+RWp6KIxg5GkMsypv0nCKJOSeoG0C0yDi+iwzGOsfrGUyXeWJ6AOOl0waINPKGarsiIHBRTODjUc/+HdvllVURB1dcqiH++v/cM8hhl8RZ0TM/0Iu+Y0lrDhXMh+4hog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aV6HDSK7; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6505d3adc3aso21396a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 07:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769615482; x=1770220282; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MqPhMZPef8IxeMTLsFDJp6gjrCUIfXLXeKcG0ugnntI=;
        b=aV6HDSK7zTGc79REnCSxq8Mt6QGmrcHKv3MpXeChDruqleXzdXHiCYi2oyVd3eF7Wj
         mbAQzATsG1InFchtHM/x0qvWIo2hM6g9q/9vW+DVYJhM0QzURPakut784EDCHpNKfdnO
         ofax65U8DtXelMyYHJZq54oCll1UEQqiHIjtdE6T7dTtHtkS4sBruVH8vml83Jo3H9FG
         V/eciT+y9VeVDhH0bux55UHP55/LmCBhv2W1BzIfca6ma79vGQ3ILL4a98lsCYM/NPku
         +s+U5qRbaFmFd2DeAvCdso4CpOn/H+kvpNxVnIdq4qquBiNvjwFLaQ/0mqePIBxi+Aw1
         QBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769615482; x=1770220282;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqPhMZPef8IxeMTLsFDJp6gjrCUIfXLXeKcG0ugnntI=;
        b=e+Jf4e1LlO9MCJ2x3PNsANFwi/4q2MVwAbngHyee5e4jKcXtw50wjUtbsBqgZWGD9h
         xwjvTZU7MuYdSEsX1mhdUTkT2FUVlkzgCagYExiOe07nk1/ps14QsPZwtO4p+lN5ltpq
         WRAn/9tj/+TdbXTCNSV2NjCLslWRkzS1yzUeX5LzN9XZym1NyPho8eAa3hIcxm5AGmQ6
         E6BnM2imOOBWLf4bvrzOAxQGtFSGXn5s84UeC2UB+UhAdv0c50+O58692HJg9CdxHuDo
         Q93PZNYxPHANr/coFAx/IhhSEk2ShoI3FhGkJUYJAolrO9NyR4/6RtdtOh8dMKt6tElq
         VXNw==
X-Forwarded-Encrypted: i=1; AJvYcCWUvOMKevN+dJclzviq2E7cedCxisil4SXpxrYC7y2OvTTZYewmQ6i4tc/7LLOXnUFJyVxFKIWFLytWhnwd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq3jpa/wDSp0KnriCB3kzynAUSTHbB9yW9Hvwbj1Twtxdz6Isy
	g6OTlKX6gC7gO9bIdUNqkwFu0kdYn+IX2uvFDiwhbfefPU3kLpZYgHCXNYKWxzsDyE4=
X-Gm-Gg: AZuq6aJxqAzE8LusMjJ0t6fTwFNoYyv+3iszMEkpfUN8PZyT4JRsbLLCp5EmhibAw20
	2OICulq7CPDKKYNUKCat3eaMnWIAV/ko0wxfJovMDNDp4O1XHglH0AB7PRShDeZRkO4GZ9p37Ja
	buDusrChIa69HRhCOnQSdYZzMih8Peb8gV7Plgtwvu5RUjz34ggbdDqtmn2n1kp5lXfXVUTPini
	Us6mU/1i/sHe361d/XLC7md+99IiO870rRJyonhMGBlOkLKDpwwdtPvoHQRSNeH/r87Dx2GliDE
	oD1sj/hnA/9NjccuuGq4qk36fmdn1gm5oYraV1yt8u0VgsLf4H5MCK+fsbasT8XVzbIm14IEd6o
	b6Rt8tdnWETjO+1G3t8b3Uafi/upPtL3luspgpQQRSICk/VFDeyIHydAQIoHMLw23oMj3ha7a/v
	Y6b38fkMzimrIM34IOebUZgv0oXj2vA+5CBkqXpowTUCpg2ru9PAKQArMEWa/K4+fZ9Hl0Q6hjl
	OBWQ3E=
X-Received: by 2002:a05:6402:3548:b0:649:cec1:6cf1 with SMTP id 4fb4d7f45d1cf-658a5f8edcbmr3566350a12.0.1769615482091;
        Wed, 28 Jan 2026 07:51:22 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469eb9fsm1727223a12.28.2026.01.28.07.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:51:21 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v2 0/3] Add support for Awinic AW86938 haptic driver
Date: Wed, 28 Jan 2026 16:51:12 +0100
Message-Id: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHAwemkC/12OSxKCMBBEr0Jlbax8ECIr72GxCGQisyDBBCMWx
 d2NsHP5eqpfz0oiBIRImmIlARJG9C6DOBWkH7R7AEWTmQgmLpxzSfVbVVepqAmYINCutJoZKYT
 SguTSFMDisgvvbeYB4+zDZ/cn/ksPlWDlvypxyih0puaqUsZKfbMawzR4B+fej6TdDn+A5yv/O
 R8jpNMRaL6PODeFg2WmeaBiXNS5sX0Bxjce/+EAAAA=
X-Change-ID: 20251113-aw86938-driver-b4fa0d3228a2
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769615481; l=1152;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=s2XftgRLoQjS+g/1qoc7zKuSMJw+yLwcSC76tOy1XDY=;
 b=UpFCfkbXOgKJjpAw86bajCWZpxZ2xCtZDbZ3ywSoJtcvP95aZ1oKyJXqSvx3734Dc7DE5opPd
 noxQ/gLYBMnCYkfNbKF8qg/gnEClSRd+PNBQ6hm9KSGeQJ1wVeY3eJe
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91056-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B2F61A4D9C
X-Rspamd-Action: no action

Add devicetree bindings and a driver for the AW86938 haptic driver chip,
and add it to the devicetree for the Fairphone 6 smartphone.

This driver is very similar to the AW86927, and shares many core
features.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Changes in v2:
- Added AW86938 specific registers
- Added chip model enum to differentiate chips
- Link to v1: https://lore.kernel.org/r/20251204-aw86938-driver-v1-0-ebd71868df3a@fairphone.com

---
Griffin Kroah-Hartman (3):
      dt-bindings: input: awinic,aw86927: Add Awinic AW86938
      Input: aw86938 - add driver for Awinic AW86938
      arm64: dts: qcom: milos-fairphone-fp6: Add vibrator support

 .../devicetree/bindings/input/awinic,aw86927.yaml  |  4 +-
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   | 19 ++++++-
 drivers/input/misc/aw86927.c                       | 65 ++++++++++++++++++----
 3 files changed, 74 insertions(+), 14 deletions(-)
---
base-commit: 0364de6be161e2360cbb1f26d5aff5b343ef7bb0
change-id: 20251113-aw86938-driver-b4fa0d3228a2

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>


