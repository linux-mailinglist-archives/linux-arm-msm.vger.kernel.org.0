Return-Path: <linux-arm-msm+bounces-13971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E2587A211
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 04:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B06E8282D42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 03:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4E415E80;
	Wed, 13 Mar 2024 03:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ESI5kDfG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C47D13ADD
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 03:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710302070; cv=none; b=FGyXIJXIQFsVc2tSSniT6ieaEGosiVFzMMNh50FC5+GG+1DvzX+EppZtDMPwvrY9ObQ1IMnDJI+klDkBA8fMbjaemoqtx41ehexxL3LbtmX/GESEXOfcQdVondNzHd3CMAtcYGlEaLdKyJv4hJnhs9QoSmvZ8OjGXdJ5U8M3S20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710302070; c=relaxed/simple;
	bh=hjtNY7rwrzLwExmeSB1V0RfbPf0EFqjWrRvXTMW6u3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JrrxquF5O80SLGwa+pplW9gtubSNWHyFxVSK0HUJ6WZwmUrYwu1HpUco+LUDhaAVJqPGMIveJ3k56eufSTw0w0hKOPv32OHLo2dVGz2AOoA/C1yPpehi2Sa2K11TuUq/EsIP/KCV3I/922egMLmOPPV8tzdnJnvJn+cH92LFD0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ESI5kDfG; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d3fb16f1a9so5021101fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 20:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710302067; x=1710906867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fFzMCtaUwxqWFGfcU6jyBqJsIQ1qd2eqh/5wTdrbDk=;
        b=ESI5kDfGw+RUT5wFKUYfTqPRiBshcZynfD7gVREyEH0gMMjcUzHYdiINtls+NVC6Dn
         PRymzqkxFgrRRdG5Ci1BkbekdPn7rd5+nLRKabSr+nKpIgqhDAGr/71hwxrAzV0XdNUV
         +NJBrvvuKqbXb0qzkbvQjk7DApPlM5M0sxVV2Rns0VDbLelSImMHsM0CRm8qziQaARzm
         pkbnqNRIDFACwR1MF/CTvnsF2MJHYGABZKKA5P5SxI9c33+Oilrocdnr4dOH4stsyFCm
         0SGvzeBumSk/g5U7Qddi9K4t4MFHClA+Oi9Oa8CVvQnc+AJDbiRXqYzdLmij/D7iz3b/
         dMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710302067; x=1710906867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fFzMCtaUwxqWFGfcU6jyBqJsIQ1qd2eqh/5wTdrbDk=;
        b=IN85QcY2vf/cqay/kYnP3Lx8PoSsbD159LL77QlDxrNCPWfqKL0zMub1MhRiKoU9aZ
         eDpKzXBrto0Q+5Q2FrA05AqU+/6DPF9j2+uEJjyFq5paErx8tMr+zhCYWhADa9XF0Rc7
         2imLQm9KEDza8bCrXerHexYD0WJlcB/zc2per+fZQVHiqzP66hx9Md+VIUkMky2Xzsdf
         JoEajLLzU5nLAt0bngfSdujCtbTpctryw2IvOzUZdeTvexQwlyFYcB2Oo/CwV85yPP7i
         uVZNqOyPq8eaXPpB2Fimgwjv8rlzk6OHbw7NgpxR91TxCOHrZWWER0gKt8+aJeNf7YFf
         PRxg==
X-Forwarded-Encrypted: i=1; AJvYcCUprQBAx8y2xN/GmBIbX7ml8SZFikV5p6mXXV3IaOiRsiyfBTmYL/iL4P+IpXo4vmvc3bTRM1YHHlwihAhXDUwt0RwNJaa3igxwo7r9wQ==
X-Gm-Message-State: AOJu0Yxg5gW9SG543oQyDTKBDzrtaqkc+u8JKp0/1LLR0mj7kxz2Ut7L
	cOyKMszDNQJelId/Bg7eA4lfwtxnerKzJwopkx37UDD/BFkMoYz2RHlEXtOE0rw=
X-Google-Smtp-Source: AGHT+IFIf0aayTcXNyruF81FSZALtLVnPMSslXA4xvKeV9oyGrKzjNCVmlS48OOTDYcZ4iyL5usVdA==
X-Received: by 2002:a05:651c:105b:b0:2d4:22d9:b01a with SMTP id x27-20020a05651c105b00b002d422d9b01amr477054ljm.11.1710302067679;
        Tue, 12 Mar 2024 20:54:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a05651c02d900b002d0acb57c89sm1854319ljo.64.2024.03.12.20.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:54:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 05:54:16 +0200
Subject: [PATCH 6/7] usb: typec: ucsi: properly register partner's PD
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-qcom-ucsi-fixes-v1-6-74d90cb48a00@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=874;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hjtNY7rwrzLwExmeSB1V0RfbPf0EFqjWrRvXTMW6u3s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8SNr/e7wwCwLWXzsNh5AlPrljH8c1bjebYZIn
 8rDBmNao7eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfEjawAKCRCLPIo+Aiko
 1ex4B/42jyzjXY1cC5GZEU8UWURS1Dc2rdh13kO5wmShsvrgMpF/oGhA3FRPKAPUOVyGH6odIub
 /oif7UVdI8wIEjrlxqwQRgwO+HUXZlK8ZQzoAuHcrS37BJQAWTqMHzNkOyEBlpOxkEyf1aRBiSR
 huxD4SHC9UFToOPFfHdOzJRBM+Jag9tMFliRUzn3KJ+8XidOkgBVdJGatJGJSua7Pe46uuEohXG
 e/acWjwZX5FROYGG759vSg/l71rEOsx9NRa+CMq2qJH/+1lCPyavH2uibMQSaYhBIN8YB/3ei+y
 O790+02cRft7tSNsgHZWGKIZ3+k72uiUCke+q6f4LNtdfTfi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use typec_partner_usb_power_delivery_register() to register PD device
for Type-C partner so that the PD device is nested under the partner's
device in sysfs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 72d368433b1f..78e04b7701c8 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -833,7 +833,7 @@ static int ucsi_register_partner_pdos(struct ucsi_connector *con)
 	if (con->partner_pd)
 		return 0;
 
-	con->partner_pd = usb_power_delivery_register(NULL, &desc);
+	con->partner_pd = typec_partner_usb_power_delivery_register(con->partner, &desc);
 	if (IS_ERR(con->partner_pd))
 		return PTR_ERR(con->partner_pd);
 

-- 
2.39.2


