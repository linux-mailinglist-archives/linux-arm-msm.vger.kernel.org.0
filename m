Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17292295F8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 15:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2899438AbgJVNRJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 09:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2899437AbgJVNRI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 09:17:08 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9353C0613CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 06:17:06 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id l2so2246898lfk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 06:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4cZy/AjqiPLBBzbbE7V3tBG3u2sp2EHfPGRBFkrlTaM=;
        b=FsGguWzrpplV4xHNmKGYDfgZPhItHJckO1QODklJHOpKes8Qos3h4xh8ChFRcgSbcK
         D62cd+ruCBaXJu/t4VPJW56lHd9b8fsF3Ni4RGyX41Tg/MHdW79SACyy4K1/R+3rK53k
         JIix5Fuc3w4+sRD1Obz4eFTCdrmRY19ui/V8mJYYvLPwSli8JxTy9a27UBur5oZObppO
         pcjP29jvMZCRma9p+wKLhVeEcZm7NYmgu65ixISNUPLu2CZ1YFMX6xiEpRrrUhGpRIML
         MPK6J98Ic8kZzu379ElWtOgfeqVfb/Q1Gqshrhd/85cH2Aw0CMyfDhQONMWplMiVIPdo
         jYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4cZy/AjqiPLBBzbbE7V3tBG3u2sp2EHfPGRBFkrlTaM=;
        b=eLS3wOC9eB3HAih6Na94Qjur9cUQDsGKGGfPbRBOjzcAfdKP3jJhLQENpdegAh61l5
         whdHqpgtS+Jt56veLIvrFJJ+sbEjklWlm55jiK0TWCTd7GSKYgu+RQBQ+DyyL2XVak8z
         25rsBuOeSBUYaCj2mf2moL76mcotoMAMVoqW58vTK+wnKd4d2mcin7Var2zF52CiWhyW
         IOaUUq7dRYeTGVUrAQA3Y4tV6yo2Wd5StJ/87KLZteVgLINevBWsprDM/Zo8GAjoVBfK
         goqSzZUCol4E7T+irWZL90uzJPrsLgjV6g9/0fpA2wNlVU7lUhfx3PcBjinWDb3D83B8
         P4Vg==
X-Gm-Message-State: AOAM530WY0UGKkhBZxbk7c02GD/jBvAqDTMKgxefslRXI/9PC2x/EEyk
        akIolIut7DXx7THFKuufJs7mWw==
X-Google-Smtp-Source: ABdhPJyEIkAP9fTCR/BTts4yu+rqPpOxob4rKB3tnkdtba+DmfmCYVJQNBt/OsFlnhXj0KdLdkH7qw==
X-Received: by 2002:ac2:4ec8:: with SMTP id p8mr806198lfr.433.1603372625381;
        Thu, 22 Oct 2020 06:17:05 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id j10sm308514ljb.93.2020.10.22.06.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 06:17:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/5] drm/msm/dpu: implement merge3D support for new platforms
Date:   Thu, 22 Oct 2020 16:16:53 +0300
Message-Id: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Compared to SDM8450 DPU devices with active CTL support (SC7180, SM8x50)
have merge support implemented in a separate hardware block, which is
not supported at this point. Add support for dualpipe configuration on
these platforms. Tested on Qualcomm RB5 (SM8250) platform.


