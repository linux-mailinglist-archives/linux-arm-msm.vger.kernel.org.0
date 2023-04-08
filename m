Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7086DB7C9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Apr 2023 02:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjDHA1y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 20:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjDHA1y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 20:27:54 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D8AA26F
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 17:27:52 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i26so483220lfc.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 17:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680913671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QocMDDn8DwDw0qXiJTkMUymAN7joIFS2Ye/0Qdix5yY=;
        b=kQGdvRwOxmR5CbW2yGId9v9QFtdAJqYLpfbA/64abBc1mKJlAva0v1467S0967Yez0
         LmJLVWc6B25OxvfYbKZQh4wSedertfHOaTIuHXAMQ8oFQquDafVdY9QkE3O+B0yNqgzu
         SkXiW4xdG06jP2xKacgOkh1fox5q1tX2dlpchyZ5Hf44amJr+LGLFRpraqNxvd8FNSRT
         DfSjz3+M+y1F5hA/hsplZls1d0zm//n/MLnZI6QxmcZMmVrHCLuRmPRJfrOr/kvvziWD
         4SwhmxK4PDMB9++lezacv84PevIhzAXcFeKeq4fHcpyWXAgLy5om0BU7kag0ZvXMO/Ws
         aTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680913671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QocMDDn8DwDw0qXiJTkMUymAN7joIFS2Ye/0Qdix5yY=;
        b=yEgc5/KGxJ6/Qhu+qUjN1nkBoyajd7YfSnjV3oQtZxinCswYxX72Tyt37emOKtZxYe
         Mg0LT8HuM+iSmczacqsL7fGFTc5L+umSCJTMBSvKi37Tiuu5eyUHfLo6+izn5/RSoYwL
         Gnti4hZNHZ5CpPHwRIMBd7qTm93tNN8BSsY0HKh6aQ3DcoXRwSnauGYomgi6+XtcWJO3
         OA36e8FVuyJsI2QIvkKz/6e7KkwAzoVdr8DHZpUubnqi9lHNTphRzOCNAT44BdKW1dM5
         4dS6gpj2ujdSTMN8xMWZ3WTdlTx0XuTGxN0qTCk4/9fHf2i9R8XFSdI3EVpegDZ21EIz
         t6rw==
X-Gm-Message-State: AAQBX9emu4LyMbk6yRxF+RrSv5tqI8wOA3yC5MbqBZyxM7e0d+eriq6Y
        rSDRnws5HDoFapt7AhZkAk+VYQ==
X-Google-Smtp-Source: AKy350YOBr25W7qvgcoTETSbm44LgFRivLUr/kIUFzRDxT595IgxtGtCmYCspyO9iqw04hO4Es/oEg==
X-Received: by 2002:ac2:4d12:0:b0:4e9:aeaa:ddb5 with SMTP id r18-20020ac24d12000000b004e9aeaaddb5mr1143901lfi.14.1680913671031;
        Fri, 07 Apr 2023 17:27:51 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q15-20020a19a40f000000b004db3e2d3efesm915759lfc.204.2023.04.07.17.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 17:27:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 0/4] drm/msm/dpu: more catalog fixes
Date:   Sat,  8 Apr 2023 03:27:46 +0300
Message-Id: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a spin-off from [1]. Since most of the patches have been merged,
split away the small fixes. Continue the versioning of the patches.

Changes since v4:
- Fix commit message of sc8280xp patch. It is split display/panel rather
  than split source (Abhinav)
- Added DSC_4 and DSC_5 to sc8180x patch (Abhinav)
- Expanded commit message of the sm8450's CTL patch to describe all
  reasons to use existing masks for the SoC CTL features.

[1] https://patchwork.freedesktop.org/series/113910/

Dmitry Baryshkov (4):
  drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
  drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
  drm/msm/dpu: enable DSPP and DSC on sc8180x
  drm/msm/dpu: use CTL_SC7280_MASK for sm8450's ctl_0

 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 28 +++++++++++++++++--
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  5 ++--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  6 ++--
 3 files changed, 32 insertions(+), 7 deletions(-)

-- 
2.39.2

