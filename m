Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F422F7548
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 10:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbhAOJ1E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 04:27:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbhAOJ1D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 04:27:03 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABCFFC061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 01:26:22 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id r12so962070ejb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 01:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=vDNWe9SExBcSEaoemf3OtN0kfWB4/cSdfsn+A0UJ1TA=;
        b=WxV0aiw4/eeRUurfEPcLjIV1Nly68SHLTaGW3LaZVsyQtDHcOdSh+qEy4+sBr8VJ4/
         PWuk7W56ZB8h7KhldyZT23RgNRsK8FhctCVoMo39qD4Kq/LR9vChSFmH3+KF55XWOuGF
         J0esgtkQvxGNnDKY8GutVDE19TIIFCPZhmcGLrP47eGk1Yx9KI7bnsAvGf1wnbH3oeKd
         uiPg2EXvfgGsgTaJo4QOx70orlGdD4rJe+2WvNkt0X5iujD+FJ4Vx25d4BVqzNDHeteu
         UC/APGxpb6uBLjHojp6Hoz0pzgLv6RyqPhQmwJ6AHu71erIy+wInuAC05SfbWh1XyPoX
         Mwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vDNWe9SExBcSEaoemf3OtN0kfWB4/cSdfsn+A0UJ1TA=;
        b=RUGJGnUj2c60mWeH/mY36BBLPRRKUlQDL5Lh66EXu8ZLS5Vg2nRW3+FnYR/bqXg0Pf
         q5vN+c+pbgfhm5rhM9gDHMdKyUnkv2rJVplUm3usItXxSTFOW163FVER1DhfOSO7u8/s
         uN/3AP5tTdYfUAYPCiaN6eDSFjfv6i07YTp+XxtDC7bKxA53uiyRSAhfwSwORemH7/lu
         EehfaGNcmfzyvQ177jPyIfIy9nBedru/ZkN1sQoMDo/RGDPUV0TPsUbHE0Z9MHIZIMJs
         U1BVNbQJvnNNwYjR7OmZBpcUxAe0AlsdxM6rpVDkGoxnsOWYbcY6mIlCJmv+LaOzpS34
         VjiA==
X-Gm-Message-State: AOAM530vmzo0WlGMR7/oKSN8KeRvD39/yGlBqFY0lP1D+7Ggs+H2cyRS
        ctQDJAVnyps0xRCh3lHG6DCpRw==
X-Google-Smtp-Source: ABdhPJwD3jmleW0rzYZX2C+la0RyvfzaytBAQs3YdamrnApuaHLKkbLcX5xAkfifuZn1zBOF1kJiJA==
X-Received: by 2002:a17:906:3a98:: with SMTP id y24mr7665040ejd.436.1610702781376;
        Fri, 15 Jan 2021 01:26:21 -0800 (PST)
Received: from localhost.localdomain (hst-221-63.medicom.bg. [84.238.221.63])
        by smtp.gmail.com with ESMTPSA id u24sm3004140eje.71.2021.01.15.01.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 01:26:20 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/4] MFC private ctrls to std ctrls
Date:   Fri, 15 Jan 2021 11:26:03 +0200
Message-Id: <20210115092607.29849-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Changes in v2:

 * use _DEC_ instead of _DECODER_ in the name of the new controls (Hans)
 * rebase on top of media master branch

v1 can be found at [1]

regards,
Stan

[1] https://patchwork.linuxtv.org/project/linux-media/cover/20201109173541.10016-1-stanimir.varbanov@linaro.org/

Stanimir Varbanov (4):
  v4l2-ctrl: Make display delay and display enable std controls
  venus: vdec: Add support for display delay and delay enable controls
  s5p-mfc: Use display delay and display enable std controls
  docs: Deprecate mfc display delay controls

 .../media/v4l/ext-ctrls-codec.rst             | 25 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  2 ++
 drivers/media/platform/qcom/venus/vdec.c      | 10 +++++++-
 .../media/platform/qcom/venus/vdec_ctrls.c    | 16 +++++++++++-
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  | 16 ++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  4 +++
 include/uapi/linux/v4l2-controls.h            |  3 +++
 7 files changed, 74 insertions(+), 2 deletions(-)

-- 
2.17.1

