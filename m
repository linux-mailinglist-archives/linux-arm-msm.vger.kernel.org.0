Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4999554AB63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jun 2022 10:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351346AbiFNICw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jun 2022 04:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240331AbiFNICt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jun 2022 04:02:49 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 063541B7AC;
        Tue, 14 Jun 2022 01:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/CkNSCdOHIp/6lIf7jWyMNo+jJBfgUBqPTYOXopN56k=; b=mxU9jITm245tXQEx3hRZynonfT
        4o1NNq5g5d6okkBmPkYML2tVaOuEWCX9aAgUCT//4CybmBprRK1N7xn1TfCFmZYvG2uD3i7D9bC4+
        TNhoEkiEFA5WFtPd8j9aamp5HrUIm7epiXlSh4gO9fpf79lmwmVDKDM4+asmL5eExyMzTJyzouR/R
        3aJW1oRq7NXL9l+CJiNNPWos1sKZxoUdtlipyjZVh6ut3lifINRdyZ1Z2VPlARgrQh5MWr3xCOmK3
        rYlmiaU0HSl0KjDrmYWZsCpsZku79C8ovrufVLt/ApgI/GpJxJEoyONsytPope5XVcFmvjSewQA8c
        B7m82Qlg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o11VN-0056M4-Pd; Tue, 14 Jun 2022 10:02:29 +0200
Date:   Tue, 14 Jun 2022 10:02:21 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH] Bluetooth: btqcomsmd: Fix command timeout after setting
 BD address
Message-ID: <YqhAjSDEC72c0e5d@kernkonzept.com>
References: <20220613110745.3778356-1-stephan.gerhold@kernkonzept.com>
 <9d8238ba-500e-3490-8a25-e7b72bab175f@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d8238ba-500e-3490-8a25-e7b72bab175f@molgen.mpg.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Paul,

On Mon, Jun 13, 2022 at 06:09:33PM +0200, Paul Menzel wrote:
> Am 13.06.22 um 13:07 schrieb Stephan Gerhold:
> > The Bluetooth firmware seems to become unresponsive for a while after
> 
> Please mention the device with the problematic firmware.
> 

Will add a comment in v2. It seems to affect pretty much all devices
that make use of the "btqcomsmd" driver.

> > setting the BD address. At least on recent kernel versions this often
> 
> The commit referenced in the Fixes tag is in Linux 4.9. Can you please name
> the oldest Linux kernel version you experienced the problem with.
> 

This is quite hard to say. It definitely became more apparent in the
last few months (so at least 5.17+). But since it's a timing problem
it's influenced by various side effects. For example, it is less likely
to happen the more hardware functionality you enable on a board (because
other interrupts come in and might cause the necessary delay).

I believe that the problem also exists in some form on Linux 4.9,
even though it might be harder to trigger it there.

Thanks,
Stephan
