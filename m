Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E996F645C9C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 15:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbiLGO3P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 09:29:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbiLGO2w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 09:28:52 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D9036C71
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 06:28:36 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b3so28943054lfv.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 06:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+tqHHAIxeFhW3yvZHWiSjK7XfZq54YvDHTiWWGT5vL4=;
        b=oFuG7G2iBGIad6pNguR48DGgTRcMvks3pnZgiixbMzmSQcPtvUFoQRB4TqnDw59cR4
         5nzOIe8tQCuUs99til87rJgQa9roaVLSEOMzemTb0AgKdK6eOR3ddjVuhgZ51kRT0NJO
         GCnskhRkCJqn9qfFn7JpZktD2+L3MhS2ayGow5ttnhHUZzaXjAzEVNsFK+IbTZNghZWx
         NenSn5MJf1L5YNtjwuKz+6OSvjyxu5KUvhebgc/k3syLMfRBDudmkkXd3MyHfAeoBUt6
         WJHH5RsvrxIbJWgGJ69A6bBDEn8AvRVSNrj5Y3SKmElDKKamUXznlhrAYFZw5O/Q1Am7
         adoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tqHHAIxeFhW3yvZHWiSjK7XfZq54YvDHTiWWGT5vL4=;
        b=oc8eDbfsiLrkTi2K9xGnloljluAoc+oNQPko4raCChQ81iDrLAxiS1Zv7MNrFr8vL1
         paUSJSjkBokrqCr0V/0HlW/+LUH1/Jy6w5o5d0kCZKXrVuXW88l/yZ6OTZ97qBYVuths
         wJJj1PptinSaZEuiyqDCxd3oHu9LeKlBkjz/hpk+rsyPeC2KtDVIgVb4HjUpD6K1Gon+
         Uyzbpo5XwMtgqfaB/2ydrBYMMTrkeE5c+sqVN7qYl/b5UTjEbZptqX9ovk4HDxl0NAqx
         w9i8zCUevvOwqBwrExJGmAZn8+iL/8dGalFNBjnQFl/DteSWKlLNrfStscCe5KMJWbXl
         ZGOA==
X-Gm-Message-State: ANoB5pmw7YRDvCyqv9WlIxq6JZozzw43q41Dc4UOpGeCyXdMW3qjbq3h
        Z9hlveilH+kYOxb4qVg0zfm4yTT5KQPs1KdzOis=
X-Google-Smtp-Source: AA0mqf7GGNT/dLtn+g6Iq6FngOfJZpkZdIi613eu3Q2lGbfEoVEW8h+M04Zc+gpyZjBd2Fvgo4F0nQ==
X-Received: by 2002:a05:6512:c06:b0:4b4:a843:38b3 with SMTP id z6-20020a0565120c0600b004b4a84338b3mr26443939lfu.417.1670423315233;
        Wed, 07 Dec 2022 06:28:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f27-20020a19381b000000b0049fff3f645esm2863430lfa.70.2022.12.07.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 06:28:34 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm/dpu: several fixes for UBWC setup
Date:   Wed,  7 Dec 2022 16:28:30 +0200
Message-Id: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several small corrections for the UBWC setup and related data.

Dmitry Baryshkov (3):
  drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
  drm/msm/dpu: correct the UBWC version on sm6115
  drm/msm/dpu: add missing ubwc_swizzle setting to catalog

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 6 +++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.35.1

