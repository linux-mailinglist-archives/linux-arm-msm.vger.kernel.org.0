Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C532598C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 18:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730303AbgIAQbs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 12:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729532AbgIAQba (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 12:31:30 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEBBC061245
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2020 09:31:29 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id r64so832326oib.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 09:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S8P/pGRN3+eF1lFG+QbGHNg7RtpFmtMcIoRvyWFIPx8=;
        b=ILdqXg8HtxwsfiuMxkImnYYE+IfWs8gywZzwY809yURczcri8T3PX9LKoud15Mb+Pm
         QZ6NU/e7CZMihQ4CtdVdshOsDYSo/v+tKNyVi99GPtwXS6c9D1JsmdHhSghcU/meivv3
         avcOXCoJ6MZZsPTpLjkr0sSHhtKtRJVXyJ4HeaKIAr+dcthzvyIBY2CwHuoo+earmSvQ
         R8FP2I0gSejY7GEftzXcJD//6LxbAj8D2KntgymZVM1UEaxC3kGXh7AZ/a4dQRKeOjZl
         u3CuWvw9g2TQxqux9/m10z842GGL6g4pc9TG3SPFO9k1n2LQf0AC+2lVqbSDDhjthn7N
         Il6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S8P/pGRN3+eF1lFG+QbGHNg7RtpFmtMcIoRvyWFIPx8=;
        b=QIByh5VxkZ+fLKx+FkozrEx0BA53aPfJbvdfq6lGROsuVx1tv+Mp724mjJsdku0tcn
         L0SlwjiviQ/mklE0TbyLB1D77gYgNgLh3NhPDGSKhJZzUiSw67bP0VoPj2Klw71y4S6a
         07X5L3/pZ1Z0+IjjhYO0AdtEZAPb9TWHD6D2YM0sMQGSwKXnNYd3A6/+JvDkOqYeyH7i
         O5ITSimpq6vJkAPgNAeFU541ighvJULSYblUhpRUSZ4BZvaWnA04sATkIKzODONgXa8/
         FJINZH4XWFJ9s1/AezOYX9Y5EI/Rd2xl3aXliSouVuBY4HVIRAoOlnL3IGLyudMGEz9q
         /4QQ==
X-Gm-Message-State: AOAM530wSY/N3NlvnU6rDGV/MHd11Az0T/ryQ0GIJmblOh+eqDJiNW7Q
        zx/d8HfYCpnM3si+g1+/dJK84J+UV4msYw==
X-Google-Smtp-Source: ABdhPJxJB3t1uCqybjslyX45+QYVX1nPwHLVX/lB4QEfYvn4uKcE7pyCzD7QE2zKm0pj+pUkVIZUXA==
X-Received: by 2002:aca:758f:: with SMTP id q137mr1702045oic.170.1598977889030;
        Tue, 01 Sep 2020 09:31:29 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id j4sm256848otp.75.2020.09.01.09.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 09:31:28 -0700 (PDT)
Date:   Tue, 1 Sep 2020 11:31:25 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Adrian Schmutzler <mail@adrianschmutzler.de>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: replace status value "ok" by "okay"
Message-ID: <20200901163125.GZ3715@yoga>
References: <20200817223214.62179-1-freifunk@adrianschmutzler.de>
 <20200817223214.62179-2-freifunk@adrianschmutzler.de>
 <20200830173219.GA483@uller>
 <01aa01d68078$f7f57da0$e7e078e0$@adrianschmutzler.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01aa01d68078$f7f57da0$e7e078e0$@adrianschmutzler.de>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 01 Sep 11:00 CDT 2020, Adrian Schmutzler wrote:

> > -----Original Message-----
> > From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> > Sent: Sonntag, 30. August 2020 19:32
> > To: Adrian Schmutzler <freifunk@adrianschmutzler.de>
> > Cc: linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org
> > Subject: Re: [PATCH 2/2] arm64: dts: replace status value "ok" by "okay"
> > 
> > On Mon 17 Aug 22:32 UTC 2020, Adrian Schmutzler wrote:
> > 
> > > While the DT parser recognizes "ok" as a valid value for the "status"
> > > property, it is actually mentioned nowhere. Use the proper value
> > > "okay" instead, as done in the majority of files already.
> > >
> > > Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>
> > 
> > The content of this looks good Adrian.
> > 
> > But you're lacking most maintainers among the recipients of these patches
> > and I would expect if applied in the current form we will have merge issues
> > as the patches travels towards Linus' tree.
> > 
> > So please split it per vendor and ensure that the various maintainers are
> > copied (use ./scripts/get_maintainer.pl)
> 
> Thanks for the instructions, I was used to a different submission behavior.
> 
> I split stuff up (all of ARM64 and most of ARM changes) and submitted
> them separately via the recommended way.
> 

Thank you,
Bjorn
