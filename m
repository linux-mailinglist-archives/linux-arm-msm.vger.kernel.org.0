Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90A59130014
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2020 03:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgADCIx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 21:08:53 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33652 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbgADCIw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 21:08:52 -0500
Received: by mail-pl1-f193.google.com with SMTP id c13so19657264pls.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2020 18:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zXEe3WcWiJE+Ho4BlR/nUq6/fS0/xrpLIcfb3zFC9CE=;
        b=t6a8T5SUz+8xdRkaPVEKxGbCytJ4SR2QQRtmSYQeBFymQdPkGQDPbCc+98EKmKZ/J2
         n3SAdn7YPQgWoUplaKbuQybkR/pk/x6TJ5aJIUhQ83jBMsLjUGeX3wiDVmiardN5Xuf4
         xt1LYQAjnRGYRv4wrkFGPI49Bbs5fZlST+lzAmz5O2CeiZ3f9AP4/e3HPMcd2mxycf9z
         hmBMxGP254FElbLTsBLtpJWyt4OYGdaD7FZ9T4PlrF0MxORki7bKa2s+aXvAsZlswceJ
         HM/KU6wAn0CAp1I65uEH4IuVtF76d0CVhm7/fay+iNHkdO2Hap2xWQrhAh95HaczsoKn
         xW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zXEe3WcWiJE+Ho4BlR/nUq6/fS0/xrpLIcfb3zFC9CE=;
        b=Is3pmpc7skUCxlMtlxFQVj5+8eFxceJYODBAx0JqF9qr/jJg8/N2H7rMP6wmXm9Ise
         onI6Owmu1Gsyvl8he1FPoLVkiLfcBjyBA5JFy1Umk3QPKcGQUhOmOEXmWTQU6/ootfAD
         NBbiMBhptKQzSvK7eDt4gOeFEJX+Ww2V08XyhTRZYO62CBB04xLgPg37tyGbdTz3gSHZ
         5pZAsYrRk3lcn6XbyN4+Xk2bM7QCweH1WNcdPeMW4aKC0NLQn9hzHnKYm1UvTmbG2nR/
         HxLJk7WzIwgKfJCdhfHVoJ8RYLoPPFW7brO6oNxs0S/G3F99+8aZccDEP8k2GWrRhcCZ
         Zfmg==
X-Gm-Message-State: APjAAAVk4YlMAdf4Ter9z8sWjQwf/ukNbTjDVHm711n5VSASQleFIQQB
        HEGreNO1zkjXwu7mjMPdykOt8g==
X-Google-Smtp-Source: APXvYqz409Hxwt/ZbE6ZIVbYQT2+dH39bMO/CornhKy6+4WLrmFYSYqsSa/snmKmI5dVehqlajfi8w==
X-Received: by 2002:a17:902:5a83:: with SMTP id r3mr96772476pli.145.1578103731911;
        Fri, 03 Jan 2020 18:08:51 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y128sm67099181pfg.17.2020.01.03.18.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 18:08:51 -0800 (PST)
Date:   Fri, 3 Jan 2020 18:08:49 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        swboyd@chromium.org, saiprakash.ranjan@codeaurora.org,
        tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/17] Restructure, improve target support for
 qcom_scm driver
Message-ID: <20200104020849.GR3755841@builder>
References: <0101016efb7349c0-3c8f33b3-f7d2-46df-9bbb-c8f4401c5bf2-000000@us-west-2.amazonses.com>
 <20200104015654.GA30866@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200104015654.GA30866@onstation.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 03 Jan 17:56 PST 2020, Brian Masney wrote:

> On Thu, Dec 12, 2019 at 06:51:07PM +0000, Elliot Berman wrote:
> > This series improves support for 32-bit Qualcomm targets on qcom_scm driver and cleans
> > up the driver for 64-bit implementations.
> > 
> > Currently, the qcom_scm driver supports only 64-bit Qualcomm targets and very
> > old 32-bit Qualcomm targets. Newer 32-bit targets use ARM's SMC Calling
> > Convention to communicate with secure world. Older 32-bit targets use a
> > "buffer-based" legacy approach for communicating with secure world (as
> > implemented in qcom_scm-32.c). All arm64 Qualcomm targets use ARM SMCCC.
> > Currently, SMCCC-based communication is enabled only on ARM64 config and
> > buffer-based communication only on ARM config. This patch-series combines SMCCC
> > and legacy conventions and selects the correct convention by querying the secure
> > world [1].
> > 
> > We decided to take the opportunity as well to clean up the driver rather than
> > try to patch together qcom_scm-32 and qcom_scm-64.
> > 
> > Patches 1-3 and 15 improve macro names, reorder macros/functions, and prune unused
> >             macros/functions. No functional changes were introduced.
> > Patches 4-8 clears up the SCM abstraction in qcom_scm-64.
> > Patches 9-14 clears up the SCM abstraction in qcom_scm-32.
> > Patches 16-17 enable dynamically using the different calling conventions.
> 
> I tested this whole series on arm32 (msm8974) and everything looks good
> from my vantage point. Feel free to add my:
> 
> Tested-by: Brian Masney <masneyb@onstation.org> # arm32
> 

Much appreciated Brian!

Thanks,
Bjorn
