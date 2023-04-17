Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 350796E4D41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 17:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjDQPbS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 11:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjDQPbS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 11:31:18 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4E5C659
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 08:30:37 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4ec8b1b6851so1570090e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681745423; x=1684337423;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I8LbL8wHVmoQuMN2A2YYCMJWPp7z1pqeUMnyON+WyIo=;
        b=JG47fwq7zSttpAYNQSPKRmIoJOpFSCZ/9p2plC/Hd4GdYjYnqgqWeHfPSVDM9ZOW6c
         LX4TJoq5Ex0QOV1KwJqAPqz1k0YQGBPWc8Zq/6eshxaTDwWwas1ixYYlINfyvAqlIJ0n
         xgFRRqbY0AMMXz5c6ehyUL6JW1oBYt8qzczIbA3ZEMPufqQWAIhocrpz0Zyal6TOAT6B
         Q6MHC3grv0YCnZKOt4m+YrbUqMgry/s4nvjaAxm2DrGcOlD5Pgxqbpn8t7RYvZbE+XeX
         sXre8yDsxicibT9I91QJfVIWeNzDiUthd+QlFIez2SLtZ7VBLKPW5y3PYbz0cG3lbLKl
         l74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681745423; x=1684337423;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8LbL8wHVmoQuMN2A2YYCMJWPp7z1pqeUMnyON+WyIo=;
        b=hgh82vW4LldYqTPNFtgGlF7Ut2uvhVtoeNBcghxLOpwI1FpdUI9sEikLao1502HOnj
         qHjtJwm2BK30heKzslJIWq1rDA0mdo9c+K074K/jibSIIm1Mrl4kKUN9Wn1VkD7rnOPB
         BRzl4zD1E6a8VWC4tieyInO+9mCUDZpVjA29QziDYZjz9VMErVmgZjVy+M5RWasq8/AJ
         Ql7WyI/AAMeS2+LWXG/Rp4L52cQ280YuE6vTbdLq1ltw+FpGlaDHWAXqQrcbZ1Ps9T/Z
         AxTLZcaGb9HXPCTz+0wP5/5s24l+JPqCRMW0PlKfRVdwFDSxbipf2dqg2XaMCUProqdc
         xboA==
X-Gm-Message-State: AAQBX9ftimUAiECZuqNQ4GgRZqrI6RA1W0cKP9XwJ9ojkTYentW606zn
        v21Sn2+KdJc6rN6GW+rn4Yw/+g==
X-Google-Smtp-Source: AKy350a3Tw9fQfVihN2uzdE6CB5pgQeyBmA1eEZ4/bZBjcHnznsgDl7RIQAdJKDtBKzBRCzyfH0wTQ==
X-Received: by 2002:a19:5501:0:b0:4ed:be06:9e9a with SMTP id n1-20020a195501000000b004edbe069e9amr2186365lfe.26.1681745423567;
        Mon, 17 Apr 2023 08:30:23 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
        by smtp.gmail.com with ESMTPSA id b16-20020ac25e90000000b004ec8a3d4200sm2053439lfq.293.2023.04.17.08.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 08:30:23 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/5] MDSS reg bus interconnect
Date:   Mon, 17 Apr 2023 17:30:14 +0200
Message-Id: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAZmPWQC/x2N0QrCMAwAf2Xk2UBXJ2X+ioikXdwCoyvNKsLYv
 xt8vIPjDlCuwgr37oDKH1HZskF/6SAtlGdGmYzBO391Qx9w34oknEp7VZ5jU6SYxoFCcOPNg2W
 RlDFWymmxMLd1NVkqv+X7/zye5/kDpOQGPncAAAA=
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681745422; l=1380;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mhnjPjgyrCcQ+i64OauymCa5KF6SxBBllHrPHpBzDLw=;
 b=rVoFconVuc2rDcbx8eq5loFRaR3/QTMtcZJG3qdonQSsYSSfI9Zm2BlCKuTX3bLj+F0sVdSRTQrI
 DiBtMEIeCTeakogOWO44Fj4ndiSLXqFqMmI9zCOgWfQXym7j7e7n
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects.. from none to otherwise
inexplicable DSI timeouts..

This series tries to address the lack of that.

Example path:

interconnects = <&bimc MASTER_AMPSS_M0 0 &config_noc SLAVE_DISPLAY_CFG 0>;

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (5):
      dt-bindings: display/msm: Add reg bus interconnect
      drm/msm/dpu1: Rename path references to mdp_path
      drm/msm/mdss: Rename path references to mdp_path
      drm/msm/mdss: Handle the reg bus ICC path
      drm/msm/dpu1: Handle the reg bus ICC path

 .../bindings/display/msm/mdss-common.yaml          |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      | 10 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 34 ++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  5 ++--
 drivers/gpu/drm/msm/msm_mdss.c                     | 35 ++++++++++++++--------
 5 files changed, 57 insertions(+), 28 deletions(-)
---
base-commit: d3f2cd24819158bb70701c3549e586f9df9cee67
change-id: 20230417-topic-dpu_regbus-abc94a770952

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

