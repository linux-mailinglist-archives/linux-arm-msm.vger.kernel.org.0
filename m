Return-Path: <linux-arm-msm+bounces-15672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C7089139E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 07:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 226AF28819A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 06:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246305026C;
	Fri, 29 Mar 2024 06:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXsr+PT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BE437714
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692953; cv=none; b=KFgK7byAC87XIGbJ0Y1E6mlXCtxleLkCUNEbg2dSfF6CYtnSlTv6s/4kV1vrzH57D+/Svr8irMLz/yR6qUZAIiXcpi9VUogfldtPaJmQBRxbW9d6Sb/HAGkzWJT64Pps6cRXhdp+Mwug0MUBLmoNm63eyHgKaiiqmgVudo7tQCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692953; c=relaxed/simple;
	bh=vcAN8k/qAhd5AWrkE59lTd3x26sbLY85MvdZDgX2n5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uYat85xaCK0doKNTpGfViYk8i+rQPi3WZsSAykJLWSuRPudMepPvxV5ujJJXrSGLUEFFMuQtZUzxCccYE3Ny0vvcZ5EKHGqIYtAdpRj1mpzoX1IR9eOC1gLOVMrMxTirJWnR2lmu3iUQXUEWypmghDissCyxqXxVL3dPXbWYf4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXsr+PT6; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d485886545so27423471fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 23:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692949; x=1712297749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ic98WBfAimS8nmcOgz85H93UKGeZiY2SCA6nsjQm3Ik=;
        b=jXsr+PT6yJJwKjqzAVaPewFEHqMUloFH6kaUHfVYZU2SY8+/iXhTkmXtEj7eHXuKCl
         CtAuu10+cwXr12zpRNF1Nya6PUbU2NmW+lnEIfQRpvarpAHtgWxJQvJ8Y9MK1X+wPkC7
         Un9R09gl8rk7m6hqmpntmWSwKfHEmKJkutj4CEkRM325Ticnabb0mAWW6o108nfKkf8u
         UarKhhaPWKMj/HUIWFA3x3xbpn2kQWGx5N7ow/2O76Ulguaz/3FbsXJF7NjpwRTH6uwX
         qNWhp28o0O2JKXQrGwm66KbMQ1GRI5hinH4x7nl+vcYSB4ofyQcjnqttbwUQUs+vTNQN
         VV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692949; x=1712297749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ic98WBfAimS8nmcOgz85H93UKGeZiY2SCA6nsjQm3Ik=;
        b=EqDJp5WE2r6kMWff1BNGRNtAlUC9SIvwHMhZsxZZpKEaVKCWbcbCycktCgMp0xPO8P
         FVK9iXEYNRAmQtHOrMJDhK9s0MZ7CsTwxRgowEB+517ApeNTOe7Bqa6ua7OTgnjW2HMA
         reoa5jxMtgBglu4/mB4WyZyx4DdQFLOPAOM/FceZCktDWCcZxKD/Uxp196h+cdhfMtCA
         RO9ezi2YVbe3lsJLagRYXlPmQshOjD6U6EaxZzBkdr2K8u0t64ocvi7bbcHm6QDOsO8k
         TGVYKrG0wqYAH98vm2gYW+25b0TwFnUEQEsJg176WPOAw0eXmKn0H/4sujJQhEfH3B1s
         aXzg==
X-Forwarded-Encrypted: i=1; AJvYcCVR4rLtZEiyhB8xUA/viECYVtRQXAYCpiowFShhifnwCAImK3SP7Eel6UJvoBLRJ50Uf2DvxoQQ2DD+VukIqzZyU7Ffmpo4kkAwAdm8dQ==
X-Gm-Message-State: AOJu0YxCz6TN3YXkxEmrgWF5CMvE4mak6ezi5TDm2R2+ejiT2HTNiIwY
	FabaAstDmkLJ9eZXpEIeJ2QcO3Tdu4rzNyA2jQtzywZh9CVsGmeuM77PKiRaGNs=
X-Google-Smtp-Source: AGHT+IEFYkb4xSCTNgPAqVSPz+PbQkpovAkPslV+zAyYbPg+7kdK5UTIJTQpBnjSZ5o9T3cZPbmXhg==
X-Received: by 2002:a2e:b904:0:b0:2d4:132b:9f21 with SMTP id b4-20020a2eb904000000b002d4132b9f21mr814571ljb.6.1711692949338;
        Thu, 28 Mar 2024 23:15:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 08:15:42 +0200
Subject: [PATCH v2 10/11] soc: qcom: pmic_glink: reenable UCSI on sc8280xp
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-qcom-ucsi-fixes-v2-10-0f5d37ed04db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vcAN8k/qAhd5AWrkE59lTd3x26sbLY85MvdZDgX2n5U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmBlyNiO9Qu1rh3SLEC8ik2TgVba7ZgDE8JXX5a
 Zu2Zy/bkPKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgZcjQAKCRCLPIo+Aiko
 1V4KCACTpq4/5OhmOM7xLV8GT0LEzymqnCMbTAga9RdLB71GxbIr9PnkzJnio8TdmXzk4rI4Ckd
 oOgkHcXSRxRhiQWMNqQDZVAKLDjiCt0chIB4r8X3NRKjhuSjwYa+WGqDENIDphakc+5eZ2X7iMC
 /LiiMVd7An0FJiI1sZgVgCqi9zGZSvzsWfdEQEOsi7bBWwuvHdF/D1SjHjhA3iuX6e6N8akNpPK
 t3L39Tu4HUxgTDxOxHBc1yD21aTzjJMQG7O/g21wUvL0PcVaWBmIWRrCc/TiLc9Boc3c5g8kOSr
 rcqjbNcc7sh+mvq9qS5AfReVKhM0+E249WTNd6Qenhn0D8tL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Now as all UCSI issues have been fixed, reenable UCSI subdevice on the
Qualcomm SC8280XP platform.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
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


