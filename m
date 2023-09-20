Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 706E67A8A1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 19:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235209AbjITRKW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 13:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235153AbjITRKR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 13:10:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D7BC6
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 10:10:11 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39327C433C7;
        Wed, 20 Sep 2023 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695229811;
        bh=KP9IcaiHNhAMnTzX+ZBEk7bOQS90xvHRMfHmkZfCs4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TCqQckW883n+AiYIVWcDftPSvpKx/VWm7ewtENRzz0zuS5sDra2vBGnEvaZgFm4TR
         gnx3+8a6r/OkibNQ3e+bKDtWIYkzSf28XiHYDt89dUNQXPrnjsNhV5VQqg5WzErGxT
         agqWwyxrcYMXBFk0cxXSd0NfQWrWd/Ge8NDl+45zrVeroX5uFG21/fTLqLbY5aggLZ
         5l4NT0bTshCLqahbqt9GAuxrDxbCQbtI6sD5jD5YhG6Y/IQwV8E6vnW8IGwmYGTwh/
         p3EdqihTR3tRrszNH3/RJ9EjU4NhnHha2m3BOyk537AIfY/uO9/REWg5yYYKksXn46
         sRrBKEzUDFdGg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 00/18] phy: qcom-qmp-pcie: convert to newer style of bindings
Date:   Wed, 20 Sep 2023 10:13:59 -0700
Message-ID: <169523004940.2665018.6127381308126268052.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
References: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sun, 20 Aug 2023 17:20:17 +0300, Dmitry Baryshkov wrote:
> Reviewing several patchsets for newer platforms made it clear that
> having two styles of QMP PHY bindings causes confusion. Despite binding
> documents having notes telling that old bindings should be used for
> older platforms, it is too easy to attempt adding new platform with
> older QMP PHY binding. Thus let's have just a single documented style of
> bindings.
> 
> [...]

Applied, thanks!

[18/18] ARM: dts: qcom-sdx55: switch PCIe QMP PHY to new style of bindings
        commit: bb56cff4ac0347fe5adb57659ceab338da7f8559

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
