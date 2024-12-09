Return-Path: <linux-arm-msm+bounces-41052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A679E936B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0134163F97
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F71A228C8A;
	Mon,  9 Dec 2024 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1AETXeI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7926C227594;
	Mon,  9 Dec 2024 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746191; cv=none; b=VpxO/kmCINLxffMe6nvH7WKT1tLNd6uqKScd3Hjujw7D8T9/68efc5+RMhLsKapMc8AeCDl2dCLzjR3aC55rdDW/Kq1sirGf5L1gQ+73lui/6+LF/Tg5GNPK8sQdBeTXwhW3pbDZm7TUi0wJ+9Z8Bx8304b8JqZ9RI7eCcoZAf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746191; c=relaxed/simple;
	bh=zvVaBsOx8LkyJfd75hG74//crP1potwo+5tyyj61pkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHHBurNJB7lf65bRYQFnLFwRUdWRrF+47nCB4lj/Y01SKSzeEnijMNX48/VdyvzXNpJ/rOfw8/zSWads3k1Ek0FuHXB3l6F3cUzuckBQcZR3cUuYqhoP3nP8FNQSHlBzp559XFdBpzx3a3sQxfpY6deYQdZe0MKTMIPFtjnRqI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1AETXeI; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3d2a30afcso4037805a12.3;
        Mon, 09 Dec 2024 04:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746188; x=1734350988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuPrDy8IlYWpbtRwNyfywea8CseYGDtYL9HxzM4l+m8=;
        b=d1AETXeIps8vBj9ur3tfgs8aY4XKFoUh9077Nx67B4g2fLqeabqazsRyz+gU6IgXN1
         iVmwtxfgK6OUVKpcOleLNR0zaRuDbc/X5i4HDKRfCD2YkS5dC2bs/Mv0GLTojS9QKizD
         IK7fXrrG+GvVJ8CcXeoH8Smz0eRodVLddNqDAGCpgGYZng6NwDHdvaG+t0nDgf1l3uhm
         Abf4lr1JxsZY9bRw8Je9w0NPK9DmEFWPDGrBqzCx553wY443dU8cT+htD5Y01fZ4U9Sh
         92o+I348AcNOOtbaPtdZ9nliLT77TOVrLaDHBtadbx2fRt/2n6RniY09SZ7SRKQz7NiB
         Vivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746188; x=1734350988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuPrDy8IlYWpbtRwNyfywea8CseYGDtYL9HxzM4l+m8=;
        b=d9VAZ2xLWjaqkWnWnBWG9Skn84OLRbZU4fXYX+3TaVVtlrJAoWCK/xD8UuWty/N6Sh
         g01LePJu9TSf2L+i9mqExzjJFPCMdgJZUgiGzqHh+FD5iqK9Qzz7hmq1wNx5WDN9oJS9
         mD8PwyXoeqma0CRhAtI8sdNxWLQFKByM2FbANentyd2ycK0XB1BkXXUPQ35pGURBFXL7
         HF11QjjbcnLDU9fax8waK4PZWDwbutQjgHYzymoYcmPXmWn091fIb0vL6+7Dfb0JLt6i
         ClFmz1yjHYpCn2qEOvY4O526ivB5JbDMxnFO4biVVGgLnEexeaBLSLHg9z+J4rVlykrf
         Eu9w==
X-Forwarded-Encrypted: i=1; AJvYcCVlGCfG/vgK9vL5i+eLLyZAN7sdQMtU6OBHZTv9jMrvT1iWr3H7Cdq7oQDujLYkPi1Dm+JpC3zYRLqJI6t0@vger.kernel.org, AJvYcCWYWRrs/UwoTTPcnxKsYCN1DEMkSZUeI1ZMCeRAiZt9MYGQJHPcQKpRu9bn6L7gBhDBOAg4f6Oh99HXJMw=@vger.kernel.org, AJvYcCWiVDb6Y2/paNEXxhjTvp043cHSVrf8PqgLTK2U6low11dMr1/2B9IHumyEtS5/hdkiV7j+0UnpY7AX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Cbvfo1DF4oZlrS28I7B+zzwDrXPBxDaJWKvw3w+W4xe47I3h
	228zIUJq2TNqcOX3y11Pp0TYjtZOx6zKR8tOTR1ksvf+eOtmpwG8
X-Gm-Gg: ASbGncvm2w18zHAq27XvZMKG7bHTB5x05orZUwQ981v5lraQTYbqgZ/IU390KqDATwp
	5hM5pl8Uf94OOEIqmp+dFrn5GJtGpvJ7mHBkeTYgYBjpYgy5f7FrV2NzNjhAQ2Q6/i7qu86+BJF
	B2+UT/iHt7fO/GPYssfiDtiJi1PHrIrM+LY00++v7Et8N1hYMtpmcw0pgj8bGI5ZNOzJZHdHQyx
	9obDMKYnu39WtN/WgoM6Cd0186TT30rxYvjDGcWeJvJEOu+
X-Google-Smtp-Source: AGHT+IEiX43ptkphjXhqcebMhn6jMforf3MiihkdG5VvJq3E75nT1jVyUg9Vekn/kzvaidZ0SiXKeg==
X-Received: by 2002:a17:906:3291:b0:aa6:81dc:6638 with SMTP id a640c23a62f3a-aa681dc6b16mr408727766b.16.1733746187647;
        Mon, 09 Dec 2024 04:09:47 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:47 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 15:09:11 +0300
Subject: [PATCH v8 07/14] arm64: dts: qcom: sdm845-starqltechn: remove
 excess reserved gpios
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v8-7-ec604481d691@gmail.com>
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=1258;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=zvVaBsOx8LkyJfd75hG74//crP1potwo+5tyyj61pkA=;
 b=Mp0zG4CT3xuFCVM1x6DjMKBxtpMcdQtD9fyGUU6kPxaCjr63mQPFZZqBxf1GA1oFKzAJGgchd
 Bd4Wl/0mTqkBSDIEqM6bd9TVVhzrRXl+KHBBswwFNI5jftM/fsS2KKB
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Starqltechn has 2 reserved gpio ranges <27 4>, <85 4>.
<27 4> is spi for eSE(embedded Secure Element).
<85 4> is spi for fingerprint.

Remove excess reserved gpio regions.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v6:
- refactor: no space between tag in commit message.
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 8a0d63bd594b..5948b401165c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -418,7 +418,8 @@ &usb_1_qmpphy {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
+	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
+			       <85 4>; /* SPI (fingerprint reader) */
 
 	sdc2_clk_state: sdc2-clk-state {
 		pins = "sdc2_clk";

-- 
2.39.5


