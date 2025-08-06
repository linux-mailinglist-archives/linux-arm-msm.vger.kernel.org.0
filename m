Return-Path: <linux-arm-msm+bounces-67912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E46B1C60B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 14:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE50418A85D3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 12:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4BC28C5A1;
	Wed,  6 Aug 2025 12:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MVZP7i65"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0228228C024
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 12:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754483930; cv=none; b=QtrF04LLTD/0Viu5u/ZI7EgQMhaQPfP8yCjauAY1xWU2WdmKKG46d1Rez5V2HZf244z9gW78Xn7osGUmmd4LTOUU5PdhjqjoUt8A/VPo0WVex9zIMl658iUuKprFucQXcJjZxSjWe45wXTqYNjFnYoAU1j9m6Z/FI3jPdtxT0Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754483930; c=relaxed/simple;
	bh=Eu8xqyxmJT4cy+IkwFfzScYWzL17LKhf3pxRBEd5zMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=seC4JDEqQMc9fRC96Q5emY6nbXWPYDUqiLf5r1r2xm/yep+2u5s0kBimbjT7OSruFtaGYS1LP5qZwdSFIaEqB4VKzWD7NzBQnBykO30rJvKWjBsR2ZXcleY5cKa7F2XIWPo067pE8hfK3p8OMmHjZYI8YUKs+UQX/riNMWZm3wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MVZP7i65; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-af946c07c84so92979166b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 05:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754483927; x=1755088727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iq1dXsHIjnJQgOoLlFKfB9bYrlfRitC3gfcfuZAFbrc=;
        b=MVZP7i65XSbQrAR7rXu3inuUW1Bddbs9ltTsF8SR2YF8vxH8idvJS9C98eHFQozYwA
         yQxU/yH9vpW2JvRKWgh7JBKLTIjyOlh5ZkExISQGhpYfM6Bu3QryCMNwwxafDKg1CmHm
         /P7gDrLyhTDi++EUiPmyMXpIUKjfshgf6ElvZhDLoRMlfE7ur8vhVXvTdlOGACrffXAk
         yC9MSOPCezohWNu33Z0V7xXmli3Vu0o7XKWVCZE3Frv3thqkfD2+NfASDPUqC5mH756x
         qKqZfsq9vxXTtJb42rFKzVobRml97/j6QOdoOsIkxRbCmXasyFXvXoh45CsteyiiTMkz
         ojYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754483927; x=1755088727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iq1dXsHIjnJQgOoLlFKfB9bYrlfRitC3gfcfuZAFbrc=;
        b=buE8nyxlm2Gy01RZ6Qvtxq8DCkpHE2D3rhYZ9WMfbVn9YLPRy8dSJGzrySbbBaYDMI
         jZLwDLQ8478D/jTn8ELpTM7Y6emZkQp3Yy8aS9A7UXcL1zB9CiX3gMkfNIAKcFhV1yhS
         j95QxsHwh6xxVhyH8XIlvDQbc5DxUvywAHI+tp3wX7a4O/oHObVn4ScCov2NpkXcyHuF
         BVgNIWooLTx29uG9CXSdl0eH9D5Ggn65n+IjY5H2T8/ci1tQ43Ov8Paeip0RCndHgDkh
         dtcDkiNHkqA0lvOcHntPOAtBinjLsKjJLGuekZY5xZ+qqXepXtcSvnLS/u3dmtKVyWx7
         hM2A==
X-Gm-Message-State: AOJu0YzVEecCVWUwbeDGS3p5yPWZMX3kkILrGRc9iC25I4H1eaPq6GXL
	IVC3uEhfrvmKTaA/3J7N28WFbifABwAR7+GVYXq3PXvXQ9VkJT+aQEOLCcYdOqaQ6cA=
X-Gm-Gg: ASbGncv9hTSc1S5fZlY1AZBoXS22ObPOFt7Z0rmq4R4Q5kqZ4rJPDVO4BKYyA7wK3ec
	e/b5qFyftwWFYUPFTu6ojKUrig4q5OTZu1xnsuTUyPUvJvjph2rCSRPvkmfaFkK9grrcxzfsOKy
	2oUT8ZHPvaF67dfFW3QhuHELjHFJhtdmHurZzoN6W2LuajgVd0p5JrEgCQnG55A/EMAvCBnind+
	OoXS5NTLHSnOb4kAGUycr8E5rWYQKnzupG9bH5361vxegdASqiSISN86WMs0+5PsGF5GAsEoldl
	no2EsKqFo++adsalnFjoy3JuTWlXmlfx3HAQ+gyAZLQUuql4WJLOEOXykDGJbOSh7JWWrA/JMWT
	kEjlg6tZNaxzH3l85ICkCuYauPrX7ohwnqqc5Azk=
X-Google-Smtp-Source: AGHT+IH1MCcEAYbFWkRzhmxuZA3++Z7ES4Zu+n2T5+SGS8RGQVPQvJUlm5h2QcPvISw4DO4/Z8tu2w==
X-Received: by 2002:a17:907:7e89:b0:ae3:63fd:c3b4 with SMTP id a640c23a62f3a-af99031ce8fmr121559966b.5.1754483927349;
        Wed, 06 Aug 2025 05:38:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c081sm1083866766b.97.2025.08.06.05.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 05:38:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 06 Aug 2025 14:38:32 +0200
Subject: [PATCH DO NOT MERGE RFC v2 3/3] arm64: dts: qcom: sm8750-qrd:
 Enable Iris codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-b4-sm8750-iris-dts-v2-3-2ce197525eed@linaro.org>
References: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
In-Reply-To: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Eu8xqyxmJT4cy+IkwFfzScYWzL17LKhf3pxRBEd5zMc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBok0zQvyzCAYOL7BMZJSO9B6MNXCHo9gjkmhG0e
 Ry42X5ZExaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJNM0AAKCRDBN2bmhouD
 1649D/43FW6NDwKmazwEJrMxnzlc3KeXTnZnUw07I4ESJBiy0o44hxwfLy+qUz638ISoPl6cUbb
 Pu0OMk+SYBLhRjOcMZl/TboRkcdmncXsH15/zZveNm7wO5Cx1fM+odrferMgRhMMF7JRP9N9qqw
 okPLTpatYigUIGGk/ArTpmGKdeA6RV+FnKDA43qENTcuXCz+ZFuvQwRvIF2wQ+5pQ0b2bNG86tB
 Y6z4G8cbcbD8hVL0OkF4KyWB2tg4Gm2bB0Nuz5MiFvf6lUWdcFRsxNjnL7PWqkPZogSQepR0qeU
 +IFCSPSZccr7Kdlyix6DwuMwBHSrYT10W5Bh2nEKJc0o66yunch/eIYDQTBxpyMCVJyYVVbIaff
 vZeyMn09U5g1qSoEJHuZgeLMeyPnr/PGNaFE2nvO1Du1+a9Kz0MyR8qJ2M8CEBCqAOcj/OYaBW5
 6wWxzOJ/C9DiRM3S78OExQp0vf/i44RgQOBWhf+PQi+QnWLjB4IpiDtSfVxcIdmA0tq36FRLB37
 pkHtn4vb4AYYMW14pDYBrjm+R6DRZzQAh2UMjMxUINibUYwYMbtyXVhAXigEu632g8NprkX448r
 10fTazC18qOPvUHaPWk+OhlU2WCEYwEV9gxIbwXcwXRFM5Ui72UgnPv11zqy3YeVQ1LQ+/R4e6G
 aNXF2QZvNbkM0TA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable on SM8750 QRD the Iris video codec for accelerated video
encoding/decoding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Do not merge because firmware (hard-coded in the driver) is not released.

For Rob's bot reports:

qcom,sm8750-videocc bindings and clock headers dependency (will fail
build):
https://lore.kernel.org/all/20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com/

qcom,sm8750-iris bindings:
https://lore.kernel.org/r/20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 13c7b9664c89cffb68a1f941c16b30074816af8b..369623f8e4c921e99532d5e22fe9f0049746ebaf 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -813,6 +813,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &pm8550_flash {
 	status = "okay";
 

-- 
2.48.1


