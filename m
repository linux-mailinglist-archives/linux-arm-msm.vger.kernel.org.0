Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31FE35A7FF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 22:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234183AbhDIUkv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 16:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234424AbhDIUkp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 16:40:45 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED5DC0613DA
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 13:40:30 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id w2so5748059ilj.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 13:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PtMi89g+xngw9+GYstbnUlBVQc42Sqo+fMvxApUU36w=;
        b=g+PzZ2eaK5rlXbrgp7vKf8PLQB0+8T+R/TGOz5WG53mjkALkAO4JQDNomj48bhLX7m
         qf0f39UXufIDbgtbkvuhZG0n0keMfX1SoQXz0D3ohgTuVZx5Y/+rIyqj6iuK45pSollw
         rWZFyW76hO+ItcLNUH2FB9BU82ptb0mfHFAPChbDHfqIpv9mWdpJ8wxXEmQuoBEPdf8D
         y1mTlRq7FN7WltTE96XINxAOW6Aj4eI3drWYDV0EJZd1bb1eMSpbW8dP7dFqWavAOA/p
         sjrLJP8T+WBKMxQARfZmatVwXFluzeveYDeEvecPPbtxqXCtjbexPyEjpMMkTCRQlIwj
         v1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PtMi89g+xngw9+GYstbnUlBVQc42Sqo+fMvxApUU36w=;
        b=PHB2NlEozmA9zDUwN7Yb71WmFZbPYFwrP+PBWXEXR1xWza99MPpWCDrOvQqpLDn3m0
         NbjO4GBlwQRbYD03fkDRJVKBV+vIVKNhFDJzNt7GCK5tFW4w5mF4TurIMPI3AUebMSL/
         o9TrbUCf2k0XApuW7wduOgNKeAEnQrwaUeJR2RZse/vaOP+xi9LzFZwCkFyMlhgamYUD
         aGln6Oog03rWTHuZV1xn9B3C6nQuEUiuM7aFfty1QA+Rau5BisnVRE1ThXHjcUmnpORN
         XYPtqOMl+6cHsy25eqP0ve/IRN3TaQAWIHgIBYM2USGGiVImWQm4s8Yij2fD7uq4YeZV
         dRiA==
X-Gm-Message-State: AOAM53246jabRiUClZxAcilFaThv7Suvo0CHkEwcikaDrdF9Mnf4I5hZ
        o02+a4Bel0/mdlQimB8OxC6dLw==
X-Google-Smtp-Source: ABdhPJy5DAb1koFiTFvJXmBI7chDtoiUc2aFAuRhs1aD/xNPIIXrLb4vLqknV6aWGl9vgEuST0F4tw==
X-Received: by 2002:a05:6e02:b2e:: with SMTP id e14mr12609797ilu.186.1618000829745;
        Fri, 09 Apr 2021 13:40:29 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id b9sm1667212ilc.28.2021.04.09.13.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 13:40:29 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/4] net: ipa: disable checksum offload for IPA v4.5+
Date:   Fri,  9 Apr 2021 15:40:22 -0500
Message-Id: <20210409204024.1255938-3-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210409204024.1255938-1-elder@linaro.org>
References: <20210409204024.1255938-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Checksum offload for IPA v4.5+ is implemented differently, using
"inline" offload (which uses a common header format for both upload
and download offload).

The IPA hardware must be programmed to enable MAP checksum offload,
but the RMNet driver is responsible for interpreting checksum
metadata supplied with messages.

Currently, the RMNet driver does not support inline checksum offload.
This support is imminent, but until it is available, do not allow
newer versions of IPA to specify checksum offload for endpoints.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index dd24179383c1c..5d8b8c68438a5 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -88,6 +88,11 @@ static bool ipa_endpoint_data_valid_one(struct ipa *ipa, u32 count,
 	if (ipa_gsi_endpoint_data_empty(data))
 		return true;
 
+	/* IPA v4.5+ uses checksum offload, not yet supported by RMNet */
+	if (ipa->version >= IPA_VERSION_4_5)
+		if (data->endpoint.config.checksum)
+			return false;
+
 	if (!data->toward_ipa) {
 		if (data->endpoint.filter_support) {
 			dev_err(dev, "filtering not supported for "
@@ -230,6 +235,17 @@ static bool ipa_endpoint_data_valid(struct ipa *ipa, u32 count,
 static bool ipa_endpoint_data_valid(struct ipa *ipa, u32 count,
 				    const struct ipa_gsi_endpoint_data *data)
 {
+	const struct ipa_gsi_endpoint_data *dp = data;
+	enum ipa_endpoint_name name;
+
+	if (ipa->version < IPA_VERSION_4_5)
+		return true;
+
+	/* IPA v4.5+ uses checksum offload, not yet supported by RMNet */
+	for (name = 0; name < count; name++, dp++)
+		if (data->endpoint.config.checksum)
+			return false;
+
 	return true;
 }
 
-- 
2.27.0

