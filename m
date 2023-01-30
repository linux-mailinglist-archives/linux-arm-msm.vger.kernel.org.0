Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21D48680A2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 10:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236340AbjA3Jzp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 04:55:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236189AbjA3Jze (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 04:55:34 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB4122F7B7
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 01:55:09 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id q10so10468466wrm.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 01:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=am8cCJUJQkxtFMDP5ZppaJ0gQfCKelJ/SbE5wCiC308=;
        b=oQdcara/a0kV9QfOauSUBjLCvzUzrCzrqWw5RvkJIhkWKSQXxz/t/jnMSgcF9Q0bna
         6iVPvZ0swe8nD3UddtjRpGc2PtSETz7/AzvKKnDPwbtHDPoTD3G03VCzGHy8yqRvE2Ih
         HGejqd4E/lUD0cWx1ii5/YFxOvLvic1L1VYVxkN1beELf/5HBA0Wzu72op5n925aleMF
         ViheilACLiOSxYYOJ5LvEb8k9zPc05ofoZLsQKYX+WQFIgZMR5Uj+IhS/4KppjzNXi65
         KiYMvv9riAUrY3YxKTV4UKADVfOaI3iCHSfbRD/xgnv5OEo78na+K9IeEPIqMcgGff+h
         jEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=am8cCJUJQkxtFMDP5ZppaJ0gQfCKelJ/SbE5wCiC308=;
        b=0iOJUb+ucBQGzDmiZzKdx0hS2HeCG7Y0QvAAnPC30zqel2Er1l0rB7c04iBeID/cgl
         xP6rfCPeP/z1lPhAoF/nB2VAf74c17SsN+J96jf9FaA4HUmQdK462C5PWgtYIVNGcc38
         MKQ9n8mEmZvN5jUJx4LkDpHMl773xB1zx7eaoOJKuFZHRmMpVFFscauGPGt417NO18ex
         gs7VtTW5e9O1iaLFSB9aw0x6SYYKVq+kezwsXthFz4GWNZ4ke4XKWCgBwOI0DCQElMMh
         ue3G9ATzpPGzXj+5HrrIdfeZfeIMBujVh1UkLOI0qwClcbtVnxHKWqk8HU6+87IlsM7i
         zXnA==
X-Gm-Message-State: AO0yUKW7zO6u5WwN+8+S/KEgbsRqUTOhtBTed1Na0pDPawf6sz4j+2a1
        WoDqOVR7LVvKpsNFaYWSWoW7FGr3siT4TQL5RPI=
X-Google-Smtp-Source: AK7set/8vbu4TzSJeux1hMy/ZZNg34uDTVo0or8MG9lP7LcIumzl1FwleOu9J+Mpt0pALA666QVaQQ==
X-Received: by 2002:adf:f410:0:b0:2bf:e778:6500 with SMTP id g16-20020adff410000000b002bfe7786500mr4769352wro.64.1675072481926;
        Mon, 30 Jan 2023 01:54:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id k4-20020a5d4284000000b00241fde8fe04sm11453537wrq.7.2023.01.30.01.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 01:54:41 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 30 Jan 2023 10:54:38 +0100
Subject: [PATCH 7/7] arm64: defconfig: add PMIC GLINK modules
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v1-7-0b0acfad301e@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org>
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
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the PMIC GLINK core, altmode, battery and UCSI
aux drivers as module.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 984553d55e17..918ccab4678d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -285,6 +285,10 @@ CONFIG_VIRTIO_BLK=y
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

