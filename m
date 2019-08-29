Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86D41A1EBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 17:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbfH2PTS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 11:19:18 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33110 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfH2PTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 11:19:17 -0400
Received: by mail-wm1-f65.google.com with SMTP id r17so4399125wme.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VjZT57U4eqLLUOf/A7kG5jLpXDrO5TRWQ0yRpD8+fs8=;
        b=Eqh8mS8v9XFVZ4L8xgv9ExhhsT0fgxAjX1hIEZxB8Rg7zNCs97lpY237Q+w73u7zLZ
         dXE/Rwe6XWeUcyzNF5a+A+kNvg/eAwA6XbGGE8wz9+OrfL5caU8gLPhydUXFrOGfsgH/
         3E7mX5pwq8TGpL8OKdgQHnZDXvfzDH8CnL12HXRQYlMRAnkUQxu7ttR2zq2AC9seDhIS
         S1i7XZrkJL7QSnCU8J8BQ9Ms9l2TuTAzKm4Z0bwVHjg/iZZgjUuueYwVSbxneRQQjC75
         xZhi4WdAUKxKG72Lz2/0qBNxiWWUKrpJF+2QoLAR+Vm4aZ3HQVZ8vuypd55dYE6Lv7N/
         gGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VjZT57U4eqLLUOf/A7kG5jLpXDrO5TRWQ0yRpD8+fs8=;
        b=f1nEeR9wlQvLsbp9j9SvaRUaPfG4J9rFoL9fj0LGDbX750bEybiEaX8zYpKFEv3AZY
         R3Ey4+CRwCwrM5mCIyOsGmtE/6p5sOPKwQ+cCE2diZUT7vLNytKqTDHiiEkWthKOBuNg
         5gx0z56zEDQVmD42ISWVPKqPGVVkLWO7fYSe5xMoY9gDBwF+HRphxVAEH8IsPhlqbafE
         F3ukXgDFWQNh96X41QfFImT3m04xz6P+xFSc0n7tp9j/UeKEObYlBlMRvf3HkumCrq2g
         tjGkfu3M9Tgdk4BYXxbKyG83KGHZj07v3jEZELgsH6QiZGqW0eJzxY/G2gjSz0WpnEUK
         xOtA==
X-Gm-Message-State: APjAAAUurW7SDcq8OlHkTFFnlmBN/L3DoQz4MX+fclIPx1yFOslrFQaR
        Nx0CBZH4L66jtpGwaROJxCi/eA==
X-Google-Smtp-Source: APXvYqwjLRGIPfD6SOWXoHRWgA6GNXhEP7OSzuJKtFyCsIFoaLCx5RijlvfOELg6ciGpMbCkcjUjYA==
X-Received: by 2002:a1c:2582:: with SMTP id l124mr13029673wml.153.1567091955236;
        Thu, 29 Aug 2019 08:19:15 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id b15sm4253465wmb.28.2019.08.29.08.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 08:19:14 -0700 (PDT)
Date:   Thu, 29 Aug 2019 16:19:12 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Linux PM list <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v2 03/15] drivers: thermal: tsens: Add __func__
 identifier to debug statements
Message-ID: <20190829151912.z6cflsaox2qnmqxw@holly.lan>
References: <cover.1566907161.git.amit.kucheria@linaro.org>
 <93fa782bde9c66845993ff883532b3f1f02d99e4.1566907161.git.amit.kucheria@linaro.org>
 <20190829140459.szauzhennltrwvg4@holly.lan>
 <CAHLCerNuycWTLmCvdffM0=GdG7UZ7zNoj0Jb0CeLTULzVmfSJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHLCerNuycWTLmCvdffM0=GdG7UZ7zNoj0Jb0CeLTULzVmfSJw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 29, 2019 at 07:58:45PM +0530, Amit Kucheria wrote:
> On Thu, Aug 29, 2019 at 7:35 PM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Tue, Aug 27, 2019 at 05:43:59PM +0530, Amit Kucheria wrote:
> > > Printing the function name when enabling debugging makes logs easier to
> > > read.
> > >
> > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >
> > This should need to be manually added at each call site; it is already
> > built into the logging system (the f flag for dynamic debug)?
> 
> I assume you meant "shouldn't".

Quite so. Sorry about that.


> I haven't yet integrated dynamic debug into my daily workflow.
> 
> Last time I looked at it, it was a bit bothersome to use because I
> needed to lookup exact line numbers to trigger useful information. And
> those line numbers constantly keep changing as I work on the driver,
> so it was a bit painful to script. Not to mention the syntax to frob
> the correct files in debugfs to enable this functionality.
> 
> As opposed to this, adding the following to the makefile is so easy. :-)
> 
> CFLAGS_tsens-common.o          := -DDEBUG
> 
> Perhaps I am using it all wrong? How would I go about using dynamic
> debug instead of this patch?

Throwing dyndbg="file <fname>.c +pf" onto the kernel command line is a
good start (+p enables debug level prints, +f causes messages to include
the function name).

When the C files map to module names (whether the modules are actually
built-in or not) then <module>.dyndbg=+pf is a bit cleaner and allows
you to debug the whole of a driver without how it is decomposed into
files.

There are (many) other controls to play with[1] but the above should be
sufficient to simulate -DDEBUG .


Daniel.

[1]
https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html
