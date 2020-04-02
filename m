Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC00219BB70
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 07:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgDBFzb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 01:55:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:50282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgDBFza (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 01:55:30 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23A89206D3;
        Thu,  2 Apr 2020 05:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585806928;
        bh=TMOB7xObTXK0rngZ9FmkC9I9d881cIffUOU1cSRb6rI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lYUFGTaf7/8lq9YCS3Lc6Qnzovvd6BiDGcoAxanH/1wLAdCQ0z+71LACMyDzbsWp/
         jcgAvlDhUhFWHsuXMbTNRFgmSQKNYIHvBUnUnYAQwkUaAT8UVAyzYKYFmA3V8dEA2w
         CxxsPpqzDNCO45ct/6F91dADVHBTfaf5smgPaaAk=
Date:   Thu, 2 Apr 2020 07:55:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     davem@davemloft.net, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, clew@codeaurora.org
Subject: Re: [PATCH v2 0/3] MHI bus improvements - Part 2
Message-ID: <20200402055526.GB2636682@kroah.com>
References: <20200402053610.9345-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402053610.9345-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 02, 2020 at 11:06:07AM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> Here are the remaining patches left from the pervious series. The QRTR MHI
> client driver has gone a bit of refactoring after incorporating comments from
> Bjorn and Chris while the MHI suspend/resume patch is unmodified.

It's the middle of the merge window, we can't do anything until after
-rc1 is out, so please be patient.

greg k-h
