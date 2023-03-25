Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3166C8F8B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Mar 2023 17:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbjCYQwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Mar 2023 12:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbjCYQw3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Mar 2023 12:52:29 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA9F7287
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 09:52:28 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so7831196pjt.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679763148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eO2MudwSzM7w2aBKoq+3lTQiN9qd5TRShVeIYuReNyw=;
        b=iQix4vg9UCkITzy7QW+CiY9KBjUno8pGXvfX3Sx/pmuEW9VSJTXA4XHgfxuJDkvkjZ
         J9387k3spmWwAcZVbBU6QdT+dG3g/ot4Yy6ZnWwT3s0ndUsx2rB4XLxqN6zX3fh+62X7
         BzaI0SCMjhYdw+bf8HqMAYOto9oKkoekFXSKtQiRRmV9apO/gzGo1vdMiGKEMr/3bVeQ
         bEvz6K05j7D8+k6tiFJVNIdt0r9c27cUCrhMt3hlCc0PEtz4WoI8bKcn9TlcvU367uB4
         G/OrnyIUmXtuEnG2koemrqmOt0NXGOdoBBSJhnNCoXziDEQQlP7CGFxVoYBEHxqcqD6a
         fOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679763148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eO2MudwSzM7w2aBKoq+3lTQiN9qd5TRShVeIYuReNyw=;
        b=zVLUxdT1ZmFbVp8y6OkbMLkUAgmMa0lVns31BKoTyoP2i42/waRo0ly1yDSrnP82nh
         KcqWDmDPDkaACchcuP900q7J79Sc1mI8SR3PSZIG6PNAXbgBqBpM0I21Rcr7GXJrbeSV
         zD18CyMkM6BUt5Tfk0zimmC+E31fFE9SbWoVlAjDpvbbrmUF453S799vd/5/c9KJ+tQi
         Yqb86+eSYVyBlRs28kww8uYESjvcq+0kpk+XL3tNsiwStgY/9FP2jVlHIBPcjVmklrcZ
         1QtwlwwbjOUoJodeKKE7QkkdiXuOJasYcTxKDV07El/fI5ALcILWKhoAK/8ASSkw/ldh
         InBw==
X-Gm-Message-State: AAQBX9e3gevL3OgNqkVm6GSEgXE+xD8nhNK50TrsLLKZC59fRxpJsekG
        L32161K5pEQ7h8oAzKnYtGmB
X-Google-Smtp-Source: AKy350bsd+xiNmrmOMPpqAJcJJZT0iPvndikcX9YpRtxA+bDBgrkMvmsffN3wjEfM/YxaHbXYhWHiw==
X-Received: by 2002:a17:903:2311:b0:1a1:b656:2149 with SMTP id d17-20020a170903231100b001a1b6562149mr7515724plh.50.1679763147684;
        Sat, 25 Mar 2023 09:52:27 -0700 (PDT)
Received: from localhost.localdomain ([117.217.184.99])
        by smtp.gmail.com with ESMTPSA id p5-20020a1709026b8500b001a1aeb3a7a9sm14889787plk.137.2023.03.25.09.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 09:52:27 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/5] usb: dwc3: qcom: Allow runtime PM
Date:   Sat, 25 Mar 2023 22:22:12 +0530
Message-Id: <20230325165217.31069-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

This series allows the dwc3-qcom driver to do runtime PM itself without
userspace intervention. Still, userspace is required to enable runtime PM
for dwc3 glue and xhci drivers as we cannot enable runtime PM for them.
But this series avoids one more additional step.

While enabling runtime PM, I noticed that the xhci driver suspends before
catching the xhci interrupts during resume. This ended up deferring the
device enumeration for some time. So I included a patch adding autosuspend
delay of 200ms to the xhci driver. With this delay, usb enumeration happens
properly.

This series has been tested on SC8280XP-CRD and RB5 devices.

Thanks,
Mani

Manivannan Sadhasivam (5):
  arm64: dts: qcom: sc8280xp: Add missing dwc3 quirks
  xhci: host: Use 200ms autosuspend delay for runtime suspend
  usb: dwc3: qcom: Fix null ptr access during runtime_suspend()
  usb: dwc3: qcom: Clear pending interrupt before enabling wake
    interrupt
  usb: dwc3: qcom: Allow runtime PM

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 14 ++++++++++++++
 drivers/usb/dwc3/dwc3-qcom.c           | 13 +++++++++----
 drivers/usb/host/xhci-plat.c           |  2 ++
 3 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.25.1

