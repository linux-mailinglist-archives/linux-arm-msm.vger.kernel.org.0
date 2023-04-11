Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AADF6DE560
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 22:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjDKUGy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 16:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbjDKUGq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 16:06:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D39524D
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 13:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681243491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=06OBUIWkgRNV7Fvg7Z0iX+fADdcC3n0Oeepo2lUID2M=;
        b=OS5rhmwCEQsvuX8f/2Z2s8/tYp2W01AZ986tkhgyloPkghelDhzbb7v7cZiaQTNToIvScb
        JWUUljpRKx9ZV7Hy/8zUl6ilMSHDB36/Mx8A/anVO8vI+4SHbzrRHI7DkVn8zD1d7xoLpW
        xTeWezn85/WRuslhwBhZgL5nYyA64ok=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-QocN5mF2Oae81D2Ai1F2JA-1; Tue, 11 Apr 2023 16:04:47 -0400
X-MC-Unique: QocN5mF2Oae81D2Ai1F2JA-1
Received: by mail-oi1-f199.google.com with SMTP id l82-20020acabb55000000b00386dec7a02bso2745890oif.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 13:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681243487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06OBUIWkgRNV7Fvg7Z0iX+fADdcC3n0Oeepo2lUID2M=;
        b=XNH4TJjx+LSXxy7JOKet9waLxwb4ga21+UPpKuvtP7zL/N3RMVRYvVKSGQVpP/QtOP
         X6j7U0WvVyN0XPuMnzr/kxouIs0HBkCm8NhsXbEkoPfDeUbg7L+N3VQRpx/UykgVuEyC
         pcqCbYPuBgvT4PNOaSe1mdD/wVqyPVR3h45SKlzBMrxv5/4bSmczxQ1oR4Fm1OQTe9TE
         wxVbvO59A/xUWqXi+Oe3fNzoBRl3AxUynVme/V2dxIHLj8rB8hoE0pZvjPenBpX40g89
         KA9DbiOwpLnYocxyBq3rsMphx9qvwRBVGeHRMnWVYB2CBQIvYFsbcvWbDHrkJpCUIdts
         3Psg==
X-Gm-Message-State: AAQBX9cYpm9Ci3ct2o4Y5Gy69kr3ZaTv1l5q1epWv2LkxVQWmm+tAjC+
        Tg+x7ebORTydPkUqMxG6qEiotau4YYA7eDhYW5qMAQD9HXAwjj7lsT4i3F5aGtJy4fuwrC0LrIh
        +YOA41WriiEwGpkkcdBflAK12Dw==
X-Received: by 2002:aca:1916:0:b0:38b:effa:7d78 with SMTP id l22-20020aca1916000000b0038beffa7d78mr29040oii.13.1681243486811;
        Tue, 11 Apr 2023 13:04:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZD+96wPOgzlRfj4I6lXSesK7kOUy3JXAhugHSrPi7TfwOOp0WqSjbXkCy45QjGZSt9EBsTrw==
X-Received: by 2002:aca:1916:0:b0:38b:effa:7d78 with SMTP id l22-20020aca1916000000b0038beffa7d78mr29012oii.13.1681243486533;
        Tue, 11 Apr 2023 13:04:46 -0700 (PDT)
Received: from halaney-x13s.attlocal.net (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id e20-20020a056808149400b00387764759a3sm5868545oiw.24.2023.04.11.13.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 13:04:46 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, wens@csie.org, jernej.skrabec@gmail.com,
        samuel@sholland.org, mturquette@baylibre.com,
        peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
        joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
        richardcochran@gmail.com, linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, echanude@redhat.com,
        Andrew Halaney <ahalaney@redhat.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next v4 04/12] dt-bindings: net: qcom,ethqos: Add Qualcomm sc8280xp compatibles
Date:   Tue, 11 Apr 2023 15:04:01 -0500
Message-Id: <20230411200409.455355-5-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411200409.455355-1-ahalaney@redhat.com>
References: <20230411200409.455355-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sc8280xp has a new version of the ETHQOS hardware in it, EMAC v3.
Add a compatible for this.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v3:
    * Add Acked-by (Krzysztof)

Changes since v2:
    * *Really* alphabetical sorting (sorry Krzysztof!)

Changes since v1:
    * Alphabetical sorting (Krzysztof)

 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 88234a2010b1..60a38044fb19 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - qcom,qcs404-ethqos
+      - qcom,sc8280xp-ethqos
       - qcom,sm8150-ethqos
 
   reg:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 1e7982704114..da311c1f2c88 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -66,6 +66,7 @@ properties:
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
         - qcom,qcs404-ethqos
+        - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,rzn1-gmac
@@ -574,6 +575,7 @@ allOf:
               - ingenic,x1600-mac
               - ingenic,x1830-mac
               - ingenic,x2000-mac
+              - qcom,sc8280xp-ethqos
               - snps,dwmac-3.50a
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
@@ -628,6 +630,7 @@ allOf:
               - ingenic,x1830-mac
               - ingenic,x2000-mac
               - qcom,qcs404-ethqos
+              - qcom,sc8280xp-ethqos
               - qcom,sm8150-ethqos
               - snps,dwmac-4.00
               - snps,dwmac-4.10a
-- 
2.39.2

