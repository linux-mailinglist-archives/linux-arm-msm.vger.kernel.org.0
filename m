Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9BA4B78B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 21:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243981AbiBOURH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 15:17:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbiBOURB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 15:17:01 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9410EB17A
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 12:15:43 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id u16so196221ljk.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 12:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m9NbJtEvv0ukMJBaopDs5ubGBPdRqOGbN+OGXiRZPTY=;
        b=MPqP9JnBGs3iOr+qashv95B4yvxgsK2DsKqkPCvh3mgaz72zoU9ki8uYx7p08a5aHA
         eNTfHpMYgDEesp1q1G/M2IYVfgeevtYKDxA8c6zCLN7Km8DeiXk0Xxj7EKJeMFRrQV3F
         gIPlI/KdWYQoCsKbVTVjL+aRF0dsfvropn+lH/QsDdM70FD/yVNtiv8KPL3YM9ypvI8M
         3QD+uKrfDRlK3GMH0jk+6IgGOXrFs4eczTbyYEFOAwq4+fO9H76Z8RAJLilQ/T40Bu9w
         O5QPsz9brHqJS7RK0P1FNQAKTouDpHEpJwIF/70EAAJa6PPvE2BS2U+rTKyamjHJTMvC
         vHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m9NbJtEvv0ukMJBaopDs5ubGBPdRqOGbN+OGXiRZPTY=;
        b=BzHcrNaG2G4Y1dC9rA9u6VTRAS/YyzG8znoE8QWaTfG2DF9PejTf4OyfTjVs+3Pq9E
         i1o4dpOlZWEuXTZaTJljnOU91BjYftm3ABh2VbAdFcIc11BR2ePZ5+yDvu2YWNbJloGd
         lvWA0BoTcvDtIJt/ZfXP+vgBbNhdLr9GNytdkwvl6v5QuSC5jzabG2PQYhM0W8x+ZmfG
         7SMdpJ+St1a0jI/t8f1fj7Ancp/gySs8bEdo4u0EPtsi61AlrAxfWiRY4NSbfOglcN20
         rcusEPm0QnmMMKAn++5nTdvHIMvwl+2adWszTu+Unqq+cJiVgYdkqgzsH0f4hE81lsAj
         5a4A==
X-Gm-Message-State: AOAM531TrXIRMlGGHN+fTSNhCCFnVNsRxywTprj/c+WNgqtmKs865IrA
        K61ztDVTCrab6SB+txDl9RGpmw==
X-Google-Smtp-Source: ABdhPJxaRI/+wZH1B7MIjCeyOlSNzv2Yf30wRAMvNNzhlVclgrEwkjKIEQjWYAOE2oypjLfsX7qZWw==
X-Received: by 2002:a2e:9c04:: with SMTP id s4mr494486lji.431.1644956142095;
        Tue, 15 Feb 2022 12:15:42 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16sm4548419ljg.111.2022.02.15.12.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 12:15:41 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: clocks: qcom,sdm845-camcc: add clocks/clock-names
Date:   Tue, 15 Feb 2022 23:15:36 +0300
Message-Id: <20220215201539.3970459-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
References: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver can parse bi-tcxo clock from the clocks passed in the device
tree. Specify it in schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
index c61314caf692..d4239ccae917 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
@@ -56,6 +56,8 @@ examples:
     clock-controller@ad00000 {
       compatible = "qcom,sdm845-camcc";
       reg = <0x0ad00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>;
+      clock-names = "bi_tcxo";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-- 
2.34.1

