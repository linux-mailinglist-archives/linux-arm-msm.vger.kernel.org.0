Return-Path: <linux-arm-msm+bounces-94592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNCRKa7lomkB8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:55:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 537F61C3129
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 855A33050203
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 12:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705F442B75E;
	Sat, 28 Feb 2026 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KL3Rwh3c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAD82E228D
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 12:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772283305; cv=none; b=sN7df2gxHbjWPT7NqUteRtlYDtxdJ1qVmzvnIFzWBcoyTU82tDZJRt2Cullv6A7jXDlU38wNpRzFWgNGRPyrLW1R18DknF6oFFZ/psHkwz0INv2E1b8+yi3qgCFSFvgZHgqLSVcWaQxWwdJAXPdpUxHmS8jMsMLnxvp7SJVwzzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772283305; c=relaxed/simple;
	bh=FYxTbUS8wvQIr8o/w4A1iqxKt/ip7PD5E6jkILL4MIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bh3iQv0C/ONiy3JuBbMyKMXqqycpowwqeQ5vNJWO28XFDRB3VL8VP/YhMZEBWBhjK4YosDw1NCdF952YuDv2mH/7zHgyGImSWmfEW/E16ZRaeCjjeGSKIGQroEpuW4oWTU3Y9VlvhXahfKqRMoUbPGUrJvrIYTOWSM0nFM77mSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KL3Rwh3c; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c70f191313cso1164556a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 04:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772283303; x=1772888103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0TjNGD04YyVddq1HrmWd/i6gkJbEakr8TUWq/SQPr8=;
        b=KL3Rwh3cGqOc2vgbRk2BYBNPoRoSsdulxJ6HOQS3yGEUwzfHRk3Hy/20MfNhNINcKf
         G9Ce9Hy70ZS15R9Wh1ffJV2YINlRhmO30sm2Cn70tnhUNNEuNDBWX+zZKU6QBHcShGrL
         roFGvyAjoUDWgPcrdZKDnhOM8hFXraei6bdWBDRg0gA9zJyiggRUBRr4aUmeUNxq/mZD
         Mup25xBN4WNwfLxwEs/kSyNWR2g5doufKzAhIN02CHdtQyub09od+buiZ5vkXJ8d5xZ3
         48KWOvuFrwgVf8gP/sHd0TUgzGt7TYFMV7/BjAwgDNoiuwTTXifj2g76Psc4hOAhpkEz
         f0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772283303; x=1772888103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0TjNGD04YyVddq1HrmWd/i6gkJbEakr8TUWq/SQPr8=;
        b=PeINz3YwLy2FiOQHA2sbW1DEsZTbrTJc3zPCwCtrauATC535Lzo58yJVzarowzEDUw
         LpMNu2GbUHx4ZlwcKdBScmH1az7r8j8ojogo8hMAePXCaFXh+Po6SEK7v4LTLdLvcd6n
         sUfPvO0TwCisEgdjVclocufosq1lPFYU1NCAn4X3t6bnaWokqWRShH2VuRW0/a8uREIF
         vTE5spcoi3lrczjGpUdT1BfH96eWYWTKq6xD2L3oAqwzCb9Ll/Zh79Bihtyl/mxpkt1Z
         g2xD9f+h/80V7jHU2YzPrwujLuyYlN2qNNwl9J6tUcm4+u4pe9qRtF/Qvd5OQ6FiTqUz
         54vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUNRpzh+KQcaiLX1bOGMSbirs4JSLvIbkJelYmHx2Gsa4Drg76ztfWy/QXL26WH7k0PAPqrlCyU2jr3/3d@vger.kernel.org
X-Gm-Message-State: AOJu0Yx82oVhZN+fg8udGozuZzkxMTlHkysKieufSWboBG4VKoFEa96H
	MSSkhUZAPpUiIAZzS+d7aCVA3Hpv4t87sll2jf6KSbd2VO6sPQtYb5jb
X-Gm-Gg: ATEYQzw5Gr8bdgyZkSkIcCgL9f587omqi8q0QYGrZf1TqAadkvE8ojOm3aq0yg6rWRX
	2UBvbiFib05rVmhlkbMmGQ9rk/rFDaNjrpd9bIUBUzuQwLiY7dNWHHKnJIkTTpa38NEQKgZw9uI
	DNkqlxZpsp5P23qbr2FGh94oAZp8lYuIpZHduXukKZVuRAYIfJapcTE3vmsgffv9N70ROuzLZwX
	gtaTTYghtZJJUktoxA5p01DkvYaFyYqnY+ehlGtTOV0ttooTt5JhMfny7uXy/CB37TbLN+xLkI8
	PhOOkqBRLkf0FRVKJw5GgaBAzzeJsh/8+fU91S7Wg2QjZ04RMKgATvGRTG2cDAEqv5h3kgdMcsH
	2tyAiff46f9lWACgyQgOcEiSAPuO2HfUdfkNUxfYIw7khmGUGtLnNCRH8nEZHgS+pyLd66r228J
	JTiopYnXbov3QiRwasr8tg
X-Received: by 2002:a17:90b:1d82:b0:356:2db3:1206 with SMTP id 98e67ed59e1d1-35965c34e95mr5018398a91.13.1772283303037;
        Sat, 28 Feb 2026 04:55:03 -0800 (PST)
Received: from nuvole ([2408:844d:b08:3702:16a4:72fd:8170:4ed3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359131d8a79sm6721338a91.3.2026.02.28.04.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 04:55:02 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc8280xp: use refgen regulator for DSI
Date: Sat, 28 Feb 2026 20:54:30 +0800
Message-ID: <20260228125431.23098-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94592-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[1.81.40.128:email];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ae94000:email,1.81.32.176:email]
X-Rspamd-Queue-Id: 537F61C3129
X-Rspamd-Action: no action

Use it for the DSI controllers, since DSI nodes have been added.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
This patch depends on the below series:
https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltlatltl@gmail.com/
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 79021267d..1599d698b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4843,6 +4843,8 @@ mdss0_dsi0: dsi@ae94000 {
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC8280XP_MMCX>;
 
+				refgen-supply = <&refgen>;
+
 				phys = <&mdss0_dsi0_phy>;
 				phy-names = "dsi";
 
@@ -4942,6 +4944,8 @@ mdss0_dsi1: dsi@ae96000 {
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC8280XP_MMCX>;
 
+				refgen-supply = <&refgen>;
+
 				phys = <&mdss0_dsi1_phy>;
 				phy-names = "dsi";
 
@@ -6398,6 +6402,8 @@ mdss1_dsi0: dsi@22094000 {
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC8280XP_MMCX>;
 
+				refgen-supply = <&refgen>;
+
 				phys = <&mdss1_dsi0_phy>;
 				phy-names = "dsi";
 
@@ -6478,6 +6484,8 @@ mdss1_dsi1: dsi@22096000 {
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC8280XP_MMCX>;
 
+				refgen-supply = <&refgen>;
+
 				phys = <&mdss1_dsi1_phy>;
 				phy-names = "dsi";
 
-- 
2.53.0


