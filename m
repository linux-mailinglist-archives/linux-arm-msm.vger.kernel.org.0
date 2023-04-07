Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0676DAD78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 15:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240816AbjDGN2l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 09:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240795AbjDGN2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 09:28:38 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2374483F8
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 06:28:37 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id by14so24370943ljb.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680874115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llePgOmhGh4IWb8LWhk+RajPlS7CDIy7UmsGMTBqzaA=;
        b=cO5lYLU5ym4dGfjzsNgK5ZlP8ePOHNfsRx9h+f8eHM/HC7LyE529BTqTknOrvQlJ+g
         ZAkrgOb5Z4e26L3cntz7DBdNcUm0MJmkG6l5MEIEOFHY6K7sm3KW++34p3p8gzcuidV9
         HEpV4gj7Hw7jKgF+cKhSFUK+WQDGeMGSAEEKLGl3BOOOj5eWouTZWawpiENhZ9aOHS4G
         y8EQB/5AOT19+OoT5XKdPYjcm+q+qvQYz8S8hzUlnF1Wej7hrfrLEZosqKUwhino+Mkp
         boVxM/H8EQx0UjZtv93ATw+qXKWPKAQ22LIQ8mOtTlYLsQ+Od9p04+JWUXnnDmcqobKh
         TB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680874115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llePgOmhGh4IWb8LWhk+RajPlS7CDIy7UmsGMTBqzaA=;
        b=yR+IceVFdXoYgwq4V8hbLV2K4imhtHgrMOJFG4X5moNONhJCquZQ7PdQ/VJ6gEF4b6
         s8fRFed+ifgg4vdgCm00T270qGUvpRyeVrpygTNXbTXeYJwmbRfaHZLVfgxBdmieU682
         0l4oKbff216NouIUbJQcnAMzpUXijvPVF73jGqGRw4GKQUIPq7t0qbR2uxoIOUjimbu1
         qO5o6bP+DhSNekRd7b0PAuZTUg4xI0nFrtXwlMTsi9Uu5sqYyMdL6dgu5uPzMP1CyK9f
         QKnST7i5bSZeN+9TOuDO1UPtXwqzPtMHA0W+OGsEQXYg7kGPROX5ax8QVRgluNGtqKi+
         Agtg==
X-Gm-Message-State: AAQBX9ffDnpGFESvsxSrW6xxLJtUSGnQAviIQA1OxGsfPRW0fu+hUaSW
        0yM4elchNeRJoQ9WL6s+u+ENeA==
X-Google-Smtp-Source: AKy350ZBU2+IVi4EkhIGy4Up7yOAsxRsnKvkuQMm67ALbuKqLn0D4GUuOG3n3GgoleU/9qzFInWv+A==
X-Received: by 2002:a2e:3607:0:b0:295:a16f:c893 with SMTP id d7-20020a2e3607000000b00295a16fc893mr613024lja.18.1680874115534;
        Fri, 07 Apr 2023 06:28:35 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e3a02000000b002a618eb72b1sm811031lja.98.2023.04.07.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:28:35 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 07 Apr 2023 15:28:32 +0200
Subject: [PATCH 2/6] dt-bindings: remoteproc: qcom: adsp: Allow
 firmware-name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230407-topic-msm_dtb-v1-2-6efb4196f51f@linaro.org>
References: <20230407-topic-msm_dtb-v1-0-6efb4196f51f@linaro.org>
In-Reply-To: <20230407-topic-msm_dtb-v1-0-6efb4196f51f@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680874110; l=1008;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dWnjAZMJzqjimRi8bQ9g3R4fQYhXM8ZgJZOOjsidZPo=;
 b=ZQ8LDsV8IFCj7oNIKdE4Wf/XjVIGpWft9setIb/PWvyNs02B1LepgKLs5g40HQi1fh9+DtmdRNQT
 VsMDX0bxDcq+DhkC6P7f2SLCCWNKlpVc/en0jMqXufIW1K02/jFi
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

firmware-name has been with us for a long long time. Allow it to fix
warnings like this:

qcom/sdm845-oneplus-enchilada.dtb: remoteproc-cdsp: Unevaluated properties
are not allowed ('firmware-name' was unexpected)

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 643ee787a81f..d99618a9ca2e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -44,6 +44,10 @@ properties:
     maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Relative path to the DSP firmware binary
+
 required:
   - compatible
 

-- 
2.40.0

