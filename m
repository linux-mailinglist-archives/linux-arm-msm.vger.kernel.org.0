Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 658D7666EE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 11:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233502AbjALKBL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 05:01:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjALKAi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 05:00:38 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D5521A8;
        Thu, 12 Jan 2023 01:59:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A9E9D61FC6;
        Thu, 12 Jan 2023 09:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87722C433EF;
        Thu, 12 Jan 2023 09:59:06 +0000 (UTC)
Date:   Thu, 12 Jan 2023 15:28:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Slark Xiao <slark_xiao@163.com>
Cc:     mani@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: Update mhi driver description
Message-ID: <20230112095856.GA4782@thinkpad>
References: <20221229011358.15874-1-slark_xiao@163.com>
 <5b95162c.5aa8.185a533db68.Coremail.slark_xiao@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b95162c.5aa8.185a533db68.Coremail.slark_xiao@163.com>
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 12, 2023 at 04:58:37PM +0800, Slark Xiao wrote:
> Hi Mani,
> No response of sending email to mani@kernel.org. This email address
> was generated by scripts/get_maintainer.pl.
> 

Sorry, I thought I covered all pending patches but apparently missed this
one. But my kernel.org is still valid.

Thanks,
Mani

> At 2022-12-29 09:13:58, "Slark Xiao" <slark_xiao@163.com> wrote:
> >This should be a mistake. MHI contains "Host Interface"
> >already. So we shall update "MHI" to "Modem" and the full
> >name shall be "Modem Host Interface".
> >
> >Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >---
> > drivers/bus/mhi/host/init.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> >index bf672de35131..7307335c4fd1 100644
> >--- a/drivers/bus/mhi/host/init.c
> >+++ b/drivers/bus/mhi/host/init.c
> >@@ -1449,4 +1449,4 @@ postcore_initcall(mhi_init);
> > module_exit(mhi_exit);
> > 
> > MODULE_LICENSE("GPL v2");
> >-MODULE_DESCRIPTION("MHI Host Interface");
> >+MODULE_DESCRIPTION("Modem Host Interface");
> >-- 
> >2.17.1

-- 
மணிவண்ணன் சதாசிவம்
