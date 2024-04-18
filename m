Return-Path: <linux-arm-msm+bounces-17888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24B28AA455
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 22:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E9C7284401
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 20:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2BC1A38FB;
	Thu, 18 Apr 2024 20:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oc3ASbev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951581A0B1F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 20:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713473268; cv=none; b=kO/5uhXxFvOogWP2IprgyZLu2TxJfUXbAOj8VyuB5yToBlCPyAuqsahBzR8k/HnVapDdM8p+HKZO9wJQbTHmMyXXB2u1jjyzyOnab5OJ8PI1rsqy8Mmfk2PULcDtd0pKs79hqSnRyS4mLsTdqhwBVN6zuC56kCq4I766UsUJj/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713473268; c=relaxed/simple;
	bh=P1dc1JdSs8SCHe62moGR5pSmeoHdNRxNzu0oI8BnvGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tj3AqgEYKFiQ1oJEI7dBrAmTPB6eHREC22tM1c3cgSlUREYuKAuMM9caXcUgBE9t/GNyMwAFMXvOnUW6zVMM5KHKlMHxQ20Q0UsRHLat7kfZcIlyWb/HqaFsC7lAnsPkkxUjS8lvLoJyMT3u7sxRMfFUD/V/iF4PfYTKcIHoU44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oc3ASbev; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-36b2fcd1fb6so4400685ab.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 13:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713473266; x=1714078066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKHcTSaA5S2jqYA/kqtWjCsThpLVi1n0vQMddOFHVfU=;
        b=oc3ASbevYkdVqld9rh52QgXpyn232nnKU0kqzb2+xNesGHeym/dAMg8WYIYs3MAN4q
         hCvRryK38paWF3fDX0vlG9KhO5dGjORoT0JBIPM4FdPlDWQ9Ups+VZt/D+utC16yRKB7
         O+99lMHdUyFpNstdA4ZlzbEkRPbZzP+wBu+Hn6Kv/93bvyL7/QNtcS6P6qNgwcf1HQsE
         NcxZ0FDTRD6Qx6Z2gHSquf19CEcgSzqhWsn9UhhxH+XNPe7B+qZl9UBbsJCmUQ/aqUrR
         kRPCWT+anA1nnJwttW4zRppdZ/5CTaHDQAL83Zqru2MDMMc0ieRMK0FNTB3Cbt9U+mjt
         tdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713473266; x=1714078066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKHcTSaA5S2jqYA/kqtWjCsThpLVi1n0vQMddOFHVfU=;
        b=uEPtujbNwUTgKLvdVA9sxHIk/J1u6VFtq/7qRiiSzDWBIsq9fzGPloNjiVV4WEMcgQ
         M+bHhgqWHZ5tCjElUi/EHF61rSyvwQLqdx8mEvkmj/OIvI3+8lCCtL93dPFHZHf30YqM
         o3vA4uS1i1XUkV53c+zO9JvCVITjTEtr+WBQqwR8fq+2v/tqRgPZh9kdxbZBKKr0Jd8M
         1lUqJ9l49B9vKlwS7wVFUG+wgto91JQ6Hagg5JJ43nN5oW3gbYO3hBloqJHGFjQL/rCC
         VSt6yPVrHYCW6NMKVPOYIYIM47Xns0xbhhGxA8bht7jfYjLz2ENhLub3q6kdQB5gkXtR
         jqQw==
X-Forwarded-Encrypted: i=1; AJvYcCXFWnOwUblZ653pFZKR5b6uPn1eWTcnjRtLtOiGf+vRpjVY9pwwxC9X9b7QmM87at5xRyLzkQaiPs6T48P4MdsiBJVTD93lTd2VcqnSsQ==
X-Gm-Message-State: AOJu0YxBUm3XNTf+j8YBp+XjpStDHlXAbXbOxCgkfm2xiY0ESHIN0Q9e
	wBoZvsDemPC2dLO4C7q/+dTgE4K+Ph94VjvC9ijgYksSeKPNxC8aqj8/IKGZ9a8=
X-Google-Smtp-Source: AGHT+IEBmjMeQWQ1C1xMXu/cVMj/XUA9qRCtQq3gRTTd6N+Ui+CHA1A/6ETWP2Hc8qGzhlX60JhUcQ==
X-Received: by 2002:a05:6e02:13aa:b0:36b:2b56:12 with SMTP id h10-20020a056e0213aa00b0036b2b560012mr379844ilo.7.1713473265848;
        Thu, 18 Apr 2024 13:47:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id r6-20020a056638300600b00484948cb8f5sm626998jak.91.2024.04.18.13.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 13:47:45 -0700 (PDT)
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
Subject: [PATCH net-next 8/8] net: ipa: kill ipa_version_supported()
Date: Thu, 18 Apr 2024 15:47:29 -0500
Message-Id: <20240418204729.1952353-9-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240418204729.1952353-1-elder@linaro.org>
References: <20240418204729.1952353-1-elder@linaro.org>
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
index 04dc0540ff7fb..08ec3581d1d27 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -811,11 +811,6 @@ static int ipa_probe(struct platform_device *pdev)
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
index 38150345b607e..ae3396314acaf 100644
--- a/drivers/net/ipa/ipa_version.h
+++ b/drivers/net/ipa/ipa_version.h
@@ -45,24 +45,6 @@ enum ipa_version {
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


