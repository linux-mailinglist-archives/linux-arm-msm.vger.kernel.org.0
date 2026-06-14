Return-Path: <linux-arm-msm+bounces-113043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y1qMDHGnLmpp1gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 15:06:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ADA681127
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 15:06:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b="GeTEcTb/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113043-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113043-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FF113009014
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 13:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54B0386423;
	Sun, 14 Jun 2026 13:06:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1377E31DDBB
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 13:06:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781442414; cv=none; b=Tgx8+AuS0UGljJCbQBIt3p1SObMA2ytOVFunuk2VEbDr3lWIdqWpds3VSnj2pOIg2yDFryNLDO614rBigegy+w11Y/CkhP2/r6ACgzLCL1O/rceAdUsm8x8WH1m16N89u1sqfxf5gWKUqVJgmrnhJR4yRffNLN8Cj5oslEPDoHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781442414; c=relaxed/simple;
	bh=745xk+d8bU62cDW9chGbuU96+vAIrE7f3vnioeAiqf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=almPNXUqwpkQoXoyuYxWn1I8LUNxFVNSVNWBfW9eaCyhb/eqfdccUCHfHt5C0yc1HVR3bSKL743rIUpRjoNC3hCKM3LRJvyr3ouMAwbfuP8KsXEYla/QYiH7IuQLKDol0s9pYFzuT+5fdVvX4Ex4AuR8YORwp7EF9sG0Dd2wvf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=GeTEcTb/; arc=none smtp.client-ip=209.85.216.46
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso2027659a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1781442412; x=1782047212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zij5vWCaKi9JF5NLKqK6c8ikNCjMvtbTlKZgqjFTiHQ=;
        b=GeTEcTb/u2rg3b7QArOQEJEO7oGrGHr7a6XrqcUd85PunLkVtDgjL9OxtlVlFfPwu6
         TCGz2pu3kqg8sw/UgTsLcGa2RomWplMPveL/oiLugf0yegI6lSHe39XcomJIxQtMjafw
         vCnm3+uYQQqVD07rFuSr2ZsEB6weDWhsL6+P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442412; x=1782047212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zij5vWCaKi9JF5NLKqK6c8ikNCjMvtbTlKZgqjFTiHQ=;
        b=OCZw9VTdyjnSP9hqwjYlhxEzQSn6oXO6XVUowP/JdHTAgvqGvJy2cgxnWj6wvkhJXB
         ZeL57+82cs4BV8pifJmSuyokkmMlKJKXT3UOi7CPweTY3austz8+FhLzULamYZip1Dw1
         iMSnTxi1wRNW/cQkz4KV2caNLknhEEUeX0YC1Uewb0FgmOQ8xWFIj+AIFPiv6bpj4AI6
         YyRuUPogJ16f3K1a8d7KQPThYcPaVFHZw51ugaszARHKzPFOmrTegKQ7RQ9bi21opqks
         kROHxHXodiU9dRHBB4yeCrNVf+xUpDgDbRkBGaZztLsNQVR7s19v4zQ7OPvA6VtpZYyY
         MApQ==
X-Gm-Message-State: AOJu0YxrsiZ25Ry/xFlDC729YHHDKFiAXUc5FUFmLEY2IRDtY5/e1MzG
	R3mJqmhaJU741qQigMMvBY5sx1T80kKPaLX9vChIjHz6Sxa0ldXdII/svRYfhhe5yKA=
X-Gm-Gg: Acq92OFWLUHoYhbuJLVPt2ndjl2tO59INyR0ppBVuFiiDKP+OxvIvdthPVAcFeIKKkr
	yT/QratmXh/O+9ic9KQ0KOlwssygekYXewdxRz3A5Yk2m+J76NugXiU0qrNUIbCnAI6xb1vzENt
	c4er3rSW1tHNkpPj9Qy39qm2c25UvfVK5OmAIPRmqegXHDzybuBqvH7KQpfHCbIjkXm1NtXs0Ua
	+xWR7ypOeWKrzK2fr+eO1irVxYoLGPA3onQTv4QSCyAGDQYGbvK26sriY40eppe9xoWntIo9/Dw
	GWO8VJNQk5aEx/Lj/tK33NLmX251f53opoJP7KFurAM2zbr0V4ekOFJz/6cgwOJ46PFVLnDaQre
	4UUdK2Q1ZYV8Gu4iOxeDpQDCYS7x8CxaYUF6+js0ZTCUmIpsRE6//AaUbdJvafvAuiFE9YJ9oC/
	RLZCgbtQ3FQmfjLYAHDj0lxJUjO43pDBQqfwcHTxCobfXvvi4zz9U/HgLLvXmlYET2gn4FPjaTb
	1HSfsI5Vr5A+lDcIJUTGK+5D9Z93xLexJtpTsXZlqTaUmLQYyUaBLBredwe0hOCVXRPn4o2QicR
	k3rzRB0NpaGXxY/sTbuwJVBUaV0HNv5iA5uR+07f5SuTaWOtTwsE8s3Rc4hVpA==
X-Received: by 2002:a17:90b:1808:b0:36b:bec8:94cf with SMTP id 98e67ed59e1d1-37c2bc87071mr7283647a91.9.1781442412426;
        Sun, 14 Jun 2026 06:06:52 -0700 (PDT)
Received: from aegis ([2001:fd8:4d03:c800:f499:6f6c:fbd4:8f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1c4abe46sm7758344a91.0.2026.06.14.06.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:06:52 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	"Bjorn Andersson" <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	"Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Hans de Goede" <hansg@kernel.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH v4 1/2] dt-bindings: embedded-controller: qcom,hamoa-crd-ec: add Lenovo Yoga Slim 7x
Date: Sun, 14 Jun 2026 21:06:17 +0800
Message-ID: <20260614130621.68811-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113043-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:sibi.sankar@oss.qualcomm.com,m:rdunlap@infradead.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hansg@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-kernel@vger.kernel.org,m:anvesh.p@oss.qualcomm.com,m:maccraft123mc@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:daniel@quora.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[quora.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,infradead.org,kernel.org,linaro.org,gmail.com,quora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96ADA681127

The Lenovo Yoga Slim 7x uses the same Embedded Controller as the Qualcomm
Hamoa X1 CRD. Add a board-specific compatible with qcom,hamoa-crd-ec as
the fallback.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
v4:
- add reviews and acknowledgements
- updated dependency URL
v3: https://lore.kernel.org/lkml/20260526112409.66325-1-daniel@quora.org/
- new patch with DT bindings
v2: https://lore.kernel.org/lkml/20260502063518.15153-1-daniel@quora.org/
v1: https://lore.kernel.org/lkml/20260429103301.17449-1-daniel@quora.org/

Dependencies:
https://lore.kernel.org/lkml/20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com/

 .../bindings/embedded-controller/qcom,hamoa-crd-ec.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..813d41769c0b 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -20,6 +20,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - lenovo,yoga-slim7x-ec
               - qcom,glymur-crd-ec
               - qcom,hamoa-iot-evk-ec
           - const: qcom,hamoa-crd-ec
-- 
2.53.0


