Return-Path: <linux-arm-msm+bounces-17164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6558A0756
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 06:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB97F1C23509
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 04:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C106D13BAE2;
	Thu, 11 Apr 2024 04:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BtpW+64o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB3113C8E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 04:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712811007; cv=none; b=iJNq0LmCMy4AQD1WElD38HHI6GTMnXle2QKolnn5SYU0cjnvcuFe8efygNcxJwN1fs+1CHQJP6sox4oOzQD/9+vww28pC7s+UIbkI7VjCLwnwd7N3yi9W+x1Db/I4mL9T3Aq4u5vUknb6QCzGrqMnrgrxwRyt0AUURzUcRrbtG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712811007; c=relaxed/simple;
	bh=KDEnFAKDHgm7Dl9TTJXgLNhiWKY43ebH4R6QBCie46s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U8RH7op3tKEiLfee8WuhZtf+1k5ZOlxJ28XhY4ZuJwKNUMu2houOKuv7ALjpp52ghYy+Rsl9fqoRQSzBEvRWt0vKdIRlrQDw6E80cUh1i+pH84/PMk9G7Ed7LHDRKcKbc13nvDV/Cmae+TVB+SuAgyDBRWl5xlSlnyxyPUB6ZeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BtpW+64o; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a46ea03c2a5so79855566b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 21:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712811004; x=1713415804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyRSagPW9Tbd2MSaq4Y1W6L6VLAUgCS+QRdXG739ECo=;
        b=BtpW+64oF8VjKawF+lJayXFYR3TL5VSjB65fgDANkIb7JX2TFjvZUQnyrdX9a31jeN
         CNhLX6VD1+di3fWUGR5REC8fDzatcgJQigLl6q2EmCxHT7q1q3vujM6U30fe5s0mUYI7
         hJQ0cNtQ/kT9JRd1h0hPW3WwpaC5gtAEBsRsmo0XwNeIUYmuuLwUWNY2POfZT+3yLBBy
         A0IUzUkJCqMC8b3r4+1RKkHvDIlpRjmZkqssv++JV2psT0dyxCT8KBB0zJPoGhHwuHcJ
         AipelS4KEG+wsU/1rHuCB5bRJjYZV2fFuBTBVaMD2xv6i6l3OWeo9UwP+nobFqvKoa4F
         BVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712811004; x=1713415804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyRSagPW9Tbd2MSaq4Y1W6L6VLAUgCS+QRdXG739ECo=;
        b=AfmOqLwV+wWCvj6BNMXtLGgXg1ddx5QV4IINKXC5/1c/YlQ9DS0eWHE8ghbi/5y8fk
         YRHIS2rUJgCb08jTD5iWJjc32saW2oLU47TC9T0wJFMi4MEI9O7TQkQ4zrdELN2F57Mk
         oHuONH4zRkUmwCCOu/jVDKS9fBy/Nw3pU4ucDQJnlJQFttCCw8Ncr5HL8IQiQAQXZQqq
         /moaM2kRq75MRuFTCI4Jw7W++asMpPXx5iyVdQ+0Q/WWp9l93YnL0DCwxvROPoc3SHyG
         ZOVEyd2/vHJzteGAZfNFYqw7bQrJoHxEV3MJBxpTEb7KGWgJAGyZNorXGXZwdBHo3WLF
         amEw==
X-Forwarded-Encrypted: i=1; AJvYcCWq0M6QmovT5IgSJSwF30U5ffkWniksksfW7C14A209K63YTUvTY3zgUTveZE93mltluIk2WrY5LW32a7N72QaY8prE0V1RXF7OSfnE0Q==
X-Gm-Message-State: AOJu0YzYkWlgL8viNjfSDmJNjfNpMpPhhy7aSA4BF1SFwvP2Sg1xXA8A
	aKu8XeOSajYYqc2UYi+PxEaQvM62a+gAPgeg03mwFWUSrDXEb77noEPnJXXv8n8=
X-Google-Smtp-Source: AGHT+IGjx37we05P9i4gCPI0RoWu9lvWlM5KED6DWJGabckpTB99Kjph/n10TCysW/TlIG+QVL60xQ==
X-Received: by 2002:a17:906:6a20:b0:a52:b65:e978 with SMTP id qw32-20020a1709066a2000b00a520b65e978mr1516000ejc.5.1712811004067;
        Wed, 10 Apr 2024 21:50:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id dm11-20020a170907948b00b00a51eed4f0d7sm364899ejc.130.2024.04.10.21.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 21:50:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 07:49:57 +0300
Subject: [PATCH v2 5/5] usb: typec: ucsi: glink: set orientation aware if
 supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-ucsi-orient-aware-v2-5-d4b1cb22a33f@linaro.org>
References: <20240411-ucsi-orient-aware-v2-0-d4b1cb22a33f@linaro.org>
In-Reply-To: <20240411-ucsi-orient-aware-v2-0-d4b1cb22a33f@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1460;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KDEnFAKDHgm7Dl9TTJXgLNhiWKY43ebH4R6QBCie46s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmF2v13bz1z7B8Jpthr7MhOLJh6qa1f2AHk+B7O
 uDA14GA1bGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhdr9QAKCRCLPIo+Aiko
 1WzUB/9eFq/D/Yoke7i3WLWxjylyhnOq/qtFUaqzTUUTJCnpYzRcHXAfQpyneQm18QzYrHJdUad
 nFaeMLvwSIhy/+6E352BRPjXzQM5corVZ7+56o0LRbP5S/C5C1TymShRiN3Ou+ur58o41gmbDy1
 UpGobTl1HQBUPZ3srYjmmxvRE+tYKs5smwIxtVjbYzzdefnMBYZY7S628ufdOhIKV+CsLqrQy7l
 RttUR9Ifj9nFknaN+h5l9sn7dQlH+v8zf8eaO1LAHqSYdcA1yCz+Wn4KsvHn/0ddArxPMDQSQfp
 rUZcDML/FWHqbTeKhGO5TsENVNP4bCnm8uHwUOI/C2kjjXmr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If the PMIC-GLINK device has orientation GPIOs declared, then it will
report connection orientation. In this case set the flag to mark
registered ports as orientation-aware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index d279e2cf9bba..f7546bb488c3 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -186,6 +186,17 @@ static int pmic_glink_ucsi_sync_write(struct ucsi *__ucsi, unsigned int offset,
 	return ret;
 }
 
+static void pmic_glink_ucsi_update_connector(struct ucsi_connector *con)
+{
+	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
+	int i;
+
+	for (i = 0; i < PMIC_GLINK_MAX_PORTS; i++) {
+		if (ucsi->port_orientation[i])
+			con->typec_cap.orientation_aware = true;
+	}
+}
+
 static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
 {
 	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
@@ -208,6 +219,7 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
 	.read = pmic_glink_ucsi_read,
 	.sync_write = pmic_glink_ucsi_sync_write,
 	.async_write = pmic_glink_ucsi_async_write,
+	.update_connector = pmic_glink_ucsi_update_connector,
 	.connector_status = pmic_glink_ucsi_connector_status,
 };
 

-- 
2.39.2


