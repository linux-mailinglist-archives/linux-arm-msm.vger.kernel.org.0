Return-Path: <linux-arm-msm+bounces-13968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9078387A20B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 04:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A4AD1F24120
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 03:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B6F12E6F;
	Wed, 13 Mar 2024 03:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N//dqGSF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D17910A28
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 03:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710302068; cv=none; b=muUUZv6AkmU6jeGqJIjj6TRx3iG3pC3DHThYoL+P5v2sSZ0lzOy/BtUsnN8rdwf+u4vSB5opCZmXvCc+DeQ2v0lh8+A/K1TtW2Nt5QhTX86fDeDTH2Y9Sd5XdMzTV0PHRxc6qoWJs7x0VRSkUPwpfWcY2WEmugJTwtvrD1ozcOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710302068; c=relaxed/simple;
	bh=b4TOdcAfpKP7c8TtSew/74QZD84OuH+/13I9UVvWj6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEnyhp1rTn9jK8rvbXNkTrYb4chiL9g5JQGlSRxdBe306TLDZ4p/67+wNNSdbzwhJeOZ2Cbnmdri5DG1GmPCtvYg8nbuWEVBCLq3JSLOVu2bW9I+hzZK1KN1yo7GAp7mbRBDC7y+Z1/GjoB864CD1hnWZC9y7neqkrnFhdFxKYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N//dqGSF; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d2509c66daso73702811fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 20:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710302063; x=1710906863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFntvUmfQrQoD9JhHP4a9IiBrKarY81qZUG6+LdJaJU=;
        b=N//dqGSFTGZvAunpZjEUrPCDR0QAy+0xIvChTBMKfVysAt17fMBVWca1U/DE6hmJFo
         AZE7RnQOrdAiy1nfH43OuJBJ3loRlKATQS+f3JoY9Ct07oJQ6ACDV54vwx2Ql66uoNHM
         27t3+kD7wxgrwF4lL8emztXUM+CY8mnXeHuA3sWunwWVeNp5nR998/WaXMN7IHjPWd/b
         ACbQOG2tQVVLeBabOfoDjpLyb2du6+7d//2Ltzpw+/5ZPJcQZX3I+DaBfbBZBWm8i9mG
         iCsGjea1ADQWIO7ehcjkQ06irnS7aw3iQcw1mWKVKbinon62i2gXiyQNrhM7wJVoGfFd
         Ujrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710302063; x=1710906863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFntvUmfQrQoD9JhHP4a9IiBrKarY81qZUG6+LdJaJU=;
        b=TxeZ5334byTAil0+mSuC5hQNYtMeons1Bfe73QtTMDLPrWYurk+tBMgRsWxmQZjHOd
         RDlbjNZVYjFScJAghVbmX68zfcYElCSLlne3mfKCa4e2fu/k8gX07Gp8cTl/vuKQziuU
         YLodc3h90/VEDSYAybPU+Mkbb5GY/C5PuYImzua+Ox7nLtm0mRfJAaNyqOALVPhF4trD
         OizXZsbVh+4nn7NlpFDzNvMV47uvN2NvTYLXmmGetKLfgcdzwLM5DqIzO4iMXFcVoMPt
         OAayJZyRJcWSC2X3+IrW96Kv3nSGtiPL2Ic5NxypcIpcxm0I14v+vqLfqQI7bVL3V1xx
         C8hw==
X-Forwarded-Encrypted: i=1; AJvYcCXCWMT2XI63h6YcIArQ0k7oBC8FhBmAiDzbfnM//1Khhb2dZPwmiftFgEAw7ZmRvvX8vr85YEduAXRWvcr2MX3CerpLiQxHHryGwY0k5Q==
X-Gm-Message-State: AOJu0YzlmngX8c9eBy4zThZNdalwMM8HDEmEg9QcgAKnt3xKebPlUAHg
	1ZxOKYwV7Z+RNvMukpYcZlb53nBrilBVZ4RGxQr8/pPB4JtJRAVD0SptFdj3XTc=
X-Google-Smtp-Source: AGHT+IF7ZptzPxSTf58/lAJjw4Oo4QhbXQNkZBdrDCZziYkkXuk84yKwMDenXbJyp736hIssvaOTAQ==
X-Received: by 2002:a2e:8e3c:0:b0:2d3:fca:dae8 with SMTP id r28-20020a2e8e3c000000b002d30fcadae8mr1200502ljk.16.1710302063642;
        Tue, 12 Mar 2024 20:54:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a05651c02d900b002d0acb57c89sm1854319ljo.64.2024.03.12.20.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:54:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 05:54:12 +0200
Subject: [PATCH 2/7] usb: typec: ucsi: acknowledge the
 UCSI_CCI_NOT_SUPPORTED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-qcom-ucsi-fixes-v1-2-74d90cb48a00@linaro.org>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
In-Reply-To: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=b4TOdcAfpKP7c8TtSew/74QZD84OuH+/13I9UVvWj6I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8SNqeJcoJB/Iq7ScN3gQPd6nqFh0TtyF56Qo1
 NIzkt2f3CaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfEjagAKCRCLPIo+Aiko
 1a3NCACwe1UaBtfp8zYIFp97vnTMJ/Rftih1EHQpFoHrXfy+q8GjM7W55FJWQ0tAJYAHneww/11
 rW0r6zoOWO0hGH6L9wScIb2k5fsy8RgV7e5FOj/Yu8QMY/f0FYoQl15l8AUfhF8BWYhgWll8tf/
 ipldJqj9i7EgaY0Qr2FdwICG5H2Y2LePyZRb5HljYaW4ABjjn6ojloi0+4f9nExQG7K9bdOkYMb
 q3EwJ6XFQlbJCSnMjN2nAp+f5lYuWmFria6qyf/FXgkYqO0NJSZ+cETuzQ9B4MG7uYbNwehvcII
 vndULkoE+/G27inrpaRG3Q2Nyyn9uNwE75AcIJ4co7trqJew
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

When the PPM reports UCSI_CCI_NOT_SUPPORTED for the command, the flag
remains set and no further commands are allowed to be processed until
OPM acknowledges failed command completion using ACK_CC_CI. Add missing
call to ucsi_acknowledge_command().

Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 4abb752c6806..bde4f03b9aa2 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -167,8 +167,10 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	if (!(cci & UCSI_CCI_COMMAND_COMPLETE))
 		return -EIO;
 
-	if (cci & UCSI_CCI_NOT_SUPPORTED)
-		return -EOPNOTSUPP;
+	if (cci & UCSI_CCI_NOT_SUPPORTED) {
+		ret = ucsi_acknowledge_command(ucsi);
+		return ret ? ret : -EOPNOTSUPP;
+	}
 
 	if (cci & UCSI_CCI_ERROR) {
 		if (cmd == UCSI_GET_ERROR_STATUS)

-- 
2.39.2


