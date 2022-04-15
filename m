Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87351502DF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Apr 2022 18:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241069AbiDOQt3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Apr 2022 12:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244570AbiDOQt2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Apr 2022 12:49:28 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD308DD966
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 09:46:59 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id l62-20020a1c2541000000b0038e4570af2fso5326055wml.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0YVTZuOLoiyCZMX8irQh+b1jiRskPTrKxz7ZWC6mBJA=;
        b=Qxe5+pjd3u6+SKZ7OdhYM2CPiFtMb6e1tzNK7Znu0My1oBQP0o+u1oAD94NBw9z7G7
         auusW0baIcKFoomLMq6GwsSUdAScP/aaDOGficDhwHIAtAFmijN4YtkJLrwxS0b6NiKe
         ydveakqBo533ylUq+MNnseox45xmSsdX4b2CJBIyfxWeF7qgYYK4sDaeI8gCa0kCe4G3
         2EhugtqBl4LuHs92peA4/MZjeUbU5nV5pg8USHPQEfBFa5Kye16gWhnmCSMd3lOvZs1R
         kGlnBGD6hTVqVN+dpmUtYAXTm9X9C/fF98OwFsR/jLDG8Bi7MBpbfSJzZbJ2hPpLh4LQ
         dUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0YVTZuOLoiyCZMX8irQh+b1jiRskPTrKxz7ZWC6mBJA=;
        b=UwQZtLYW6oHzX3xCgmidM3y/HxLOnoi0d2N5JufqoEhKSDrEed34ra9G+bpnzm72Rk
         OYB4oQ4BuY4YNRFdUS/f4qbUDQNIGrR2C/pGlGLBnHlhnouzdxswyNIQFYcJ3wlkpn6e
         o0cfs8nzDewDEkWyTD0/eU3MYxUGpGQF008UVRnOoy5mdo3TQTvGjzfs3MOY/WHqfHY2
         fk3Zw0pJPXtI0ilw8u9+WhNnlszOoQAMCOKhzqiG8d97zveAJflfdxSUz4K9/bbV5XeH
         FE8vxaFVlgHT2jsYBEoRnzr3S36rlst6/23GP0+SnAEm9DQAx//bzzClg7pwmv83ljvF
         jaTQ==
X-Gm-Message-State: AOAM533ZoHyKexE3AkFvE5ZB5DQd3vuT9KRrlEPirS8EUCabaEQX8xNH
        5LTUtF9fPbp66NBd2qHLvKBIrw==
X-Google-Smtp-Source: ABdhPJxMg0dIBO545V9JxBtbIjeMp62EC9M6df3elh8a7MbsqeMeBApiAcRQ3y3rb4tgCHbogzAZRA==
X-Received: by 2002:a05:600c:1e86:b0:391:62c4:fb72 with SMTP id be6-20020a05600c1e8600b0039162c4fb72mr3732642wmb.119.1650041218450;
        Fri, 15 Apr 2022 09:46:58 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b0038cb8b38f9fsm9180041wmq.21.2022.04.15.09.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 09:46:57 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     vladimir.zapolskiy@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/3] Add camss to SM8250 dtsi 
Date:   Fri, 15 Apr 2022 17:46:52 +0100
Message-Id: <20220415164655.1679628-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V3:
- Reorder new DTS include to be alphabetised - Vladimir
- Place pinctrl-names after pinctrl reference - Vladimir
- GCC_VIDEO_AHB_CK -> GCC_CAMERA_AHB_CLK - Vladimir
- Adds suggested sleep_clk - Vladimir
- interconnect-cells - I believe is correct as-is - Bryan
- power-domain-names - not added camss does dev_pm_domain_attach_by_id() - Bryan
- Added Reviewed-by to #3 as indicated - Vladimir

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=br-v5.19b-sm8250-camss-dts-v3

V2:
- Change 0xHEX to 0xhex - Bjorn
- Merge CCI and CCI pin definitions into one patch - Bjorn
- Future pinctrl dropped, moved into dts file for board
  which appears more consistent with sdm845-db845 &tlmm{} section - Bjorn, Bryan
- Renamed cci0_i2c0/cci0_i2c1 and cci1_ic20/cci1_i2c1 - Bjorn
- Grouped CCI pins into cci0_default, cci0_sleep, etc - Bryan

V1:
Add in necessary CAMSS, pin and CCI definitions to the SM8250 dtsi.

This is the SoC specific stuff, the platform enablement will be done in a
separate drop later.

On the RB5 platform we have validated ~ 30 FPS @ 4K using the SRGGB10P
pixel format provided by a Sony IMX577 sensor.

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=br-v5.19b%2brb5-dts%2bsensors


Bryan O'Donoghue (3):
  arm64: dts: qcom: sm8250: Add camcc DT node
  arm64: dts: qcom: sm8250: camss: Add CAMSS block definition
  arm64: dts: qcom: sm8250: camss: Add CCI definitions

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 331 +++++++++++++++++++++++++++
 1 file changed, 331 insertions(+)

-- 
2.35.1

