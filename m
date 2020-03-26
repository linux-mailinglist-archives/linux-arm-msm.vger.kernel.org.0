Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7325F1941FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 15:52:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgCZOvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 10:51:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:54146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727612AbgCZOvs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 10:51:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA43320775;
        Thu, 26 Mar 2020 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585234308;
        bh=qjvx5mZhLZHRKRraYa36bvtb5irZJi+ufK/+Jpcq9Ns=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=14NkS6Z4ZKLEIwO7sARrJkhoLqG910CyR7dvbWQD0ErcBNfhpQJqPhVHXsgchT6s5
         QYuAnSsZrI0IKVDqBn+RXjc1lhoepAlkifc7hGiQsTT4bTKyMKG/YimMOqsA86twZt
         BwqkXycHYkZeFYCHJUMtHPNbhpd7lMZNO/tQOdKU=
Date:   Thu, 26 Mar 2020 15:51:44 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     davem@davemloft.net, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Improvements to MHI Bus
Message-ID: <20200326145144.GA1484574@kroah.com>
References: <20200324061050.14845-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324061050.14845-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 24, 2020 at 11:40:43AM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> Here is the patchset for improving the MHI bus support. One of the patch
> is suggested by you for adding the driver owner field and rest are additional
> improvements and some fixes.

I've taken the first 4 of these now, thanks.

greg k-h
