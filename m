Return-Path: <linux-arm-msm+bounces-13967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6699087A209
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 04:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22819283D56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 03:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FA812B6F;
	Wed, 13 Mar 2024 03:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OP+DHje5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C9710A3B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 03:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710302068; cv=none; b=iQhDUchOiHf++Ejueist7LwTJYLLMkgGeDDXPviWVTAC4iEHyt5KwARsF+vBw//hbC+NkyCwE05tRFmy4WynckfIj70A1uOMi30TJVCOFYeKwmhd+KhKnBbawCkwGwpJxs+DkMpihRj9NEf59Klj6LymXgtwVISdXuB7RgKKlNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710302068; c=relaxed/simple;
	bh=XsTJRGmLqtfeI4uhYqv88MedEB7+Nrzpk4+GYV5RAlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2kfPx0qoqSLXPTNs3qcwPrmyPdbGXniuw/nYBwiOgq6uF+W/dUQWJ6H1IEc/ZfCOWwaTdUqMz1PDCCGPqUie/T9ycBURSQ/nCdycrZNUrcXf4cuRvAnXtfEcaDxD43k0drSiipepDfEBUxM5AIzj190VCpx+j/Jm8eiqMJq4M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OP+DHje5; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d46c99eb07so1246491fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 20:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710302064; x=1710906864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhgYvXY3qfNB9puPl0tbRCud+qYwtmwix0mxjSGycJU=;
        b=OP+DHje5kxRl9YoabnmKgG0XA6Ndk2Io7E/e1tV3a9VIz1+nK1L5sFn/UnUeq7iwLm
         mltkMSrDGDBYtqfIlj2Z7UJfhqiQ4HSbYwGPCgutgMSt5qw2p2Sea5lCzN6Dcld9RX8S
         61/CoQKA6v9KF89Pbg12yakLp28ZwF+6wJBrkzWOh9+3WdyCJJjxMIc2K3tQVw2TmWnJ
         xCL44PlQQN0CNr2y0FxRnSYh7sXe3ccj//eIKlIcZjl8U+XBwHZncP7EanREO0MxnoV5
         Iz6kt/6aAbP71InEiPByf1D8zGQsO+dGfk3wWFjQgWu/5bQEnKniQSg68epIWeDXQLOT
         QNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710302064; x=1710906864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhgYvXY3qfNB9puPl0tbRCud+qYwtmwix0mxjSGycJU=;
        b=HasTVewx+HyROYARu8gP7H9rhtsTSjB19Qkgj+VlpqQFfGMBULgIxKNDLFlPNZ/GKy
         TQ8RoVxlU6EVNMaOL2jA7lLoMCJggb91Alu3s+EnWsCLbSDb2zIO74A4qgT/BRY7lh81
         y5w3Zc8vBR5usz0/1t6Hu1zV7tT3zdLV+bhtrzT10Vbp2OcWP1u59yU9XGEUuxpObnHh
         g0VbXAUqvcV7W3zpULZir5XSihpZ5dRb8H5sCc4gT/c2Pfza7OXJ8b0xfkNaeIQPkX65
         v4ok6m7Qv86qZ3FADTLaPEcj1WFm7hlaPR/coLKAKpqazBYQMRul9Wcn9jAY89MdWyFx
         Ylzg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ3NR2W2QCUO+FRP36n5C3XBrW5xj4KL3UbZogxN3jZlo+PJea0oRGmH7ltlCeGt+IofYyCMZXs0/nm56kdhiqAGDe4bHOYJtX25ER2A==
X-Gm-Message-State: AOJu0YxqO+EbLubNypTFs1E4/h9RVC87NyKgjrD+j6MFSf1jc8r1Af7K
	GZ/kQVqLq5ZiAILCVYkWQV9sbImQCMBKcYavtqsT61t85yD0SUIglcRLnWWpCyk=
X-Google-Smtp-Source: AGHT+IGuUJwUxKprfVv1helbjKdC5swNlM5EdpqQUBCZ/j7Fjvo76AQlVaJ8BDDIwbK/p2HrX+FHmw==
X-Received: by 2002:a2e:9a8e:0:b0:2d4:6532:f449 with SMTP id p14-20020a2e9a8e000000b002d46532f449mr1716234lji.20.1710302064505;
        Tue, 12 Mar 2024 20:54:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a05651c02d900b002d0acb57c89sm1854319ljo.64.2024.03.12.20.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:54:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 05:54:13 +0200
Subject: [PATCH 3/7] usb: typec: ucsi: make ACK_CC_CI rules more obvious
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-qcom-ucsi-fixes-v1-3-74d90cb48a00@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XsTJRGmLqtfeI4uhYqv88MedEB7+Nrzpk4+GYV5RAlA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8SNraClA33CPWuYkPDFf2GlffV2yFp/DWqKa7
 JQyl/lMd/uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfEjawAKCRCLPIo+Aiko
 1YfsB/4+Nnmk2AEqncBvGZIyyIxPd3aHD2nZiLyZEb7CBulni/ZUTXCulyCwldLCgywS023JrRG
 41Rkn2pHoUQnxjPdpOs2b6fapIoXo32fP4piMRUoCIIFb+sf0+Q2oLd7zKi3Tf35i/v2htftBjJ
 QwOzuXDH//Ajc+uiqVaB8TNe8ZfprSRp4B/2S7JLikuss7hY2TGbGHwh30liqMDoFrQ6DHyyQtF
 b7KMWqsOGlwPiHaB1jkX1+ecq0Ecj02YsPEKCPlJHkL9vr3WP1hIOUqiwCFnI2BtOI5GxVmCAKN
 NJWpkza6/b0rKtM7fQz+TeQlpqIPMDPfoRdcLBaebmpxqK6Y
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It is pretty easy to miss a call to usb_acknowledge_command() in
the error handling inside ucsi_exec_command(). For example
UCSI_CCI_ERROR had this call hidden inside ucsi_read_error().

Move this call and add a comment to make the rules regarding
usb_acknowledge_command() calls more obvious.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bde4f03b9aa2..05a44e346e85 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -92,11 +92,6 @@ static int ucsi_read_error(struct ucsi *ucsi)
 	u16 error;
 	int ret;
 
-	/* Acknowledge the command that failed */
-	ret = ucsi_acknowledge_command(ucsi);
-	if (ret)
-		return ret;
-
 	ret = ucsi_exec_command(ucsi, UCSI_GET_ERROR_STATUS);
 	if (ret < 0)
 		return ret;
@@ -167,14 +162,27 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	if (!(cci & UCSI_CCI_COMMAND_COMPLETE))
 		return -EIO;
 
+	/*
+	 * All error cases below must acknowledge the command completion,
+	 * otherwise PPM will be stuck and won't process commands anymore.
+	 *
+	 * In non-error case the command is acknowledged after reading Data
+	 * from the controller.
+	 */
+
 	if (cci & UCSI_CCI_NOT_SUPPORTED) {
 		ret = ucsi_acknowledge_command(ucsi);
 		return ret ? ret : -EOPNOTSUPP;
 	}
 
 	if (cci & UCSI_CCI_ERROR) {
+		ret = ucsi_acknowledge_command(ucsi);
+		if (ret)
+			return ret;
+
 		if (cmd == UCSI_GET_ERROR_STATUS)
 			return -EIO;
+
 		return ucsi_read_error(ucsi);
 	}
 

-- 
2.39.2


