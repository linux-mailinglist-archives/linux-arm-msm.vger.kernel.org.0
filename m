Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBF7C4A9F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 11:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfJBJ1k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Oct 2019 05:27:40 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39025 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJBJ1k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Oct 2019 05:27:40 -0400
Received: by mail-lj1-f195.google.com with SMTP id y3so16366711ljj.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Oct 2019 02:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6SKGJtRjRwGm3Gfog0PHR1zM7cDCImdjAnhzrGYUec4=;
        b=DCUdwY76HKpHKa3RgaCGbfADwXg4XDsYYaqbrH5c382btFUWzyCXtS8+HgmYhxu0gn
         dHLj+Eo0zgIyN4P+mXUJJYn9KsRxDVEwzqLWB6IO2Zs+NyMoXM/bmbPtjuuxG/xgmpYN
         OsjUiONZuNFiXpttc8HlwJ13qTG3HSsRvMdsKOVtOu5g4pXQzmtkRox3FyH7TLvesWQn
         h1ou+E9vm3yNKaRRjkcTM1il4z5QUgaayUvUS4xK/+njUa7zDCaF4hrfrbJgbaejTbn7
         VtQTRxwD9XXyCcTU8Qy71O2HWoUE+AX6BTEDBZ7yg0Q57vXiOeGa3ZLDsRUXKxRHCJYb
         pqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6SKGJtRjRwGm3Gfog0PHR1zM7cDCImdjAnhzrGYUec4=;
        b=Hy6/zEDpW/y/d99bz1jYgdnrcVtlOuNskZZTxYC90eHlptfFpJeiwnkKUEFeXUtdIm
         YEHiVC8sobHJ04CNON08YVZ4WPp23VpNvD75J6u6Qzzyx4HS2EhWoWOdmy0cpm7j5Myj
         EyJoR+/7/qD+KcAHdmFmrMwFfTbM17AGM+XFalqW4aqDmKCGRqG2eoZ/gi60V/5GnoL+
         R+OIaNWMnbeJMjrW62g/P+5hKpzDj2rod/silUo/iOM5h8/sSo/KD3kIqQwEbGVFxwMe
         fWpYR4rnG8eswq/r/GlH05vxsfJatUIzvpYzfFCdAHxTf2xlQaAEU7G8VW4JcJR8tpe6
         XyJA==
X-Gm-Message-State: APjAAAWheObIP3VDv92s49dxYa+qHKhKKxyrQQRIYxRv2nt3rxaDEUt4
        UU13tAJ2K35Kt5W4aH5JWh1Tew==
X-Google-Smtp-Source: APXvYqzlP5sk7vLuux/qAMdsdIfm+H8xV21u3k2FgL6nwDndAe7xpYuRU4xQyXuHfzD+735xMWvK8w==
X-Received: by 2002:a05:651c:150:: with SMTP id c16mr1732245ljd.224.1570008458471;
        Wed, 02 Oct 2019 02:27:38 -0700 (PDT)
Received: from centauri (ua-84-219-138-247.bbcust.telenor.se. [84.219.138.247])
        by smtp.gmail.com with ESMTPSA id r19sm4632654ljd.95.2019.10.02.02.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 02:27:36 -0700 (PDT)
Date:   Wed, 2 Oct 2019 11:27:34 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Amit Kucheria <amit.kucheria@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Sibi Sankar <sibis@codeaurora.org>, daniel.lezcano@linaro.org,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        DTML <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
Message-ID: <20191002092734.GA15523@centauri>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
 <CAOCk7NptTHPOdyEkCAofjTPuDQ5dsnPMQgfC0R8=7cp05xKQiA@mail.gmail.com>
 <20191002091950.GA9393@centauri>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002091950.GA9393@centauri>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 02, 2019 at 11:19:50AM +0200, Niklas Cassel wrote:
> On Mon, Sep 30, 2019 at 04:20:15PM -0600, Jeffrey Hugo wrote:
> > Amit, the merged version of the below change causes a boot failure
> > (nasty hang, sometimes with RCU stalls) on the msm8998 laptops.  Oddly
> > enough, it seems to be resolved if I remove the cpu-idle-states
> > property from one of the cpu nodes.
> > 
> > I see no issues with the msm8998 MTP.
> 
> Hello Jeffrey, Amit,
> 
> If the PSCI idle states work properly on the msm8998 devboard (MTP),
> but causes crashes on msm8998 laptops, the only logical change is
> that the PSCI firmware is different between the two devices.

Since the msm8998 laptops boot using ACPI, perhaps these laptops
doesn't support PSCI/have any PSCI firmware at all.


Kind regards,
Niklas
