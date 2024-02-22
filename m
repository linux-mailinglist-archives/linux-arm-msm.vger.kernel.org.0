Return-Path: <linux-arm-msm+bounces-12210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADAE85FF20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 18:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDA781F2C925
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 17:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECEA158D92;
	Thu, 22 Feb 2024 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w5FaFJCO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080011586F6
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 17:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708622239; cv=none; b=kHGJLAzuddwjvf0/9ABCv8DKhr+EOo3GyM6axBaz8oQSVlekLIrlYSrHZa/LxBAV6fdH4GA8QvSE7wjgpwOnu9IVYdMDYduBXau5tdxBeXUjZW4OWEumAIVaCCJlAZBUVsbeypvUoY63e6HoVBeFm1U6r0wPAq4eoLlN9ymysfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708622239; c=relaxed/simple;
	bh=4o1+/xiccn6IbZFyFdK5VsobG9GOTyhsglvL8I9FFnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qEI9to2Y586qP4GR4X4tfByDPpLqU95+okLwBgJC/LesXkeNU8k20RLXrPdg90E8rXT/jQUkP6AVwkR9ohF48WcRwrdHXBFhzuNVDAmprUwSOw81y/UBjtsmZCCr4oMSSh5p3KoxqG013adkWoSkfWQ3hVbFG83G+xEpS4p5DpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w5FaFJCO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41272d42207so19720835e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 09:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708622235; x=1709227035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvlvisPT5Ben13N2VpV4ugUj5QGv6luxiD0ao9BxeLo=;
        b=w5FaFJCO9D3RAF9eLMmVH3O+Yto/r9JtGBF+hRwr4fn6LD0Ga9YcnM4c5OIy/ZsU8B
         0Ikzg1yHEe6uLBX/p/EXm8Njv4sWlT6baWKiDSZuOlLUUpvAXjYsyo99OszN9HRvZoHc
         VuNih3CzpHGcn5SV+gQtO2kG+ghLssrYcvm9tgRRvCyLJyipvSUl2zHPyD0qimO5kVPw
         +m4Poay8z1kKhaUM0Ii4XjfkTu2Bao13C4gLVoCyZnRKUI1uDBLmIVoiSbF43s8DLZyc
         qVYaC2/XsLMU4ZM5Pn3cP61aWAOR8Ek05PfQBk+XqM61Ep3RG6m62GEOlItDu9gynIcX
         l1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708622235; x=1709227035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvlvisPT5Ben13N2VpV4ugUj5QGv6luxiD0ao9BxeLo=;
        b=AP4YGDdIhY1uY882MIpck2zjiRLubwRA/L6GT408QFur4klxX6RCZxkLwV9bKxRGO1
         k0CX/beaGRNir1Xjfz9UdbhDOd7TsKIiCoitace7y5d7DqlMHgapdSRUZ1MyI8pw80D6
         cxN3pEYjqP42CU8BUnS2Or4kYyumQw9SAwDCYHXFagdGBkZsTG+wAmyY52oBcv7f8yO4
         bmm9R6eEyXZdSl/3uO8QvOvE89Q3T9WzyYBJboyoPq+v0ZN6FeDpKy3KbKwm/4Rnes+E
         PBJOc9QInkwzT5UM9wa2RJwKVCeBTefSIvasp5gyHvzOcrV9LNVCZSjKNpcGa83uwHf0
         PzjA==
X-Gm-Message-State: AOJu0Yw5yH7/ZLXiRPr6wJZeFuIaI15vXFwPXvaJdlp6qyoMn7xrLQe9
	PHXlA1/ZW1pjY60tkbnqMHv0MCvr0unve6JfNUTKK9ABtj46hHyQkhCf9dFhLCY=
X-Google-Smtp-Source: AGHT+IFh0J92vILaksmRT7F3B/QT/Hprse3K5+Rx3tOAYoCDqO3ED1yTgMeYAb00DS3QuDi++fmveA==
X-Received: by 2002:a05:600c:a386:b0:411:ee70:ed5c with SMTP id hn6-20020a05600ca38600b00411ee70ed5cmr16596123wmb.12.1708622235258;
        Thu, 22 Feb 2024 09:17:15 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id u7-20020a7bc047000000b0040fe4b733f4sm6656512wmc.26.2024.02.22.09.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:17:14 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 22 Feb 2024 17:17:04 +0000
Subject: [PATCH v6 6/6] media: qcom: camss: vfe-17x: Rename camss-vfe-170
 to camss-vfe-17x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-b4-camss-sc8280xp-v6-6-0e0e6a2f8962@linaro.org>
References: <20240222-b4-camss-sc8280xp-v6-0-0e0e6a2f8962@linaro.org>
In-Reply-To: <20240222-b4-camss-sc8280xp-v6-0-0e0e6a2f8962@linaro.org>
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
X-Mailer: b4 0.13-dev-4e032

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
index 4e2222358973..0d4389ab312d 100644
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
2.43.0


