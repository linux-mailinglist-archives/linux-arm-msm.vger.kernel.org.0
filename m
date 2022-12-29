Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E717E658E47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 16:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbiL2PVC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 10:21:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiL2PVB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 10:21:01 -0500
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E9F11C22;
        Thu, 29 Dec 2022 07:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672327076;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ufovkPO+jNddBOfj2hrolKoU/q+utp3DmWQhPWZpjlQ=;
    b=TK3tY/pO+q0ZpT65UHNC57hTiYfKr8aSV72LkddUx+WAMKp00yFCrdI5UdTaLi/tAc
    wdkwhxzV+w6vbmrSfFe7FnOjSwjpx6gBQtmBqI6Io6dLA78GYWySeKpGH9WVbTl+o8ou
    gNS36WuTk2u9vqB+1NFUxEXtWxgTAEdth08vdOQugMszLaeVzthUIIaVea2XqyAM+gw3
    eeNMUnxbioNbSw+N8fVsdASOjAquH7oQdMIYwjVbwZSV9mxjTw6/uh6Z/19asfozwJYY
    xj5UgMzP8stU0WrIy6LpQI5IM3weXuXEfazBmbUxP/oK6QHYZZGFi5Zrhhs5yKre3VAO
    IPkw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIRvweF+KLA=="
X-RZG-CLASS-ID: mo01
Received: from droid..
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id Yce349yBTFHuXT3
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 29 Dec 2022 16:17:56 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/2] dt-bindings: soc: qcom: apr: Make qcom,protection-domain optional again
Date:   Thu, 29 Dec 2022 16:16:47 +0100
Message-Id: <20221229151648.19839-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229151648.19839-1-stephan@gerhold.net>
References: <20221229151648.19839-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The protection domain functionality exists only in SoCs starting from
MSM8998 [1], while the APR bindings are also used on older platforms.

Commit 41288c305836 ("ASoC: dt-bindings: qcom,apr: Split services to
shared schema") made the "qcom,protection-domain" required but it
should remain optional to avoid dtbs_check warnings on older platforms,
e.g.:

arch/arm64/boot/dts/qcom/apq8096-db820c.dtb:
  apr: service@3: 'qcom,protection-domain' is a required property
  From schema: Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml

[1]: https://lore.kernel.org/all/20200312120842.21991-1-sibis@codeaurora.org/

Fixes: 41288c305836 ("ASoC: dt-bindings: qcom,apr: Split services to shared schema")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/soc/qcom/qcom,apr-services.yaml      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
index 290555426c39..bdf482db32aa 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
@@ -39,8 +39,8 @@ properties:
   qcom,protection-domain:
     $ref: /schemas/types.yaml#/definitions/string-array
     description: |
-      Protection domain service name and path for APR service
-      possible values are::
+      Protection domain service name and path for APR service (if supported).
+      Possible values are::
       "avs/audio", "msm/adsp/audio_pd".
       "kernel/elf_loader", "msm/modem/wlan_pd".
       "tms/servreg", "msm/adsp/audio_pd".
@@ -49,6 +49,5 @@ properties:
 
 required:
   - reg
-  - qcom,protection-domain
 
 additionalProperties: true
-- 
2.39.0

