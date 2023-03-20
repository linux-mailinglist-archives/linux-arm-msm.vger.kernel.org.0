Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE54B6C246F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 23:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjCTWRr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 18:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjCTWRp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 18:17:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8BF828E81
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 15:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679350605;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DO1JoA7rf1NN/v1DlyTM5EYQQrfJrSOpwTi6FaNOaeQ=;
        b=XdA1LsToHEP/LI+pPTRCUqWDYzCcshHBo+ItB4zogABjY6SsGFvUJMkD353MWiEUUsvoYk
        2ZIR3CWyM6zPOauw37MeCw6aZlCePE2+2ZdxPHNYymVQdd+/XwLCDiAcfZXyRMXOPlcvR9
        1tvOCBuVS7/24pbKqalBHWoknSQhvo0=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-qDchPGQIO-eVqMb62c8muA-1; Mon, 20 Mar 2023 18:16:43 -0400
X-MC-Unique: qDchPGQIO-eVqMb62c8muA-1
Received: by mail-ot1-f72.google.com with SMTP id p28-20020a0568301d5c00b0069f851af0aaso28196oth.22
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 15:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679350602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO1JoA7rf1NN/v1DlyTM5EYQQrfJrSOpwTi6FaNOaeQ=;
        b=11Jzv71F2GtJrZYAehMjZLSLywM4JnABgIGdTQCgwgy5HMYnJYyNxDh72D+e2wH21l
         YC5ZMnWh0LCdLv+JU3DIUsBUSsqtbY3e0ddAM7IbWgntBwPLIooUUrnX2yjnPQLozgTV
         gPqBq0RADQBbdPnO/x7l9/PLHY1WcKEEsLdt0dxzCN9+LbJoTRmRK3JRE8vJWuXOfdlw
         Jrzh481vsXMr3sh/5WvA3IGvSukGrwVEqZz4a26AaFn0Iy3sJUd6ca9qvvrTiITrYYN9
         bH8R3zc9bogX0ArwHpyatyZ9cRUSnyV9Q0kYFnnD3K2BLqGpe8lDxFOojG3gIPTvea7E
         iquQ==
X-Gm-Message-State: AO0yUKX8BBqk6U+ptZSknfqvqoNwV+057/0YSSobb9JOC1Bh7Ilx0Fca
        +VWTDLLIZkJ6Kb84QpmOkPwFF3fqC7YpGmJZSj/9XUheWUnDZU/RkU8PUE+NYliqzojc5LzK3Y2
        ZQj99bv8sqOQ/lGOhlSMJXjka/w==
X-Received: by 2002:a05:6830:18da:b0:69f:3fd:d03e with SMTP id v26-20020a05683018da00b0069f03fdd03emr147179ote.12.1679350602141;
        Mon, 20 Mar 2023 15:16:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set+WqeyPEu+9Z1p1lpdrw7AyksGa+7Eo7VAfnk6kC1FQXbmvfF3G9lqNRW2EAEBEJNNTLjJb6w==
X-Received: by 2002:a05:6830:18da:b0:69f:3fd:d03e with SMTP id v26-20020a05683018da00b0069f03fdd03emr147141ote.12.1679350601927;
        Mon, 20 Mar 2023 15:16:41 -0700 (PDT)
Received: from halaney-x13s.redhat.com (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id q204-20020a4a33d5000000b0053853156b5csm4092465ooq.8.2023.03.20.15.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 15:16:41 -0700 (PDT)
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next v2 02/12] dt-bindings: net: snps,dwmac: Add Qualcomm Ethernet ETHQOS compatibles
Date:   Mon, 20 Mar 2023 17:16:07 -0500
Message-Id: <20230320221617.236323-3-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320221617.236323-1-ahalaney@redhat.com>
References: <20230320221617.236323-1-ahalaney@redhat.com>
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

From: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Add Qualcomm Ethernet ETHQOS compatible checks
in snps,dwmac YAML binding document.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1:
	* None

 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index df4c5d184446..154955718246 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -65,6 +65,8 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - qcom,qcs404-ethqos
+        - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,rzn1-gmac
         - rockchip,px30-gmac
@@ -625,6 +627,8 @@ allOf:
               - ingenic,x1600-mac
               - ingenic,x1830-mac
               - ingenic,x2000-mac
+              - qcom,qcs404-ethqos
+              - qcom,sm8150-ethqos
               - snps,dwmac-4.00
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
-- 
2.39.2

