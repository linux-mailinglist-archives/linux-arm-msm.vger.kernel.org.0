Return-Path: <linux-arm-msm+bounces-1006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 500477EF87D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 21:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE83A1F2510E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 20:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6C645C01;
	Fri, 17 Nov 2023 20:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPRPt3g7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F4E120;
	Fri, 17 Nov 2023 12:17:44 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-507be298d2aso3159051e87.1;
        Fri, 17 Nov 2023 12:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700252262; x=1700857062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKYe02DmJmwFFNmiKnLALvfB/P1IY/5H1knBpaadyWk=;
        b=nPRPt3g7Z/CH1gvKNd4FBLUuA9et40alOtFznl/dMHP3Azw0/68hsCLvqjtVGF+PN0
         VRVuOwkokYcNbQs6Y5q2Ztslc15inOynpPNOWXIA9M869JpMwQr1IzDjo/Hxa4MCvt3v
         xhkd1jIlCW3TuGWfeGNSXvGjQcRW2tTpmjynUNbCFNU1gHAQwBa/Qmz/FHZvadq8P8BT
         YgwQfwEGJGvii+NLZW5wB7w1mvv1nnCOL7ihykypKEG8fSiW6hhTLmTuv0WDPyA+oxfO
         VV0OxwQHbrZwK5OuHYbefaWlvNlWBwyP/8QuUq0CoyXVc2Xq42/8p+IyOREXQ7XyqBbE
         1sdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700252262; x=1700857062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKYe02DmJmwFFNmiKnLALvfB/P1IY/5H1knBpaadyWk=;
        b=IhC+6Hje16Rw+eYnvVBMi6jB5WUurQHhzbBq14ddForiWrEmt+Vj9TYRG9GlQo7C/V
         uFRlPFaLkXKSKEJZInM1WBYK+4MN7W3w1c/4xKC7QdRrkR8wtyhe9aFbh1igjljdPQL1
         IH8gSXOvxjcxvHwlmOfQL0Ned4aL0KvJnd5PI6r/nKxMYkXUQa4VrYJ1DvRM4lwDjg2o
         DUrIz3Pv1/OQGrIbaZkuw7Pk5FJGib8gIbTU2ZSfmCsnRjBxnRGbpLUOjw7JlGvYrIEx
         lDe4O46KRSeU0YhaYm+VXGsprSwcl7Zk7MQeuSfgnyDjvXoYOFjpM/1NiMZ5QIVoUAYg
         Rovg==
X-Gm-Message-State: AOJu0Yz+zW67KJegdq0UgTa7Yst9UxNEC/SQV5LyBqVUoMHoOWHIpGTx
	Me2IZtwbVJPZd6PD+x2Ncd8=
X-Google-Smtp-Source: AGHT+IFe0hmC2VgViHFT5wuAsjrdil67dwDNZQZv0yUV06HkOxSpStTOzG2BPmbrbVMIt2AXxBTN/w==
X-Received: by 2002:ac2:5a04:0:b0:50a:9652:31d2 with SMTP id q4-20020ac25a04000000b0050a965231d2mr451791lfn.15.1700252262115;
        Fri, 17 Nov 2023 12:17:42 -0800 (PST)
Received: from david-ryuzu.fritz.box ([188.195.169.6])
        by smtp.googlemail.com with ESMTPSA id e7-20020a1709062c0700b0099d804da2e9sm1130630ejh.225.2023.11.17.12.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 12:17:41 -0800 (PST)
From: David Wronek <davidwronek@gmail.com>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Joe Mason <buddyjojo06@outlook.com>,
	hexdump0815@googlemail.com
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	David Wronek <davidwronek@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/8] dt-bindings: ufs: qcom: Add SC7180 compatible string
Date: Fri, 17 Nov 2023 21:08:34 +0100
Message-ID: <20231117201720.298422-3-davidwronek@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231117201720.298422-1-davidwronek@gmail.com>
References: <20231117201720.298422-1-davidwronek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the UFS found on SC7180.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: David Wronek <davidwronek@gmail.com>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 2cf3d016db42..192217ea1d24 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,msm8996-ufshc
           - qcom,msm8998-ufshc
           - qcom,sa8775p-ufshc
+          - qcom,sc7180-ufshc
           - qcom,sc8280xp-ufshc
           - qcom,sdm845-ufshc
           - qcom,sm6115-ufshc
@@ -212,6 +213,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sc7180-ufshc
               - qcom,sm6115-ufshc
     then:
       properties:
-- 
2.42.1


