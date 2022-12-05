Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04D4E6438DF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 00:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233602AbiLEXCM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 18:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234092AbiLEXBc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 18:01:32 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F33C1E719;
        Mon,  5 Dec 2022 15:01:31 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id x12so5795818ilg.1;
        Mon, 05 Dec 2022 15:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3EcKf/WiZ053M5Zlh9oslP3C4L9UIGaow1VWS03f4p8=;
        b=pxFPs4abDJ1Hie/qZ3IZMTsdTOwAVCuFmRc4swy8B4yQMn/3FLPpqMFrdCsSndTQtR
         kHe0lQsRDC00AYm5ISYSl0O7ZX8jgz0uf9Hd9+NXoeVoGeAndW38F4/MLqESlu9zsc+r
         XO8hhw/HBcBcFy5mtFgcDkw3hX67LFZTcvdwN5doixzIbDG4iy9ZeLYhws6Gr39ply6w
         Cw74nCdEtGSh9ixU1FAqqQHAEMbvllUcdRBnuwUR7SmSLv+xqpgaDXOigSPR0cTQ/fFR
         wCvX+oaJbByeAPQ+dc1xKix4F2vCUg3BMC5DculKRe/yHpAKofU5wJ//kETEflpjvtO3
         K88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EcKf/WiZ053M5Zlh9oslP3C4L9UIGaow1VWS03f4p8=;
        b=rhlsmtiusztmausKq4fddleeDTSTlFTqmiHcekuj7xu/uZc/WrhebhhxDJZKJaXBLG
         HhPS4MlftMU79VbjeXDmmPa5MFF/SmkWyk/1lcWaC8CsvlCvl2KuUaIv+XX/MdvOgZnu
         PmARmKA2An5zFZm58wGguLr4sBOo1xlKIGfN2cjRL87XnteVREa88MLsVqiCd3s0gaxz
         a/p0t6DfHN7tZhI5OtstN9HxiYqadQEVESz6AchruP32J0znDyHPgripxx5JiZNF8ZOS
         vjJ3ZlOgnG4dl0hLQJta2TyRJCIUM2qyX6LZp0P5YHExq5e6Dc67BUUhx6GtuJ/dSj24
         9Tlw==
X-Gm-Message-State: ANoB5pkmEXiF7Q6X6sPikfT+3ojLh4ASXIh7IGKMIGkJPm90l/rzPe5s
        Kg1mxYFBFpJVoLn0hk6VVS9MEl5ahpg=
X-Google-Smtp-Source: AA0mqf72OFe/uOLUh5hZENDrPXmEecW7I781TX/u3gInX+WCGdUKFOCmkyRStBn0nujkth8QY9ofbg==
X-Received: by 2002:a92:c10f:0:b0:303:1f6a:b30c with SMTP id p15-20020a92c10f000000b003031f6ab30cmr14953344ile.254.1670281290898;
        Mon, 05 Dec 2022 15:01:30 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::be63])
        by smtp.gmail.com with ESMTPSA id e17-20020a5d8ad1000000b006c75c702342sm6321912iot.14.2022.12.05.15.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 15:01:30 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/3] dt-bindings: nvmem: qfprom: add sdm670 compatible
Date:   Mon,  5 Dec 2022 18:01:14 -0500
Message-Id: <20221205230116.2204-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is some configuration in SDM670's QFPROM. Add the compatible for
it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2eab2f46cb65..01ec2143a3b5 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom
           - qcom,sdm630-qfprom
+          - qcom,sdm670-qfprom
           - qcom,sdm845-qfprom
           - qcom,sm6115-qfprom
       - const: qcom,qfprom
-- 
2.38.1

