Return-Path: <linux-arm-msm+bounces-25267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2A09274B2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 13:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ED461C2137F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 11:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99601AC23B;
	Thu,  4 Jul 2024 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zc8x2B4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E889F1AC227
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2024 11:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720091573; cv=none; b=MoxXdEg8zjc7QB1H+FMTTqhhFXoT3uN4Edfkme/GD05eXkBIGmyDaAfsSFocpfDqvOSwDvlYgs0bYVlTavLMrGys3m8aF7NRWBkuj6udk4C/l8Lf32gRnvp/qoFrjCYwx9hkPt7oehAtZaccQ4afx1K+G9GTMIeCT1wge4HoZlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720091573; c=relaxed/simple;
	bh=kwlzyQko3YrlL9qqxe77HjjjJn+6EPX3Akye8+HUD68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bDs7/cEgZP123B9T++okMtGeLy8aNbDC2y8Ost/juA6sgZkrPee5gb/DnlmHOcdRDHqfqFMwOxIdg2SAsFyMHxNdzyORhLBH6McEdHyGcYrSRySkOsypjt/q78iTGrF+B8VwpQPC8mPurD1/1nTfFc+sPXFytZeS+f7GCllfpvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zc8x2B4N; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so6330671fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jul 2024 04:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720091569; x=1720696369; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tPC43rasB/6PLGfsWyLsHpREn7UhdyM0rRDUzfTMoaw=;
        b=Zc8x2B4Nhj0vNk5z8ePe4ReNaOvU/FyZ1Q4mHE5CK4FqarS7Fz06f7a8MkafRPyanY
         t68uQFxMdEwM0HxWbe11a1rp8MliDMw6eadyxKw9NTmanN7kovxcs+SqM5AYM3oWDCra
         n4/bgrdYP4nkONXzdf6fiM35Ru+Lr1AjAp2Pp+WXcf0I+i7nACNF6udOOSQA0tisbBPt
         b0EbYXyYyEnioL49crz956U6HV21CdX7AqoEvC2kAxhf5wFXCXksNgvUsuMDotROP/u4
         oS/vNEWnxRHQOy1X8R5M6JGEM5iNEWVyr2vZDE54NhtJO0xETdQjPq/HCAtRm6sOpwvr
         +RJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720091569; x=1720696369;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPC43rasB/6PLGfsWyLsHpREn7UhdyM0rRDUzfTMoaw=;
        b=bX6sifYJ5Bu5xN+w8cAnG1lHb6p4O2WsTUHNeyVaBgr1zLwMaMsczPgJstcCFJw/n9
         y+7luD6okexTk1BhjPjVgIEo8PSIekALVewt03jCTQoO3CYuaduRW35tDgitpdyvP+4u
         pNsXB5Ex/GibPDamaFfPlICN/SHncp/EEji7nc1cBZH0QTgL6lDd24MjeiXF0SxsET1a
         P+DoQP4pxxg5LiTUSAq16Swl3ZS3LPZNzpGjFGqSUy99yjtmc4Vpm0G06IBevrwMsNAY
         3UkQKXf1vljykUTolKDDmBBClTcxOXJfsEcK7ndujNucVvc/N9H4Hiq+UhePytp+967Y
         Xl5w==
X-Gm-Message-State: AOJu0Yzk/buYETYpgyHoPqwJGIjX09JOTtTmSMUpuf5xUA1eTiV/XuzQ
	M7RpaHnqGUtX2cHeN7ZmwT4/rWn9QaCv2oO4ngi6KjHp7Hq76PsfvjdyjYZjqTs=
X-Google-Smtp-Source: AGHT+IFms/l9EmzZxMph8D1Drc8PuDALxOm8EuU40LrFeEyesL8Xp6EbT7z6hzNTjKi0IszFb3Au2w==
X-Received: by 2002:a2e:b049:0:b0:2ec:57c7:c72c with SMTP id 38308e7fff4ca-2ee8ee01fd8mr7848291fa.35.1720091569001;
        Thu, 04 Jul 2024 04:12:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee8d0396a3sm2113881fa.68.2024.07.04.04.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 04:12:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 04 Jul 2024 14:12:46 +0300
Subject: [PATCH] firmware: qcom: tzmem: blacklist more platforms for SHM
 Bridge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-shmbridge-blacklist-v1-1-14b027b3b2dc@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK2DhmYC/x2MSQqAMBDAviJztlBrQetXxEOX0Q6udEQE8e8Wj
 yEkDzAmQoaueCDhRUz7lqEqC/DRbhMKCplBSaVlI7XguLpEIQu3WD8vxKeQqnLBNK61poZcHgl
 Huv9rP7zvB3IiPBplAAAA
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kwlzyQko3YrlL9qqxe77HjjjJn+6EPX3Akye8+HUD68=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmhoOwm1V5jQ1hxjuCBndjf0/vDRv6bE6MnpyJ+
 adV5W46kCGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZoaDsAAKCRCLPIo+Aiko
 1ZJXCACusvt3u67ChJfBSVHOT/JoRoltQEburmBUDlSvNJSEVvbU9u3pJ+Kg4W0yfSBVQXKEtfp
 B2zhCPFT/1/nOzxVmv5IZHp9diWBDeiDvCjxvSqagj2QirpQRmMd+ANy0KTYTDWhfmNDTkbYuR+
 LbfOticztug72JKVKat0PTY9SXBGIFnyT75Cvf0adm1jrOyWT/G0wgoR5UjwsGSExIk3Z1ytfCF
 6Z63KbkSsLn/1AX3dESoThPwIskEUTXdEhCu4lgagAcnIKkW7RANV4Sq8fnGxTmZh7ZlVhAvhnN
 x93nYIDEASo6FLjGW/+1VJowJW2OM77sq+IO3ptsOD1zBK+2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SHM bridge makes the Qualcomm RB3 and SM8150-HDK reset while probing
the RMTFS (in qcom_scm_assign_mem()). Blacklist the SHM Bridge on
corresponding platforms using SoC-level compat string. If later it's
found that the bad behaviour is limited just to the particular boards
rather than SoC, the compat strings can be adjusted.

Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Fixes: f86c61498a57 ("firmware: qcom: tzmem: enable SHM Bridge support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/firmware/qcom/qcom_tzmem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 5d526753183d..c715729f071c 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -78,6 +78,8 @@ static bool qcom_tzmem_using_shm_bridge;
 /* List of machines that are known to not support SHM bridge correctly. */
 static const char *const qcom_tzmem_blacklist[] = {
 	"qcom,sc8180x",
+	"qcom,sdm845", /* reset in rmtfs memory assignment */
+	"qcom,sm8150", /* reset in rmtfs memory assignment */
 	NULL
 };
 

---
base-commit: 82e4255305c554b0bb18b7ccf2db86041b4c8b6e
change-id: 20240704-shmbridge-blacklist-021bd97b8a93

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


