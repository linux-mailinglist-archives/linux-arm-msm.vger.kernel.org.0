Return-Path: <linux-arm-msm+bounces-2907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 835FB800E48
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4C891C20A90
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 15:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B77495EF;
	Fri,  1 Dec 2023 15:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OqYs0GmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245C7D4A
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 07:14:59 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6cde4aeea29so1897298b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 07:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443698; x=1702048498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5u5mj8ueK+oc2yv8mZg26TvQm1X83rBh8cXq05A5b8=;
        b=OqYs0GmF8HFxp5IsgzqAulfJFTwog24rf3mni9vKI2/sxOm9JPq3BaymnyA3lIYbDq
         lGSX+JeE8BOmoWcJ/af2/C8Z+yk8j73ivOFvKMKt3z7hSLpuZBIN2rheDuC1e24em4Hu
         eNpbL5BMEQjQQjMX5piE943Zp5ANR/GLCN2tG1JtzFsrpDZtQ2cLI9EoNr/QiQVAtCf3
         Q5i7E6PPHlYSfWrNvjBgtCYiSeCGGs9H4Kz412qih8tCbREub2ythCx2gF1NU65jOOKh
         GW78sJammyY7wBmDChniak6rErGEUS+maCY9+Pzuo4QwbzbFoy6qqG1nfNpQCAR/9fWz
         DMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443698; x=1702048498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5u5mj8ueK+oc2yv8mZg26TvQm1X83rBh8cXq05A5b8=;
        b=ruh2Q2Uf5i4kPN+7IIQS5jwcxvLMnlWZSRKqhbH5eXrEc78mmG15Tk8/rjhu5RFqF4
         sO4w5OzKL9KYopVh+X2tm8Zf5mMmC3Yt6OEd3Kock7b/KwTVpYWR1Z6gEHc3Hzru26Uc
         jZsjAIdChMx3u2xNoztgc12w5JRBdxMTlrPYjRLdZ+Wwj9W9HI/wTEJEiRW0Mt2fwIUK
         +9Q2EPDhdq+J+jqsJFn9M0igAWOu3GNqHZA4Fd3EV7Zp+OPDyXWC9z9TC/9qiN/FTHgs
         ztA0ZksYGEPe6O4oftHRlBNmxcwU1IHucaj1eg72fuYEnXg/oNViHm/PUD9pc95jYLyz
         oIkg==
X-Gm-Message-State: AOJu0YySZldVXMoS0GP+a4fGDGKr426zIU1igVv/CICXm529VcHbtyWw
	yZN112SZetnNoPAtV1d4W7fFAkAnmPCBdm/okA==
X-Google-Smtp-Source: AGHT+IEjBAHxDNnswReyTsQ/wgyRVee0zz+RTPON/r87o5NDp9vCjrHC67XAbwc0Yi+6bHfU1R4nag==
X-Received: by 2002:a05:6a20:548e:b0:18c:8d0f:a794 with SMTP id i14-20020a056a20548e00b0018c8d0fa794mr19592802pzk.19.1701443698551;
        Fri, 01 Dec 2023 07:14:58 -0800 (PST)
Received: from localhost.localdomain ([117.213.98.226])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b00578afd8e012sm2765824pgv.92.2023.12.01.07.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:14:58 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: martin.petersen@oracle.com,
	jejb@linux.ibm.com
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 07/13] scsi: ufs: qcom: Fail ufs_qcom_power_up_sequence() when core_reset fails
Date: Fri,  1 Dec 2023 20:44:11 +0530
Message-Id: <20231201151417.65500-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
References: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even though core_reset is optional, a failure during assert/deassert should
be considered fatal, if core_reset is available. So fail
ufs_qcom_power_up_sequence() if an error happens during reset and also get
rid of the redundant warning as the ufs_qcom_host_reset() function itself
prints error messages.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 604273a22afd..4948dd732aae 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -359,8 +359,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 	/* Reset UFS Host Controller and PHY */
 	ret = ufs_qcom_host_reset(hba);
 	if (ret)
-		dev_warn(hba->dev, "%s: host reset returned %d\n",
-				  __func__, ret);
+		return ret;
 
 	/* phy initialization - calibrate the phy */
 	ret = phy_init(phy);
-- 
2.25.1


