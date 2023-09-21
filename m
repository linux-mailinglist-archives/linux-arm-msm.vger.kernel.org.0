Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC9F87AA02A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Sep 2023 22:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbjIUUd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Sep 2023 16:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231640AbjIUUdI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Sep 2023 16:33:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6E886123
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 10:37:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A58EC4E75A;
        Thu, 21 Sep 2023 14:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695306369;
        bh=BBqfjUsfJ3kQ/EhGxEAQtBhKlPx/meeJnKHZzqCeh5k=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=kv6/ltG7KlBF+RvsYEM0RBt+gr4S3JYK6t+QyY7jLcqWayRyREwkguwyfVsLmSPyn
         21I3sydRTVME+oU5qN7j2ZUyDRT+lV2WOjVLFqupyCv6to4jgLJn2f8EDO+NYkIfFY
         IJR+eUxIgg3FU6ALEHKyZ4wlMh2nmTROyr7alUtRiApj6yDewtNac0Sht84N1kZMoq
         189QoqPxJW7Si35SN9SqAyjUEPte4+pJQgqGqvw6DmWc0uC9anPST/xDBFCOdR5k1x
         9IvwWoDRvbHN5RykV7PhwMB6xMveSYB2iWxSJfMPWNArpUO/Gnqn+Ury3OsPZ3gFUG
         NqR2cGr1tpdtw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20230823181728.3082946-1-dmitry.baryshkov@linaro.org>
References: <20230823181728.3082946-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] dt-bindings: phy: qcom,ipq8074-qmp-pcie: fix warning
 regarding reg size
Message-Id: <169530636593.106093.1059911135057813024.b4-ty@kernel.org>
Date:   Thu, 21 Sep 2023 16:26:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 23 Aug 2023 21:17:28 +0300, Dmitry Baryshkov wrote:
> Fix the 'reg is too long' warning caused by me adding 64-bit address and
> size to the example, while default being 32-bit (cell size equal to 1).
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: qcom,ipq8074-qmp-pcie: fix warning regarding reg size
      commit: 211de9681195b92709b5d68e07af948b01c8bb9a

Best regards,
-- 
~Vinod


