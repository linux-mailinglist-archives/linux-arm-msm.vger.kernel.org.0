Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CCA2F1C59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 18:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389421AbhAKR3T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 12:29:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:56680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732124AbhAKR3T (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 12:29:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58C94222F9;
        Mon, 11 Jan 2021 17:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610386118;
        bh=j+QMNrWKiTVgiGIKhk5GzLT1jTpZdiSLSOdz2EEYJ9s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tn4Rm/ndpygV/ABLlCx79nWnj4Sw/X4F4q8JaU4l86OHAqcHNTHD5yG5P1HvoBDIP
         kFro0WNthg+SPB10O6+wU3+5dfKyVi0XFwmVOmBKr7FxFyeeLAC/8mFbkMDRbp2RwF
         KO3czdtVSu2be/LQUnZhw5ZyNVt8FRZMRBeXLHVrI8zsyDAxT+3dirYLsfvLNstWvn
         vcSZWFNvHUinYeI+uKpcFPyAmm+YDfrr73K3vM9grSrBdN9/Ns9Gb15+iDgrUlPj6b
         PF+KFEYVNi4w0jQX5fONBcbhtS+7MLJKV9xnc9zjmv+CoqrOFd8VM7kYu3urcwB9VU
         sekL2BeqAMegQ==
Date:   Mon, 11 Jan 2021 09:28:37 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     davem@davemloft.net, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: Re: [PATCH net-next 1/3] bus: mhi: core: Add helper API to return
 number of free TREs
Message-ID: <20210111092837.74115334@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <1610385379-15140-1-git-send-email-loic.poulain@linaro.org>
References: <1610385379-15140-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 Jan 2021 18:16:17 +0100 Loic Poulain wrote:
> From: Hemant Kumar <hemantk@codeaurora.org>
> 
> Introduce mhi_get_free_desc_count() API to return number
> of TREs available to queue buffer. MHI clients can use this
> API to know before hand if ring is full without calling queue
> API.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

You put net-next in the subject but this is not CCed to netdev.
What's the intention?
