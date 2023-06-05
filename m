Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 439E0722EDE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 20:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233775AbjFESqK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 14:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjFESqJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 14:46:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806E2EC
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 11:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685990721;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Pl7VDgr8UNMU74WbMQfkak7oCKY3DAIqgpVAS37cfg4=;
        b=GBPRim+PTpFljq/aWkyXNm+e1md3aW6lgWthNOj51f6ED4KuT15aBF9Tg/x+TklV2nOmyr
        OkIEgDbDrVycj0OSsqGOPKxuIfAw9xLy/QJCzlgZL4MAq2ZxFgQdMsGFqgHsY6ENb7fe6D
        qYSqihGFkokAbgKEVV6w94eNWwax6E8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-50rdRBtLMSe4aZjLasmAtg-1; Mon, 05 Jun 2023 14:45:19 -0400
X-MC-Unique: 50rdRBtLMSe4aZjLasmAtg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-62619240316so49557256d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 11:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685990718; x=1688582718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pl7VDgr8UNMU74WbMQfkak7oCKY3DAIqgpVAS37cfg4=;
        b=TslcluA70En2uMgE+QKFBqLz5HM2Fmi4oIbTHttC8ZSDuWR8DqjOkRlXhGKF/IqARC
         Dw7e0gwlfRW92ywDAiOb6m65bE5Sre8HmnrDaGy+P7zdXIAMEMsOmQMD0SzJDvOnm7nW
         yYq4LEDhs3pL7xP86m7HiPnI8naGIvFValvM6cAmbp2zTqPFuJ3ieB4H0QiJvPYjB/ku
         dLLWfjcTncXw4817Y+3r4fbKP6T4zlOZU6VFRxFnkgy5QBlAYSv1dnHss3NjxjsQPT8X
         00wZ3Mt1AjlI+byMr9ujJtSpCCLCR4EOf0gmVicjK6t5lkuDxYApfvP3uYRR3myJo6Uc
         kaow==
X-Gm-Message-State: AC+VfDyKF1ttxWCVLg2WUeM/JUSgCng2zaCS+oQqhfJDaHwh215CfgpG
        7G3e0FxD01zmyFh2kt3tl4Or1YKLHNqRDL0yl76vap8eI3sbZhYnKKsDo7siziiVwYGQEIHM1RZ
        uGDRVZsP266PaHC0RqM5goziXPA==
X-Received: by 2002:a05:6214:20a9:b0:626:1a56:734c with SMTP id 9-20020a05621420a900b006261a56734cmr7864893qvd.40.1685990718102;
        Mon, 05 Jun 2023 11:45:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7wJl9BPrC2/U3KWsQrnPIw8ATJ/8NswxDgCajqUCql/TrB+9mmgBLclfAGijAn2P6Y5nohcA==
X-Received: by 2002:a05:6214:20a9:b0:626:1a56:734c with SMTP id 9-20020a05621420a900b006261a56734cmr7864877qvd.40.1685990717891;
        Mon, 05 Jun 2023 11:45:17 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id d10-20020a0cc68a000000b00625da789003sm4785771qvj.110.2023.06.05.11.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 11:45:17 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Philipp Zabel <pza@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 0/2] Clock fixes for qcom-snps-femto-v2 PHY driver
Date:   Mon,  5 Jun 2023 14:44:52 -0400
Message-Id: <20230605184455.34832-1-athierry@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series contains a few clock fixes for the qcom-snps-femto-v2 driver:
- make sure ref_clk is properly enabled
- add system sleep PM ops to disable the clocks on system suspend

v1 -> v2
- keep cfg_ahb clock and use clk_bulk API to handle both cfg_ahb and ref
  clocks (Bjorn Andersson)
- add system sleep PM callbacks (Bjorn Andersson)
- add Link: and Fixes: tag (Andrew Halaney)

Adrien Thierry (2):
  phy: qcom-snps-femto-v2: properly enable ref clock
  phy: qcom-snps-femto-v2: add system sleep PM ops

 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 85 +++++++++++++------
 1 file changed, 59 insertions(+), 26 deletions(-)

-- 
2.40.1

