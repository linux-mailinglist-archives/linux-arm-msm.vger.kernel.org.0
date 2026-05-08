Return-Path: <linux-arm-msm+bounces-106706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KE3KncB/mkTlwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 17:29:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD134F8B3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 17:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D458E303F298
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 15:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D89E3F0743;
	Fri,  8 May 2026 15:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSCiwAGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80853F20E2
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254029; cv=none; b=a4sVHF5KbbXk43XftN31afDjU26wu1UIqIIvY6OpehPSS8TnqSQLA0R+wGj9VppnQ7lLcpmUA3g8XE0AU21vAwl3qC2kszTjE3XZiUGZupik2B/oJ3wxTVA2U5K/dguMi3EZnHGOb+/JfZMxeJfiasR0Rz6qbXm84OdDd0EXl/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254029; c=relaxed/simple;
	bh=IT9hKFqi+NXwIQxrrHDq16wfzGZE5aP5iqbwqhp+jw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=diOC6JDAkG9PYbvRxibET0wQeNWfMqwRq0aIi0bCPLzo+nDEofHKyaP/g86zjTSynyN/LoGLqhA/O9b9C0keCPQZHgYPrlcgagPzX/+tKR6PbokrZG3kzk56tq5mNaMu0gj7g3jIgtpDzSerBIHPSWH6GTq7w5arvOzV3Tax6wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSCiwAGv; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b4520f6b32so3987188eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 08:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778254027; x=1778858827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AZLkoMPXwZ4+vxuE7rGxM/UFbOO9EmAVj39oI/ALNs=;
        b=aSCiwAGv6u2vwzpimVbC6qrU0JTFy36QrTPreFqDn4gI9iddgmvJn/zylyasiLEbc9
         vGu2rndSZY3oRTEICiGC5V+xCm10wK5Guw5Fc0hC2kpJ/sqc8cSujcJyRTWZH4PwARMm
         WYIIfmFKTUgv8jNwsxHutZw1I6pROu/8N7cn8w7cUpt6cVXrgGnnOplacSLpCDqcOl0Z
         x6+/DGcU1QC2uUzcXrKAiHa4vHSBX9ZhYchh1Giq6A07KKjsYKJ4TAEe8Uvhi5fqOgNc
         PMG5E+DmHClTuQcvBjbRrK52UQN4EYZYQktG9Weapy1DrgZRq2Szy4ipzhVoZmWHoPfa
         CjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778254027; x=1778858827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6AZLkoMPXwZ4+vxuE7rGxM/UFbOO9EmAVj39oI/ALNs=;
        b=WkjjKh9DKBwIBkpbAJvB0OlSv29uu3uzLmr2grt/M1oybK0tlbn3hu72thTCN97nRr
         b6VEVRfdEJ4MkIat1e7dFjqEAj/LVLBtYeLnJY/9tw/lRlKTIy+OOf50kXIFIKavv1tm
         1KTTTuRKpybY/jWOoMKprpjadCaLBNv3PFdCGKQrL0LYKQ6q0FtSUCJjKzJtHMU6eKSO
         7+ldIybV/gLAcXmrdpG0s8d3BS6aWQ5qpZZrWspp5FVWB4lFACywKb3R4YUzQFlzXBtj
         5d45MQv9YZz7w6zcw1n5nUbpdzvz3IpRpOQxiepXXbipvNY7QOKdT73xcVD7lqthtVVD
         72gw==
X-Forwarded-Encrypted: i=1; AFNElJ/OnN0KZEc9BHIMbfpJzHgHkr/PCoo/c+F+2X+Hzxu2LwwsKi0vGL7SIy0jEo+gBBnKXrLhH8wqfr3s2GxX@vger.kernel.org
X-Gm-Message-State: AOJu0YyNICGXyXB5Jd15dQHe3WLFb68AEX0HIalKnPJhEMrq4I9FH6ij
	P2qWM+KqV+UOvExFiBBqDhR7/zTcKcF7R7veu/BkN1VxSj/bZX5NS9Wu
X-Gm-Gg: Acq92OEb3mTI7t/dW2qeuhFi7snNJhoIago0W4Vi3grLXjv8RHQB4tJNVSjCd/7NaRY
	0ZdzHI2nzhaAFsbf/Izm9D35xfWVyD62+ahAkSYCNMElJoocRlqzQvQ/X+0iVGlUQShBdRgAQsq
	wJzMhCReaR1c35u5GJzinwQolxqbTnLb5NnqZVIMbKGWfYnWGFcaZ4IyZcjza6svR1AL5ENDb8y
	kf51iOrnt/J2C1k6p76VgPHa/C2WYMA3Tx1Cha1VC/tISfTTLM+cpa01Y7+UMYSwMoIbMySku63
	uU+FhkGidtC43nGW3bObWMqFBoGu4hymOABgyduSJOGsi00oXnRoNEOZqAEEjXKfaLhg3Mza2eL
	ra4yJT/ErCd84eQFDvk8qfWB/c0jXwvtPfALPB6iRGwS29fFTpGZrxTycAvCoKYAjkRffcvkOvA
	GOFb7mMFeKKgUJKlpmHXEkxRXoSFn+A6dje9ywV7KnfmzbSGY=
X-Received: by 2002:a05:7301:1014:b0:2f2:8857:180a with SMTP id 5a478bee46e88-2f54d69aff2mr5899190eec.7.1778254026776;
        Fri, 08 May 2026 08:27:06 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:27:06 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Romain Perier <romain.perier@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/5] ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193 shutdown GPIO polarity
Date: Fri,  8 May 2026 23:24:21 +0800
Message-ID: <20260508152435.21389-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0FD134F8B3F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,ucw.cz,kernel.org,st.com,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-106706-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,sntech.de,amd.com,hisilicon.com,sartura.hr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.68:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lumissil.com:url]
X-Rspamd-Action: no action

The sn3193 shutdown pin is active-low[1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf

Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
index 258bbbecd927..c528d42bade5 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
@@ -147,7 +147,7 @@ led-controller@68 {
 		compatible = "si-en,sn3193";
 		reg = <0x68>;
 
-		shutdown-gpios = <&tlmm 45 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&tlmm 45 GPIO_ACTIVE_LOW>;
 
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.54.0


