Return-Path: <linux-arm-msm+bounces-30256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59024966449
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 16:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1057F1F224ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 14:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B20A1B253C;
	Fri, 30 Aug 2024 14:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bRWv4l8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF18C18FDA7
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725028625; cv=none; b=kdh1yC5qmahwk8tIFMS+wTebZvrMVFHmjfcJUgldbZAJFZAtXjoONx1PAxNZJZeR0f1GoWRwDffY8TpycgGZ2Zkk2M9ef+KgvxNIGQbpnuN41sqFC2kBJhMki7V/5FUXcqrysYXwHEqFAuSM5akHvDrmk50KlDoXHrtkJKK6z1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725028625; c=relaxed/simple;
	bh=6DJ4mwdZqTyn+tCBTzm9Nt4MFTRGoqfAUGU4OJWiSPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mCV2XOABngAuU+3Jaq6EXHoD6VVMmcjIWeyltYZwoHYRMwBdw6P8snNJOHO+IA8Cek3fGksOwejckHG3IekDxwAl57TQlBjkLZ9JXC95b2C+ymiVmRRM8opfXixosYjfbXb8CfinQI0c9kfXHYgieXUHUvWNc25HpP9ypX+KKSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bRWv4l8r; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-201f2b7fe0dso16156275ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725028622; x=1725633422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hVGFtc4kbH/Z7yqtrPYtyKUgQC3PRuwLn6BIajvZoto=;
        b=bRWv4l8rs+inO6G4b2v0RFfqQwx6b1GVkLXMvt4cE3BtTgV6PzlGtUIhwrP0qDdW+l
         Q8850itHeKMxONyE8VuxUYKU02FYnSh2CGkX6MsN4XEstDEO9snFIXjXOkuzt1oA1Sqj
         anM+9kULzAPnB/6sydd8t7kdXFVMP2phanguE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725028622; x=1725633422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVGFtc4kbH/Z7yqtrPYtyKUgQC3PRuwLn6BIajvZoto=;
        b=QwYkgmUwLAuXdX5bNbzotZnEPufg4shbNmm/ui69llkfYMVW88z2hv8QUi5z9pEX/0
         s/zxkynVU4U+Dp+D7ziC+joOAu1kfque5bomKPPb4DWycFwqp/QhCpAyADILjljB1ud9
         0ep/hvKVDtaeKs+Q9DfVPYRDDRuKvixuQ0SC+Knm7uiwab22T6ZSnr1wAlP4rb7uj0Du
         uUEMaQDzxeVWdEPgRuvC6MjcSppHYvI65DS1tlICsFYId0GqtXVnNTpWc3fYIygEfv+K
         7eGpMz9oFjYplkdLvQp2m/ofZBRKnsMQnw1YbYLglovxp6y9jSPoJVPqOhPA4pZPEGaC
         n6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ0xdkaCwUiLd8GZX5ivrbfD4IDt1QqMi552m9lh3B5lQg6z/7jUrx1xICJ1FTRfd9AvmJFc0H1Zo7mtyl@vger.kernel.org
X-Gm-Message-State: AOJu0YziMLJB6+SP+284FQ4aQ/lY8wu78hnJ7iUyecCGbomRzYE/gcjg
	97Sqi/1emoDutMQI3VdCc4YyePttieTHcLr8OyQRbJ+GiW/EzcgduyQ17jKrwA==
X-Google-Smtp-Source: AGHT+IGP6SDvpMqfxS3K75/5XYUOBv7vIBL6yYiKATWxkoAlTdnFF/xsDDuA76lReR1HWMHHMH5SwQ==
X-Received: by 2002:a17:903:1c8:b0:201:f9c1:f543 with SMTP id d9443c01a7336-2050c3b979dmr87360535ad.18.1725028622087;
        Fri, 30 Aug 2024 07:37:02 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:8144:c259:d49:bb8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b3117sm27628785ad.47.2024.08.30.07.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:37:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	kernel test robot <lkp@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: core: Stub devm_regulator_bulk_get_const() if !CONFIG_REGULATOR
Date: Fri, 30 Aug 2024 07:35:12 -0700
Message-ID: <20240830073511.1.Ib733229a8a19fad8179213c05e1af01b51e42328@changeid>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When adding devm_regulator_bulk_get_const() I missed adding a stub for
when CONFIG_REGULATOR is not enabled. Under certain conditions (like
randconfig testing) this can cause the compiler to reports errors
like:

  error: implicit declaration of function 'devm_regulator_bulk_get_const';
  did you mean 'devm_regulator_bulk_get_enable'?

Add the stub.

Fixes: 1de452a0edda ("regulator: core: Allow drivers to define their init data as const")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408301813.TesFuSbh-lkp@intel.com/
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/regulator/consumer.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index d986ec13092e..b9ce521910a0 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -452,6 +452,14 @@ static inline int of_regulator_bulk_get_all(struct device *dev, struct device_no
 	return 0;
 }
 
+static inline int devm_regulator_bulk_get_const(
+	struct device *dev, int num_consumers,
+	const struct regulator_bulk_data *in_consumers,
+	struct regulator_bulk_data **out_consumers)
+{
+	return 0;
+}
+
 static inline int regulator_bulk_enable(int num_consumers,
 					struct regulator_bulk_data *consumers)
 {
-- 
2.46.0.469.g59c65b2a67-goog


