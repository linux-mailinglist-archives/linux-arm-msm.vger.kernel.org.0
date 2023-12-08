Return-Path: <linux-arm-msm+bounces-3992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A4480A6B6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 445E11C20E33
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F61208DB;
	Fri,  8 Dec 2023 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tA1xbQo6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476EA1BD2
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 07:08:49 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a1f5cb80a91so183626366b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 07:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1702048128; x=1702652928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADyyGGnuyYVsE20DUsH/ImAyYyUEsvd/x7yinUyvXfA=;
        b=tA1xbQo6EvGz+aode6ogAKiBk5vrS005u47YwLVcXhOxRTvx5NsrZ4wgXy7kTlaWvk
         4n/eYRnuqNAUdc8dBwZsHtITWPkNxJNZcM/hYErNZ7Mrk+b+GvGH8l/dt3DxP4Z+AQno
         MFSWlPeEMN7vVMQasS/xsGs4I4GP3ADRAqIMCPzgQdv0hBiFvtPeuXtUMasbXTQXviMh
         o3PPjBpNp9s3icfnDCRqiTQcgcCegoqzh+wE4G8dkuR9UBaREoXrUhNyret8i8uYIU7g
         o2PxAjwoggGszUySz+d9hacmcdxxoOzpMiCNVGV+XfzUxWw1nYuIkMMXXvR8pdarVcrf
         TYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702048128; x=1702652928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADyyGGnuyYVsE20DUsH/ImAyYyUEsvd/x7yinUyvXfA=;
        b=FU1e5Up7u+OhcSHopis5gjPy552Z4jBSZRL0xBDzxuzQUPsgQB3vJOkNwy1VbtwEcb
         /zjGuESAHuGOQ7e45AMgFbgCVkGmgVU8kYi6fl0mLM1vPhSkbR3070gjs6b9ql4It1O6
         38dccf5DNwA2uMkFvqyUcksAVdg2fAWkXPH8qgU1Wg8OdN+CVSVtloXN8BnVSB1dx3zU
         MUtB7w4JDzBMyh2iJZXqQXBLLvrfzjmdRRaIsBI5KYblkCa+uxcltMp87wFFxZ2PXoNY
         wjyydOs1u3jp6I7YFrhUnStLKhsC6ztKGpsdzfZIFbEKPYzNKIgZJyQlMn08pMCg6yFp
         7UPQ==
X-Gm-Message-State: AOJu0YybeFRZW2nPD9PdJVRALh1ytbF+251t80wGfLDCvTuCYJNjMe8h
	TemNH/hOmCN2uhDuZBdmbgq+jw==
X-Google-Smtp-Source: AGHT+IGsSCIr4ijXHWnZzYoOk2/a9DsQsa5DZSvHFnPOefRXTzuE3I7g/8SvqT/wIlriLsyjx/sEeg==
X-Received: by 2002:a17:906:371b:b0:a1d:767:f068 with SMTP id d27-20020a170906371b00b00a1d0767f068mr48853ejc.31.1702048127721;
        Fri, 08 Dec 2023 07:08:47 -0800 (PST)
Received: from [192.168.55.221] (tmo-113-102.customers.d1-online.com. [80.187.113.102])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a1cc1be1146sm1096114eja.217.2023.12.08.07.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:08:47 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 08 Dec 2023 16:07:57 +0100
Subject: [PATCH v3 01/11] dt-bindings: remoteproc: qcom: sc7180-pas: Fix
 SC7280 MPSS PD-names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-sc7280-remoteprocs-v3-1-6aa394d33edf@fairphone.com>
References: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
In-Reply-To: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

The power domains for MPSS on SC7280 are actually named CX and MSS, and
not CX and MX. Adjust the name which also aligns the bindings with the
dts and fixes validation.

Fixes: 8bb92d6fd0b3 ("dt-bindings: remoteproc: qcom,sc7180-pas: split into separate file")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index f10f329677d8..6f0bd6fa5d26 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -114,11 +114,11 @@ allOf:
         power-domains:
           items:
             - description: CX power domain
-            - description: MX power domain
+            - description: MSS power domain
         power-domain-names:
           items:
             - const: cx
-            - const: mx
+            - const: mss
 
 unevaluatedProperties: false
 

-- 
2.43.0


