Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF0D61A8F54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 01:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634450AbgDNXwz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 19:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634449AbgDNXwn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 19:52:43 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F816C061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 16:52:43 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g32so663077pgb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 16:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nsE/zPXLukbuT4tup7W97Wf9aeYqGS/dqAMllkUu/1M=;
        b=uXq1gtTUfkD0AFtaHQlj7XCYPYGPnOr2CgQvVRpjgEsqAySk6Bpqim74UBRthkvnGy
         kgHbDE6DCPM9mVLAH2viG7iS46J2yUYEd4mwoDiSnqR+rvcL741YKWoGcLJLLT75XA8Q
         f23PdawgWpb/bviXrYM8lWscOc55S8nCby/sRYKQnQv4Ylfkvl+kNacj06euID9IURhk
         U9JCyfik93Rz1UWqRbp538F2CpzNrMu/Wn0YJVsPIg9lXhd0crtf2ScJkcH9DdWEEcQc
         19c4yEXh0HQnkXlX6rny7Qv2+OUf8RJBb1tr7IhezNL/Lu0lNa9x2SrbUtl7ZkuF5g5z
         1KIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nsE/zPXLukbuT4tup7W97Wf9aeYqGS/dqAMllkUu/1M=;
        b=q2hSFMEttvI+rg23cjmfqjl+AAPeERoeAg9ZF0Sm0R6os+YOeX85KbpZ99UuTzZ1JD
         zYe/e5hG77g1jUhhEvd8QCmmqrG+XDVl4fv01r0bPLHJB0rrBK8flz/Uj0so/qPhkycS
         iVanrBX7lySfeMbibos7irQzQ1+oUPu6/6SCK71jPEKYHCuVolbR0abXHmUFlMBivABr
         QeAXTjl5LrGMQG4QyGyPCblVWDq+SdhityNiy68ALbAT7E4nVTQHrp3Pi6ZAKvs5f7c4
         VPRd9DkILAQXr4bYHtoqzS4mRJVDzcUB6ILdBUrjkDRggFlqmOknvyWkP6SQxTqv5F2T
         0xLw==
X-Gm-Message-State: AGi0PuaL3gzJTaZu9doyYMzUFuZguCgCbgRdWwz1iC9luS+k8yLqrd+S
        JL3hm31Ta3i4kkZ2LM6foPQaTQ==
X-Google-Smtp-Source: APiQypI4FTZH+v2mWi0AaGiBlFnDQl7dE0xr+3sTy7dgwpo0dC93JROHj3vczfWR9tFYefOxybVgjQ==
X-Received: by 2002:a62:5289:: with SMTP id g131mr24254719pfb.210.1586908362831;
        Tue, 14 Apr 2020 16:52:42 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d18sm2476595pfq.177.2020.04.14.16.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 16:52:41 -0700 (PDT)
Date:   Tue, 14 Apr 2020 16:52:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [RESEND][PATCH v2] phy: qcom-qusb2: Re add
 "qcom,sdm845-qusb2-phy" compat string
Message-ID: <20200414235239.GJ892431@yoga>
References: <20200414185744.84581-1-john.stultz@linaro.org>
 <CAD=FV=XT_icz04g4M+iZHZRzjM1jnuHgkPBsaVmzc1wyoUe=7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XT_icz04g4M+iZHZRzjM1jnuHgkPBsaVmzc1wyoUe=7A@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 14 Apr 12:06 PDT 2020, Doug Anderson wrote:

> Hi,
> 
> On Tue, Apr 14, 2020 at 11:57 AM John Stultz <john.stultz@linaro.org> wrote:
> >
> > This patch fixes a regression in 5.7-rc1.
> >
> > In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
> > PHY support"), the change was made to add "qcom,qusb2-v2-phy"
> > as a generic compat string. However the change also removed
> > the "qcom,sdm845-qusb2-phy" compat string, which is documented
> > in the binding and already in use.
> >
> > This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
> > which allows the driver to continue to work with existing dts
> > entries such as found on the db845c.
> >
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Doug Anderson <dianders@chromium.org>
> > Cc: Manu Gautam <mgautam@codeaurora.org>
> > Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> > Cc: Matthias Kaehlcke <mka@chromium.org>
> > Cc: Stephen Boyd <swboyd@chromium.org>
> > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
> > Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> 
> Re-adding reviews from:
> https://lore.kernel.org/r/158631458374.216820.17829557619378130779@swboyd.mtv.corp.google.com
> https://lore.kernel.org/r/CAD=FV=Wh9_4a-cDGPdpMrXUi_HmJvS-a2Ubeyo5WG3sgwVWKKQ@mail.gmail.com
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> ...as of an hour ago Bjorn also picked up:
> 
> https://lore.kernel.org/r/1583747589-17267-8-git-send-email-sanm@codeaurora.org
> 
> ...and it's now in the Qualcomm for-next and ci-next.  It's still a
> bit of a pain that -rc1 will have the regression since many other
> maintainers will base their next branches on that, but not much to be
> done about it now.
> 

The regression is in the driver, so we want this patch landed in v5.7.
The dts change is heading for 5.8.

Regards,
Bjorn
