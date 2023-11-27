Return-Path: <linux-arm-msm+bounces-2089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 181847FA231
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44FB41C20ACD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 14:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E880930FAC;
	Mon, 27 Nov 2023 14:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CL8f33vz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44B41BE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:11 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40b473dce26so6379945e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701094570; x=1701699370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6p7Yk0pPh+5XOIFlXKbXoyDeljmm58+0nwJPnMfZeAs=;
        b=CL8f33vzDfInh8DW9OeVyj7o/Me0n3OXqUPjMexwnhcJA9cpCLL+jlHglkqAyQ2RQE
         2ajYM98zQbGfQ5AVXGcIkigh6ayM5DGkBUc7dcKzcZ2/U6Lrj29i1bz7wJkVPozNTlGf
         Lk5k3+Bwg4SJ/a70Te9y5pEpgkgKAdoXbnhTVcFBArPju2RAGMi/jUwaDJmoTqOTTu1w
         5rvamGporhW1VT/vC8soJvLshja9Uejwk+FIHN7nyZNdykIG+WypDgxvl4Yc9PergTBN
         I36eaJOTglNcLtgXARRmC3Bw00I7SiIpyrtzqu3oSadPQX+SxLIYlXv8pNcCJQd/TVEz
         ZWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094570; x=1701699370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6p7Yk0pPh+5XOIFlXKbXoyDeljmm58+0nwJPnMfZeAs=;
        b=Cy83lhzIN8tdZ64WLDtsz7KgrAb+T3/ttwZh/AryoftDDEPDet+p1CPwfxUIIaU+6d
         UXrPbOhwdt4ElP1/MrOHPgqWJ2A2Atg0LlljUCVc0fVdAsCtTy2JPmfErVNBjCOYk8Xe
         VzaX4hQJXq8RCoOaydkLjzXPJwLQ3YEs6cWgPSV+F9dL8+5tG+/4yKcp0+sVISNqq5q5
         Q3oiuUwLPbhG/1fXVmh5gZGuMBqEAUvsJM+1kE/Go4LkgFOyZYv1Xv13OIlbBfAEtrQQ
         iKdD+Zp0gRhb/Jzgs12ohqybVt5Ol6yrGGwIbu0jG8llAVml+GfKmWr7n5yHSV62HNpW
         z2Cg==
X-Gm-Message-State: AOJu0YxMGTSlJl+J+E0NwzmO2sbsFc4IM+4U/W4CQ2APdkPTJ41djz8D
	Dembuzd7kk57vqXreEO3zQRg9A==
X-Google-Smtp-Source: AGHT+IGdj2lm+H87M+BbCZltT0WCKLIysUDz4kXF1jFX0sJyav3qV/p+Wda+ZHxLQ7t6J9lKOHi9pQ==
X-Received: by 2002:a05:600c:684:b0:408:56ea:f061 with SMTP id a4-20020a05600c068400b0040856eaf061mr9276619wmn.24.1701094570027;
        Mon, 27 Nov 2023 06:16:10 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bf33:77c7:8131:5e64])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm14658830wmb.14.2023.11.27.06.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 06:16:09 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v6 01/13] firmware: qcom: qseecom: fix memory leaks in error paths
Date: Mon, 27 Nov 2023 15:15:48 +0100
Message-Id: <20231127141600.20929-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231127141600.20929-1-brgl@bgdev.pl>
References: <20231127141600.20929-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Fix instances of returning error codes directly instead of jumping to
the relevant labels where memory allocated for the SCM calls would be
freed.

Fixes: 759e7a2b62eb ("firmware: Add support for Qualcomm UEFI Secure Application")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202311270828.k4HGcjiL-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../firmware/qcom/qcom_qseecom_uefisecapp.c   | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
index a33acdaf7b78..32188f098ef3 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -325,8 +325,10 @@ static efi_status_t qsee_uefi_get_variable(struct qcuefi_client *qcuefi, const e
 	req_data->length = req_size;
 
 	status = ucs2_strscpy(((void *)req_data) + req_data->name_offset, name, name_length);
-	if (status < 0)
-		return EFI_INVALID_PARAMETER;
+	if (status < 0) {
+		efi_status = EFI_INVALID_PARAMETER;
+		goto out_free;
+	}
 
 	memcpy(((void *)req_data) + req_data->guid_offset, guid, req_data->guid_size);
 
@@ -471,8 +473,10 @@ static efi_status_t qsee_uefi_set_variable(struct qcuefi_client *qcuefi, const e
 	req_data->length = req_size;
 
 	status = ucs2_strscpy(((void *)req_data) + req_data->name_offset, name, name_length);
-	if (status < 0)
-		return EFI_INVALID_PARAMETER;
+	if (status < 0) {
+		efi_status = EFI_INVALID_PARAMETER;
+		goto out_free;
+	}
 
 	memcpy(((void *)req_data) + req_data->guid_offset, guid, req_data->guid_size);
 
@@ -563,8 +567,10 @@ static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
 	memcpy(((void *)req_data) + req_data->guid_offset, guid, req_data->guid_size);
 	status = ucs2_strscpy(((void *)req_data) + req_data->name_offset, name,
 			      *name_size / sizeof(*name));
-	if (status < 0)
-		return EFI_INVALID_PARAMETER;
+	if (status < 0) {
+		efi_status = EFI_INVALID_PARAMETER;
+		goto out_free;
+	}
 
 	status = qcom_qseecom_app_send(qcuefi->client, req_data, req_size, rsp_data, rsp_size);
 	if (status) {
@@ -635,7 +641,7 @@ static efi_status_t qsee_uefi_get_next_variable(struct qcuefi_client *qcuefi,
 		 * have already been validated above, causing this function to
 		 * bail with EFI_BUFFER_TOO_SMALL.
 		 */
-		return EFI_DEVICE_ERROR;
+		efi_status = EFI_DEVICE_ERROR;
 	}
 
 out_free:
-- 
2.40.1


