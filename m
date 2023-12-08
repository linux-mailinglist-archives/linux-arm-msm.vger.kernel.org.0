Return-Path: <linux-arm-msm+bounces-3875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07490809CB9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 08:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 388BC1C209F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 07:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890A0CA44;
	Fri,  8 Dec 2023 07:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZBAeNsBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E0511732
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 22:59:57 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d0538d9bbcso16075335ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 22:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702018797; x=1702623597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYI4r4XUuz71I8vtap69MBMVnAez8i9Yk5eIAeppyug=;
        b=ZBAeNsBYKFU6yv7U6js/AeSEAZxZd4Sb7ZMu8QoIGbq2AirNBiX6RdLDNMBi7cL0Ys
         JjOmpWWcJNU0AZptgaBLjNDy0ZyFvE/jE0lNjwhvOSh5KOfOyaB6zTrFjtMWv1UVVNit
         UCrbsMbSIqWtJnQLWrhkAVNHJYGJPKQVor8+wbfeE6k9da2YxD0R1KFE67g+Tkwf5IzT
         Yefa9zgu96kGnSlXiy2pQMd/+IP5BkSKvFdI4O3UHfYF9AvCis4fw5noOf44RxYDcfrI
         bpdV6jaPr0xhv6u14efok+aUeYTQUJjV+hvd7u9bF+nPpn4frnWrg8gKI5MqkjC+5W53
         qdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702018797; x=1702623597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYI4r4XUuz71I8vtap69MBMVnAez8i9Yk5eIAeppyug=;
        b=uG/c964dXKtW2PdPF/QA6S2NgxHm+7XpUjjOWSktlU2UPNP9NZDOOWr0FXiEg57kyw
         7URWayaIka6ZTfmNRI1Z5U/Gj/UlTIXMb/KpIFfMW2pZtmKklTywcB8XvI7lZpGDdsBd
         fMzvEOXMiKaAw1czAXRQ+MUFArxtnIZ7kqnYDTZNDmCU41xMElAIzpvEVIGXaLDFd2bu
         6bf60cU+7p3mt5aQpFbRu9moB8h34pSvuev+yaLCtY4DOgchWX4sgRplgEPGQmCxVtLt
         dokbdzvDSrHWYyc+zdPAEPYnEKX3TdhRw5hyr3C2ST2Crn65iMQWwHtR9oictBQr5HnY
         DUUw==
X-Gm-Message-State: AOJu0YwVdvuY/x7WqNbXi0NgIQvryg6RZC/IQFGFL3JEr9K0AaZTKHQp
	2baTtGbIeIfU9YkSbNbyjaBk
X-Google-Smtp-Source: AGHT+IHEh7rNunBQCv1jB1S67MBGsxYjecPohm97PlMerUQDMElKauhE5n0VNoRMjq4XB4hV8cNaCQ==
X-Received: by 2002:a17:903:11d1:b0:1d0:8c04:85fe with SMTP id q17-20020a17090311d100b001d08c0485femr4011908plh.12.1702018797069;
        Thu, 07 Dec 2023 22:59:57 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.142])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b001b03f208323sm934263plf.64.2023.12.07.22.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 22:59:56 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: martin.petersen@oracle.com,
	jejb@linux.ibm.com
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com,
	ahalaney@redhat.com,
	quic_nitirawa@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 08/17] scsi: ufs: qcom: Check the return value of ufs_qcom_power_up_sequence()
Date: Fri,  8 Dec 2023 12:28:53 +0530
Message-Id: <20231208065902.11006-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208065902.11006-1-manivannan.sadhasivam@linaro.org>
References: <20231208065902.11006-1-manivannan.sadhasivam@linaro.org>
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

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 365a61dbf7ea..b141dd2a9346 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -417,7 +417,10 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
 
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


