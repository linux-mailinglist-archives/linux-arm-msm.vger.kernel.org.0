Return-Path: <linux-arm-msm+bounces-52015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C963A6944A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 17:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D4A47AD232
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4F21D8DE4;
	Wed, 19 Mar 2025 16:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="XUNPpAT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7DC1DE2C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 16:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742400316; cv=none; b=TRv/u5sL/gO91/gHPPxRnwXTYY7kkVx4v8Fc4WxofhHr177yOdJaF9NDMl2l+RIYjkBDW4B0P5P9QPtBK3CxBtkUZLLSFpi+Ys0MVjaUXHNR0DalU7tuLhp7poGuWepLi55EjpPEcPVAOWkdiCRZlOM8jW3nrqs+HUt1I2Ufdj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742400316; c=relaxed/simple;
	bh=gqYi2IOkBpGmWP8vcTUbbEUCyzEeB38GzIcirinLzL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GGDgHj2RbZOPYOUObKLOcWyOdZc7UIhEYZqhmaFKBXhBjI6GblrCduo9rXBTQHgHpMhFkErZ8dXXHiLj7EOgQxOReA/0uDp9K0lpWdgX4DiHe6jKLMkY4oTsJh9T2SwxcRoFxQ33VleSNOvzmLHykLE8h8CEg6iPEgkFu7bcUBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=XUNPpAT6; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6C9863F2B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742400312;
	bh=GSUU5JLhgZYi/omGhuQLchJlDjwLwW4DkUo/PblUKHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=XUNPpAT6CbvBiya8zM9OYrtQ4nqHLME2Zelpn4UmMGenbB6Fa7qCX7hpg3eQ9x09T
	 nt002j08RPKsEEoMUmL8Wh2PJs2tnDf7PbbVzUiEuX5hKQ6/M868iLbuWLwHvQ+T+t
	 t4hVhuM9NET+mpShhemqYgAgEyiB9H+mL16EV7RXilyw3xQ0YLrLe5trA0Q6BLtGKi
	 qFbekhOPNd7XrCtIE8UrkvCnpyNmiw8CQJpHj1EV1exStleKKMaugrraITFqR9iH6d
	 NqVql1g3XysQqMtLC8A+c63BqEJkYG4ERoX2kHUuNBQF4bVOu0qyfNLvitF701i7I0
	 HrqBFwbqWD7VQ==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso29411305e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 09:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742400312; x=1743005112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSUU5JLhgZYi/omGhuQLchJlDjwLwW4DkUo/PblUKHA=;
        b=eyWA+Ik9amNWXqU+HqiWMIKmn1x0dKAqaemm82nkO1cgHOnenEVilHaUkYiYTaUBZi
         k0qevwJyyI0JoAEwxPbklDXMQSFIVNrGKeouVpx9fBOiBU+9lojh+8F3Vg/KQiuvJiEN
         ZlbeOnO5PtsgA7Adu4uBg/XgX/NpLabhMMhwTTcIlwLmRLIuTrtX0fsxBxpQrLW/9/v8
         DY11+gGcgG8BYuuHLTBw0wDy3fdpSzL6IXoz068PHEph9+t0NHCFz66ta/hKRPU2ZB9m
         eOr6r2ae4GgqwXZKeNsRpqax0JBylovx2HlthsIHZr1AbsW+9qwDBQtG7RpYjjgGMfW7
         IjrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGLRh8rpxHfWOJBk+ujgkpVAebl07UQWsPEgIOu7pS0On70OuHympjKOdhnixkyDOA51oddcUMgXZ4YRs/@vger.kernel.org
X-Gm-Message-State: AOJu0YyPHDkSDwUcuufUwqVl0bnz++UN8tR3tHpFIyM2NTstnbNbuGrN
	kZ1LqlDJLiB/y4Dkp8LZ4h0+Jm+puNs9xUhJWD4E0fAER52HwazHNHQGJdK91gnfuCJ91FT8zTM
	q1gT3vUJp89QbuMRCWd8VKqL+WRgiQfB5lRXmVTTdEERyW0Hf9NTf6uPsq2ecUtmPttNbl6dIkb
	yeKK0=
X-Gm-Gg: ASbGncuSoQGuJkAD1g5Yb9fG1XaifzQMw8JHJhmvaBVsgBAOkIhjnmcOSpNzg6+2IxO
	TtphU2ua0Pc8hpvI7A9PEUm4YxuLfOQITYBD/xATqqsELE5s9/Ls7lyAWnRAeHaApdikN0MMtfE
	ndA4JUtQ3mb05PdGmKKB9k3nk0a/el1rpEyuLY0T9s4ftEP4PrMH3WGFwFK2fZckWV3fB3DXoR+
	P+fJsYcKX4IngoR7w5vhD7cJnkzhw1bk5QnCJM60GUqEwzCmz1JlA/O5254ijlQHD0WV8G5UiAK
	OTt6Kt8a60AY59hVJ0JWLvcbPZExPQYzhYENRQwLK55P8OXIgfhcF4s1m2TY
X-Received: by 2002:a05:6000:1549:b0:391:31f2:b99e with SMTP id ffacd0b85a97d-399739b4089mr2871020f8f.2.1742400311727;
        Wed, 19 Mar 2025 09:05:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDlJj9DAT1miKPO3/mPueia8h2gCIoMy4dIZf/f87Mial3oKHiLugdVoWYREIB56Z+wmm+oQ==
X-Received: by 2002:a05:6000:1549:b0:391:31f2:b99e with SMTP id ffacd0b85a97d-399739b4089mr2870969f8f.2.1742400311171;
        Wed, 19 Mar 2025 09:05:11 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888117csm21047556f8f.44.2025.03.19.09.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 09:05:10 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	jens.glathe@oldschoolsolutions.biz
Subject: [PATCH] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Enable SMB2360 0 and 1
Date: Wed, 19 Mar 2025 17:05:09 +0100
Message-ID: <20250319160509.1812805-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d37e2646c8a5 ("arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360
separately") disables all SMB2360s and let the board DTS explicitly enable
them. The HP OmniBook DTS is from before this change and is missing the
explicit enabling. Add that to get all USB root ports.

Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
Cc: stable@vger.kernel.org      # 6.14
Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index cd860a246c45..c4ac0aaa6f65 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -1352,18 +1352,22 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2360_0 {
+	status = "okay";
+};
+
 &smb2360_0_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l2b_3p0>;
+};
 
+&smb2360_1 {
 	status = "okay";
 };
 
 &smb2360_1_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l14b_3p0>;
-
-	status = "okay";
 };
 
 &swr0 {
-- 
2.43.0


