Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B82570D773
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 10:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbjEWIbI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 04:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjEWIal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 04:30:41 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5B81716
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 01:27:14 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-96f9cfa7eddso620058666b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 01:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684830427; x=1687422427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7VSJ860e4Fh6HjTKl0hZQ20ZjzePmB9hlOaoC2DjYs=;
        b=F6A/4Gza4MffuOaJ244j5/3R/2LNbZtycN5KhR3GqlToiwLaZPrU/WACr8/gZXAFbT
         bgHNQFWoNFkbQAcCMTwllsn2INQ3NeQK6Lohh087AEodc8MxGyK5i6bCd0mtZpjmImmI
         LfPaaZOQN9vdLvJfbyaG7V028TrVl7cal7VJZkxn+9FOixu0GVp9ZqtM+1v4ahLtWOpD
         IGa7FIQoHsyI5gCG5bZj25dPVp0dyKojrBR+l+HBE/5We0IOcySB6q1ruWAnRyZ9T2YL
         fhKZIwvhqsKCxD92hVuKUrhTxCvR0fv233GKiLx1U3dpVn+woitjLigBy/fpeDw1Ll10
         tipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684830427; x=1687422427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7VSJ860e4Fh6HjTKl0hZQ20ZjzePmB9hlOaoC2DjYs=;
        b=afrFCxpFV28WHr6OvnsXcH3MHBIBUtlO3pjG+1E18Z2VqKhG6TQ0YlGPN4mzB5CBG6
         dcNDkNFc7o9YnQaXRCKCoywyHTBfM53c2QBvDsO1u2jMajU5Odoqqitn4DhiT9hU6/NY
         fs1SszwA6VvXOEhndianEcVf9tCVEdNQHfRiHlwnnWvwQHC6seE3hG+x/MAb/02zqIEo
         CRsaMdiQEV9ARWay/tq0pR0S86oDXQzy4quROTSjKb/wcQy7UjzlvWq4+fCl3QdK5wOa
         6s+3D8WYrdd25jW8dOotj3Tiz9Xkt3151UlDsI02Lipdj0vDX5Fwmg3ceLhFbEa0DlGW
         jZOQ==
X-Gm-Message-State: AC+VfDxbnvmBs1I40yFKM76CWNk8aV6UpVy+j6uz9ZdNNm/L63xNMdZH
        rDU8ksc6vz1RUlrP9vMY9DcAKBnRGJL6doPw1Sg=
X-Google-Smtp-Source: ACHHUZ4oGEBIae4rCVIdVQNqFVVBGfjQ0jdDLbNbELtK18p4kgkGWGFnwSZMy6yGRkihBvncLHQarw==
X-Received: by 2002:a19:f610:0:b0:4f4:b3e2:ff5a with SMTP id x16-20020a19f610000000b004f4b3e2ff5amr960851lfe.50.1684828006998;
        Tue, 23 May 2023 00:46:46 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id t9-20020ac25489000000b004eb0c51780bsm1257070lfk.29.2023.05.23.00.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 00:46:46 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 23 May 2023 09:46:12 +0200
Subject: [PATCH v5 01/12] dt-bindings: display/msm: dsi-controller-main:
 Add SM6350
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v5-1-998b4d2f7dd1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684828003; l=1129;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=YH8eQbnbg0vjMQ5V3QSyUBMSn5oiwSvn85ByrDyOEfM=;
 b=iJOYYgaeSN0oSmq0j2H96FoSofQ6aG73eXrUH3db2gWxCPO3+Q2hzxrJvjTFj0XZSqpdnvZ1b
 eFNviWtWfF6ByrnsPcGQl6tIX9XWsO48jcxiKfqtGeYi79yI4815nIR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the DSI host found on SM6350.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 130e16d025bc..43f801a94d79 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -297,6 +298,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.40.1

