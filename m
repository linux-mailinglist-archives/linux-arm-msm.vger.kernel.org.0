Return-Path: <linux-arm-msm+bounces-10709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E89FA851B4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 18:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E1631F25441
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 17:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9963F9DE;
	Mon, 12 Feb 2024 17:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gE5g76Yk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B6C3DBA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 17:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707758624; cv=none; b=Hlr5UMb8A5ap/vQkdXlx7swnTvrG23UsJwJhw3eqnetRiVKyzouOMzbCVSntiue9+xxGgxX9qkgCz43X2x3ATVE7vf3ikN0HYxsrvivh4c2jN4H83tPZZEBWdNITBKjiJYpoN6lSTO6f78ZpcWxPhQCTcf3c8j0/Pd9HiEvRveQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707758624; c=relaxed/simple;
	bh=52pNEqSEuwn5DVaPZpR57hsW1G8e51yOardXp4pX8Os=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hvZ/bSiZ9kLdfkqxoBvw6TqjMvsbAvLrDQfqOd5pl2VYslAD+3ZhsRB6mkv98cB6189b72RZ2IrPagYzh/8mQv4ZVxV8Xys3sdRQ42b3MWDiU0HpI0vXKeftJy7o7+WtT3V4vSKs/v/x0We2/LllDtoT+utPG73RnKdR/8qIeu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gE5g76Yk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso27532975e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 09:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707758621; x=1708363421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uty3pWlwBeYCvqvC/pIB5Sxpk4aUTdxRSGJPmurxhS0=;
        b=gE5g76YkU8hoKP2ZfHxKNzfND3XYbj10mqvsmJRubeb9wikdW4Vd9cOCtegpA94yaA
         tbTqCUhCcNJmvsOXv0DePLDNbo5T7RCQ0xZkrYl/LutKlPA6IS17yG275JRZ+bITCQZe
         qVXe5Pi7xiVHf5Yc10OOVEuYmjan/wl+dubtM0/9AcRmwKap2n18YdQr4YBu+8LygTtv
         Xe1RULgUxFY0uNlHq9XNNertAavb7fHDgpYlAQjdny9b0ZwV7AWuvix4bXaeHXZgcL/M
         db46wkkVUZYq4Rd7gmV0nBrFoNpqxbFdhIBnEoBkwvDPRPU/pIOPvL0YDK2JxA1rHya6
         qrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707758621; x=1708363421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uty3pWlwBeYCvqvC/pIB5Sxpk4aUTdxRSGJPmurxhS0=;
        b=bwsA3qMnU9D/3YQD0jO39tnVJJqp3uo07yCiWqpIfC7QBAzxyKTMyUwj+EDhJsG8Mj
         jniuwH2N6Ww8c99X1kILkk5zRnXMrwzYtHm0yyeKJUKDZQEFKbpTlTepZ/DNe4f0NYHj
         LlCb7pnUwPbaYb7ikSkji8pmw/vztsQjpI8MW9IhkJneg1hGx24+XWIZpoquK7SXFx36
         PvtaWtyhJXht3uzJjnD4ROe8NaPg1+bTlNGZBX2oW9nV5NpiV9ILvT6QCUt+wmppzRCa
         2BVlXozVmc94YwdlJgXN4sIxTYvzxqL/Zh3Dmi+gBSfsUUcgQxUFbiAuUXbGRivn+c+L
         JGgg==
X-Gm-Message-State: AOJu0YxsdBtf89t5M16xcNypMqIDipLMluLTOXzSlPoAAFD0krkyidhW
	t1CaIt4r5GpVc5Xz6QkMkVNpqt5IiwKrGv2Clbv+z2doki8lrWRMS0xgnE29Eck=
X-Google-Smtp-Source: AGHT+IH1ERa+aHGk6kALO1kl14EvTfQnLXajwVJ3XgjHYlkX8GR3eXrUHtkTSdBDLC1LS7JEMFl+zA==
X-Received: by 2002:a05:600c:5190:b0:411:a596:a2ac with SMTP id fa16-20020a05600c519000b00411a596a2acmr705257wmb.1.1707758620878;
        Mon, 12 Feb 2024 09:23:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXvEJsoikbyMSho2RmvfVQifLYZpPej2+uiaysymB6iF5d0SGV7k+h+Rig2nuU6+de6iG13MKw0Ag4vTDiSpJsiO/zHnUe6BCpOj1q6m3FTF89MV1ANrtQJe0v4X0NmSOOyaHofGN3liGpWzUkevSBRmyLvc7XkcZsV4On8wBJb1fic2ADOBHPU2PxuCCfSHUSlesREPCXSL3RPFUFPg8fSOqrhyVx0vq5OzZ/u+CINE5iZSILr+aCMyxeHENN4NArVcdDjKew6Bdc
Received: from krzk-bin.. ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id p31-20020a05600c1d9f00b00411a595d56bsm954051wms.14.2024.02.12.09.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 09:23:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/5] arm64: dts: sm8550: correct DMIC2 and DMIC3 pin config node names
Date: Mon, 12 Feb 2024 18:23:33 +0100
Message-Id: <20240212172335.124845-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212172335.124845-1-krzysztof.kozlowski@linaro.org>
References: <20240212172335.124845-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the TLMM pin configuration and muxing node names used for DMIC2
and DMIC3 (dmic01 -> dmic23).  This has no functional impact, but
improves code readability and avoids any confusion when reading the DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index ee1ba5a8c8fc..a6663eefd3a3 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2507,7 +2507,7 @@ data-pins {
 				};
 			};
 
-			dmic02_default: dmic02-default-state {
+			dmic23_default: dmic23-default-state {
 				clk-pins {
 					pins = "gpio8";
 					function = "dmic2_clk";
-- 
2.34.1


