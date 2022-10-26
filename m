Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE9E60E469
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 17:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbiJZP00 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 11:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234208AbiJZP0Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 11:26:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3145DFC18;
        Wed, 26 Oct 2022 08:26:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5DDCBB82303;
        Wed, 26 Oct 2022 15:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DAFC433C1;
        Wed, 26 Oct 2022 15:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666797982;
        bh=b7FQwnpUo6p/kfSTzvqYXDubrfIN2Tnba/YlUOJ7dyc=;
        h=From:To:Cc:Subject:Date:From;
        b=gFtuTJ/nb5Kr0v9JAWeIkiqFio2uMgAY0fpDf0KHIi0XnNgNxZ5tq6lc+RMaqY2cr
         FjnTfRA/YiZx/17I+xOuxzfDhHdYHhO/wHnWCvr2Fxh8ULLR2b2UfnXuQtqZ4G8BB+
         HZP8S8Uyqu9LHz+guzbVUNryiVTlO92PdxWHkwUg2a9wCArVY2P8cN3gim+t2HHyB/
         hZ7jp8pnFJFV3K3/dqDrzuqr3HC8j+AcXaHE0WiAovr+7RLj47EHYA9wIZwwCJd957
         Uw1sxtJWHFvDq7wUQGWrQ6z7+o8SDK8pKwRh3Z6zoiPa7czh5q9f3UuYZKlPgN0fWs
         +M36sQJ7KvH2g==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan+linaro@kernel.org>)
        id 1oniI9-0002Wc-NK; Wed, 26 Oct 2022 17:26:05 +0200
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] arm64: dts: qcom: drop bogus DP PHY clock
Date:   Wed, 26 Oct 2022 17:25:09 +0200
Message-Id: <20221026152511.9661-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The QMP pipe clock is used by the USB part of the PHY so drop the
corresponding properties from DP child nodes.

Johan


Johan Hovold (2):
  arm64: dts: qcom: sm8250: drop bogus DP PHY clock
  arm64: dts: qcom: sm6350: drop bogus DP PHY clock

 arch/arm64/boot/dts/qcom/sm6350.dtsi | 3 ---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 ---
 2 files changed, 6 deletions(-)

-- 
2.37.3

