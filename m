Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3A41B8489
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2020 10:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgDYIJB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Apr 2020 04:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726098AbgDYIJA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Apr 2020 04:09:00 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18788C09B04A
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2020 01:08:59 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o185so5820303pgo.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2020 01:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x/0L4kaYgpW1Hu0stScHjMakMOesQShGMeTNHi19Rgw=;
        b=iJ8LD2LWWz/lVjTnpI0bFX6zm7zN37+Ngfq3dtc72Ol3HI8AT83i7CKTGCbQwyI1Kl
         eWSs4sYbGqCCrZRt/FyJ08p3dgb+clQ/Q0Q23mbwou9LXc8CHjK2yS3ADP9XOuc2TzKx
         CvlNuWOQ2ekiu9dIP3ab7SoPK0fmuFQf4m5xbR5W/bhUXULTTKG3BGmj3s4aZWC51qUy
         x2FOkcX+dwATUW2bSzSVGQJRT60Y8FvZMdA96cv3e9bOZoC5qY6VffbiCwKcAQPHXHKs
         kFGqggygkBp5ChhoHGWvxUA2dfV0f3EG2Lv/hlAsvHn2Amhz/GEouYJ996BbpaZQzY2p
         v5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x/0L4kaYgpW1Hu0stScHjMakMOesQShGMeTNHi19Rgw=;
        b=p93sefli6PcUeXqrAyu8tb0dD7s/3slolF+UiOLlpiwqVKFtvfhEghfDnLLFxpzypy
         zp629dehDvbvmxmFrbpU4bOs60rnb9TpNoFF58SrXUBChgrqnlxnnlv9GVMu+1oAnCNV
         kXjdrEdtdDQ2Gz1lRn1jaT3P05IYQBnNRAMpqpsZIdXx4mnNuSnFJcb3urH9XClR6DK6
         P62wPhrV2t5LhxRSWOUBZJ6lkEK2fBJzWGjNcnUoAOdh4PLPSxytDqc2+vc0Im/9Y+ZZ
         JfA6/Y/GdFX/VYt0gjOQNqJsedykwPwGQhoY9HJmDqngWAcXftHvVGVnXullx5SlNdtY
         jabg==
X-Gm-Message-State: AGi0PuYEr+VLvysBVzWBJhbv3ADYTh6QUGt1mjl+EkEuVAypGHKekTRj
        Dfs0XJwRMoxf1q2UyhcvrAWL
X-Google-Smtp-Source: APiQypKx4YIbSAMgdXn4vdtb9HU9+CtXijGGj8JxZPpCdKzOxmAhEi6e0ewMW0ekC3vvbgYv8WLBsw==
X-Received: by 2002:a63:67c7:: with SMTP id b190mr13429627pgc.289.1587802138359;
        Sat, 25 Apr 2020 01:08:58 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6108:9c45:6c48:a73c:e213:f218])
        by smtp.gmail.com with ESMTPSA id r12sm6506504pgv.59.2020.04.25.01.08.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Apr 2020 01:08:57 -0700 (PDT)
Date:   Sat, 25 Apr 2020 13:38:50 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     davem@davemloft.net, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, clew@codeaurora.org
Subject: Re: [PATCH v2 0/3] MHI bus improvements - Part 2
Message-ID: <20200425080850.GB5257@Mani-XPS-13-9360>
References: <20200402053610.9345-1-manivannan.sadhasivam@linaro.org>
 <20200402055526.GB2636682@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402055526.GB2636682@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On Thu, Apr 02, 2020 at 07:55:26AM +0200, Greg KH wrote:
> On Thu, Apr 02, 2020 at 11:06:07AM +0530, Manivannan Sadhasivam wrote:
> > Hi Greg,
> > 
> > Here are the remaining patches left from the pervious series. The QRTR MHI
> > client driver has gone a bit of refactoring after incorporating comments from
> > Bjorn and Chris while the MHI suspend/resume patch is unmodified.
> 
> It's the middle of the merge window, we can't do anything until after
> -rc1 is out, so please be patient.
> 

Can you please look into this series now?

Thanks,
Mani

> greg k-h
