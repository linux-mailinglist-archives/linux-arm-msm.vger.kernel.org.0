Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 619F060FC4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 17:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235703AbiJ0Ps7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 11:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235531AbiJ0Ps4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 11:48:56 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878DF1911C5
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 08:48:55 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id j21so1224533qkk.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 08:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok5YczXeYgFH3KkWRJeD3ThUmyIdclOzGP9hF6iMn2I=;
        b=oLIW2VEn+aAH0FJVHFh3KZyB76pStCC7ZV0jXGyY1lW4c7g5usHF269VuRfEYx40eB
         r965gAkz3t02lBoY14bjpGX0HHFct+GlJdm/C4VLTuWcrvuviS7E4lxiGBOfl/Zm4XGD
         I2XE1jbdfpr/wGMWxu19QeR9nLYyBX5lZDp4I739ZssOxCq1qL30FdyIdXgNlbfOyum2
         8crjWwcGaHt/AQjBuzYumzcOuyHQGlYoIohuxP0xquHLiq5J8IoVUyW47p039Gap28l5
         Rvbl5DR7wW3ecICTFSeTJZmv9oKPxK4asdUCSs1cbdBNrjjapAghkoIWq9tknjt3AdpQ
         AJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ok5YczXeYgFH3KkWRJeD3ThUmyIdclOzGP9hF6iMn2I=;
        b=MScFLlINs00FvAoDIx26C5Jjbc7+SDYcFiGct+T2JmJI/NW8VMWykjtM3eMGMjOsUH
         Fqe3XwSM2DOn6Ga16e7Hgjy7mchpIFzmao+oTrqvN23RzHoAkFIEDDx5Zd0TFTQCMSJ6
         wAl7q3KFFeyBS1zB9P2sihWsGw1oCqiHR1MBCHQxzTmbpTthv5hWR5yBY8tOyepa1UCv
         eeYOCe0e7wTSyTQ4B+Kj4Sfy7aPqdLp3w56ZmP7srslxLstKV2GnY3vNORwixOXrdSTI
         yAh9iqu0CozZIfek6k1JjGFghY5fHlFwydXgG+wy9jGlVLjEshwmqJ/ygKf3G02Iemmt
         G92g==
X-Gm-Message-State: ACrzQf1I4LU3vvWHNJ/hIvhMUkUPwD36/kSJaRQjGjmt9kGIrfNG+pSa
        puSqgHZGkVlOFrpWBx9dU1xFcQ==
X-Google-Smtp-Source: AMsMyM4GOLZ58ai8r4aTlawgYAVsl2fMHKVGMvQ2pcqgQiPi/y0egt89A4ETJ6L2xlFgv5cwfkri7Q==
X-Received: by 2002:a05:620a:4884:b0:6f3:91b8:4bf7 with SMTP id ea4-20020a05620a488400b006f391b84bf7mr18635900qkb.167.1666885735251;
        Thu, 27 Oct 2022 08:48:55 -0700 (PDT)
Received: from krzk-bin.. ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id w29-20020a05620a095d00b006eecc4a0de9sm1168531qkw.62.2022.10.27.08.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 08:48:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] interconnect: qcom: sc8180x: constify pointer to qcom_icc_node
Date:   Thu, 27 Oct 2022 11:48:48 -0400
Message-Id: <20221027154848.293523-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027154848.293523-1-krzysztof.kozlowski@linaro.org>
References: <20221027154848.293523-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Pointers to struct qcom_icc_node are const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/interconnect/qcom/sc8180x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/sc8180x.c b/drivers/interconnect/qcom/sc8180x.c
index 8e32ca958824..0f515bf10bd7 100644
--- a/drivers/interconnect/qcom/sc8180x.c
+++ b/drivers/interconnect/qcom/sc8180x.c
@@ -1889,7 +1889,7 @@ static struct qcom_icc_bcm * const qup_virt_bcms[] = {
 	&bcm_qup0,
 };
 
-static struct qcom_icc_node *qup_virt_nodes[] = {
+static struct qcom_icc_node * const qup_virt_nodes[] = {
 	[MASTER_QUP_CORE_0] = &mas_qup_core_0,
 	[MASTER_QUP_CORE_1] = &mas_qup_core_1,
 	[MASTER_QUP_CORE_2] = &mas_qup_core_2,
-- 
2.34.1

