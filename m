Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC4E56364C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 16:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiGAO6h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 10:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbiGAO6f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 10:58:35 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5531E205FD
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Jul 2022 07:58:34 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id g7so2868741pjj.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jul 2022 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rkpnlSkk4qpL76Q9krzznDoVYhFZ+rUshI4F4KRqe3M=;
        b=mxa1Ao15KkXA77XwSOFZKBA4ApknMDG7Fc9wFWLRPQk5uz88B/4TxL2k58UXlrneVR
         jXcgSKrB8R50aAyq+ny0APa7nykSKFGPJHo+E5SX79HxXjkJQTfF/+xxCp0vtgY0Uthw
         0nMG+tcu40IEBhdNirXqn5pUKKH4qSihUcJ/Cao8z1nlS/G689tC9+JIW6Ip5/Db/fq7
         fFV750KnECmZMI1kd6N1Re3wdpvv+FKTD5+R2VMP+dU6oHzcXk8KwCHQU0SP2sc1gvur
         aXuTSpzVR33yNwLV6pSXIXlBq7K0Dz88d02puu/Awa1TOGQoqM+rayy8IbKHiHNWHI8Q
         cqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rkpnlSkk4qpL76Q9krzznDoVYhFZ+rUshI4F4KRqe3M=;
        b=XOz3s2U/SH7PYUpkAqzhSrmbpQ5D0SNjV4Q2s8eLOou/HYTRPQBDlhXDU69Vv3e+Bk
         Sk6KDemBLGkb39oIkOpwX1JAAm+aFYB/Xg6i/B3bCuBpi++8VT31E2mS7qq/R0Ss84d/
         c1b4eHw4P0IZV4kK9lvgXMAh2kHvPDrwnytIdKfWfuaJLcRGAsuDE8VTVtL67bwtybDS
         zAi9nj3q7dU9kfBbold6R7Rl99Z+hfd2mFV3Yffv+ZyhZlIrbemkROf0kRcQWcogtWs1
         8Rsb9eJL6UweOWSZ5eUkENsqXEY7WRpFUiYE87WetBF8/mTel/SL+XkdPk1E9brGcYtn
         gY/A==
X-Gm-Message-State: AJIora8SkPoOaVdHn9Ln6oKwDD7HZ+PDtiwIK5yIqrhU7JHXt6miEvGE
        ieSJKApda2y+EZIVxSccQw+y5Q==
X-Google-Smtp-Source: AGRyM1tGoZAz4ozl54hjtVhmv2BgnjXF8W1zzZHLqPCFSakUSRkwxVbfPNXOeZJE96ALHobBrH8CXA==
X-Received: by 2002:a17:903:18d:b0:16a:6faf:c15c with SMTP id z13-20020a170903018d00b0016a6fafc15cmr20304593plg.87.1656687513814;
        Fri, 01 Jul 2022 07:58:33 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c5e:e6c0:8e75:c988:f80f:8bec])
        by smtp.gmail.com with ESMTPSA id y19-20020a170902e19300b0016b844cd7e9sm9641399pla.115.2022.07.01.07.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:58:33 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/3] Add support for tsens controller reinit via trustzone
Date:   Fri,  1 Jul 2022 20:28:12 +0530
Message-Id: <20220701145815.2037993-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some versions of QCoM tsens controller might enter a
'bad state' causing sensor temperatures/interrupts status
to be in an 'invalid' state.

It is recommended to re-initialize the tsens controller
via trustzone (secure registers) using scm call(s) when that
happens.

This patchset adds the support for the same.

Cc: Amit Kucheria <amitk@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

Bhupesh Sharma (3):
  firmware: qcom_scm: Add support for tsens reinit workaround
  thermal: qcom: tsens: Add support for 'needs_reinit_wa' for sm8150
  thermal: qcom: tsens: Implement re-initialization workaround quirk

 drivers/firmware/qcom_scm.c     |  17 +++
 drivers/firmware/qcom_scm.h     |   4 +
 drivers/thermal/qcom/tsens-v2.c |  14 ++
 drivers/thermal/qcom/tsens.c    | 241 +++++++++++++++++++++++++++++++-
 drivers/thermal/qcom/tsens.h    |  12 +-
 include/linux/qcom_scm.h        |   2 +
 6 files changed, 282 insertions(+), 8 deletions(-)

-- 
2.35.3

