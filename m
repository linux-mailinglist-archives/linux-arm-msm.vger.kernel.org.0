Return-Path: <linux-arm-msm+bounces-13970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC20A87A210
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 04:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3451FB21037
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 03:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B40F1401A;
	Wed, 13 Mar 2024 03:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUaXGz0r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A8512E54
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 03:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710302069; cv=none; b=kke+ihTulbL64VVfCozk/jRi5Lte9RiPrzCiCyR7rm7zEzeR5y4oCg9o7R8n8zNqOTxi/IusUb71Qg4rsuvrQhceIcxGqA3XH9h56GO6qW/8V/5LYGIiHhZTrFE4V6xenL1OsLnSui/Qug+L5bskK9O7zQGZWO9Qi5AqDFTkwY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710302069; c=relaxed/simple;
	bh=pwqh+7qUWx0XkGuOfq8GXVfKJVkT8SLDNZBKjtfBxbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYbuwKWWmbp6yQ69OT/MSNHBGcz6LNJGTAEmbZdHaa6afNCtAVc4xXieuGIwIBC19pY1LvitUzrRoqaYTTUIguOupsF5Y9qWUcLHKxiGTUYggUCfBO//fqix69e50DMDkbtz8cWqoCzHxCy5PjsfpGPgvGWlK5bCzW6JaCuSApQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IUaXGz0r; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d2991e8c12so4383201fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 20:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710302066; x=1710906866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhTvdctsG3UAMNuU+ThWL3PpPImv7wP9zybhV8Y4zOc=;
        b=IUaXGz0rxDtAD6Cld+luz1aqvemAl0UDawDcjU++IpWlYfvGzG72/Kez6VQDQCIByH
         ZdBRlw9KC0TIw+OaGGv6MNi+tlEk5alA2DMVVPVU0fhl+VQVV0h3HA2gsql2hNIFSvFF
         oBcLZEvksHh6n572UgLmKAcCTE/jjHf42gutb2anI8imgDytdXBxs83HfeDHuwO4Ypmf
         fiJjnj6e1xcFJG7rsaSoB1Jyb+hvO2cdnAiLgsQPXwJ0pEaQjR5H0b3cb8wW47Kc62F1
         2W2NdIPaA9uLiTWGIGbPN20KcViSMpaskbOaTsFmbOrsPthND/If5ZhET3VeLPAZsSYM
         7Ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710302066; x=1710906866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhTvdctsG3UAMNuU+ThWL3PpPImv7wP9zybhV8Y4zOc=;
        b=VIe4Usky2etyIuQqD5dNU9HMzpf7m333OUiVl1ccTJiRqPsSOCbY/RegNEPBjjJxlx
         BeSiMTCPcxMgwJmzqyKvnGM0mlkbWDZIqyECKMGRJTyyE3wvUcwMpzr2T84yH9X7xm8l
         7ASyifYP2yF3WPNGdl09HUovnPLRf6INgO3o4Ej5YSye6bGlrcfj1N1c15NZ21LLHVcl
         ngyFZVrEuFslHTwKGpkjpHsBB89yVGq00EuMQASCQJhPIo1utA1ePoWP0GXW98AZ8ynp
         2sPvCdeAEbcavBD7k6qMN4EGzk50vDFB6Wz2lDr6BPlP/jEZQoAyC6/CXMb4Vaah0Ycy
         BNVA==
X-Forwarded-Encrypted: i=1; AJvYcCW7QNRKdNnUqb2LhAo2xND6rJmwK15xT5tHn2Tp4jHKR9+W1dgzF1VpxtHL3xgTgqVL+rer3qWxhxXqzIg4qoOSuSwBaGcIbHtpqTMnqw==
X-Gm-Message-State: AOJu0YwN03l4ky98zqirO9Jq4nFX877dCSqKrY/0BGIG9ZkLbfECMPH6
	JcZDW4RiIlf7AkryUhnJ14Mtb5/A7Ca5tq+dC/B1vBGJB0STMZ3vtUU26A6Bypg=
X-Google-Smtp-Source: AGHT+IGUXuKt1xsCYGLcIpNaTG6doYJa88I3f0jTK6Qe7QNycBlM9CkIMQ3hzYDXjsxiQ5roHW7rYQ==
X-Received: by 2002:a2e:984e:0:b0:2d4:6c19:67d5 with SMTP id e14-20020a2e984e000000b002d46c1967d5mr203100ljj.18.1710302066638;
        Tue, 12 Mar 2024 20:54:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a05651c02d900b002d0acb57c89sm1854319ljo.64.2024.03.12.20.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:54:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 05:54:15 +0200
Subject: [PATCH 5/7] usb: typec: ucsi: limit the UCSI_NO_PARTNER_PDOS even
 further
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-qcom-ucsi-fixes-v1-5-74d90cb48a00@linaro.org>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
In-Reply-To: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pwqh+7qUWx0XkGuOfq8GXVfKJVkT8SLDNZBKjtfBxbs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8SNr5RlhRizT3CYUWt8TNerNgnS1//e4G+r31
 b4pQpB5/6GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfEjawAKCRCLPIo+Aiko
 1SKzB/9zGp/G8bISVxeCGIhS8uvT6pZELUF3hCqGctUuFrbIpV65Gdq/ez91l1PgETjn6GMCGSW
 sAKmTpVlfnYDypMn8wZuwVz1yetFoXqRg7XEik/i8PmzxnXJVzzaUoakH/cp4hqBA1kTWgozjnz
 QRLPZRDHLyOZiQyefK2xfU9z7uZtVOEBUt9Io625dadNsoqHfFgZYsWU7Y7fNlDVusSxtlcr7Mu
 u21RyF7QSCKpFQtY5OUuNK3HYU/CQWi4Xj0sKJcf2KkWRDPOP06dIVlz7HdPmtf8DxqLTK7qE0H
 q4ab2aeZAZIYxyMuW8ijEU8rFWVNG2MVGglhuwxHo/9usGyR
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading Partner Source PDOs for the consumer Connectors appears to be
working. Permit getting PDOs in this case in order to populate
capabilities of the connected power supply in the sysfs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 011d52bf34f6..72d368433b1f 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -642,7 +642,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 	int ret;
 
 	if (is_partner &&
-	    ucsi->quirks & UCSI_NO_PARTNER_PDOS)
+	    ucsi->quirks & UCSI_NO_PARTNER_PDOS &&
+	    ((con->status.flags & UCSI_CONSTAT_PWR_DIR) ||
+	     !is_source(role)))
 		return 0;
 
 	command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);

-- 
2.39.2


