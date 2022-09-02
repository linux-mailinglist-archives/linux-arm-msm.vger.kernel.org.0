Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43C9D5AA97F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 10:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235675AbiIBIIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 04:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235671AbiIBIIS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 04:08:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92D7BB91F;
        Fri,  2 Sep 2022 01:08:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 972A3B829FA;
        Fri,  2 Sep 2022 08:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E10CC433D7;
        Fri,  2 Sep 2022 08:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662106094;
        bh=NzHDhgY0zXBXtEi3T20cJPJB0uznOhoVmX/WodgpvMw=;
        h=From:To:Cc:Subject:Date:From;
        b=HD12sV+ZmWshRGuU92uYAtR4sxLCisrf1cxsMTNJMkD2713y6ltgEcfiW9xcWG+TE
         NnvsA4jLZlHhoCXhXCi3TP6FGy4sZtjzLodEhsm8lFHZDnvdos+nFzmnVswE3IQrmi
         Xgo1uQrqdQgeNVUhqTejCoxpbw1IG4Jxb6jWZ3paiF887Ne2JeUy7VM097mPR0rXkt
         4/6Es2SuLkFj7x6ovjhmPVq5ClcuruZqT4rjAYXeuvYehOrGemZV/xgLieqsn9CGZw
         WeHrOwwpXQ+BqNbCAPDsdhjTRyNsA8HJKzmem5siPn/YBcyetdLTfS+HWq4i9BbWGo
         VN+NyF9L+m2qQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan+linaro@kernel.org>)
        id 1oU1iq-000397-JV; Fri, 02 Sep 2022 10:08:16 +0200
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] dt-bindings: phy: qcom,qmp: add missing power-domains properties
Date:   Fri,  2 Sep 2022 10:07:03 +0200
Message-Id: <20220902080705.12050-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The new SC8280XP USB PHYs require a power domain to be specified so
amend the bindings.

Johan


Johan Hovold (2):
  dt-bindings: phy: qcom,qmp-usb: add missing power-domains property
  dt-bindings: phy: qcom,qmp-usb3-dp: add missing power-domains property

 .../devicetree/bindings/phy/qcom,qmp-usb-phy.yaml  | 13 +++++++++++++
 .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml         | 14 ++++++++++++++
 2 files changed, 27 insertions(+)

-- 
2.35.1

