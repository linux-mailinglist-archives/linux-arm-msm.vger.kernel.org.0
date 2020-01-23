Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A07F14677A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 13:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgAWMDa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 07:03:30 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:53596 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgAWMDa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 07:03:30 -0500
Received: by mail-pj1-f68.google.com with SMTP id n96so1114031pjc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 04:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZiMFGAL4MYwPDWT3nQ+OXP6Uxt21dHwm6mYmXom6vtc=;
        b=YzZBMWftyxZgk91oENZXRNJBB7oUI03xAWUTP9zQUVJ+GlYR6YWqzjtZIGZc79dYGo
         uUfFe9YWcvqqXP2PKXNLFHoulA5t9nV3xLUNJ8YZ69cHSJDJif0DEC7egWKoISXd8/9a
         oaX+CWk7VbQQpk4NYy4QEZSaOPkkqQW2fyDYoZn4R86YjtI3HUkep7H0iIETXsSez8vL
         rI8fUzFx95K8x7/2NIgtarxj8xiLl7GTxw+6v4hHRG+GvEdiDNW19xOVzFIQ+WsE53is
         RmiB617j7AF7tm60joSF70xyfcc+LDG6ljO+lk9hUpHlWNJjBJVJBj6VyHlTlARUrZS4
         uO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZiMFGAL4MYwPDWT3nQ+OXP6Uxt21dHwm6mYmXom6vtc=;
        b=ajQj0EI30Tl3jqpEJzYOsNqZSf/j2XugMlbcU8lHMp3kE/S7zbN7iIHyaFYIC7MCBb
         hRt84h4Mc3rdEuv3Z+zkJkYmBFhnFqJthTuStQaXWHW3rOnyOunjkbguC7UpptYmwSCW
         Bqdy9GUD2QIqLHqG9NqM8n0PlugFMOKps/6bmCiozF2n3GPll7jNFL8ObXxe9KDQTtOJ
         3n9agpm+DK4vFTlAsu9lamgErHKDsteX92EryOF4zJFmM/F8aTf9DihS2yi1+04h7D+s
         iWcRuTrKq2CYI2D8RnHeeVfmQ71cELlaczViK6Kus45ascqf09xgmY0YevbpSYW0SnQk
         ssFQ==
X-Gm-Message-State: APjAAAWKBRqG5RZroy13Z8cb0rHwSQjXgPiR/fbcBtIbEnUkZsLCKzmc
        w6FLbbwgf1qmHYVEjrOAZuF7
X-Google-Smtp-Source: APXvYqyrUb3y7qFM2xtn82CkDZBo8IX75BHTTHG7tYasTeQVdVUUEDLn4tshSoPfvr6qo7FeYAEOxg==
X-Received: by 2002:a17:90a:1ae9:: with SMTP id p96mr4305509pjp.8.1579781009682;
        Thu, 23 Jan 2020 04:03:29 -0800 (PST)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id q11sm2398245pff.111.2020.01.23.04.03.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 04:03:29 -0800 (PST)
Date:   Thu, 23 Jan 2020 17:33:21 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     gregkh <gregkh@linuxfoundation.org>, smohanad@codeaurora.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH 16/16] soc: qcom: Do not depend on ARCH_QCOM for QMI
 helpers
Message-ID: <20200123120321.GC8937@mani>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-17-manivannan.sadhasivam@linaro.org>
 <CAK8P3a3PKukf4K48T89v5R_eUAMuYhoULsF1noK2gzSDpi1qVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3PKukf4K48T89v5R_eUAMuYhoULsF1noK2gzSDpi1qVg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Arnd,

On Thu, Jan 23, 2020 at 12:45:32PM +0100, Arnd Bergmann wrote:
> On Thu, Jan 23, 2020 at 12:19 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > QMI helpers are not always used by Qualcomm platforms. One of the
> > exceptions is the external modems available in near future. As a
> > side effect of removing the dependency, it is also going to loose
> > COMPILE_TEST build coverage.
> >
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/soc/qcom/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > index 79d826553ac8..ca057bc9aae6 100644
> > --- a/drivers/soc/qcom/Kconfig
> > +++ b/drivers/soc/qcom/Kconfig
> > @@ -88,7 +88,6 @@ config QCOM_PM
> >
> >  config QCOM_QMI_HELPERS
> >         tristate
> > -       depends on ARCH_QCOM || COMPILE_TEST
> >         depends on NET
> 
> Should this be moved out of drivers/soc/ then?
> 

Good question. I thought this change will trigger the question anyway ;)
Will need to hear from Bjorn on this. I agree that it should be moved out
of drivers/soc!

Thanks,
Mani
>         Arnd
