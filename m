Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 054A07D6281
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 09:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbjJYH06 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 03:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbjJYH05 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 03:26:57 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD8BAF
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:26:55 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4083f61312eso43283705e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698218813; x=1698823613; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gYlV3gflRK1IaZxI10f4j/0Ht+9sPsBAEv/yGsh0MVQ=;
        b=sp6CNMQ2ozADgLu9BipE5EOsgJLz8mXrVXIPmkoN/A5fNIDLLoPICNkk+xDVQtIN4i
         VIAhNKV5F9+AfFPQfx1i2R0jvqieDflRTKSAj5e+VYJkTCpvw+wJk8Gb6ZIVVENPG/Jt
         4KKsAhBCH970JE8dUjifCkC+4exn8nJou3IO0FBNXDnNNPqHr2oW1rXDfeJPH9d4a7il
         pEHh1wVzSez3KFfvJSJK+BKp3xv5TQ1L5jTix6B9EEd+YskYcEW8hhWypxbkX9/HLPj8
         ZiK25sVkZo/IJxE/ut2fBFRM4yXkSzyNecPyFOz1SGkZaA/hfg1YRAelO1LZIBWJKOIP
         w/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698218813; x=1698823613;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYlV3gflRK1IaZxI10f4j/0Ht+9sPsBAEv/yGsh0MVQ=;
        b=pJIQG8g28/s4KV/908QhB2rQKuC+aDtV6eWJCdbB4EHUUTZ06oAIq94tAo2D1sKaSq
         qU8aDoN6DfBbISufwiWjd21qdTbC4Li0ZcUkWjmE1n3OuMMN/16p7VrHqDCFAYvkK6/W
         noqpCiXuSSjOXIzPFdyUf51G3dWu+psC4+4l8CFqEPKMfv3QFwPi+9b1sWPOy4dZGKGd
         PnAp7Xmk4KDwvMvPIhTZTgpMeoTr5M3c8k9DwIjbzpdHxVFjoZEj8gQtKmKkNP+O5gPI
         OMUZc0plXcmS/qRxbnxntF7yYmSgZSMEC0UashfUL50m9J+OJrCbe42B0LOG9d8ZoTIQ
         UctQ==
X-Gm-Message-State: AOJu0Yzlmq3mvHJjTf8DRhyijR7uk+YfyY+6GB06XdANdpfif9x3OwPM
        /IK+ckjo32oxfSbq0Ccy4uLQsg==
X-Google-Smtp-Source: AGHT+IEG0ijh8/TVPaa+deiRSUw4BbsSn4OrzlNz3qp3sHMQgEA4BXvX8+c56WSotPMylASM9h6CDQ==
X-Received: by 2002:a5d:6892:0:b0:32d:8b21:40fc with SMTP id h18-20020a5d6892000000b0032d8b2140fcmr11362582wru.9.1698218813481;
        Wed, 25 Oct 2023 00:26:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b0032da40fd7bdsm11664844wrn.24.2023.10.25.00.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:26:52 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 25 Oct 2023 09:26:51 +0200
Subject: [PATCH] dt-bindings: mailbox: qcom-ipcc: document the SM8560
 Inter-Processor Communication Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-bindings-ipcc-v1-1-acca4318d06e@linaro.org>
X-B4-Tracking: v=1; b=H4sIADrDOGUC/x3NwQ6CMBBF0V8hs3aStiJBf8W4gPLEt6A0HTQmh
 H+3cXk29+5iKITJrdml4EPjmir8qZH4GtIM5VQtwYWzd77Tbc2MakvfXZy+s20Fw6Ij08Q0mzL
 HqG5s4a+hBUIvtZQLnvz+L/fHcfwAKsGdhXUAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=E/tCmRhrtGk6SHSiuVG3uC1gUTwaNi7IHPFcz0ZYtMo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMM8xoPbsKAt65jY/fIikfK3eOahvmL6hEOcRB2v
 CcMKBtCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjDPAAKCRB33NvayMhJ0dt3EA
 Cs/4NMtd4U1nYw3+z8XdIuO6rbLQ10T5xqon1G7ODtsf8jZ3GThsoxAtxVTwP3HdXcog5Fm3/IyRns
 /+5HqhYIca+Fu3lPVmwHAG3dvOeHQVvNN70NQVnZ2w+oKQzWsPQAfp0Hmyz+em2ckX4oPjG+G9fwzz
 zqhxcJxCwPkTwaMdgLGwgm77VcgQiTtM9+mLE4fdaWiIp1ASZ9NzYtA6qxSGB07cKh4sDyReZTAAQs
 ESoqPpVIATkC6Q/L18QM5MxnJq9BvE636BknkOkDakIshwSSASB0I4hLIl3BQfQszWIkrcDYdG53Vp
 1JJA8YFEakpEYKlpm+RPj891gC4rOpvsiAw0mDtuSsUX4xxl64WtTr6CIyLlj9f/boADh3AhFzhwNp
 0mHnUPQvu6hGed2RtEb3URTuHeJ9VzSR09i80JTSClkRksZ9RihlTtmIsGab65JyWTMEazD1EiZZNP
 +/djY1txRwVMG0z+qCQjD0lho+HZ4TbfNSgxq9fkZVgwfevnSCxFzs4KXJAM0IKZoaJHdnHcxnBQ/6
 eVesP3D8EVbPB9us+/B2X7n+Y3VTRUC6E7Yj/sIeSAIElwNRzrZCc1K8Yzko89ntq2OfsEdiyH5yZX
 BnvNWW1V/+4iin+aJl2EB0XV8hRCnaDhO30MRyFVhrULDHHd8sz8StwfP+/w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the Inter-Processor Communication Controller on the SM8650 Platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm85650/upstream/integ
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index cc6f66eccc84..a35f9483dc71 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -34,6 +34,7 @@ properties:
           - qcom,sm8350-ipcc
           - qcom,sm8450-ipcc
           - qcom,sm8550-ipcc
+          - qcom,sm8650-ipcc
       - const: qcom,ipcc
 
   reg:

---
base-commit: fe1998aa935b44ef873193c0772c43bce74f17dc
change-id: 20231016-topic-sm8650-upstream-bindings-ipcc-0b4e1924ee28

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

