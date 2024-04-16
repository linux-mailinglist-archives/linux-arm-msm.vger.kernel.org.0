Return-Path: <linux-arm-msm+bounces-17534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 964B58A60F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 04:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CC961C21044
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 02:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BE139FD0;
	Tue, 16 Apr 2024 02:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x+/HNUs8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347B811CA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 02:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713234061; cv=none; b=IUO7Ay4N2s6Ke9+IrXztODo7r8t8hQPxEG2TznJwWEgGfYeQTLvgSbylt2NC9biwJY+Rrv8fx3VFkMICKqL9EtpeeZtXGnU3p7FLVbpwRK2lHOQ+63M1YYScDaGZDSru1wO11lzScAOzb9IpClzwVPZOh8z1KhoScYQSYLZwG4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713234061; c=relaxed/simple;
	bh=SToAHymtfQGBKZLpbR0Oic69HFLPWamTvWh5j26sXtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P4cb7MgGjeCdHbgheYq3gXsmYH3iOdmYErWyxsd3aSvK4Reo9DnXz0BxOLhxSYf3zO1Y07DHIj+iCbxQV1/Iwi6L1U6SJssL+nE0FoiwGlI5KCvhMepd5E4DBL/9XE/v8B3d7fyl8kqwdZG8QK09RXRQk8Gq23Aq0MhR+YKg4Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x+/HNUs8; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d8b4778f5fso27646351fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713234058; x=1713838858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WU7kkHqmeD8WLGIOtmqDI6a+4uwK8HkBVPKBTEJy0EU=;
        b=x+/HNUs8dqMsD5di6b2GsS+M2svZJIXiS8gmeHeEw3+FPOrOy6Z0jjEdxiukxkTkYp
         p7XpH+tDD+3rJ1YDAdCGJsZPG0IMXTIguKrmr6xz6AR9LU3ikW0Knwo/IqFwL4OLqIj0
         h9J+4IfzuMS/0bSl/ycr3OYQnA/9eFKWRUE0K+nZt1kNYjCM9a5t7jKqTDl2gNUyDsbU
         jF0YbDgeqUBLftO0fT2Te5P7PLUWvaNJz0Uv1GrQlVvyoGK/kAhHUQTdxqro4VV/whZU
         nbApmUj/WeyBVVRlYaIfuNyJlnbjsHTO6PDS+iCDUYm8xt0tAzgMsCLG48BV8w6x7nuX
         jlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713234058; x=1713838858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WU7kkHqmeD8WLGIOtmqDI6a+4uwK8HkBVPKBTEJy0EU=;
        b=vsiGllhSazCyDUOK43wVD0QNexZkDQo8oidCVeUMekcvYCsLUwdlS9iZrEPDD1DEdN
         wb6XKe451YpPCgwvHeiN/a7UGbBf4Jlm9+CXpLLWhRqpQeX7k5ayoeewaPKFMQOr29Z7
         TvSbcoQkbIPWJ+VHX66+zcfdChHSv7j2Y+0R6H8vTOqL+cGDIEHPbmdAEv6HF7mlj8uf
         1iQ/r9ok37CqDqMFJVPJWhTdeYr30WC9gFlOjGWVH7OKH+VK4LAT4FDMsSkaRoeEZ3Q9
         Xf1PkyOZxdS3SFLAd9aivwNjvOb7LX02S/S0yoAX1xj3Sv1z/2GaRW7tN0bO9mTxfDda
         YnSA==
X-Forwarded-Encrypted: i=1; AJvYcCUG5xuOgSGFNhu7muGXVahugJItMFcvR3VUipKYLytWCvft42V/3rTekvL1y/KGMi5mHMmsb97PowJl6JV7JTT/W9icGFOaKupHNzwtZw==
X-Gm-Message-State: AOJu0Yzlla+JjMnR19mAttbtRxklbBooNSEI/pn/DpvdlwpHwrUlDgT2
	h9OaBJGglNG/hDLoSHJkutGVGYPh4OLUJ12Z47rUT+NMybK3KI8ElBi1Otd5cSo=
X-Google-Smtp-Source: AGHT+IHOVwyxCsFGxzMB7VCkX79Ri++G8vkHqYJkw7PDN/FaNvbEMg6uvmiAAxAardy8Z0daJuJWcQ==
X-Received: by 2002:ac2:5931:0:b0:515:99f6:2ca4 with SMTP id v17-20020ac25931000000b0051599f62ca4mr7434912lfi.36.1713234058533;
        Mon, 15 Apr 2024 19:20:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bi30-20020a0565120e9e00b0051925dd92dbsm27716lfb.214.2024.04.15.19.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 19:20:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 05:20:55 +0300
Subject: [PATCH 6/8] usb: typec: ucsi: add ucsi_registered() callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240416-ucsi-glink-altmode-v1-6-890db00877ac@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SToAHymtfQGBKZLpbR0Oic69HFLPWamTvWh5j26sXtY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmHeCEZyNdqdYdy5k8fktQr8KpTHz9ht3CfWxcR
 qepO/zIpF6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZh3ghAAKCRCLPIo+Aiko
 1ZrzB/0ZMtTNXuCJ9qcQq7KFdJhCrQYMdE0BtbgFMtTDhBe7lE42wRn06wEkhA43KUWPV6YgyV8
 E0Ov94SXw2ICzurfz+SU3dkMOIMiIBcDdWw6eUcHL2TbrKs43knPvLabUVty+8z55DIH0OtK/bX
 cpLQrX+TWz29PzjS+Cg4qWtLqZInpCRmAZhgQLKWMtU0/5yJMViLXok0OlHg8NQBAvRcxtWngB1
 eV74DpLPKHikHjbUdMZjKGBEQ39pwslBTFyScRt6FxKZ0meiZt87PeQnmaev7LT2VKyaMQ1AJHf
 POyvzEWkd5XEcFYrzRTudraH9xZXQW3PUgVojHbLLGm6TG5O
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As the registration of the UCSI device is performed from the scheduled
worker, the glue driver isn't notified when the UCSI registration
succeeds. The ucsi_glink driver needs this event to be able to manually
register DisplayPort altmodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 +++
 drivers/usb/typec/ucsi/ucsi.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index cb52e7b0a2c5..ae89c4c8341d 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1755,6 +1755,9 @@ static int ucsi_init(struct ucsi *ucsi)
 	if (UCSI_CCI_CONNECTOR(cci))
 		ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
 
+	if (ucsi->ops->ucsi_registered)
+		ucsi->ops->ucsi_registered(ucsi);
+
 	return 0;
 
 err_unregister:
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index c4d103db9d0f..37ee1b1d8c31 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -62,6 +62,7 @@ struct dentry;
  * @update_altmodes: Squashes duplicate DP altmodes
  * @update_connector: Update connector capabilities before registering
  * @connector_status: Updates connector status, called holding connector lock
+ * @ucsi_registered: notify host driver when the UCSI interface is registered
  *
  * Read and write routines for UCSI interface. @sync_write must wait for the
  * Command Completion Event from the PPM before returning, and @async_write must
@@ -78,6 +79,7 @@ struct ucsi_operations {
 				struct ucsi_altmode *updated);
 	void (*update_connector)(struct ucsi_connector *con);
 	void (*connector_status)(struct ucsi_connector *con);
+	void (*ucsi_registered)(struct ucsi *ucsi);
 };
 
 struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops);

-- 
2.39.2


