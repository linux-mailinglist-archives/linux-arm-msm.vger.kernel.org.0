Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB3D20B4B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 17:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgFZPfw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 11:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgFZPfw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 11:35:52 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE25C03E979
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 08:35:52 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id d15so7245612edm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 08:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=nxgdI0PHS9fZd2ASUWxvxCPW2bkr766GJBjvOuZLk+k=;
        b=CRHD68toCt/9VGp07w4mYOLHRn3hIGw+Vm8TkX4eh2Y+RpKuLPkP5OLY2ZhV0PNHZU
         ls3VbZ8XlFfN2Uv6fW1mNwvgwQiPhKrzl5JYmjvsi6bIIEPHr4+ryG+7c4jVr4NO9Jhd
         M4/P49jxmgv9JZ2HkPy3TGGmsPX49kQKUDoRnuuSuuDqBt8Gfd8UIMYb5y0pnSboFAVf
         XXxn4gTZViPoINfrRWO7tj6oNl5/3GxFuOgyaLrlV4d4UK3WKDWpkx/obpsKGwu0I7w3
         gOwYHpf5O2SF2eqYbfTXi3QqAvsKKrZ+jOKzCI/RYfCL06csxokDz1Z5g0O+2ViiVMas
         trBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=nxgdI0PHS9fZd2ASUWxvxCPW2bkr766GJBjvOuZLk+k=;
        b=ZnO18hY6QlUuTlklgdPTLN2ddjpIslFYb85Glfuuw5YblXpHgTdvcAhL7mxP7CgFBQ
         mCtfa6SkHR8h2GALR80sD9DtDt/+UTCX01RLMQijIATEQJ/Q5Siyf9M2ac6YjItPxeat
         k52OhxUH/q3ufovYGyM4Dmg7Q4f+gGnf584jC5vmGM3uSM1rshMDwntfQ7fE2fpsRsHX
         c20FXUy95t97p0YCXeAChKSFYxIGGLizsSWLmI2FTpQyQVOwnEVG/Gs76Hxw9KAjI38X
         Rfc96JNhi9x/fHH2Pr3qvlhM8w2Qj2CErLIcahOwMY9qoxFTn8c3gwLDd5WBcyEkl9oC
         xyMQ==
X-Gm-Message-State: AOAM532cv+evFEWuQ4NOTacmM+LA+iXHL8anWCPw+lfl/nAaGHjDObV+
        Sojo3Q3VdChjqDEk1412sIaVnQR7jAobujGth8I=
X-Google-Smtp-Source: ABdhPJyKflh7rbf7+P3RC95QxeqWSkrhiz5R9M1XvZ0YJ8a1m63hDgbcRRE25gjcqOQX/Z7qVhDK6qWOXmd7ovRzO3U=
X-Received: by 2002:a50:eb02:: with SMTP id y2mr1417044edp.281.1593185751055;
 Fri, 26 Jun 2020 08:35:51 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 26 Jun 2020 08:36:21 -0700
Message-ID: <CAF6AEGv0SSXArdYs=mOLqJPJdkvk8CpxaJGecqgbOGazQ2n5og@mail.gmail.com>
Subject: [pull] drm/msm: msm-fixes for 5.8-rc3
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

(retry with $subject)

Hi Dave,

A few fixes, mostly fallout from the address space refactor and dpu
color processing.


The following changes since commit 1cb2c4a2c89b2004a36399860c85a1af9b3fcba7:

  Revert "drm/msm/dpu: add support for clk and bw scaling for display"
(2020-06-01 20:56:18 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2020-06-25

for you to fetch changes up to 30480e6ed508e3ff7a3e03c975696aa5196ffe8a:

  drm/msm: Fix up the rest of the messed up address sizes (2020-06-22
12:12:29 -0700)

----------------------------------------------------------------
Bernard Zhao (1):
      drm/msm: fix potential memleak in error branch

Chen Tao (1):
      drm/msm/dpu: fix error return code in dpu_encoder_init

Eric Anholt (2):
      drm/msm: Fix address space size after refactor.
      drm/msm: Fix setup of a6xx create_address_space.

John Stultz (1):
      drm/msm: Fix 0xfffflub in "Refactor address space initialization"

Jordan Crouse (1):
      drm/msm: Fix up the rest of the messed up address sizes

Kalyan Thota (1):
      drm/msm/dpu: request for display color blocks based on hw catalog entry

Krishna Manikandan (1):
      drm/msm/dpu: allow initialization of encoder locks during encoder init

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c    |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c    |  2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c       |  4 +++-
 9 files changed, 21 insertions(+), 15 deletions(-)
