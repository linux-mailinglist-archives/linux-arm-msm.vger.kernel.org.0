Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8449769A0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 16:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbjGaOun (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 10:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbjGaOum (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 10:50:42 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB6D61BC
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 07:50:40 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bba2318546so39252585ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 07:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690815040; x=1691419840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzYKaWJBV7r6FBoOWy19q9Vp5WCRs4zk2VoX6XkHWd8=;
        b=FiV/Ypzo1L9irb459PibZEA01bTRKxCauVE3RYfPGl/Ly3CSCK0JZk5J7sG9j6Ps5x
         WU51Z0H5kNiiVoVthnZfzx/Ow4FXg1lZdalT9fqp9Mwk4Yy21l3cSapyxEUtcTDdjNd6
         uk7qcY7YC5zfrNCpOvk2cp4hs/98yCgROAwsDkQ0bt8a0UAjBy1tkGZ0smCyReG8Vbsb
         cc+66Hc+oqpoZEHOCdc4g203alAeo5xoT6MfQ6V23oQehMpgVCchD/GqH7UPRnL06RiK
         p0jtrhBjkG8rzzqFqKyoJOjvWW/WkkMNqs6coYXfgaOeuu+b1DZxGpzVoDpGRzAVHrgl
         NwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690815040; x=1691419840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzYKaWJBV7r6FBoOWy19q9Vp5WCRs4zk2VoX6XkHWd8=;
        b=GJoIwys1HxTppXPb6Y2V3ffMG2PTsJl0ZIwESJOZM1ZQ/ipsS91COgeH0My79BrK/2
         dDqYuXEw5PpvXy8c0TF2mRHn3yA9cpUQiRKA0se6oE+gHj0zw0GHHMAwah/qr9txvm/K
         /kNKgAHjjEiB0QkEsX/kfBc772WaKgQH6yzvIQHH/MtHzAXK6YbKsK3ycoJP+xVunfwh
         pANNhtW+KD1x1wOBDo9AeyXVXG07UNnSi1vRLKvwv2b2gyfu0bwP0vP3p4wOmSjkFOVu
         HzQlnlvTy7MYL/5KHLiRHwffpAZvCTQ3iynSA6Qey2K4dPKv8u8FVw5jqg9G4ADldajX
         e4Eg==
X-Gm-Message-State: ABy/qLYocszYpBYafwj88j6GO4yCvVaKjiXmCGS9cApwq1vY/pQu2rNA
        l/NmM1a+whVSBhpGW8hnS00Z
X-Google-Smtp-Source: APBJJlEs1zZUAT7jWFiRSzS0YUYnrcO/xgzGopf53tcs+gaZO4k8RCHFNjTuJvXXqbACrf4JkYEYkw==
X-Received: by 2002:a17:902:7894:b0:1bb:c7b6:493a with SMTP id q20-20020a170902789400b001bbc7b6493amr9632018pll.21.1690815040268;
        Mon, 31 Jul 2023 07:50:40 -0700 (PDT)
Received: from localhost.localdomain ([117.193.209.129])
        by smtp.gmail.com with ESMTPSA id y4-20020a170902ed4400b001b06c106844sm8730185plb.151.2023.07.31.07.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 07:50:39 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, konrad.dybcio@linaro.org, jejb@linux.ibm.com,
        martin.petersen@oracle.com
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] scsi: ufs: qcom: Add interconnect support
Date:   Mon, 31 Jul 2023 20:20:18 +0530
Message-Id: <20230731145020.41262-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

Hi,

This series adds interconnect support to Qcom UFS driver. Interconnect support
is added to Qcom UFS driver for scaling the interconnect path dynamically. This
is required to avoid boot crash in recent SoCs and also to save power during
runtime. More information is available in patch 2/2.

Credits
=======

This series is a continuation of previous work by Brian Masney [1].

Testing
=======

This series is tested on 96Boards RB3 (SDM845 SoC) and RB5 (SM8250 SoC)
development boards.

NOTE: This series is a spin-off from previous OPP and interconnect series:
https://lore.kernel.org/all/20230720054100.9940-1-manivannan.sadhasivam@linaro.org/

Since the devicetree patches are already merged to Qcom tree, they are excluded
from this series.

Thanks,
Mani

[1] https://lore.kernel.org/all/20221117104957.254648-1-bmasney@redhat.com/

Manivannan Sadhasivam (2):
  scsi: ufs: core: Add enums for UFS lanes
  scsi: ufs: qcom: Add support for scaling interconnects

 drivers/ufs/core/ufshcd.c        |   4 +-
 drivers/ufs/host/ufs-qcom.c      | 131 ++++++++++++++++++++++++++++++-
 drivers/ufs/host/ufs-qcom.h      |   3 +
 drivers/ufs/host/ufshcd-pltfrm.c |   4 +-
 include/ufs/unipro.h             |   6 ++
 5 files changed, 143 insertions(+), 5 deletions(-)

-- 
2.25.1

