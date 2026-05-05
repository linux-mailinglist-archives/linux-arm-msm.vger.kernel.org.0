Return-Path: <linux-arm-msm+bounces-105991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJW5GtEI+mlsIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 17:12:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E294D0056
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 17:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0292730345B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 15:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA28481AA2;
	Tue,  5 May 2026 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CJ4c9yv0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D845C39182F
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993728; cv=none; b=Rkdsi4tB8beDwh7Lo+CPZquRtGtGXA+oMLtO0R7nGsrSI7rbq62SU+duWUSvBkp/XccZHHDrAyE92fK1EOVGzb6djvV7uzDXJJgqK/2iu2Bt2LFRm/Mw/MCY1l6PODxtVIKYuLkgNGTD52T0xlanyfAZRxihWMHoaeGGrLEKz6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993728; c=relaxed/simple;
	bh=e6iO6AqvcL2w1JaOUC1qojxdYYhTAJtiPnAKr/SqAtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i6RW5wevvM2tOmtHOdi9H0v18DceXEox63P15pIpUGVY25Pc5AeuMz3gXwM/DowaTNSIrr2SvmLuvON0W8d/6I0MaxyK3xkiJF16lZZlPFFkNBykwWzqQP6Iqp6MhKXuFKaLBGecQxrV0ZTF8Bm0/DqJOySOJf/G69BSRSfMvFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CJ4c9yv0; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9382e59c0eso847460766b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 08:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777993725; x=1778598525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGdzEAjKoWOUL96OLhXpRQrCiSt7vyjVM/MHA0KsjY0=;
        b=CJ4c9yv0CGyPVWzEdGCBX+b2gRvsu2oYbEB8im/OtEH8zvSrwFLT3Wwhs9EELzFsaU
         LmhtFxFxiFTWInorhx8vu63ePt2tHqgMOQP7+PsbUDq+xvx06yaS3VAiiFO2t0zgPFYk
         j1UXawplhdPpbDEXKC1EdmeMGwVKpxq9u9hkyAIRXL/br1HRUE543yYj7/JK4x1f4lVg
         Dh+U1ymfGPd2hDJVEgolVhRMgoWF2cSejRMy8tpXltNBVlzJJEaZvHpV0g5qDIUUxmB6
         2idOaVVNImT5U2PKnOQh886E5nlSGJEIZeLNq6FmagiiRfpwjSXr+tJ8GbWKf3lwiDdF
         4ovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777993725; x=1778598525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bGdzEAjKoWOUL96OLhXpRQrCiSt7vyjVM/MHA0KsjY0=;
        b=pXMO2JMvTMO1dHdEniruKxcvqGDTo0czR9ZfzakNhtD6pXueMRvybRZIUt6W9nLGMF
         gICJwayxvV/WL6J5mIe+kHistfL+vUcgf40ofAoicXw05nXKjc0iK/35jIPs4OcaBOvU
         g18i8yLOo1yE4FJVQPjliS2SvNAYDf1ACSmrslqXM+dfUPC/y3vWZGI4i8K7T1eaHGkP
         Mi+ydwTc4eKCfOEXpHcfhs0We2YK5qhhQVrwoplsRaldEieJ6oXKGlqGfFB4HEalkbT7
         cA79iVdkdgZIMIrM+G5VORrPs6AgwtEcU0TM1iusWD4AujIqBQbLTYw8skW0HU57Doq3
         dA5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8UQuY+PXblOwt4+lYM2JIFZ4rEx7WXENjxJZj5Bu1geZeEPK+JWHHuY6LiC6q1sL0YzHF4BqGtQSQKovFq@vger.kernel.org
X-Gm-Message-State: AOJu0YwJId8We2MwE3GMCCfIdTnM2y/pB7ezbC5rg5/7kLcPkOqsy7Bq
	QoPuI1H0Zoj0hE92XRbScLLmivLqg4I57XDAINi8LAfL664GyKLZsN+/d2pGuNtjtaY=
X-Gm-Gg: AeBDieuspo8WhhC5/QdHxG7HHRlYL10qTbe5m1aDLfqPQ8mHHfPlnBdSsKfR0bvEmqg
	NwhUBeukJukle1TXPOyhHnZM39bJQvBBIcRw1WdWPsoAaohjgLvyHKu574UX6ALqY6S/GY5bSec
	QQocJg7mCtNEi1tWiATb3Liu34jlrvzP/1xRJrmnYrr80xUotcwtYPqdpk837jx1bo28tzqJJlY
	gJcxUpXFIiI2FFbpSBirJCZqLgIaG+fpnZQ8QlRLyNrBmLC4Rba6Z0aFRrw4H8tYJXJJq1b5WAk
	bMrUsO+mNhdjBa9Qt4PKXvEkQPGSXsIl1g+SbwrJB9yejlThSZRPjF3X+a1/oT0J18sUa1Tv39A
	YFcbZ2OgNSB0aCQpSnEaXtRo7+x6NMu7FNFZmxYv7wdMJgi5IhyLQ4/QFDcfTtvr5gKdby+bTS0
	g3MznEtaWYk3x95/ET8DP8YQyk0QD5WwnN1Ida2HTUBoZuQOVW9b42RDhHlRZcnj9aqtNZY0qNr
	SkyLbIVg1zehgRFLO1W5smZpNx7nFFxRArEuADzsJPTrzQgPqbYYPiBKtQ=
X-Received: by 2002:a17:907:1b1b:b0:bbe:7709:5a8a with SMTP id a640c23a62f3a-bc40f1430f8mr188738866b.7.1777993725212;
        Tue, 05 May 2026 08:08:45 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc28c4ea2casm196662266b.53.2026.05.05.08.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:08:44 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 05 May 2026 17:08:35 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Fix address in
 fb node name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-sm6350-misc-v1-3-0b9efc22690c@fairphone.com>
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
In-Reply-To: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777993721; l=945;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=e6iO6AqvcL2w1JaOUC1qojxdYYhTAJtiPnAKr/SqAtk=;
 b=9EXnnym4yo08CnpAVUWJ2SAe1B6N2YWKc0X46Q7HVHe7x2xfCH7+zXVdiW9vglwTvqhdE4V2H
 FijuOOlhO7RC0U0kwnHx/lGxCCVj3TyRn0/GhBiiWAbMmnIhKQVgMoj
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 66E294D0056
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105991-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,a0000000:email,a000000:email,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid]

'reg' is 0xa0000000 so the node name is missing a zero. Add it, so that
the reg and address in the node name matches.

No functional impact.

Fixes: 4cbea668767d ("arm64: dts: qcom: sm7225: Add device tree for Fairphone 4")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 3964aae47fd4..96afa42ecac8 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -48,7 +48,7 @@ chosen {
 
 		stdout-path = "serial0:115200n8";
 
-		framebuffer0: framebuffer@a000000 {
+		framebuffer0: framebuffer@a0000000 {
 			compatible = "simple-framebuffer";
 			reg = <0 0xa0000000 0 (2340 * 1080 * 4)>;
 			width = <1080>;

-- 
2.54.0


