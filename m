Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6F31542FF8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 14:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbiFHMHd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 08:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238672AbiFHMHc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 08:07:32 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416FF1C422B
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 05:07:29 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a2so26768351lfg.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 05:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IKrJPErhKWd4bPluexyY2DxW0ir12Zi/jdXLVdVRR1E=;
        b=pXTHyrp4nETfrVRxVykFpNYU7Gdcx1h7qPyh9Duu3hOKs0OW7qSeH4sd8GrmZ4SmoS
         MCcwKkC3fRm8zqp0x+Nb3FciqWmcEz7FCYhZgL+H+fq5VUC0IrlWAmLqnETBPdHbZ0vU
         J9h6JQzQ2AyS0M7jLFYB5fascJ8hkikG7DI6C1aai3XEqN+jyYoN3wDK+N8BovyMg4+V
         vrRm/pTYEMk7oN+9k5FcVMl1SUfz++4Gky7I0kMgh5gpnlaNzH2BIWJdWSpoBVQ6EDEG
         DRQvLim7bEgpkXxjqYpzIm5YluBS/cWfhkA5WkaXKPVRMIgwUu5lZlArL78owkGyhUug
         5bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IKrJPErhKWd4bPluexyY2DxW0ir12Zi/jdXLVdVRR1E=;
        b=4K+YVSDKywoA1Qb8JwFCilxpWa3QP32/bV6zSA6DckR27f8raH8hEI1mfc2FFvVBqZ
         7nnP0cU4PUXND00LEqiMcP4M7sLetdXzxxagonRQQ89oUM0SJ7tC0v9BVnpZWRCTsswt
         RjCtaN6o/7nPeraXEG4L200bZAh51EOD4utxjczlzxNUQZVQUqQGd8HcZ8Is9RxWuEdm
         t4wYD8t4furrqj+1YpxgzI/elM5TbwxfnmbU4LfQIcJkhJsJaT39sBGfwmP6OB29tqx3
         knmxpJp+vLeWkkmK7UeYLaI9Uu7WlTqfqdmtdWNfG5woWZrPK+i+RorldZvewoWEKDcI
         QYNw==
X-Gm-Message-State: AOAM530Oq9bUOU8zdXfwUd9OpzbfOLynTFSXnqTaoTiOBWyH6LWBTkem
        dZVOC2Y8fpJqXzym6XXqF3jbRg==
X-Google-Smtp-Source: ABdhPJzIJCCXIGZOq65/f62Q4Wtugam8SJXGd9jVjz/mCnSoRAbZrsLNmWxyTeI5dt8/It3sJ7r7mg==
X-Received: by 2002:a05:6512:459:b0:479:6916:4f25 with SMTP id y25-20020a056512045900b0047969164f25mr4399273lfk.119.1654690047144;
        Wed, 08 Jun 2022 05:07:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:07:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 02/12] dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecated
Date:   Wed,  8 Jun 2022 15:07:13 +0300
Message-Id: <20220608120723.2987843-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
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

Mark obsolete GPIO properties as deprecated. They are not used by
existing device trees. While we are at it, also drop them from the
schema example.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index ef425c649ead..81997759584c 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -65,14 +65,17 @@ properties:
 
   qcom,hdmi-tx-mux-en-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI mux enable pin
 
   qcom,hdmi-tx-mux-sel-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI mux select pin
 
   qcom,hdmi-tx-mux-lpm-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI mux lpm pin
 
   '#sound-dai-cells':
-- 
2.35.1

