Return-Path: <linux-arm-msm+bounces-54460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4338A8AC62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 02:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31BE0190142A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 00:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CE334CF5;
	Wed, 16 Apr 2025 00:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lqr89/Fs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E96F2C9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 00:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744761736; cv=none; b=BSfKgUIateUwY1J6NDNoQq4kABI19/IWbaBK7hK/zWqQVDf3oSTkt8o6BFB/utNSOppTuFg0x9QTM9bvHU7QDCjDc3ikaxSLqrvvBsIG0+4YhQZtwLabCWCnTk87MifgmSh8hfBCVB/hG1OaFEotONvz2QdCbD3X6KHAWBi/VQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744761736; c=relaxed/simple;
	bh=9LdBVOezi3+S4+ZxOQ8+mmTVUoo6eXOCdNB3fmZA2G8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GtYmazsMQhG9YdzERFfDbYbyKryXYVRFogAJaE7h72XbNH5KRhxRmiwlNWzV2Zk58mSD6JW/cQI/PzhTvqQumFnEecYWWmiCrDhUuXl6NFvj7CpPuL5OwIemoJefcKVBbDrds0CPhUbxNx/gZeIvj96kvM6NkSSJHZQsOuzLCkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lqr89/Fs; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225477548e1so60110305ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 17:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744761733; x=1745366533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETD26CH6iD+0uFy4hgKYmRwgyWbV2LZsUcS2ttgEWQs=;
        b=Lqr89/Fsvp9NHUE4Uw36V/1U0Goynt73cR0htAdOnjj4iRTVvqaQPzMsRPdMYBKeco
         gNmQlEKTvWHbfeGMdTDJLboFW9Cepkzzsm1GVlOCvH9n0s2W2MW2JwTP4c/Z3rL4AuaU
         izMc6BLTeMcGRBpO9dKBFugSD7Sg0oGA40no8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761733; x=1745366533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETD26CH6iD+0uFy4hgKYmRwgyWbV2LZsUcS2ttgEWQs=;
        b=xJ8gYpmtZ7qwMJOcO000bTvnn53m6QTlhcGHd2KLu4IPRZfsGXdi+7FD466jc4vaiN
         2LtkWRt3LfXiMRWLkrt0vv/g2jay8A5iatxyCK0MrP2dDHVXJ61dzo4hQX/qA2VzBupx
         FVriz5VOgXpEPlmpOk+yKSoL1a1yibau+cEpX6tC1tw4Yo2QOndGoazb9NJVAFziLzzS
         WY5IQIY6gs1EblfzLmelWKqW4tXkIdZCpkfytJx0mIBmV5AhNubVdNrmhmU6mwzp/2K1
         uuAShh9s1noSg21xoftiiGoIMJoLXaG0HqLsJoxsl3KSw25ElE14WZzGaEPrm8VB6+KF
         Z7tA==
X-Forwarded-Encrypted: i=1; AJvYcCVGJMgpNRddsWI3XB//Jr4Jpm6Bb+xpOuj8Q5PQlP00r2Dwf1SgSqAkxNLK5wZNzP9/6kzt45g29ebBj6oA@vger.kernel.org
X-Gm-Message-State: AOJu0YzCdywIjMSjZXT+N2qyt94NACs8Vkggrf+r4Zm+Ge0fQEsLdcPi
	3AOpEjqf6KsYpMy+r6YTuVfVLPXxXT5/Zxj8nWPXaKD9y7/npNvqkRFaVMG75A==
X-Gm-Gg: ASbGncuM4Fv5sKM7zZkj+ZMUYUBwLRkLl+PHyOSWSFy7PW+aDW9+jPQaYel6qMDMkfm
	JaWb6ADJ8EJXGN/BwVu2q5AXtRv54L8Nu3RYKVuyE6pc3x15Sny6zbSNTOYjMkfkd+cQGqtr8QF
	iKpr8gQP/t4qPJmuw+mu40K2Xco7AOTPKcbU0I0Z+XwI2n72lpHEcgks9Wsr4r4yTiTyjjlphei
	IDjZdvo746mx+HrGw5Ety8ChNt2uO3UcuGe9UiK/p/Zc6yFYVSGlvSIUA7We34rgssIRX4Y9Cjj
	Qi525G4ZpgoWkRHiFUZbbhkpyTf7RJdhVOADshUFdu2dJpOtgpDNqBABdwqxYzl+fBo+1ZXdSPv
	MLQ==
X-Google-Smtp-Source: AGHT+IGTNhPFIcDKlL3bF0SzfSJ7SIXjnXhh0YeuCFsofT603F8bPtE9D2lDaA650EUHL4OU3b5nnQ==
X-Received: by 2002:a17:903:2a85:b0:220:e63c:5aff with SMTP id d9443c01a7336-22c31ae8e3emr14464865ad.47.1744761733360;
        Tue, 15 Apr 2025 17:02:13 -0700 (PDT)
Received: from localhost (199.24.125.34.bc.googleusercontent.com. [34.125.24.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c33fc47e0sm1235925ad.167.2025.04.15.17.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:02:13 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 1/7] platform/chrome: cros_ec_typec: No pending status means attention
Date: Tue, 15 Apr 2025 17:02:01 -0700
Message-ID: <20250416000208.3568635-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250416000208.3568635-1-swboyd@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If we aren't expecting a status update when
cros_typec_displayport_status_update() is called then we're handling an
attention message, like HPD high/low or IRQ. Call
typec_altmode_attention() in this case so that HPD signaling works in
the DP altmode driver.

Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_typec_altmode.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 557340b53af0..c2d9c548b5e8 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -280,11 +280,8 @@ int cros_typec_displayport_status_update(struct typec_altmode *altmode,
 		typec_altmode_get_drvdata(altmode);
 	struct cros_typec_altmode_data *adata = &dp_data->adata;
 
-	if (!dp_data->pending_status_update) {
-		dev_dbg(&altmode->dev,
-			"Got DPStatus without a pending request\n");
-		return 0;
-	}
+	if (!dp_data->pending_status_update)
+		return typec_altmode_attention(altmode, data->status);
 
 	if (dp_data->configured && dp_data->data.conf != data->conf)
 		dev_dbg(&altmode->dev,
-- 
https://chromeos.dev


