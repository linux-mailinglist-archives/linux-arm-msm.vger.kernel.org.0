Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DADA1C034B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 18:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgD3Q7N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 12:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725844AbgD3Q7N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 12:59:13 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3158C035494
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 09:59:12 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id u22so2443400plq.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 09:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hwGqgGwwB9mPVayN4b5su/w3uXsvH2gdunBCVAd4MCg=;
        b=hcIp0AXr/ZahEGNIzMgMbqmcUHyN341Pn5LtLgQpx7OK27r1oAAghfky5DimHYafmH
         kcDT5Wqj0OJODdzRZmYYNxLq5sI4IzLwjIV5AXLJy1AIPm8fvI0R3EWFYvTHnRpDjO6J
         hry61LHgTMo0qKRZdakZaEVfPM7dHeH0VSO2DCKiHbdgIli9wZs9Rl4Z6DLZMKP/iUn3
         ONZ2A6aHS5VbbLu4Vvbi1mqH47kOxcRu5nhxc83x5oeqtp+6JKCoycw9EkQRXbWUQZzF
         DtYs8tqJsU60huyDrJTU8xejaqv6mNvvivQcpy//9UpAtqMFIHGroNsuX/jVo8U3jb+6
         Plhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hwGqgGwwB9mPVayN4b5su/w3uXsvH2gdunBCVAd4MCg=;
        b=EIoqWs3UNdErzqgy5SHD4deY+RB+iTy6VTZ2N2eTtuJNxUPtf5boxbbWqi4D38OdUM
         nTiBfrhctdx8JvYr5BGLnbbcdGgIh/xXzx5FRDIjYde9W74REAcHqxCdmewWLihWTlhD
         JXJs9XkWaKanw5rwXCm+omoK+t7xe4RjGOiWYd9uAQ+vZi1bzIvsGdTQbZqdhI89deC8
         z0d6zUeSGCRi10g+sda3KlUnP1I6ZLLSyKybl+/nXPjl0mT8FWp8Pe7Hhrn6NqqRet6U
         6DR8540abM2Igsl2jxs+fxLtdvUOf0XCupFNCGUO7zkyEWXkwh8IyEDB/8Ezl3qSD1+7
         tA3A==
X-Gm-Message-State: AGi0PuYOvxRu7Csq5RMEgiYwbIePjnJdBO+a1NTm4vXTcoVfWJ0B4ZBh
        s8iRVCnJp+9OC0Uhx4cQkIC/
X-Google-Smtp-Source: APiQypKkaJ21qAK4MkGOn2i+edwZ7cTLUiWJudrLtgR66MlWkb370GPdVgGz5Yz96qpk6BFCe/+9lg==
X-Received: by 2002:a17:90a:2606:: with SMTP id l6mr3704884pje.188.1588265952448;
        Thu, 30 Apr 2020 09:59:12 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6081:946c:419e:a71:7237:1613])
        by smtp.gmail.com with ESMTPSA id x4sm293207pfj.76.2020.04.30.09.59.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 09:59:11 -0700 (PDT)
Date:   Thu, 30 Apr 2020 22:29:06 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] bus: mhi: core: Fix typo in comment
Message-ID: <20200430165906.GG9449@Mani-XPS-13-9360>
References: <1588003153-13139-1-git-send-email-jhugo@codeaurora.org>
 <1588003153-13139-5-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588003153-13139-5-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 27, 2020 at 09:59:11AM -0600, Jeffrey Hugo wrote:
> There is a typo - "runtimet" should be "runtime".  Fix it.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  include/linux/mhi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 225a03a..effa172 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -339,7 +339,7 @@ struct mhi_controller_config {
>   * @wake_put: CB function to de-assert device wake (optional)
>   * @wake_toggle: CB function to assert and de-assert device wake (optional)
>   * @runtime_get: CB function to controller runtime resume (required)
> - * @runtimet_put: CB function to decrement pm usage (required)
> + * @runtime_put: CB function to decrement pm usage (required)
>   * @map_single: CB function to create TRE buffer
>   * @unmap_single: CB function to destroy TRE buffer
>   * @read_reg: Read a MHI register via the physical link (required)
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
