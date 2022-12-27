Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF057656DC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 19:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiL0SEH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 13:04:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiL0SEG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 13:04:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A5B1162;
        Tue, 27 Dec 2022 10:04:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 19DEF6102A;
        Tue, 27 Dec 2022 18:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A3CC433EF;
        Tue, 27 Dec 2022 18:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672164244;
        bh=I6jd4XwS/L5DIHtyZOpfhgWdtcHV5gfEUW44QKWNuKo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AqWjgMbRmZC8e0LmJNRGH8hrnOew19bxkCuw8PmSZObXrSV/gXi7/5Wcg0J3oj3Fo
         NJNMp8duuf9dn+ggSJ0AB6D0DF+G/r80WhsDSezQYqBng1XKrsCXhHZlQ0dx/dh60A
         V30yMk/aGkbRehDLHXMc9TElD2CqDoZThEPZaq7oo+WbRgYQXZYJMgWqOW3gNfDCAj
         sLa1bddc6QhHGp3K5X1Dn/PJYCArkKmrKJ1dfONaJK3fmRNT/MHsxfk5xuhL//k/15
         5xH0jo35pNYpIXfF3boDm+y6TX/Wt8xwg5cvTRkXrsIvzSQLrYG8Cdwl9bOfBaMGsK
         m3149pQDD05Fw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, robh+dt@kernel.org, kishon@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH 1/3] dt-bindings: phy: qcom,pcie2-phy: convert to YAML format
Date:   Tue, 27 Dec 2022 12:03:59 -0600
Message-Id: <167216423712.744668.9850054899253387953.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221216234027.539917-1-dmitry.baryshkov@linaro.org>
References: <20221216234027.539917-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 17 Dec 2022 01:40:25 +0200, Dmitry Baryshkov wrote:
> Convert the bindings for the Qualcomm PCIe2 PHY into the YAML format
> from the text description.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: qcs404: register PCIe PHY as a clock provider
      commit: 977e9262c3542e87b513d4dad4c57b2c85e16c8c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
