Return-Path: <linux-arm-msm+bounces-12508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0169866802
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 03:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CAEBB21195
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 02:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E20F4EE;
	Mon, 26 Feb 2024 02:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kis8M3zy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09BC12E7C
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 02:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708913520; cv=none; b=DnSBT2M9h9hDWNM8xcE5n6YPYg/eTytCBgZBZPIn0yL078KvYrwNCHoxgnJdn0FNHnHMJrkGCqaHfgIZzsYnMQ/Pl0oUu7kzKIoF1kfvx5Ubq2RGhlICBUaTc0tdnMBtIXbHg4u4BgO4TTY40zWEvGOciHBXeL/PcJIhMAcZLqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708913520; c=relaxed/simple;
	bh=WJAciFwr1hQdTciXOJ66qPYz2JQPrCax+6yI1HNHRek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JnwxhYDoyf1fMtb/zh77itsRH1BA1F3Wi1js3o8tcJxpQOeNTjvOqV/RczaWC1hnAeikMTFH2Ro1SaIBxtzHifq6gDCOlOXr1rBIRDGR45FkjdoNCvI3q5CJCakl5oXXjyPaNxGAHFe83tXVLiWHLH73sdGRk5hQJ9Xsar6GbY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kis8M3zy; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-512b13bf764so3147281e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 18:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708913517; x=1709518317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHkrFptKcAQS2aCzc8WX8fmPvNb0p9xnGPcIrFGOzfk=;
        b=Kis8M3zyhz8QoGWTKqF25GAfo8ZzqCXM9hGsad8JYWXDfyyG5CtDKqXJO5aI04Any0
         M+f1ZlSXW/b8tWgJK+QNGzc0QwMeUum2cvTBhBTT0kTXsEx+zNh3Em8SyV5fihNNPtdC
         LcAbLaMTJOVxpMYutkzMx3GzX8mYwEbFEdM4JGBaaWh61XL0TUEhC6Py/ZyEk1oqQIzV
         piP+aqwFTgap/v/1IEh6dky2mKy6uYYToQuorsZ0wWiaBsMvbMlyHpm+uY6GNTrVwxEh
         I6d/IJWzEOX3leHR5RKYqPerL5eJ3HWhTsHrj9PJtXQ9K/CnzGyp31glfyaSH0MqOWS/
         n20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708913517; x=1709518317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHkrFptKcAQS2aCzc8WX8fmPvNb0p9xnGPcIrFGOzfk=;
        b=E9a75j5o2KJCVQoowLXXIpaoDa34oFE6oj8CIfdi/wg/341p2cVBuNLI11V985agAa
         yDTMqweWFCCPW9kPuYpWuPDmlnVYrzSFKWlFlX/2XroT1yRqO0yASZ6js8YnJI2zQejJ
         eXMqSXJH0iMrMSwuhAEO/IW5v45hlfR+HJXaQ2B9PxqsTIpy322Zk+NW+lyI7/YOHsq2
         X3LNrLepdLetr5+WnBPiNv/QvPH5eZNMLf48s5LgTYhUtEtSRAcgeCpWpptn0jmr9tdD
         rG/FYO8bU8OPmNyDMFhkYr2cokKR/nE+2LxIe+EsCLYNpS6tZbE8W3GWXn/uascKlLXb
         YdWA==
X-Forwarded-Encrypted: i=1; AJvYcCUAdHEf95z1Xb4cxngbPfPHdQYD9GCU+DWQqF5c/sAZd0L3+kCGszCrPxdvrQsnaGhmimI+TA3+zWxfN76fehFXneVp/fQ7zpLYkAStBg==
X-Gm-Message-State: AOJu0YykfOvcklhzAryCEoyN6z0uWfoY/VxF887H2Gvx50Tl9VFzOb50
	GgZl8g+jd56FgvdlGRGiTsqXZssg1zvOXe5ChwDnYN+gnqJZclSS4n2zbMMbmwjUiah5xhpK8Vm
	M
X-Google-Smtp-Source: AGHT+IH52ochobAvFKf+WD9za0SwYxt9EWXFefY7/8dMoH9mYPqXj6QRJWC6EpE/aWO39BrHfbLQGg==
X-Received: by 2002:ac2:5dca:0:b0:512:ade9:ab55 with SMTP id x10-20020ac25dca000000b00512ade9ab55mr3320058lfq.20.1708913517088;
        Sun, 25 Feb 2024 18:11:57 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 18:11:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:47 +0200
Subject: [PATCH RFC 11/12] drm/msm: tie regeneration of shipped headers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-11-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WJAciFwr1hQdTciXOJ66qPYz2JQPrCax+6yI1HNHRek=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NiSW1p5kKdo+GZ4dM4rtQKoNKgQiCmFpqNg
 MQvEgRqyfmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYgAKCRCLPIo+Aiko
 1U/HB/9d+h5AEgdqMUN84B6Qw/zOhfMOAfqt+n4aDbrXbDTtSADPY/JTWpB/cLH0SLGWTDosz2U
 aXdAn3/oE9u82nq43lgVZrPEUf3vVcxbNiLvCQIQpsBC0/otnVfunZD9L6C+Z9WrcCHTeKf42wp
 U33HDrRau3WjnEDJSs5mwYCyOm+H3pUzr5uUfjf8OQ2hrThEZ2dr6+QVYpRNnV8uEEZ4w9BWETW
 pfBuRQkqK7BPfkTDnQEQMQBPhZwmVcJPpE/mMpH8WXwIO1uAxYkLQIkaVX+pK5AzJ4o13OufhMI
 OB12UGhi5Bd3/tosxExuNMCPIqWCFgEOdKeYn/UDtkTdpqo+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Finally add support for regeneration of the shipped autogenerated
register headers. Pass DRM_MSM_GENERATE_HEADERS=1 to make to force
regeneration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile             | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/registers/.gitignore |  5 +++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 89c9f5f93b85..a19ad02bd701 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -180,3 +180,30 @@ msm-$(CONFIG_DRM_MSM_DSI) += $(msm-dsi) $(msm-dsi-y)
 $(addprefix $(obj)/,$(msm-dsi) $(msm-dsi-y)): $(obj)/registers/dsi.xml.h
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
+
+ifdef DRM_MSM_GENERATE_HEADERS
+
+hostprogs += hg2
+
+hg2-objs = \
+	headergen2/colors.o \
+	headergen2/path.o \
+	headergen2/rnn.o \
+	headergen2/rnndec.o \
+	headergen2/headergen2.o
+
+HOST_EXTRACFLAGS += -D_GNU_SOURCE $(shell pkg-config --cflags libxml-2.0) -DRNN_DEF_PATH='"$(srctree)/$(src)/registers/xml"'
+HOSTLDLIBS_hg2 = $(shell pkg-config --libs libxml-2.0)
+
+HEADERGEN = $(objtree)/$(obj)/hg2
+
+quiet_cmd_headergen = HG2     $@
+      cmd_headergen = $(HEADERGEN) $(shell basename $<) $(srctree)/$(src)/registers/
+
+$(src)/registers/%.xml.h_shipped: msm.xml.h
+	$(Q):
+
+msm.xml.h: $(src)/registers/xml/msm.xml $(HEADERGEN) FORCE
+	$(call cmd,headergen)
+
+endif
diff --git a/drivers/gpu/drm/msm/registers/.gitignore b/drivers/gpu/drm/msm/registers/.gitignore
new file mode 100644
index 000000000000..2e422e71e590
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/.gitignore
@@ -0,0 +1,5 @@
+# ignore empty files
+msm.xml.h_shipped
+freedreno_copyright.xml.h_shipped
+# unused files
+edp.xml.h_shipped

-- 
2.39.2


