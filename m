Return-Path: <linux-arm-msm+bounces-93500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MQOBcpXmGncGQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 13:47:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFFE16796C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 13:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2C1430219DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 12:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770AA34405B;
	Fri, 20 Feb 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="ASfEKYzV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DB830F93D
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 12:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771591622; cv=none; b=G7lEy//x/UYSq0L7klmK9cxcL6rlAzPquPQ0YkxHkIkxrwViBCYA1xMaMmpTcjtiGgnY7c5qvRTq3xZC3yoBOA86IQf6UoLuPGnGYxvjgMxNZ4twA5MiTwngyCZlrzhydBzVS66DLN0ygl9rWJKLy3c+IgakfR5HiCEkSFFjNDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771591622; c=relaxed/simple;
	bh=XUTBIlht5yes5zTDE2niRNudXqmgYHNeIG5zNKAFcBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j99m7A3gbX/pGj0iyPajCcJe/Pn4oBND+e9zuGFIjICp44q2/C61eLsY5qJG7QK1zzs+S7miH3ylUhh5hzApCl0fitgAYkE55MsUBMM1VeV72R6RBshuOz9euJjjBUaOnweRqSIkejjqoIEO/vH30+gDyGvMTvvfGFF5vGWG3jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=ASfEKYzV; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2aae146b604so14017755ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 04:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1771591621; x=1772196421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qO0eb9RcXU0w2QKGyhp7Hy9aMVcGq2gvV+OJ7quE6mo=;
        b=ASfEKYzVZgqHRek6LfEY+X56C4HVGpIRGKIUyyTAU5gWGQ0LdtC5SbucHPJ+t7G4eB
         QT0my/r7mVYGA9WJklgcolrm5JYPqbEm6JbCH940UATCzY0iG/cOv9rmY8A/24JUwQSk
         VXFHxdL+5jakYI2uaNUeuhBXXVu8Pj+Ic0uFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771591621; x=1772196421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qO0eb9RcXU0w2QKGyhp7Hy9aMVcGq2gvV+OJ7quE6mo=;
        b=OZQdSYjlOtS/w6s6ozemuHD0tIy4v0zF7F0hwoSasqfvZRpuL6vFm77PKIZIds6SkW
         B4peYmySDkaUptzz4u89qbeY7RUStuOBGKFCsllJecFCguDHX4DqcNeKLo3r8MZkRoKO
         MmxlX0wSPITsQislB+qC5gsF0kAFfkVvfml+Sa2dQnDyhwzIA+QPbpLdSRB3L1evAWBT
         0v+oarE6jMLz2jcdCIza73IUDdCMpyQLiblnjSVtr2D1CDjF2UggcoLrfsfJGT2qbdSv
         Csc8IZxj9PEE+sVvqGaiB4IM44qe1XJNgI9MSt9de7XhnVSn9xcieGrVWqJzaHp368ht
         4zLA==
X-Gm-Message-State: AOJu0Yw45FooOIUccsmGxIrpwhmfizR075g8mh0bzwKGcQgqBeuoWDbs
	BScQ4xFJ6vALMuQGahQjqXVy/P4kEsw4Sn0yFFpc+/UdraVRffBJ1WIi5kWxFo85ENo=
X-Gm-Gg: AZuq6aLRf0w21xHHHFItFPKhhAntQlj9us6rJD7EXKt1FMhQpNp2lVBGfR6iZUMar1Q
	OAx6i6w9ZiioffxB/pCfZe7hNT7vqXtaeK2M+BbsCsCEC0gHzoCrQoQNyxQZ7ZqRGS21oLx7pIW
	GMobkynhzs2vnz065ep/yPchWgeNYjAVKsRw3pR1UvBx9fs7Zk3PMWG6JAOjQRAmvGjs5UAHRiS
	Zm4pSmpSOMTEN/Ecem1k9r3G+27XcypgnkJ8TNVXJaPeYvRMSjPudse3i4z0joNkVLavPfwMulG
	1KRWO3mOFUKJC1ADXKJrsDabIJYlyk4HmofMatdjchEgjpTrloSBbpwAlRs8p2xm64iBJH7zQcQ
	7VHDKgk3j7BcqMeoScY6coOi2BguwuK9pomJnL2Ui9LPWwuc84tCzrVWVgtULWrLMcdzFUotd7C
	2mbr+JGq3KYsnVQ7rYiWvJcOf7RywM1b1qVRm7fSc2ukxEpepZCB3qdsfj+Ejnz76eYTSvISiui
	Ltf1dyT+QKwV5oJvxRWWhA96Hwr73aueDZnn0w4YTEYTqo912dHCKP+FkU1cApPzMaoNoJm2/vf
	pMArrpJuCgV2oOl/DKgNwY/O/RfLnsd7rXRtIpwg6NMKkB2b/A6Elik+upABhoa6+MC0MGleCu0
	=
X-Received: by 2002:a17:903:37cf:b0:2a8:d9ea:8b59 with SMTP id d9443c01a7336-2ad6cd158a6mr20247395ad.7.1771591620763;
        Fri, 20 Feb 2026 04:47:00 -0800 (PST)
Received: from aegis ([2001:fd8:f657:5202:d49c:c900:af62:5f3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aafb972sm179431235ad.88.2026.02.20.04.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 04:47:00 -0800 (PST)
From: Daniel J Blueman <daniel@quora.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH v2] arm64: dts: qcom: hamoa/x1: fix idle exit latency
Date: Fri, 20 Feb 2026 20:44:58 +0800
Message-ID: <20260220124626.8611-1-daniel@quora.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93500-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[quora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[quora.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quora.org:mid,quora.org:dkim,quora.org:email]
X-Rspamd-Queue-Id: AEFFE16796C
X-Rspamd-Action: no action

Designs based on the Qualcomm X1 Hamoa reference platform report:
driver: Idle state 1 target residency too low

This is because the declared X1 idle entry plus exit latency of 680us
exceeds the declared minimum 600us residency time:
  entry-latency-us = <180>;
  exit-latency-us = <500>;
  min-residency-us = <600>;

Fix this to be 320us so the sum of the entry and exit latencies matches
the downstream 500us exit latency, as directed by Maulik.

Tested on a Lenovo Yoga Slim 7x with Qualcomm X1E-80-100.

Fixes: 2e65616ef07f ("arm64: dts: qcom: x1e80100: Update C4/C5 residency/exit numbers")
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
Changelog:
v2:
 - update exit latency

v1: https://lore.kernel.org/all/20260220070204.101672-1-daniel@quora.org/
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index a17900eacb20..b870f4dc9c42 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -269,7 +269,7 @@ cluster_c4: cpu-sleep-0 {
 				idle-state-name = "ret";
 				arm,psci-suspend-param = <0x00000004>;
 				entry-latency-us = <180>;
-				exit-latency-us = <500>;
+				exit-latency-us = <320>;
 				min-residency-us = <600>;
 			};
 		};
-- 
2.51.0


