Return-Path: <linux-arm-msm+bounces-41301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDE69EB0A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 13:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A02D3283617
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 12:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B258A19B3CB;
	Tue, 10 Dec 2024 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="Rh2f8h4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBCA23DE9A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733833204; cv=none; b=dttZJdUodnWRkcyw3pNmu2g8BzVPj13bqwW1Df3AZN9TDpnDYOlfvtqx3ChIeCuWw0Ju9ooQIeV/sWMvjSs8QDoyKLgUFddt2qdbZiC+g1ZnDeE7iPvc3KbqOQXU8XiOORdhdzMNtOdU4BtVImja0+XFuC8nhI8CU97IvHa5V9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733833204; c=relaxed/simple;
	bh=lRGvbtPo8c5CemC5heJzHziBJmuR/9cIpI88W0duL2o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dv+ek6z6oJbiXx1361ShaTP0Ibpu1ICHfZutW2NCqn1Gd2KVSmFpexgKmZ/vfYYMvW0YWg8mIlyJtRHt9ByhiYMN7jebqFH1xLnLdmDj/o1x0T2HJHcG03YCG0UNGoNkoYic/F19vMEQA9QbGdoJsDHOQvs+tJInmgBAKqocp3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=Rh2f8h4N; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-725ee27e905so2254504b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 04:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733833201; x=1734438001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GHHCYDNmykE5FThdvTIbfOJEbHz7L1lKYf1Su/Mmo/8=;
        b=Rh2f8h4N9o8XojCYMnuaOFqjwI8fBH/Utt8yErVfy3nF/rQAuiUtlEjeSgty5//L9F
         T/XgMrk9/nvYd2oHx3SfrIPaeTE0oZaev4XHdJlnDNsE/alZ07uZaLpPwM7SC0w5Gshm
         HwwlaF35mYkww1xCoaZjqXytjRG4tgInRhW2U+6NWI/oSLYJj+MCnpohovdYI4BntSZ8
         phxwezE9lPqhqdViHnaZ0yRy5hHhzX2tPx1ThpxF4u68s9JPi4/QHjriFN9yDM+ZTG89
         E4UDTZmNRtp24lI1wWWr1It0DWdMNYGQSizFbDiza5JylpTyq07EbPgHSLoSFqgGRUwQ
         xc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733833201; x=1734438001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHHCYDNmykE5FThdvTIbfOJEbHz7L1lKYf1Su/Mmo/8=;
        b=gWcTMCT8BjI4z1SUaKMCrproJUMU0tmN9RN5NfijG42VuJflrZj3aBMzcLoQhYlU/1
         AcvZpU44GfG8FGWxYqpW4JTxap5SHey51QhSKfGhsvqP/Kx9p+DJRyYqvcemok9goVhA
         gi7OqfOGN8p/CWacUrcT5Gz5KXfEUaF6hENlA6aShILMXgF8BkEKfQGShLkRdMq0x5eZ
         FwX5Ldt9HicGdJd1/tbyE90hE7o69ufAx6FzbnuUr0HizqzPGuLByKXjqEOrVU5uHIhz
         4sN0uUBMCJqy+qd/8tcw+FfPOHXKAyabjuwXbkx+lfm6xKSB/DGNiwdBc/lOtfR8ONdS
         Hpaw==
X-Gm-Message-State: AOJu0Yz3usL3QT/FwQRt6QYRRer1zCns5sdugEzO8mBJKyPyAne4rOZh
	WtpOWbDm9pnu2QfUtZI06rXcOFaHMELDu9o9j7ZRP3B22w0zar48kHRUj1M/AV5ygCwbIPTIfIL
	/mHo=
X-Gm-Gg: ASbGncvxTDSbrCNMaKFiP7400lcmOrsoIpYbq4miE7OzBlrgm0YdtWw+8rdJy3FKyrD
	m+lFR8dr+Iphdd1R9Hn4R7ITJn8DepCqvyWrPPPv38LSwyZZH4y9bxSR6ILGjggEBvwu90LgD/C
	iAGsFH5OmnfDojf9OOXo6gplMlhWY2OTl52yepJayaeUht1L3GtrNOaS9BObwgxUtIC7ki4ihya
	8bHKoM/Bbwq6km7Uiku/N1L+GFTTkLLyNGtg6Acacf/ZkaHA9N0WCLXBKvm+RpRgsMIk3l/Gg42
	Ug==
X-Google-Smtp-Source: AGHT+IErxmUjkbpdOVTBZRei6/lxrXtJY3REuHrmbihlqvMLjIkHsQV2ILFyasonDLVFlXXQ//H17Q==
X-Received: by 2002:a05:6a21:8986:b0:1e1:90bd:21a0 with SMTP id adf61e73a8af0-1e190bd2695mr17071059637.42.1733833201546;
        Tue, 10 Dec 2024 04:20:01 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:39c0:3a00:d462:7845:5eb0:91e1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd50e37084sm2558856a12.76.2024.12.10.04.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 04:20:00 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] soc: qcom: smem_state: fix an OF node reference leak in qcom_smem_state_get()
Date: Tue, 10 Dec 2024 21:19:55 +0900
Message-Id: <20241210121955.992519-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_smem_state_get() leaks an OF node when args.args_count != 1 holds.
Add a of_node_put() call before returning an error.

This bug was found by an experimental static analysis tool that I am
currently developing.

Fixes: 9460ae2ff308 ("soc: qcom: Introduce common SMEM state machine code")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/soc/qcom/smem_state.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/smem_state.c b/drivers/soc/qcom/smem_state.c
index d9bfac6c54fb..6a477e3c1316 100644
--- a/drivers/soc/qcom/smem_state.c
+++ b/drivers/soc/qcom/smem_state.c
@@ -112,6 +112,7 @@ struct qcom_smem_state *qcom_smem_state_get(struct device *dev,
 
 	if (args.args_count != 1) {
 		dev_err(dev, "invalid #qcom,smem-state-cells\n");
+		of_node_put(args.np);
 		return ERR_PTR(-EINVAL);
 	}
 
-- 
2.34.1


