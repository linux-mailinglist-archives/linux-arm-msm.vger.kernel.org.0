Return-Path: <linux-arm-msm+bounces-92382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2A0RImuVimmuMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:18:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F8F1163CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F12E3039EE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011792D3ECF;
	Tue, 10 Feb 2026 02:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZG0CgFv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49922BD597
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770689870; cv=none; b=Sr9RZkMMKPlifAz+jytduzmeHTAeCnAlRM8MY2sLPof8x2qyDwmbW/9WrjMViO58xYa/YY1BjbF3Pdr4CHWboO5SfUGLBY44bXonKbxY7arqNLGCZo7ZSAt1WiYOPB7jC1P71m2KIPxHC1cQr9kgM2FXmxonNeo+4QJcZrvcZoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770689870; c=relaxed/simple;
	bh=ecL4HzrmaN1g6G3Gfzm4vg8zhMlqzVByTHdXOIbJymY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6lhhmF4dFY2vnAFhr66GT/iUGhjuC3+mk1DTRAXn1Jsm3pGaPkUERzgdaQoP9lD39/MbLAG9kyZyyqQAmUh140Dn3abIWdYUbhv6YCJaC0X40CftTTQeRRMb/oBxbwVykMAIgO46sFsPMU1gvgKCAnX6nw8DVSqpkGIETyFv90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZG0CgFv+; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-896f5af3d8aso4398386d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689869; x=1771294669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPeTKP/Rf3na6Mzwukzowm8bsD512Ev2e43pKFOWzjM=;
        b=ZG0CgFv+2P4jJhUlTeky+U2gEfsUAIQSSLzrxWlzGXs7a9JcGon0QiV0CMnscRAh+Q
         vPSxk7pYqrO+reXBSuWY6Ns7WAENoDwluU2UUsOGvupWHZFhezJG+eLkXkJ3jnVOFga/
         BwdQqoGOptSOSWXcBFZAVi2DuA0gcsIaSEzwAeuKzCKjWE58PMvv6XBMybV35/g2IMwI
         1Hph8zk63MjWWchMvztW6lzYSJ2JMOyMt3u9BLl7tR+DgjXomXGQmLqvsYRk+D8e2AEX
         +5LV1s1H3cwuxLiVdBbni186shjj/MXySYw7imbHBW3SdhoqaTnNziSePVv3GlMPHF3H
         bIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689869; x=1771294669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IPeTKP/Rf3na6Mzwukzowm8bsD512Ev2e43pKFOWzjM=;
        b=hM8qjgkJE4poVrrESSS1f2Up+UJ23yZ/DjltvxLbB/dR/umeuYiRCjlBRnvHWg5RgZ
         zzEoTGZu/V7iAwmAF54vpUkTegpuVk4xmjTJ58I+jxEocLXBju9dp6aBt8S7tgrtXXab
         JHvxJ8ILfzHMJ1rRELQ9v+wA4RsAGdLTA0C6wB4JoNOyN1XtLzsIpPVvyC5IOyIoyrWj
         bgulAfzRGWvLbhOZSlGh3cGvAnyvV3FYgp2yqk1JRp64cCZey5zHBmrqzPD9PztGopdF
         zYVTKubttB22g7E41pI2BVYDCeQzoYBkMYCVeURWxQYPfaGVA3gkre2HkeU/nGueGdcm
         6PLw==
X-Forwarded-Encrypted: i=1; AJvYcCUpxiBeKrJa6+jcdHhLphvSPftzAVhJCc/YuXkiFQeGQwBIDsVtsF6fn+jR/DBVVcKwIQIjS/lb498zNWxz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa0/VRmj3NDafUXUd4rF3MaqtkXHY+cN66yMkZK6YAPce/M+HC
	SKoW/69Kwc2NpXIeIY/GPi3d1TkojAnkdn4/xiMs5hc+z7ziMwvN8wBr
X-Gm-Gg: AZuq6aLn105L8P6KVo3YQoxPqbpum9ZFcaRHQq8fEukj+ULxTnGTNI6SXPVVxvQv7qL
	oQcC/D+p5YPeO3gX2RTU5Qm8q1WES0V82Ej/4wVfYV1LOtxmj2jzk1yW2JB5dVs2zATq5DyFwbG
	UAm9PzuL3rDKeYgC4stlPzNSHbeGtFdJmOsJ6UHWDSwqv302GJDurCF0chQZP/96J6oYnH+Akl8
	G5FLLkO3pGDriumIXNg2xzZ2oL8u1A9qa433ywV9ckBFoTQyCP2iRzibWlcG9/s3MSc6jQ3WoZo
	JHRw7Huz9frdPZMtk5vJZsFy2MIlrU7oPJorDikuMkhpIoUA96akJejG1Y37S1QYFCh8ylSuXk6
	lPNfqknhWdKC+AAgY2tePMFsWXjAKsGM0iia0sx/4c9SGC2PpcKFW9nY29NNiGaMIUcEL3EN9Fy
	8JMN0OrJRx2i3Jyvzc41x+e7moUnxNoWRtOwnqZahQk+To0t7jZfZJNJ+8xIi/DNhbIALyRzhSz
	Bbxl6N00P9PBBEVy4BuMa5ONg==
X-Received: by 2002:a05:6214:21a3:b0:896:f3de:cc2d with SMTP id 6a1803df08f44-896f3decd51mr114935096d6.21.1770689868858;
        Mon, 09 Feb 2026 18:17:48 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf7aed5d9sm930556585a.14.2026.02.09.18.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:17:48 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: pm660: add thermal monitor
Date: Mon,  9 Feb 2026 21:18:19 -0500
Message-ID: <20260210021819.12673-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210021819.12673-1-mailingradian@gmail.com>
References: <20260210021819.12673-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92382-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_PROHIBIT(0.00)[0.0.17.148:email,0.0.13.72:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.85:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 26F8F1163CE
X-Rspamd-Action: no action

The thermal monitor is used to monitor arbitrary ADC-based thermal
sensors. It is suitable for use in thermal zones. Add support for it in
PM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm660.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
index 156b2ddff0dc..7cedf6980b34 100644
--- a/arch/arm64/boot/dts/qcom/pm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
@@ -197,6 +197,16 @@ channel@85 {
 			};
 		};
 
+		pm660_adc_tm: adc-tm@3400 {
+			compatible = "qcom,spmi-adc-tm-hc";
+			reg = <0x3400>;
+			interrupts = <0x0 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pm660_rradc: adc@4500 {
 			compatible = "qcom,pm660-rradc";
 			reg = <0x4500>;
-- 
2.53.0


