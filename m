Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41CC36111D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 14:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiJ1MsF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 08:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJ1MsE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 08:48:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF5F6068E;
        Fri, 28 Oct 2022 05:48:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C4CEE62839;
        Fri, 28 Oct 2022 12:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FFFC433D6;
        Fri, 28 Oct 2022 12:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666961283;
        bh=BMoxFqwGaW6SUytXTKr9LKE7S8OQUzWPmAFFm5Xf/5c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gMQRHkk2z8jCOItXeaYiHfXDOrfxcqQWEjbmzeiTfTnOT55xy3NGQv3QkbtTy3w3h
         S1Jg76tDKUZZRxfMsHYQPV6FdKlFPJMpjVa543v/ngoPhKj+gh/MqhUYpBEXjv29wg
         mwBm3e0YqSV6Kk/6u7hbAb+zmkOJIM0JuduiUpIVrIHopfxGOF7N1V8eoi9yGh57GD
         eYRWllICwO+5WnZstLnG8o73KUfzHjeaj18e9CkpbmxA8lrpvr9COuGmZzdHk7Picu
         jSJ8E/1+y98nxWnOOpClRL5MNu8NxFCZ9RFie3ntxOwQSf6jpqxTm5/8s9r4vzBnzI
         vjgwFZkmlRwjQ==
Date:   Fri, 28 Oct 2022 18:17:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 3/3] phy: qcom-qmp-ufs: provide symbol clocks
Message-ID: <Y1vPftugHtieR8Eu@matsya>
References: <20220916061740.87167-1-dmitry.baryshkov@linaro.org>
 <20220916061740.87167-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916061740.87167-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-09-22, 09:17, Dmitry Baryshkov wrote:
> Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
> ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
> provider to let other devices link these clocks through the DT.

My script is detecting checkpatch spacing errors, pls fix and resend

-- 
~Vinod
