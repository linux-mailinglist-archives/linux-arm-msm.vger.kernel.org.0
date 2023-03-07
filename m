Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 745456ADF99
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 14:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbjCGNCR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 08:02:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbjCGNB4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 08:01:56 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963D63B231
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 05:01:54 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id f18so16973264lfa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 05:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzTyTjVeEOwx0n8Fcur27AsP/7zLfRdjtQMUW7H4GE8=;
        b=Y1f+YlSj6leQtVLh4lCNFkqAnnKyFkvUu4KNMasglEwHsnWS1CWIDaXG7NV3c9WUpX
         NRiQgWMEX6piVxBRmiPzOJLCj9wq7Mndy58OUirCUh71Ng+EWAJp2N88aliHOiJBAM8E
         7b+5iVUIMPTBh5XMzrbrJsAwhdEJ+pXbt4J/gOLoQl58q0//eingsEpM5Atz0mHjkfIL
         MVds9sbVXLf6OJi3DteMUbxILXRjYwf9FtQPM9Fh9Wbrp/DCvlxsZx8ZUbFrPa7tcRYE
         VAD1V182jVcf+x6kIIfb/LVWMkOiQ9MgZcBCAdKXMyruYXQzmOHE0jasp4f3/h/ddBQe
         mstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzTyTjVeEOwx0n8Fcur27AsP/7zLfRdjtQMUW7H4GE8=;
        b=ckwcAMEYbadQyuelKr3Z9CzknZVAWUT9K91Ingub3UTt8H3IGLS+fHfBaR1f6cSa1D
         cNVUZAxDg/5cBVCKrIHNIorsZyRv90y5f9tIqUPx3rCz6NcbDJ6Zt3O5H8yrtCxcMvQL
         h1bFhmHn9Fv2KREU4tCRYxNe277X5QZnqXqqocRhvOv++TlOrNcIQAfWWvuDxhB4SKn5
         aYoOaHdxMhvMJt3O9+Lm3hUNrJB9o4B3gIkI7lLin2wvs5P6MT/dijUlcM7nI3jCfPcf
         6kpwb7lfAj8wSKRwJrxlpSKNWMHKWGcQOOyrV/o6oo+7kk70XsViogUhz4mV/iSqFNmv
         GBrg==
X-Gm-Message-State: AO0yUKXBbSBo/raxdtFenI+/6vlRt5eHtArBnTqaCTxqob2YXMeKYLjJ
        lVPZN9LgaRNg2WWPUyvKX9Rjug==
X-Google-Smtp-Source: AK7set8LRRjQl6lQLEVNGwZ+0gcThjUGm/9xpH5kwnxGoIMBR35JIMlsB+tSxqVDk6aJ4RD2FJiseA==
X-Received: by 2002:ac2:5922:0:b0:4d6:ef7f:fc53 with SMTP id v2-20020ac25922000000b004d6ef7ffc53mr3535050lfi.34.1678194113951;
        Tue, 07 Mar 2023 05:01:53 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u2-20020ac248a2000000b004cc5e97d356sm2048265lfg.148.2023.03.07.05.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:01:53 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 07 Mar 2023 14:01:46 +0100
Subject: [PATCH v3 08/10] dt-bindings: display/msm: dsi-controller-main:
 Fix deprecated compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v3-8-8bd7e1add38a@linaro.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678194100; l=1144;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dS1N11h2C4bKZ0sJcpp7JilD8JmZ3GC3KRjbGbtwF6E=;
 b=j/CpsyJ5hcGj4Xtxf52pKDseNdb0oMAW4eomJS4lqedzemS1xNJgvbpmqQMJyYoFFERldyqiFvqY
 oNpwyFyeCer8XmHhcOK5oX/9ZOJQHICK1L5Zr8bg/kwTGDpgKXU2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
alone. This however didn't quite work out and the property became
undocumented instead of deprecated. Fix that.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2494817c1bd6..94f4cdf88c95 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -34,7 +34,7 @@ properties:
       - items:
           - enum:
               - qcom,dsi-ctrl-6g-qcm2290
-          - const: qcom,mdss-dsi-ctrl
+              - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
         deprecated: true
 
   reg:

-- 
2.39.2

