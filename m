Return-Path: <linux-arm-msm+bounces-17533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8DA8A60EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 04:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A711282B7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 02:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7690722309;
	Tue, 16 Apr 2024 02:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CPn8kpPc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60CF101D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 02:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713234060; cv=none; b=eMvF+9YsTRDmhfRzQduznK+QvgPEY0UGToU2fHa3Sj4rYq9FLJu47HWYEhObICYoGf0lITOOEkseaz5DvkemJiXuU3Zd+Z/KDYmnfUpWEJslvoxPVx/pxoA2yn3y53Ivwv2froPbX8KiQ/dAA7YQFycdTE3Hcc0G0MmmP2/ccAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713234060; c=relaxed/simple;
	bh=AvWzBq0+Nx+u5rcERgaRzwmrpy+PRkTWudggCntMNQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfZ8piTggSQ8eRyVrPZSqHgKj8K190jhzy8lCoHf9cgNX/fMqrY723tParxpMn9qOPOOCMU2hr2bhquBdygJun9Yo+IUvAy8Hvmwl28uom/g0IhZr8YZVqwkfW+45G9FxDhGd2OGfPDZ7pSikzZLGvxvTVbXn3ERcy3sJ/BXNl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CPn8kpPc; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516db2214e6so4806215e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713234057; x=1713838857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmQc/tP4sqYRlf+bPIXpAY4Oec6ZydToP6BQl/vWpTI=;
        b=CPn8kpPcYrRDxRd+itb8AoNmNkz/0qxxD0SjdfSBOEUSxreTBz3a0eu3dgyYPlP9oW
         uyL6D+59SrieQHCzeljJPLRvOl5eLeIGYy+WdlhV5ihmGOP9wbRWkrd2pVLIddUsr/vV
         uuE7f90dqy48z/ZT/UifXBC/9fo5KahOEsA9qOI7yPBP1DpzDpVO8NrDIBo3UUqkdpiy
         CwlhyyOUmdPWh18eymzEjJ82dQVTNWQRFWv9+V9G5stga0ilDqfzkkwrNFnxVOUiqgnq
         2LQ1zcUerMabvdQr+lultXjeALTdK31Eu2vuoxqvVMt6NIDjw1x4D5hAOFSgtsystqxO
         SwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713234057; x=1713838857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmQc/tP4sqYRlf+bPIXpAY4Oec6ZydToP6BQl/vWpTI=;
        b=nUmqe9+CKiIj+yg9/vi6S39abCq0Iw7o/UgVFGpcRarG+50/ZgqLzyBw8qSS5DqOVR
         MZkBisTSLULXp/TjdIPwYy0wKS1e7WroDfPaM6CEhK11HmJxPs1WsHDb51p1du3PCcMd
         NY3pDEo4+fiDJGpHdwJjJ18vF4an3V60SKU8M8DD3WdmR/CVJcklXHWh4eeiVgtEMEGz
         EGGWXUi9eLXZuZvgcLrIVdTjE6EaFggHwQAprVfwaKIFToP3pM8PCPlqWkQtAs0BrMFx
         A80iRAUcQeJF9spZ2s1MR3uyVWjNr07uo33gyxX3Q8MwYE1wXdThA3vRr/h6C1a6kX18
         r3Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWgr39ujbDzw/F8nrlEOcHNwUNyRuO7t9OeIamyarTxh9FJwl39hnnChbBQG3VpTExDrEX3PQ3PKhUXeWseNciaNWEPTPO0rKe3ZxeZjA==
X-Gm-Message-State: AOJu0YyOLh1MqQc+fx7SwzRIsCIldxUJiaAGak8mAh7PRs9lCwpV4mA6
	1g25AQzEjeTdc/qSK2I20T2c/6P7TK+yQgJS6LCdZtNGdOBNhAJG9Iis612nVNQ=
X-Google-Smtp-Source: AGHT+IETOuKLKc04tqgGWAuHh3sieieMjw48KKxtIuyneyvtzCAA1gzcT/OKN/HP7Nz5FhFgSAUGmg==
X-Received: by 2002:a05:6512:2506:b0:518:9ab5:a987 with SMTP id be6-20020a056512250600b005189ab5a987mr7455064lfb.18.1713234056966;
        Mon, 15 Apr 2024 19:20:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bi30-20020a0565120e9e00b0051925dd92dbsm27716lfb.214.2024.04.15.19.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 19:20:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 05:20:53 +0300
Subject: [PATCH 4/8] usb: typec: ucsi: glink: use le32 for message data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240416-ucsi-glink-altmode-v1-4-890db00877ac@linaro.org>
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
In-Reply-To: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AvWzBq0+Nx+u5rcERgaRzwmrpy+PRkTWudggCntMNQI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmHeCENu1BW+Smad9t6wMjMLuof3RywYFmVx90u
 eqnm9pRNi2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZh3ghAAKCRCLPIo+Aiko
 1SH0B/0bf6Uf94w1RJgq/zOccS0iRZrF5QtsXGrxUqPNTbrxjvk8QpBMsCkiXPy4emoHaLAKFkU
 njuZOawG7lC5VLRn2JX6ROCiwe3T0rtXc1dauChQ92q3opEf06dRF1gkvr8BzXMp+B3Wqz5Trsu
 NEgDZ3WfN3e2ztot12Y5S9JXeMxkx4Ro/+WGngmiymfkDZYbu6t1JqTjO1mLIzHUPn2t7SSYGBz
 3dIiW0STD7jRf4S6hiGbNSk9ZtPfbtWDSQxie/zmLaKv34+wz8JU7F5oxaaUwLCAiaExgzuiUrS
 7CPNFXSBtHK280wKdRhRtKlh0G51aybIXaYujkl+eUadWek0
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The message structures as transferred by the PMIC_GLINK use le32 for
data encoding. Correct struct accessors to follow the lead of the main
pmic_glink.c driver.

Fixes: 62b5412b1f4a ("usb: typec: ucsi: add PMIC Glink UCSI driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 6be9d89d4a28..d029cc9d82e3 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -33,7 +33,7 @@ struct ucsi_read_buf_req_msg {
 struct ucsi_read_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
 	u8                      buf[UCSI_BUF_SIZE];
-	u32                     ret_code;
+	__le32                  ret_code;
 };
 
 struct ucsi_write_buf_req_msg {
@@ -44,13 +44,13 @@ struct ucsi_write_buf_req_msg {
 
 struct ucsi_write_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
-	u32                     ret_code;
+	__le32                  ret_code;
 };
 
 struct ucsi_notify_ind_msg {
 	struct pmic_glink_hdr   hdr;
-	u32                     notification;
-	u32                     receiver;
+	__le32                  notification;
+	__le32                  receiver;
 	u32                     reserved;
 };
 
@@ -255,7 +255,7 @@ static void pmic_glink_ucsi_write_ack(struct pmic_glink_ucsi *ucsi, const void *
 	if (resp->ret_code)
 		return;
 
-	ucsi->sync_val = resp->ret_code;
+	ucsi->sync_val = le32_to_cpu(resp->ret_code);
 	complete(&ucsi->write_ack);
 }
 

-- 
2.39.2


