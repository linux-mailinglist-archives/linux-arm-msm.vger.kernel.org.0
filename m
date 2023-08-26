Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04E937899AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 00:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjHZWTu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 18:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjHZWTW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 18:19:22 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17221A6
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 15:19:18 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b72161c6e9so35730441fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 15:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693088357; x=1693693157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JvB3jMe0gpOsGECFiHEKsTBKlTOqgMYMDdvAdME1Rtk=;
        b=nEjHIotqJgHl/bLNJyw8EmxyfTF36EYqbKpfEfsIBU6VK48CVTHUwAsuOD75DoemXy
         8oouVCeLpU8cKkYRdIrdEHeDOYnfNbXXkxBL+jiDcxyLwDOqo+gAUHI+zihd+TkP5Nye
         hI52FnWQOqUbsgoDkjWGRCbhEdBxLacfRmlwlmn8qaTdYZWR848rzvqV6aOmJHyLerVf
         n/pKF0FoXfwlIgrZL1V9qOdVNcF0grieTJoXa4zP7yZ/xPtPP1skaOAYtvUA95Euiz3d
         HYVpU9mo13R4DSepfip6s+CmxYRobPljs/9B2tRXaTspUcea7ivA69+nbO9OXIgcECOH
         d07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693088357; x=1693693157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvB3jMe0gpOsGECFiHEKsTBKlTOqgMYMDdvAdME1Rtk=;
        b=WOQOG6erOzB7O4vqTbyy58aNEFMNHgMXYmodQiP+zDjQNNVsTOGTMR5vB3WeYttAYX
         2KRgD+atQa7wQKlqbe7SALf0ejgrN/SJYdpgDOGNoe94GQEKopoX5QD3qj/lbmOD3IoL
         2XbX5EKeAUCHaqWb1EBmEJm89texeYN//TKbQYfr+17YrrS5+0b3N0w6ROR2dmCTOoO9
         Bz75g6i1xUjUSOIQBk60RZcmY9rvH3lWHAGH2L+xA+1ZRxL6weRE5eaOxvJdLTBKodOG
         qLYSNnodN91T9h0jwcUqHLWcYm5zESLh2zxwH2cky0NLyDZBHTriksKyp3w8LUgiR7o1
         R5uQ==
X-Gm-Message-State: AOJu0YxFC/TZpk3QQGvIFlKx6/eQJiom5Vo+9vVGvjOocwDtGtE55ZC8
        0mXKnVlkHC0Bpfvs+oN8KNt5dA==
X-Google-Smtp-Source: AGHT+IGNkNJ8/IqtZPo7zfRh2YIUEa2eTL39YA8XAr8TGcok1pxD57ka3Kkqpdl6GiBNgtauZ7jQwQ==
X-Received: by 2002:a05:6512:1587:b0:4fe:27a0:68bc with SMTP id bp7-20020a056512158700b004fe27a068bcmr7611955lfb.27.1693088356741;
        Sat, 26 Aug 2023 15:19:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a19ae19000000b004fbad341442sm868672lfc.97.2023.08.26.15.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 15:19:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: qcom: sdm845-mtp: misc improvements
Date:   Sun, 27 Aug 2023 01:19:10 +0300
Message-Id: <20230826221915.846937-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several misc improvements, take away from testing recent kernel on
SDM845-MTP board.

Changes since v1:
 - Reordered PCIe properties according to Konrad's suggestions
 - Fixed pcie1 perst to have bias-pull-down instead of bias-disable

Dmitry Baryshkov (5):
  arm64: dts: qcom: sdm845-mtp: fix WiFi configuration
  arm64: dts: qcom: sdm845-mtp: specify wifi variant
  arm64: dts: qcom: sdm845-mtp: switch to mbn firmware
  arm64: dts: qcom: sdm845-mtp: enable Vol-/reset button
  arm64: dts: qcom: sdm845-mtp: enable PCIe support

 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 90 ++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

-- 
2.39.2

