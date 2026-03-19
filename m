Return-Path: <linux-arm-msm+bounces-98791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KaQOCcYvGlEsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:37:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 213002CDCFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E7A2300C904
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FF73E6DC9;
	Thu, 19 Mar 2026 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="I4B+o8++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AAB34404F
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934599; cv=none; b=pt6CygL1i9AhsKONFLUQMARUnixTRzaWA32eTtxFxk/NCycW04lSQ12CXW7r76SKBSLw8ZqGHLJGGq1Ej0yzyUrfbt9+zEx1mHNQGusBQfXHCSNcQSvoIkPx9d+byja2I8/jtQxtndjK2KqvlN6HmthwFLecq7Lhgk0IDdCRcko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934599; c=relaxed/simple;
	bh=uAUYh5Zld8KPgz29e5iG1SuJPPPdsG27z4mX5mhXib0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bLAuKTog1h+iHZiMC/mecujtb/4vLmVaNAUets520A/4oyU0hbHvAdkoZIzYTkAyBdSAkatsOQqtfNOrXOoekfLNONVv5mQ763TRbi7bmM0uBjvnyVaJYtU4VbGTZ5qbY+/QmYpjK0NFIT8THwueWOBD1F4fID2GLy7cddRO/ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=I4B+o8++; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8f9568e074so156275466b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 08:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773934596; x=1774539396; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BFh9idnvGIKmQrvQtE6/tEDjWeUaVvRU4QnDPM5nnUU=;
        b=I4B+o8++WG1QQXfhewiWFMUgPZJiX3WbDuPRAxTdGQO9rf80M1ooIcj7N8uCvr97JT
         okbjZE0EYcJRXyz7AUCoq+4/B93+LTUDmXJG4fzctjN/AXh8uQsd13G41PtaFyxfu5RK
         z5d9yAfSpAOytsObdwyYtZ+sbty0HbYWMR/J0WyWzUmh7gG+BuRKgdEqUxdZnvlzqnV0
         hMW+IgcYaRga1Y25aUH2uGJ2DYwPWG3OAUszY6SO5e/1nTD6gH6iUps1UeC9TREUN3ay
         odj9u8H/XM6xhQc2aWy2vKZDsaOaoi3LpMGwOA6u+61fwlhoKykdsxaKR+GWlD7UgWJx
         JJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773934596; x=1774539396;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFh9idnvGIKmQrvQtE6/tEDjWeUaVvRU4QnDPM5nnUU=;
        b=oLBSS4J6uVNFV7a1xpK5ZXKN2UqJGbCcMkihZDgP99Kep9AwpdRM7/cjfXEAkVe0SO
         b9TAu+zOCLH+rMZMBqnNpteQYkDFqqlXRUefuF/TNmbb9Ep0nqRenp1l9NIQMCHUDsbK
         gYk+TMx5KRDIay0hgBgzHh+HMpvXL82+ANS0Gmlm3Jn1K47lQwzpjIGYQFx/HMoVex74
         HlxJduhDEOeKBo6SPxYMvtukN+X6Fu+H+JQ9oSLDCoUKaemA7blIv1vQ0plOHai/jNOh
         Wn949sGBS1Xxn261WZ3EsxSFdwBvxSqw4qfQq+UDmofLS0RLZeQ1lPSpJ5Igdd/kOofP
         X5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj9xAvu2t9kxMwFd0ItmrhfANCH8jsggglZ8ooIcyQPWuUcq/9WQwiUkHPwDH9khOQnV00QLCMXAGVnjhw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7IH4MKMDco1OqHeIVLSxV9M8LBUbQcPz7z+Z3/w0xpbnK4ha9
	q2vtNIfELaDgEb5WUIDryAfwXeHjbaDnvwHmaiWgPJ+xe3UxMe8lTK0mejniFTf7pRA=
X-Gm-Gg: ATEYQzw5OZhfqUalvmVL6T6daQxohQWeadALejDJPLwwmTrXFG+alk3Z6e2vyp8pcOf
	TLbam3zzK3aaL7Zaur4AcDsFu/Ko7OBcpVld7YbgP1eHfJzuQf1v9kpPT4Ga98DFU0ZQQf8JKPe
	ZlDmGyVijiO2wFF3T+Uyxsvi0qa25THrjiCkCpCEU20cmDeLOX7wY5LgpB6zTfAdI3thWovknaW
	UpmWVFNZ0x3oqXBe/UuELQNrs769tbcX7AW26FIe4lq4TMiZ2sDGbq1ZSCAkb6BHrdakSCu4Rfk
	a0LsdZlSmCm+/ni5qClUY1d91a/xaYwKA3yXwEzP7a8d464RseZVKYZAjtC5LD/zGuV/7muwuJu
	lAFhUg9pe8vctPheyqUeAsUDb7JIfAaAT7OESZ4OVnHkM0AFPqFeX+/QrqsSWWtPVeBf8hjAcr7
	2jVJG5KKxAr6/lANLfVjxdxCySxilklttVFc1jvswfoBpizE2+ITJ44LX7GfPwDOjo+kWfFkUp3
	k7kfg==
X-Received: by 2002:a17:907:da16:b0:b90:4b42:a982 with SMTP id a640c23a62f3a-b97f49d8f36mr523464266b.41.1773934596177;
        Thu, 19 Mar 2026 08:36:36 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3ccsm457568366b.59.2026.03.19.08.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:36:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/2] Front camera enablement on Fairphone 5
Date: Thu, 19 Mar 2026 16:36:27 +0100
Message-Id: <20260319-fp5-s5kjn1-v3-0-9cf4b8c09567@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw7CIBQFf6VhLYZXKbryP4wLQi8WjVChEk3Tf
 5fWhY+4nJPMnBEliA4S2lYjipBdcsEX4KsKmU77I2DXFkaMMEk45dj2NU71+eQpVkQrKTUAkxQ
 VoY9g3X2J7Q8vjnC9lebwHjuXhhAfy2Gm8/q3nSkm2GphqWlYw6naWe1i3wUPaxMuaE5l9qlvv
 nRWdKkEafVGmLoRv/o0TU9KutSJ/AAAAA==
X-Change-ID: 20260313-fp5-s5kjn1-80a866aee261
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773934595; l=1161;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=uAUYh5Zld8KPgz29e5iG1SuJPPPdsG27z4mX5mhXib0=;
 b=yrLm0tOH2JQg9X98E+PvcMiPIwh8ekEX9M+YCBUg12RV3F6OI6U8khr48Qn9Qs1eRXWnc+/dK
 bYDx4ta2mWcBV4sK5Ip1yjbB9sBH5YJLt45RFOYu5Fr0SSb1cQB+my3
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98791-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 213002CDCFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since the Samsung S5KJN1 driver was upstreamed recently, we can enable
the camera upstream by adding a few bits to dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Drop clock-lanes property (Vladimir)
- Sort s5kjn1 supplies alphabetically (Vladimir)
- Add newline between reset-gpios and pinctrl-0
- Link to v2: https://lore.kernel.org/r/20260319-fp5-s5kjn1-v2-0-6840da94c574@fairphone.com

Changes in v2:
- Move cam-mclk3-default-state to kodiak.dtsi
- Pick up tags, drop applied patch
- Link to v1: https://lore.kernel.org/r/20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com

---
Luca Weiss (2):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Sort pinctrl nodes by pins
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add front camera support

 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   7 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 121 ++++++++++++++-------
 2 files changed, 90 insertions(+), 38 deletions(-)
---
base-commit: a282db4e6cca214bf1be92ea3060f31123172cce
change-id: 20260313-fp5-s5kjn1-80a866aee261

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


