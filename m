Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16F6E526EDA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 09:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiENCEv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 22:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiENCEs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 22:04:48 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2147F4200AA
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 17:06:09 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bq30so17031186lfb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 17:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t1CvvJPo1SMEVY2U38YctB/9fHmQv4dn7y8tFgTVZEk=;
        b=z0oGwMHu54BCin2PPXEa6MShFm8dXjJyFNgy0ghXHteAcGyCTA0oar+eih8/bCk54s
         jN+Urot6GEI4wyfsaybIVclOhBXqi9TiN6XEzIQ6VtNZ/WEmLF/IfVnCVZCLjUHgXwvt
         0cvGoMsYscWzHOfCsJT+IC81cBz84gxmfot5AKweJsucj8lEJxX2aIDZNue5Ncu9/6TP
         YY5RaDw8RjpFReV2xXvN5hYvtHccfoqvPFT2h1ZEc7Pb3QYnYKBJuzCvMYYhd8jMaTct
         fMRLFD6f6lxbVUi75n4juFpIZbLzhJLusXkVxnGrPeJ21wdx7NwtwrZxw2qvUNlnxref
         1AYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t1CvvJPo1SMEVY2U38YctB/9fHmQv4dn7y8tFgTVZEk=;
        b=oZf9JwFq7wPKPJRbrhlLNUjdkvYvnTokYr2gZRfEAleUGWpVSFkoPmiC2YG2ztSqoL
         9iZAPLgonJMXMKK3c5xALkUK33bTWT4gIgqGzg8nOAIeielevKtXw1PlF7WwfbyDNJa3
         3najkqKXU+iaX0pK3ENqtwxWDf+6nIYi6mWUWoz19KvFRnMOAbY3iCou2WqWhhpp/M0p
         /dGTTfksLZdIZ/PsrsFy6C4IRHE/s7MTDvFu0R/wfYxkMVcTaSlgefI3PnCMQynaYeAE
         ZcAzBsXu8C01e7jkJvnDldoCsvFS96pkPSTWfVYhwKN+7wTCpSb57wU83ceu/3IaUQp8
         zk7w==
X-Gm-Message-State: AOAM531rUHrtvA1I8M54cXP4EE+mHbjp5tnhSh41QeVHDRH/T9hfPtKC
        vItGHW8ZX2h0EWIMNZk9G2q2Yg==
X-Google-Smtp-Source: ABdhPJwNTGDuEvQcrOGBBfbHwE/fQEJbVVwaNmkJ1FD4XdFxy917AOrEW6wq2Cz5Po9ds6Wryhdfow==
X-Received: by 2002:a05:6512:309:b0:472:105f:e88 with SMTP id t9-20020a056512030900b00472105f0e88mr5056462lfp.232.1652486470022;
        Fri, 13 May 2022 17:01:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z2-20020a2e9b82000000b0024f3d1daeaesm626221lji.54.2022.05.13.17.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 17:01:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/4] remoteproc: qcom: Add support for CDSP and MSS on SDM630/660
Date:   Sat, 14 May 2022 03:01:04 +0300
Message-Id: <20220514000108.3070363-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Acompany existing support for ADSP on SDM630/660 platforms with support
for CDSP (660 only) and MSS (both platforms). Tested on IFC6560 (SDA660)
board.

Dmitry Baryshkov (3):
  dt-bindings: remoteproc: qcom: Add SDM660 modem PAS compatible
  dt-bindings: remoteproc: qcom: pas: Add SDM660 CDSP PAS compatible
  remoteproc: qcom: pas: Add SDM660 CDSP PAS support

Konrad Dybcio (1):
  remoteproc: qcom: q6v5-mss: Add support for SDM630/636/660 MSS
    remoteproc

 .../bindings/remoteproc/qcom,adsp.yaml        |   7 ++
 .../bindings/remoteproc/qcom,q6v5.txt         |   4 +
 drivers/remoteproc/qcom_q6v5_mss.c            | 111 ++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c            |   1 +
 4 files changed, 123 insertions(+)

-- 
2.35.1

