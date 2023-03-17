Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A985F6BEC60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 16:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCQPGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 11:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbjCQPEy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 11:04:54 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEDC9145B73
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 08:04:37 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id v16so4749880wrn.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679065476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0orW1CTnM6DAdshwwXX6e/Knv2tholAvEuPEyPRFIo=;
        b=thOz4Bqxx3aTg5BS5u+gcrBNnxZbSpDBFAr6GQFvbn1o0Cw1G2+korkQq5PDU/bGbm
         Cc1uy6fQDBocp9xAfnJSIcZtxGmgaoYWyzDJCfeXQO5LApq26Q5LbblslY0DNBliOQlp
         H2p89gtcc1iu72YHH+C/yXj3al3bml83tOkWYzCiFKUh1qPG4oWjxmkZrBvztPtQj6Yc
         yHbL15SZl50wfpidVG6U5cZz8d0vImB9kekXI1YLFQNU7NzbuZoMLOvA/wubJAWwcjzE
         Ne8uKWTk+48RrV6M+oo6dSSeQW5JMoVfSjBvoE0q2mgna7BpTM4PJg9OWdZ8pXIhoqac
         RkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679065476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0orW1CTnM6DAdshwwXX6e/Knv2tholAvEuPEyPRFIo=;
        b=p+pQrvIlLcwL7qBnipyqUCn8FihjLGFmiXsGTnfCXtdp/+2suuJmAKu0h//XEm9ZXB
         1DEbIL96rm+Lns71719A/GrsfwqqNt4umQ6FSPTH8su4EATfnLr63hFuPpWlDXwV6V1B
         NdDmNHdv1tur1tAUQtz51TpQ6wD9PecpshKO8N2BMkfKlp+aBsOiPuH+TdbgQE8bc56S
         p51iK7GvTSJxHoIssmn9RvAybonO4UGqhl7Bj7zmv2lhkAnUvMvWHM/eUps8zftAbcnJ
         tNlG4Mi3JJ8h2F5K7IxZncJ2J6XAu0ofsX+WzBZ/KM5+mEDwPeUIDtCInyjwmtq8mGnm
         mUvw==
X-Gm-Message-State: AO0yUKX2fV9Ysg+p637WJQjGESzUsiEIb9D781rOSkaxSbf901VPRenS
        xU8tKytVlBwqPTW3HB2zzxcK4w==
X-Google-Smtp-Source: AK7set/27QgRLlofrRbBq6ib9GCEdM3UBqceT1TuEhdddZ/nsuIbDQcnv0yskcG1IYIplUBj0Sw1pg==
X-Received: by 2002:adf:fd50:0:b0:2c3:fb3e:ae85 with SMTP id h16-20020adffd50000000b002c3fb3eae85mr7995557wrs.44.1679065475843;
        Fri, 17 Mar 2023 08:04:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b002be505ab59asm2133773wrx.97.2023.03.17.08.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 08:04:35 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 17 Mar 2023 16:04:28 +0100
Subject: [PATCH v4 12/12] arm64: defconfig: add PMIC GLINK modules
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v4-12-38bf0f5d07bd@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the PMIC GLINK core, altmode, battery and UCSI
aux drivers as module to enable USB Type-C management
over the PMIC GLINK protocol on modern Qcom platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3a6d995384d9..d849fa2ca852 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -273,6 +273,10 @@ CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=m
 CONFIG_QCOM_COINCELL=m
 CONFIG_QCOM_FASTRPC=m
+CONFIG_BATTERY_QCOM_BATTMGR=m
+CONFIG_QCOM_PMIC_GLINK=m
+CONFIG_TYPEC_UCSI=m
+CONFIG_UCSI_PMIC_GLINK=m
 CONFIG_SRAM=y
 CONFIG_PCI_ENDPOINT_TEST=m
 CONFIG_EEPROM_AT24=m

-- 
2.34.1

