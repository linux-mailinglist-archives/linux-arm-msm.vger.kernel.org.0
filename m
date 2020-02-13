Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCDB15CB23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 20:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbgBMT0e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 14:26:34 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:47079 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbgBMT0c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 14:26:32 -0500
Received: by mail-pg1-f195.google.com with SMTP id b35so3490396pgm.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 11:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oH47U6dVilmFVsgLaUcqMonw11ZBismPGb+DPyC9Qjw=;
        b=DXO4fw78ecATFY1qi1857mdha/eTvTl3CNuC5fuI6H2JM+CXb6/ZCOym3sxgVzPdMA
         EI7//m/LWCbvFiQJQh1O7c72nwkOvtg0bGeJvmVF+9uv5ZCyssMjVnR1IWy0fw39/NuK
         1PrexqGGkHRoMJ9kY0B3dQn0EhWWs4ZuxYCXnaNIc3+MkKPHdU+ufVh5X7fCr8BZCSGM
         /we/r2FwhBJFJ64mvlvP4ebliuFrCk2ZRvMZmAwM2b92V4PgMfcFEO5CdXvvH9H/Vbwy
         Y/aFKIYNni0475hVC0EaUbif6N3KO8hbL13rekzoj6DPy7RkOLXuUUVbHYfXUlDdnC1j
         DmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oH47U6dVilmFVsgLaUcqMonw11ZBismPGb+DPyC9Qjw=;
        b=AETmJY4Yk/OUAp2RwFHW0eWvt2zwX/kLBrHih5lBUwPCeJJwX7M3fiE+x0F31gaX5E
         IGppSe+BzUd1CZn57cb8X7RR9w7Nkl/EVeOIhVxRgHfiox7hdr7K06+ca8k24gTZiqOA
         eOKQ6zL2kG9Gvws2bVjHkIWh0+XgmZ2e/B3s2Ft5ff1QIzrUsmEf182MG/8VeyS8R3V7
         Zumt48fRzR5SuRvlJTHjHyEE5gQaQ8gcGq+A6xiM6hHnFAJZYLAIjM/G4k3eLh/Ai7fa
         vAV/WO1c4+A7yoB2jshEpjba92lGbJ7whRAXN7Vo2QQNtYwo5GGWglikH/3e08HiUY5h
         iMPQ==
X-Gm-Message-State: APjAAAUTWzbff4pq8cX6RXhywp30gNHYBqJSgineonB2EoQAjkjj6tJV
        yJrD5cP6FfkhWVEhgL34CDA7GavFJ04=
X-Google-Smtp-Source: APXvYqwOR7c/DNAxOXKiWnEw00nczvKJ/1Zdi0Od8v7HRY7xMcRpoGaa+BxDISCHpCjw8BXko2JvUQ==
X-Received: by 2002:a63:5fcf:: with SMTP id t198mr19442029pgb.383.1581621990306;
        Thu, 13 Feb 2020 11:26:30 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w11sm4015613pgh.5.2020.02.13.11.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 11:26:29 -0800 (PST)
Date:   Thu, 13 Feb 2020 11:26:27 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH V4 0/4] Enable video on sc7180
Message-ID: <20200213192627.GA1455@tuxbook-pro>
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
 <20200203180240.GD3948@builder>
 <20200213185305.GF50449@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213185305.GF50449@google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Feb 10:53 PST 2020, Matthias Kaehlcke wrote:

> Hi Bjorn,
> 
> On Mon, Feb 03, 2020 at 10:02:40AM -0800, Bjorn Andersson wrote:
> > On Tue 14 Jan 04:53 PST 2020, Dikshita Agarwal wrote:
> > 
> > > Hello,
> > > 
> > > Changes since v3:
> > > 
> > >   - addressed DT and DT schema review comments.
> > > 
> > >   - renamed DT schema file.
> > > 
> > > v3 can be found at [1].
> > > These changes depend on patch series [2] - [6].
> > > 
> > > Thanks,
> > > Dikshita
> > > 
> > 
> > Picked up the dts patches for 5.7, with Stan's acks
> 
> I can't seem to find the patches in the QCOM repo, neither in
> 'arm64-for-5.7' nor 'for-next'. Am I looking at the wrong place or
> maybe you forget to push these?
> 

Thanks for the question Matthias, I was looking for this email as I
rebased onto v5.6-rc1 earlier this week, but got distracted.

I pulled them in, but in the rebase I realized that we don't have the
interconnects in place, so in it's current form these patches doesn't
compile.

Seems we're waiting for rather trivial respin of
https://lore.kernel.org/linux-arm-msm/1577782737-32068-1-git-send-email-okukatla@codeaurora.org/
to get this settled.

Regards,
Bjorn
