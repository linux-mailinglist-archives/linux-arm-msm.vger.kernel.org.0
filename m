Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA9D5E8935
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 09:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233562AbiIXHeU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 03:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233565AbiIXHeO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 03:34:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0EC51288B4
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 00:34:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 107FEB807E7
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 07:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3850CC433D6;
        Sat, 24 Sep 2022 07:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664004840;
        bh=4PhFBlqrzVTT67Bn05qUy0wEEgFrBjyYhFSRuqqEgUA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KFQ08E2l/yqeU+paRt97b2jpx8fhY/+IHqHldUOdYujRkA4hAJQ2F2vxXsrJLPe7y
         i4dV48wVcGB/UQYmxXRmg4QABMgg9O4Utsq38U6KsV25y0rBzsvSjo7fckzB9zhn9j
         MI36NME5j+3OEc9wt5nVBxxgZqm+9asAHwdOxrKF7ZWhCG9BDGIZkeLTWOvjdXoJLZ
         U3msiTU6RJ/6sggJS47Rzp+EBTzdLxz6IQ5m06rbbOWhIWEx3hBAOMc6hGlj7xt5Ow
         Fa3SkRI86pu6UdJLHhEa4YrmUMcLA77yGdWJhnwDmPFbzgLGnOPiNel1shb1vpj4M9
         qORYLdxRmrXTA==
Date:   Sat, 24 Sep 2022 13:03:56 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yuan Can <yuancan@huawei.com>
Cc:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, kishon@ti.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 0/4] phy: Use dev_err_probe() to simplify code
Message-ID: <Yy6y5NQaHmcj74It@matsya>
References: <20220924070300.25080-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924070300.25080-1-yuancan@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-09-22, 07:02, Yuan Can wrote:
> This series simplify the error handling in probe function by
> switching from dev_err() to dev_err_probe().

Applied, thanks

-- 
~Vinod
