Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF48C5970E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 16:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239887AbiHQOWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 10:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239722AbiHQOWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 10:22:54 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53D5901AB
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:22:51 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l21so13722871ljj.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=hkQw9WN5h+Y42nVQvRSlhfGLJwPyneuk8AABP6NmvEc=;
        b=ThN7HQwQnLxN7z1iEWQ1VfcAD0RfUVXtrUSy4MD09/e4sb6cSS1yebkFfTnx1fy3Xa
         gG2aW8EDf1wM00MQxMVBYxEAIWMcxGBFgczmIjoDlF6a+BUbg2a/wQQfVnNcbnjQGpDq
         jtQ0IcV951fV1AEhlZxcPt7QxJE9FaM+HKeGRyWZe6HFRlEuATR+o5e5I5+hv4c8J6tM
         ahb5KYI/9nig957x5x7Vq9oeNELyiszjMPApHmy4tW1QdGzE08mFaT9llMAU8J5/0i/Y
         QNRZfsjwAIbSAvZ45bXVyOt8Yr2Yd+YdOYIdrJ3KhqA+CqQUo5ao6d5rnvSSXZ9R7D/N
         obfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=hkQw9WN5h+Y42nVQvRSlhfGLJwPyneuk8AABP6NmvEc=;
        b=QQzTIvxgcJSdQo8o2+Yu3Mi3NKJXOy4ec2OkaDkU91RZGHvz1NTZrGjQqRqeWcsI9g
         nAzxaJPZQp5TDdefPnxSsmdJ7DCZm+qj6SpwH3aWyMRrfKvSo0DWZQfT38bLqt2oJoTo
         uxJJQw96Ii2bFfeqHy60Rj1iozuPyegVGSloTTt5F6HHvmn5Awv2K221mUAjs0+7WnyF
         nNCnP/G6rUnFQHWb7fPF9AXdHmotVqwQPDYZbaHVj5X7OMyzzBp35XRe25/JzRP4bPo4
         JxOoAHm26h/gJAk2hqKnzSbf6Z9ar8IVdBH+JZ+mokqqv/VjPWcpuO5okD2xKDb0ZcAq
         7H0w==
X-Gm-Message-State: ACgBeo1wbF3FVymVt+c8M+KcEAbcfMaI8qrShsZ2wPYfk2DPjcCWNe1a
        foDOFVl6aVy07YnOJ4yX/rEGXQ==
X-Google-Smtp-Source: AA6agR4h8+eFKm2t94hbKt8Hz5VfqgUspsmVJMcyCOhfG+++g9trck+HNcSCsL+pgyahCbEkyXPzuw==
X-Received: by 2002:a2e:711d:0:b0:25e:4f25:a517 with SMTP id m29-20020a2e711d000000b0025e4f25a517mr7367436ljc.145.1660746170020;
        Wed, 17 Aug 2022 07:22:50 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u1-20020ac258c1000000b0047f7722b73csm1704647lfo.142.2022.08.17.07.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:22:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yu Chen <chenyu56@huawei.com>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Carvalho Chehab <mchehab+huawei@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] mfd/phy/remoteproc: dt-bindings: syscon: be specific
Date:   Wed, 17 Aug 2022 17:22:42 +0300
Message-Id: <20220817142246.828762-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

The last MFD/syscon patch depends on the previous ones to avoid
dt_binding_check warnings.

I propose to take entire set via Rob's DT tree.

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  dt-bindings: phy: hisilicon,hi3660-usb3: simplify example
  dt-bindings: phy: hisilicon,hi3670-usb3: simplify example
  dt-bindings: remoteproc: qcom,pil-info: add missing imem compatible
  dt-bindings: mfd: syscon: require specific compatible also for
    simple-mfd

 .../devicetree/bindings/mfd/syscon.yaml       | 14 +++++++++-
 .../bindings/phy/hisilicon,hi3660-usb3.yaml   | 22 +++++-----------
 .../bindings/phy/hisilicon,hi3670-usb3.yaml   | 26 ++++++-------------
 .../bindings/remoteproc/qcom,pil-info.yaml    |  2 +-
 4 files changed, 28 insertions(+), 36 deletions(-)

-- 
2.34.1

