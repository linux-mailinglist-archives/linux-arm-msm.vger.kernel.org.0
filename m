Return-Path: <linux-arm-msm+bounces-69108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0401DB25BD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DF107B76DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 06:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7102580D7;
	Thu, 14 Aug 2025 06:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XfJJXpfC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3662561C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755153184; cv=none; b=hmrYBzfsOkzOH71VzGy8JZBSOXuDS/scWRYZUjTi+lOhE4+bFLCayCV9g+SpuMnX9HZdRKGgAxzghUrBOYzJuOLdxK93atD9/CyVHXCG0dfLSwIvoV1DAMqCFgtz/ROHkFP+Kh5ckGhIPMmAWvrkQXL8+L+5yUZ5uxQg+fOlstI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755153184; c=relaxed/simple;
	bh=MSP9ZDwm0zsakgUyDdsbCsWSHeqo681DH+etzwx4O1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZdfQIFabmH4aiOP7y9CjGxrBIpjcq7ADdLxUPJFLMc9Ccp506tg+GT7YlLY9esdj7VezPwiCoP83yOQC/K65rciHXBR721l6CCj4fs2uFILa500wewwtWu4mN8bbXHWDnf0jADYAi1GMEOFh9hzL1jqtXNjmOnGiRX4i1E72pJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XfJJXpfC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb78fd0c2so5588066b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755153181; x=1755757981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yzvGTN8N2Y6NYFPVugmKZNPFUKHgdgs+Mpwi+TL0krQ=;
        b=XfJJXpfCuv8p82O0Of4Oo9ymw/AuBvhz2BGj5TliQ4SKAjop4ChHnu1PpA1qFWWKqW
         kOSsb3wZY8JKaU2Aip8QgQlmr3JYHzV+3NagAXJYkdoxsbB4zRHSpGhzxtc2N/+HCgBA
         8qphUzM7lzg5lzxOTNCidRDR4eCwHJwrZAh76WIVRMfaVE35ATIwEJrpFQZ3X4m+G3Mq
         AgsIGHfQJSbRN/odPjODZD7xt5frF/J4GiqFVzBw93IXYewM97rZTK3gFQzprYuTXDqq
         B9EmDu9IVIn/sS7McnwsoNCWrunEvn7mPDHB2QifVN37P2X0Aor7PoxwYhgjeSTTLKOL
         DqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755153181; x=1755757981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzvGTN8N2Y6NYFPVugmKZNPFUKHgdgs+Mpwi+TL0krQ=;
        b=w9gEmbaHKeIT1ln9PmTlOfTaY/QqSl4QGENtEkRNCLGN4u4LMblt47F76cFjEv3BJz
         hIpkMZ20f2xncrQ36xdC1GDBgFvBbS7WirsjZQnxhLnDgCpkVC+DCV9Tetm5j2amAZk2
         K3MCm7WF8rsUqkHLkuxaPr7qJ3sz7Rs1PcmyONe+VdYiSCq/k+y3SxLUQjk3TL4lrm+c
         z3OZAumFxmuKJfDdeFcHOjRQq8tgJbzCn92XE8XkkM3CPZHd+bCcMJyEyEgWJtYKRcB6
         QrO31l9NjNw28tA14t1IgwAezHDmVcy5E8xYnZtQEYosG0b80SKNfg+95BSqRDBQRNrW
         n4LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXASMthHWHsPx6TiVckqhiyM1pfc572yfyF5KwIX4Fl5RWs679ane7OagLAcbQ4DUr3bQj1mSY3aUmCEKOj@vger.kernel.org
X-Gm-Message-State: AOJu0YwKe+pK4SrVDzTHNk63zF/QOV9ZR1OWNqZeesrTpZvDPJvLjnfu
	5VHiBFgO6BPMG+LY6kRKW0hT0UtMIyEA/MECKgS0jszuElCXHlpmh+BuRzok1o2xefc=
X-Gm-Gg: ASbGncu+K56LqMJCwqfX4TDofW61NHt+AsnDNdGFI94axrrhWZH3yj0mHH3RVJhZPl3
	5R4pcxBfQIRfU1U+0xBVpbhpcbTUwCzzWYqcyrsiEetJ+mmq5ph/pZymJ29kc/++p7EPCCNIjL/
	UqYXOjVYoDRBdxorHVrZCq9/QccP5h0qFB1Bd6d/naxlNC8cxapJlH3QUYF4PA9XCKnzXqgQHeY
	eDptcjcyhk3sbGbpzCgIB8h5QZmD2cIHAoAKcNnpEHOMjWeoSXUSLCMcHVewtrjmcyLwvIbfZoL
	wlPNDOnSAcFY7WhWdFGmvutzdjNTSaMoFNRrfAXkbjbxsZaPz/hMvUiBquAobw24LzCxZh/LnUn
	2lauOTUNuyisNMgkeDo0ocW9kBcbUArFL8A==
X-Google-Smtp-Source: AGHT+IE6MPymLmR2wd2sW3Q2E17DmNqWGyrB0k3NvlQpxyRqfzkQNcWoWvM9nwmxoqFq1Ox5VfpKOA==
X-Received: by 2002:a17:906:478b:b0:af9:3c7f:7447 with SMTP id a640c23a62f3a-afcb938b374mr79084766b.2.1755153181493;
        Wed, 13 Aug 2025 23:33:01 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2530971166b.111.2025.08.13.23.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 23:33:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] soc: qcom: icc-bwmon: Fix handling dev_pm_opp_find_bw_*() errors
Date: Thu, 14 Aug 2025 08:32:57 +0200
Message-ID: <20250814063256.10281-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=MSP9ZDwm0zsakgUyDdsbCsWSHeqo681DH+etzwx4O1w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBonYMY98JneTBy4rFTUmxtFBQ2pOHgHHsaaMN7h
 sSaKTW1NAmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJ2DGAAKCRDBN2bmhouD
 13JpD/9w7VMiohNtnKxKbUZYpY3TF8JsDTOxEVf+C6BL0BJXNfucPpy3gO1MrnAr+PF+su0/HfV
 R/hvO+aiqzr4FWTi3JRXSQ4q5n7IbqZUZqhZGietk7sa4PLQjLH6Sa3vt4Oy+hILkM6NLAmh+Kx
 AkCYZygh8ICJilg4UvgfGpxPf9ISl2F7NDB4UL16tGa358DrWFHRnsGOVMsPY01+Gj72kM+6opy
 MSF6IAkSWYCi51yAvtDrzR6kVuEA+boaOzekj8vQd+i0RcX3D1NBMVTretM0RtOpAaRsYI4dDn4
 mAxZMIaL3Y4Y8V6JxHH0VRae4ETlldPElk5dg5BR2YZvsc90+em0hQq6ZslP4nqv8pVsJzazRm2
 cMitdSpjtc0Ejsp+RD6oM37TdiSOTeHqb3ZkfEg2xaLVt6i+CDXW9KXDa6NdLeDCIg3k2zmv96z
 z5xZ4fkyztJRcBG5A9y0BlHkQ2aopgrLqj3cPnhUGFAhRJgxCykrZ1vJGjcPKmXWNfOulXXLYU2
 6RB0gt3rpi9kgBLd5kI+KoEorHPSWuuIXaMIgzGTUKbJqnHlqrXbyc7ieKNcq2h5SfnqMs3ZghT
 hpF3ryE2qbAVKFSE93tyYO6j7fAlnTSFuabqQLBNrOOH/lxFt6/xbwCmm2Rr3K0x7w/UmyaZHme sUkm6PlLcFtRe4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The ISR calls dev_pm_opp_find_bw_ceil(), which can return EINVAL, ERANGE
or ENODEV, and if that one fails with ERANGE, then it tries again with
floor dev_pm_opp_find_bw_floor().

Code misses error checks for two cases:
1. First dev_pm_opp_find_bw_ceil() failed with error different than
   ERANGE,
2. Any error from second dev_pm_opp_find_bw_floor().

In an unlikely case these error happened, the code would further
dereference the ERR pointer.  Close that possibility and make the code
more obvious that all errors are correctly handled.

Reported by Smatch:
  icc-bwmon.c:693 bwmon_intr_thread() error: 'target_opp' dereferencing possible ERR_PTR()

Fixes: b9c2ae6cac40 ("soc: qcom: icc-bwmon: Add bandwidth monitoring driver")
Cc: <stable@vger.kernel.org>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/aJTNEQsRFjrFknG9@stanley.mountain/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Some unreleased smatch, though, because I cannot reproduce the warning,
but I imagine Dan keeps the tastiests reports for later. :)
---
 drivers/soc/qcom/icc-bwmon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index 3dfa448bf8cf..597f9025e422 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -656,6 +656,9 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
 	if (IS_ERR(target_opp) && PTR_ERR(target_opp) == -ERANGE)
 		target_opp = dev_pm_opp_find_bw_floor(bwmon->dev, &bw_kbps, 0);
 
+	if (IS_ERR(target_opp))
+		return IRQ_HANDLED;
+
 	bwmon->target_kbps = bw_kbps;
 
 	bw_kbps--;
-- 
2.48.1


