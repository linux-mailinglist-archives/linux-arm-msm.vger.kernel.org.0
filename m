Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2DB166643
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 19:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728770AbgBTS1N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 13:27:13 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:49188 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728434AbgBTS1M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 13:27:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582223232; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=1b9L0w3z5bVHdWtnw5ZOrRJfst0EtjPxWLBYnnXzM2M=; b=Xri16SiXWOuAUvfEbte4CPdbb//eNXS/wAwydvA8RxTlHviJGf6/iARZ7pCPVGFOCU0z5iTq
 uoZVwZJOu0QT1Ju5KNZC4ywk0UipSeVJbs2nqIAzhWcOKVakH2lXQyqykNp0gY93u5XcJ7zO
 B9P2Yiu1q8OeAItFm8qqXM/PpVk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4ecf76.7f59f77e0688-smtp-out-n02;
 Thu, 20 Feb 2020 18:27:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D3A7C447A6; Thu, 20 Feb 2020 18:27:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 97EF5C43383;
        Thu, 20 Feb 2020 18:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 97EF5C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     smasetty@codeaurora.org, John Stultz <john.stultz@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/4] msm/gpu/a6xx: use the DMA-API for GMU memory allocations
Date:   Thu, 20 Feb 2020 11:26:52 -0700
Message-Id: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


When CONFIG_INIT_ON_ALLOC_DEFAULT_ON the GMU memory allocator runs afoul of
cache coherency issues because it is mapped as write-combine without clearing
the cache after it was zeroed.

Rather than duplicate the hacky workaround we use in the GEM allocator for the
same reason it turns out that we don't need to have a bespoke memory allocator
for the GMU anyway. It uses a flat, global address space and there are only
two relatively minor allocations anyway. In short, this is essentially what the
DMA API was created for so replace a bunch of memory management code with two
calls to allocate and free DMA memory and we're fine.

The only wrinkle is that the memory allocations need to be in a very specific
location in the GMU virtual address space so in order to get the iova allocator
to do the right thing we need to specify the dma-ranges property in the device
tree for the GMU node. Since we've not yet converted the GMU bindings over to
YAML two patches quickly turn into four but at the end of it we have at least
one bindings file converted to YAML and 99 less lines of code to worry about.

v2: Fix the example bindings for dma-ranges - the third item is the size
Pass false to of_dma_configure so that it fails probe if the DMA region is not
set up.

Jordan Crouse (4):
  dt-bindings: display: msm: Convert GMU bindings to YAML
  dt-bindings: display: msm: Add required dma-range property
  arm64: dts: sdm845: Set the virtual address range for GMU allocations
  drm/msm/a6xx: Use the DMA API for GMU memory objects

 .../devicetree/bindings/display/msm/gmu.txt        | 116 -----------------
 .../devicetree/bindings/display/msm/gmu.yaml       | 140 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   2 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 112 ++---------------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   5 +-
 5 files changed, 153 insertions(+), 222 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/gmu.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/gmu.yaml

-- 
2.7.4
