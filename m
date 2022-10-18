Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B956021A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 05:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbiJRDGg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 23:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiJRDG3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 23:06:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7FC8D0C2;
        Mon, 17 Oct 2022 20:06:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 21516B81C60;
        Tue, 18 Oct 2022 03:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05058C433D7;
        Tue, 18 Oct 2022 03:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666062384;
        bh=aVsyh/Ic+kzwSkX6JrGCqLueEIQYpl2RcLSA4GCAMG8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IGqhUScNbAEVsdqjYsR5NQ1oxsjgulEW2HLgud+++2ySfqa+vmnuhSNA7frwFANZQ
         KTm0KL1C3Jo2dqK38kXBF+HT9Xd339prCD0LsASoAhvR8QeHUeCxb+EmCJyUCxSW25
         Ev6OjsXkcOlvoWivdjTgbKlF4V7PLXJg5SA49OAvCbB673iqRtcMibkSgWRKN5w5nQ
         U55Ioau+SddCUMWWNekvQWlCt2HWFIh4AH/GeUNY0JPg0l+v1DBqrO/c9H8wbvEpKj
         j7KgLgU4wAdtxt1SEW5HQastAmP1QM7JJdFyMLRAybki98iqhqAhcN+1v2VM0TqgAl
         CB2ZrW5ih7O1w==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, sean@poorly.run,
        devicetree@vger.kernel.org, robdclark@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        quic_abhinavk@quicinc.com, robh+dt@kernel.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@somainline.org,
        linux-arm-msm@vger.kernel.org, quic_mkrishn@quicinc.com
Subject: Re: (subset) [PATCH 00/11] qcom,mdss-dsi-ctrl: Remove redundant phy-names from yaml and dtsi
Date:   Mon, 17 Oct 2022 22:05:06 -0500
Message-Id: <166606235852.3553294.1984189683102287059.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 7 Sep 2022 01:00:54 +0100, Bryan O'Donoghue wrote:
> phy-names is both inconsistently used and not actually required by the driver.
> 
> Previous discussion with Krzysztof and Rob suggested to remove the property.
> 
> https://www.spinics.net/lists/linux-arm-msm/msg116525.html
> 
> - Mark as deprecated and not required in yaml
> - Drop from associated dtsi files => grep -r mdss-dsi arch/arm* | grep qcom
> 
> [...]

Applied, thanks!

[02/11] ARM: dts: qcom: apq8064: Drop redundant phy-names from DSI controller
        commit: 645953bae8ae89e072af3b78bd648c0035d806c0
[03/11] ARM: dts: qcom: msm8974: Drop redundant phy-names from DSI controller
        commit: 0b01159afd5a0b782610fc113c4d8c0594b6e43d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
