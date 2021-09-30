Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D20C41D1AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 04:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347918AbhI3C5K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 22:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347912AbhI3C5J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 22:57:09 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FDEC06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 19:55:27 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so5479528otb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 19:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JJWG2OEeplITAKWNwOIX3nc4uerEIugG53buzU1RsdY=;
        b=H5k3EYAxITPFMuZqEBLKmqnIhBiwLXm8+Ok+Lhtw2TbFArLgQDpDKjh16JVmYhrNfQ
         LaqEdgWJ6GjeLcpRrFwn0uhTqfd1SM92f1Utj76bZde8vOG58JgfDtS4LPPj2i4LRhzQ
         8Aq6FgozxwddjOhRw82heD78xIa88lPU2OhWO3zUsW7lnSw1fC9VraR7faejoGi7p2Rl
         +FV1ZrXBjhEXugr7QCBOSXr4PnKiF7ieW/3ZM0i7KinkmDtZuBVyIF78Js/P8gxWif2C
         mxDyPveg/7YQ6gN4++tgF/fm3n/jVxgczjU5R/8abqn2skP/xFlQ1mUOEtrRerZTOeJd
         sNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JJWG2OEeplITAKWNwOIX3nc4uerEIugG53buzU1RsdY=;
        b=0J6Za4mfn/QUpe9UQ71VTWzv5JZGQBYlLRm6ckJaZUeqxtVmo9ON39D3pKN2u+hCWs
         iyJrVgJfsG24KWvDeviDB+pbjyEfsDcpWlvUfCYD2TIjg50XWQTBjUiDzt5F18XsyEri
         06NXsbR+WXurrMbZiY49FmF3z/yyiUlTmox6R0rhu1pz73lo2z/XYw/+pcg5q2dVlXyG
         snQoOBadJoImJYfF0bq7U6GTCo1Wuj0OJZHBA/ZtgUafcartfAjdCIg9GI5iMxI0qiBy
         jxegS1jaOEw2Gbi3KOnR1NuhKS515gUeFYoc/rbkQGoG9JRqtJq2fPIZNYwUKPnWUcgE
         feWQ==
X-Gm-Message-State: AOAM533vosw5dKDaWj4qf3zJd1n10SK36BuKSVF7Ti2hfnhjw9mok9rS
        C5O2fjQ2eEqwI906A48JWvoxQw==
X-Google-Smtp-Source: ABdhPJxRRRu9Jy4mBGdA2FQ+J3cuyWDSDAy6FAREe8NCBpOsAJk5JDiyzn2C1v00Ta0ixkFlQXM4/Q==
X-Received: by 2002:a9d:4910:: with SMTP id e16mr2935855otf.170.1632970527171;
        Wed, 29 Sep 2021 19:55:27 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x28sm370202ote.24.2021.09.29.19.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 19:55:26 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        David Heidelberg <david@ixit.cz>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [GIT PULL] Qualcomm DTS fixes for v5.15
Date:   Wed, 29 Sep 2021 21:55:26 -0500
Message-Id: <20210930025526.1146-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.15

for you to fetch changes up to ecf5b34cd5182180ff47ca14ecaca0a90db7fd1d:

  ARM: dts: qcom: apq8064: update Adreno clock names (2021-09-19 23:11:27 -0500)

----------------------------------------------------------------
Qualcomm DTS fixes for v5.15

This corrects the use of depricated chipid and clock names, for which
support was finally dropped from the driver. It also ensures that the
DSI PLL is fed by the correct clock, now that it's being migrated to not
rely on global clock names.

----------------------------------------------------------------
David Heidelberg (2):
      ARM: dts: qcom: apq8064: use compatible which contains chipid
      ARM: dts: qcom: apq8064: update Adreno clock names

Marijn Suijten (1):
      ARM: dts: qcom: apq8064: Use 27MHz PXO clock as DSI PLL reference

 arch/arm/boot/dts/qcom-apq8064.dtsi | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
