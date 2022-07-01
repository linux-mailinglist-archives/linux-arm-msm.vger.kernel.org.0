Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4D8562800
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 03:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbiGABKz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 21:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiGABKy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 21:10:54 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED695A2C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 18:10:53 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id dw10-20020a17090b094a00b001ed00a16eb4so1169192pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 18:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=riTJwa3bSi1lLAzR0nqCjL0PHBsnxUZ/utBEO403z1w=;
        b=ltNB9b6L0WGcQxcX0/zTfMYJWLZ5Ohm0RVW23tFGV26KJCU4e9EuEgAabskt1fun7R
         sDaVg3iYXC2n+vMsd+iFqp/kURHYFb4mqL6qBPMauoi5W+lzr8NKcvB7IbRIWMuNGmEe
         Km++r1KUdVbrGUMBhkWoymNyhyKB+dYqkklYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=riTJwa3bSi1lLAzR0nqCjL0PHBsnxUZ/utBEO403z1w=;
        b=D6Qc6Ql7n2GJhcKmrGaEM11dhsFVqo5QjckdOdgCzDQYkoQ64vgmlaySt1f0SVrFY7
         9akod7Xdb98p3oSoXEoNpu+g9VCA2pmohoMlKSEfVOyN/wloZRL9aqg6X+r9rvWJv8yW
         uNfqBn5APk+UOA8pkV8KR2++0eXdQneyQNmGQfyM4RnPx9KaPuTBQaoLxmhfwzZD4/p5
         1Wq6vX6dGZubW1txJ6hgcKkoNpAXzKMs4I55a7ocjsDo65nM1a3KFd1PLSaKyL0GIgh0
         hv3DOeuT4mLh+b2SY4hx6KdLuEQVTHHDIf8ENX96teJROBiN3eSN02Suhyl8PBT69gZ1
         jSLw==
X-Gm-Message-State: AJIora8RLJDGE0aWVOfvFvFvZBnao584elOwbydyTlq9u0SCoLoUZxvg
        meTDZXyYDziCSeZ7haNMMhGtZA==
X-Google-Smtp-Source: AGRyM1vDSzuWMSHmKGJrOwsdSFxwevV5a9CXWieue+Xhh8FwWZKfTik7az0sP8Slnk1ABp9iIsgQhA==
X-Received: by 2002:a17:90a:7c05:b0:1ee:e40c:589b with SMTP id v5-20020a17090a7c0500b001eee40c589bmr13559159pjf.78.1656637852674;
        Thu, 30 Jun 2022 18:10:52 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:dca8:e419:789:7bec])
        by smtp.gmail.com with UTF8SMTPSA id pc3-20020a17090b3b8300b001ef3f85d1aasm2179295pjb.9.2022.06.30.18.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 18:10:52 -0700 (PDT)
Date:   Thu, 30 Jun 2022 18:10:50 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_vpulyala@quicinc.com
Subject: Re: [PATCH v20 2/5] usb: dwc3: core: Host wake up support from
 system suspend
Message-ID: <Yr5JmrSaus8xKpM9@google.com>
References: <Yp5nf2w8uVZ38/XZ@google.com>
 <Yqd9IHQEj3Ex+FcF@google.com>
 <YqjLHyUVEjf7I3MI@google.com>
 <20220616091110.GA24114@hu-pkondeti-hyd.qualcomm.com>
 <YqtlRQOwb3t6Xtd0@google.com>
 <20220620085415.GA13744@hu-pkondeti-hyd.qualcomm.com>
 <CAE-0n52bq9feA6BVdAp791SWQtT1Yj4M2ppg3o_KOaRFO8r+0Q@mail.gmail.com>
 <20220628053148.GA21797@hu-pkondeti-hyd.qualcomm.com>
 <CAE-0n50PGw_XSZ0-iV7gem6+-LENoq6ZVOwX3f+0XjkrHg-rLw@mail.gmail.com>
 <c16a1c37-9183-8d0c-a5ad-39b897a0ab24@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c16a1c37-9183-8d0c-a5ad-39b897a0ab24@quicinc.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 30, 2022 at 11:43:01PM +0530, Krishna Kurapati PSSNV wrote:
> 
> On 6/30/2022 3:45 AM, Stephen Boyd wrote:
> > Quoting Pavan Kondeti (2022-06-27 22:31:48)
> > > On Mon, Jun 27, 2022 at 01:02:49PM -0700, Stephen Boyd wrote:
> > > > Quoting Pavan Kondeti (2022-06-20 01:54:15)
> > > > > Would like to hear other people thoughts on this.
> > > > > 
> > > > I'm not following very closely but it sounds like a problem that may be
> > > > solved by using the component driver code (see
> > > > include/linux/component.h). That would let you move anything that needs
> > > > to be done once the child devices probe to the aggregate driver 'bind'
> > > > function (see struct component_master_ops::bind).
> > > Thanks Stephen for letting us know about the component device framework.
> > > 
> > > IIUC,
> > > 
> > > - dwc3-qcom (parent of the dwc3 core) registers as a component master by
> > > calling component_master_add_with_match() before calling
> > > of_platform_populate(). The match callback could be as simple as comparing
> > > the device against our child device.
> > > 
> > > - The dwc3 core (child) at the end of its probe can add as a component by calling
> > > component_add().
> > > 
> > > - The above triggers the component_master_ops::bind callback implemented in
> > >    dwc3-qcom driver which signals that we are good to go.
> > > 
> > > - The dwc-qcom can call component_bind_all() to finish the formality i.e
> > >    telling the dwc3 core that we are good to go.
> > > 
> > > Is my understanding correct? This is what we are looking for i.e a way for
> > > the child device(s) to signal the parent when the former is bounded.
> > Sounds about right to me.
> > 
> > > Also what happens when the child device probe fails for any reason. i.e
> > > component_add() would never be called so the master driver i.e dwc3-qcom would
> > > wait indefinitely. May be it needs to implement a timeout or runtime suspend
> > > etc should take care of keeping the resoures in suspend state.
> > When the child fails probe, it should return -EPROBE_DEFER if probe
> > needs to be deferred. Then the driver will attempt probe at a later
> > time. If probe fails without defer then it will never work and dwc3-qcom
> > will wait indefinitely. Not much we can do in that situation.
> Hi Stephen,
> 
>   Thanks for the idea. But doesn't adding dwc3 as a component to an agg
> driver meanthat this change needs to be done on all glue drivers, as
> component_bind_all( ) from master componentis supposed to let the dwc3
> core know that we are good to go ?

Ideally all glue drivers would add component support, however I don't think
it is strictly necessary. Currently the dwc3 core already assumes that
everything is in place when it is probed. The core could have empty bind()
and unbind() callbacks, with that things in the core would remain
essentially as they are and the core doesn't depend on the glue driver to
call component_bind_all().

> > dwc3-qcom should wait for dwc3 core to call component_add() and then do
> > whatever needs to be done once the dwc3 core is registered in the
> > dwc3-qcom bind callback. Honestly this may all be a little overkill if
> > there's only two drivers here, dwc3-qcom and dwc3 core. It could
> > probably just be some callback from dwc3 core at the end of probe that
> > calls some function in dwc3-qcom.
> Since the issue we are facing is that the ssphy device links are not ready
> causing the dwc3 probe not being invoked, can we add an API as Pavan
> suggested
> to check if deferred_probe listfor dwc3 device is empty or not andbased on
> that we can choose to defer our qcomprobe ? In this case, we don't need to
> touch the dwc3 core driver and would be making changesonly in qcom glue
> driver.

As mentioned above, it shouldn't be necessary to add component support to
all the glue drivers. An API to check for deferred probing is an option,
however there is a possible race condition: When the dwc3-qcom driver checks
for a deferred probe the core could still be probing, in that situation the
glue would proceed before the core driver is ready. That could be avoided
with the component based approach.
