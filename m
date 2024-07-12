Return-Path: <linux-arm-msm+bounces-26016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F192F6EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 10:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 102C7B22160
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 08:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1AE12DDAF;
	Fri, 12 Jul 2024 08:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZPg5w9D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EB312E4D;
	Fri, 12 Jul 2024 08:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720772875; cv=none; b=OfmYvRy2K7G5FmK1SGXpoILMoTRxIKrZWI1h79D8qxzlJyWRxILiGZqX9Mj/fufBVaDyyJp53J3zvywDw6r5ZbNAwoSwvXsO1DBqn/64OlpvRFV91oAuhhyCNMEyIdlLzyf2qrnz2CIJejeGA+hLVIebWeKTUkGtBrSpEMJDtGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720772875; c=relaxed/simple;
	bh=le5dYeKeMN72cFGphIh3Zjwmzh+E29gcZbJr9tLoWiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aG+DFdZbNc2QeNJ6CgoNbR45GrH7CFy6nVZFLUTa1wn+JegTgJLMv2zCFJNZrvfZYY4LogN2NMbNAQC6vn97igCttoDWBzeFAcRpQKhgQeLbOqKUNusWdxITxiN+0xWmls9/slxqnmQihsxQGoBNwNNc9ojgRaWHV3OPdt5sVzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZPg5w9D; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fb3b7d0d3aso11159035ad.2;
        Fri, 12 Jul 2024 01:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720772873; x=1721377673; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pUH4Ta/QRdnRhyzc2SMs3g2de0B3R+JsmqJYPNB7zhk=;
        b=PZPg5w9D4BiNi8/fTZKIaatiFtpOY/Dt40q9rrBDCNhbCi25fs+e4WywZwZY6oL4dT
         jUzx9PEH4/0NT8cuO06yKbU5qbP0dDvtRzpT2JArM5/cAvu1O20uMVDOFZOJzpoRdsnV
         D+lwdpgOnwgs/qtNrnC+h5x7IZT+fS9NZ35eBFGslZED7LI2Garo61op1qJFKW3cMp4d
         z4Sa8W1xGC15HUywt4eRO9nNQVLW2cdHm/vBa4w3h7NAZtKgaaIFQtKdk2mAmPBNXlnh
         zOSQf5UpmW//cXKR8BgB9/i0Vlin51l1xEsOeK7OD712A3AcxSnT+VBjvvOaasuH6gka
         HT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720772873; x=1721377673;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pUH4Ta/QRdnRhyzc2SMs3g2de0B3R+JsmqJYPNB7zhk=;
        b=lBrjy87lkDjRGWu/uVIZhIrgojKai+zwtcOvpVJ98VWG15h4fEv2d953lEpHuW5lSs
         JD2eYxJxyN2sC5uT4qxqIqceKJazPK0yqlHugYXgtacAqZuTBrA/j2B/C4o3BGe3EboY
         F3iEu6zK4/4myMr2KL4WulMeGbGbQ2jYaLHjzkolV4MkCoovadp471QBxUO/xRJVMOJT
         bnvV3G+5xv5y/IFof1eERPwhpX1r/zsnDjdSyvvkQ60IOalCzoCa7DPUoEMvuLxfkMbD
         drNCCoPHnr08PYaOqZfpLyqhUon8BDtnqsQMmgWkCmMvDutAh3V/DkKousVeL+qxl+RB
         PXLA==
X-Forwarded-Encrypted: i=1; AJvYcCVpPun/9jiRc0wxoWd85lB11dne99klkwR+bl7LklSPD2AovbOMBYPgqilFcmQKquADPgETjzT7PNEZlFXhbIK2d5uyEd71iM4hO9fayEXWTjOltxUi2HT70aR7xSmFFPRFdeqGpeTnYkW2yg==
X-Gm-Message-State: AOJu0Yw65fgqt/q82oHDMDGZm+z1b8kmUeSz5Y3zPCmWNNciYHOGe3WK
	519XBX26u47fwPt/8Ya0wQNTaFAkp0PY8QSiEu4dLv8zEJtwUyIMEF50pK4s
X-Google-Smtp-Source: AGHT+IHnj9sXK5oRYwp2GFRckd6tuQls03MuSd64jLQFj1cYdnZLjOfUUmo8IQ2Emib66b1FAEoXTQ==
X-Received: by 2002:a17:902:e80d:b0:1fb:52b3:68af with SMTP id d9443c01a7336-1fbb6d03e42mr100607195ad.24.1720772873083;
        Fri, 12 Jul 2024 01:27:53 -0700 (PDT)
Received: from bnew-VirtualBox ([2405:201:3020:7812:62ae:9a8b:a942:6b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ac0c82sm62040785ad.185.2024.07.12.01.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 01:27:52 -0700 (PDT)
Date: Fri, 12 Jul 2024 13:57:47 +0530
From: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drivers/clocksource/qcom: Add missing iounmap() on errors
 in msm_dt_timer_init() function.
Message-ID: <20240712082747.GA182658@bnew-VirtualBox>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add the missing iounmap() when clock frequency fails to get read by the
of_property_read_u32() call, or if the call to msm_timer_init() fails.

Signed-off-by: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
---
Changes in v2:
 - Add iounmap() if msm_timer_init() fails
 - Update patch commit message

Previous discussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/20240710110813.GA15351@bnew-VirtualBox/
---
 drivers/clocksource/timer-qcom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-qcom.c b/drivers/clocksource/timer-qcom.c
index b4afe3a67..eac4c95c6 100644
--- a/drivers/clocksource/timer-qcom.c
+++ b/drivers/clocksource/timer-qcom.c
@@ -233,6 +233,7 @@ static int __init msm_dt_timer_init(struct device_node *np)
 	}
 
 	if (of_property_read_u32(np, "clock-frequency", &freq)) {
+		iounmap(cpu0_base);
 		pr_err("Unknown frequency\n");
 		return -EINVAL;
 	}
@@ -243,7 +244,11 @@ static int __init msm_dt_timer_init(struct device_node *np)
 	freq /= 4;
 	writel_relaxed(DGT_CLK_CTL_DIV_4, source_base + DGT_CLK_CTL);
 
-	return msm_timer_init(freq, 32, irq, !!percpu_offset);
+	ret = msm_timer_init(freq, 32, irq, !!percpu_offset);
+	if (ret)
+		iounmap(cpu0_base);
+
+	return ret;
 }
 TIMER_OF_DECLARE(kpss_timer, "qcom,kpss-timer", msm_dt_timer_init);
 TIMER_OF_DECLARE(scss_timer, "qcom,scss-timer", msm_dt_timer_init);
-- 
2.25.1


