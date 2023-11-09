Return-Path: <linux-arm-msm+bounces-279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 207C27E69A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 12:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB119280FE8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAD31C286;
	Thu,  9 Nov 2023 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qzpT2xY8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC401C68D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 11:30:34 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C5D2D70
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 03:30:33 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-409299277bbso4828175e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 03:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699529432; x=1700134232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYQvDtaR1Rq2jfedJTX47JK1X6rSYRRgJAozvHJVQR8=;
        b=qzpT2xY8PNfTnVIXVeAY99iw7geUmQTYeLgZ7oMIfteTrGyu4Bk5+Nil5nbgbn6RgY
         leitKkooXM40C2HySXlewJ7K0d94C4RPbfv5ZDhTwW1Myu+AfFAedpINlfMcuB1AZYp/
         DemgdZgw4c9YlE7HH7pABq+bRuull0BDf61vOipa+D99wwefryq6iavIvI16KRYm7Z53
         o08qwobTGs9C1ZK0PG66ygCUNWHPh4l8UCemOVSPp8A9HXvU/hwYUYoC3IEOoKFdd1Tr
         8e6DLZ+rQRF24sq2qSxPtZx3CDbPJ3ajLPbqtz1M7Q9vx1dVqZ+WBAsj/Jvz/eE2Y1Zj
         Rzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699529432; x=1700134232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYQvDtaR1Rq2jfedJTX47JK1X6rSYRRgJAozvHJVQR8=;
        b=PleWgzirikF1x6EUEHdnPfX5chC2tkHtn28+eyuoLI2hZLPdlZZw0muU7lvHWYp4Fc
         MBP+nkjglj83Hg5ehL+u6YyFb5IB2DZO7gTUuAg2T09SBZdQnEGcd0yaVCZEMuat1Ryr
         Q2Dr4owzLMjhP8uLPc5ppRKarBN+78ufY5cmA/DTqfr3LI06Z4l5uh5CD6NYKbuzyION
         35MstpBl5ARlstg3JeJanbYpO83vJFfSzkm92LTkLT6hwz+RzdGt/wDUcDXTMtz9Ry0P
         jneWEaDIlWyiSO12MBijLD9xQXaztnTt1TM/vjqp4+jaLjEJSg5tzXwExAzZmy5NrNEp
         ykLw==
X-Gm-Message-State: AOJu0YwLLI0Gj6XB1E/0qtPTvpdpo5ysxEWYB5cchaVDnYcAShn48rFz
	68Q0XLg2X75soBBe1h04wtcV/A==
X-Google-Smtp-Source: AGHT+IHD4bnvrBtnw0anfkYJuCZ4+DjQZ5+N+cAxubQKJf3E/805foDxpHfXU1cRY45Av8/NMR0E5Q==
X-Received: by 2002:adf:cd86:0:b0:32f:b3a2:c2eb with SMTP id q6-20020adfcd86000000b0032fb3a2c2ebmr3675067wrj.65.1699529431932;
        Thu, 09 Nov 2023 03:30:31 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id a11-20020adfed0b000000b0032d9337e7d1sm7185790wro.11.2023.11.09.03.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 03:30:31 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 09 Nov 2023 11:30:26 +0000
Subject: [PATCH v4 6/6] media: qcom: camss: vfe-17x: Rename camss-vfe-170
 to camss-vfe-17x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-b4-camss-sc8280xp-v4-6-58a58bc200f9@linaro.org>
References: <20231109-b4-camss-sc8280xp-v4-0-58a58bc200f9@linaro.org>
In-Reply-To: <20231109-b4-camss-sc8280xp-v4-0-58a58bc200f9@linaro.org>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org, 
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-26615

vfe-170 and vfe-175 can be supported in the same file with some minimal
indirection to differentiate between the silicon versions.

sdm845 uses vfe-170, sc8280xp uses vfe-175-200. Lets rename the file to
capture its wider scope than vfe-170 only.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile                             | 2 +-
 drivers/media/platform/qcom/camss/{camss-vfe-170.c => camss-vfe-17x.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 4e22223589739..0d4389ab312d1 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -14,7 +14,7 @@ qcom-camss-objs += \
 		camss-vfe-4-1.o \
 		camss-vfe-4-7.o \
 		camss-vfe-4-8.o \
-		camss-vfe-170.o \
+		camss-vfe-17x.o \
 		camss-vfe-480.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
similarity index 100%
rename from drivers/media/platform/qcom/camss/camss-vfe-170.c
rename to drivers/media/platform/qcom/camss/camss-vfe-17x.c

-- 
2.42.0


