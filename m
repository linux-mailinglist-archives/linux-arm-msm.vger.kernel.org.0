Return-Path: <linux-arm-msm+bounces-53357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF6A7DAE7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 12:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B8F31891613
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 10:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBF3231C9F;
	Mon,  7 Apr 2025 10:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dUKgnJ0c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F95A2309B0
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021031; cv=none; b=ifKs4RQQSeSKiCqZR1FT7cyMNuv42sDJI8VnsWn3oZpkXKMP1VGF5dehf8H0bB57bM0nHf4FzqAAM6xBRekV4vm9gps0dhV84ovQCWDdDki5m6ysPIC6u8xdyM7khHznwqBbRT2eGaoaosX6pm417dQGbpwcW8y5KzswDXWlyPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021031; c=relaxed/simple;
	bh=YWJ34j7xCQDhTiMNfYYLeseOAG7KJPfmn+Y8UFFCVW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=agMYBBua8kTkTHphBK5Yz2l+wLdj6rKhUg674Ndmg14sfZiv4yv+T51BG1CI+m9sy3z/xCtNoWrI0LYCMkqMPznVxOgIYq/25HifKAQIGsj8TjiHYxQo59GB4CpP8hAyr60Lt2eiIjZkKhAQcpFk2JG+yZJBdMcdI48XSGC55Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dUKgnJ0c; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso21032735e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 03:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744021028; x=1744625828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDP1Z0ZMTTNt0kswy5xA7deGiP0r00iI32AWjJvJBV4=;
        b=dUKgnJ0cIkp2+BoEB/wTT46zAeqPwb4IP5UwqyAyGqGOPKMrhIqc84QcvxvszhGUQs
         2BL89JrWxnWA26GjVD4B9EDafN3EpLWzrdmudB6E6FCG0mQRJjRJpGu0EAeeo3Pq8c7G
         WV9erYw90pBvQJ34MshemUwwevJJuhTQBJLhDv7UErR8BSJLsSXjTaJ4N+0BWIZUfzV3
         vSnBLxlFg8abrbR1wfpz9MhACD1Lmgm9GXekjISnFBJ0libzQ7SI5bkLVbp4h5vq3VjD
         p5EWe0CD8Y4zUlcX/TWZP1Edw0EXkDJI7MEzt7lhJjZa5h5qNPAs4z3+Ze1D3l5AUE5r
         /wKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021028; x=1744625828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDP1Z0ZMTTNt0kswy5xA7deGiP0r00iI32AWjJvJBV4=;
        b=GPxUZSV7bO7vIDALfL26DgRjdYMRcJ7aBhDpDmdbA0D/4MJ1U9Pm/w0G9cQ6NZ+XUr
         Q77ZvL02da747oBqGGaJvLc5vu0FsPtkohEWNqjIpekNvrlp5xHV3iCltAfuRkC2zDZY
         Duid9jcR+qJSyUbtHyXGhygvI7Bzkm04/tjclvklGFiBSIROg/TYNWgFYx8ZqTfIVloJ
         0EzG5ooRBg0Shhn5oIcihALyMXiqhjUds5q//tHi977rUrHchk390nTuWmFg/olngCoa
         bXH65MLlPECaPYl4BKPOZDpK2E4u/oROaYxJ6C0RoViLDFMAn6WTT0jTvAa5lu3O3dXL
         F59Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHxX6UPK3H0KWsA44Nf738CFsdMEtq6GNpqmpq+/MjCuhy0Y+unU5y2JRaVMloFmAke53N85MJDXiAZQNb@vger.kernel.org
X-Gm-Message-State: AOJu0YwDWSiKazqXrTt4QFO3lcJPHD9UqWWTrSORQs9VFZnEeuIWDbJ0
	Z+HHsD7jhlEvpYm56r++KkbZFw1Xoe3RNI3ts4chWqH8/DzI4uo7XJt36yEzB1o=
X-Gm-Gg: ASbGnctXmuX8aMEmPsqJImNUKH1F2LAgUv+zRkJFOYHH5GUIf1gCMVVmtuEkI1GQnYZ
	5mGRhdSpN1dkrkhGCmhwmZXbJKJlGFE62Gxdkt56CrK2/DDpPkksQrG1Lg4QdGiz+xWq1Q5imJ/
	SANuSYcjaD39Zyf97IQy8tn7AbQoJn6UCCLuZ8fBj0P478+eGJ2je0B8kNHu8Ezpjc+83ktUwvp
	4P/SBU4iFEfZBMDRnexmKN2DfMsC74Bv0bOs7GNIrIQFZkWH+PLQIyL/ki8BGbNzF79LZs8Vx6D
	ojmjx7CMYf1EOKHe30zsSRldHMjINDJ9RZoRLG4uASsYRYfitVlHSjAwIC1dpnsxsw==
X-Google-Smtp-Source: AGHT+IH1bA7eG2g6ZFY5ccY48q/cn1qwbgDKTUQtjdE6PNCKBBqrdLrjGJIHYoe4Np4eEJQF1+LN9g==
X-Received: by 2002:a05:6000:4304:b0:39c:12ce:1052 with SMTP id ffacd0b85a97d-39d07bcd00dmr9383723f8f.7.1744021027786;
        Mon, 07 Apr 2025 03:17:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a67a1sm11476831f8f.24.2025.04.07.03.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:17:07 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Apr 2025 12:17:04 +0200
Subject: [PATCH RFT v3 2/3] ufs: core: track when MCQ ESI is enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-topic-ufs-use-threaded-irq-v3-2-08bee980f71e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YWJ34j7xCQDhTiMNfYYLeseOAG7KJPfmn+Y8UFFCVW0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn86YhSTaWBCZtRUbhDHyJiFKzongiGQ0xTg4YuL1O
 an7H57uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/OmIQAKCRB33NvayMhJ0YvJD/
 wJohh7fChJ0XzWfnyC+njGmkEzzkUh0SDs+P4U82VzN/EQxwt6KlVpAlMPKqbsSkHnrOTLKFarmnMF
 q1mhKXpRXRqH2Kt4WK6O502B+vzqEE29+pwbBh4fbS8scAzE3GJnb5S6cCzYa0NHW7ugOFjDCV7Z2L
 mIH7AIRa+NmxQJcCD1ZxKAPgRYTSvh8Bm2qm1MEn8gpwd6ynB4iNcqJpzHAA3p/okBRD9cFevyp0Xp
 4mWQxyeqV2WyVCKfES+rGrnf301W56PGoclpr9QPppDJ9aDW6TgRnWHTfFF0//GFihEm+Oypp21Ysm
 X5VYQ2KLuG3UxIbTAykngEnx+Mgr2N/qX47KU1IVJRkEX/Y+OIxY6hSRZ6NrcmzDwJC5i+QLiO/eWE
 XQF1vISdKXPm8PkOUolcu0+srQq1O7b+Mx/FV8gSMS2vuiTHDCPLMixY+vZsE6E4UlM3s7gr4ewIAF
 TLRUjmuXT+c5ZOP1sYeazBzUfCvIN2tWM11gyAzZJEVpdqCuFiaXjJoKABUcnoTfHt3I4e9Mfnlrnp
 M+1aOjedD7B+MynnyCLOvY6aq0Q1Gc1pxRsj3Ygfk9MPlk/AAEXb6uZwSJfVEPez82HV2MTFuzMSsZ
 YQOlz9HWKgasKsVvf3xYWr8FDjfg+H61eZg4NHMza7UdF3E6OsGdpZPUxFJA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In preparation of adding a threaded interrupt handler, track when
the MCQ ESI interrupt handlers were installed so we can optimize the
MCQ interrupt handling to avoid walking the threaded handler in the case
ESI handlers are enabled.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 1 +
 include/ufs/ufshcd.h      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 5e73ac1e00788f3d599f0b3eb6e2806df9b6f6c3..7f256f77b8ba9853569157db7785d177b6cd6dee 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8717,6 +8717,7 @@ static void ufshcd_config_mcq(struct ufs_hba *hba)
 	u32 intrs;
 
 	ret = ufshcd_mcq_vops_config_esi(hba);
+	hba->mcq_esi_enabled = !ret;
 	dev_info(hba->dev, "ESI %sconfigured\n", ret ? "is not " : "");
 
 	intrs = UFSHCD_ENABLE_MCQ_INTRS;
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index fffa9cc465433604570f91b8e882b58cd985f35b..ec999fa671240cb87bf540d339aa830b6847eb71 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -954,6 +954,7 @@ enum ufshcd_mcq_opr {
  *	ufshcd_resume_complete()
  * @mcq_sup: is mcq supported by UFSHC
  * @mcq_enabled: is mcq ready to accept requests
+ * @mcq_esi_enabled: is mcq ESI configured
  * @res: array of resource info of MCQ registers
  * @mcq_base: Multi circular queue registers base address
  * @uhq: array of supported hardware queues
@@ -1122,6 +1123,7 @@ struct ufs_hba {
 	bool mcq_sup;
 	bool lsdb_sup;
 	bool mcq_enabled;
+	bool mcq_esi_enabled;
 	struct ufshcd_res_info res[RES_MAX];
 	void __iomem *mcq_base;
 	struct ufs_hw_queue *uhq;

-- 
2.34.1


