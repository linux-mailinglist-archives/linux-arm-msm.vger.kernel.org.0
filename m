Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78B3554F57D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 12:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381169AbiFQKgU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 06:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbiFQKgT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 06:36:19 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EFE6AA6F
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 03:36:18 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id d18so4293029ljc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 03:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HADbm2Q0iXz5TZbFf0x7dUMSunNE29kysn4VYUvxWAA=;
        b=SEamXvUPZtDClVb+it2ZQnT30PYuKodPn7A/WyVg6obnHTEkPDJ428TlByPbYDKaJc
         4rVdVijNvzxichCr3rxvv5wRQRAeDm4SX5/zz+PtvIRCHR9e39PamDppRJALnU/30JjL
         6q8fQXnUnzi6Uc+c4qGH2mCBIeGphmnL2Ic22c0M3rWbHDs1C4KGccUchgtfge90yokd
         nhF8CyJE2YOWaaSYTHaVz8YzGvV87pFqHKVQPvzoYfgEjbWXY8agLlWZaeYj4/nVwISh
         4t9ey8jeIaDv+dPkYWV3I4QN+pygEz/O5XEdbtIgawfTOmbMAi6KrTQdR2su+liBW+w3
         8bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HADbm2Q0iXz5TZbFf0x7dUMSunNE29kysn4VYUvxWAA=;
        b=pF9flKJPzzOe8D+Ns7EBkMlEGifzLdtjGjPX+5XXaSUixeZVnh19WKtrmUwlgqCBFq
         mr14Zxfm8SJeTji49Jp2bftqDaXp6u3l2yV2zd+J730Emw03O7CYDp58I/HcQGSEu72C
         c+i31wuujVS0nxrZKgVCEh6+T4NBuNdJGaGzBOrVmc7w2fn2buVsS2E2uKwTmyzRH+3/
         qfhlR9c3nDOEv7B5nzGXlOEEL5fPxsUCPAwic61tCqfVY8LnsIYos8gVDHICRVCv+Mik
         dv3Z76TMTItJcnbi0HLTMAfooAdiRIDMSAODSFtQjcqHPQS15URD4pDPRYoSufgSwP4E
         piZw==
X-Gm-Message-State: AJIora+Y7Jbgi/aWDhKdlqfOtTM9EzRIVF8styTwnfN+ivu4cOySMJ5D
        woElBZPntq6cUTyS8yUsBq69Gg==
X-Google-Smtp-Source: AGRyM1vCISv5DGQKfk8IeXYWAss+EKIjGwI/FSSIK50PMS+dysHBeXd4oFs22JKiVbKZeCeXKkdg3A==
X-Received: by 2002:a2e:9cda:0:b0:255:6bfd:3bd with SMTP id g26-20020a2e9cda000000b002556bfd03bdmr4626470ljj.302.1655462170346;
        Fri, 17 Jun 2022 03:36:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d3-20020a056512368300b00478ff020832sm591803lfs.106.2022.06.17.03.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 03:36:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        linux-phy@lists.infradead.org
Subject: [PATCH 0/3] drm/msm/hdmi: turn MSM8996 HDMI PHY into OF clock provider
Date:   Fri, 17 Jun 2022 13:36:05 +0300
Message-Id: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
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

On MSM8996 the HDMI PHY is the QMP PHY, it provides an HDMI PLL clock
used by the MMCC. Add support for providing this clock to the OF
framework by registerding the clock provider and adding #clock-cells
property to the DT node.

Dmitry Baryshkov (3):
  dt-bindings: phy: qcom,hdmi-phy-qmp: add clock-cells
  drm/msm/hdmi: make hdmi_phy_8996 OF clk provider
  arm64: dts: qcom: msm8996: add #clock-cells to the HDMI PHY node

 .../bindings/phy/qcom,hdmi-phy-qmp.yaml           |  4 ++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi             |  2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c          | 15 ++++++++++-----
 3 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.35.1

