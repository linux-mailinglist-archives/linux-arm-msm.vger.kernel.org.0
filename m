Return-Path: <linux-arm-msm+bounces-18565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F268B2313
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 15:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A35DE1C21EB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 13:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CFA149DE5;
	Thu, 25 Apr 2024 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cd46CN/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD720149C7B;
	Thu, 25 Apr 2024 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714052688; cv=none; b=aKFuV4H5xI6KRJHPqkOF6bQuldbzFf9hvsWqsZ6/AOQjitcRJyUnANY75DvSnoC4K8OBs77Gg6Ny2WGxnvgjE4lHeWtR/nUqDfi9tTSzlcExBduBW9eCaYUUyiHy2SAS4GOOBa1NSsxr2ETPx9JpK/MQuVi9XvtqDZuHbBmAM3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714052688; c=relaxed/simple;
	bh=mfhXTx63YRyQApal1fduEVtcjwLjVBk/NUOJZpUC24g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fw+DIly9uHW9Fa5BddOGqggAqhpZWHxCb1bTVlOTJeXBF414um6mewV3ML/WjYoyjOaXVfHXPbdBs32cpnjEol5xj7HhgvE5BESTqyzuNrgs1EIB1lr3B9pP+YhLsV8jFdtmVViGLqTVw/PIEbUehfahxSfbcQrjaoAvHcazfRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cd46CN/5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41b39d38cf6so7270435e9.1;
        Thu, 25 Apr 2024 06:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714052685; x=1714657485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMHh8dl+jDwLvcv5T+6QyHvrz8jMqsBP3Ls5hViJrBM=;
        b=Cd46CN/5XnZmH3HoJ6b1FGaKIDVGZwtu6+NCL6uKJSCcFXwtEZm7fFBXTBSEvrXI93
         8fEPUdbTZvMb4z4Jz3JYCVdRT66sd0STCyEdyHEmgyuNm94o3zZ9DZQkc503S7lEifES
         3OYDrpyYU/XmhgGJGSP667Fd5pBOJaz8f5rIZqzzgiiB++ZJ/7gQUsDWXAM7dE8oUiSB
         ZVu9Jm+2z8xokL8P+ccQzt9c9ucOLpM5BbX71XIlTwgj4xttEdeEHQ8E9g6OpqL06s9C
         I9wNwelTu0Y9FjE9GkBDbl9LPKmT8Gr4ric06c0N3Bv9K8AU4+gDy7Wjlv9efunudsob
         4foQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714052685; x=1714657485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMHh8dl+jDwLvcv5T+6QyHvrz8jMqsBP3Ls5hViJrBM=;
        b=MvronXpNcoZZLWDO10VfXsRhKWm0bodPUCV0AUNfhxswp/FyXgbBwKQw/dUbxMPUsf
         SACh7xsZ3npLKBTJoPaljBViXxqFFEN1bCJVXAl8dZXTakTPBH8TLNoP+6fehR+uMOnt
         foLj1m21Gzmu/eD230dOKISq9Um1u9pSWRxOfiEnRAC157O92wm2GjvtHSzx6sCTYuTb
         kOrISGHdT17+vQdAF9CbLQm9HjJaELCZEEDZvXBTWRqrasHaj53pGywLkAFXuGh2iH9y
         8YtTd2WDZeTrCX5b5erWsk/e9671yiB3PDn5U7OxhTkMS7GwHclf7Yx0ErQR6TtqBQTr
         ZMog==
X-Forwarded-Encrypted: i=1; AJvYcCXwWP/1kky4p+GkuCHbTgIuYpE2OW83xaJBMLwzfwaX755145rBTVSJ6Y6XU3YXiVigDNpFX9Q67gZCiDx96wwHQfYS1Zz9Ty+wAambQwerF1dBgQftt+uzMGJ845cZnCzLNsZk59ZQejo=
X-Gm-Message-State: AOJu0YxKsKMCrxptZJ4EgUFN5mBj09+9FxTQtgAP6dvaFBYiOcXAcmFK
	wMa5K+BRfJnkdhQ6KvXDBl5oXpUW4TKKVTCl7vZTp8R9MclXnRhlcddW8VcK
X-Google-Smtp-Source: AGHT+IE3IcNocrc6Z6xvaosFO1Ai3/6XvgFlHEDAllMt9fsY8O54B7Mmf9WoO6o7NZGzI7CdHWyt5A==
X-Received: by 2002:a05:600c:1e0e:b0:41b:285:8417 with SMTP id ay14-20020a05600c1e0e00b0041b02858417mr3434944wmb.40.1714052685116;
        Thu, 25 Apr 2024 06:44:45 -0700 (PDT)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id bg11-20020a05600c3c8b00b0041a9c3444a6sm11235579wmb.28.2024.04.25.06.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 06:44:44 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 1/6] arm64: dts: qcom: sm8650: Fix GPU cx_mem size
Date: Thu, 25 Apr 2024 14:43:49 +0100
Message-Id: <20240425134354.1233862-2-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240425134354.1233862-1-cwabbott0@gmail.com>
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is doubled compared to previous GPUs. We can't access the new
SW_FUSE_VALUE register without this.

Fixes: db33633b05c0 ("arm64: dts: qcom: sm8650: add GPU nodes")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 658ad2b41c5a..78b8944eaab2 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2607,7 +2607,7 @@ tcsr: clock-controller@1fc0000 {
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-43051401", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,
-			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d9e000 0x0 0x2000>,
 			      <0x0 0x03d61000 0x0 0x800>;
 			reg-names = "kgsl_3d0_reg_memory",
 				    "cx_mem",
-- 
2.31.1


