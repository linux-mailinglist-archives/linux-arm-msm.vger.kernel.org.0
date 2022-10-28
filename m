Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC7FC6111BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 14:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiJ1Ml5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 08:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiJ1Ml4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 08:41:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD428F260
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 05:41:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8EB01B829B9
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 12:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F1CC433D6;
        Fri, 28 Oct 2022 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666960912;
        bh=yt0OtT5mZC5NU6S4qy6NmPJ8mfVfSxPDuZcOimddJT8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tyeO2dUijGtvSzQjoGST0fMWZEqS7sLc8zPDzFQqFpeuzBH5TcRbumevySoCzJONK
         GGQN3D8vHdWjsoh/K3BFY6/js81GK+HOnolj3dfVqVmEFh1SLdtTVsTpEG81w3xGkp
         DY7e4UlunNCW7x8BDGDXXBbSJr+VKS55uFJiv0SNtf77KMV+lZHSyUM1jiz9+xpjaz
         OTqt2ttR5Sz/Vc2LCblOfr7NdcWfKB5bA9+5K6eoW0lmbYnVwdcyfe7WewGhLr0jqG
         oQZVwcm1x6fGCxBNmTm7BsDc/w1AE/jHITzTH8tPHPOSMBK1qPzMbU/dZPC5VpfTpL
         +OfTmaVl3L57Q==
Date:   Fri, 28 Oct 2022 18:11:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Robert Marko <robimarko@gmail.com>
Subject: Re: [PATCH] phy: qcom-qmp-usb: correct registers layout for IPQ8074
 USB3 PHY
Message-ID: <Y1vOC3kiUTb2C25Z@matsya>
References: <20220929190017.529207-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929190017.529207-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-09-22, 22:00, Dmitry Baryshkov wrote:
> According to the kernel 4.4 sources from NHSS.QSDK.9.0.2 and according
> to hardware docs, the PHY registers layout used for IPQ8074 USB3 PHY is
> incorrect. This platform uses offset 0x174 for the PCS_STATUS register,
> 0xd8 for PCS_AUTONOMOUS_MODE_CTRL, etc.

Applied, thanks

-- 
~Vinod
