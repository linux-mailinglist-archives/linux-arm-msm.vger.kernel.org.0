Return-Path: <linux-arm-msm+bounces-1005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F32577EF876
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 21:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73C3EB20BFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 20:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF5845960;
	Fri, 17 Nov 2023 20:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WM4mNR95"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827D798;
	Fri, 17 Nov 2023 12:17:42 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9dd6dc9c00cso342811166b.3;
        Fri, 17 Nov 2023 12:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700252261; x=1700857061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Mh5GmUMcq2xfhCvIc2otm0+eXXAz6VhZC+Ozpt2Su4=;
        b=WM4mNR95UbfVbSLhtb7pUnkgG9lMyzPXSmYHnc+JwbIETkXAp71t8GW0QkVN0b8gO3
         Sg6Xe2kz0cizQRHm+S2iucdEa3BqrbaB6WG22bTeP7peBrAxWrpsy0UWMMRX7UXXXkhL
         mnNybEdDHREZ5saH2W0VyJmn7hClFKhlB3Q3gFulZ5m+ah5MxpPIVYr+HbxpHItuMft3
         PJVH+JM+wjif4Kuyu1RS4BDZUYPc+eRfInM+wj5mMNOJUNxpzI148FyhNxks+9y+KpKm
         QryOxu5hKf2MCeqAQrXtJRmM7mvF88E+avdyR6QQQyWUNbw/rcg7rJidhmXvVY2Mueyo
         pwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700252261; x=1700857061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Mh5GmUMcq2xfhCvIc2otm0+eXXAz6VhZC+Ozpt2Su4=;
        b=UL2fhLxzaSJ+en+QrvYvmschWNzblFKft1pudxhohYjca21WXgmeVrlI5mFKm33WWM
         L/ZAM+TO2yMcogFcbm+cpsHC5ojCRd67HUJ2dn4XewxqpRP/XesgYE73EpYq2ndMQ0oP
         oWtsOYCJ3fJUMOPXezi8YRdC7AglW5jLOAEPThxvfFzFkR2Eg0rDaKvcJr7/z7wVs+4n
         n0EhJSzBh/l2VgOu5UQdSB4KoQMlPekLWXUrI1bW1BhMaeQIA2Ev4eTCR4phQ1KuIe2P
         HfZrgJWjUL+3bQ1RGifpEzlGL1mkRKH26+msNRqwbAH0neXuPEowFQf6Bz9Pm7WvSwp7
         KVcA==
X-Gm-Message-State: AOJu0Yw8tGosV+o+OB53GJdB5LwEiZiN22V3o4ouDMznVogsHN16KUCx
	KPobdCzoB1O/uWVxpSHwqzk=
X-Google-Smtp-Source: AGHT+IGFzp2Kl4BlUBu0DsBtf5SxhIfiMwmtI/zKfpwfYh+MiaGXrNybPT6oMqvJfjF7buYlsRWgKw==
X-Received: by 2002:a17:907:3ac5:b0:9d2:5cf8:e61 with SMTP id fi5-20020a1709073ac500b009d25cf80e61mr136676ejc.35.1700252261003;
        Fri, 17 Nov 2023 12:17:41 -0800 (PST)
Received: from david-ryuzu.fritz.box ([188.195.169.6])
        by smtp.googlemail.com with ESMTPSA id e7-20020a1709062c0700b0099d804da2e9sm1130630ejh.225.2023.11.17.12.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 12:17:40 -0800 (PST)
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
	David Wronek <davidwronek@gmail.com>
Subject: [PATCH v2 1/8] dt-bindings: crypto: ice: Document SC7180 inline crypto engine
Date: Fri, 17 Nov 2023 21:08:33 +0100
Message-ID: <20231117201720.298422-2-davidwronek@gmail.com>
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

Document the compatible used for the inline crypto engine found on
SC7180.

Signed-off-by: David Wronek <davidwronek@gmail.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index ca4f7d1cefaa..72aaf9d99b91 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,sa8775p-inline-crypto-engine
+          - qcom,sc7180-inline-crypto-engine
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
       - const: qcom,inline-crypto-engine
-- 
2.42.1


