Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC2F16B7E63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 17:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbjCMQ7c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 12:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbjCMQ7W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 12:59:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCCA0C173
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678726660;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E28u3AC299JmAvjZr4iCran+GZMgF1vAVhXdcyHNMWs=;
        b=ZAUC9A0WZ8QkaZ3Epnw/gAOs9Dk6D0DlHr5ma9bmlkNExUQBo5mVhJJGxxFhg3i6bG7FuV
        id22kca6cNjpafiYPSNv0zPAkj6yFHkzNXO/6W7HbX6/ngYEr7V7T7MYx7nn2SssApOY/q
        OIXK+bts1F0WDIPKYukjcqEdrzIkS2A=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-_iSX9VJgPBuvSxCohyTZ1w-1; Mon, 13 Mar 2023 12:57:38 -0400
X-MC-Unique: _iSX9VJgPBuvSxCohyTZ1w-1
Received: by mail-oi1-f199.google.com with SMTP id u42-20020a056808152a00b003845d35bfb6so5657495oiw.22
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E28u3AC299JmAvjZr4iCran+GZMgF1vAVhXdcyHNMWs=;
        b=FpYg+HbhLgXSvggINqpZrXj4witRH03l2PZuwjaMiMgUWea7yZHK+xbDn576X3eWlD
         eXkx23CGI+MnhmzjB4URGv4MB6ocyhOgAobST8qHI2MQkzO2KZg1MdIwGJECy0qSgk9w
         bD9O+QI7IYtCglg8TjfEH8rWKEGGpPzHO4lhHcKh3Xv17yS/KIgZ2Fjeg2YwV04o6dee
         LDwtzIzn6LBoUdGx7c5KFExfH9uYV6ceDFLc+mqOd2rfv+YKeq9sMBg2gNfw7/KFKowm
         p+v8VEbau/cFJ3Ccja7cfYOpwwXSYUsmQ1d0SPMU357REbulqhveXLdL1PwM7300Z/CG
         3SeQ==
X-Gm-Message-State: AO0yUKXgFbUN4XeNY9XXTNrb7k6oTatTsx2eFy6GGFCEqUpkuQPq1s0n
        mJ6Jvjm/CbOigvbzToOdC4m7+fj1TrFmsQZyNAv4hDFCRE8vgqRU3HrVM2wAp6wh2QEWoZPPjjx
        N6ydqDtrX+nyII/d0Uu4Wz5OR3Q==
X-Received: by 2002:a54:4486:0:b0:384:704:9b5c with SMTP id v6-20020a544486000000b0038407049b5cmr15120522oiv.32.1678726658075;
        Mon, 13 Mar 2023 09:57:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set86f0/F8S5PouGiQEFyz9bxsIyQVNlLEzYRDmqmHJ8dbjOt3VXvUOdMwGwjDGA6EL6dvlxIJg==
X-Received: by 2002:a54:4486:0:b0:384:704:9b5c with SMTP id v6-20020a544486000000b0038407049b5cmr15120491oiv.32.1678726657851;
        Mon, 13 Mar 2023 09:57:37 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 09:57:37 -0700 (PDT)
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
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next 04/11] dt-bindings: net: qcom,ethqos: Add Qualcomm sc8280xp compatibles
Date:   Mon, 13 Mar 2023 11:56:13 -0500
Message-Id: <20230313165620.128463-5-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313165620.128463-1-ahalaney@redhat.com>
References: <20230313165620.128463-1-ahalaney@redhat.com>
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
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 68ef43fb283d..89c17ed0442f 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -24,6 +24,7 @@ properties:
     enum:
       - qcom,qcs404-ethqos
       - qcom,sm8150-ethqos
+      - qcom,sc8280xp-ethqos
 
   reg:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 3ca1239da448..f981a89ab2a5 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -67,6 +67,7 @@ properties:
         - loongson,ls7a-dwmac
         - qcom,qcs404-ethqos
         - qcom,sm8150-ethqos
+        - qcom,sc8280xp-ethqos
         - renesas,r9a06g032-gmac
         - renesas,rzn1-gmac
         - rockchip,px30-gmac
@@ -574,6 +575,7 @@ allOf:
               - ingenic,x1600-mac
               - ingenic,x1830-mac
               - ingenic,x2000-mac
+              - qcom,sc8280xp-ethqos
               - snps,dwmac-3.50a
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
@@ -629,6 +631,7 @@ allOf:
               - ingenic,x2000-mac
               - qcom,qcs404-ethqos
               - qcom,sm8150-ethqos
+              - qcom,sc8280xp-ethqos
               - snps,dwmac-4.00
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
-- 
2.39.2

