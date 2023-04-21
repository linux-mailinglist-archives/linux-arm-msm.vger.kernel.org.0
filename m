Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8236EAC69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 16:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbjDUOLr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 10:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjDUOLq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 10:11:46 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDD47AA5
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 07:11:43 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-506b20efd4cso2833892a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 07:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1682086302; x=1684678302;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EPD5TcepChIUyB1x+7Snz5I2ALaHEaijNEsj7LUHZPA=;
        b=SGnUbBPtbMuGlGP7xgkjvYNprt/tmwJukkiW4SLbD+eD/CdrjoXNA0p80kH6A46gFO
         maSZwJRhDipvRmudtViB0d3B5aAUO3EALglvWabl8Maxr0x0PjQYyCoaDYKRdchvf3AF
         1XTScpJja6tJ5FirRR1MFIPnMT6WOVnNLAw1O38AqrafLFWIDlfw7/v68W+Zw+42Xo34
         1fFoyz/wz7dOgbI200Bt88lDOK6wFt5Rjx51JU3oRmjlT36eWayGqlP4PARwVGNhEf60
         HaesoU6a/AbcpRozeREASEWLEbTgSACsCCgM8V0nqINY32A4/PKAqHI4FatAFO7VnSgI
         OsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682086302; x=1684678302;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPD5TcepChIUyB1x+7Snz5I2ALaHEaijNEsj7LUHZPA=;
        b=YFaA22QhXNbOf4US+d59Rjli64A9PT1cEThwiVtPYAeziQBhVxUB6ezF/vpIHNS+uf
         jBqCjnI2y4A157jK6WdSFE47vYQGBKUUU2jPb0epH3k5TOgbjTKs3nzRzWHpS8bE53Wl
         s/LwbfmCPEAQEr0HfJyNH8hxxPM+Mw1851k2qT0qFYwV/7KCtM+ofjXrUPrgd8eT4WQc
         lC8fFm0bMvaog/2UattyqKdbrRyAVN8HckbMIuCO0WKyKntvCGV/En0Zp+j9/A0KSa6t
         6DVrskZ5dbj7HQcuysLq//LODm5PgtcJVA+hElcIEhc/gaEfVvuCY2Pjk3DVZTngzJuo
         htCg==
X-Gm-Message-State: AAQBX9dz/mJbfYwIKk3lhTBbw3M4yQp2sqBkV7o3Wn5zXOz9/zyMQzYM
        tLQLpHmQgj1oEKX5dYr3PHOT7A==
X-Google-Smtp-Source: AKy350azULtknnyQgZXmslDuOdRO/uK9oaFqyUGWWmEXSB8R6Pd3XgFf/p61ksQZOPAwTDxYV8cQSw==
X-Received: by 2002:a17:906:9c44:b0:94b:4a4:2836 with SMTP id fg4-20020a1709069c4400b0094b04a42836mr2241258ejc.69.1682086301764;
        Fri, 21 Apr 2023 07:11:41 -0700 (PDT)
Received: from [172.16.220.31] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id mb20-20020a170906eb1400b0094f432f2429sm2104299ejb.109.2023.04.21.07.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:11:41 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH RFC 0/4] Add WCN3988 Bluetooth support for Fairphone 4
Date:   Fri, 21 Apr 2023 16:11:37 +0200
Message-Id: <20230421-fp4-bluetooth-v1-0-0430e3a7e0a2@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJmZQmQC/x2NQQrCMBAAv1L27EKaFq1eBR/gVXrIxq1ZCElJW
 imU/t3F4wwMs0PlIlzh1uxQ+CtVclJoTw344NKHUd7KYI3tTG9bnOYeKa685LwEpO7sDA8Xuvo
 BtCFXGam45INWaY1R5Vx4ku0/ecHzcYfxOH6EglTSeQAAAA==
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Just to start with the important part why this is an RFC:

While Bluetooth chip init works totally fine and bluez seems to be
fairly happy with it, there's a (major) problem with scanning, as shown
with this bluetoothctl snippet and dmesg snippet:

  [bluetooth]# scan on
  Failed to start discovery: org.bluez.Error.InProgress

  [  202.371374] Bluetooth: hci0: Opcode 0x200b failed: -16

This opcode should be the following:

  include/net/bluetooth/hci.h:#define HCI_OP_LE_SET_SCAN_PARAM    0x200b

Unfortunately trying various existing code branches in the Bluetooth
driver doesn't show any sign of making this work and I don't really know
where to look to debug this further.

On the other hand "discoverable on" makes the device show up on other
devices during scanning , so the RF parts of the Bluetooth chip are
generally functional for sure.

Any ideas are welcome.

@Bjorn: Patch "arm64: dts: qcom: sm6350: add uart1 node" should be fine
to take regardless the RFC status, I don't think the problem is caused
there.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: net: qualcomm: Add WCN3988
      Bluetooth: btqca: Add WCN3988 support
      arm64: dts: qcom: sm6350: add uart1 node
      arm64: dts: qcom: sm7225-fairphone-fp4: Add Bluetooth

 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  2 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 63 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 17 ++++++
 drivers/bluetooth/btqca.c                          | 13 ++++-
 drivers/bluetooth/btqca.h                          | 12 ++++-
 drivers/bluetooth/hci_qca.c                        | 12 +++++
 6 files changed, 115 insertions(+), 4 deletions(-)
---
base-commit: cf4c0112a0350cfe8a63b5eb3377e2366f57545b
change-id: 20230421-fp4-bluetooth-b36a0e87b9c8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

