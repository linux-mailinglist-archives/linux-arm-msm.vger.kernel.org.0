Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 240BA763C55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 18:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbjGZQZy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 12:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232570AbjGZQZy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 12:25:54 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56AB426A8
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 09:25:52 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fdd31bf179so10990438e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 09:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690388750; x=1690993550;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xtHQBtt9K2RUz6FUMy8Umw5TAB7QVL9VYYVqvdUwQZk=;
        b=sX4e+9Suf1XGPIpahj8nxXpnBz8h1xHBZKRqqK4NeKvDd7ODoWPALlD1ToXj/4g/lA
         RT0wcYBepNTMNufT2W6zcOU5NH/YI8x5T5vC10e6qxrKjR+dtL9+Vbka09ych1J0r8bx
         NUopIowCuIkxd71KzSZLxIiw3YNwcetkopE/2QbhTjpW0joFtq5aTI62YatJjJj7dVTD
         WtebVDFv87bCoVkj+aTwwUCsr5h0xYYvZywLZfhegqjJpFHm4Bs5QjIsXdk2Va4oFrf8
         IQFwVV/9Jlyr6pC8/1KzfN5PKuNu5RRlF9D3HAkcm/Jap0hbMSctbDxzv9AU0UTqZAm9
         b78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690388750; x=1690993550;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtHQBtt9K2RUz6FUMy8Umw5TAB7QVL9VYYVqvdUwQZk=;
        b=asl0dcf/Tm8H0K9BlmKFCFA6e4G65lS8hw6xi2uJvcMs+wFycaTRWDlGuaTnxbBBBH
         hWxorwdPhkflsGvNtk3fticA2GxbLxUi1pJguVIPFgmtpj7rInopbRK2aWQRCB2L5pyn
         CO4MNNAebCPXm0Ktza6C5L2H/Fop5utcXSniEtYcSbdJLWZO/jy6qECZ1Qzr9s7h6dQH
         XBJ628SEmMiNsU+uEgREtEN9E8qqyf5HzJV0wYG9j6YjqhqT6MleOjWy7EMOf+v6Bg0l
         R1HUhj36v3ii2lmnIxmAh2fGmU22AXviK1FIqdoI88NVtlPE4KgKY5206AAtWl7vqlLX
         HubQ==
X-Gm-Message-State: ABy/qLZA94wOz1fojOl9N53QUcPQ6pTmUu4SfVXxICuYCfSij6la70kl
        DKhzXVJIeUi9yfvY2X9vueqKLPCd2oS03CWJ3lMehw==
X-Google-Smtp-Source: APBJJlHPn6U1HaAncnRjIJLOisG2gvp/IIB3YgkLQjh3RWpJzbA0NiVPyYIBPrIdjK9YDxFj9sGDEw==
X-Received: by 2002:a05:6512:34cb:b0:4fd:ddbc:158d with SMTP id w11-20020a05651234cb00b004fdddbc158dmr1790166lfr.17.1690388750422;
        Wed, 26 Jul 2023 09:25:50 -0700 (PDT)
Received: from [192.168.1.101] (abxh240.neoplus.adsl.tpnet.pl. [83.9.1.240])
        by smtp.gmail.com with ESMTPSA id a14-20020a056512374e00b004fba5c20ab1sm3336299lfs.167.2023.07.26.09.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 09:25:50 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] Fix up icc clock rate calculation on some platforms
Date:   Wed, 26 Jul 2023 18:25:42 +0200
Message-Id: <20230726-topic-icc_coeff-v1-0-31616960818c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAZJwWQC/x2N0QqDMAwAf0XybKCrU3G/ImO0MdWAtNJOGYj/v
 uDjHRx3QuEsXOBVnZD5kCIpKjzqCmhxcWaUSRmssY3pbYfftAmhEH0ocQjoTdtM7dMMfgiglXe
 F0WcXadEu7uuqcssc5Hdvxvd1/QGMSP5cdgAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690388749; l=1079;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=5DEHJUNt1qkMRUOpBTPxO+56vwTa2U0qrmcAMPRfkFM=;
 b=SWgiAod8spQxLkcza1joCe79uNA8jIT7q92MlAA9AxFQ+Qk0MLBR0DlE4fzZY1xRQcHrxyz89
 BwZqrzw6+k4Ba96n+zEPgdSSOkNDvQiLwM+DNg5OCp0hGX1KGInvq17
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Certain platforms require that some buses (or individual nodes) make
some additional changes to the clock rate formula, throwing in some
magic, Qualcomm-defined coefficients, to account for "inefficiencies".

Add the framework for it and utilize it on a couple SoCs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      interconnect: qcom: icc-rpm: Add AB/IB calculations coefficients
      interconnect: qcom: qcm2290: Set AB coefficients
      interconnect: qcom: sdm660: Set AB/IB coefficients
      interconnect: qcom: msm8996: Set AB/IB coefficients

 drivers/interconnect/qcom/icc-rpm.c | 10 +++++++++-
 drivers/interconnect/qcom/icc-rpm.h |  5 +++++
 drivers/interconnect/qcom/msm8996.c |  8 ++++++--
 drivers/interconnect/qcom/qcm2290.c |  3 +++
 drivers/interconnect/qcom/sdm660.c  |  4 ++++
 5 files changed, 27 insertions(+), 3 deletions(-)
---
base-commit: 1e25dd7772483f477f79986d956028e9f47f990a
change-id: 20230726-topic-icc_coeff-b053d5409b9f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

