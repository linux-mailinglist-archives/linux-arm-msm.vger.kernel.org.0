Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612673DC700
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jul 2021 18:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbhGaQsl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Jul 2021 12:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbhGaQsl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Jul 2021 12:48:41 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC96FC0613CF;
        Sat, 31 Jul 2021 09:48:34 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id h8so18062338ede.4;
        Sat, 31 Jul 2021 09:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g+/WvroY3PIFNYPRGJf9aU2bVR5iaIzP7EkefW4JssY=;
        b=gwQLXzEhqvk9xcQNpRtpSPxaqRLho7gkijR+JABsSI0Nrms+zFgHbn35mSbEdRaCi1
         bFTfYKcLCgsQLjbRUyLV/rNOhgMrrMF/j95jVdva6tgECUHC1ZE9xGTM1PHjX9L3eBbe
         40zjAxoLbjbciFP5ETggnPdgjqVLX6eWLZBkp5UL/Jc0tCB17klvJxIFdheAv1HnWQtG
         wCZCmbBcKpWWXcHQss93sxlLqAnSOEY6d9TYbW1Tph0N33xKXlI/dS3daiiwWnLm7wIV
         qSb8VwZXAfJ/80Kg/mhXmVNl3V2krzkhsZ6ASxK9XobUurVWfTfF0aVAgh8xZs2HINJe
         Moqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g+/WvroY3PIFNYPRGJf9aU2bVR5iaIzP7EkefW4JssY=;
        b=Ba0220v0XQTDrFEBiWmxLYmMk64TvcNo0ZHazm4zw4VjaZxQgLDG7kefD6Wb77YVF/
         ukcCIIQkOK/vZ0aXpuEeApQk7k1+PRhL33Vyh5DMglEWTdWxhWWopzfj+zUIIfICGduq
         3ltO+H+EUiq7Syt/Iqn3NogYok74DSNOjzFJTfvs5FC8nKFm5X8hhjYNkRGdj6MAKIzt
         NDJHgbXYhmFzCbqHMqCyGSVREoliMtVqEfV5mW1qMaKQJL8dOjmpbJb+N/cXhuhFp4S1
         4UYE1R1Z77T2aQzecJH4qL9JM80kzoDQ/Wzb+KbieieGdQkPcuTFd7GwOocsv8glsZWl
         7LXA==
X-Gm-Message-State: AOAM530Bv76gOT5WhgMlP9zH/PTJsTXFvaOhc2VR6cp72IqwX/xq7FmQ
        vS/aTKaEazCSANqlh20TFmw=
X-Google-Smtp-Source: ABdhPJwQqk6S1iCEpbNHfESVHF+l4BQ/+BYU1bQnpN0CmL7Zwunibnj3cpnY7loMnTlWjRs6+Ptfbg==
X-Received: by 2002:a05:6402:3089:: with SMTP id de9mr9559983edb.167.1627750113326;
        Sat, 31 Jul 2021 09:48:33 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id s10sm1898169ejc.39.2021.07.31.09.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jul 2021 09:48:32 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v3 0/2] Add rpmcc and rpmpd for SM4250/6115
Date:   Sat, 31 Jul 2021 19:48:25 +0300
Message-Id: <20210731164827.2756798-1-iskren.chernev@gmail.com>
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
v2: https://lkml.org/lkml/2021/6/27/169

Changes from v2:
- note that all except patch 3/5 of the v2 patches were merged in next, and
  patch 3/5 was split in 2
- split smd-rpm compat string addition in it's own patch

Changes from v1:
- remove 4250 compatible, both platforms will share one dtsi
- reuse existing clocks as per a0384ecfe2aa ("clk: qcom: smd-rpm: De-duplicate identical entries")

Iskren Chernev (2):
  clk: qcom: smd: Add support for SM6115 rpm clocks
  soc: qcom: smd-rpm: Add SM6115 compatible

 drivers/clk/qcom/clk-smd-rpm.c   | 54 ++++++++++++++++++++++++++++++++
 drivers/soc/qcom/smd-rpm.c       |  1 +
 include/linux/soc/qcom/smd-rpm.h |  1 +
 3 files changed, 56 insertions(+)


base-commit: 8d4b477da1a807199ca60e0829357ce7aa6758d5
--
2.32.0

