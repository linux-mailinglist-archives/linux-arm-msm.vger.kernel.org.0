Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5AAB1C44BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 20:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731565AbgEDSJa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 14:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731836AbgEDSJ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 14:09:29 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7907C061A0E;
        Mon,  4 May 2020 11:09:29 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 3704515D2ADAD;
        Mon,  4 May 2020 11:09:29 -0700 (PDT)
Date:   Mon, 04 May 2020 11:09:28 -0700 (PDT)
Message-Id: <20200504.110928.1212053951145300776.davem@davemloft.net>
To:     manivannan.sadhasivam@linaro.org
Cc:     gregkh@linuxfoundation.org, smohanad@codeaurora.org,
        jhugo@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        clew@codeaurora.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/3] net: qrtr: Add MHI transport layer
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200504144906.GF3391@Mani-XPS-13-9360>
References: <20200427075829.9304-1-manivannan.sadhasivam@linaro.org>
        <20200427075829.9304-3-manivannan.sadhasivam@linaro.org>
        <20200504144906.GF3391@Mani-XPS-13-9360>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 04 May 2020 11:09:29 -0700 (PDT)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 4 May 2020 20:19:06 +0530

> Hi Dave,
> 
> On Mon, Apr 27, 2020 at 01:28:28PM +0530, Manivannan Sadhasivam wrote:
>> MHI is the transport layer used for communicating to the external modems.
>> Hence, this commit adds MHI transport layer support to QRTR for
>> transferring the QMI messages over IPC Router.
>> 
> 
> Can you please review this driver? It'd be great if this ends up in v5.8
> along with all other MHI patches.

If it's not active in patchwork it's not on my radar and you must resubmit.
