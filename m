Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75215446344
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 13:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbhKEMWe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 08:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbhKEMWe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 08:22:34 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84969C061205
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Nov 2021 05:19:54 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id u1so13385393wru.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Nov 2021 05:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TqZxzxFD+cNrlzfk3If7RuGI4LzKLdCKuLSgGugXzIw=;
        b=pN3J7s/kf6WKIC+REmn/blnIo8ni+SFlZcjTjpcNv9zVG3e4W8ebgl1Nt1288uOkYZ
         O0tbrjqN+osD4MJAbYHLSEA2U439nv3Q/LFcK0MEsoAxqbNJiZobBgyjEsKlPOSPNsvl
         4rdkc0s5KRbu0+GuB5I4u6MqffDAbMdX7p1wuXLn21foBuVn2zV1XTMZbqEyd5omta+v
         tPmHnI3asDcc4izrdIaqh1a83CA3PlhSiP6COKPUPpTexldaPiZEJtcTwxqWdXZB+48X
         UfB+5RTzS1h3QoRfOog+G48RP3ruo6S19d36hoq7yioknYsj+90kr5rIv944kLfFh27S
         WjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TqZxzxFD+cNrlzfk3If7RuGI4LzKLdCKuLSgGugXzIw=;
        b=gPtu4YSBa6P8FtTvg+Ta19ekmOK78gp3DOd4BsPp1TFEMbE35mHEjkFHTUOTsGdpwz
         Ns/IJi34IBtLnZuDZAk28K1SMelz9QXStqedTp4MTT7ltpgTbkgNqK40VB2pFpT/8RaZ
         T2boHI450lJOWV4cbo/fuKE6ukvwAm3zYEdjGPBiUSNIwvohz7g554ce+9+iqby3xc7I
         FisttAWHP/QryTM8iVTbzfJtKAwT60CONERYgNPbtVDj33DdWKH5geCB/TgPmzhh92v5
         MwxrrNewc+4lxJetZ8rY7VFtnP//VZPIIb9+PLDSHjigiiJtu3imfMHZVTYaoB6syWuI
         cj7A==
X-Gm-Message-State: AOAM5307n50hcGH5/s4aBkK2PXYZT3ZkZ4XYUUuRyyjN+SY4k6CgUjZv
        Vswl57x0xKWpHwrTaEF05IHh9PUyLSYrBA==
X-Google-Smtp-Source: ABdhPJy9XDUsCTaESwasNkZv38uwKgfeP+/gZsBUTpSrnmjI8w0dPiQs3q4z+n9kJki1iWTvwIGQkQ==
X-Received: by 2002:a5d:6147:: with SMTP id y7mr29245236wrt.217.1636114793118;
        Fri, 05 Nov 2021 05:19:53 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q84sm13961796wme.3.2021.11.05.05.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 05:19:52 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com,
        johannes@sipsolutions.net, bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/3] wcn36xx: Fix DMA buffer allocation and free logic
Date:   Fri,  5 Nov 2021 12:21:49 +0000
Message-Id: <20211105122152.1580542-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V3:
- Drops first patch in series as it doesn't apply to tip of tree any longer
  and isn't needed

V2:
- Functionally decomposes the DXE reset in an additional patch.
  Since we call this logic more than once, it should be in a function.

- Leaves as-is the DXE reset write.

  Johannes Berg asked me if we are sure by the time the write to the reset
  register completes that DXE transactions will be suitably quiesced.

  The answer is:
  1. I believe these writes are non-posted writes
  2. Downstream doesn't poll for DXE reset completion

  So on #2 I have no real data for or against a polling operation, my tests
  indicate the reset indication in the register is atomic and as far as I
  can discern that also means DMA transactions are terminated.

V1:
Digging around through some bugs reported from an extensive testing cycle
we've found that wcn36xx has a number of unexplained RX related oopses.

In at least one case we appear to have DMA'd data to an unmapped region.
The written data appears to be a correctly formed DMA buffer descriptor - a
DXE BD in WCNSS parlance, with an AP beacon inside of it.

Reasoning about how such a situation might come about and reviewing the
run-time code, there was no obvious path where we might free a BD or an
skbuff pointed to by a BD, which DXE might not be aware of.

However looking at the ieee80211_ops.start and ieee80211_ops.stop callbacks
in wcn36xx we can see a number of bugs associated with BD allocation, error
handling and leaving the DMA engine active, despite freeing SKBs on the MSM
side.

This last mention - failure to quiesce potential DMA from the downstream
agent - WCNSS DXE despite freeing the memory @ the skbuffs is a decent
candidate for our unexplained upstream DMA transaction to unmapped memory.

Since wcn36xx_stop and wcn36xx_start can be called a number of times by the
controlling upper layers it means there is a potential gap between
wcn36xx_stop and wcn36xx_start which could leave WCNSS in a state where it
will try to DMA to memory we have freed.

This series addresses the obvious bugs that jump out on the start()/stop()
path.

Patch #1
  In order to make it easier to read the DXE code, I've moved all of the
  lock taking and freeing for DXE into dxe.c

Patch #2
  Fixes a very obviously broken channel enable/disable cycle

Patch #3
  Fixes a very obvious memory leak with dma_alloc_coherent()

Patch #4
  Makes sure before we release skbuffs which we assigned to the RX channels
  that we ensure the DXE block is put into reset

Bryan O'Donoghue (3):
  wcn36xx: Fix DMA channel enable/disable cycle
  wcn36xx: Release DMA channel descriptor allocations
  wcn36xx: Put DXE block into reset before freeing memory

 drivers/net/wireless/ath/wcn36xx/dxe.c | 49 ++++++++++++++++++++------
 1 file changed, 38 insertions(+), 11 deletions(-)

-- 
2.33.0

