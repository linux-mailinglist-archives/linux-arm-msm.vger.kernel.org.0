Return-Path: <linux-arm-msm+bounces-84361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16539CA39CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 13:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 731CA3085B2C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 12:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C21D2367D5;
	Thu,  4 Dec 2025 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="n1/ziDpP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA94334C11
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851358; cv=none; b=Vg2fYVrqsO+8pXcSmEguBr+maEz8zk1aufsk9HqtWAqjmEJBEJNWJPA/8zPZfnEEh7WckmZPTy98lBMZb8IYjhmf2iJNE2PcqDyIDwWfurYPH9X32f9uGx3xRUx+laA9expurIw8A9+zbnKnDJ50+IUzhsBMITKEl/5wx+d8BdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851358; c=relaxed/simple;
	bh=l/XBAG4CUGdCd8uvlOy4ZQBjC1QnfFNVrAFe5tQ3xuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGksd4q5rZ296XK+srIgFDaML3q2Hd+NVPdVkflZv8TFRUhdg5iEuE0Ak96P2XphMjR/0NpIFEQYPKsTWe5rf/k/HDn/2JUA2IP0uI87AWc6rDzagpRT6bNC7wQgSBM9se/3iyhVBdsUNPz6pDutN+NWRO+4V1n/rpDrlUknTBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=n1/ziDpP; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b79e7112398so156222166b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 04:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1764851353; x=1765456153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezLwF9vcaQPh2qIuGSQT4jtvv+rSMrrNcQfR67LnXW8=;
        b=n1/ziDpPURE6ByEKefRnDKBtnf0GmLjl9ORBvvPWQiVshsDYSoA/leCDxLCUWmnBUp
         9l4B0Pj4FFnTX4c8pLbCy0cazgHFbL+pRIRdoFRsmmEdIrqycgvjspaM1E0IPdaHT/Vm
         MDmxW5BMF9a1DCeti7T7Zqn9v5z3phREuMzY1pZhfPEGtkc0qUSgz5a4zU6+2aZGlohY
         bvCp+IqEqC6qDWfxEC4hkVoSUL1DK7jd/QDJvNlc7lQyOPKvpH/c7TFQ2kdifWDAy97t
         ToqknvPvNl9SXp5TdMFrXYXpIJbL2sC28QIUz4YPVTxpZq/Jyt6pYsWDVtxkwNfxhbKy
         Td5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764851353; x=1765456153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ezLwF9vcaQPh2qIuGSQT4jtvv+rSMrrNcQfR67LnXW8=;
        b=KGvyJ+TW3tbX3VLfPZe3Pr3WlUY/EBfRdeJKGYRn3y4UdlW0Y70VyUQ7D+fxcV4Ed5
         x9poWhHcyZNsxVQU9Rq4YhA7NsZ/4g5AuOKefCzl+LFsZSjwi3meBfn/+1MIJXYuwAnB
         NAU0lCwhSjukzTpadNyOAgI1OlzqyYafFFj6MD1dk+7DXQbylFGWVlaEUaYSVQKZRTkz
         SH6zKpiTxpprahRXFB20avhXXisD9Br8ALcIs2yLvbIF98RtAXjx2kCuf34TUQILxZiv
         iPrziflvxAtHxrIRL4EqPlhd2Cv8xzaexXnUVnuR1VFC0SrGfyuvqV2AVzSiAoP7uIFy
         C5Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWzBLUD8hniLv/lP4hDqd8RiozgM9Nk+xawIIx/n4IJoZH9RPgJ2CrKLS47JAcfwA59ktghmgc1FsOcSEuL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz06XFeC3JmHxoxXWfgCF5wBU+NzfWEvS2zIgGnyzPkU11Rshnc
	5/df0ow/psRuSLXFOqQxfm/9AINUIseVr8sWVd+THpVgzaKeK3duiCia2gL/NuYSm4g=
X-Gm-Gg: ASbGncv11OW65eOivl1HXvNmOTBugW3qlpQtX7WPUfKA1wuEaYRLPxweCloZVw21W3A
	KWfGN8gf5PemL8cG8nNv7Fi+BgLosY8Z9VeAW8MQTMMhJ5fc37XTTcHpdilZrcJVR6OgdWTSIoB
	YhPD+0czjAU3cOL66AZBCfuyizqcbJ+cM7d5TaIHCrw0smQCoXZ06pW1JmG9DHKmoqoD+vNacUR
	uBXzLsM3cycyZdD+isn5xg30t5gqLYFmlKNduzhvm8ccXC7YzsgDKSaDSNnH18vX5G+fqa3Efra
	At65bs6t+XPjx95iFKhBoJSuBUHpLs7cEFe/0t50x7aBpk08tQCaLw1o88mN3aBwJsmEppaljMF
	zM+OVAkCQxG8IP1EhI2U4XDCiE3cRXydg8ms5DhR/4PAtT4JEuEPYA0aw5RMIYZ+zTWJpilfnmX
	MOcJ4ZW0IpPgF5ab4SOVfeNQn17psH6Q0xyajdqavFhLTLmW3II82nA/SNn51CY8RZMFKD
X-Google-Smtp-Source: AGHT+IE3vTw9W8q4bFu/XYete6yOngVJe+jHbROTOV0J3HiQ6WjaS2FHPZPK9m9x4/GTh06qLnayww==
X-Received: by 2002:a17:907:a08a:b0:b5c:753a:e022 with SMTP id a640c23a62f3a-b79dc51af60mr653042966b.29.1764851353085;
        Thu, 04 Dec 2025 04:29:13 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4a2f19dsm121351666b.64.2025.12.04.04.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 04:29:12 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 04 Dec 2025 13:29:02 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add vibrator
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-aw86938-driver-v1-3-ebd71868df3a@fairphone.com>
References: <20251204-aw86938-driver-v1-0-ebd71868df3a@fairphone.com>
In-Reply-To: <20251204-aw86938-driver-v1-0-ebd71868df3a@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764851350; l=1297;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=l/XBAG4CUGdCd8uvlOy4ZQBjC1QnfFNVrAFe5tQ3xuo=;
 b=oUDOHk9OFhVELfWu4ySXOPeJM7FZNIQTDt1McgBSEATP1sZtX65Mo0qcnp/4gU21oQEh8Lwcg
 8DFYoi9AaQyB27J41F2T06/ZnrZKcCDteu0doYUSUO1371sZs8eXuol
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the required node for haptic playback (Awinic AW86938)

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 0a758fb7f4d413a84cdae695c38616fc6075db67..8c43bc9c1d8312f22ad0aeed84b23d52910e0ca6 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -717,6 +717,16 @@ vreg_l7p: ldo7 {
 
 	/* VL53L3 ToF @ 0x29 */
 	/* AW86938FCR vibrator @ 0x5a */
+	vibrator@5a {
+		compatible = "awinic,aw86938";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 80 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw86938_int_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &ipa {
@@ -907,6 +917,13 @@ sdc2_card_det_n: sdc2-card-det-state {
 		bias-pull-up;
 	};
 
+	aw86938_int_default: aw86938-int-default-state {
+		pins = "gpio80";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	pm8008_int_default: pm8008-int-default-state {
 		pins = "gpio125";
 		function = "gpio";

-- 
2.43.0


