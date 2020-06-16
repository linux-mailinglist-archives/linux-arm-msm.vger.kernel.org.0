Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FDC1FB0BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 14:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728646AbgFPMbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 08:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728131AbgFPMbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 08:31:32 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40AAC08C5C3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 05:31:31 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id y6so8843946edi.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 05:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/1r7CkWYB3PvqDAm7Ot1fK+BdMOnYVR/V3utAsyrDz0=;
        b=aOuc3PNIXOscLHviWkmoerLaHV3t0vKE4OF+G+AsWn4rC9b6olH2lm6AItsGUbKi/e
         Qzelbl0GduFV1NbJPGME4+loz08IxPVRkUH1xpD4JrgFlmHcaVGUwM2yAM3R52OLybtF
         AJVq5Eiv9mPIPfNpHuY0o242bSrKMv7yzzPZyBqYTSQ/LApa/njqHNMD2JXQb4wlJN3+
         aTLfGbnILz6HCmPbJtPqHK2We/agFZqzcbUkP7Y+Gyy9po2YGEDFCH8f9RPe3aG2Ak8H
         oHX3AQbe7oQ/qyRukBnOKPINVdsAWs+xEbGe6RatIhDl69YPNnR4g1I3TY+BUWJxuJyJ
         7wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/1r7CkWYB3PvqDAm7Ot1fK+BdMOnYVR/V3utAsyrDz0=;
        b=Xf2MbC5qedZGqiBXTmE1xjY9w1euAKTS3rsFYqKmSCyvCi+qRd4sjlCyTA4J8fJgaa
         1TvbzFn2QDV2NToI2A3gwjp4exjCsvhu9FuGIIc7wL9bdWwpzS1WPd/XmNJb46xZuNDt
         kn+CskCQi5MFvvoMNBOOJn5ObT4rKWg5pcxhxemfKgJaXB2Npt+E3V6pdaP7+kdqIgmS
         evBacWAAjILyyVeNd+YqlmBMiQK7A0m/Afio6kPClN+FcbBUrYUaBakklIZtdB9zB+f3
         is8sh4iuxw06lgfLtWs0dX3xH31xqudtVXx5rBa0Mx+sI4J4tW3EJnSP1wTLuiPEJVWE
         cmJw==
X-Gm-Message-State: AOAM531mI/cNAjQCqydzhvdZi5WTJOzzJuob93Yn+wLdg+HXTggnbLTT
        mq6S+lqis5Kwo0R+RpN8NsDwDWZyl1V/Mg==
X-Google-Smtp-Source: ABdhPJzmX15Wn6UYFFsYF7DAkg/UYOnitBPHj6tHLVHQjeJ3Qti/lxHyPAuPlMdMfPP80Lw50X1wzQ==
X-Received: by 2002:aa7:c6c7:: with SMTP id b7mr2324483eds.213.1592310690397;
        Tue, 16 Jun 2020 05:31:30 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.gmail.com with ESMTPSA id p6sm11071983ejb.71.2020.06.16.05.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 05:31:29 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/4] Add two new v4l controls and implementation
Date:   Tue, 16 Jun 2020 15:29:57 +0300
Message-Id: <20200616123001.11321-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Here we add two more v4l controls:
 - V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY for encoders
 - V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY for decoders

and the implementations in Venus driver.

The original patch for CQ from Maheshwar has been rebased on top of
current media/master and the comment from Hans has been taken into
account.

Comments are welcome.

regards,
Stan

Maheshwar Ajja (1):
  media: v4l2-ctrls: Add encoder constant quality control

Stanimir Varbanov (3):
  venus: venc: Add support for constant quality control
  v4l2-ctrl: Add control for intra only decode
  venus: vdec: Add support for decode intra frames only

 .../media/v4l/ext-ctrls-codec.rst             | 19 +++++++
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  | 49 ++++++++++++++++++-
 .../media/platform/qcom/venus/hfi_helper.h    |  4 +-
 drivers/media/platform/qcom/venus/vdec.c      |  7 +++
 .../media/platform/qcom/venus/vdec_ctrls.c    |  9 +++-
 drivers/media/platform/qcom/venus/venc.c      |  4 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |  6 +++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  4 ++
 include/uapi/linux/v4l2-controls.h            |  3 ++
 10 files changed, 103 insertions(+), 4 deletions(-)

-- 
2.17.1

