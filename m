Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF2F6CCF1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 02:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjC2Azf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 20:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjC2Aze (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 20:55:34 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F681989
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:55:33 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a11so14431184lji.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680051332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wspEvGhw3Ov/MaCptFOSLj1uP8AL5mjsZccbIYoFgs0=;
        b=qccSE5gDPyXWQOFV9gcvApZCxxiV5PsgFUrXDDldrH9yUic0hXBWom2Nrksb/ElU/O
         mTcNAQuRvcMhT3kfhyzFGb7WKrc3h2sbb0b46+HPWilPrM2kDsL0ZCx67YNcuwQPizkW
         v5MJxSkOrcf+EoI7HmXccn4vMfv6zbZu/yICCEoAtCtNGbMbhCW3gXcqAsHgSuMrI3Ae
         Rn5ouRGyQPOhczXKlht4vEEMspMjzNp72HgKC/JVgqYbZwiKXnTfQebbAeQePzRR2p0W
         YDpL83KibbT/IiflDxguDxNAjk/hoq1+pY2KPinIJS5rUTnlVeNPeNSMeGGAIEYnHOO4
         UYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680051332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wspEvGhw3Ov/MaCptFOSLj1uP8AL5mjsZccbIYoFgs0=;
        b=QaCjWkjgdYnC2juq+n0hWyBz7I0AQP1h3uHlzLdOp+/tBsam79Ix7Z1sH3ZKkc8+M8
         4XPanpir6TrQ4UClaERNchsJaobQIlkOrKn1AKB5dHVKlf+INCZqycRnApaXDCVfUAcX
         tGVlB3QgMOST/o2zuCbO/Vt8p+LezygKIADKN2LdHM6Wvn0e+7dCN5/KAb94T3NiZs5Z
         qPLPDt+HDPz4l7U5iDA5xtlvik3PuQZpjHFBr42IuZpegjtP2qP+trEgjqYgPHY2E/FK
         beRA8JYgjmxonJ59dbPb7qk+IETxt9/FpndoG4CgwoTXQlwV2xrgUlO4dARcjEIRkvmw
         sCPg==
X-Gm-Message-State: AAQBX9fjvyL74ll6jCYebWfHajjPibWQ52FOmHTs1yzMBzaMmL5cEhcM
        FL0hVPQJ04FdU5R3iwFlv2fh/A==
X-Google-Smtp-Source: AKy350azZ/8o/Tfo8luMhUstYP4ruMWmp+d9Nn0NFdeIy1LT1RDnDdV1l+BtCvu6KKGWHWJfb+4V7g==
X-Received: by 2002:a05:651c:22e:b0:299:ac68:4806 with SMTP id z14-20020a05651c022e00b00299ac684806mr5371715ljn.9.1680051331751;
        Tue, 28 Mar 2023 17:55:31 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a4-20020a2e9804000000b002a03f9ffecesm3007181ljj.89.2023.03.28.17.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 17:55:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm/msm: rework msm_parse_deps() and msm_parse_post_deps()
Date:   Wed, 29 Mar 2023 03:55:28 +0300
Message-Id: <20230329005530.1077468-1-dmitry.baryshkov@linaro.org>
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

As discusssed in the the review of [1], rework these two functions to
separate single point parser and provide clean error path.

Depenencies: [1], [2]

[1] https://lore.kernel.org/all/20230215235048.1166484-1-robdclark@gmail.com
[2] https://patchwork.freedesktop.org/patch/524090/?series=114362&rev=1

Changes since v2:
- Rebased on top of [2], which is a nice cleanup

Changes since v1:
- Restored dumping of ring->id in trace_msm_gpu_submit (requested by Rob
  Clark)

Dmitry Baryshkov (2):
  drm/msm: drop unused ring variable in msm_ioctl_gem_submit()
  drm/msm: simplify msm_parse_deps() and msm_parse_post_deps()

 drivers/gpu/drm/msm/msm_gem_submit.c | 191 +++++++++++++++------------
 1 file changed, 103 insertions(+), 88 deletions(-)

-- 
2.39.2

