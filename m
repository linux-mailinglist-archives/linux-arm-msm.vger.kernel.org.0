Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2697B196E9D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2020 19:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgC2RSB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Mar 2020 13:18:01 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:40925 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbgC2RSB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Mar 2020 13:18:01 -0400
Received: by mail-pj1-f67.google.com with SMTP id kx8so6258656pjb.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2020 10:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1VdjSPPRhlOBu7W9s+NexDovrzvWntWGJmIdhHoxZAQ=;
        b=a4VluhObQuJFb8SVMTjUUnyaHON/TeGQbbeStEeHeBcJegBh1n4OVsHdtsIfVjvse5
         IbvBFPybuUVOSQC5Fxd7Qc5iEqcrp89RD74YyUyxSTdpfuKOOp0DVATyIlxcyzQfmBWr
         zEFxYeTsBKcYbSpW7IIWW+VqW4tsstUSA4qE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1VdjSPPRhlOBu7W9s+NexDovrzvWntWGJmIdhHoxZAQ=;
        b=rmue0QrovrsY7kKc08bLYh8kYey88lMlvwEq/w4JBmgdxuwfKXwOmVGmQcQ0q9kFHB
         z+HKh7C3acXiQXLxCg2tYeLS4czlXtMKDjyESkoioqP/E4buA0lIZiPBc2ajWAfs8uZ3
         CvM4KJH0rC2v/bXJUQN1bhj76JO7Wed1SDOOrcEYpXDYIMgutYhsb0Ajlv/9r1mRSynl
         em9dpRb39GBSjc9QTY0Y/HtwBQJr8otJXAPuFvSD+FK6/PTg4kb0cCmvNy5d8HjUdUS0
         uk7xb78BVi28nu0mePswP07P9rnjHYDbIzAej56/ti7B7zY8+pEbaIKDlpct53TNXFF2
         OD3A==
X-Gm-Message-State: ANhLgQ0IzDtI27eCCzt3p6M2ZHJgNfu6xdZxeZxkGYzqahqx4/XdOT1r
        UJScAL1fUBzjhxFvC72E4EaBjA==
X-Google-Smtp-Source: ADFU+vsiB7DX7YoDE8Qsn1o3o8N1nnCf0ZGMiEPaCNY3wHCH2wyiT2nAj/cJUqGyY0agzks/DRDjjA==
X-Received: by 2002:a17:90a:b702:: with SMTP id l2mr11203973pjr.22.1585502280189;
        Sun, 29 Mar 2020 10:18:00 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id t2sm4016414pfh.157.2020.03.29.10.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2020 10:17:59 -0700 (PDT)
Date:   Sun, 29 Mar 2020 10:17:56 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v6 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20200329171756.GA199755@google.com>
References: <1585302203-11008-1-git-send-email-sanm@codeaurora.org>
 <1585302203-11008-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1585302203-11008-3-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 27, 2020 at 03:13:21PM +0530, Sandeep Maheswaram wrote:
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
> 
> This requires for two different paths - from USB master to
> DDR slave. The other is from APPS master to USB slave.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 128 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 126 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 1dfd024..7e85fe6 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>
> ...
>
> +/* To disable an interconnect, we just set its bandwidth to 0 */
> +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
> +{
> +	int ret;
> +
> +	ret = icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = icc_set_bw(qcom->apps_usb_icc_path, 0, 0);
> +	if (ret)
> +		goto err_reenable_memory_path;
> +
> +	return 0;
> +
> +	/* Re-enable things in the event of an error */
> +err_reenable_memory_path:
> +	ret = dwc3_qcom_interconnect_enable(qcom);

This overwrites the error that led to the execution of this code path.
The function should return original error, not the result of the
_interconnect_enable() call.

I saw Felipe queued the patch for v5.8. I think the main options to fix this
are:

- a v6 of this patch to replace v5 in Felipe's tree (which IIUC will be rebased
  anyway once there is a v5.7-rc)
- send the fix as a separate patch
- Felipe amends the patch in his tree

Felipe, what would work best for you?

Thanks

Matthias
