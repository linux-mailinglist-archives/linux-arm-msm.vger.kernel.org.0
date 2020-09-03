Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543DA25CDBF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 00:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbgICWlN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 18:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727804AbgICWlM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 18:41:12 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22ACCC061244
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 15:41:12 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id np15so4315941pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 15:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=iW/A8r0331OSEPLfa1loRoE5ZEDOUilW+I8kjEKtgG0=;
        b=a4rSyS/F6YzQ9EUsbIULgRw3QPDxjY4gOShq0/DdOzbmD7EIzh6iPHqGKHFaS/s5W8
         ZmVpbXB6SAtyUOWbY30qyKVXHIlsyjmT8Yh3QKMjhmiT0O+AfaV7AIz+zDzfNZ/ZfRqa
         4/nsDjVtpnc3V/a0B1CY/uWgUaEkhvnff3mdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=iW/A8r0331OSEPLfa1loRoE5ZEDOUilW+I8kjEKtgG0=;
        b=SyM619JOb5YP7ZQKVput0SoAS0kGId8zP0FR0suulWLxCwGXqJlEliIw6zOuMbN/ET
         CGbLJ/x17u0DYOqe/k2b5RivVcFVCn5GLJ+OO28BGUuqm5kHI2h76surAkrfPXL5I9BC
         iTtexiojTSNewdSFWntgUWLB0TEaMF+/OikhYmKriDPxcnrwAPFvUcPQz/uChohUHvWr
         7PoPLNwCC9QWCXvgzekySPBDqa1J3TW6Qtzz+X5xuwibrpdcK9+2hOfrWW9El4wP/uiV
         Vr60Fo6WLDJ+YTlzTvHjlnBYFNg2qf8Kd5b/8rtEoLbqgedl8ik1YoveKaudkeYLF3OD
         xtmA==
X-Gm-Message-State: AOAM531ag7JTdocfuBHaVtwLj5q/L2bjm5SnByqD3GtW1IIFfx8s1Z38
        mimyWYN4FoTAC4hsN09LhOeGqw==
X-Google-Smtp-Source: ABdhPJyr5+92LrdiO2GGYscSqgQUlNzjXw1ihZoKm1YjISqXlLNmNARfAvi4mscEk6NwDEx88hhRFA==
X-Received: by 2002:a17:90b:611:: with SMTP id gb17mr5201366pjb.71.1599172871612;
        Thu, 03 Sep 2020 15:41:11 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id d1sm3334390pjs.17.2020.09.03.15.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 15:41:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b6f80242-482d-b778-690b-8aefa4e8f23e@marek.ca>
References: <20200902230215.3452712-1-swboyd@chromium.org> <20200902230215.3452712-8-swboyd@chromium.org> <b6f80242-482d-b778-690b-8aefa4e8f23e@marek.ca>
Subject: Re: [PATCH v2 07/10] phy: qcom-qmp: Add support for DP in USB3+DP combo phy
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
To:     Jonathan Marek <jonathan@marek.ca>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Date:   Thu, 03 Sep 2020 15:41:09 -0700
Message-ID: <159917286975.334488.16684252260287652678@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-03 13:43:10)
> On 9/2/20 7:02 PM, Stephen Boyd wrote:
> >=20
> > This code is based on a submission of this phy and PLL in the drm
> > subsystem.
>=20
> I updated my upstream-based sm8150/sm8250 displayport stack [1] to use=20
> these patches.

Great!

>=20
> This commit [2] might interest you, so that you can consider what needs=20
> to change between v3 and v4 PHYs. Note some of the V4 registers have the =

> same address as V3, so the diff could be smaller.

Looks like v4 will need to introduce a register indirection table for
the differences. Also need to add a table for the aux initial table
values and the calibration values for aux_cfg1. Seems like it won't be
too bad.

Does DP work with those patches with v4? You should make yourself the
author of commit d3c6da6f87eedb20ea1591aaae1ea4e63d7bd777 ;-)

>=20
> Do you have any plan for dealing with the SS PHY and DP PHY conflicting=20
> with each other? For example, PHY_MODE_CTRL needs to be "DP_MODE" for=20
> 4-lane DP, "DP_MODE | USB3_MODE" for 2-lane DP + USB3, and (AFAIK)=20
> "USB3_MODE" for superspeedplus usb (and it seems this gates some clocks, =

> so you can't read/write dp tx2 registers in 2-lane DP mode for example). =


Right. I've seen that behavior as well.

>  From your cover letter it sounds like this isn't relevant to your=20
> hardware, but it looks like both PHYs are writing to the dp_com region=20
> which is still problematic. (in the branch I linked, I disabled the SS=20
> PHY to test the DP PHY)

Right. I mentioned in the cover letter that this needs to hook into the
type-c subsystem somehow. I haven't done any of that work because I
don't have a configuration that is as dynamic. As long as the type-c
stuff can express my static configuration it will be fine. If you have
done any work there I'm happy to review the code and test it out on my
configuration.

The driver is setup for DP_MODE | USB3_MODE (i.e. concurrent mode) so it
is already hardcoded for the 2-lane use case that I have. If I didn't
connect two lanes from the phy to a USB hub I could support all the
different combinations but that isn't the case. On phones it is
basically the only case though because the pins from the usb3+dp phy go
straight to the type-c connector.

qcom_qmp_phy_com_init() is the only place I see the driver writing to it
and it is refcounted so basically the first phy to get initialized will
set things up in the common area. I suppose for supporting various use
cases like 4 lanes DP or 2 lanes DP and USB then that refcounting logic
will need to be changed. I'm not sure what is supposed to happen though.
I guess the USB host controller, i.e. dwc3, will have to know to stop
trying to use the phy and then power down and let the DP controller take
over the phy? It's a dance of three or four drivers.

>=20
> Also some issues I noticed:
> - used QSERDES_COM_RESETSM_CNTRL instead of=20
> QSERDES_V3_COM_RESETSM_CNTRL2, which has different value
> - in sc7180_dpphy_cfg, .regs is NULL, which results in NULL references

Can you add these as inline review comments? Would help me understand
what you're talking about. Thanks for the review!
