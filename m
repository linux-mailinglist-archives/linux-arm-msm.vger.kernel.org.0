Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD386B9598
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 14:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjCNNKW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 09:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232355AbjCNNJx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 09:09:53 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729148C0CA
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 06:06:25 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id y4so32310483edo.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 06:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678799181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oc/yTtxpfi/cx0O/ciOGYJj7wULj4xSmUjomTMHGaJ0=;
        b=sSonb0hI2fVqnLuut+Rx1JjgRwdGZp974VUVMyfCZVAM+8c6yFH5yLUhdB/zb9F+Jo
         hU0f6BPArkV0CxRn0cAVW7znfD4JQRCDJgBugL79DE79ju89o3CNWiA6kQPFWVQfq+dz
         it+/KHCugsRpWv09SQJrVDzU5cmrOYubZsCTN0vGdEdEBV3KLb+KHjIxZmLvbj4tdmpv
         zMq5fOg5iqiLMK0gMMmndRZuPS0jpP8ddWkXpQnh+VxLhN0wH+KzrSPEQ7vxOUO+fTd1
         clcxZ6Pp7xE+pNhtRvOSiR4DZSjdT0zHBp0no/7fNUv99KGsQggU9vzrCdUPSPstd/CL
         aKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678799181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oc/yTtxpfi/cx0O/ciOGYJj7wULj4xSmUjomTMHGaJ0=;
        b=QxXndffMHK9R6DuR/pDBW51ol42bI8g/KNBnp2MmrgqyuSVauyTzQA32bl44lqa2KV
         xk8VPYDTnne8I3qA/VC79zBEb2boFCoECnZi7ig4iGM4UJlOGIu/2XvEKrRYun7soTFL
         lkGwBuWsfyISyDsLcuCxISebTZfAGzDTrCAQjRXY8+JZglpYXiU85g9aeoGUgjEshAz8
         3k8E30i+Wum91iZclSj2quVMS3wI3Ij+L3O32gbWazWynezb6Ssi0shY14iazDV9SIZU
         kWF4vtyMswgMwaJQXqJ3ab6qIee5kuv/I9vZ2no6lGiy+GXUZ6TwuOr1wqH8hjH03WfC
         2JrQ==
X-Gm-Message-State: AO0yUKU/yN4Pi0h3iOlAB+/QP2GYIuTGkrN2pLs2Es/kTdBvXtX2eYVW
        P/iSdIq0c99oFqfQWPvBY88PlUJ2/tlEzcYk7cU=
X-Google-Smtp-Source: AK7set/cA5JzNq58dSwBAkLHZCu0RayEc27uAlLkeTiHXGkrsrtUKK6Xmh8rmkhOulNKQc/fzE5z3w==
X-Received: by 2002:ac2:4c29:0:b0:4e8:49ff:8df8 with SMTP id u9-20020ac24c29000000b004e849ff8df8mr770470lfq.61.1678798393458;
        Tue, 14 Mar 2023 05:53:13 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id s9-20020a19ad49000000b004dda74eccafsm395374lfd.68.2023.03.14.05.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:53:13 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 14 Mar 2023 13:52:58 +0100
Subject: [PATCH 3/6] dt-bindings: nvmem: Add compatible for QCM2290
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230314-topic-2290_compats-v1-3-47e26c3c0365@linaro.org>
References: <20230314-topic-2290_compats-v1-0-47e26c3c0365@linaro.org>
In-Reply-To: <20230314-topic-2290_compats-v1-0-47e26c3c0365@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678798384; l=777;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=hWgvEppu/A1SXLKMMX+IVEfzPX58BD27JWEng55RY7w=;
 b=Ef0WrVrVXlVDBJBByuHYfJlJ7lKiC4VKDD9vte3q6X/PFMC2o+9sSEcy8IVuH2VILi/qU5aK+BY5
 Ts3tc5KED8ipFSTE15LUOfkLBF7qH00cFE3ULYIfdjVnID+Jp6zW
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

Docuemnt the QFPROM on QCM2290.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2173fe82317d..1bd213f9eb38 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,msm8976-qfprom
           - qcom,msm8996-qfprom
           - qcom,msm8998-qfprom
+          - qcom,qcm2290-qfprom
           - qcom,qcs404-qfprom
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom

-- 
2.39.2

