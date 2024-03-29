Return-Path: <linux-arm-msm+bounces-15674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 028CA8913A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 07:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 526A2B23C72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 06:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4AE51012;
	Fri, 29 Mar 2024 06:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JSXqQ24X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D22B44368
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 06:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692953; cv=none; b=hePDYYPzLq0UMsM131Ma++5bkEPgWtuYpxUNzc+5CjLhF6eJTtSXIw85HiIjN9udRYqUZnEo3W6DIGctJVEKIGHljDZEIlpT9k5XAeujgn2x/9MJ44mcO6VHeS+ITO2Pu20odCPEi5GWVS/dcP74iKyQl/AYV+2R4SsScQif4X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692953; c=relaxed/simple;
	bh=12roAABSvS8s66vFOhz0Ej3vS+YDb5JJUkjxncPVUtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRqQ77T53LSg0a0S4R1H6dvU86oQuvY3Lduk4UBSWnt4hYwq7WqvgBQo5XOFjcjfLjv0ns4oNbKgTCErlblTFCEs08VGCM33eZy7uLoU1ehtsnaKlNR9eldfvLmMaStKX5luLsIaK0Fcs3gofpj8KaUMOmhnGPPqk8DvfoJxf7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JSXqQ24X; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d475b6609eso18396521fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 23:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692946; x=1712297746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPxSwLNRU7JirYCxsYGkY7fYD3aOS0RR78s/czBwCEA=;
        b=JSXqQ24XaG2Ji9YeVx4z7MV3fJDTYsF/P/aYejw0oiaU1qAejI4HAFX0L6x+7Ga5qv
         hGknRbyLDpwagkhfeVOt2gHH682NUiuxfVEWhPZVSFo2EpgJKmbUulXZU8/sHjw8/B1N
         mLQ+qdtsE1gf2DVoBfvx/bG0onwCCRUwJgCubXAJfU5FNXbKZGMRdtB11AoGVbxulQCk
         0kuM6aCTVIRTziA35Pzm9FHS/loe7EAFK5tleAF0qGS6+UX+3cjEegRMmslkFIn27q8/
         t/AYlKkIl3PtRNmAS4CBzwRsv+uni6oqsxAobLd0rDvQ29Zp1H0GzKlXTPdNoLUI/Kes
         v5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692946; x=1712297746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPxSwLNRU7JirYCxsYGkY7fYD3aOS0RR78s/czBwCEA=;
        b=Z6aPzDXkGU2b2j7z+qY1JL2asOewXSyxa22xvPX4kzA8JWWvNNq/mO8CVeHmhDmoc+
         9RDw3ccNTgWoZ6XjcvnB5UkIngbscJdwU2riWIPNmW8HtZoDSnAHLkJACUwF5nBh0IY6
         a5SWxW9kkmcYjHrzTobJYl1Yc/wLiAoOBzHTz+DW4skMvkPKAkQL4PYFoZPtbesmNZ6R
         tnmGa1QVOHqpWEzR12MTObZQk6tdsRTbrE3Hr+J7GPzGD9pzZjxTRyYB/uMUl2eMStxW
         u8PvGr7U9jh+y1Ll1q2MWoj4DoNN78v72Xg48tlS8QSrEOXkl1Hq/XnCla8ElNCV7rjB
         0vGw==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZJ7IMtke10+KtRf7vThDUfWuixHqYheUruh7aNS4S4DZb1EcXMrMZGMuapGWnLg6k7XrdnQ/xj0oa+gqvv3Z0Rdcde+4oOEsz2thSg==
X-Gm-Message-State: AOJu0YzeJ6E52+guGYpHBUxzhhrGWIu7QSJ8x7OTHrtSkdJNGJQxFqkT
	6AYIONsW+Pgkze+ChNdBCD2anWJbfjEH3EUAXJBZkrUdiJ3398dd2vbeHYkEdyw=
X-Google-Smtp-Source: AGHT+IEXB5SP5P1OQb1Z7VzjonGu9gyMhxfCaMv7EwCqe/+Y7XsRC/sg3Uxu90+kT6l38IW8QQnebw==
X-Received: by 2002:a2e:90d8:0:b0:2d6:c726:ee64 with SMTP id o24-20020a2e90d8000000b002d6c726ee64mr766701ljg.13.1711692946687;
        Thu, 28 Mar 2024 23:15:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 08:15:38 +0200
Subject: [PATCH v2 06/11] usb: typec: ucsi: extract code to read PD caps
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-qcom-ucsi-fixes-v2-6-0f5d37ed04db@linaro.org>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4416;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=12roAABSvS8s66vFOhz0Ej3vS+YDb5JJUkjxncPVUtk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmBlyMCTEX4esjwYXF6xy3MXFnaqP9PR8AxRq7f
 Sqd2b4H6WWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgZcjAAKCRCLPIo+Aiko
 1Y8XCACz3+D1KczS0/wOVXGt+djxZULmmnPWVPBJrOPvEBGUAlSMvS48T9ReTU26YvL9Xg6RSHN
 p9LrA+8/yEmqG3Ejl6hJeq5yQK9hTJdy2SY5s/TFH9NNxu+zlgBm565gf8A3gn/2ZGo/cgRitx9
 Mk7phfeFu+iKND4lFJ8Fz8B1AATopKsL2u78Hd+qVrgGk5nmCKVbko9xtbwjqm3qEhKUhL+u3I4
 4DAW6pFzXPuYcSHeQ+FoLmxSy4yg1u+5vGvS7ZNmPDXPDyvct4vBT/ZacJ4j+acLLyujQ1x25vr
 gOm7r6sTPX12IhPHXl3BsLta7xNMGVJzwNw6ToKXtwzbucHe
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Extract function to read PDOs from the port and set PD capabilities
accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 85 ++++++++++++++++---------------------------
 1 file changed, 32 insertions(+), 53 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 35366b1a3d78..18b2e4ffc57e 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -677,6 +677,26 @@ static int ucsi_get_src_pdos(struct ucsi_connector *con)
 	return ret;
 }
 
+static struct usb_power_delivery_capabilities *ucsi_get_pd_caps(struct ucsi_connector *con,
+								enum typec_role role,
+								bool is_partner)
+{
+	struct usb_power_delivery_capabilities_desc pd_caps;
+	int ret;
+
+	ret = ucsi_get_pdos(con, role, is_partner, pd_caps.pdo);
+	if (ret <= 0)
+		return ERR_PTR(ret);
+
+	if (ret < PDO_MAX_OBJECTS)
+		pd_caps.pdo[ret] = 0;
+
+	pd_caps.role = role;
+
+	return usb_power_delivery_register_capabilities(is_partner ? con->partner_pd : con->pd,
+							&pd_caps);
+}
+
 static int ucsi_read_identity(struct ucsi_connector *con, u8 recipient,
 			      u8 offset, u8 bytes, void *resp)
 {
@@ -804,9 +824,7 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
 static int ucsi_register_partner_pdos(struct ucsi_connector *con)
 {
 	struct usb_power_delivery_desc desc = { con->ucsi->cap.pd_version };
-	struct usb_power_delivery_capabilities_desc caps;
 	struct usb_power_delivery_capabilities *cap;
-	int ret;
 
 	if (con->partner_pd)
 		return 0;
@@ -815,32 +833,17 @@ static int ucsi_register_partner_pdos(struct ucsi_connector *con)
 	if (IS_ERR(con->partner_pd))
 		return PTR_ERR(con->partner_pd);
 
-	ret = ucsi_get_pdos(con, TYPEC_SOURCE, 1, caps.pdo);
-	if (ret > 0) {
-		if (ret < PDO_MAX_OBJECTS)
-			caps.pdo[ret] = 0;
-
-		caps.role = TYPEC_SOURCE;
-		cap = usb_power_delivery_register_capabilities(con->partner_pd, &caps);
-		if (IS_ERR(cap))
-			return PTR_ERR(cap);
-
-		con->partner_source_caps = cap;
-	}
-
-	ret = ucsi_get_pdos(con, TYPEC_SINK, 1, caps.pdo);
-	if (ret > 0) {
-		if (ret < PDO_MAX_OBJECTS)
-			caps.pdo[ret] = 0;
+	cap = ucsi_get_pd_caps(con, TYPEC_SOURCE, true);
+	if (IS_ERR(cap))
+	    return PTR_ERR(cap);
 
-		caps.role = TYPEC_SINK;
+	con->partner_source_caps = cap;
 
-		cap = usb_power_delivery_register_capabilities(con->partner_pd, &caps);
-		if (IS_ERR(cap))
-			return PTR_ERR(cap);
+	cap = ucsi_get_pd_caps(con, TYPEC_SINK, true);
+	if (IS_ERR(cap))
+	    return PTR_ERR(cap);
 
-		con->partner_sink_caps = cap;
-	}
+	con->partner_sink_caps = cap;
 
 	return typec_partner_set_usb_power_delivery(con->partner, con->partner_pd);
 }
@@ -1463,7 +1466,6 @@ static struct fwnode_handle *ucsi_find_fwnode(struct ucsi_connector *con)
 static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 {
 	struct usb_power_delivery_desc desc = { ucsi->cap.pd_version};
-	struct usb_power_delivery_capabilities_desc pd_caps;
 	struct usb_power_delivery_capabilities *pd_cap;
 	struct typec_capability *cap = &con->typec_cap;
 	enum typec_accessory *accessory = cap->accessory;
@@ -1544,36 +1546,13 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	con->pd = usb_power_delivery_register(ucsi->dev, &desc);
 
-	ret = ucsi_get_pdos(con, TYPEC_SOURCE, 0, pd_caps.pdo);
-	if (ret > 0) {
-		if (ret < PDO_MAX_OBJECTS)
-			pd_caps.pdo[ret] = 0;
-
-		pd_caps.role = TYPEC_SOURCE;
-		pd_cap = usb_power_delivery_register_capabilities(con->pd, &pd_caps);
-		if (IS_ERR(pd_cap)) {
-			ret = PTR_ERR(pd_cap);
-			goto out;
-		}
-
+	pd_cap = ucsi_get_pd_caps(con, TYPEC_SOURCE, false);
+	if (!IS_ERR(pd_cap))
 		con->port_source_caps = pd_cap;
-	}
-
-	memset(&pd_caps, 0, sizeof(pd_caps));
-	ret = ucsi_get_pdos(con, TYPEC_SINK, 0, pd_caps.pdo);
-	if (ret > 0) {
-		if (ret < PDO_MAX_OBJECTS)
-			pd_caps.pdo[ret] = 0;
-
-		pd_caps.role = TYPEC_SINK;
-		pd_cap = usb_power_delivery_register_capabilities(con->pd, &pd_caps);
-		if (IS_ERR(pd_cap)) {
-			ret = PTR_ERR(pd_cap);
-			goto out;
-		}
 
+	pd_cap = ucsi_get_pd_caps(con, TYPEC_SINK, false);
+	if (!IS_ERR(pd_cap))
 		con->port_sink_caps = pd_cap;
-	}
 
 	typec_port_set_usb_power_delivery(con->port, con->pd);
 

-- 
2.39.2


