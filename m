Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C42EA1512D9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 00:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbgBCXSC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 18:18:02 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42189 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbgBCXSB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 18:18:01 -0500
Received: by mail-pl1-f193.google.com with SMTP id e8so3834202plt.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 15:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RqNKomRHGUMd4Df0efkiIUfGHrYX0nBtYzK6IBMjZdo=;
        b=e0WOg1iPXlJr/czyGRfDodZEJ4Svzd9PEGVfDy2NWGnz2ImNYsb1U24hkGoS3vS4Wi
         /ybmFAUocTyETD+5Tc8D/YiFCzxPufobrMNghviISjhpuhTCar66ltyzh9OHjrrlZmDh
         fkGGleJrOJlAVHtG7ncDd5ZSav79f6SoOxNRTtPvlPawTupm8RY6TqvgI7NzQrpOvBHe
         ymFtWIyAbgLKMDdTW/QShBruQkzAswxUpxPH9TES+B7fKDCSKIlAyqAlKRIYT/L1YiMZ
         fWqQRqzJWAUBhKlHYJRaYKnKYeA9HgEFarcDRly+r8/xyqtwaK6cEDqc77ob8XMNT9mD
         x+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RqNKomRHGUMd4Df0efkiIUfGHrYX0nBtYzK6IBMjZdo=;
        b=aNoPl4w2El1+fji+DZKS7gQqOPQGtAbok14cVdM57/NPAJ6hOTdi+E/HwPkusoJjev
         TCF3sOK6xfMXegCLlDEJaItuMRetd+qN7l1TcOYRF4CCHCS56v+xOG05cnGonkKa+6FZ
         5wl2a4teZ96sxQUFcrHOA3XWfU0pHQ2vt+jnSX5fOgTCKc/v0uLsYekoUOOdORvgWH4a
         ByURSW16yMye7FtmzcaEpq7kSzYAnDLwe9qcwAUY0ViW0tNVxDR96obUzhj424Qo6NCA
         sju7UbvuCv+hMl79JMCWByABjj/lg45OJzev6J+AHGlLPZBI9vzybjGBN5vbnbXcoBIC
         wtuw==
X-Gm-Message-State: APjAAAXsMhd3UrsMnwHCHqlJgI51re+bjLxn8l+Y7VpY9N8bDoFjTVbY
        TYoEo/Xu0ZcUsCCVhszR1s/A9g==
X-Google-Smtp-Source: APXvYqwK5DVqb9y9JJvL9zF2H008zA4E5okWxzY8QvFo4wwP7jZRsCC5h+petZ2QkXz3kvh6SCx+Uw==
X-Received: by 2002:a17:90a:9f04:: with SMTP id n4mr1926471pjp.76.1580771880976;
        Mon, 03 Feb 2020 15:18:00 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r145sm22021763pfr.5.2020.02.03.15.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 15:18:00 -0800 (PST)
Date:   Mon, 3 Feb 2020 15:17:57 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 00/15] clk: qcom: Fix parenting for
 dispcc/gpucc/videocc
Message-ID: <20200203231757.GM2514@yoga>
References: <20200203183149.73842-1-dianders@chromium.org>
 <20200203193027.62BD22080D@mail.kernel.org>
 <CAD=FV=X2K-Qr17qXgG1Ng8MpZQogagBqMwWu=D2OpQf+ZskBPw@mail.gmail.com>
 <20200203200443.GN3948@builder>
 <CAD=FV=VQyTHYizfzMwjAaRbmQ4zvFFzdfgGiVkLQU+b+pFVnzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=VQyTHYizfzMwjAaRbmQ4zvFFzdfgGiVkLQU+b+pFVnzg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 03 Feb 12:48 PST 2020, Doug Anderson wrote:
[..]
> Sorry it's so confusing.  Happy to try to clarify more if the above is
> still too hard to follow.
> 

Thanks for the clarification! I will pick up the dts patches

Regards,
Bjorn
