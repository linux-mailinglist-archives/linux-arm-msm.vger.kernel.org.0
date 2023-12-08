Return-Path: <linux-arm-msm+bounces-3876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65147809CBC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 08:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 974D81C20A17
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 07:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92509D537;
	Fri,  8 Dec 2023 07:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w17CAwjn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D9631989
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 23:00:02 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d0538d9bbcso16075695ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 23:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702018802; x=1702623602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMlhD8WS0RVtXNWZq8+Ekz+zAl7Mbew6ctHcI4T3R2A=;
        b=w17CAwjnBiSA5PJez0PVyJiJdKr/bj+JBOG20onw+6Kv5mV1jQX9kB9ucvfRm1QHs/
         c2jwDB3MqsglMdnhWbqWuVqvbrVeQDGTlTDVBigWMpryNNVx3vhS39gDjuuYbyj5c21y
         QwyephmqTeaTT4CfzzCZ41c7fNJfP3LTVWWvLKXlxQnlBA+0NWY+ZTUdV6b8TOnMzk4T
         Cpc3d7vOH+etmycLfQrfGZIq8xioTBmpi/zHcLTL+1KbcWybspNc6wNRzGty9KJxe3yF
         oW8pr+uHjJbTuEO66KtKGY/qFPGm1xz9XXxvboOb5DgLmoGAGnfKvB2JalZ8VVqWecKG
         Yfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702018802; x=1702623602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMlhD8WS0RVtXNWZq8+Ekz+zAl7Mbew6ctHcI4T3R2A=;
        b=OrnQtMaTE/9TVuC5MtWaSoWhELDa0np5wOpvDlWXooyQa8HqHJhqQPlSVRgFaSlh3q
         A6tGbXb65r0ElbMkmYHDJAm8/ij8GvqmpSig2vS0lT+9vYC/W0PuCqyieJVW4lzii0hD
         mCBzh1Et7QgcEKJJy2sCTXlkF7wOiDm6flYW+YkKW8LVMFp9Hcmqi1E4S6sXDSxGP61Y
         C/QS/RRiWUA1fWgjvwu3bNaPY1E9dgUaHeDpK8LcKzFd1BoJZhF9uwSI87Od6imc8CZ2
         ijCfxxZxThbDE8KphM0ar9Yp7Ox+HJvAnslHgvCjIVSHnLQgItaHOAp+5u5KPhnwB4Hv
         17Vg==
X-Gm-Message-State: AOJu0YyFSPCUmKB95kzMOaslrY67kpzW1vUtMtSAKH1i1L78/BC9iRL6
	gogdatIkuiWPeW8Iah5nzt4c
X-Google-Smtp-Source: AGHT+IHccpHpLogCcC55e3YdRrf5zzuYzDmRVH4d9uufAv8PswsFT4A1IbRSAb8WkK22n3+dGsOP0g==
X-Received: by 2002:a17:902:f68e:b0:1cf:ad5f:20ab with SMTP id l14-20020a170902f68e00b001cfad5f20abmr4410627plg.19.1702018801803;
        Thu, 07 Dec 2023 23:00:01 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.142])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b001b03f208323sm934263plf.64.2023.12.07.22.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 23:00:01 -0800 (PST)
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
Subject: [PATCH v2 09/17] scsi: ufs: qcom: Remove redundant error print for devm_kzalloc() failure
Date: Fri,  8 Dec 2023 12:28:54 +0530
Message-Id: <20231208065902.11006-10-manivannan.sadhasivam@linaro.org>
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

devm_kzalloc() will itself print the error message on failure. So let's get
rid of the redundant error message in ufs_qcom_init().

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index b141dd2a9346..05a9a25bc34c 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1109,10 +1109,8 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	struct ufs_clk_info *clki;
 
 	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
-	if (!host) {
-		dev_err(dev, "%s: no memory for qcom ufs host\n", __func__);
+	if (!host)
 		return -ENOMEM;
-	}
 
 	/* Make a two way bind between the qcom host and the hba */
 	host->hba = hba;
-- 
2.25.1


