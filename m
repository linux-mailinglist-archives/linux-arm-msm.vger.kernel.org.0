Return-Path: <linux-arm-msm+bounces-61568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D9AADC689
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 178B13BCBDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762A4293C73;
	Tue, 17 Jun 2025 09:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnB45i5K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E192980A3;
	Tue, 17 Jun 2025 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152640; cv=none; b=f5etXEQrAxA80yHNC+Tn1sw7/6yGdj8dqw640yq2zcp11HCBsxMW32Ecy5qnW2oW1kay+htulgTRV0bv4Jy3XbV1gzxirtIK5ZVpomhtdb44e4Jyr7xq2azv5MBi8T9WMrWZyFXu9BFbF72wsk6jHRZg8thSuru1mtWwV85p5iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152640; c=relaxed/simple;
	bh=ajD2sWSw/Zbfm5J0CMYGejVsh5onyP1skvgSx1P60RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5PwwyL1JUqVrsJ21VrFB7bQATtjMcXOjc48vHrryodXV+RxRhgxjK/47BIFkF89ROtZlrDxVWAMJTNF3KyDlNsse8fqsDX/2VPHZJbRKkvk65Oy7qG/yvj8kTg/zDCjRsVzxa5xgZTqgGB7A5yxqk5MpezPbE6DSkHKPn0GgGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnB45i5K; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-748d982e92cso129670b3a.1;
        Tue, 17 Jun 2025 02:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750152635; x=1750757435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IFz6HhKRpe+PbhFjMvqp0y5X+ZE+MMX33AIRltGWOg=;
        b=PnB45i5KHudAMuOizwC+/xeNwc1T/m1WNgc9WYS5iFj0aaAsuBqpR/MTRsdiXXSNZ7
         TLFD1P+djiq7jCo/QpujLcuw86TCpo0Fw/o6KokwjXl2Gaeh58ndEfQwztZsoqzgaUoX
         RFDH4XZCVfpL78De2M0hs8TUe1lQs4c073bejNLs5f6niDsJOp9ZkuZTAaFG/SNKb/Ca
         bJqAlzHvHE2IKSGeoIOYmtUZhONbzXmgYTVQmIMwTmRi9NdIRMk8uJ/EtlsNB3C+yRF0
         mb6b/qhbGY/a4+KLQx+ijVwcVIYU+HEgDja1dU6NECwkvnNieqrVtisTPH6310F5E2bo
         Q6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152635; x=1750757435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IFz6HhKRpe+PbhFjMvqp0y5X+ZE+MMX33AIRltGWOg=;
        b=aV6I+Uwp7Kq/2GIXh8YZ7jacQi5KrlCE7eHvl2NAOpsoKl9Zr1kqSyRtNh5BD+i/fg
         TgGE3tq+xi2/bs7a/ZwZAb673jw98U2U6OPLUq4ZZTgEGqMgYCRpBMONIEdUHFmbX7rJ
         025FxqDktJFLtHGwvH7TrBe4uEjSq5WmlFatQm35R5ZOc1DtmZoVtOnXkF1LEnGVXPY4
         X1w6xHbGvf86ASsjmLTCfR0oQUiadzqzJyqP5N6Q+rOSg7WWGwXlSkR2hEfyduajOdAX
         0GiKmk1yENSVoWHo1PDjOsvxeshvhwWHUvLxFZUGedjrzfW0pktW16cnN/AC5WRF+Zp6
         aOMg==
X-Forwarded-Encrypted: i=1; AJvYcCWNrWCteiG1PqVKjW7VN7aPpAxxykUffXbGr3iVETfv8QDhX47ULW59Bsjl6VVOttQQpRfuF5sCIzhkDTJQ@vger.kernel.org, AJvYcCWcvl7jPS/DJugnm3DNwtY5KXIGeTxEoxuUNjwpRC5JzK0Vpv6KmKsM5xEPA3/aHlzlQnidSG1Rveqo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5d0lHS4d81hJcvhqxiG+1QeYZT+4swfBUbb2Ds6XP9IAqWxCR
	AsUUBmcQnRIdvIKAtFN9CEsmoFPnSsMV8JJxEQ5wkaTnN1Eg/vQcQaL7
X-Gm-Gg: ASbGncvFNs+9zzOg4cEHe2xPiqH0cmLGitP8ELTb5BKOs/lphBYkVkOr88zjmxothlU
	ABBPLNg2lYhsRGF6up5+btlUpUbSl4B3yVnySOs/m26Xaig3XgMPN0L5yFRfUTyTwzKWe0zCezT
	gr/SIPYy9wjGp6Ouew6jgwSq7ZYP5VBPoc88pz1I5D9+5+hgZAtTDfHPQRzTOTRJE6yfsXJCTwM
	jZB0nYvQR5nUryFDkQQH478u4AFfvlJddM/G4xZZyiY0iHdCAszjsASHqM5CtYgphd85Q7/rNlK
	EnrUR1ZARBF+mn+ltVxhAkSLvpbGpc+Tvy1y9V9jdCkF0TusrrncIoppwM82
X-Google-Smtp-Source: AGHT+IFZfCUvFON/z2ZBmZgb2Xoi7ZR/1QEDDRuOZXYMfGCKzhMQHJ/ZG3hkDbEE382U63wdQeIl1g==
X-Received: by 2002:a05:6a00:2411:b0:73d:ff02:8d83 with SMTP id d2e1a72fcca58-7489cdebf2dmr17616063b3a.3.1750152635191;
        Tue, 17 Jun 2025 02:30:35 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748d8093c63sm714417b3a.57.2025.06.17.02.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:30:34 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Len Brown <len.brown@intel.com>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Alice Ryhl <aliceryhl@google.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Ntmer
Date: Tue, 17 Jun 2025 17:29:26 +0800
Message-ID: <20250617092929.1492750-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617092929.1492750-1-mitltlatltl@gmail.com>
References: <20250617092929.1492750-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ntmer is a Chinese company, their website is https://www.ntmer.com

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 3f23f6f93..9b8024ca6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1085,6 +1085,8 @@ patternProperties:
     description: Novatek
   "^novtech,.*":
     description: NovTech, Inc.
+  "^ntmer,.*":
+    description: Shenzhen Ntmer Technology Co., Ltd.
   "^numonyx,.*":
     description: Numonyx (deprecated, use micron)
     deprecated: true
-- 
2.49.0


