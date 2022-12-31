Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5653365A487
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 14:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbiLaNH6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Dec 2022 08:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbiLaNH4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Dec 2022 08:07:56 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B74D6275
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 05:07:55 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id p4so24980966pjk.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 05:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/WmUGDU9j7tMbOdllnp/w1LH52F3Q0nBmj5c63hXoY=;
        b=HcErrNyru3IXwnUjHyPigj4DgCH5tLR+ehl9cK0upg81tu92hM/q0QwFzPXCdVrRQC
         1e5I2qu0uCfZl1LU1MPA6dnworHc7Tz+3NO3EoKvSHKG++DIf/bZtOsR+gOVNTJ+YIhn
         +8XMNlLfdFp/TVCEvd4hjsBHeZXt+6AyncbdRSX2IoIipW2OfVQk9fnGlx7j23/6yvbk
         Z2bjbugAXIuvs2av3j3SX6T9C18JkNvmopBpo/5X3LKc6YPM4qMzAFjOnzJmtogDsJ/v
         yf3nK9lBMug7GVhXO3wAwY8LLNsuR3rWFWkkBXpCwhpvr28d07qJUbaY7YAkyvkgdb/W
         8e4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/WmUGDU9j7tMbOdllnp/w1LH52F3Q0nBmj5c63hXoY=;
        b=fmukIyJt6675nGYsNESKE9ej4zzIHnHBBcthJGhnq9aQzwFomfut2Wg4AzeM7znQQQ
         JWcf0hDlimIYHh5h97MUQR/2L9j7/ztX8OwUFScnvgv5AffROKXeZpTc3ZxIe7LFwpCO
         EYrqB0cwMadfxbw3xeQiJPOGVpkNI69ITDGXOyocrH29xX11+iO++WAzS0nwddZ2s6bx
         zoCKQjLrbQ1Lkh4++uKOVZWpb4N6Af568G5WLgvuEy0nEHlqkBWtWv2puC9SDJHMisGP
         NUm9pPz9X5xmovys8NweVkG8hhHB4UiNXvHtV5AEU9/zVkqDHPi6jd5EarZ4xa5f6g5D
         N2Nw==
X-Gm-Message-State: AFqh2krd6YwJQu9W7Vwa/iSu5WoWwAGq9VSxw6M4nUnmdWtbCA+ks1Fh
        AR2XTCAdo+QgGcCPyIlraJ5oy5J75Eu2wrl3on8=
X-Google-Smtp-Source: AMrXdXt0x2hv/NzCU5gypltMHPHNGVaAB4/E4enfVWVr3bbDnCQh0OgrIxyYaOiebMRIIqw/LRk4ug==
X-Received: by 2002:a17:90b:4a45:b0:226:102:2dc9 with SMTP id lb5-20020a17090b4a4500b0022601022dc9mr18128660pjb.14.1672492074231;
        Sat, 31 Dec 2022 05:07:54 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c5e:e3b5:c341:16de:ce17:b857])
        by smtp.gmail.com with ESMTPSA id d7-20020a17090ab30700b0021904307a53sm14568161pjr.19.2022.12.31.05.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 05:07:53 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     quic_schowdhu@quicinc.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org
Subject: [PATCH 0/2] Add Qualcomm SM6115 / SM4250 EUD dt-bindings & driver support
Date:   Sat, 31 Dec 2022 18:37:41 +0530
Message-Id: <20221231130743.3285664-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds the dt-binding and driver support for SM6115 / SM4250
EUD (Embedded USB Debugger) block available on Qualcomm SoCs.

The EUD is a mini-USB hub implemented on chip to support the USB-based debug
and trace capabilities.

EUD driver listens to events like USB attach or detach and then
informs the USB about these events via ROLE-SWITCH.

Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>

Bhupesh Sharma (2):
  dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 binding
  usb: misc: eud: Add driver support for SM6115 / SM4250

 .../bindings/soc/qcom/qcom,eud.yaml           | 10 ++++
 drivers/usb/misc/qcom_eud.c                   | 49 +++++++++++++++++--
 2 files changed, 56 insertions(+), 3 deletions(-)

-- 
2.38.1

