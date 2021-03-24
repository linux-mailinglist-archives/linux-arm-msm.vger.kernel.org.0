Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA48347B73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236402AbhCXPAz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236269AbhCXPAb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:00:31 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED3FC061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:30 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id b4so8495654lfi.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=weTz6m5LXcFdcbmDULQSn+jsUrGC4/6OEmDiA/doP4o=;
        b=A6DZRaZ1ty5zT2tsq2EEmG7FYfPgiPI1yD48orj2sYeEunnaZ7My7QsOfr6BadnkfM
         xIzkJXosNHm6qtUS9jTnKI/8VKgRfv8qqNFDJGClJ6ZrKqhsnM/pUPuLSCpcHypNsYq0
         wf4j3574QjNCVMZ+ieGEgd3W5dc1lNmCDW3iq938TM/oNoECos14PllGZlEx6ZSMwPvt
         3/XPuCxY55Qyc1XaqhZOeqaC0F3oq5BeGk0pqQ86cfCJthl3r5+RbbEFp/JFA7Xl9u/Y
         pe1oZwnChyYZYHi2O95bJ8vXk3mh2ws8Szm0TDyT5SuXQeSQtNMQDF/7CHTqH4Xz8tY9
         9gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=weTz6m5LXcFdcbmDULQSn+jsUrGC4/6OEmDiA/doP4o=;
        b=C5I4maH6RyxEnj2ul8EuDUTkdvZQbX6l3eQRgpSG10ehxtmLReFihlNmgsIVURy5hg
         xLcbwWjrKTW3cWFrUw+SRRhWT7kXLGvKo7XHCz6fElH6lRWOcbcXMdzYbfCRI2qFuiUh
         hPSFstH57/8t1FCotnh77mm8XUPrJ+4jbCto/ckYVk1/YW7HPQNncxQB1jopt4DnRvun
         CcmLfOwF5UG4LUZw6imV4prTp8kRRLCjyy6MH1F0DBxHGYY3aKeXN+ddHRoTx4A1X828
         xYkinkxRSFXcK8DXLXyr1cCBuNtiPLPStDG+u5Gi82f9TZykV2pyV3mOOALsSC6Fj28r
         m63w==
X-Gm-Message-State: AOAM532tkBlJpszpQE5F29E90Rxaasq28ZFvbGwcsvRfMJqqMH/Y4cRZ
        Af7kNtfiHDGNEn12zpR1/RFUEA==
X-Google-Smtp-Source: ABdhPJywe7fz0NdqJIhVR+ybPgPme6B0QGjRA/oJ+ovNC/XP5+ZAIFQ2GaulTgOfpXcWvBGNImTVMw==
X-Received: by 2002:ac2:454d:: with SMTP id j13mr2259398lfm.129.1616598028459;
        Wed, 24 Mar 2021 08:00:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:00:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 00/21] drm/msm/dpu: cleanup callbacks, resource manager
Date:   Wed, 24 Mar 2021 18:00:03 +0300
Message-Id: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the DPU driver each and every component would provide callbacks,
which are mostly static. Other components would use callbacks to receive
functionality instead of calling functions directly. Drop (most) of this
indirection, replacing with direct function calls. CTL and SSPP blocks
are left unconverted for now.

As we are at it, significant part of RM (resource manager) work is
dedicated to allocating statically linked components. Each LM is tied to
the single PP. Each MERGE_3D can be used by the specified pair of PPs.
Each DSPP is also tied to single LM. So instead of allocating them
through the RM, get them via static configuration.


