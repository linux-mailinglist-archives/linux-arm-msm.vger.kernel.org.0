Return-Path: <linux-arm-msm+bounces-93028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK6+MdCxk2kK7wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:09:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6890E1483C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E0B83027114
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3071E260C;
	Tue, 17 Feb 2026 00:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m79VDRKT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BA51A5BB4
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 00:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771286958; cv=none; b=SMuLLrXk8tLB5aXTxzUN7O0jBxSQj6GBiidPlguBVRNq3XdT4jsIuI6dCNuLNftmYgJ+Dvrz3JsL5BQDANYU4RQ5gd7zDoC7hz+1vzcpjfVTxDPtiigRhMPm77QRoezOKvu9hDLx1LzCM0SjnMRy3SrVsnYkFFQdPvjVydAOyu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771286958; c=relaxed/simple;
	bh=89EYxATezOfNinwqg1JLoUYQjiSppo2jl1ZRgBBT3Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpZGtr1nE0fURi8cCH6FEih0AOGD2u9/Pg4zf7xQuFimnF1WptMhlcVq6bC0TJv2nV3enZHRUYI425Yfh+EyVsIv3SsLDhCIR3vZsgCxC6UDnTLKxRwWZYAUO0iQsw+a2CXzjTKbok0AGvDQB/CJpqYLg+L4Xz7KsPzos7gHiyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m79VDRKT; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cb3825b0fbso360348385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 16:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771286956; x=1771891756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wB96g5tBmbZcB3Dn6OFX+n3pGQOYEK523R4mr+xrtp0=;
        b=m79VDRKT4J36EkJlTMwhP4duBFDdOnwrcJ/sckVe2tLGvkHdXCRx/hSLsnm0vVQehE
         pSE9Ny1qnnZPjKSbv1241oP+gmdrj74VehJ63CkJpWqdRYB9Uwz8zTTWhrbaNh7Q1pZB
         bmMwxP5U6mr1Fx2cxsreOWit6Nim5r+L6F9hdcKcbA2EXD4T3V+HOhfEwGiW+jdaSjYT
         qVUscdGxq45ZCNltvmaGOEwfScd26pL0JcV4Lvcz8D39PCZERG9DGWv2wLwOSvX5ude9
         FTlVnrGjf+SX42KOsZut2GQmM4BteGnw9Mt2KIu25oUz+Up/sU8shlHE8XaxZkpdesv2
         emuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771286956; x=1771891756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wB96g5tBmbZcB3Dn6OFX+n3pGQOYEK523R4mr+xrtp0=;
        b=hMvEAtx49UZklqg7FoRXgRYGXAutIvg69I69wvIuW5/bMO4Ugsd63Bvn7ZFbNmDla9
         /61w6hUKnqroew9S/CIRr7nM+e+81kQrCvi1Ty94CiJYkpHn10bV1KFLTTsgT2EnYWDS
         RmBcVJOF8h8of5W+JmD930FVJDOiIgIRo7YS4fXmqohOHuYH2CmXw+ndUC6li6GuU0en
         4adklHEFrIKb/169JBuBcxBThNMbw4g43zTEMp39+dHT/lJGETgYqZfQI2lki8Bs9fWt
         VZJctSxDqeoW2qjLYLM6upWQMP5ppTZwiBsg+ajM6Uq+rFjKiEqJDHNzxdTLRyrZZWQ1
         5aJg==
X-Forwarded-Encrypted: i=1; AJvYcCUEuvs95VkVKW3k2Cl+rS69xH4/ld2eyjxi+drZ2DSuoIWg8n8iD5wJHWMV13gaCJmZRLK0tY6k5wP+R74A@vger.kernel.org
X-Gm-Message-State: AOJu0YxVrAVOtuMjiM741BMSajfsW4Q+LcGdo5V4bL+sj5oBbNC+g/f1
	JYcRcTeVXfGITJP1V+dVJOX+lFUEywk/hYf/4JzZO/L1cver/6OqCDlD
X-Gm-Gg: AZuq6aLyP11W5QyPAxL8unWKN+iR8DwrMMO/SrP/YcUZ3hic8yg5a/aU9xcaYzsf41O
	Pi8Z8Ku1RIm6LiqgGzjwlr4ZCiXpbGyEpFjMZVKpI2Ur3Qu2Zl0tt2qDxo/B+tzYCs17a26VwBm
	qWoFJ32+1zRXE0FFHabMf4yHtecwatFd++MfY88f83MEphh5JLMZNkcyZs9cM+qRApyPye5Yi0c
	g0QBVisachfR0Va7MiMepcl0x9tPHP/2eO0kK4EBzRnIGz6eu/YXZZnQ7SroGDYAde9O27NTaBR
	EMmJf3w+UVVKEhXurqWHdoHyWW1cIcwhizihUsRZkG79wqwxdTLw9uZExinpliHJi9DWCxrKS8l
	jRSclItqRv6NEX+pDykSBhbJ4y3jweESNlQ11ikFzdJvnLvdWaNjH4JH+/94CUxVAg+/MSGmh9Z
	ARVa1gkMX2nnKK2OCx/clfufRYENUrqw==
X-Received: by 2002:a05:620a:40c2:b0:8c5:22b2:8b4a with SMTP id af79cd13be357-8cb4226c299mr1426512485a.16.1771286956624;
        Mon, 16 Feb 2026 16:09:16 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb4a395cf2sm822775685a.18.2026.02.16.16.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:09:16 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 4/6] arm64: dts: qcom: sdm670-google-sargo: add touchscreen and display labels
Date: Mon, 16 Feb 2026 19:08:52 -0500
Message-ID: <20260217000854.131242-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217000854.131242-1-mailingradian@gmail.com>
References: <20260217000854.131242-1-mailingradian@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-93028-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_PROHIBIT(0.00)[0.0.0.12:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: 6890E1483C9
X-Rspamd-Action: no action

The touchscreen and framebuffer can have different resolutions on the
Pixel 3a and 3a XL. Label them so the resolutions can be modified, in
anticipation of the addition of the Pixel 3a XL.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index e925cba0381f..2e86bed9ea8c 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -48,7 +48,7 @@ chosen {
 		#size-cells = <2>;
 		ranges;
 
-		framebuffer@9c000000 {
+		framebuffer: framebuffer@9c000000 {
 			compatible = "simple-framebuffer";
 			reg = <0 0x9c000000 0 (1080 * 2220 * 4)>;
 			width = <1080>;
@@ -516,7 +516,7 @@ rmi4-f01@1 {
 			syna,nosleep-mode = <1>;
 		};
 
-		rmi4-f12@12 {
+		rmi4_f12: rmi4-f12@12 {
 			reg = <0x12>;
 			touchscreen-x-mm = <62>;
 			touchscreen-y-mm = <127>;
@@ -533,7 +533,7 @@ &mdss_dsi0 {
 	vdda-supply = <&vreg_l1a_1p225>;
 	status = "okay";
 
-	panel@0 {
+	panel: panel@0 {
 		compatible = "samsung,s6e3fa7-ams559nk06";
 		reg = <0>;
 
-- 
2.53.0


