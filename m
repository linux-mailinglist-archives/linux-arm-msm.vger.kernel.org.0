Return-Path: <linux-arm-msm+bounces-31436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 598FC9743C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 21:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AF491C2553A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 19:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07841A76A0;
	Tue, 10 Sep 2024 19:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zb7Ejeyp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E281A706C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2024 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725998146; cv=none; b=o1QZ3ejU54oZe81o2CppHzFJ8p6EkGCvcW4WoCoTo7yTZCsQk3JJP3bEi4JerhZFVCNo8hwpnaSe3Y8O8Gb4o0f4wa7KRZlXKUMuY5ke4495JCuOfLGU509xahW/3OqY/6i1joS9ypwpL9cTRmgl1yiA1OMkyb9e8qY4+HpMESw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725998146; c=relaxed/simple;
	bh=SQHIuWB8On75QUniwMi3d1+7+u2v2YJclqur56rL6T4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HjbUYo9hNTz8ZLU8gU5ELXzURVDnWSCBOR976UzOh/wRXE3YmXdyDTZvZZcWvFA/tCsl3dj+KG0+KVuYbuW1SJbOuJawLHZqtU1/zUgvRIK3I6EAzdXgKTvWnhS7R2n1L4Kiwd82D03WNz/Ka3gm2GrtXrZDgtVP0jXGCWuAvAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zb7Ejeyp; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374b5f27cf2so3534517f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2024 12:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725998143; x=1726602943; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CQFJR5ldJg+nMN/ogmBfSjMRxaDfVrcsotYh01hJBg=;
        b=Zb7EjeyppXDcAK8U5kNI84fgK+WEG2zaPkOipGegQK6pSL3J0wS4F4qO2i2I86K04I
         K0gOWximOSqDkBPf1Nm3EEPYQ0M8HUgQkdkuig4d+muBsAYy8Owsw7ch0QI6CpuxQhsy
         X6pISqGJdxGMBBsXPof+kNz0AMiSnxnso49OjbgI3kVfgTaiapKxijChgOZAtZr7c84v
         ccsCW8PljBU7U4/IzhW7yVkxamTrUejtOf4apq7YxhgNr9uIdaNBtR/E9Gg235X3Khv2
         ShY9Ev0NAU6CFPhO41/vP0oVpEa5u/DhViIqSI5++mq0zM+X5HKY0Yd/wxUUvH9Bv1cY
         RsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725998143; x=1726602943;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/CQFJR5ldJg+nMN/ogmBfSjMRxaDfVrcsotYh01hJBg=;
        b=AWnOox61Ov1bo8QZFbXCajVcECjvKHahXzgoZAASKYyR4a6ruhcx42aVjkOWxd0TcH
         rPAj/ujepRnesjbeglj+0skm0za5k1NIY6OnHbHRJhh7f8ER7/OCikx9fH1E6Jfvsf8s
         j6yj/rr8GA3tEaTw4/cOtLBexkyq7O5iYkcMkKnS9Cn/3J/0lt/N6F+YVIkB/zhoV2Mx
         ZtOQ06VBd4lfqJNJprF5S5PQ7SCgNgfV4/zZJNGFD4tN8oAuniPMO7sz4gJLVKEQQIpB
         ubNxx6MQzHq2UZYqGUzWpY/8oxlzGbsZ7t+oaqBWeJpyf9T4wMA1Vp9l64VypNMYaBUN
         aVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmlXusFh3oMIwicZKAov2fZNMu0g4DpaDWwSYKuhf8Gk4FOgKQv90m196kETLzcpH7W1tHiGWD8gtzM/H8@vger.kernel.org
X-Gm-Message-State: AOJu0YwnWTwpZAKHLGcWPPqlCq9dL0ejGu5NCidGGDIMYN44u0u9vrz1
	xFQN2zWGM+85OQEft0fySv4ZrpjYXKHfMCYcjwxRdzqzK6TCzHdPDrlf9DbNkKU=
X-Google-Smtp-Source: AGHT+IHfa7an1E1e45tkw7rHMrJLHbG0XUJoGGSMzFbF9+pV358YwqYsahM2BcKviwirPqbq4V+EQg==
X-Received: by 2002:adf:f64f:0:b0:374:c977:363 with SMTP id ffacd0b85a97d-3789268f0a6mr6925506f8f.24.1725998143221;
        Tue, 10 Sep 2024 12:55:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de262sm9687135f8f.112.2024.09.10.12.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 12:55:42 -0700 (PDT)
Date: Tue, 10 Sep 2024 22:55:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: qcom: camss: Fix potential crash in cleanup in
 camss_configure_pd()
Message-ID: <7883f30a-0646-440c-95d5-937062ce10b6@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function calls dev_pm_domain_detach(camss->genpd, true) in the
cleanup path.  But calling detach is only necessary if the attach
succeeded.  If it didn't succeed then "camss->genpd" is either an error
pointer or NULL and it leads to a crash.

Fixes: 23aa4f0cd327 ("media: qcom: camss: Move VFE power-domain specifics into vfe.c")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1923615f0eea..f4531e7341d4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2130,10 +2130,8 @@ static int camss_configure_pd(struct camss *camss)
 	if (camss->res->pd_name) {
 		camss->genpd = dev_pm_domain_attach_by_name(camss->dev,
 							    camss->res->pd_name);
-		if (IS_ERR(camss->genpd)) {
-			ret = PTR_ERR(camss->genpd);
-			goto fail_pm;
-		}
+		if (IS_ERR(camss->genpd))
+			return PTR_ERR(camss->genpd);
 	}
 
 	if (!camss->genpd) {
@@ -2141,13 +2141,10 @@ static int camss_configure_pd(struct camss *camss)
 		 */
 		camss->genpd = dev_pm_domain_attach_by_id(camss->dev,
 							  camss->genpd_num - 1);
-	}
-	if (IS_ERR_OR_NULL(camss->genpd)) {
+		if (IS_ERR(camss->genpd))
+			return PTR_ERR(camss->genpd);
 		if (!camss->genpd)
-			ret = -ENODEV;
-		else
-			ret = PTR_ERR(camss->genpd);
-		goto fail_pm;
+			return -ENODEV;
 	}
 	camss->genpd_link = device_link_add(camss->dev, camss->genpd,
 					    DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
-- 
2.43.0


