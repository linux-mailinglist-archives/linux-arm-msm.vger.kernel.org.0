Return-Path: <linux-arm-msm+bounces-52513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70614A712C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 09:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63B753B8846
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 08:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D90B1A4E98;
	Wed, 26 Mar 2025 08:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IgBfbsJQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C89319F495
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 08:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742978199; cv=none; b=htKXBOsy21Q1PGRkI0HTEDOpykmYhf6+UqdrOfBJYyOsSZFVCcBsQQM4qiYiRdQ4VmW2iNVD/bZ+7FYYao/GvY2jbtvxwyv8t2jGRHfMVt2oFIAgNYuZeYNn7hFsktgPMcDTdIDBl2JyqjD0IPsJlDQosHKZ5UUShBogJMe+rnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742978199; c=relaxed/simple;
	bh=w9wNzYU+aPbStF8kAGgTTTVPFywdX62D8q7UXWKnFnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q7Sd3pTC6KEpO+sf7GMILhKwT5xcLyqaMxSFuIN6sQ74U9V8iXN8ZWr6tmVKfwjmfRH3g6/c7Kr2cI6VOoPKDrPCapibL4iFNGQDeIjQqov5g9W1M3a4J1OexzepaDbVUO4YyYbefRfLzyWwR6j8cDqMCLyXhwbCXgDOQjKftb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IgBfbsJQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso64035085e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 01:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742978196; x=1743582996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4cKiD2wr70tJ2BhsXs3hlRFzhjZNcSJsAA0y717TPA=;
        b=IgBfbsJQh09ULKfRGOdvRUqWcYK2FxTQXb0RqlV+WauzLnJQREPUU7kXB5i6F3Nbj8
         rEXhjh5A9IkwtY0Z445mQyUZShTseLYgBtUgC4vEp1MFC73vcd0EvRisn3tFFNzzRM1H
         P7g8TpXIP+ZcFjx2ypCqApaPV0+fjZ+O5n7kCm8gCDfJx6yz2Py9Sg6lynvgQFYOq0YU
         jHEiifkxUUnBcuofc5HgDhscEoNyKktqfvJpVb1PYEY8OW8XQt6dmjx++2YVSHXbwXFi
         KLv1Fdd2zgdaAEgMQklF7Sxdfd3rvVLiJXWQs3vHGfrB6Oh+1pJRxI5vT6RTUHB4R3vU
         D9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742978196; x=1743582996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H4cKiD2wr70tJ2BhsXs3hlRFzhjZNcSJsAA0y717TPA=;
        b=rm8cQ0FAM1qFRT4vxv4WJzVD6HzwPfrt2xGDo+bCMr1raqbvAmHM0CHUts1vIxo+AD
         oEeRQvaXK86s0MCwULWseKCUQ1h6Nj9Lm96JePYbBsF7GYw0oe5OdsCLFMLXx/PwXMyZ
         XNj55uVfBKOrzOPPwWeibTtbYjmbCdfeaj0AESjuP4hH28z75DDePPwh3X4JuoxgUe9T
         TRyx7bBOGs8FerQOT7+RGkzZtIsHHSkBbUFs8uwtF9VSlpykRgM0FH2er2XcOXiiAb10
         JRSfcDK0gHhiGnbG265J5OVL/UusgZTuHCJExH1BG0umsNvKZZqD3P3Id4PD833QhAK3
         uUpA==
X-Forwarded-Encrypted: i=1; AJvYcCUcTauS/J9qt+dP1cCgOOXMtXxnS8FBgjE6pJ66o3Gnf/DFLJzIMJiy9YEnvhsaDCM5Yo/hQlq492qKWqW2@vger.kernel.org
X-Gm-Message-State: AOJu0YwzhTBXNWJIQMSj3NeEn6UabHynrSPL5LOlxe1gm+BKmd3RMpBM
	v/Ad9ixnJmEYCK2ib5+TvVaeOC9kzU93UEIJgyOU9SX0gE8rCOS2dwwg802lq/Y=
X-Gm-Gg: ASbGnctWBOHdp4ki/QviSzoJkfjWgoyd+oUr380cWDtfC9mSjtJsiy39gZN4ayBDh2f
	6Wh+k6SIf+n/nMODYdPvxH27/SYGhQVVAyuH2TfoZN2e3Im6jJxg0SzQb1OLAsvAgo9LisXd8By
	AZzUcopXPUAi/snKxsXq1jyBHhrPYFtBdBBDb8SL2Vf0IDHwL/3RCOsKk5wKr+1oiEXpyQi5jeW
	jMhaZAM9yZm8XRr9dFt66twJZlxITLeLUjlobdPc3ZpW0V3d60WLpp7Sz+0rm/5ME2+2jewcP9P
	HRfM5mN3sbZsLtjzVz+6YO04DamcWZ1pBKQ+ZlBof+sPPM7wWFpk8RkIMP1eCAds2UlIcmeDXKB
	e
X-Google-Smtp-Source: AGHT+IFsj8loULGb6ONI7TIxEQoBTJELk7QeTPsICMtStG6xC0Zx9gne0MS4JiDzm1A7viVbhzKE+Q==
X-Received: by 2002:a05:600c:46c3:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-43d5e6fc3b6mr107741795e9.29.1742978195655;
        Wed, 26 Mar 2025 01:36:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fcea400sm176823365e9.2.2025.03.26.01.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 01:36:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 26 Mar 2025 09:36:32 +0100
Subject: [PATCH RFC v2 1/2] ufs: core: drop last_intr_status/ts stats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-topic-ufs-use-threaded-irq-v2-1-7b3e8a5037e6@linaro.org>
References: <20250326-topic-ufs-use-threaded-irq-v2-0-7b3e8a5037e6@linaro.org>
In-Reply-To: <20250326-topic-ufs-use-threaded-irq-v2-0-7b3e8a5037e6@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3094;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=w9wNzYU+aPbStF8kAGgTTTVPFywdX62D8q7UXWKnFnI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn47yRFXcud1GnInRxtT2r1ht0zT5Esp+Gl9CCVLFa
 rP96LlCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ+O8kQAKCRB33NvayMhJ0XLeEA
 CkMHi8XwcoEVwEYO7/GFQ4ggtCzDr+PWYoyPKpP8U5RVtdwYQXkmGIc7XoIyYFaaWENDLkf7J5wtdP
 zsNIUiZFmkINO6U2882Zu2ogZv1oH3mjQA78zoL+Jt+dqiqFKR9RM3hob+NeiL+YNrwxg4c5rNEqxz
 uYMKYwJ/NGNHZ+yhn8I87ZJ8ap0U8dVAcZrELqZ0n7TrWHUUKURq0MoUByEktti+WIesVIVpDbNICb
 Fhsy+NSTHqXC26mfSWjO/m+rG4l3XBgri1hMhRtlDEKLwynELL9BLBe7NlZpEih9tax3jRXT0FeEdn
 ktyUtHYF2yHap+07UPGggFME/iAP06UvtysMZLMq+vwSQHhMLT3hq4ozwyvGHuORAZ7rVa0knBOTum
 kPDqbJuBVwpkdrOmfVKmUAc9+aZd/2Acq7DosrXAK5KNedzMqbrhkwwApGLtuNg46qDA6+zrJ/XHh8
 /CxiMAzjkJhfnTMC/oNxKWoZrBSz/Y6EMnjAFw9rvs35DCMr3znk0JEOm36q5N8NEReNdS77K8EwAU
 2Ay8lAV4I1xBTaZsQUwaAtq5gE7neuOugvEGPsrSsMDY6M7LGZ/HGwtbglx/rh2HUFpusaPebNt+vz
 PMkZW7PjTb+DoeTHo9KTzmjuIq7sxhPBQadbt64CQoMELLLFlRTtpQFbZMDQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Drop last_intr_status & last_intr_ts drop the ufs_stats struct,
and the associated debug code.

Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 11 +++--------
 include/ufs/ufshcd.h      |  5 -----
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 0534390c2a35d0671156d79a4b1981a257d2fbfa..5e73ac1e00788f3d599f0b3eb6e2806df9b6f6c3 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -643,9 +643,6 @@ static void ufshcd_print_host_state(struct ufs_hba *hba)
 		"last_hibern8_exit_tstamp at %lld us, hibern8_exit_cnt=%d\n",
 		div_u64(hba->ufs_stats.last_hibern8_exit_tstamp, 1000),
 		hba->ufs_stats.hibern8_exit_cnt);
-	dev_err(hba->dev, "last intr at %lld us, last intr status=0x%x\n",
-		div_u64(hba->ufs_stats.last_intr_ts, 1000),
-		hba->ufs_stats.last_intr_status);
 	dev_err(hba->dev, "error handling flags=0x%x, req. abort count=%d\n",
 		hba->eh_flags, hba->req_abort_count);
 	dev_err(hba->dev, "hba->ufs_version=0x%x, Host capabilities=0x%x, caps=0x%x\n",
@@ -6984,14 +6981,12 @@ static irqreturn_t ufshcd_sl_intr(struct ufs_hba *hba, u32 intr_status)
  */
 static irqreturn_t ufshcd_intr(int irq, void *__hba)
 {
-	u32 intr_status, enabled_intr_status = 0;
+	u32 last_intr_status, intr_status, enabled_intr_status = 0;
 	irqreturn_t retval = IRQ_NONE;
 	struct ufs_hba *hba = __hba;
 	int retries = hba->nutrs;
 
-	intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
-	hba->ufs_stats.last_intr_status = intr_status;
-	hba->ufs_stats.last_intr_ts = local_clock();
+	last_intr_status = intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
 
 	/*
 	 * There could be max of hba->nutrs reqs in flight and in worst case
@@ -7015,7 +7010,7 @@ static irqreturn_t ufshcd_intr(int irq, void *__hba)
 		dev_err(hba->dev, "%s: Unhandled interrupt 0x%08x (0x%08x, 0x%08x)\n",
 					__func__,
 					intr_status,
-					hba->ufs_stats.last_intr_status,
+					last_intr_status,
 					enabled_intr_status);
 		ufshcd_dump_regs(hba, 0, UFSHCI_REG_SPACE_SIZE, "host_regs: ");
 	}
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index e3909cc691b2a854a270279901edacaa5c5120d6..fffa9cc465433604570f91b8e882b58cd985f35b 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -501,8 +501,6 @@ struct ufs_event_hist {
 
 /**
  * struct ufs_stats - keeps usage/err statistics
- * @last_intr_status: record the last interrupt status.
- * @last_intr_ts: record the last interrupt timestamp.
  * @hibern8_exit_cnt: Counter to keep track of number of exits,
  *		reset this after link-startup.
  * @last_hibern8_exit_tstamp: Set time after the hibern8 exit.
@@ -510,9 +508,6 @@ struct ufs_event_hist {
  * @event: array with event history.
  */
 struct ufs_stats {
-	u32 last_intr_status;
-	u64 last_intr_ts;
-
 	u32 hibern8_exit_cnt;
 	u64 last_hibern8_exit_tstamp;
 	struct ufs_event_hist event[UFS_EVT_CNT];

-- 
2.34.1


