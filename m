Return-Path: <linux-arm-msm+bounces-2005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 732D27F8F96
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 23:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EBEC1C20B48
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 22:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0C430FA6;
	Sat, 25 Nov 2023 22:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfiDuN8u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A27111;
	Sat, 25 Nov 2023 14:03:32 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a00cbb83c80so423367866b.0;
        Sat, 25 Nov 2023 14:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700949811; x=1701554611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iaSNLjd6qp2TTeM4lQ0nSQjwYYZEfvjgfhn3UAjO2Dc=;
        b=QfiDuN8uKqiPGC9faoUUMdOx563Qhz6K8URuWInUHZOpD5e6iCo1XzXcjHdr31XT3A
         apiLx45KCrgcxqejUG5xAao32dkNXHqXmz+IuzyR2wJsb0V8F2yC/PsYslgfPMaNKoE1
         u7zR2m/f6BkuVaqTbB2wmThDhE7ZL9sp03NylQF2E1imCgIJjt0zhtcWl8B+GLfTRHdB
         jM1rruf25wwRMOR425Otfw3ZQhXLWRxjC+uNCkGi+/B9pWQV+fa5aZlTasvXgBEfOqQp
         Y5DjjtOp6u8C0aCwGN02KERR280L1aqTFbi6vs3dubP6hzkMrfVF1K0mp2920FdlTwwY
         vinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700949811; x=1701554611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaSNLjd6qp2TTeM4lQ0nSQjwYYZEfvjgfhn3UAjO2Dc=;
        b=In7aG3A7Enc/Se8Z+ER67/6ECZbPiOabFuGlDJe400p5YUKzlDbOQz3Gjc8yC9C3Kz
         dNqXF1wljFOs8CyCEvrJvq9oFoVOMF/oqrH3eRLFt+kM99ortSFIiNLaeDzZZb8mayQ8
         g6dXQNVLHbVC3FDqL2wmlfsCdSq1/ofgLoIljWgeYIk9xoU5v2QwAumfPer7LQjswgc0
         yV2ZH0hD1OOEEpA/TAc3Gy1Oz3oCflj5AJd61d777QRe9JIvOGvvd6kmUJSQW75Ed+3W
         c5P36bHHv8uBo9WCXrznT8nbe2dWXeQx2iGMUwWg8AdD7nzB4WC4XXX0L48iMk4+pfHz
         zKrw==
X-Gm-Message-State: AOJu0Yy3n/Zy5n3an9HSWSvALhcFH+pJO+D3qeFKqTvMy45papqzPJRq
	LvWIDqkDDY22DSm3TDC5SZ/04ByPP9cOR741
X-Google-Smtp-Source: AGHT+IEeOqLqN+RKeb41HFX2rR11Y7Z87AtMIyqBSB6RYdVveIEGxvtyiU2EI1tjJpXeaPwXOQ7PkA==
X-Received: by 2002:a17:906:da:b0:a04:182c:9ea with SMTP id 26-20020a17090600da00b00a04182c09eamr4039459eji.52.1700949810438;
        Sat, 25 Nov 2023 14:03:30 -0800 (PST)
Received: from StrangerPC.home.arpa ([2a0d:3344:1730:e300::11a1])
        by smtp.gmail.com with ESMTPSA id b20-20020a170906195400b009a1dbf55665sm3910731eje.161.2023.11.25.14.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 14:03:30 -0800 (PST)
From: Luka Panio <lukapanio@gmail.com>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Luka Panio <lukapanio@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v11 1/2] dt-bindings: arm: qcom: Add Xiaomi Pad 6 (xiaomi-pipa)
Date: Sat, 25 Nov 2023 23:03:14 +0100
Message-ID: <20231125220315.118922-1-lukapanio@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for Xiaomi Pad 6.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Luka Panio <lukapanio@gmail.com>

---
v2:
Update commit message

v3:
Update commit message

v4:
Update commit message

v5:
Update commit message

v6:
Update commit message
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index adbfaea32343..1bfae1b237d2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -965,6 +965,7 @@ properties:
               - sony,pdx203-generic
               - sony,pdx206-generic
               - xiaomi,elish
+              - xiaomi,pipa
           - const: qcom,sm8250
 
       - items:
-- 
2.42.0


