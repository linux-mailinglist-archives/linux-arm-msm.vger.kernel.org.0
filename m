Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E48734BF203
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 07:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbiBVGXQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 01:23:16 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:44726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbiBVGXO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 01:23:14 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E3B6E7BE
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 22:22:49 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id e17so17864970ljk.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 22:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LIq4bg+MO6Oyb37j5MwhzM5fJY4ZyeCVsa1dQRFEVag=;
        b=M9KyMlC5z7brdQgMY8m7UEY+DN4P18MeL7FBguxBLadrVu7YscCPClmcEAdrnGHkJ+
         Zll6X5mzu9C7UQNAMdJeSQnh4VnoruGB1WL4/fYt+YgA36Ig2N4T4SnrmIc+Mz8kxxXb
         luOmdhvvXjWdyLn1BMXLH6WC9STKmS9VL2FQHv9GXcDQe9qctmvdnZb9fll76AAb9v6y
         Bb+Lv+Z7NbvFDoojK839CrYuiLImyhGWIUlBE4DU77vRAKeuc1YUxtl4W73bGV2sl95j
         ozljGlv2MK0zXmw53HvuCQwfOHptsDWS7khKVD2hEB7rNAckRWSEmStM1U2kbdO1B6hN
         2loQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LIq4bg+MO6Oyb37j5MwhzM5fJY4ZyeCVsa1dQRFEVag=;
        b=dMPl1d8mFc2GqEGuPXg1DH0I407FX3JLIMtVXdqWoUFqlhqHtlKosjKU6z6C/YRoFh
         I8qZgMkPU1gU/zt9G/7YeElTE+/ebIovTZHHnG5xqg2/18BZ+3zcNSaxA6MAIg/sSd7q
         +J9u5GrOSv2nBTerCVSUjWHlBbExRN2OealKuobJSxy0HYg7xaM8FICRx9i+niSuscmQ
         COpsOA5qdbahZhusI64X40CxWV5+5a92E2mOZC2W2iab3Vhqlxtzk1dO2lG5nx9U972D
         WWL1wLM6+wSnNA9/21i/TovQ925SOF9dbw/OnFSeXgKTQFKDNdSk4UMCQO3ENbBADYP8
         9u9A==
X-Gm-Message-State: AOAM5328S8BMB7Sq/uewLjAbwJXJP5l7hAiifN5Z+sv2S3wDgB3fhPmq
        JJDmLAagPSgYeyXjQtOm7/Nwog==
X-Google-Smtp-Source: ABdhPJzwn/5oF3bIJoVV/+i21nTWzNVckHU+8VeQm2lh4uABLti6/ykYwPcHN5EkYFE0IsGYCA2oEg==
X-Received: by 2002:a2e:86cb:0:b0:246:12b0:940c with SMTP id n11-20020a2e86cb000000b0024612b0940cmr16682411ljj.40.1645510968017;
        Mon, 21 Feb 2022 22:22:48 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.65.160])
        by smtp.gmail.com with ESMTPSA id j24sm1216245lfb.59.2022.02.21.22.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 22:22:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/4] drm/msm/dpu: clearly document INTF_DP vs INTF_EDP difference
Date:   Tue, 22 Feb 2022 09:22:42 +0300
Message-Id: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Recent dicussion on the mailing list [1], [2] outlined a need to document
which intf type is used for DP and which one is used for eDP interfaces.

This series implements my proposal [3]:

- Keep INTF_EDP reserved for 8x74/8x84
- Use INTF_DP for all contemporary DP and eDP ports
- Documet this in dpu_hw_mdss.h
- Remove INTF_EDP usage in dpu1 driver.

Main reasons behind this proposal:
- It's not always possible to separate eDP and DP. For example INTF_5 on
  sc7280 is connected to combo eDP/DP PHY.
- Using INTF_EDP would require us to split too many pieces, ending up
  with a singnificant amount of code duplication...
- ... for nothing. From the DPU point of view there is no difference
  between DP and eDP interfaces as found on current SoC generations.

[1]: https://lore.kernel.org/linux-arm-msm/0dac8ffa-89a6-d972-bdc1-3f7755c5169d@linaro.org/
[2]: https://lore.kernel.org/linux-arm-msm/be397e2e-05ab-5c18-8e2d-16c443f0a6d1@quicinc.com/
[3]: https://lore.kernel.org/linux-arm-msm/e2fab93e-82a6-4837-4ee5-ee1b16caa84d@linaro.org/

Dmitry Baryshkov (4):
  drm/msm/dpu: document INTF_EDP/INTF_DP difference
  drm/msm/dpu: drop INTF_TYPE_MAX symbol
  drm/msm/dpu: drop obsolete INTF_EDP comment
  drm/msm/dpu: drop INTF_EDP from interface type conditions

 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 +-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  9 ++++++++-
 3 files changed, 10 insertions(+), 15 deletions(-)

-- 
2.34.1

