Return-Path: <linux-arm-msm+bounces-53355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFB6A7DAE0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 12:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F01D03AA207
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 10:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D40230BFA;
	Mon,  7 Apr 2025 10:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aw1fWeeT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2202309AD
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021030; cv=none; b=ChCNLwVtBqKA/rJvk9y73hIBoUCvRBL5Fhvu2xxA5AwiHDIPRli38eeq5SKgY/W2MMpQP4zVXKWAdqlM/EuuDNItzr4FUICcMFlUoZS3wbQWugvALFp3CvHC2CddPEyJzzHrXFRnwpnk3w1dTKJs11zsaDfZJpkjK9X9eB+AAQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021030; c=relaxed/simple;
	bh=GNn1TexJEZuCnIlB9DobcuoMATd8tMoDoJ6BdlvbUdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=locF3q3VjmTcdB2XTiLQBDBaHEeZAiUi+i4lpLMeJKtgFZTPBXtPh+VUgdqDhdP/B2LT4ZTcNbUdZh5ayysNDl8yaKh/sZU76+aFvxVpxGLCBXDe/y1+Pc5O9kKHO2XRr1eo7vHpYzRsnyLHxMxNC2EtSbDI73zgscCztHAozBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aw1fWeeT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so2411819f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 03:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744021027; x=1744625827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2fP1YHFmp/HGjFNVfs7/1JEZzFvuzBBPnLWd33Tb24=;
        b=aw1fWeeTo4vajAfKd8SIPxYdWySlvyAx04CoTHB6FshIkXoCHWMbzmC3/EDuQlzUIH
         i9cIrOs9ZHczmd1kFITuDLBETiqnkrwbFDpEKlmOV9XsGu9S1sCshNcbd+rwj4D/2rPH
         G1usB61FtzBX5oYKMJASWBkKtgYfH+28bb1JSl/Duf3im3cJWfv5ME14aBt7eXN9vdUj
         qlp9e0b+v6gFxnZY8m4V2E2SLyHgcsj2A4tRHUdUfyIaxnmtHQo3x91scCmngT3NrTjY
         wRfrJARYh1+7833jLNOb3v8DUPDlimI3rNbk1Lw2j6lfFcpWwsObD5c70opH4DBUtDu3
         p/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021027; x=1744625827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2fP1YHFmp/HGjFNVfs7/1JEZzFvuzBBPnLWd33Tb24=;
        b=WyFWSLD627mKHy3KGSeROSXjWphdt3PoBe9r4DAIfMyTBtq5O3LlW5rtrCUJltydsH
         YIu4EHDtfoMWveSd2I5cH/3XXAfu/E/G4A1WWs2Du4QuRZJRVsugRKyZMZlh7+EtFklD
         erYEYq4/db3Vq+v/0Y/PnGy3S8bOT3uY7sFTHB5ohCJMbe/7zWH3Vcm0SHR/AQrTZHVx
         o4QrCidmVL/ArspncYEjP2X1+UFytaTni8Ajhvi8hCwKgQnY0JbHjbe7AG5InCevb7eL
         UCUt3FH5ugqjFaTk+/kHMm7ynIfSeynDMa8I4TajKYcqHtM+jymlFtZkYaGdTfg87bBr
         eDbw==
X-Forwarded-Encrypted: i=1; AJvYcCWNs4n2PEc707s9HAVAFEmKPN8CuNIYy5ea7J80AjqsLINVirnXbEcsidLcGjN+Lg1CymarDuNvhG2Flsbp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxys0scxPKGvRwGUrCadCTzuInnlqFQuBoqLMXaBidqonesefh0
	uUJag7bzvGV/1qjPVKldw4p8bS1MLOn1/Ug9EgHnPhXx0kWUctgIypyojKe0iAs=
X-Gm-Gg: ASbGncuOxtPIUh84fL6hEYL1agG84jPYeIFfygoydFwNjywCfnWEyMnLVAVpnVRMbXX
	O/4VbewA6aOo1PMbnqvSKn27dHVARPDNTTSXB91m2eb5jSBJ1aAhafRJ4hLUIw2B+6kPG4NgIgB
	8R1Gn/3fKuoJzinkYWu+QfnTIpSwg8KbYtyqH28ah5+fLHtuVMCYgvnYN96/IHLgj5ApbOh+i/x
	h8MkrBCFEpmmC6W+Avg9uKeSEcH06IfsAi2J1dNQMpEfYe3Ftql9fuT04YM2Tgk/P5mgHsTRPSn
	z89urPFEwSMrlifV2+45DJ2lrY67HKePciXW0Hsp7coqYFl1YRlUVsf5VsiXXw1VKeXTtiNMf2i
	f
X-Google-Smtp-Source: AGHT+IGIXK/iFLrHvP61E4Fkey99jVc8hyaezo7l5By+jHeGlefj153g4e4ytn2994OOWpRLeeAI8Q==
X-Received: by 2002:a5d:648e:0:b0:39c:1424:3246 with SMTP id ffacd0b85a97d-39d0836e58emr10124465f8f.2.1744021027161;
        Mon, 07 Apr 2025 03:17:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a67a1sm11476831f8f.24.2025.04.07.03.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:17:06 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Apr 2025 12:17:03 +0200
Subject: [PATCH RFT v3 1/3] ufs: core: drop last_intr_status/ts stats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-topic-ufs-use-threaded-irq-v3-1-08bee980f71e@linaro.org>
References: <20250407-topic-ufs-use-threaded-irq-v3-0-08bee980f71e@linaro.org>
In-Reply-To: <20250407-topic-ufs-use-threaded-irq-v3-0-08bee980f71e@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3212;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=GNn1TexJEZuCnIlB9DobcuoMATd8tMoDoJ6BdlvbUdg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn86YgUVRzFgefMJeY504oYTCo5UkEMgaFG/EpAK+7
 SrqFBGmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/OmIAAKCRB33NvayMhJ0Rz+EA
 DDap+KSM52ODSn68mtQIDfr1KTot3nWq4xdcRddXxRhbm2zFwDYHL9hVh5Gn15NvC4KIHa3XlYhk0/
 NN8SZ9HFhbxsIXFjCkR4/o+EziL+R11x1Dx+vl0CW92ru6cOauSHVcEPeL2uHO8pzwZNMAHAt14P9d
 VhQcFqsfFlZ97xgHteaidJEr7SzbNsxH1eQOsPiX9LuCEJspCdjMbcNeJE4B1azO43sFKZVCxxgzQB
 xnD9NIPCqb89O0Tk8ZYVSqOCLgTBOgSjXXFuZe3hP3wGG6BuMPDobmX7KtKE0rXt2WRyICRBzUDb76
 eca6wcE18zAwrEf9U6YQ+c2lElPS6pzkv6vVJF2PKKxdq0aMts75nBJmq/rMQ8WAMf9LpPJaFXpKCf
 9LtDMUkXNkPcXRU6ASUFr1TgxYEgj+UKhQ373IrjlW2lOOYfeGy/VxpXYNycvDkvuWmj/DM1zo/8kH
 MnHUyO0jL9CJZ/LSQLz2ghf9dpf6p0qSxuNDxKgfhpA9tMP+pR7gqLmp0e5qdPIPYKtyieAoUudo63
 w89vwSjCyychP4wghz9dPs2p3EaId2Zw5D9cXTEiwd7zkZ41r0wOQ22J1xxuV52KpuQd5nZeKL+h6U
 FLvd9C3TRlzIhEmBrREXYBVmrX2VDmDhc5YsS7mhIn/A+N/q59QkTKmSR9Qg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to prepare introduction of a threaded interrupt handler,
drop last_intr_status & last_intr_ts drop the ufs_stats struct,
and the associated debug code.

Suggested-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
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


