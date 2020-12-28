Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919562E6BB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 00:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730613AbgL1Wzv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Dec 2020 17:55:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729392AbgL1UPs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Dec 2020 15:15:48 -0500
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4FBC061793
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Dec 2020 12:15:08 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id n127so2428043ooa.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Dec 2020 12:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+Pw+uPkIbgZ4KYlHIO/V2Ri/aws8FKtBDmcMgQKN8d0=;
        b=wWYfQLxbZJSt09U4q6vd/rUqQCGtpraawCrncR9PVF/f5UUh61UwzrpJPtjKYd8zVv
         K7Px0rqh5sA+GyEWCv8gmsmAM69lx7LdSHsOqVOdHvFSZnPwDmmexWQ7chDmUwsM3KjS
         tY24yyCO6ItbFlZYVmHpdE6nKH30I1tWVasQbswmGgUOGK8xz9bO+v9Rpr7I7hy8VIfm
         N5k/qPFaaXysJygeaurZUfiTSWK9Omz49wEnc4O8gNePIEsNpw9bDXeLN9VHgy8YnC5A
         vnlXWrPKASHSQkrB/DYc8fU+O6zLaO3zQ21SATlAxBBWxdfJydCouFboDm85USITaRoj
         Aadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+Pw+uPkIbgZ4KYlHIO/V2Ri/aws8FKtBDmcMgQKN8d0=;
        b=rDmqh76yxIK5pbjdOkVFaZnh4pIiQ2smr3oHBg2sljiRlc3H0MaT+wGyOC1A8BZcKe
         6JKpSctVVtYkF8X+cwcSdLOnFxueH1ejJPFecWYb9QUHFg9pwiEfnhMLi2V17IsNreWR
         NS3RVeGk1I18uYz2+MiZPkESTmSn5O5LWjwKvR7DEerEt2QgoseEyPDuIDH+dCwdHcCd
         cKYCZLjyCG8ia6ugMUEmmnjd1VPJXQr/xFcJ5FrQtr64Z6oSW/dhN68zrHVf0PWxNs5y
         oqbr3ztH88Ql74JqjXQba0XGIaXdzAb6+EVfk6ewBtPA7BTdGhFVZO90Rj9A5HRI7wNX
         ak6w==
X-Gm-Message-State: AOAM53359N8owXrxE6nfdfh0MaTAB1dblIK9xIIy/GgacEKpbKveAmeG
        6SG5wtToq0p1U2DE1Y5s4k1Npg==
X-Google-Smtp-Source: ABdhPJwCcBXJQ3zbj243Hm8fJQFs+hPgvzFB85wYqoAlvDuJu3wpf2tYIBTTZXhcDmVZLJxea0AC+g==
X-Received: by 2002:a05:6820:34b:: with SMTP id m11mr21704567ooe.74.1609186507730;
        Mon, 28 Dec 2020 12:15:07 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o17sm9449894otp.30.2020.12.28.12.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:15:07 -0800 (PST)
Date:   Mon, 28 Dec 2020 14:15:05 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Imran Khan <kimran@codeaurora.org>
Subject: Re: [PATCH v1] soc: qcom: smem: use %*ph to print small buffer
Message-ID: <X+o8yXeEkrOf923C@builder.lan>
References: <20200730153220.39466-1-andriy.shevchenko@linux.intel.com>
 <20201027183022.GJ4077@smile.fi.intel.com>
 <20201228200453.GE4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201228200453.GE4077@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 28 Dec 14:04 CST 2020, Andy Shevchenko wrote:

> On Tue, Oct 27, 2020 at 08:30:22PM +0200, Andy Shevchenko wrote:
> > On Thu, Jul 30, 2020 at 06:32:20PM +0300, Andy Shevchenko wrote:
> > > Use %*ph format to print small buffer as hex string.
> > 
> > Any comments?
> 
> Anybody alive here?
> 

I have no idea why I've been missing this...twice, sorry about that and
thanks for the ping! I've picked it up for v5.12 now.

Regards,
Bjorn

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
