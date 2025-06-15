Return-Path: <linux-arm-msm+bounces-61335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB92ADA3B3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 22:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01135188CA19
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 20:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C2627F74C;
	Sun, 15 Jun 2025 20:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZePkCC2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D8320D4FF;
	Sun, 15 Jun 2025 20:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750020286; cv=none; b=FrEP0TS+vuP7AF65q++zDZ7Xwjnp3GIP3By1JXqsEvSNLZlr/gdO1yLm51VyLwIZV/oJvZrBGYVXxakv2jCDVnxsHt4UGnbMEFPtoUWaT54eUwRpUXVIcaJgGE8hPCnptL8/ukrFPxXVxOcD72jAk6q5qei+7V651TKQSUtKHEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750020286; c=relaxed/simple;
	bh=vOPI8xnUs42FAhBrM6Eo99dhtN/4bO9n2twfJR8aP3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aEIHp/JVNJTFWHsRpP2Xkls+0t7OZZ/BmMP8VvnYejtF3JU65mCVo3wTs4DysdXB+Gr61OOxvKdLJ+uFs2pycP1f8OKTfK3Yc26K8KOEzXjM0WrckmurygyYm7dFKPsb8Az6zlsl8sV5rtrKc6Dosc29x2UFoXwVzbztnCZms7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZePkCC2a; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-b2c49373c15so2836474a12.3;
        Sun, 15 Jun 2025 13:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750020284; x=1750625084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+KoSt+5ZL3v0iSQDCq0LPccgjeEHmo3nVMHVXpvIsbs=;
        b=ZePkCC2adhswgtJeYEUacxajbnQ7mPnwRWw63objXuu6ItTEFI3Jrx7L65tomJ8yEd
         teRljkBvZHdlWMWkQn1om2UdOqcx/0DzSv+JqX0404YlTpLr04Q5oBu5kHST7++swPSD
         mLMBMjvEQqT/ZW+JqHvxKAwil06TJ0hF9nmUhuSSXKQbgjb15haViVWIZfWCi5Cbyl++
         v9Gx9fV0hKKnaahCbGylGp4Pi1FXtiPD5iZofvhrQj3vbykWH7i3xhyVvG7khFbF+2ft
         n4z+837FFKOPVyIZSk4AntZF2Cp2BgC3On5THF9fluBbv0Vkrb2YolW9GwjF5f7zenei
         BKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750020284; x=1750625084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KoSt+5ZL3v0iSQDCq0LPccgjeEHmo3nVMHVXpvIsbs=;
        b=AsT7U0lbiwpzIqUwIPl5i7PFfWtkN/LdCBIcgVRAOIZznBMFsdmHCusqDVXLHunVNI
         YFhaA+l/YQR69AcHOWYNZ0PILRHlfTn0EFb5urd4g1MadCj06CfBtezqbnium++vMIIF
         Qe3r+5AoG7PDwDqmNT1Rb3tnhx13BEu52IVUc0MJKjidUqBrNYY+mCuCgsV4AX6OqO+L
         5W/O1PndQDRZxoTvo7/huSfIoxNv4Plk4hAk5wJaxXBj8+HwNuZfnAQffPxdq9PW59Cp
         CJrvB9OC7Dfl+mM856g9h3tSFaHarlrjk4WiRljYKyRqxVByrmuX1QGUyWX24Xhonelc
         aTGA==
X-Gm-Message-State: AOJu0YwMCyp1wmOKzAJrckCPNzOE4wk1jdd49H1YyqK1obDTSqrV7/i5
	CWIq/A6xXIMSA51xZMeVcqOwNuNzl4PM+0ztzn7ks41FE1CS/+XPwes97x2cQr9tdXs=
X-Gm-Gg: ASbGncu2redBF2zZ9cAUEx+g6UcyckXNcD7oRdOR3XayWXf3GuoZrc9SkTFqI3KuuHI
	KINV1MMkiF304eY9f0lfs7O51bG3i1HBYa8C0u5ic3Fumh2ys0IN/6NfaeFfC3AfzGwCelooZFf
	TZ8a2zHT8EvykTp+tm/V6pi65ObL92SGb7CSY1OetNh3HeeZBv3A/O8Nlb3ljb8CsAnNCaFUCUV
	wmcAZOiZtwCdvBDgFFhAUxvPY04NzCu1EZtX7XVd7tF5DtG8DNbNxk9K88AMcOCTLym2Rq4PFIp
	uUZYtt2D8Na6T+zgTSW/tN4r2ujrbFYwUEbWwddRkAx4iFs4W/EDAxz7r5uSm/D47ky5nPL00ZL
	jAFk71y8Au60=
X-Google-Smtp-Source: AGHT+IEEuMOqk2/zxOVXhcR0Uxt42Lq2ZQjQ4HYKiNoUcZOeihsC7DkRQIJpeiihtN/uJyu5fodiug==
X-Received: by 2002:a17:90b:224b:b0:311:a314:c2dc with SMTP id 98e67ed59e1d1-313f1cc4b7dmr11381939a91.14.1750020283525;
        Sun, 15 Jun 2025 13:44:43 -0700 (PDT)
Received: from localhost.localdomain ([191.193.166.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a190esm47830995ad.69.2025.06.15.13.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 13:44:43 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH] dt-bindings: arm: qcom: document r0q board binding
Date: Sun, 15 Jun 2025 20:44:37 +0000
Message-ID: <20250615204438.1130213-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds compatible for the Samsung Galaxy S22 (SM-S901E) (r0q), based on the Snapdragon 8 Gen 1 SoC.

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b14206d11f8b..7ed1da6e42ed 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1092,6 +1092,7 @@ properties:
               - qcom,sm8450-qrd
               - sony,pdx223
               - sony,pdx224
+              - samsung,r0q
           - const: qcom,sm8450
 
       - items:
-- 
2.49.0


