Return-Path: <linux-arm-msm+bounces-26102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8064930C07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 00:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F03F1F215A6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jul 2024 22:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443E0143733;
	Sun, 14 Jul 2024 22:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aoJgT2xo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7516F13D28F
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jul 2024 22:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720997638; cv=none; b=TxJ4WF6iyUGFJ4BBNrcOAG/dB9LTAWfku2uA48WVFuMBPEOI/1GKGVzUfPw/IRPQmVLAFdSs6CNsBb5Zjtw5VJflW2nYoCVehDBg+i9+PKR23D9bXIeJ7Q2vVgJcyVdKvFjUQ5mIPKWz1IyJNBGWES/FBy8U+KshptubCRMBD0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720997638; c=relaxed/simple;
	bh=XFGhcwTu/Mz6wrqwi1h5k63gW/YSFiytfhyYe9UGJXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/rK50DbziUJeHTuVgBlYBh0U3Njk7KjKNmiqLvpP8aINb6LsM04Q26lasiIp/qGqF9Make+KM7bILgm0gB57g3wuB8YOGzZxm/oFHumntVrw/6CA5FNQH/jbbRvcFmHY9hlMFtZo6ivByfeKgAf28Bei/5SM1cCOOsynuIs9GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aoJgT2xo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4272738eb9eso26858055e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jul 2024 15:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720997634; x=1721602434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzeclMxKxNLzIyOYlAy8CqRPm2NMzdjyMjfNK8U4cd4=;
        b=aoJgT2xog0Zf3aw7opTnF63IFwPTKch3CF1EpNyz27Sb5RfIM0EICNENqsEYmuDZOa
         9EdhxSUTJ3hXhyfSK89PEb3bKstJX19Nmv9wJxXsM4t8QY9+1Wt5RvDsQ2E3BYXyELk+
         FmWfmO+D0WKylCYR7YQbeT60NfF4x0CXb41JUA/wRaXG1mwusYNRwoCRoNoKVgzCK5pU
         LftI0OFNSek0nYFrrO175Emy4VJYFeEEatuHPpAjLKE234fM0ib6L86WRGV8xnHXlPhL
         Bwwg6brCnYs30yvnVpzJfxTj8epgAoZuicqdEn0SCdNCMBjr1/8ZsSeTLoZfM0hpGhn5
         DkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720997634; x=1721602434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzeclMxKxNLzIyOYlAy8CqRPm2NMzdjyMjfNK8U4cd4=;
        b=HfFsN+jEchna7sBZEvAWShP5fwn8AuZGxaEg7xeMzcKMzXYI4heBvAyvPEK8nIPC+/
         IduIaqgDMRM86+CgOr0MGrA08VL1SPEsTg2u4msYaogO8PWpSq+j+drZh7oc1HFHpVVZ
         HYSpjGW5Etm8Xda0M+tgvHErsXlqhMhmOSPjS9KLITioVrPLuQxaId7g9gC0CslUsBQZ
         PnBeqSZvOX3NxFVkdBnN/ZC7ti74SX407BZd0uuG1yVoheNsof9j8JFBlolctwxElC+Q
         rlLr+KSQ8IffhEGjjM12HzSLB70OAJxOiFtUStd80BhgbrDTJzEuk+LGqzQLZYtq8rRk
         L5nA==
X-Forwarded-Encrypted: i=1; AJvYcCX7Qwgv2kgJliW4NEp+tiLWwTTTkJ3nfN/ue14WhLiLQc+QyWsQQvQS/lU5u8LGzl6PrDrTPBClfPw9ajEzQHgGEFqLMe8wi1EgW8+qOw==
X-Gm-Message-State: AOJu0YyeEnZcvkVP2HMM1kIHUr260JMNH9qa4fXADUf6Ri2OCHi2Vn2I
	ubIF1KVienFB24SL7H1DBGzCbQbc/fSR1JGi02Z1sj0rSLj33ogdwaUkEboShOU=
X-Google-Smtp-Source: AGHT+IG85V00IMooWyrtdiKFFfGK6QkfieuC3gLw5Jf+m2YrK3JSLDsYd7PsB4evQgrl4Jn0mVna4A==
X-Received: by 2002:a05:600c:2284:b0:426:5e91:391e with SMTP id 5b1f17b1804b1-426707f81a5mr109514495e9.26.1720997633942;
        Sun, 14 Jul 2024 15:53:53 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279dae34casm40632445e9.0.2024.07.14.15.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 15:53:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 14 Jul 2024 23:53:59 +0100
Subject: [PATCH 2/2] media: qcom: camss: Fix ordering of pm_runtime_enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240714-linux-next-24-07-13-camss-fixes-v1-2-8f8954bc8c85@linaro.org>
References: <20240714-linux-next-24-07-13-camss-fixes-v1-0-8f8954bc8c85@linaro.org>
In-Reply-To: <20240714-linux-next-24-07-13-camss-fixes-v1-0-8f8954bc8c85@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hansverk@cisco.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-13183

pm_runtime_enable() should happen prior to vfe_get() since vfe_get() calls
pm_runtime_resume_and_get().

This is a basic race condition that doesn't show up for most users so is
not widely reported. If you blacklist qcom-camss in modules.d and then
subsequently modprobe the module post-boot it is possible to reliably show
this error up.

Fixes: 02afa816dbbf ("media: camss: Add basic runtime PM support")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 51b1d3550421..d64985ca6e88 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2283,6 +2283,8 @@ static int camss_probe(struct platform_device *pdev)
 
 	v4l2_async_nf_init(&camss->notifier, &camss->v4l2_dev);
 
+	pm_runtime_enable(dev);
+
 	num_subdevs = camss_of_parse_ports(camss);
 	if (num_subdevs < 0) {
 		ret = num_subdevs;
@@ -2323,8 +2325,6 @@ static int camss_probe(struct platform_device *pdev)
 		}
 	}
 
-	pm_runtime_enable(dev);
-
 	return 0;
 
 err_register_subdevs:
@@ -2332,6 +2332,7 @@ static int camss_probe(struct platform_device *pdev)
 err_v4l2_device_unregister:
 	v4l2_device_unregister(&camss->v4l2_dev);
 	v4l2_async_nf_cleanup(&camss->notifier);
+	pm_runtime_disable(dev);
 err_genpd_cleanup:
 	camss_genpd_cleanup(camss);
 

-- 
2.45.2


