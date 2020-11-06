Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE3892A8EA4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 06:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgKFFOB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 00:14:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgKFFOB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 00:14:01 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C409C0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 21:14:01 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id i7so28170pgh.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 21:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/05wysRivKJ7maKrDsxGNEnT+wBLM5WdoBotDY7c+Ls=;
        b=nQnwRKDLdqSqPkY0Eas1l8ukEnerMs9KUBmaXLKszObMWwkT8sp2dq4yb8k7yZxLkN
         MbXF4jJZm9rudR/dzXQxWSsJTdEbAYSfo6/NvzTFRmrO2wFPYvYlfeFee0SNc+oarcMg
         C4dWHTUBM2oWAegr4/CBbDB1f7Y8Bbs52a+igSADvY67jgq5LQ65x04N7fY1UYAODOgt
         rGMP+sbjFVUxw1J12x+RAMtChFgqs7E+Dd7qxV++hoCAfw9toyuRNwaeilCs/2C6JAJL
         paU9zjS4NsmQDOngv21DQ6TpZ5TWxnNT2IqGq6ZQtQB8+WOy7B4rlipfAn1qgN6rNtUW
         oPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/05wysRivKJ7maKrDsxGNEnT+wBLM5WdoBotDY7c+Ls=;
        b=iTyxHbuAkmsC6bwoBAfqn/71WqRBUSp3SnI28BXffw5HdFjJWQD8vQPTcU/fJ4+1lL
         H8CMcocvkyU77Nfmw+/TfOdZ4x1E8MUxbVONQDcj2chRaTxWuroYRSUXF/kSkobOQoRz
         vhfRkCzewy+V4U9EsBiBSmMvzsv6YQFi0xXeEXwmSfi1wDd+FLrhfm0fUDWe/76ytqqW
         a6hMvMSEi/VoUMlLLFjsv8lo41hEuwM8X0HeB4A/wuy64m8Bys8EaeHRgABGrQA0l9YV
         WGEpmYY79k4Zm4GYfqYbMtBPuBZ5SPthkK+aQWkDDiOmaaO081rilGbp2VB/K3MbgOSJ
         mC5w==
X-Gm-Message-State: AOAM530BRzzUJ0AS1/tobzm4Y9amHf4mKriKrdBj59X3oyGVp3+PB9ic
        //4ztdEzS2EICyWgctmdr4RtSFzKiETR
X-Google-Smtp-Source: ABdhPJzOgy39t5BfZ8DQ8IKKa65asGIGM8V/uwQ7kJKOHlelIMFI4c0wBjWSazQ2Fu5mO52mY08orw==
X-Received: by 2002:a17:90a:eb12:: with SMTP id j18mr534319pjz.15.1604639640724;
        Thu, 05 Nov 2020 21:14:00 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id t1sm417607pjw.42.2020.11.05.21.13.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Nov 2020 21:13:59 -0800 (PST)
Date:   Fri, 6 Nov 2020 10:43:53 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, davem@davemloft.net,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org, willemdebruijn.kernel@gmail.com,
        jhugo@codeaurora.org, hemantk@codeaurora.org
Subject: Re: [PATCH v10 1/2] bus: mhi: Add mhi_queue_is_full function
Message-ID: <20201106051353.GA3473@work>
References: <1604424234-24446-1-git-send-email-loic.poulain@linaro.org>
 <20201105165708.31d24782@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105165708.31d24782@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 05, 2020 at 04:57:08PM -0800, Jakub Kicinski wrote:
> On Tue,  3 Nov 2020 18:23:53 +0100 Loic Poulain wrote:
> > This function can be used by client driver to determine whether it's
> > possible to queue new elements in a channel ring.
> > 
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Applied.

Oops. I should've mentioned this (my bad) that we should use an immutable
branch to take this change. Because, there are changes going to get merged
into the MHI tree which will introduce merge conflicts. And moreover, we
planned to have an immutable branch to handle a similar case with ath11k.

Since you've applied now, what would you propose?

Thanks,
Mani
