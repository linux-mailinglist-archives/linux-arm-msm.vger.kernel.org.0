Return-Path: <linux-arm-msm+bounces-28031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEDB949AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 00:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 657D7B209E0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 22:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11B7170A0D;
	Tue,  6 Aug 2024 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+yfIpi6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6A316FF48
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Aug 2024 22:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722982333; cv=none; b=O0llh9WhBoynSIitIOCp3qUaxqTxQkE+skS7dIMDw0OBihHvQIdU3wjHpZBl6PyKVg1LOCzZzOYKCvswD+MkZ9vEB/TdSm6/eR44mwjKXTc9Jv4MV2K1qxwzbijfydsO1ErZnvGQU/jMyEtToXTSbVg52B5EG3XMH2Vv3xAYhu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722982333; c=relaxed/simple;
	bh=5aJc4EHpj1vONHQREXTuOWOsMSgpiahd582rZLbutcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rugqbzPY0uAIFmXZxx6Uo3dIqmMoIuJ+Sk5rqXU328KeRxDmZqWUTrdv2XiWCUVw9d0+ZDt9gn11RtF9CLVzR9qSzcm7k33fm8OtIf42rmkD4tQdnLT5nMQkHH8OK1DPauYsdLwBpKyQFDNXTdOpzxSECoKO9tCmgTYRdZQS8GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V+yfIpi6; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52efa98b11eso164347e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2024 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722982330; x=1723587130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLn7OVhOIMRd/L579K/B7JfPiLgZys/OGn3zlhndMAQ=;
        b=V+yfIpi6R8wAgJcl6HD/Tf5LAwNYgtsj7AfImnUCCGgec8tlOHvd8C7Xd/IEfyQEpN
         6wihCA6DMrCPR6IX4IoxrvVF7mA2mcRI11zcNYLU4ozWQuUslaNwiK0V6tHy0jWYmWQC
         z4gzk1x/dkukNZtcIhX+gwUw2bcme2760Il07cQjAoX80KnuJLQEm5kDQ/TDUONc9F8s
         ORak852oSMkknDgAG7vJjU8cGRaUoSYLT9HQqvCPCCsoD+YzrIsdhTMC3Gc3yJx7ut1H
         g/F3yDTzCjwczEeos2/cQyamdpfs+qT02YK88Elz+akgvMHI+OjXbm+erWhqvSoWYcvw
         Hjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722982330; x=1723587130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLn7OVhOIMRd/L579K/B7JfPiLgZys/OGn3zlhndMAQ=;
        b=YHDgX2WFyZ9liNKFa9t3rOtX7BMnON/rndfgUgBrRL+LIPOjbR+0IJKFa9So3i3QIC
         0ov08tG7NFc0tyYM0M3mXU+c4bqJm8Fhc3nk8imKVJVQ7b2AF/zA9XXQl/TWvbotH8v5
         t33PG5WQAXQVfl9+ktRoFRPb84Wv4Xe1hjvovrX1OSe8pQLk0ioeE+FgsWU4DNG8qAt/
         cheKgDJ+2JfqR9Gh8Y9y+TSn7Kla/2TLa4m+vSMB8Ii6MWA1LYfeS4hmLF6mDcJPPoJ8
         lh8XhKsqpiBNAQNvcqcqj8omu89rB7i+1bBdbmftK83jUeqOIT4KQDeh6U0nJzybtfU1
         6+hg==
X-Forwarded-Encrypted: i=1; AJvYcCVtk7QUv1FI5icHWBUqHflLWEK+vT240PSvMqVbGLp/JSjXqHnN/kF14XAFA74BPc043FUT1emZfVqE+AV+@vger.kernel.org
X-Gm-Message-State: AOJu0YzbNeJ5uWF6a3ErH4LtCSrMHpChnybTlrtDbonL0SepqGR6QWP5
	DG6R8FOINf4mdNqxWR+vmsNlm6jvsqOilQAAkyWYbG6lj7b6Sz79/hH5J2bGpgs=
X-Google-Smtp-Source: AGHT+IFEx99eut+K85G0Of7/hdM4QziKPyBHUCtX6nuQ2eIenUQKbjMcNELUhhJCJfd3dC7rHeDZYA==
X-Received: by 2002:a05:6512:39ca:b0:52f:3c:a81 with SMTP id 2adb3069b0e04-530bb36e47dmr5886196e87.3.1722982329983;
        Tue, 06 Aug 2024 15:12:09 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530de465863sm3012e87.203.2024.08.06.15.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 15:12:09 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Todor Tomov <todor.too@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] media: qcom: camss: fix error path on configuration of power domains
Date: Wed,  7 Aug 2024 01:12:04 +0300
Message-ID: <20240806221204.1560258-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a chance to meet runtime issues during configuration of CAMSS
power domains, because on the error path dev_pm_domain_detach() is
unexpectedly called with NULL or error pointer.

Fixes: 23aa4f0cd327 ("media: qcom: camss: Move VFE power-domain specifics into vfe.c")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 51b1d3550421..aa894be1461d 100644
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
@@ -2143,14 +2141,13 @@ static int camss_configure_pd(struct camss *camss)
 		 */
 		camss->genpd = dev_pm_domain_attach_by_id(camss->dev,
 							  camss->genpd_num - 1);
+		if (IS_ERR(camss->genpd))
+			return PTR_ERR(camss->genpd);
 	}
-	if (IS_ERR_OR_NULL(camss->genpd)) {
-		if (!camss->genpd)
-			ret = -ENODEV;
-		else
-			ret = PTR_ERR(camss->genpd);
-		goto fail_pm;
-	}
+
+	if (!camss->genpd)
+		return -ENODEV;
+
 	camss->genpd_link = device_link_add(camss->dev, camss->genpd,
 					    DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
 					    DL_FLAG_RPM_ACTIVE);
-- 
2.45.2


