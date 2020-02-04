Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF20151639
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 08:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgBDHFY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 02:05:24 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52079 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgBDHFY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 02:05:24 -0500
Received: by mail-pj1-f65.google.com with SMTP id fa20so932514pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 23:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w5PoBe/LIYLPF7o11SYiI2aW+wfvhFdZMsKpXsr8Bdo=;
        b=Fb1glgBRu3fbQOC/zgG7Y4VjMCA8stpvNr50Txb+8JbWcrOWDzprownVQimEhveoj4
         42ZWZ6cu6r+49VQ3SDid3114jZmik+yTWU1e8vJJijU6sZ2tbmjYeUL3ZDbXqk5vg9Aw
         zHzuXk2YCj3DnOQt5uoXaL0T1ZtxFJgPY2dRvjugQvZ5c1G+R0rj3sK2qbUXTUyR9iTY
         Sc3B0ZziWPQGkYicJ/UEcGmwJ+FvPry/rIBmFVFLnAuvovoufWIp2fNetRZDMPjDqxXg
         Oyxio+189suNh0J7r5AKox4QzetQPaExRxFJmiVSHVrLPEYfcB9QTPgym8mXbAZZt65E
         DXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w5PoBe/LIYLPF7o11SYiI2aW+wfvhFdZMsKpXsr8Bdo=;
        b=k0OvS+CAGRJMpaaKsyoj46lFTgfXxaafvW0UU/ccJlGFowHo4p3BCKEMMXHZhcYav3
         hpUacIAsXMhK30xsSzV3ewgVjUNqFdmVBNhSCVw055uSV02o3uzXtiRnExV3VlNVm97L
         Uo7xddNEZdP1tUKyzS3bkE0OSLEfxPbMrurhFtxFcbxba58JbmTeqZOJzE961tJxkXKL
         6LUYwr9SHNaNey3f1yhQD0psZuWNR1HbKZa0EoPsSbB7jU91dSxyYh0TwrGhoVwZorR/
         rSpM+d7CBoX0kffGcl0+3QPCrbWQs6OAkhcGKkTOtMPb2PJ0c/DphXYZ6tcJ8kJr417U
         ackA==
X-Gm-Message-State: APjAAAUgiGBvimIUuloSN6aVdSVa2W0hNSo58K0T3HmWS8Sv9woVyFOn
        RbZOypoe62ZYwqWsT64L/wsr
X-Google-Smtp-Source: APXvYqyEsp5NPX+idnfyOkW2uYsdtJuprUa0EiaAoIlzWdgQ3xu7qx9G7UUKaD87ZSkSp+++e8WU1A==
X-Received: by 2002:a17:90a:d995:: with SMTP id d21mr4502095pjv.118.1580799923596;
        Mon, 03 Feb 2020 23:05:23 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:184:5239:5cf8:8075:e072:4b02])
        by smtp.gmail.com with ESMTPSA id k4sm22952117pfg.40.2020.02.03.23.05.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 23:05:22 -0800 (PST)
Date:   Tue, 4 Feb 2020 12:35:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, smohanad@codeaurora.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 13/16] MAINTAINERS: Add entry for MHI bus
Message-ID: <20200204070515.GA7452@Mani-XPS-13-9360>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
 <20200131135009.31477-14-manivannan.sadhasivam@linaro.org>
 <CAHp75Vc2Nf9N0cPBmrqb_xZQG-=eczd=gdZxsfXv6OtZ=ysP6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vc2Nf9N0cPBmrqb_xZQG-=eczd=gdZxsfXv6OtZ=ysP6w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Andy,

On Mon, Feb 03, 2020 at 12:16:16PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 31, 2020 at 3:53 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > Add MAINTAINERS entry for MHI bus.
> 
> > +MHI BUS
> > +M:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +M:     Hemant Kumar <hemantk@codeaurora.org>
> > +L:     linux-arm-msm@vger.kernel.org
> > +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
> > +S:     Maintained
> > +F:     drivers/bus/mhi/
> > +F:     include/linux/mhi.h
> > +F:     Documentation/mhi/
> 
> Had you run parse-maintainers.pl afterwards to see if everything is okay?
> 

Hmm. I didn't run it before but now looks like the entries need to be sorted
as below:

M:      Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
M:      Hemant Kumar <hemantk@codeaurora.org>
L:      linux-arm-msm@vger.kernel.org
S:      Maintained
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
F:      Documentation/mhi/
F:      drivers/bus/mhi/
F:      include/linux/mhi.h

Will address this in next revision.

Thanks,
Mani

> -- 
> With Best Regards,
> Andy Shevchenko
