Return-Path: <linux-arm-msm+bounces-13966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E159E87A207
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 04:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D86C282DCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 03:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE341119B;
	Wed, 13 Mar 2024 03:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vq4sTN5r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6914B101DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 03:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710302066; cv=none; b=lpjTIWncCwruMp1QBrB7n0kBwg/KN5A2OXLrjaviGqR5LXa2VTYJhPSsyj+m/Rpz/AcKXz2ibwWRl6n70H99QiTH21saKBQvX2NMIlosSCughqYWTHB7a6V8NdC+HsuNx+rrKpSBSN1+781t6BahgwLpfX12EXG82TUSbvzdVmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710302066; c=relaxed/simple;
	bh=5qUUCTMFfwh0GWLizFk8xctUPdAHmp89Ki8123ktN38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k0vcAiY7dB/sLVJNKGR0lP3+qaW0soMpO+NHN3Y7MLxropIvdLiMTIpDVpbkkr1qhXRHMO4ffKEWdeeyhwJIsvvj6vQrs+oPwaGPH0gm0O9X++H4ZV/pPjlShYcCRN1TgVWaa+C1wFxWB0Uap/njx3yNcQ4T4iE/JTySaKWd4ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vq4sTN5r; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d27fef509eso101134421fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 20:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710302062; x=1710906862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLTPq66GU+FLbpH3nyuA9I8IqdpbGC/dXUxjJTbbTFU=;
        b=Vq4sTN5resfoKl2ZP0jIXXTxe6kN5nrkl2+af6Nd9sXill94EtJYPjSO7fsRitsmiV
         f6CvorYT9NujrGwI/6V4vJBc4jRpDHyYWGaw5fUgS9ITYobFPQ8BXMlhLQ6iP09cTUMV
         NTg88+KUuYj45Qm2ldzBJK9lvWFJ8WLfgOgERsrc3R83nNSygF5h1gXY1pX5KhDx6Auz
         XUCrzteGKc5oZoH81wGcbXyd3MpC62YrKWWJ6bz3SrNEntu3uKa11D8AepEAXzYYUf5P
         1H6a+fVGfQIIV6GbqRtuNMxOwIVUYd3jd9ik0STnHB4jTUtxKxN4vdYk6YrVrsnLCWJ+
         iiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710302062; x=1710906862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLTPq66GU+FLbpH3nyuA9I8IqdpbGC/dXUxjJTbbTFU=;
        b=i4qZQKThIpu/z1Ewq+oz2LPHO4Dp+HZGwWix0qYdi5SGcuJrDJ2KeLiNUazOQnRRhz
         t5T5jxEGHP5q0RQ6B5WTJTwyNHWlZGZOOePbWHVlE3xfNrPAnF38JOlCo2Gr3a4xvC20
         03jamXHKjVzWbikd6tK1Jeapm2hexXufXtGsjFAdh1C5GG5N8ciRWGKV+NxMx/5kjtXy
         fMqwI+wcj6IaiV8MdHevH8/Dws7bOpA6P+oRnAXLBw3AU0PuFnT9Edz5l+tjmm4fzN3z
         SjQpJqTvrrx7MZdVk5Bah9Lg8zC8dHsCO97yyk/iqiBBoIu81hW+rXrRJM3HH1U4LS0N
         Ct7g==
X-Forwarded-Encrypted: i=1; AJvYcCXy6m0zqOC2BubJGPEY2NpzrMQ7ZSbBArzWTGoyRPUY8SY2/Xus3n94zpX6ufSH0EMmlI0nlwEX3u7+QP5jRVTKKQia+8kiNxFuK4JDjw==
X-Gm-Message-State: AOJu0YwRIJpJ0WjGJUVYcebEZg4K1/a9nHhXCeTMeL69hVoGo7FUhsiC
	6toE/V7ieoRG6cbTyeyYcpYtzhy7+lmuUWW2nHGi2W74YS1qFs99PF0wxEs17II=
X-Google-Smtp-Source: AGHT+IF2gIO8l89DhMPUZnzCGqhK82MhP/4ZMa2FOkGWNOMjWcfpe6eVq0PlHpm1K5Fom8nIThZywQ==
X-Received: by 2002:a2e:7812:0:b0:2d4:142:488a with SMTP id t18-20020a2e7812000000b002d40142488amr7666840ljc.8.1710302062209;
        Tue, 12 Mar 2024 20:54:22 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a05651c02d900b002d0acb57c89sm1854319ljo.64.2024.03.12.20.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:54:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 05:54:11 +0200
Subject: [PATCH 1/7] usb: typec: ucsi: fix race condition in connection
 change ACK'ing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-qcom-ucsi-fixes-v1-1-74d90cb48a00@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2257;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5qUUCTMFfwh0GWLizFk8xctUPdAHmp89Ki8123ktN38=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8SNqd16wpFUFHQFpmCrx+aM4x5e+9Cbg/SwXy
 EdVo+IYGxKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfEjagAKCRCLPIo+Aiko
 1UjFB/4vxPjvb5YNIJgzQJVuz/WdW4MrD6GzN/1jhebh/IPO9C/nP43s77XTsN73+OTlfVNgKj7
 KRzqBz1ESGVxQQxhe/2KfA1S5ijpxK+egNcbul3gw/oqD+nGfIZhPoHp7k6GhiX8akiKxqn27LC
 iJm920Vq03Of8/X5T8XaKKqmaZ26hpUvv9x0bkBWszW0edyW/Nbyj4Ad4nUiQaFlmVS/e7RpQcK
 Z7HDoO+hI6Oj3xqrjlFHLVrxkw2ozF+vWnWoYPI9QENjgV58QiyN1B+zRyyTNVaIXyrZkuhqa2l
 FS4ARb4RRh7dauequb0u/GYKVmA1E3ZUQZmDS9/GMRhM9S1M
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The code to handle connection change events contains a race: there is an
open window for notifications to arrive between clearing EVENT_PENDING
bit and sending the ACK_CC_CI command to acknowledge the connection
change. This is mostly not an issue, but on Qualcomm platforms when the
PPM receives ACK_CC_CI with the ConnectorChange bit set if there is no
pending reported Connector Change, it responds with the CommandCompleted
+ NotSupported notifications, completely breaking UCSI state machine.

Fix this by reading out CCI after ACK_CC_CI and scheduling the work if
there is a connector change reported.

Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index cf52cb34d285..4abb752c6806 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -61,12 +61,28 @@ static int ucsi_acknowledge_command(struct ucsi *ucsi)
 
 static int ucsi_acknowledge_connector_change(struct ucsi *ucsi)
 {
+	unsigned int con_num;
 	u64 ctrl;
+	u32 cci;
+	int ret;
 
 	ctrl = UCSI_ACK_CC_CI;
 	ctrl |= UCSI_ACK_CONNECTOR_CHANGE;
 
-	return ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
+	ret = ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
+	if (ret)
+		return ret;
+
+	clear_bit(EVENT_PENDING, &ucsi->flags);
+	ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
+	if (ret)
+		return ret;
+
+	con_num = UCSI_CCI_CONNECTOR(cci);
+	if (con_num)
+		ucsi_connector_change(ucsi, con_num);
+
+	return 0;
 }
 
 static int ucsi_exec_command(struct ucsi *ucsi, u64 command);
@@ -1215,8 +1231,6 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE)
 		ucsi_partner_task(con, ucsi_check_altmodes, 1, 0);
 
-	clear_bit(EVENT_PENDING, &con->ucsi->flags);
-
 	mutex_lock(&ucsi->ppm_lock);
 	ret = ucsi_acknowledge_connector_change(ucsi);
 	mutex_unlock(&ucsi->ppm_lock);

-- 
2.39.2


