Return-Path: <linux-arm-msm+bounces-52208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF19A6BD1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEE087A5CB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA7F1DE4E3;
	Fri, 21 Mar 2025 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RU6riQhk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1143C1DE4C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567751; cv=none; b=upqIbroTFuSHolyiTyIRw/FXQD6AgfzqhcO9JglSrrhzrIA2M5TZPRYrF3aukpaywXAdRVUf56a8Nvp/+9KvmmMLMsA1kzSNovNJuIOHY1oZzesQPDvz8IuQf2bTWrv03pr58Jzv5m0jkSJwF303hRvWiJudbviVHQt2XidokEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567751; c=relaxed/simple;
	bh=aDoq2cPAFwpjpI+a6z1ZdwU3wKRRjEG838SxvUMy8+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r+k3urpCEeQCZZTR+mB5h2IxJ+yd575Ex+XoNOz10Fi0hIytrpo/a4TqY5yjXtPuAxfQgWKHb0W4q4ySK3bQxBFd2PbVYPkplgufjXhCw4PcQ0zY8xKcMhNwBXfSo5pRNloYPjgD/YvWdF7WRRPk+vm0d4O0CHnzaRexLK4gZm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RU6riQhk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso20365725e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 07:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567747; x=1743172547; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GWwk1F93k2WjXHD1BSOy5Th8h5+cPNdP8aqDclQzOiA=;
        b=RU6riQhkiokRzHfkg4jhxRcbciVUt+PVs9ODgVp+DEr2pJeqNalpK+T6Vk1Ugwv1zz
         nnA6U2OS8ObNklGDlNC/5KyvfyCAxu+YrVU69L2pbnWgHB52+whVYmmIIEhReD52950Z
         stVaH2zPpqqOFAsZ02zV+xcW1eqNGkg/W2ZmgrtNvnHpKq3f4vQFwGpKfwIKHxN9BMm6
         /b0kRq3j0p7HZcm3AUxl8lXgmlxy7gbH4UEULWjuml8i0kxvFg7E/M7OPfkKyn0zQxtv
         /LngvP1POi5wn7OOq8bgVuQ6ZrsU5jK6AoGH6XX+S0PUO/D4LrlPh5mzG5BkfUaHWsKm
         4glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567747; x=1743172547;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWwk1F93k2WjXHD1BSOy5Th8h5+cPNdP8aqDclQzOiA=;
        b=iBEQ118prqtmQc9xhyYQrLJ4TMXPRugf8P+XmSU+j7guMJ3Lehk65CZELlnSa7saWa
         YXxRX/meFHQ9u1WKgNnNEzb/dzIMI+aknO1UBOJ1IAAiuACgTDXUugAr7u4DT+ORjUv+
         /lSxN7x2YUDeMrCFkOrlSjU7WvNuLQk/DlFsbu/gdG3hZnwxbd6ILh55nDSf/xb+uczu
         LXbrnXmZ3jr6XK7/EmIC8dQCxnz3tzSl01yxPlGPz6kZXMtqkZuBC2GXuvUKpkQXKWbi
         Oel7AtXg2ocNr8HjFWmtUVS0cfNpQ9n7nCDnZyBMOLQAwUo17sAut8UXb7RfOVvavg9X
         kx0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKG1y6UCy304dZypPs96XTSG5UR+yvZQt1fF/aIEJDWHPaY61eQUAZMhZtFmWJurlcv0cXaAU5a8UNciu6@vger.kernel.org
X-Gm-Message-State: AOJu0YzL3Yf3kpKFmfTcYEi8f4Z+v6XuWIA+AxEs6fIHlpdDKTvSuqHA
	Vg8pAT7tobVEIXluZlEDrhDdkCGUY8YDfx2/+SqmKgMDkFbyoHFVTUND8oiNKZQ=
X-Gm-Gg: ASbGncsb21J5r3vBzrIk3uvLhKOQ4dvOXZo2Dyi+4U2um3Qk/bGqWLS0ngvvqhucEde
	/DLD0GMh6QSFhhTGB9KAFfumMxFhgFuWp6NQ4zymGZ6GaedQYXtYPCGjCVvIrP/ew6+QxvTVp/x
	aMvrHrF8NVQRjOZUmPZv8VjqzlHjY3/E4tBL2qr3d9RWRsb4PJrlWQCnft0y5XMki45bT3uyZsW
	er1DjdFT+TyYNnaU6irnBafpNdej/f0xTH+LzDbRP6LhWItP36mLcqDQ7ksVh0rfG+brqVJ0XwU
	UOMjN6dcQgRc+5k/k+wjwbmg8YAez4wP6/dBMHMRt3gp9pQy5g==
X-Google-Smtp-Source: AGHT+IG3s7EumH1UWJRshfI79DTisR3g0LyyvxiIy+Ix/0bn7lyq2EKXKwqHEpE8LdI5qX5z0nDHwg==
X-Received: by 2002:a05:600c:4512:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-43d509f4581mr36639005e9.17.1742567747224;
        Fri, 21 Mar 2025 07:35:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d3af0f3b4sm53206595e9.2.2025.03.21.07.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:35:46 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:35:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: sysmon: Update qcom_add_sysmon_subdev() comment
Message-ID: <77a6b65b-5f3f-4a21-a837-7a4a7e09b099@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The comment says the qcom_add_sysmon_subdev() returns NULL on error but
it actually returns error pointers.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/qcom_sysmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index c24e4a882873..660ac6fc4082 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -619,7 +619,7 @@ static irqreturn_t sysmon_shutdown_interrupt(int irq, void *data)
  * @name:	name of this subdev, to use in SSR
  * @ssctl_instance: instance id of the ssctl QMI service
  *
- * Return: A new qcom_sysmon object, or NULL on failure
+ * Return: A new qcom_sysmon object, or an error pointer on failure
  */
 struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 					   const char *name,
-- 
2.47.2


