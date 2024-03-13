Return-Path: <linux-arm-msm+bounces-13972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D16487A213
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 04:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 049D91F24108
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 03:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEB516428;
	Wed, 13 Mar 2024 03:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pnov1oIs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627D214ABA
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 03:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710302072; cv=none; b=Cw2T6vsF6sXHFurWZEzEDpZKti2mTifMjODn8VfsOqImaL+2Prb1ou658WMlT6epvmZl/1qM7NFVtIZlihwWY7vDY6MQbVdsoBIAMe+A3S+O9L+zBkgCM+V77WSjUkZvrMmLlf5wC9RbU5oYbexMxW8OKCPpYchHlGkbqkDdDew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710302072; c=relaxed/simple;
	bh=S06LW4XbXp4mNZRbX50ghuv/ngjWIPDbWauLWS0Z+FU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKfPibMzfLJaV3fpMkS0FLdYLmaEB0QG2QP6CB4xDaK2KWaqXu8shavdzBsCZrENj9uhN5KaY+jLtKVnxr3Nr2E5b+A5u4sZKoqubtoFakAeQwX6CwRMubYOZqdekQm0/jv8EnAV1TP9CJf/r7RK/iLpMgDuzzAUdXmvO/G9h44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pnov1oIs; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d228a132acso80456701fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 20:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710302068; x=1710906868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z632Vl9mGcaUD+E7Cpwdhyjpjxo2r7hLci9lVvPzHlg=;
        b=Pnov1oIssLpiTJqrAjLlU8ThYua0NravpFbBeOIHDnL1NiU9ugNF89QXqytmXt5rBu
         nw065NatFw/6ijseQV7HO0JtB3heAaTFJZZ/X4jNvPDvXNr2JIm3wHM5p8hJikLAuv27
         IfyvK91T82fWeJCT/myTLmLuJ1erJdDaXeMqZWeB+h4ShQUPGo7cDSh3M8YUkJfd6XMW
         9PTMXHT/oaYjCyFBQkCBXAa8C64xdbWJAyqRT7fnTlP0EQwP7EgXyhdoptJFlDCtdbkx
         8nxCzSH7uOwfyzkciHoM2W1AVIyulcb4EXXZV1BvTJpVmV5As6E788j1SQmEGVUpimhx
         YkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710302068; x=1710906868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z632Vl9mGcaUD+E7Cpwdhyjpjxo2r7hLci9lVvPzHlg=;
        b=UUhi93pYAbjK14doHWUl1nn0S0cuVQ6y9roEIfIrJQr1seEuuZHVSf3TEMAU5nGo7t
         TcNny7ehKb75nVw/ovUdAH4t2ltQXvr5z80gjObPkdvUvji0cPF/o/H0ZdKaYfh7sdo+
         f0qcTsOe/CPwhwHdTeJYne8AHcKt+Xbk7bmXXawefgRFMa5nfi1+BIaPVCaAQygHIYr2
         EG69aF2puWhV37jgWIF5SHVetZRWlCQlmNSlIVUYmk46cnZKIz+cU/DRoCy+n7BQ9tka
         joFe/axlc5m60ICi8mVVwk69QTauzVYBRzpWQRiIu0/P/cW0XsYi4nhH7T5rx6gyLc2b
         93TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWjdXrAsCzccuSXpQhrEBw0NaobQY5hsd+caG6KlXW9cXwqGdORq2auMIFAO73Y+/1JEJ1QVdIeL7HJeRSrV9p/da2FTiJtoKqYZPkhA==
X-Gm-Message-State: AOJu0YwzhANRGe+00UE+uQ7Sg92pG/aPAUwtstKyqxsM8TqUb/d8vU71
	HQ45J0kzA7mLtVWbyNhBd065x35LoKtHcF/JlHVNAltRD9e/5IpDZIV16kliB8M=
X-Google-Smtp-Source: AGHT+IGT21uwfmDhENLTqEjyobLcyK/klC8iwxAr7x91U3iV4MBVqo6A+D5u/a3myRTNeji9AGY8rA==
X-Received: by 2002:a2e:b0f1:0:b0:2d4:4a0d:d48 with SMTP id h17-20020a2eb0f1000000b002d44a0d0d48mr3239650ljl.47.1710302068739;
        Tue, 12 Mar 2024 20:54:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a05651c02d900b002d0acb57c89sm1854319ljo.64.2024.03.12.20.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:54:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 05:54:17 +0200
Subject: [PATCH 7/7] soc: qcom: pmic_glink: reenable UCSI on sc8280xp
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-qcom-ucsi-fixes-v1-7-74d90cb48a00@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=885;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=S06LW4XbXp4mNZRbX50ghuv/ngjWIPDbWauLWS0Z+FU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+pH5exzHOlrKmav+l5ZE3/7pk7Bumje/gT92sakcnOr+
 z475i/pZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEIt6x/9PjOXv3CoPxwnZL
 /882hZlvIuWPab36PneV8eaX2dtFfV+qacU01FUwytl8t16Z9L3D1vwPa9jl+PWhlYe7+u/Y5hv
 +Ycz3lnr2I5TNUkfrn9dvwwDe1bJJ+xPebTpwp6k7SS+gM/CiuT73lxj9hCm3JzClFD089Lvg+N
 0W68NhrZvCJmf7VAp/8quvXCIqvu2hvEpA49O5wVF57Bbhmre+B4haaAXY2PfoHVomurTcYfVUr
 zV7PkluCHvymIvZoKJg32P+9bNqjD22OSUWGvd4Gese5Z0jpXjitvapDe8dtu3icbT8s5rzzCen
 DNvZE77wHinmjjmesnAK7x7RfX9vBd3a8G2KkvccGY31AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Now as all UCSI issues have been fixed, reenable UCSI subdevice on the
Qualcomm SC8280XP platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index f913e9bd57ed..e5a591733a0f 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -343,7 +343,6 @@ static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT
 
 static const struct of_device_id pmic_glink_of_match[] = {
 	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &pmic_glink_sc8180x_client_mask },
-	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &pmic_glink_sc8180x_client_mask },
 	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
 	{}
 };

-- 
2.39.2


