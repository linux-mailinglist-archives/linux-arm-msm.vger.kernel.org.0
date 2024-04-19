Return-Path: <linux-arm-msm+bounces-17968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EDE8AB1A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 17:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99CFF1F23EF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 15:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45636134CF2;
	Fri, 19 Apr 2024 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eOZPd+Qg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B231327E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713539895; cv=none; b=Wuceh/poT8J504DW2O9o4RFKaew7MPDSfjzE57i6HMDHNpfxPF3TQ6isXMs/iGfVrdobfxXlIhpUN9iSrXkp1zZiFzVGW+J654Qib6ZLvgjy40cSGMmdFZwOz6498AFrIJqF8uvpgH9LvuP3n7hxm24f2vtMlsIGs0o/NKy8m+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713539895; c=relaxed/simple;
	bh=YisC0o7NBuOn0cgVONhypNsd+DSyG4nGqdGcgmtrUzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CMUtI0KL0caW1GUjAy0+V+cect40CyAK5oRvDCAMbABLeN1FppiTL44ShhODW9a1X7uZSb9USr4BLfEtVuqpiJJLlJw4PWtjSiTEx6FmNsz/q4eAmZUbRoZEqu6mTmHS8zgnEFtnMY24LWJxm3gqyZ9tFIug9IMtHus6JPuqi9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eOZPd+Qg; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7c7f3f66d17so80492339f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713539893; x=1714144693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ki95sU34hn/iZbtQLEcQxjo1Z3fzAhmDa03BSf1KS14=;
        b=eOZPd+Qg1J/5Xy29wNO8G1/cwD83KSjW2rlMZWrxrQ9wZwqVkoGZdMV8YMv+jwgVMK
         Z+YVJCezkZFHwEro5l8ICB99ad9uyawFZas60BZoRn15K5okbzBL87yUdsr9ZFKAVoRd
         5W8Jq8D3PXVkkoFMfGPmASwgzQyueXCapRDL+M3IvOE0xwW4HgRr7BRk59vU73Z9bF7c
         2iWt7v5zysi+n55HFhLwThgt0vrQqQ1/fsJKRRgVtY7QvNzv5CE4JvdkfwmorGHN1WPQ
         BswRgxHdUpBA5hOpJWdE+DZcUPAvT7g8xQZumWu/UAvKg2qvRAbjEmf34G/QhkYoYC96
         wJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713539893; x=1714144693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ki95sU34hn/iZbtQLEcQxjo1Z3fzAhmDa03BSf1KS14=;
        b=wtnS3F3+pYzPrSGgY3w38xL3T1SPEPgrh/8/kb4zZ8fjnt8aHz4GLZKe6GT81mUoAv
         iXJg9JUMegETQBLKLef0CwiZ3OuP8mIlma56tbhl4umitcY7UusjAlEJCFwNgz3JTY0h
         ePLZfY2jozSw5rUjFA7+Koe0QhqEN4YJuPHCovCepQRHVR+ueOUZikCo8JFrVSyH1ezR
         fKDOhZTppCSj/6tUDzO/OYos8nLoBmT72ftIeUhz98i9kShANCuCmi1hWbEriK2S20Zh
         eaRtm/ZCcN8vIBNANlni5dnKV2xdAuH3z4lwWkRqufuGmu2oI6CN+LPtWHcPt2eFwM3z
         e2mA==
X-Forwarded-Encrypted: i=1; AJvYcCWPMUSuwMWXBF/qtoaZf/+TvoQEUGy46pULobogQ6MEL8HjTL6ivJn28QiauFM/f32j4YbgnoMfxZS/AYC2t2moY4ML83Ep3PUVnasCXA==
X-Gm-Message-State: AOJu0YwN9xowDkPuRROVcSt3CSvUvOXB56yFztl+xYyegqndhDbV8puK
	l0439UPyuq+MrcBCmo671bpanVl1PIL7JMi5z3flAv8AkLDinrBRZHnb7bSjZHNqUMwWBLyCv03
	1
X-Google-Smtp-Source: AGHT+IELxfc7N5E6oEEqqJYaRLhd0NyK8sD8JOzWpxuh38rFalVcKuxOZJ5AihG+/A9vUu1KqCtQpw==
X-Received: by 2002:a5e:8302:0:b0:7da:3757:8c3e with SMTP id x2-20020a5e8302000000b007da37578c3emr3384592iom.15.1713539893004;
        Fri, 19 Apr 2024 08:18:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id lc8-20020a056638958800b00484e9c7014bsm116126jab.153.2024.04.19.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:18:12 -0700 (PDT)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 8/8] net: ipa: kill ipa_version_supported()
Date: Fri, 19 Apr 2024 10:18:00 -0500
Message-Id: <20240419151800.2168903-9-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240419151800.2168903-1-elder@linaro.org>
References: <20240419151800.2168903-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only place ipa_version_supported() is called is in the probe
function.  The version comes from the match data.  Rather than
checking the version validity separately, just consider anything
that has match data to be supported.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_main.c    |  5 -----
 drivers/net/ipa/ipa_version.h | 18 ------------------
 2 files changed, 23 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 6a0fec873cddf..5f3dd5a2dcf46 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -810,11 +810,6 @@ static int ipa_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	if (!ipa_version_supported(data->version)) {
-		dev_err(dev, "unsupported IPA version %u\n", data->version);
-		return -EINVAL;
-	}
-
 	if (!data->modem_route_count) {
 		dev_err(dev, "modem_route_count cannot be zero\n");
 		return -EINVAL;
diff --git a/drivers/net/ipa/ipa_version.h b/drivers/net/ipa/ipa_version.h
index 156388e90a141..38c47f51a50c9 100644
--- a/drivers/net/ipa/ipa_version.h
+++ b/drivers/net/ipa/ipa_version.h
@@ -47,24 +47,6 @@ enum ipa_version {
 	IPA_VERSION_COUNT,			/* Last; not a version */
 };
 
-static inline bool ipa_version_supported(enum ipa_version version)
-{
-	switch (version) {
-	case IPA_VERSION_3_1:
-	case IPA_VERSION_3_5_1:
-	case IPA_VERSION_4_2:
-	case IPA_VERSION_4_5:
-	case IPA_VERSION_4_7:
-	case IPA_VERSION_4_9:
-	case IPA_VERSION_4_11:
-	case IPA_VERSION_5_0:
-	case IPA_VERSION_5_5:
-		return true;
-	default:
-		return false;
-	}
-}
-
 /* Execution environment IDs */
 enum gsi_ee_id {
 	GSI_EE_AP		= 0x0,
-- 
2.40.1


