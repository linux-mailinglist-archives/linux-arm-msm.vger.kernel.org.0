Return-Path: <linux-arm-msm+bounces-20365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD718CDF24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 03:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15FE0B22117
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 01:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDC5BA46;
	Fri, 24 May 2024 01:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQtuZJES"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6BDD51A;
	Fri, 24 May 2024 01:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716513679; cv=none; b=T3PbCCCc9PpCB4qPyISAIU+UwSQyiN5MVe5sXJw6yt3PMW+lix1kouadVt4AhD3ZaeApMmw/E9z204HZN639DZxZIEKC8KsXHFyedpp3ovNtrxSLGJ4eu62H5m8Mk5lfocqwmViydFAk/9hyJYK8uGwBzKCcKT6NEsyWDbM9nZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716513679; c=relaxed/simple;
	bh=1Z73eBht+N9n7NxN/580S4jxexdxxIcP9EpC7/TQR+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYCkmmzoH3gNS4UnZ+L4MhP3vgg21F4LXJIPvHLLbumzucVNWWA34SqyUC4v1MVSSSAGbm/ufTJzrbfS6TH3uM72ukNsqpmmoFKEORd1QeSvrC+L5qrIZbmWfR9UC8goEl1liPB/MhxiiKFFMrSgEbGWz23/mQBQxzYqOdIAvOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQtuZJES; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c9cc66c649so3848602b6e.1;
        Thu, 23 May 2024 18:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716513677; x=1717118477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaXESxCh4+0hFTunQ2ZhDeCO0d9P/VTC/tVCqlwySFE=;
        b=YQtuZJEShqTIB4H07oBjnl+G/3lZJIqZdDyRAJSXbqxVDurmjd69iFlSTqB/ihdXIb
         FpdkskUBobaIIZN+JnjrwofzuoXaOQEexdeydeiWvoVPHUPK6Mw0VUwN1FW6ZfyqyZPQ
         UNr/6kf2ljqxObiJawuiK9DaNmtpN6UOjMuqoHuXz3QAvrP7hTaRDefNNrHStf+GmpYo
         nLTOl9IPp+J3OnV/AOu9HCrWjVcKWzUw4TV5SdY/Nzz2tUF5qzNyKEdOOUAGLLb9Vv7j
         ZbQQRn82FRxj47grOORkNxZBb9K3HjWMRkATQy6g36o/ItRnF/awRfM6sLyFP6eGQElZ
         hQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716513677; x=1717118477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaXESxCh4+0hFTunQ2ZhDeCO0d9P/VTC/tVCqlwySFE=;
        b=Wk7NB7J9DMOXK8jb/9zAg+zUnM3jxobybhJWle9GpbPU3OIsJJVZWhu8OhpYx+y1K9
         19FcIW8aPyzrCs2TqyZeHtu8gh5oy52rWk+SZ0ElxJc8ofsh6xflebugN13206rSAGmr
         UxizvwZmGKMZplhBWJYF+reW8SkZa/jp3MjQco61aMe9vR7GddJ8UwfXFGpbCAdg1BkP
         nEruCGFg1EEuXKZnwN0rSVtCFFIbV54hAqeYQPCU6BPuqZuXrA5sa6DGGeCrE8boFIP2
         ZbnXVv/jmqhR2zeTVGsyug5TpSQhYQ5uxFU5aHkEHXsUeJzk24KiSwazIgCnPa4gUIq9
         tVLg==
X-Forwarded-Encrypted: i=1; AJvYcCUTAas3YXrROg77GFITVMcJN4Uhzvb/TD6J19O5kjfO9IIUR/bcT39jTocKXKCCWWEDC1oA/jXuoZ6K/3tvnaFHvd4L7vkX/kn/VbFjzrGOci/6do+XBQOavELqzEszELXrzs4d/AQtqdo=
X-Gm-Message-State: AOJu0YzSveNajial6zlmqg9xHJb70lcCGIR+gli1ItRviv8eHoRGRQxJ
	BtpvUz+24xWEYaHQ2RGVEQRhfrlMyIjDhLQzGWQMiKTSKCbOzc4y
X-Google-Smtp-Source: AGHT+IEmCWc/f49Sag4P41KMKxQiQklG+uzI3jcSUfBFnQ6rs6H7IG5Fg0W4AiF9UrOMH/l+J4Mj6g==
X-Received: by 2002:a05:6808:219b:b0:3c9:c456:9594 with SMTP id 5614622812f47-3d1a4fb4306mr1467274b6e.3.1716513677059;
        Thu, 23 May 2024 18:21:17 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abd063adsm17462185a.78.2024.05.23.18.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 18:21:16 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/3] dt-bindings: arm: qcom,ids: Add SoC ID for SDM670
Date: Thu, 23 May 2024 21:20:25 -0400
Message-ID: <20240524012023.318965-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524012023.318965-5-mailingradian@gmail.com>
References: <20240524012023.318965-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The socinfo driver uses SoC IDs from the device tree bindings.
Add the SoC ID for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 19ac7b36f608..76e01686e818 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -175,6 +175,7 @@
 #define QCOM_ID_SDA630			327
 #define QCOM_ID_MSM8905			331
 #define QCOM_ID_SDX202			333
+#define QCOM_ID_SDM670			336
 #define QCOM_ID_SDM450			338
 #define QCOM_ID_SM8150			339
 #define QCOM_ID_SDA845			341
-- 
2.45.1


