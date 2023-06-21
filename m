Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B92C67381AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 13:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbjFUJ2O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 05:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbjFUJ16 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 05:27:58 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4149F2D70
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 02:26:31 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f8467e39cfso7562096e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 02:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687339589; x=1689931589;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1u6dMLu+XDdmR+MTtlZcfDBb+RPJh7fhgvB/xrSsCvE=;
        b=TZv4N3WDU0oSVlaU5wJ1bBAeYj0fYKd130cieir2cTkNG0Kh+MSCdmP3N4I/Cd2nFL
         vBAGdqW9CZzONVyf2G/VUtXNllSeQQ+tnm1FdRpHbi+odT+hhdq/Pf69ICrj+3IkLdYr
         AXl5vz6pZC1H5FELXpBVzuS/u92AcEyuELpUgcH/95QvkNU/zg8AsYdWifvYpVmlm2AC
         YkMbJi54nLxlVBWaeokXVLtFBPbkg15fnbr0jytWqwqqcCpNO87qT8DxBZJsQFUP5L0v
         h4CFTr8b9PfvoCZo72xONQynYD/TIMKOj9BHxe+JVLUgJq8CMPwhv1bTY2/uvFn4Ogmf
         6h+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687339589; x=1689931589;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1u6dMLu+XDdmR+MTtlZcfDBb+RPJh7fhgvB/xrSsCvE=;
        b=Q/U0XnyCieCtjiUQ1DP1irGbUIw9/hhHuA2wB31Mlip1KtE32QwNZlNlb6wDpxIJ2/
         mn+7VvRUmmUwVzhNc2xVyVbUTasZ9a6YjQWjwdxFe30NLpeZNy5P9BzaONA36WheOKJg
         jdiDx3ZxWRvQEVrEpJDTKYfmAzrx2yaabYojsZmVyVH5E+ElFI9TZuDrunI9W74smgFF
         kwjuPl4SPSEUcrHw5QJ6gHVTGueXIbpVwCpBd1NvR/BRF7f0DVbzKtoWXxQr+IuSEKrN
         znJNbCWEdYHPgOjy2xpzAZc3JGKME1U4gxIWpmOj/h0nmTipAPdiyab3yC3ft++EkAAO
         BX3w==
X-Gm-Message-State: AC+VfDxpChxdcRHTjPe7wxf1ow37isy2quPXAyspvv8sPbhRz+qyfPJS
        uzcHBPMJ6/bgFKkGbLVwSpVmog==
X-Google-Smtp-Source: ACHHUZ7pZ+KItBxGa7DSPdaGeby4ce78m1+Ky+cxafr4DrJXRYhrD0n1gmC31QJQce6zA0HLfjSq9A==
X-Received: by 2002:a19:6544:0:b0:4f6:d7b:2f19 with SMTP id c4-20020a196544000000b004f60d7b2f19mr8147122lfj.24.1687339588863;
        Wed, 21 Jun 2023 02:26:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n8-20020a05600c294800b003f90a604885sm4435068wmd.34.2023.06.21.02.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 02:26:28 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] dt-bindings: display: msm: document the SM8[345]50
 displayport MDSS subnode
Date:   Wed, 21 Jun 2023 11:26:24 +0200
Message-Id: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEDCkmQC/x2OywqDMBAAf0Vy7kLUakt/pfSQx0YXzCZkTRHEf
 2/oceYwzKkEC6GoV3eqgl8SStygv3XKrYYXBPKN1aCHUc9DD3vK5EDi85g01Cx7QRMhehGwxJ5
 4EfAZpFpOHuEecJwfNkzOompRawTBFsNubVmu29ZkLhjo+F+8P9f1A6VCtGaVAAAA
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robert Foss <rfoss@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=n/PdcZDVLKRhIvYbN1bx5TS9tULGuMBKEC8xgdESvuE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkksJClUTpI5t3FkZIWzg2XBdjd4nX6NjdUW8Mf2nC
 uYlOHdeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJLCQgAKCRB33NvayMhJ0cqcD/
 0VdK6Yroz7ljtVZiQJAUiLw/B6ezdYudvpzUuCZu9KSxdBrrJ7NhRxLcFJ2mhdowyOXVuwMOORHHje
 WuxjbN8F5a9eAirf2Tx14BDxjvrvUzg42BBcElD2nCxwHoyuf26pQwHGJn416wyxbKREIDcnEY6L7Z
 MYp8TsEaCUeN1HGYtBVdZqu5aNiE1qkzaACRudyZOgho9yvyp0pM3oejJTxjeB11DZKdQhCO460TIa
 vcfCiP0JJns2FgfTKYv4PEBKf93f/7REZUxnMfO4N/ZKpAcsY4SnGmYvE1a9KCp9aXjp8Qr1L35XW2
 U0nAR/VAaAiE0ZcezhwR8ZP7J2OHPG1n/SB3dhR6aLk+FWo9OTIxLiAZLmthe6GTeaI94HZuvwI7+r
 O17Yyl+0T1at/mzRGPYuLg4yklF4yeaVrofVwn1PRQWQSiu2pYxSEU1UbcazixB738P4wbfLVqZLzD
 lN4umOpoeZi70UOFuwuQ0LEtIxivXv5Q9r7DzKqu05VIK4d7NzJtilJoMt99dNNAZ3Kbooq5DHvR6f
 K+qyfcVJ/1beRmRsu2OoIUeOdf5q43E2UJXVDJUhcIop022cjl5XDALT0kiO4xRUDaT9BRNPK6cyFK
 R9bqwS3Am5SkQUwrS3ogM5HHdAFQFy9lhVhz08jLkHmTovdYPSIxFfZf5H3Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the displayport subnode to fix the bindings check error:

arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('displayport-controller@ae90000' was unexpected)   
        From schema: Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml                                                                 

And same for SM8350 and SM8450.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      dt-bindings: display: msm: sm8350-mdss: document displayport controller subnode
      dt-bindings: display: msm: sm8450-mdss: document displayport controller subnode
      dt-bindings: display: msm: sm8550-mdss: document displayport controller subnode

 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 6 ++++++
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 8 ++++++++
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 8 ++++++++
 3 files changed, 22 insertions(+)
---
base-commit: 15e71592dbae49a674429c618a10401d7f992ac3
change-id: 20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-4fe367bf5cbe

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

