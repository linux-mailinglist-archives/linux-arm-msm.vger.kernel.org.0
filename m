Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBBD5EEDDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 08:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234665AbiI2GZW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 02:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234875AbiI2GZQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 02:25:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D9058516
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 23:25:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D9CAE6203B
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 06:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0AFFC433D7;
        Thu, 29 Sep 2022 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664432714;
        bh=S54NO4ay7i8nZMBgBUU2qfynbjgCiZp4OdSSAkmIcR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PENLS4PousitN6sbiAbMWONHTvV2KMF7uCcfCEL6U8rvXB1ca9L8Kt75TLp2Fsa9g
         md0/cTFqdTqOyH6ETGIGPQksuiMXkoD9SkwbkU6HLTIO3cmOtEzWlVXpIazKYgt8/k
         7QJQl6cneowh1nn/r1NiftdrBs6NXxuemHGiqyJkeWrj4D7QWFeg8MBBjohqvC2aGl
         bdc7Vd3uUY0+BMD5M/OS7RCNNOk4wrktXnV/BrmhyBGnyIZGl0Zcq0QHTURHhNEhBj
         cKNy93RXv+j9/HnCtLaSnJbzEojFnfXCaRmfhxug2X9jlEqUA/cw1Ed8UYMf7b3KU9
         HyGE7ndBPVBpQ==
Date:   Thu, 29 Sep 2022 11:55:10 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] phy: qcom-qmp-pcie: fix resource mapping for SDM845 QHP
 PHY
Message-ID: <YzU6RhgdH4FnpEM+@matsya>
References: <20220926172514.880776-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926172514.880776-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26-09-22, 20:25, Dmitry Baryshkov wrote:
> On SDM845 one of PCIe PHYs (the QHP one) has the same region for TX and
> RX registers. Since the commit 4be26f695ffa ("phy: qcom-qmp-pcie: fix
> memleak on probe deferral") added checking that resources are not
> allocated beforehand, this PHY can not be probed anymore. Fix this by
> skipping the map of ->rx resource on the QHP PHY and assign it manually.

Applied, thanks

-- 
~Vinod
