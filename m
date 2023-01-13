Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 607AF6689F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 04:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjAMDON (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 22:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjAMDOL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 22:14:11 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254B5621AE
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 19:14:10 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id d30so26335865lfv.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 19:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ykb7NCb9nT7M+01kBEXqqOuShMGd+6aNwLGJXXp5SVY=;
        b=VAY3UKPLqHaTtRFllndNTMekgoISvnuUO4RlMu7VJWShs/C3s82DXSkuhkPRtRF7yV
         /iv/lj+TK7J4N6nnl1ZcPrV678NYIzXhU7NrJokalyp+jkmUM7KofIxyb4IqmymdBTO+
         wr4xx4DEXkrhzWZKHyl7amCEpkTCHFOcIoHSzzHL9EWpG7UqZdUWRArdyoSwqvMa8VbZ
         C+FrxnTpIIQKanaJrJPdiYaQUGs0PaX+YglGe/YayxasBcuHpH0IRceGUbDDwzkZvefR
         vPUQtf3z70mtiyXBjQKW1/EXHmrKJ0otTiNKe1dk6EVephDoO8qlkCCtEwT8oq1d5ss6
         S1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykb7NCb9nT7M+01kBEXqqOuShMGd+6aNwLGJXXp5SVY=;
        b=kAFFYpXBnoN1K8G6sD8BmzrQRiG5IEyPP9q7eRnfnwZs6i+/w7RN5uuCJMYy4ZlV0e
         A5qGIhC9Ho+aIbzlyrxFNpWQAQCgOPapEUd7fO7D+p7+VynTUM1npM4Pg2Cie/P5vgUs
         mJfL+ERXY3DGrsyXvDsx0AKfAwFC1TfzN5JRoHfLGa7TDTElOlbFA/cZXYNj3vkrO3DA
         rm2gKEwOmvs9CIwlMO3SCAma0pq5+axpOy5oL4zP3Pgj1uYBvcwcKa4Ts5sskLayI8P2
         v7CsgXG8vdxkRozsY6UAFoGSOVv9gy/7R9gXApePRRsWqY/m/clBZM66C3wOlZ/e1BjW
         6lTQ==
X-Gm-Message-State: AFqh2kpVkIjm7ZzgTgPevA0RmnHO7fKuFxhAr3FGZMroI2wbjHG3lT23
        UYuTAcrrTo6MPgl1yTFM5O6V4iArkRZGxFMP
X-Google-Smtp-Source: AMrXdXvgVjmmMUc57mHUSmSJBptW4QiOw+YqHz8zyBgtjbV+P6+xJYoQZOVJrQ0avU3+h7OWojrnYg==
X-Received: by 2002:ac2:528e:0:b0:4ca:fb55:860 with SMTP id q14-20020ac2528e000000b004cafb550860mr18559326lfm.44.1673579648209;
        Thu, 12 Jan 2023 19:14:08 -0800 (PST)
Received: from localhost.localdomain (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id w19-20020a05651234d300b004cb09fd48ebsm3584858lfr.149.2023.01.12.19.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 19:14:06 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] Tiny fixes around LMh
Date:   Fri, 13 Jan 2023 04:13:59 +0100
Message-Id: <20230113031401.2336157-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello, I'm working on finally getting the entire CPRh(+ MEM-ACC + APM) +
CPUFREQ_HW (+ OSM) + LMh gang upstream for MSM8998 (and accidentally also
for SDM660 which is the same modulo some numbers but that's 10s of work).

LMh won't be fully usable before LMh_lite is implemented, so without
sending the not-doing-very-much LMh_nonlite support for these SoCs,
I have some required touchups that can be merged separately.

Konrad Dybcio (2):
  thermal/drivers/qcom/lmh: Use driver data as flags instead of bool
  firmware: qcom_scm: Fully implement qcom_scm_lmh_dcvsh()

 drivers/firmware/qcom_scm.c | 13 ++++++++-----
 drivers/thermal/qcom/lmh.c  | 38 ++++++++++++++++++-------------------
 include/linux/qcom_scm.h    |  5 +++--
 3 files changed, 30 insertions(+), 26 deletions(-)

-- 
2.39.0

