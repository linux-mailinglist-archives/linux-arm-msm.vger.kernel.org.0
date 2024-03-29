Return-Path: <linux-arm-msm+bounces-15665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B144E891391
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 07:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 671E01F218A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 06:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D656E481A6;
	Fri, 29 Mar 2024 06:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RF5D6jNJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDA044C7A
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 06:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692947; cv=none; b=JWz1mfzy28IIjBGfDOJS4q8ZeFxbAR8h0TpIh2QeoOX+vXOcGidYVGJ9UbUzJUQcev0ExQQyRYAmRDAKTlblupT+hRwWocQb1SkVF2BjB+IX1Ak2r7PptfKExI12pAxwM0ibi7plIZrG0JnU6WfUaigEeBnVqr1fo2o/lW4gUwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692947; c=relaxed/simple;
	bh=1YXtXW57tTxFBEzDGmlGAr9GqbQ7HEPJ3F4/AfgmRvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9hBxAo3eB3xxyiQcd49bnjcuyNC5BCIOonF1ucflN2qz6Hk+Ah35qN29lo0s748O/X+JrWekx/8YAZEf3jYcdalJhzAGOahHVmkIm2D7v+IrDUR37IVy2jd35RRBUpydBMdcRpkjqik+iZzKbYtzCEYcDsudC+/csZIA3v5RDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RF5D6jNJ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d094bc2244so18334921fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 23:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692944; x=1712297744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xc5E/NYDZLjfNoXG7DGNM4m70S/ss7sBgBQIDH4LAuE=;
        b=RF5D6jNJYgCe+TdD83WIPjyaxHd6YerkAb3h2psiY0nr9WrvN6r0OHArN7xh755QFB
         8lGSuw6YxGn+89SyVNgGHaEKGlyMm2ptvDnv9V2ndan+QpCXBQXG2pYerSGEzh6KdcJZ
         zt+XeGSlJaIn4K9XeGlcGhpNWbCno5AICEFg4FGcIjJZwXHtI5Qx1SmpaOH86mKcD6DK
         eLKwOa+ZxrqCwwwW8dKKiULlmMs1AG/DuvJn25K6zg0cwTe6QTXFnGrhMaFqVQ531Efe
         kAXVZFe0iNL2ah+dpRVvsxiQmoIMWtnhhRHGlOKgOB3+15rphJ/b2RK8zGFE3I9x1D9x
         H1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692944; x=1712297744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xc5E/NYDZLjfNoXG7DGNM4m70S/ss7sBgBQIDH4LAuE=;
        b=DjxNL1/c3fj4A3qNWVThaAhVO1kQ7YR+HrhU66aAiUcwJ+d4Rg5FA53C82ziQOxgF7
         QKFsOpIjlaPz2zDhZ0fjoxUMcCdnSt+TJw5tYuo6C3SvTtXrQYgk0Yj5/8Iu3Zo2a2nd
         0eHdHrWqBk9Q9SC0ZDmBrOLmqPeMxaEIJd7zK837kjfkuk91B0ZLHjFxxdteczXRSX/V
         TexkM2NKrk52I7Slct6HdjL3wU7R8NnYP2sIxJMae5mWNkQ09cxyS9l0dXRr9p4dPVJL
         0I4CRh9oCnqvDpNXnLevoo1EXgWF6sOuVjRILE53Wq/hPitLV/TQlwxSQ9G/oSKROVdC
         NzZw==
X-Forwarded-Encrypted: i=1; AJvYcCXj5XKUDmO+vKHZfwbcpPraxL0m40nW9NwaYKD+e3RfKikT7hqpNd391LlyEtEbNtwUAndkYDO2Wd96NwkOsKNCe59qftJ4KG0KhKEmQw==
X-Gm-Message-State: AOJu0Ywp1eD4i5hBp9DB5HGGrzh+IC8Zl73rFhWKnd6UI+SLvxhL+pm9
	aCUgNLJLxbd7ycNWq9WUWCbyeJqqxkqTu9cpL8pcYQhLTmsVptaP9yddq+TCmBOVFWxv0svzn4o
	r
X-Google-Smtp-Source: AGHT+IEePaz2SnD+UFN6/qc+sV/+qt4MnAgsQx6Bz3mfnwBq/eCIcdwQF4nRgtzAAAODjIon94073A==
X-Received: by 2002:a2e:9151:0:b0:2d2:4108:72a with SMTP id q17-20020a2e9151000000b002d24108072amr701748ljg.12.1711692944006;
        Thu, 28 Mar 2024 23:15:44 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 08:15:34 +0200
Subject: [PATCH v2 02/11] usb: typec: ucsi: limit the UCSI_NO_PARTNER_PDOS
 even further
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-qcom-ucsi-fixes-v2-2-0f5d37ed04db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1YXtXW57tTxFBEzDGmlGAr9GqbQ7HEPJ3F4/AfgmRvI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmBlyLlz+21OUfH25DMiB9TiVLwHkYmQEer7Cs9
 JeVTaNTXkmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgZciwAKCRCLPIo+Aiko
 1R7vB/4s3KyFor76g7wvPJMF8SzMLnr0c+3iKrJ2/dnyAVVtjZHza0uXd3JAfyM7xkQ64qlyX/d
 eKvoDtkT/kpgG1HzWkqzKnLmtNDcLAto0XgBFQkgpyrHaryro2FlkhjFmvyKdrClY6jdx7hs5PH
 zyeYcEVDMJEbXNkkQWKb0z+LPL8WqTzy8uW6RMNk9PxB2i15VHpnsmLyMofXq3cUnCZZPCh9bji
 cTvHbHLWHVyHJSNBYQIFFWt96LxHFE/+oxvMjBASU3L+cV1pNpjunhQpbjkjFDYMs16iI+Qy0oQ
 LUa5ESLcRppKHSgyy9p69SJvhHiCvvcn38fxT8J8gAb42Ub2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading Partner Source PDOs for the consumer Connectors appears to be
working. Permit getting PDOs in this case in order to populate
capabilities of the connected power supply in the sysfs.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 42cc1c0e2f73..92886b3b0167 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -620,7 +620,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
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


