Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B93A7788DCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 19:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239647AbjHYRX5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 13:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240597AbjHYRXY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 13:23:24 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CB42130
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 10:23:21 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bcc331f942so14651341fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 10:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692984200; x=1693589000;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r+IbZPjvkKJyHb1t49FSi3dEugB3CnJDHGvd+okiiCs=;
        b=L6Fqf83e7W5LtDR+x18E59//1P2tJRk15WBcSKAB9RqKpy0FI6/zxZK44xfcvY226t
         3q0OgysfbKZMyiFhlfcAidNIk7MyJp0uNO1bk23xTDjvLum69uOT9ASPZKL3Ps28XMOZ
         fD0IskR25QygVbt0lWRChtt2U6Ei3UbhIEqj0E5IEAQKczz1FK3ER5oNqugYYHBxQ6YZ
         Hrj6Zi1RJ//A8LSZgK/P18Jix1acNjrNTVw4bK9ZChnm9TXeJqN0OxG+oy7P3PDHfq45
         DDMBdVrQCI0+no9eDWdTuhUgfa+XyFpRnME4EALFI2SI1UTrz7w4U+iF5v6Jjjpc5X5g
         DfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692984200; x=1693589000;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+IbZPjvkKJyHb1t49FSi3dEugB3CnJDHGvd+okiiCs=;
        b=N5U95cVcPTg1fFSQYnVRqu6vo+hDyvonWrtLJ56EYDrGtDtinCnDvnRWpRvReh+Z+E
         Bt/0O1bkYnDSO1E4rAQJw3TksNtz30VmWP1dEKa0U/6J/rvPYvR79IuSryR6tmUT1+n8
         p2qUFu2eWMWcqe3b/WkgmeAB1YQf1ZGKsikUDlqm//bfis7Yuu+VUt2RocYqBzBXzL2S
         8oxO1h5+GtZWGLOnuN42/Qf/C6Yw9H5jzjp9DJC8oyIP+o8gj2Tku0FnOjaWPw057F43
         0B0YOOYXmq25dCE8j9u4DIPEakRxjNWdpujzR4XMNdLVRTYQwmisDdICfO3kTzmv5+ih
         FBxQ==
X-Gm-Message-State: AOJu0YwdyBlQf9EmnCoOK6vgYARRod4uVTwP/OMDxaeIH5klYDkZKAGj
        +UW7E1oVu5z6lx5BV2pheGj4Uw==
X-Google-Smtp-Source: AGHT+IFz74chb8GNV0TvbPeKiDYOfdvYxFbfaLudKM3TO2LC00g7saucA952LOvNyDlPCmD+YEaArQ==
X-Received: by 2002:a2e:8e75:0:b0:2bc:d3b1:d6c1 with SMTP id t21-20020a2e8e75000000b002bcd3b1d6c1mr3922260ljk.9.1692984200023;
        Fri, 25 Aug 2023 10:23:20 -0700 (PDT)
Received: from [192.168.1.101] (abxh59.neoplus.adsl.tpnet.pl. [83.9.1.59])
        by smtp.gmail.com with ESMTPSA id n11-20020a2e904b000000b002bcb1e1322asm407647ljg.63.2023.08.25.10.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 10:23:19 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] SM6115 TX Macro
Date:   Fri, 25 Aug 2023 19:23:11 +0200
Message-Id: <20230825-topic-6115tx-v1-0-ebed201ad54b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH/j6GQC/x2NQQqDMBAAvyJ7diHZEKl+RTwkca0LEiWxRRD/3
 qXHGRjmhspFuMLQ3FD4K1X2rGDbBtIa8ptRZmUgQ868yOO5H5Kws9afF0ZPLhgyfed60CSGyhh
 LyGnVKH+2TeVReJHr/xin5/kBQbU9P3MAAAA=
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692984198; l=733;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6lIAsjfzQ31TGPmRwzbj9mEehySlk7glxjS1fp/ikjk=;
 b=95YZjoDqhfV8cGN0KBrCUDtJnXEOnqGCQEDqlozHGrWV3GbSNhrb33HP9DBfPL4rahhYhRC1E
 ljV9+8EF/L5CUQ40uPHOJqDbueF3gRSLJ5JkXAgwEm/uv2EzWNBmKF7
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Like most Qualcomm SoCs, SM6115 has a TX Macro.

Only some minor changes were required.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM6115
      ASoC: codecs: lpass-tx-macro: Add SM6115 support

 .../bindings/sound/qcom,lpass-tx-macro.yaml        | 18 ++++++++++++++++++
 sound/soc/codecs/lpass-macro-common.h              |  2 ++
 sound/soc/codecs/lpass-tx-macro.c                  | 22 +++++++++++++++-------
 3 files changed, 35 insertions(+), 7 deletions(-)
---
base-commit: 6269320850097903b30be8f07a5c61d9f7592393
change-id: 20230825-topic-6115tx-b523a0209639

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

