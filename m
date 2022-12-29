Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8B27658E45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 16:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbiL2PVB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 10:21:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiL2PVA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 10:21:00 -0500
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F5C11C15;
        Thu, 29 Dec 2022 07:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672327076;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=NhDVal3cY5RtflAGfuXYwWRxbBcys6vmGS1S3kTpu58=;
    b=f41wZQ8Qo2p5DjOKrnomUd4pigBHedDdR1p0/2XTzWfZ1eN+Jv6m88JRbmhLr394lB
    +DkT755r4yFoZKar1SZiIJlNkuph+GF1ElZxCsDIG16zFth/CYTcgrBjJNQSsUJfIaS9
    0n4Er9YU8VyNiJrfFb33N34jC5aO5nl4mZZaTp7E/yNJOlz/h3GNsJIfs0uscyRAr7RI
    ZzxMcFTo/t1C4/SGbRungnLfsVBPpJBDVCvSvRGLbidWHN5dACyAsoN51b2nxDqgmiWQ
    ukINmxETOvAOhAXNYLbj5JfecGucA9VikUDNX4NbbLmZiGIaxExUtk1hMdmQDV90HR7h
    yEFw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIRvweF+KLA=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id Yce349yBTFHtXT2
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 29 Dec 2022 16:17:55 +0100 (CET)
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
Subject: [PATCH 0/2] Fix APR audio regression on 6.2-rc1
Date:   Thu, 29 Dec 2022 16:16:46 +0100
Message-Id: <20221229151648.19839-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These two patches fix regressions in the Qualcomm APR driver that 
prevent audio from working on MSM8916 (and likely MSM8996). In previous 
kernel releases the "qcom,protection-domain" property was optional, in 
6.2-rc1 it is now required. It should remain optional because the 
protection domain functionality is only supported starting with MSM8998
and is not present on older SoCs [1].

These patches should go as fixes into 6.2 to fix the regression.

[1]: https://lore.kernel.org/all/20200312120842.21991-1-sibis@codeaurora.org/

Stephan Gerhold (2):
  dt-bindings: soc: qcom: apr: Make qcom,protection-domain optional
    again
  soc: qcom: apr: Make qcom,protection-domain optional again

 .../devicetree/bindings/soc/qcom/qcom,apr-services.yaml      | 5 ++---
 drivers/soc/qcom/apr.c                                       | 3 ++-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.39.0

