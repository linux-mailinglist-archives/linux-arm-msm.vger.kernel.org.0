Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 917414F566B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 08:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236504AbiDFFii (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 01:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1851314AbiDFDDA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 23:03:00 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B660E65E7
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 16:59:13 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y32so1221901lfa.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 16:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QOt6DJcLelTgkTPVmldTvMlvDQEbrpbWK917oZbjN0w=;
        b=tHjIQHSXPYXo6cTSKoL3JHG0UImC5yIJ+e/f9YaJDb9ZqDD9TNBB7U8EczTEXMmnk/
         xQaoJCCgTk2t9KgbcdXuBiFwZEPteCYG8ZHHEaDiFBbRi4zlsxu7uLRG9dVuqkkOUEoX
         QOLJ0fDNLZu6f0nPHj38DekLjDHPTO+fggRVpYFkd/SStJZ7a4rNENEj9weqtJPskiYl
         6DdNIaNhdMvn29IP9L1Z2170us9SEFyUui8pHoDVAlYIH5nrcwd4v4MhPkhnGjCi3jkS
         IIZHRXdtThjM/gRZ3nnzaTta7ukxzt5JiONJmn96GuH998VuWSgSY6upUxUv3U6dMLBS
         yW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QOt6DJcLelTgkTPVmldTvMlvDQEbrpbWK917oZbjN0w=;
        b=YCNTaGILXdehrqUp6zwBNQ5cIePnSB9lifBw+yH3gnuoSne94Urbf4SQD3aMXLK5SK
         /8EWozaLfRj2oMZ7Dv71tLjUOhTdpbJUDMWbHsd5iqcwt7u5T8HGky7KXLw/sqSvVlT6
         Obdx+CUDojCo0LUAngMapwt5oA533/wvjQAYj9mmfk/UU6RIp1qdDpXPh5SZsy7UBgZk
         qjgpg5DiWIOjXiXkVexj3BVHB0dWdZy3FNC+VB/DEpp8xmWXCSf0vEEUolciTbskrF9K
         1kqptXG1zITsOVbIKksV7glJsP1H36bR8n/xM23rqOIS04hw0K7Z5cRrx9I5r8tmxGhL
         bzrw==
X-Gm-Message-State: AOAM532zhPIs902y1MVOdcWCq1tF1HgMBGiRSd2cu9kzvQ4lEsIJl4NL
        WU/UC9X7oZJjXV7EcHWyW3j2DfpYuKEqVg==
X-Google-Smtp-Source: ABdhPJyRrLV6ZhWNcC+LtcC93NA/42wRqTNcug5mNhrZb9Xd+1lGj4wfRvbf/sgIYJiwvkye/aavpg==
X-Received: by 2002:a05:6512:16a7:b0:445:862e:a1ba with SMTP id bu39-20020a05651216a700b00445862ea1bamr4085065lfb.85.1649203151822;
        Tue, 05 Apr 2022 16:59:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w14-20020a0565120b0e00b0044a9b61d2b3sm1646471lfu.221.2022.04.05.16.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 16:59:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 0/4] arm: qcom: qcom-apq8064: add separate device node for tsens
Date:   Wed,  6 Apr 2022 02:59:06 +0300
Message-Id: <20220405235910.373107-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently gcc-msm8960 driver manually creates tsens device. Instantiate
the device using DT node instead. This follow the IPQ8064 device tree
schema.

Compatibility with the previous devices trees is kept intact.

Dmitry Baryshkov (4):
  dt-bindings: thermal: qcom-tsens.yaml: add msm8960 compat string
  thermal/drivers/tsens: add compat string for the qcom,msm8960
  clk: qcom: gcc-msm8960: create tsens device if there are no child
    nodes
  arm: dts: qcom-apq8064: create tsens device node

 .../bindings/thermal/qcom-tsens.yaml          |  4 +++-
 arch/arm/boot/dts/qcom-apq8064.dtsi           | 23 +++++++++++++------
 drivers/clk/qcom/gcc-msm8960.c                | 18 +++++++++------
 drivers/thermal/qcom/tsens.c                  |  3 +++
 4 files changed, 33 insertions(+), 15 deletions(-)

-- 
2.35.1

