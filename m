Return-Path: <linux-arm-msm+bounces-26074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D255D9304CF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 11:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BAA0B22B6A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 09:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663EF2E639;
	Sat, 13 Jul 2024 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCwgJCs+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA64B1C280;
	Sat, 13 Jul 2024 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720864642; cv=none; b=D3cOhBAjuZ4Apzi9GVadb/ZMk6PJm0+egUneI3ju+Pmay/E7fpI9576KqwQHF/gVJ5sGY4NkMRsfxeWZKAb/UCs+Zteo5JAAU4r4+LqhCYIhxwTMv/jcem7EgbpqsfX/3Yw9kLX2miD7lBvbNdkcIDPX217mTuC1Z3Wo/dHOY8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720864642; c=relaxed/simple;
	bh=B3/jYOcAN+OVnM5JZzWd4qYevjP9HSRYyPAj5aUmjvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D8M3k6UyZ6kaKIe7ORTVDlW9OpKG1HMq0RzPON0vIb0x2lnV7+afqZdCWNRuL2FFVTDDFR150+k9ogdNQHFsS7po+HDpoGdrU+dSOxjEJPrPASxxh6LDTz8IC/SAWPkw1eUFFDJPKf8zS8174sLXEC7ykjj1qym+G0Xh/hHeoAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCwgJCs+; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-375af3538f2so11012015ab.3;
        Sat, 13 Jul 2024 02:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720864639; x=1721469439; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICI4n16LZr6jPxXy3eh6CbTMJfQAMfRFyVp0MQ7s62E=;
        b=XCwgJCs+PH6J8PV94993logTQbRy3eyWvh+2g7z72Isub8p7XrApiSrmdogBxAN4Xo
         doW0SJrQJ9u2kmzerEjuPxQ7+Hoo0wxcheE/wxsUWlqUz4wQkF8VfDlFUq0POlsOnjvU
         xopJRCmgIPt+kfldQaB4ofuLSPhkY5MscHsQ/4WXHU5DVWBi1W3nMGYkDpb5pZzY+eWl
         R5ot3Y8sSEFsYl2aY0Px4aLkIC2Z4dzk0lHjXEcpQmvpc7R8NNhVhnzu3jdq+/2Bp3O1
         S5TvCwpK3F/inEABeT/0dQpHF9Rl++7yMdrw/mAe+AjQkzi9dRaY8PxbQr2LJAbpyEsi
         mWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720864639; x=1721469439;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ICI4n16LZr6jPxXy3eh6CbTMJfQAMfRFyVp0MQ7s62E=;
        b=sFRP+AzuOiyla2FJNyRgofmrn5FHhkSNgtNhxa4EPTM5daPBwtYk8P/DkXcCqTomjq
         36yhil2EwrEwFY8pm2af0FYiabCdlWG6CskqfUKscFOu+LUdwr+pfxbogP/rCdWYbbiL
         muGicabJ7aDb7dm8KKAsWtJjTZ5Jr7lh6ymI/88FX8uBaJZYzrtN3BJbk1BMRQUiCIZE
         qClDEU4KsCKsEC7pZAp4M9h25wbhqJw5ylYRR5H1kjWLz62ZHJIre/gVPT15y6rFb8ml
         SDjCP2aO2qCxQBDPpcW2zZPm554FnPWGRzB+CtBi9C/z25dHEJoe9xnQICFUMOt//cVJ
         JHJw==
X-Forwarded-Encrypted: i=1; AJvYcCVirfQOucIEw6Zfs8uFXWOsglFvpnPt/fg6AMhOzpp5N6TNb/Eocm5cABEF8bdKxgV6wVdPHkEV/5BwioCUm3/n/JLQ10N5hSiRcOgA/hBO3lkk62+ZEf38lqQ+/3/vjl4uF6AVsntCmUuRHQ==
X-Gm-Message-State: AOJu0YzjOzUQeFtuee70E0ygzPUVVb9ZISOZnCbao/YALMYgGvnABBc8
	fFm3bzUriimqYglJTKE+2JVAxIFYfmtoTMZY27YvOvSjW8l2sEXR
X-Google-Smtp-Source: AGHT+IHzlN17RVlFYuUuX79zY20MmYPraPq/XAjQMTHfz/5HJU0d8otQl4AtF1xmWGY8X0y0CLgOGw==
X-Received: by 2002:a05:6e02:156f:b0:375:b19d:deb4 with SMTP id e9e14a558f8ab-38a572141edmr151934955ab.7.1720864639192;
        Sat, 13 Jul 2024 02:57:19 -0700 (PDT)
Received: from bnew-VirtualBox ([2405:201:3020:7812:2a86:5bd7:c7ce:a9dc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eccc496sm903700b3a.191.2024.07.13.02.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 02:57:18 -0700 (PDT)
Date: Sat, 13 Jul 2024 15:27:13 +0530
From: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] clocksource: qcom: Add missing iounmap() on errors in
 msm_dt_timer_init()
Message-ID: <20240713095713.GA430091@bnew-VirtualBox>
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

Fixes: 6e3321631ac2 ("ARM: msm: Add DT support to msm_timer")
Signed-off-by: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v3:
- Update patch commit message
- Link to v2: https://lore.kernel.org/linux-arm-msm/20240712082747.GA182658@bnew-VirtualBox/

Changes in v2:
- Add iounmap() if msm_timer_init() fails
- Update patch commit message
- Link to v1: https://lore.kernel.org/linux-arm-msm/20240710110813.GA15351@bnew-VirtualBox/
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


