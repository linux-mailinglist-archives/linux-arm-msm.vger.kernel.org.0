Return-Path: <linux-arm-msm+bounces-2908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8FF800E4A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87584281B8C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 15:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C7449F7F;
	Fri,  1 Dec 2023 15:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fjo9L6Jc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29D91721
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 07:15:02 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6cdfb721824so887843b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 07:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443702; x=1702048502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63N0jK5ZcBeJuBTrtXzoyRGZDNopQVJCv+vFWIRCiEI=;
        b=Fjo9L6Jc+XW3mkryMOXpBapHySvMEDBSGGCVBO8lKPjx7PdZLuWUaLsxYvzM/zTFbn
         4ELY1d/1mbI2mv6Fc2GfQZ+WiWX6jtLmyhZJIze7wkAIcN+3BQQr+tHhd9n+DP048NB4
         XseAf8A8MyPaH/SxxUxVuJ/OxSGM7FTYwaafsbEoIwBG8tVzOem6LWxZhepU8ru5LFQo
         JxAF4oWgM8154LI6XfpShBUPEntXLajZRlDIjE/MSLb1kIV/UDEkau5s/8tyzykTtvL3
         IpskeAyOYgH7I6YtD2v9Pg15b9C3SNioexQinroYbUk1vXzbPtjfyrbHZN05WXqmBBHU
         LZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443702; x=1702048502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63N0jK5ZcBeJuBTrtXzoyRGZDNopQVJCv+vFWIRCiEI=;
        b=bhtDBeiZhp+yWtkweetIfPWhvgtaO0jLlsaNaalA9uGQSdxhJ43PuemtUU9wNyjEte
         b1E7KznEIyZy5SwaKPoZOjJXLpgMMiJ8ThmGp+ouIAB9tf3pO00an2U99aU7MQSpVQBt
         Rf3QklUvulGcPvDo/Tm1UNhaEU8kHjkqfBCN/SvBxoijD/tn7ELWB5H2gZVRTZ9tfRVD
         Gb3hjkl98pTC9SSGS5prWG5janyadeSYpaOUUU5CtNlBte0VwDKs1ikcVO/bEgY5UDPL
         N2KSOTCijoCtVAlMRWVDC8ABC4ay5rkiWuDu3OghAKfGu5JbYtxarR+68/fMcmsGYgJM
         IvNQ==
X-Gm-Message-State: AOJu0Yw8IQ7UA2ACu1RxaLpwyx5KalcV/DtI/W99tbJ8/9MrziGIq/bi
	rfsKI7JoS8ROvbOG8nvnmqcv
X-Google-Smtp-Source: AGHT+IETQ1stSQmwhPIzf25NLke8Nu64YavF9AVB6RzSBdjnw47xK9+jZxC9s0vLs8BKJXMe1U27ug==
X-Received: by 2002:a05:6a20:9150:b0:18b:9682:59e9 with SMTP id x16-20020a056a20915000b0018b968259e9mr26138765pzc.21.1701443701963;
        Fri, 01 Dec 2023 07:15:01 -0800 (PST)
Received: from localhost.localdomain ([117.213.98.226])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b00578afd8e012sm2765824pgv.92.2023.12.01.07.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:15:01 -0800 (PST)
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
Subject: [PATCH 08/13] scsi: ufs: qcom: Check the return value of ufs_qcom_power_up_sequence()
Date: Fri,  1 Dec 2023 20:44:12 +0530
Message-Id: <20231201151417.65500-9-manivannan.sadhasivam@linaro.org>
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

If ufs_qcom_power_up_sequence() fails, then it makes no sense to enable
the lane clocks and continue ufshcd_hba_enable(). So let's check the return
value of ufs_qcom_power_up_sequence().

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 4948dd732aae..e4dd3777a4d4 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -415,7 +415,10 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
 
 	switch (status) {
 	case PRE_CHANGE:
-		ufs_qcom_power_up_sequence(hba);
+		err = ufs_qcom_power_up_sequence(hba);
+		if (err)
+			return err;
+
 		/*
 		 * The PHY PLL output is the source of tx/rx lane symbol
 		 * clocks, hence, enable the lane clocks only after PHY
-- 
2.25.1


