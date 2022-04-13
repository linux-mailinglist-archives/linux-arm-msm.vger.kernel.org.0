Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECF54FF2D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 11:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbiDMJCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 05:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234167AbiDMJCV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 05:02:21 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC908101F9
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 02:00:00 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id bo5so1431536pfb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 02:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=EDhS8xYSBd2n9NcaWEWx6PW2TjEIoAofJnoHWA7XnG8=;
        b=O149Sk4abdAzjNa/FuuPlloSGGPPgYqriC+xrIg/TWImciJdOwE5u9tHyqdsYNzpNp
         owIKDOxTfXRUUXW2CAr0WeoyQ7zbMqwJY0L2NKYCANdvk4jh7zfjzMzrbDXKVqbY+TSO
         utfifiKG16sgBOGumS+6N1LFYgT10cdNxCVmqdr+zgw3niSv5RuZ05dmSAYAauvUzIiK
         hkSdt6zK9Z9xWsRsv7cfSu6XAB1oCnKGWp/YPG/SimnAtW3vPUVLTWVveKdN7xHc2n56
         WKtMhyIVv4ky+A5yC2cwh42X6Bjkdsjk5UhESz66JS91FxreEatR+QR5sO9x9yZQIUvJ
         ZKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=EDhS8xYSBd2n9NcaWEWx6PW2TjEIoAofJnoHWA7XnG8=;
        b=BLPz0ELtIH8TksysljfM6eVo1Qk9B4Z7VtfMLd5wuNXk+nT0hORdHhi163p6wS0Rzz
         zMM2MuDZo2riF7btRGSvFXpJCW1QmzK2Ew/3UUBEg0zhpsuVjA8Ga7syN18keFVFfd0Q
         7W5XkIZMJBxNK2Fyc3Rv1s1/TOWJu3HsxXhAug2Ik4D+X1Nzdt9pkwdvami49w2uG2CX
         s5bcYaCi4yDVx8/bmkEK3B012+zceS6mzA5AAPEiNkGMen5/fL4Wfl/EIbupfFRk2AP4
         Tp+0a9UnlzKx4/WNB2oaEurcXWuL0YQ3gQ7QU9T7Hk/yEGllZSRkEWUdMuprMm4WwZG3
         DFEQ==
X-Gm-Message-State: AOAM530JsKLlFgSaEIhf2lcVPX/XF1858+87HawOsOp/3iAM2+cFgfs7
        ulIMkEtw9GicwZm8LOG34JSrTpyvXVqm
X-Google-Smtp-Source: ABdhPJwO2iFFLhBkrptiK2TCZlzOfrLJcUVHx+2oFFdkyWiG9hCOm5NrUnrAD4xSViZlk/JVFd0Kgw==
X-Received: by 2002:a63:195f:0:b0:399:1f0e:a21d with SMTP id 31-20020a63195f000000b003991f0ea21dmr33848070pgz.393.1649840399909;
        Wed, 13 Apr 2022 01:59:59 -0700 (PDT)
Received: from thinkpad ([117.207.28.99])
        by smtp.gmail.com with ESMTPSA id k23-20020a17090a591700b001ca00b46cf9sm2172266pji.18.2022.04.13.01.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 01:59:59 -0700 (PDT)
Date:   Wed, 13 Apr 2022 14:29:54 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     mhi@lists.linux.dev, quic_hemantk@quicinc.com,
        quic_bbhatt@quicinc.com, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org
Subject: [GIT PULL] MHI fixes for v5.18
Message-ID: <20220413085954.GE2015@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-fixes-v5.18

for you to fetch changes up to c38f83bae4037023827c85e045841d0421f85034:

  bus: mhi: host: pci_generic: Flush recovery worker during freeze (2022-04-13 13:11:19 +0530)

----------------------------------------------------------------
MHI fixes for v5.18

Couple of patches fixing the hibernation issue seen on MHI endpoint devices like
SDX65 modems:

- During hibernation, the host puts the device into D3cold after thaw() stage.
But at that time, the device would be in M0 state. So the device emits a
warning (not visible to the host but to device firmware only) stating invalid
transition. This is fixed by adding a poweroff() callback that puts the device
into M3 before D3cold.

- There is a possibility that the recovery worker might be running while trying
to powerdown the device. So flush the recovery worker before that.

----------------------------------------------------------------
Manivannan Sadhasivam (2):
      bus: mhi: host: pci_generic: Add missing poweroff() PM callback
      bus: mhi: host: pci_generic: Flush recovery worker during freeze

 drivers/bus/mhi/host/pci_generic.c | 2 ++
 1 file changed, 2 insertions(+)
