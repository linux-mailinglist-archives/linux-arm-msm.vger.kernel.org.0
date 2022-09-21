Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4836F5BF412
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 05:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiIUDHJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 23:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiIUDHH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 23:07:07 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C617DF7A
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 20:07:05 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id b75so4581064pfb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 20:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=RP/caS4k+vesM0CIuvxZsJk410Ex/gFQMNBRq9bVzyM=;
        b=eZeYSMXHVVqYPsM9TEiuYxVPWCxElo2q5vJrD/tlmINXA+cfV7umyG3GTuN3AGbTxb
         imHSLRtysmwPySq+gbc1ax0j4AFvgFxI7n16eGESuYqqSYKrpliTaqhJKc6XGJCK0jM0
         X1kxEmCimxP212cpKl3+E8wViBMMqvNfQp1LSjwgNUMMFkLdzB5NxqYOeapgruEr0w5E
         dQKv5hduqfioF+Cj26fWAhiL9WVFtGkcOUtZHJembo9kMuhaJwDXN8XzvOXI9muewrS0
         3/g/GdLhCm9n5N5EvpnIjlf0gUNpkGMyHsss5OwIFy1Y1WdPBAYdDlR7fmYvpeZTHsWH
         kB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=RP/caS4k+vesM0CIuvxZsJk410Ex/gFQMNBRq9bVzyM=;
        b=1jGVbzDPiJh/+2CEPZFrxeLcBVohYnxqK6knfCUw7X4LRpya2IEbYAD/eFzS+qApAG
         1AQ8aSMA+5LQhzvbsL0/FICsjowv/k9V0DQ5mXRRAcHJBBFAQz8OWx6Y/LrErdmeW9zD
         f49uckl5kaYdn3yuce7SQCSIlHdK+Z5Vdz+nZCAufrJonyri4gEfc16BfrPYbi98wZKq
         5ebm1pvaL30hPDD/fGNaecd67kVeZWvQzNuqnRw/oAFdsjWbTYsYSPRhfX87oBbzE2dY
         LMdxsHpkEx1Ts3R59ZKz/4dEg9Y76DM3M0pByOCFKuiJDbAM+2f4kqCnkve297sJXZpM
         eKFA==
X-Gm-Message-State: ACrzQf1S6zrvku28tHi0oKSueMnXtbVIiBB6GzQOsuGeS5ytjMtLdZO2
        t1Ygn/wC5sT2QTWvk1TRMNES2Q==
X-Google-Smtp-Source: AMsMyM7vVL5mcvDYb2/3vYQblfdRKQXt71WVm4AzOi9UUbWzVe39x4rCrgvnnz5XJ4tpKKYz77A/mg==
X-Received: by 2002:a63:e442:0:b0:438:7919:adf with SMTP id i2-20020a63e442000000b0043879190adfmr22828745pgk.4.1663729625212;
        Tue, 20 Sep 2022 20:07:05 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:8e50:8ba8:7ad7:f34c:2f5])
        by smtp.gmail.com with ESMTPSA id y23-20020aa78f37000000b0053e61633057sm690846pfr.132.2022.09.20.20.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 20:07:04 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     dmaengine@vger.kernel.org
Cc:     agross@kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        thara.gopinath@gmail.com, devicetree@vger.kernel.org,
        andersson@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, vkoul@kernel.org,
        Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH v7 0/1] dma: qcom: bam_dma: Add support to initialize interconnect path
Date:   Wed, 21 Sep 2022 08:36:48 +0530
Message-Id: <20220921030649.1436434-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.37.1
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

Changes since v6:
=================
- v6 can be seen here: https://lore.kernel.org/linux-arm-msm/30756e6f-952f-ccf2-b493-e515ba4f0a64@linaro.org/
- As per Krzysztof's suggestion on v6, clubbed the crypto driver and
  dt-bindings changes together. Now the overall v5 patchset into 3
  separate patchsets, one each for the following areas to allow easier
  review and handling from the maintainer:
        arm-msm, crypto and dma
- This patch targets the dma tree specifically.

Changes since v5:
=================
- v5 can be seen here: https://lore.kernel.org/lkml/20211110105922.217895-1-bhupesh.sharma@linaro.org/
- As per Bjorn's suggestion on irc, broke down the patchset into 4
  separate patchsets, one each for the following areas to allow easier
  review and handling from the maintainer:
        arm-msm, crypto, dma and devicetree
- Addressed Rob's, Vladimir's and Bjorn's review comments received on
  v5.
- Added Tested-by from Jordan received on the v5.

Changes since v4:
=================
- v4 for sm8250 can be seen here: https://lore.kernel.org/linux-arm-msm/20211013105541.68045-1-bhupesh.sharma@linaro.org/
- v1 for sm8150 qce enablement can be seen here: https://lore.kernel.org/linux-arm-msm/20211013165823.88123-1-bhupesh.sharma@linaro.org/
- Merged the sm8150 and sm8250 enablement patches in the same patchset,
  as per suggestions from Bjorn.
- Dropped a couple of patches from v4, as these have been picked by
  Bjorn already via his tree.
- Addressed review comments from Vladimir, Thara and Rob.
- Collect Reviewed-by from Rob and Thara on some of the patches from the
  v4 patchset.

Changes since v3:
=================
- v3 can be seen here: https://lore.kernel.org/linux-arm-msm/20210519143700.27392-1-bhupesh.sharma@linaro.org/
- Dropped a couple of patches from v3, on basis of the review comments:
   ~ [PATCH 13/17] crypto: qce: core: Make clocks optional
   ~ [PATCH 15/17] crypto: qce: Convert the device found dev_dbg() to dev_info()
- Addressed review comments from Thara, Rob and Stephan Gerhold.
- Collect Reviewed-by from Rob and Thara on some of the patches from the
  v3 patchset.

Changes since v2:
=================
- v2 can be seen here: https://lore.kernel.org/dmaengine/20210505213731.538612-1-bhupesh.sharma@linaro.org/
- Drop a couple of patches from v1, which tried to address the defered
  probing of qce driver in case bam dma driver is not yet probed.
  Replace it instead with a single (simpler) patch [PATCH 16/17].
- Convert bam dma and qce crypto dt-bindings to YAML.
- Addressed review comments from Thara, Bjorn, Vinod and Rob.

Changes since v1:
=================
- v1 can be seen here: https://lore.kernel.org/linux-arm-msm/20210310052503.3618486-1-bhupesh.sharma@linaro.org/
- v1 did not work well as reported earlier by Dmitry, so v2 contains the following
  changes/fixes:
  ~ Enable the interconnect path b/w BAM DMA and main memory first
    before trying to access the BAM DMA registers.
  ~ Enable the interconnect path b/w qce crytpo and main memory first
    before trying to access the qce crypto registers.
  ~ Make sure to document the required and optional properties for both
    BAM DMA and qce crypto drivers.
  ~ Add a few debug related print messages in case the qce crypto driver
    passes or fails to probe.
  ~ Convert the qce crypto driver probe to a defered one in case the BAM DMA
    or the interconnect driver(s) (needed on specific Qualcomm parts) are not
    yet probed.

BAM dma engine associated with certain Qualcomm Snapdragon hardware blocks requires
relevant interconnect pieces be initialized prior to the dma engine initialization.
For e.g. crypto bam dma engine on sm8250. 

Such requirement is passed on to the bam dma driver from dt via the "interconnects"
property. Add support in bam_dma driver to check whether the interconnect
path is accessible/enabled prior to attempting driver intializations.

If interconnects are not yet setup, defer the BAM DMA driver probe().

Tested on sm8150-mtp, sa8155p-adp, sm8250-mtp and RB5 boards.

Cc: vkoul@kernel.org
Cc: thara.gopinath@gmail.com
Cc: andersson@kernel.org
Tested-by: Jordan Crouse <jorcrous@amazon.com>

Thara Gopinath (1):
  dma: qcom: bam_dma: Add support to initialize interconnect path

 drivers/dma/qcom/bam_dma.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.37.1

