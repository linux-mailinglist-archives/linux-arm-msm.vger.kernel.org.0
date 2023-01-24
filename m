Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D247679410
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 10:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbjAXJXd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 04:23:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbjAXJXc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 04:23:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411CA30D5
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 01:23:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E630DB810FE
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 09:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C93C4339B;
        Tue, 24 Jan 2023 09:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674552209;
        bh=JeQ9yExBJKAbSDiaTpWRXv1OovcRZOo/t6/0Ap7MQeA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KXLTFJ7HSGOIVm0fYvDHvFbEarS6sirwZT507OsUwKXEQ/0YtLgsta5nQvFHdHu7k
         5mUII5ONW7+o5lxqekIDz5ZNd+4eluqGDu1IiQ4qQrcU/5j9KwmXLmlvu2xAwmxAjR
         BfZwRO+7Y2qAu8BSumEnlUW8bLxTbvcCNLywTPQUKVQ1e7AhwjCRtZVPTlA5KyydZy
         OV6KlCPsPuYBiKxgj6mYwaDv/K+66E3RJ5BDBeMH1sEjtJxFAVDmoHGWZoPU6fAz0H
         BkzprKyrtK6Xf9ltxIJS8/kUSLozAX5jn9271Qs1KZlWCLTWN0QpOslD7jfbqb87xh
         oUNMGYJAoOC5A==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pKFWa-0006tf-RF; Tue, 24 Jan 2023 10:23:29 +0100
Date:   Tue, 24 Jan 2023 10:23:28 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH] phy: qcom-qmp-combo: correct DP register offsets
Message-ID: <Y8+jkBOFzhCoVZmS@hovoldconsulting.com>
References: <20230123120807.3101313-1-dmitry.baryshkov@linaro.org>
 <Y86TDYOKtpcLdZYx@hovoldconsulting.com>
 <CAA8EJppU4nQRYWwAahWtjrVbU1ywF4P+zxHs1PZm98bzKswiZA@mail.gmail.com>
 <Y8+KSV/0Jk9nnntK@hovoldconsulting.com>
 <2fa21add-0198-937c-2de4-05f0f0a102df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fa21add-0198-937c-2de4-05f0f0a102df@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 24, 2023 at 11:19:32AM +0200, Dmitry Baryshkov wrote:

> Let's check with Bjorn. However even if the original offsets are 
> correct, I think we should add dp_txa/dp_txb offsets (and make them 
> equal to txa/txb in sc8280xp case). WDYT?

That is already being done as part of Luca's series:

	https://lore.kernel.org/lkml/20230120-sm6350-usbphy-v4-2-4d700a90ba16@fairphone.com/

Johan
