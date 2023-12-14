Return-Path: <linux-arm-msm+bounces-4764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1B28130A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 13:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E9D01C20ACE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 12:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CCB4D59E;
	Thu, 14 Dec 2023 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sqi3qwLl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE5CDA6
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 04:55:43 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-425e58bd4c8so16487911cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 04:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702558543; x=1703163343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYvEigRoKhZbgGLuv/4wRFyGkLXXYVjXdCoJrdge4oY=;
        b=Sqi3qwLlbp9FeKdI8GmTTRhMRTWkZp9S19FW4xUBP6+ZaUbH1O+R0Lmo4ayjaOpsHr
         VlwnVZBNQCtyzgu/xLlxjmKZTnTyBUfmgRNsjwIhNTlsqDAtGt3oT+IemsSoXbWm+pxn
         xevbT7swASnyBLZBUQK6u+2QSjwpVNauCD3iJx0DxGwaDrbR0ehQ+7VEA2XPSI3+dQz9
         zMzpqNHStUnbBItYmEcghuBzlrQyweXyJYMoz2IaqrC3dXtlr2FeqExB5UmEMFzfF8kZ
         5zDHu9wOHsjNYkFUfDAmnsqg6Yma/H29Kx6zb9xhBIeLFnaMYYLUP/vv64xSwVpQ0eXd
         NFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702558543; x=1703163343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYvEigRoKhZbgGLuv/4wRFyGkLXXYVjXdCoJrdge4oY=;
        b=teGbLoDs/9y2QVFUyGwERwFxHD2DVgO4KlTGdom1bFPltQX0L0wbzAPr8YYYHoZGYj
         Yfkx/EAJUjr3TY3QzrpYI7obGdBweCAPAKcRmsZD3RhqbPlRgfnnarsy9or6/JzBu9Qg
         msOqIBMOSKwkY3OljlKhyQLaTMu6th7QxJkIm6MfXTUiTw/+uzS/c2QVkEs2HTVavhi1
         cRNAkC+dGcyfaJnQ9eVhK+pX22eNk+pn2vbTJvaZ2v2gHnswmc4QFlYZYXo/mA1DDOHE
         tV8f9UqEikugWCGmy5OyFFmLRN4H6I86W6j6MGTGbeTEuiWiketKwqtvKak6v94oUae1
         FnQg==
X-Gm-Message-State: AOJu0YwD2P6Gc/DsHTTlIwTJnazVPM3o9aREwZ02qinicgcyxsSE1ogF
	QfNO/mAYqkh0UTXSg43e7vrM
X-Google-Smtp-Source: AGHT+IEy7mhPx0wsyEsM+VLjF3KlKQ6SL9f68/1wLMmcgtKQD6pj0h3a0IGYh27ImtTH/GZ7DXYtFw==
X-Received: by 2002:ac8:5fce:0:b0:423:77aa:163b with SMTP id k14-20020ac85fce000000b0042377aa163bmr11944057qta.51.1702558542823;
        Thu, 14 Dec 2023 04:55:42 -0800 (PST)
Received: from localhost.localdomain ([117.216.120.87])
        by smtp.gmail.com with ESMTPSA id hj1-20020a05622a620100b0042601b60861sm302377qtb.26.2023.12.14.04.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 04:55:42 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH] scsi: ufs: qcom: Fix ESI vector mask
Date: Thu, 14 Dec 2023 18:25:32 +0530
Message-Id: <20231214125532.55109-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While cleaning up the code to use ufshcd_rmwl() helper, the ESI vector mask
was changed incorrectly. Fix it and also define a proper macro for the
value together with FIELD_PREP().

Reported-by: Andrew Halaney <ahalaney@redhat.com>
Fixes: 0e9f4375db1c ("scsi: ufs: qcom: Use ufshcd_rmwl() where applicable")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 4 +++-
 drivers/ufs/host/ufs-qcom.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index d5cca5d3a98f..9fd8d737edea 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1744,7 +1744,9 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 	} else {
 		if (host->hw_ver.major == 6 && host->hw_ver.minor == 0 &&
 		    host->hw_ver.step == 0)
-			ufshcd_rmwl(hba, ESI_VEC_MASK, 0x1f00, REG_UFS_CFG3);
+			ufshcd_rmwl(hba, ESI_VEC_MASK,
+				    FIELD_PREP(ESI_VEC_MASK, MAX_ESI_VEC - 1),
+				    REG_UFS_CFG3);
 		ufshcd_mcq_enable_esi(hba);
 	}
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 9026fe243307..9dd9a391ebb7 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -15,6 +15,7 @@
 #define HBRN8_POLL_TOUT_MS      100
 #define DEFAULT_CLK_RATE_HZ     1000000
 #define MAX_SUPP_MAC		64
+#define MAX_ESI_VEC		32
 
 #define UFS_HW_VER_MAJOR_MASK	GENMASK(31, 28)
 #define UFS_HW_VER_MINOR_MASK	GENMASK(27, 16)

base-commit: ed340d13aa1db6773667ed4bf907738df203fbda
-- 
2.25.1


