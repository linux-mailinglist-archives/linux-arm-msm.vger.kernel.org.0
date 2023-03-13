Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87A006B7E5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 17:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjCMQ7R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 12:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjCMQ7J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 12:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF956A7C
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678726646;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HOcsF4tnS6k1nG+I3+/hCEkdwUCH/vj5+6sHXcjYo8o=;
        b=MSigK9y+PXNwYVOl5gfN6kZyK/tiLy70PyI+mGuFnTDVKAHfuRLkz53nh9Hz4XFkEWT/HR
        VN3Vgf0Rd9TfO3Tep0zhnBYRLbTONMc9Nc3x/HDpqfSzexIZ7SkOwElH2pJew1LaWL2rLo
        BtZGP44jhTe7ZxiwJlChrYC0IZ1viI8=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-s-vsKruoNpeRTJljOV9AjQ-1; Mon, 13 Mar 2023 12:57:25 -0400
X-MC-Unique: s-vsKruoNpeRTJljOV9AjQ-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1779d667819so3065889fac.19
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOcsF4tnS6k1nG+I3+/hCEkdwUCH/vj5+6sHXcjYo8o=;
        b=Pif0H0aEsh3RoQXQDNYZ0XUwnV23Tqbhc5mDZIeF3bWw43B+sqb+U1csfwHpl3XmZi
         pntex3REQYB1Sl+8cqYMDYzjTDmgB3511pP4zEsykKisTxlSKodMjfGBb59lqgl493Mj
         JDQ2y4Q9BQ9HAW4LfG4ehnhJ3jzuyBLkZ7HRwS3rAU9oICjlALQ+xc5fmmuVTjDMxwPX
         Q6ctrrBfjMafoOKv4OLmCZm4j3i8p5fPdfVWYlWM6YR6/ZneCjvf3YnY6n1wMH5JfLud
         n762jYRmWxiRyiYsGkavfw6QXUVpFIhZ9uOw85itDeAyfWuxy03H3CI2PHSZ3Y3PO1Xt
         r+Vw==
X-Gm-Message-State: AO0yUKWIZf1WJY6Xo6Mtbk3HiHsGGPeidf6feYQl3zh2P1k46SB57lKu
        x0hUJKX6y/vOVULnABIcH/Li+ADzpC3ItNM6ZH1OwCQCwGznDbIRF8UJhWcPD8YK9s7j5Bt2tBC
        mi9lB70J6VfDDFHfP3OHHfgsarA==
X-Received: by 2002:aca:190f:0:b0:383:caf3:a30e with SMTP id l15-20020aca190f000000b00383caf3a30emr15249966oii.17.1678726643037;
        Mon, 13 Mar 2023 09:57:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set85oH1vWCZvr9VmhYS81pq72TuOP89pm0eNesoHATb65m1WlepR/ukthKK/bKkyu3w52zg7AQ==
X-Received: by 2002:aca:190f:0:b0:383:caf3:a30e with SMTP id l15-20020aca190f000000b00383caf3a30emr15249900oii.17.1678726641268;
        Mon, 13 Mar 2023 09:57:21 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 09:57:20 -0700 (PDT)
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next 01/11] dt-bindings: net: snps,dwmac: Update interrupt-names
Date:   Mon, 13 Mar 2023 11:56:10 -0500
Message-Id: <20230313165620.128463-2-ahalaney@redhat.com>
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

From: Bhupesh Sharma <bhupesh.sharma@linaro.org>

As commit fc191af1bb0d ("net: stmmac: platform: Fix misleading
interrupt error msg") noted, not every stmmac based platform
makes use of the 'eth_wake_irq' or 'eth_lpi' interrupts.

So, update the 'interrupt-names' inside 'snps,dwmac' YAML
bindings to reflect the same.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

I picked this up from:
	https://lore.kernel.org/netdev/20220929060405.2445745-2-bhupesh.sharma@linaro.org/
No changes other than collecting the Acked-by.

 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 16b7d2904696..52ce14a4bea7 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -105,8 +105,8 @@ properties:
     minItems: 1
     items:
       - const: macirq
-      - const: eth_wake_irq
-      - const: eth_lpi
+      - enum: [eth_wake_irq, eth_lpi]
+      - enum: [eth_wake_irq, eth_lpi]
 
   clocks:
     minItems: 1
-- 
2.39.2

