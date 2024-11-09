Return-Path: <linux-arm-msm+bounces-37374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F859C288F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 01:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D6791F22B37
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 00:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C67D28FD;
	Sat,  9 Nov 2024 00:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iXU2w6Mn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D708C0B
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Nov 2024 00:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731110666; cv=none; b=UusMbIbcKaFVs5ApTqJ3tLJVF7/BkPy6tjI86mZ6Vdr7o4MhC0uoeTUvX2+JarbRDXcMZx/aK3npGOqiIvjS0H86PctnXh36trhVNr2wCvSJoew50Hlq/Wn/3NU+TWvxbX5oohJ2BBACzM4Wym3dYBAygZA/8eiTIDjcXrlOehY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731110666; c=relaxed/simple;
	bh=vNc9pzUAAlpSLHdwupXEtJEBYi/DEYLSea6HQqWBRGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fi4L9A6C3Yrr+LJl8uD0MLqZsnrbajh0DAv7CdUYTd4GmYureEvAl3FkgFZkYTZyUruPE6yud/Gy9q5/30UM5WBDo2toeSlOs3CCPYWmfUkh/oMOc6batw8+xGP5nvZg8DE+XZ307cKTgWpe/RNg05MTLbuZMyJccywnoC6AEF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iXU2w6Mn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so3097287e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 16:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731110663; x=1731715463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BiTEPthPqo3/ebkD0qqxoaM8WpYM9XGm0Z4Ybp7u6u4=;
        b=iXU2w6MnMSLnBqQJgwiz0M0I8uCA4JzbXZqRn2xf5ntWsGWDpqL2ofCxiFb40/9xxg
         Ir6D2HYSPkINexUDcic3Umls0iVtYsqw2GGrBEMEW41cYSAwSz8mIZ5eYAHFtywmGGMH
         tcYAdySxaoP2diycBe6msySgr0yCNV2aWp7FiUU8fWodpqnSCk1+ZHq+AOHSr7Twqw7+
         XTRBlyuJX8I5yOIK0DCAmoSJ6O96rAUVvqfeaoHHaEYnBoOt+Zntb5HqE8APFEeqDxfK
         Xta0Qs234FFJhfCg+ECePYnwVtr0QavtNapKNOLeoFn1Mh2uXTa9UKmsRLtAC+tHdGhh
         0k5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731110663; x=1731715463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiTEPthPqo3/ebkD0qqxoaM8WpYM9XGm0Z4Ybp7u6u4=;
        b=E64lPWwhfYjIXqGWJ7vwJGWkpgeJA+b3m7a1gho2iRsidhVM5tDwPMSDPH9xCNi2SL
         J1QuaJzlxK7BjDjX+4XNtLUZdpaUdGJetzyqO8UEFwDPR+HMmnIx9C+oXCc2N9OaaBcz
         kYVlIIiGhAHa3wxMs3gplnFQYjDd3Z0z81jJtep4rDFkU9JOfcW241TQygvnV+3T0yyb
         6HBtNaGIld06wOE991d5lmicvTC34noTKVhdSSKa1sm+d6WHkUxxMnBBmPDKSSmtBrK9
         17Mfcaatx0NlnpKmdvUg7122CvrxIPOCqlujmnlp+1RRmpYds5DeNuz1Ul52A1h3024i
         OU4w==
X-Forwarded-Encrypted: i=1; AJvYcCVlURFhaCft3VVHQ9+5riF/O/Ae80/cTtJjAoLmyevOH+dL+hWBEareO7bolETPacHBF8DvHtmDykW6fix6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1uVSr3SkaAoBDmWeMWQXp7ZndZM/KOwLi2Fn/BWN1454CtDnq
	h91kNMdJjkJdx16KVowDZ1FlHT1H+GwA1pPfMhVHhuynls4+e1R6cNiIHEYufn0=
X-Google-Smtp-Source: AGHT+IHWEG5PGsyY3GLZoDdm2ZbEVdV9W9AgH9pPqyg0jHr5gvSoOytLziAHUCiZwZEroy6C1g3BvQ==
X-Received: by 2002:a05:651c:1506:b0:2fb:7e65:cb27 with SMTP id 38308e7fff4ca-2ff201e73a4mr27560931fa.6.1731110663495;
        Fri, 08 Nov 2024 16:04:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff17902152sm8221431fa.57.2024.11.08.16.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 16:04:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 02:04:15 +0200
Subject: [PATCH v2 2/2] usb: typec: ucsi: glink: be more precise on
 orientation-aware ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-ucsi-glue-fixes-v2-2-8b21ff4f9fbe@linaro.org>
References: <20241109-ucsi-glue-fixes-v2-0-8b21ff4f9fbe@linaro.org>
In-Reply-To: <20241109-ucsi-glue-fixes-v2-0-8b21ff4f9fbe@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogeurs@linux.intel.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vNc9pzUAAlpSLHdwupXEtJEBYi/DEYLSea6HQqWBRGU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnLqcAO15Qotft0szsjqbSNzcaxCYWgZEOzS82i
 56/L/hrM5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy6nAAAKCRCLPIo+Aiko
 1YhQB/4phgE/zYsTgO/BKGTEhgTp6cOPDbL9814ZC0n+yzunQFXi9vj539T1t0vrCGzzJFLW1RY
 6e77MQreozkWv5vPZpfbpxRaIbsMYgwQVtBu/0KzkUZaZEH64BzwxLmcCBB7TYmqjh2SOoYxxok
 3sD2ASy3QI4a0NNYbDQhGW+b04jpqmRNqIDpkCqkJT1q1aZUnbY3yhLHhMU8qcdGFBVaS5tUaeQ
 Ff6DxtpKS9kaTIlLKU7A+L0FB2AKb89Y8AQ03mj+rhO1ItkqE0FTh8QVPnAospp41hfaFGVcD2A
 tjBkvRav7YAEOjSvxgC1YyWYeSywZoUiNGwK9aJET29833Xh
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Instead of checking if any of the USB-C ports have orientation GPIO and
thus is orientation-aware, check for the GPIO for the port being
registered. There are no boards that are affected by this change at this
moment, so the patch is not marked as a fix, but it might affect other
boards in future.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 2e12758000a7d2d62f6e0b273cb29eafa631122c..90948cd6d2972402465a2adaba3e1ed055cf0cfa 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -172,12 +172,12 @@ static int pmic_glink_ucsi_async_control(struct ucsi *__ucsi, u64 command)
 static void pmic_glink_ucsi_update_connector(struct ucsi_connector *con)
 {
 	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
-	int i;
 
-	for (i = 0; i < PMIC_GLINK_MAX_PORTS; i++) {
-		if (ucsi->port_orientation[i])
-			con->typec_cap.orientation_aware = true;
-	}
+	if (con->num > PMIC_GLINK_MAX_PORTS ||
+	    !ucsi->port_orientation[con->num - 1])
+		return;
+
+	con->typec_cap.orientation_aware = true;
 }
 
 static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)

-- 
2.39.5


