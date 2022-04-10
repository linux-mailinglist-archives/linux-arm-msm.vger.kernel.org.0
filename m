Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE7584FAFF7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Apr 2022 22:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243868AbiDJUDq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Apr 2022 16:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241911AbiDJUDp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Apr 2022 16:03:45 -0400
X-Greylist: delayed 184 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 10 Apr 2022 13:01:33 PDT
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.160])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C257EFD03;
        Sun, 10 Apr 2022 13:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1649620707;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Q0zaa6x8L/zJq4EZoJdZZ2aoEeM96eYpbKva6Ikjg7w=;
    b=eB2ElaJDX0IIBjs2WfdN2c7Ss67RD+FHFHeU5hg3U5BMf2/meme44lyyHvX4E5c6dF
    i7Vy/DPYYkEc+RHxDyER41NlwCsJ7xgTPbSf9EufN4H9K8vvwo1eKWi2s2FmsoP5Jpcn
    Uc8AI6BMGtvQVdETK8jsJzrf8IhxRD9MC3snQlWC25M7R0p5mwxVeQUCmRUAu6ygtQRG
    GNSxpV4eCP+hXoOB0X3Eij9qQcAQypDQ69FWMrD9mjCOFcrKf39c1W0nV/Uzchb4OVO+
    7hr18MY0nrgTcYYNzCWKrXRMY8adwJyPpNTbraZ7zXxjoUJNrbWQdKV7ArVkwh4A1wUQ
    4llA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL/b+s="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.42.2 AUTH)
    with ESMTPSA id u05e50y3AJwRAOp
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sun, 10 Apr 2022 21:58:27 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/2] msm8916-huawei-g7: Add sound and clarify installation
Date:   Sun, 10 Apr 2022 21:51:11 +0200
Message-Id: <20220410195113.13646-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch set adds the sound card to the msm8916-huawei-g7 device tree
and clarifies the suggested installation instructions. Speakers, 
headphones and the microphones are all functional, although the audio 
jack detection is a bit unreliable sometimes (not a big problem though).

Stephan Gerhold (2):
  arm64: dts: qcom: msm8916-huawei-g7: Clarify installation instructions
  arm64: dts: qcom: msm8916-huawei-g7: Add sound card

 .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts | 59 ++++++++++++++++---
 1 file changed, 50 insertions(+), 9 deletions(-)

-- 
2.35.1

