Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCF52FDE24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 01:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbhAUAaF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 19:30:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728895AbhATV1g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 16:27:36 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBF2C0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 13:26:11 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id d81so34652170iof.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 13:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXXV9c9WKgadxq6Z4uVJs3qrKStMf5F06B0reLAMGUg=;
        b=obICub08u3TKWOIQP8jWfqoQ65pQAelEhsWLTsxpQ9mflzxooSx1BtRS3lyh9PJuYD
         1VyMyg8xLR1wMSUVXSBXj1N3Wd19xOOciQMCfo9U574wFO6zRWC0EvUe4+UzgpzwgX19
         e2JABF15y2eiQ7jmqu+PGuWjon+e1CvSa3p+Ld0dezU5lO3WYI6XcLAv4Z1w2Nqa95/9
         52w94SX2lv9xF1M8Qa+Uvykw+sCgJSd7RoL7IT6swChFD2u8x5jJgPfT5XwBxvx7ABTB
         ZCDEINHZlv8Oe79UyxKSqJJgztthWZVMZwONgDhuV2dQbfbaEZMhwWJzc+CTVe9t/g8u
         i4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXXV9c9WKgadxq6Z4uVJs3qrKStMf5F06B0reLAMGUg=;
        b=RK105FioEnvL1vTIuH3yTlwpyGwUCVKdknK3p/zOUtoVptd4N5CQ8wdACFVm7oFa88
         Prq2nV8JMe+qj9BcS2rZXHt8lQfeGL6M2T5MQA+uOGZr2uH9cPyZZZsfBzN5tSSnhz6x
         UURpGxcv/BhWn3gkxpFldRHpOw8kWFS2lG0W5zaFygpvy9byKItZJOXazDk2gpo3q58+
         14xejqsfc4JzM3/A/xpZN+qi3bEj0ihIiGeRqDuUwtG6/ogH4mSErC5y+12ouheUMMPp
         lREQ1E05ndajEqp7857HDKF2Sw5b0wPN9UrS8dFcNmANLTAYI+2npiTrKWRrqqe6bLot
         fmKw==
X-Gm-Message-State: AOAM532bi5RWfs/XP+rFKOQKKQ9wyiWSkNKymAB/Ws4pN29OFpEAHe2S
        0PljVJbn82O57yi+4i06MJ5P+g==
X-Google-Smtp-Source: ABdhPJydebF8rvITp21O4iWGarRssmn+Okq1r/VxSdQjhCSwnLHM6s5tJW9QDIJIE4KeuSZZvp8q4w==
X-Received: by 2002:a92:a010:: with SMTP id e16mr9038816ili.38.1611177970421;
        Wed, 20 Jan 2021 13:26:10 -0800 (PST)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id q196sm1335687iod.27.2021.01.20.13.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 13:26:09 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     elder@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, robh+dt@kernel.org, rdunlap@infradead.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 net-next 0/4] net: ipa: remove a build dependency
Date:   Wed, 20 Jan 2021 15:26:02 -0600
Message-Id: <20210120212606.12556-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

(David/Jakub, please take these all through net-next if they are
acceptable to you, once Rob has acked the binding.  Rob, please ack
if the binding looks OK to you.)

Version 3 removes the "Fixes" tag from the first patch, and updates
the addressee list to include some people I apparently missed.

Version 2 includes <.../arm-gic.h> rather than <.../irq.h> in the
example section of the DT binding, to ensure GIC_SPI is defined.
I verified this passes "make dt_bindings_check".

The rest of the series is unchanged.  Below is the original cover
letter.

---

Unlike the original (temporary) IPA notification mechanism, the
generic remoteproc SSR notification code does not require the IPA
driver to maintain a pointer to the modem subsystem remoteproc
structure.

The IPA driver was converted to use the newer SSR notifiers, but the
specification and use of a phandle for the modem subsystem was never
removed.

This series removes the lookup of the remoteproc pointer, and that
removes the need for the modem DT property.  It also removes the
reference to the "modem-remoteproc" property from the DT binding,
and from the DT files that specified them.

David/Jakub, please take these all through net-next if they are
acceptable to you, once Rob has acked the binding and DT patches.

Thanks.

					-Alex

Alex Elder (4):
  net: ipa: remove a remoteproc dependency
  dt-bindings: net: remove modem-remoteproc property
  arm64: dts: qcom: sc7180: kill IPA modem-remoteproc property
  arm64: dts: qcom: sdm845: kill IPA modem-remoteproc property

 .../devicetree/bindings/net/qcom,ipa.yaml     | 15 ++------
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  2 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 -
 drivers/net/ipa/ipa.h                         |  2 -
 drivers/net/ipa/ipa_main.c                    | 38 +------------------
 5 files changed, 5 insertions(+), 54 deletions(-)

-- 
2.20.1

