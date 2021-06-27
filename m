Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E773B54E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 20:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhF0TB4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 15:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbhF0TB4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 15:01:56 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D648C061574;
        Sun, 27 Jun 2021 11:59:31 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id m41-20020a05600c3b29b02901dcd3733f24so12084461wms.1;
        Sun, 27 Jun 2021 11:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aBvXz5rEEyrYIIfvPQ4zLwMKAaue9lh3amj7/fyx61A=;
        b=Tfuf9sPe57ma51SC9nWhgRlSNoALYXBGuzdLbcpyfH/tCCps7zHjP9tdZl9PLNtXii
         schK9w8Fbm/fZvraYUaIbmC8pjDvK7iIozT3jy2up9j1XUdnvO0OGN8B4R9zum54u2PB
         YZULg5+2GDiDtqrv9JXNjBxvlf46yDIwQU2oqyW+RxMt1rYLPzi5bmop/R6ZHY47tL6u
         SK4llJq5E3BdTH6E+7XOWr8cziSUp1l4Z5iEbRSxGb+hIDPNmCdNpH2N1vOcDtXO1Lj1
         1tkjmISnXGCbq4XKY0/aLVbMXlfZNTBIXiRKKqspWmra1hjpS6JlgY/PVFB7lnnMK1Sz
         YOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aBvXz5rEEyrYIIfvPQ4zLwMKAaue9lh3amj7/fyx61A=;
        b=jYnWK6f55ts/L3fqKma4v11uMuTgKNJjxYdQXmAAhUqF0S38+SIJwJz2ZUbLy4ti6F
         2GNykDBl7jK4ZVaRaf7v3KetH5cZp0SHKHcqiYEPQbpZfoVl/hbgBxqY1mdyJL3YvUzx
         qozv/3UAgDfBZVS/vjXKZTezeIjk8M5wSCD5ZAvkztpAewsgFDeYWrEdDxBBVspsusSY
         GWnFvmrr0p2JqwY7lzNivQteoDrYLtnjC8kmZmVpIv4Lhoumj0tXMMc902ZzikUzgGdB
         0jgqpXcb6etQsTAL3zdz9tcgWy8YqodBHW6QFVR81HyhdD1S+Eksup8YBXwHeStpztTp
         AfrA==
X-Gm-Message-State: AOAM533cGJHEL6zrgMN7Htc8HmlE9PuNS25AayEECueiYoyt6tQieQFH
        X9f1HVcOw/sUwo1QyaILw2I=
X-Google-Smtp-Source: ABdhPJxEnGp3l+rcr5zmPIkhzRWs7/mQi84EcrZMeyP+VFxeP57x1vbFZ1pXNX4pdL5fnX515L6YgQ==
X-Received: by 2002:a05:600c:b57:: with SMTP id k23mr22568496wmr.133.1624820370089;
        Sun, 27 Jun 2021 11:59:30 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id y7sm16426586wma.22.2021.06.27.11.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 11:59:29 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 0/5] Add rpmcc and rpmpd for SM4250/6115
Date:   Sun, 27 Jun 2021 21:59:22 +0300
Message-Id: <20210627185927.695411-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for the RPM clocks and power domains on QCom SM4250 and
SM6115, codename bengal. The rpmcc code is converted from downstream code
(OnePlus repo [1]), and the rpmpd is converted from downstream DT extracted
from OnePlus Nord N100.

The downstream code has additional voter clocks, which let consumers vote and
the driver to select the highest desired clock rate for a given (real) parent
clock [2]. I might port that as well in the near future, let me know if there
is a more elegant solution.

[1]: https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250
[2]: https://source.codeaurora.org/quic/server/kernel/commit/?h=v4.9.137&id=6a4951a8308c5729ae8e502787cb705477c94251

v1: https://lkml.org/lkml/2021/6/22/1171

Changes from v1:
- remove 4250 compatible, both platforms will share one dtsi
- reuse existing clocks as per a0384ecfe2aa ("clk: qcom: smd-rpm: De-duplicate identical entries")

Iskren Chernev (5):
  dt-bindings: soc: qcom: smd-rpm: Add SM6115 compatible
  dt-bindings: clock: qcom: rpmcc: Document SM6115 compatible
  clk: qcom: smd: Add support for SM6115 rpm clocks
  dt-bindings: power: rpmpd: Add SM6115 to rpmpd binding
  drivers: soc: qcom: rpmpd: Add SM6115 RPM Power Domains

 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 .../bindings/soc/qcom/qcom,smd-rpm.yaml       |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 54 +++++++++++++++++++
 drivers/soc/qcom/rpmpd.c                      | 28 ++++++++++
 drivers/soc/qcom/smd-rpm.c                    |  1 +
 include/dt-bindings/clock/qcom,rpmcc.h        | 10 ++++
 include/dt-bindings/power/qcom-rpmpd.h        | 10 ++++
 include/linux/soc/qcom/smd-rpm.h              |  1 +
 9 files changed, 107 insertions(+)


base-commit: 8702f95941c215501826ea8743a8b64b83479209
prerequisite-patch-id: 07d651c82e8f1fd3069d1a03fad5b529d8756a66
prerequisite-patch-id: 5767ec002a675cd486a56663d422a267f0d51a8a
prerequisite-patch-id: 2f407fff6d711a8c0610be7166b19174253d2bba
prerequisite-patch-id: 28e53420187ed7a994ea8b6531b42fb1756f69a6
--
2.32.0

