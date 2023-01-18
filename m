Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE396724C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 18:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjARRXi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 12:23:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbjARRXe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 12:23:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8496582A7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 09:23:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 838C661940
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 17:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0F0C433A8;
        Wed, 18 Jan 2023 17:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674062595;
        bh=kqjntvaC3IW0Pm52FaSq0u0ith02r034hWtEr8MgTfs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HSx99UocAPIQtvAMOel77IRG3PTc4syzWvQ3RZCzvvZTlz00L5OeZR9StrtgL0Pqe
         lu1MvuZHgDh5WUa2gPXX9tnINqptgxalGpFwM4FExGrxEzwQ39bfIBHgTt8Z1h7ALz
         ogDI0zRWq8hwNvtDjbeINTuOa7PvCYF0GDeXgDgaKijr//P9cfbORs4kBEP6QUi5WM
         MXoO/KNS3LeFBYTjcI1iErosjr5kvGP5K8oQm6TfKTqUoTK8EKPsQuakzIcMdi69kx
         f4G8zsPXbPizhINXlntj88VMtvTLMU3H1dZACvSuekb9OF45wsSmwSOz+y29pRE4iZ
         d6RvJLQ23iaZQ==
Date:   Wed, 18 Jan 2023 22:53:11 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH] phy: qualcomm: qmp-ufs: rename qmp_ufs_offsets_v5 to
 qmp_ufs_offsets
Message-ID: <Y8gq/zsVIzAeHwRU@matsya>
References: <20230113195515.407866-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113195515.407866-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13-01-23, 21:55, Dmitry Baryshkov wrote:
> All currently known QMP UFS PHYs have the same offsets for register
> sub-regions. Instead of using qmp_ufs_offsets_v5 for older generations
> of PHYs, rename the offsets struct instance to remove _v5 suffix.

Applied, thanks

-- 
~Vinod
