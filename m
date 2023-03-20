Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 465E36C2480
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 23:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbjCTWSe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 18:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjCTWSZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 18:18:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83DE241EE
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 15:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679350611;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m8h1yVtGIRYCv86TmWwnywGAFGMc0IfZHGCd5EFi+qY=;
        b=FjBTdWQAG6UJ2rkkkzj2khvEFTK5spSOgCAwqgbiDVYMcN9jI1bjryyihUhJPt96lgRBuL
        aFYNPQUomOKiVwesC2sgFVOm5j13/3nt5fTSmzEB7JoxTulzT++FeYAkaLUpyhN5rVtZII
        IPDeQHl13iRZBB6c58FSH8crRskKluI=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-5EW0N2-XPxSVUIPdncwINg-1; Mon, 20 Mar 2023 18:16:50 -0400
X-MC-Unique: 5EW0N2-XPxSVUIPdncwINg-1
Received: by mail-ot1-f70.google.com with SMTP id h17-20020a9d7991000000b0069ecffb6575so4513015otm.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 15:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679350610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8h1yVtGIRYCv86TmWwnywGAFGMc0IfZHGCd5EFi+qY=;
        b=qioqjJV+e6Bm2pHu7MDugxuUKwm4TM+i6S2ypX0aWMjTdsz5XIktznr3ya8H4U3UVW
         mcmcJ3Rccx8O3HGsDBtcJmvxAT7PNeRynBHmTWBIbniXFAbTifOXyTdWWX8RIYZdgV/U
         Ol99qpFSRkSFGj/Mrz0B/YTU2VrsLkvWrSYeM/w5FzHFEj0U+dkLAgzizS7MkdnWtZ7r
         2chP7tTFLtnGeRVO3YlcYRv0fAYgmt0uoB/RW36uBvGFMqdzHS24owZrriCkUYN6r0Xu
         CKT7IbnmZstlHwU9ZbT7vNcUfbklhHbYfztZGeEDyALHIv0ATkKviBoEsZIV7QQ/FWUU
         GJJQ==
X-Gm-Message-State: AO0yUKWuuOpazlJvfIsOKFxrXhn/xY8YIZ86LzMJjoZ/qYcd/Mtdyaag
        SoeB7lKvTjQhmvykcccdi7L6/Lb70D9fG28xxDvWt61wqavwQvDSPsjpClltHA37J0ckyQAGc60
        ENxoaKyGbV5GeAvPNGk8JylYhBA==
X-Received: by 2002:a4a:5542:0:b0:53a:155b:374d with SMTP id e63-20020a4a5542000000b0053a155b374dmr685655oob.8.1679350610067;
        Mon, 20 Mar 2023 15:16:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set80mYX1kNXjhJjOyvPX8zlLH3S+WOhJullh4gLdq4GbTimB670heulSoes4VBClqR4z4JvI2g==
X-Received: by 2002:a4a:5542:0:b0:53a:155b:374d with SMTP id e63-20020a4a5542000000b0053a155b374dmr685637oob.8.1679350609842;
        Mon, 20 Mar 2023 15:16:49 -0700 (PDT)
Received: from halaney-x13s.redhat.com (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id q204-20020a4a33d5000000b0053853156b5csm4092465ooq.8.2023.03.20.15.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 15:16:49 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, echanude@redhat.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next v2 04/12] dt-bindings: net: qcom,ethqos: Add Qualcomm sc8280xp compatibles
Date:   Mon, 20 Mar 2023 17:16:09 -0500
Message-Id: <20230320221617.236323-5-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320221617.236323-1-ahalaney@redhat.com>
References: <20230320221617.236323-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sc8280xp has a new version of the ETHQOS hardware in it, EMAC v3.
Add a compatible for this.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1:
	* Alphabetical sorting (Krzysztof)

 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 88234a2010b1..c60248e17e5a 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - qcom,qcs404-ethqos
       - qcom,sm8150-ethqos
+      - qcom,sc8280xp-ethqos
 
   reg:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 154955718246..126552febe7e 100644
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

