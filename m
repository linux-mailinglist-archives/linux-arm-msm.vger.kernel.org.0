Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E88E3B3091
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 15:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbhFXN5N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 09:57:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:40324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229940AbhFXN5N (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 09:57:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A47B6102A;
        Thu, 24 Jun 2021 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624542893;
        bh=JQHfRZ6+aUxBd8ArMlVUUYDu5HExJ1cfuSzFjC7vCk8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1s0iqi3fnxI/Jkcta7Advj4ez2A4wNhLLyLtwX2dW5RwvT89b7KMNTQZo79wJbuDr
         DxKeDBppogBIUepUhVhIZncdmqOqp3CIRRidOrJFgtrPgrYrggU0hpoJNuhTncm5Ig
         SkGS3ciomH7h2kt2dOKYHLWqY5DQP7p+MAhHYO7c=
Date:   Thu, 24 Jun 2021 15:54:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH 0/8] MHI patches for v5.14
Message-ID: <YNSOq09BHPIPmmgF@kroah.com>
References: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 21, 2021 at 09:46:08PM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> Here is the MHI patch series for v5.14.
> 
> Summary of the patches:

I took some of them :)

