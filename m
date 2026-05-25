Return-Path: <linux-arm-msm+bounces-109682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPU4NBlhFGqgMwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 16:47:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 644D05CBE2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 16:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C515530055BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C593F1ADF;
	Mon, 25 May 2026 14:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlFEFbtE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5662B3EDE43
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 14:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720471; cv=none; b=Ld+PDvLWKs7/2rpy5kOwAAb2a+b93vlsRNe6aozjBJI8vicvwNdJNQtylrn26UMnqfOXigD28QUVEgyGxJG7IpQI4Z6DFLcRTBeEdxmkNAsZ8TwuwRz3hNT0W9HGujZqxbmg5gBgooc2cLxfHVKDuCICOjeNSbMt4Ru5/Cvmrks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720471; c=relaxed/simple;
	bh=rQev9snjUDQDOjiwl73HCrNzxpOg3GjolVgiv9srQUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dydNkMB/ilWm8SabK87dTts5E/Fd55mOiBOvlPnUkJiFlocJifhhgRcJQFZH7gKCpXF23wxCnsWQcwAcpscWEL5sW+5MhyUMw28z3VlavJMy4xtFoL8kM6QBLqxCDG/2ShmmR6ZKGa1nVE8nKz/Y1frbdxupyBBe/Y2R8Ow6VCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlFEFbtE; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36abfe17c11so1482626a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720470; x=1780325270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVVGG9O42cYkv4+MEhpJhN2Gsiqdr8SLjGLZwhgYa/0=;
        b=UlFEFbtE4LX8kXg4191YimQ3eaMGAtBr7w0P51NQTkYRRd/JGvwIF6zH4KVfzCEFsf
         ck860WhFm07gR+HHLGAW3m5LbhgNvOFwjqfBX/eGYW9o2BMDi4T2mcqF2yKfgOfLkf7B
         c9YvT39L8wBDCebbfMvJpaY5vpmu6S8VP5b8gTEWqfqA2JkB2U3KfOWIwPg+N71ShVkd
         2my3IJnbNudbfyMSjOEDBG7pzWqQNpmaOXPmIWBPq5t2tzmiCEZ4WEr8RQs9OzMzrk2h
         Y5xGzLepZ6VsIY8bogN1TU6nrewVqakKLoo0SO/EAwo1/L3Wllh5KLmUW/SHo8Yif3YL
         J3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720470; x=1780325270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rVVGG9O42cYkv4+MEhpJhN2Gsiqdr8SLjGLZwhgYa/0=;
        b=LoQhCTWA9rcw+XCQrEsz4OfRBzLRcT0yLtXeMnAIY/RNAqUQzOxWTYo0uKqbyocxgK
         XRbCTsobieipOJMbJMA4J5G5amPKULeIbT3Lb7TjExZ2UvMW51Ry35Kcrivulf8ijm1g
         g0aBvl3JyeJ7zMxfE7jMtL/OQXDv0N+XWI06wK+l+oP22N7i/SPxQ7vatCREro/PXSDH
         3H3Fk7q5wIUIXKMydYdTFb+dgY1tp16CAB5MGOs5f7txlHWjo4jJ9jUUtoM34zqZpDqw
         IPgx/rZyh0XUQspKlkJOZ7/zBQD3T6/H96M1tyr2Mk2lNZ6jsndqRpO3LS2PB7S3PqWi
         2Xnw==
X-Forwarded-Encrypted: i=1; AFNElJ95fNUjeeIPsAKNZiLmYMX4dBNju3+sZ5STeoBo8FgLQn0KhC/vyEXo/hYibImhodK/mskqVZ1x7nRT735k@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9RkfAFmOipGPc7kH/5mAdsjH3LExdDl22xp4omoOkINqXWcPk
	YrT0mkVaFQKDyVjqxRBQWwfxstgc84VS+Q2NgbzRMZLbdhjTw3WzUdzv
X-Gm-Gg: Acq92OFJu4CvocPoKHZ3clzbJBe8DHbWYPUyEZ84qgQ/cSBEtuZVsSxoyFyD0+K/9S0
	x490igHSaVyXgOyu26KG/ELV/gT8twaF2Nxe+LPGMZTpoLWuwt3QNvjNJYJZBbe8V857yeCpVQ+
	eJTqX3BFZBxJxq8WY7/ZzuBqO/kD5iyWEUEkC+a1hIHGXYAjhVmksqDDvEbtYdR8qrophPOInVV
	JM7S0F1cG3bgtq2AaqdVO2I3kiQX+Wh4rqh0XpqksKfyfFP04QlEX8JfqQbGnXlSMvEBxyDDjrm
	pFIP2iMmuGDR9WG6YEuu37jJRWML/1tUpf+HjpS5aSuvnpety/H6f3hB8flDUMuDcDS6XbDDMnR
	qcTAQl+6DuayVLzP3mhsLxYyviPgWEUSYtzEzD57Ltejg13Ab3aDH3YHnNBajCuFYVexMRjxzj5
	Gh00yVMkMF/wAP0dIK4etkCMbdA2C6SV6759Forac=
X-Received: by 2002:a17:90b:5284:b0:35f:b7f5:9b3 with SMTP id 98e67ed59e1d1-36a67420e95mr13511527a91.3.1779720469769;
        Mon, 25 May 2026 07:47:49 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:49 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Romain Perier <romain.perier@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 4/6] arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO polarity
Date: Mon, 25 May 2026 22:46:10 +0800
Message-ID: <20260525144629.498630-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,ucw.cz,kernel.org,hisilicon.com,glider.be,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-109682-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,linaro.org,sntech.de,sartura.hr];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.68:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lumissil.com:url]
X-Rspamd-Queue-Id: 644D05CBE2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The sn3190 shutdown pin is active-low [1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3190_DS.pdf

Fixes: 1c8cc183d070 ("arm64: dts: qcom: msm8916-alcatel-idol347: add LED indicator")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
index 2de8b6f9531b..6d51d6efcbac 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
@@ -197,7 +197,7 @@ &blsp_i2c6 {
 	led-controller@68 {
 		compatible = "si-en,sn3190";
 		reg = <0x68>;
-		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&led_enable_default &led_shutdown_default>;
 		#address-cells = <1>;
-- 
2.54.0


