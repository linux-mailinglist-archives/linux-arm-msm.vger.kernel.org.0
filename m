Return-Path: <linux-arm-msm+bounces-34631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0339A13BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 22:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A736B20F5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 20:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952632170CD;
	Wed, 16 Oct 2024 20:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ni2/0rWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86A0215F61;
	Wed, 16 Oct 2024 20:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729110184; cv=none; b=s4jAQ4FSBzTcWywYRSLLWH4vfo+e9CLgKm5rFnSaVrCXOy6a0WhykX1GzHQZynzFtgfX0TC51YHUNjRza2B/1KUVsfYkkJdVeUK2Sg2hX/aAyCtumdIZhGhfLnC7tfHRJBdPQLRsOixGfYtuWSPNVAlFAdYQOiRIt6/OkyP9YVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729110184; c=relaxed/simple;
	bh=foLlCdogMUXishAbTLy1bmmp2+0BP4fTTuiVey2y3R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRnxmC2zsN2JGBuatP4+tTeo3G7Svw8ZG2sCW2W/GU+IhPrKQMk+tTeQW3DGvThRG6xuWrIFPRuj3OcjPPCvIx5TWn/4DN4mQ1k16Q5EUz80pNBFF6S/Nc7DIhbIHremUyvHzJUlsYYT3fEDcfLRd9qRJn8mU+SN2UsDcQfKmnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ni2/0rWM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4314f38d274so3087165e9.1;
        Wed, 16 Oct 2024 13:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729110181; x=1729714981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNeXsonwMiUdiWY17O7CaaVmxJE/5sGFy3QeXQ1t47I=;
        b=Ni2/0rWM7YEZOoknqz9zv51Obny+Tf8Id2puT2l8IavJpK7XttwKBViASft1hni//b
         4OijMvfE9tzg0VV+dqcV3jCCy/nIYvIxRdfGRaQUew3aIH7P930YffA1yOI6g/NnuH9j
         3BrRYOHYXvrWF1ZSTpZTI2ny3O7yrJbpvLPGetFkAAMDlz9sIZl4QIEvXNNKS20czI7a
         bD4FVazc84U71rZXNF74rBQztGs9Zvnw0nrzu2Iiv7lw2EiZR8Q3nNcNDz5hv7Oo2FhC
         iX7jdNUP+9YAQa4KefXOPD43WfoCuoq3k2Rct4UMWj5CwuxvsyWqY5P+LEwQXqdoqZ1l
         vEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729110181; x=1729714981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNeXsonwMiUdiWY17O7CaaVmxJE/5sGFy3QeXQ1t47I=;
        b=m0QSlmD0VpwY6+G/Uv0YE8aThGnaIyu28awigxHWCA9/EztoH0OwzlllIUkgXgXOdk
         +Sc8a/F7gunuRipy+a3Upvs/4+uwli70KEILS1KhGmKHDwGuuifyjWgyl4aiiVea/7a+
         q62i1esFvoWf2TsaTfozVjJ7icJaMuWZLv+VN0KiNeWvicldAyarfifOL1kHvAD/MI1W
         r1GHROAOOJRk45Xwnn8eKaPilZo08TOYa1TA9sSwQ07kOunZtjYpqBvWXyxbJuT/85cr
         S+SrPN9OFKZ//SKcmzROamknL7r7ZcZznSmIQA8OfGHwoTo85Cmk0tMr/UWLuund8IX/
         Zvow==
X-Forwarded-Encrypted: i=1; AJvYcCUeBv9ffgcY2X1FmEPHA2kxYlFAaUV9v1WD91O02Y5lXS+1ef62PLo81XNoxYq/Pt37C49vJXAy6t07ZiFnHQ==@vger.kernel.org, AJvYcCVLSiQkbWApQ2xtBr5EEa52WwUPuh3LTjFi/Lwog3VyRCA2Zn+eePQSs+UJICmz8kwKuVR7S4lODc3kILB5@vger.kernel.org, AJvYcCX7tK4K+BmYf1Lf4KbpEO8DvQC3Ewuyav5nNw/TTVXtbB1RgSm2QajXgSdAMm+Huz7JypuIQJ8i1+fn@vger.kernel.org
X-Gm-Message-State: AOJu0YxKykAgwCuYNXnUXMtjFQyTikI3J0BldhSc0g/zkS6UVasTddip
	U8N2Xt6d/P0sZ1S/in57EofUnh6frCWUXVLXodxay5CDBQ1LnKzlCaP8Xrk=
X-Google-Smtp-Source: AGHT+IFhswGIf/xP/4ygVD87cFFLmuKxS2SWzfTbW5nTyS+lP0KRoVFqiUKXgCl4DcXTNJT5dFPzlg==
X-Received: by 2002:a05:600c:1c9c:b0:42c:a8cb:6a5a with SMTP id 5b1f17b1804b1-431255df67amr174443665e9.15.1729110180662;
        Wed, 16 Oct 2024 13:23:00 -0700 (PDT)
Received: from localhost.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c55a87sm3942125e9.35.2024.10.16.13.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 13:22:59 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan.Kemp@dell.com,
	tudor.laurentiu.oss@gmail.com,
	tephan.gerhold@linaro.org,
	johan+linaro@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 2/2] arm64: dts: qcom: x1e80100-dell-xps13-9345: fix nvme regulator boot glitch
Date: Wed, 16 Oct 2024 22:15:49 +0200
Message-ID: <20241016202253.9677-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016202253.9677-1-alex.vinarskis@gmail.com>
References: <20241016202253.9677-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVMe regulator has been left enabled by the boot firmware. Mark it
as such to avoid disabling the regulator temporarily during boot.

Based on https://lore.kernel.org/all/20241016145112.24785-1-johan+linaro@kernel.org/

Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 93d90209060c..05624226faf9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -162,6 +162,8 @@ vreg_nvme: regulator-nvme {
 
 		pinctrl-0 = <&nvme_reg_en>;
 		pinctrl-names = "default";
+
+		regulator-boot-on;
 	};
 
 	vreg_vph_pwr: regulator-vph-pwr {
-- 
2.45.2


