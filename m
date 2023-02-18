Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA3269B773
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Feb 2023 02:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjBRBZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 20:25:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjBRBZv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 20:25:51 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A524F5D3EB
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 17:25:49 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id d24so3700975lfs.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 17:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vZN8uJ9WEeY6aEq+aXSFu1WAwsJtvGTMBCWQRkOvTtU=;
        b=RG1ZSQCxSbFEH1zRFfiy/r0wIdVzpKvZX48cpn/j6poDVcgHQlHU3Yfls4vRV6cl5G
         ohXair0HwZK3cV/FqTV0ma1q7Zs6ooF40EsnI+l17MLuzg9QPZ6Tx9asqMNewWLX55nR
         QBhotNlTyKzExBaA2o2ZISUzRUjVxXFFEfoy9zX4XrBDmzvQx+sATIGCIVi6zLXX41WC
         Kw7RTpSL0PkEicZ/9Ua1eojUTZ0cAtjZWryi7cz7soKBKx3+yw2jz+aMfCFteGnwinq0
         9XI3J+dxo7CQR6UcjamiakK7i40M9MNhF4XeMN43+qrt7VtenKJQLwrAjzaClmHTPo38
         b5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZN8uJ9WEeY6aEq+aXSFu1WAwsJtvGTMBCWQRkOvTtU=;
        b=16Q1AdCaBibkpxuV1VTgshkat8BewVB3MWqVbz1Mg81sGD1j54PEepkRapQKVN3Iyj
         3VABnVjkF9pcJZVJGlPv6riDkwEF/5tYb4UA82vHZA29YOc5zEY98nRXZGMzn/moPWT4
         E3rAyPm/JWD+VpwvujjgWMEpMura9l3vAE0Pf2/TfST9twvx5B4xDJXZKNiNwMlL7/7X
         NiByyLkk+OKv2A/Hwxre3qp6PeNP9p6fHL3uBWYmmlfEd33o6QfsabOofMNBWiaW75GB
         h2dhvC3I1YaEkEh2axU8WG5hOkD+K5vgMthJUs7BsUOViqKD6PMf0Uv1GtgfkaGRCiht
         cSmg==
X-Gm-Message-State: AO0yUKURYvZpRgV8+oZIFb3zG9ylBFfB+ewrk34ZFHMpB3V41kKPjvBF
        LYz1gVPU+mId32KC3UeBBZi3VJ4r+yj+1dgC
X-Google-Smtp-Source: AK7set/GPnstIoBrqi4vNc0v8xAxOwkrJsHUWl+EZb+jCq7yRRK8uH88DiUVmkVInScxTfDSlpqo2A==
X-Received: by 2002:ac2:4852:0:b0:4dc:828f:ef88 with SMTP id 18-20020ac24852000000b004dc828fef88mr1182462lfy.7.1676683547934;
        Fri, 17 Feb 2023 17:25:47 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j11-20020a19f50b000000b004d85f2acd8esm826414lfb.295.2023.02.17.17.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 17:25:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: rework msm_parse_deps() and msm_parse_post_deps()
Date:   Sat, 18 Feb 2023 03:25:44 +0200
Message-Id: <20230218012546.3655999-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
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

As discusssed in the the review of [1], rework these two functions to
separate single point parser and provide clean error path.

Depenencies: [1]

[1] https://lore.kernel.org/all/20230215235048.1166484-1-robdclark@gmail.com

Dmitry Baryshkov (2):
  drm/msm: drop unused ring variable in msm_ioctl_gem_submit()
  drm/msm: simplify msm_parse_deps() and msm_parse_post_deps()

 drivers/gpu/drm/msm/msm_gem_submit.c | 206 ++++++++++++++-------------
 drivers/gpu/drm/msm/msm_gpu_trace.h  |  10 +-
 2 files changed, 113 insertions(+), 103 deletions(-)

-- 
2.39.1

