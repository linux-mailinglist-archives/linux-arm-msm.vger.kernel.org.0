Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D274421B6F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 03:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhJEBLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 21:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhJEBLS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 21:11:18 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D95C061749
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 18:09:28 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id w206so24036215oiw.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 18:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PfzHBiZhKUhn0s0eLjPcHLmx5o0gtPl/KN/s/msn4zM=;
        b=UPGDqOoPD5Eh60p491rq2NQMsh4XnIw1wAOTdP0paZzAaQv8En+zQ2zpU2+6CL4cTm
         Ex1LvjY7TUhB2wJtQxG8ueeaEIWMgl/+KV4Iuqn2dgTupDBZTzvEIko/CKojD7oY60T4
         cbcK7ocjBLyoV2H2tWPyOfzoryyW3Z3wK1N0lKj7c7pc7hilvFJKGiBxn9Kk4sR9pwMb
         WU+1QjXcsofiJUSMlIXvNcnx0bxf+xVB1XaDn1+VfgZNwCagNff21+KeDI5TTbBZZi5O
         VBGPFITZXfuWe3hzR8rLLatoLKOvMg3cfHfkR+Xibf3FOySpRIOJIBqlfo1kCZbjVJaA
         /m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PfzHBiZhKUhn0s0eLjPcHLmx5o0gtPl/KN/s/msn4zM=;
        b=T3Jc1xW/bmF/60zmOJY+l9J/ORgEsbTqIhbRnH6UlXhgDkqv7AHCektDH2OecQaljD
         VRXL1XSIz28b9U4wbBzutdZYtVwqyqb02R79f1TINjvm+2Klk46JpR6pX9sX2TtoszOO
         Ji/z+r9Pa8znSFAD0Gm8X0MUIuPoC7/ehW1DItVWipNABrEr/1vIXBA3qR/LRrGis89s
         +w0vpUySO1mxq6ZE7YF1LCw2Z8r5B/f2JC4pMWXrnYYkT6UF1rOMLcvpX/p7dZXluowJ
         gjZAjSnBkiYN6IkevhpCMzEnpQQjdOslgp/yyxH8LvF4n6RWrYrLF79ucSF5YMHuM2h5
         i9ag==
X-Gm-Message-State: AOAM5334Iyve1ktkb2+1gsm7kfhvOWajRbqeHEl6Z7HGvziW8R1op/yn
        EODzAOf5CzCrDlGWsvtdsLdEXg==
X-Google-Smtp-Source: ABdhPJwKzjmahegi6IWvBf6fZZ5e+Ec70JOrpzbbtjQScKuhAGhYciMj1L2+D+rpPLsMLeb9LMeCHA==
X-Received: by 2002:aca:1706:: with SMTP id j6mr232425oii.57.1633396168224;
        Mon, 04 Oct 2021 18:09:28 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id o26sm3174520oof.32.2021.10.04.18.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 18:09:27 -0700 (PDT)
Date:   Mon, 4 Oct 2021 18:11:11 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Vara Reddy <varar@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
Message-ID: <YVumL1lHLqtb/HKS@ripper>
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
 <YVd3YdfgFVc0Br5T@ripper>
 <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 04 Oct 17:36 PDT 2021, Doug Anderson wrote:

> Hi,
> 
> On Fri, Oct 1, 2021 at 2:00 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Fri 27 Aug 13:52 PDT 2021, Doug Anderson wrote:
> >
> > > Hi,
> > >
> > > On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > +static int dp_parser_find_panel(struct dp_parser *parser)
> > > > +{
> > > > +       struct device_node *np = parser->pdev->dev.of_node;
> > > > +       int rc;
> > > > +
> > > > +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> > >
> > > Why port 2? Shouldn't this just be port 1 always? The yaml says that
> > > port 1 is "Output endpoint of the controller". We should just use port
> > > 1 here, right?
> > >
> >
> > Finally got back to this, changed it to 1 and figured out why I left it
> > at 2.
> >
> > drm_of_find_panel_or_bridge() on a DP controller will find the of_graph
> > reference to the USB-C controller, scan through the registered panels
> > and conclude that the of_node of the USB-C controller isn't a registered
> > panel and return -EPROBE_DEFER.
> 
> I'm confused, but maybe it would help if I could see something
> concrete. Is there a specific board this was happening on?
> 

Right, let's make this more concrete with a snippet from the actual
SC8180x DT.

> Under the DP node in the device tree I expect:
> 
> ports {
>   port@1 {
>     reg = <1>;
>     edp_out: endpoint {
>       remote-endpoint = <&edp_panel_in>;
>     };
>   };
> };
> 

/* We got a panel */
panel {
    ...
    ports {
        port {
            auo_b133han05_in: endpoint {
                remote-endpoint = <&mdss_edp_out>;
            };
        };
    };
};

/* And a 2-port USB-C controller */
type-c-controller {
    ...
    connector@0 {
        ports {
            port@0 {
                reg = <0>;
                ucsi_port_0_dp: endpoint {
                    remote-endpoint = <&dp0_mode>;
                };
            };

            port@1 {
                reg = <1>;
                ucsi_port_0_switch: endpoint {
                    remote-endpoint = <&primary_qmp_phy>;
                };
            };
        };
    };

	connector@1 {
        ports {
            port@0 {
                reg = <0>;
                ucsi_port_1_dp: endpoint {
                    remote-endpoint = <&dp1_mode>;
                };
            };

            port@1 {
                reg = <1>;
                ucsi_port_1_switch: endpoint {
                    remote-endpoint = <&second_qmp_phy>;
                };
            };
        };
	};
};

/* And then our 2 DP and single eDP controllers */
&mdss_dp0 {
    ports {
        port@1 {
            reg = <1>;
            dp0_mode: endpoint {
                remote-endpoint = <&ucsi_port_0_dp>;
            };
        };
    };
};

&mdss_dp1 {
    ports {
        port@1 {
            reg = <1>;
            dp1_mode: endpoint {
                remote-endpoint = <&ucsi_port_1_dp>;
            };
        };
    };
};

&mdss_edp {
    ports {
        port@1 {
            reg = <1>;
            mdss_edp_out: endpoint {
                remote-endpoint = <&auo_b133han05_in>;
            };
        };
    };
};

> If you have "port@1" pointing to a USB-C controller but this instance
> of the DP controller is actually hooked up straight to a panel then
> you should simply delete the "port@1" that points to the typeC and
> replace it with one that points to a panel, right?
> 

As you can see, port 1 on &mdss_dp0 and &mdss_dp1 points to the two UCSI
connectors and the eDP points to the panel, exactly like we agreed.

So now I call:
    drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);

which for the two DP nodes will pass respective UCSI connector to
drm_find_panel() and get EPROBE_DEFER back - because they are not on
panel_list.

There's nothing indicating in the of_graph that the USB connectors
aren't panels (or bridges), so I don't see a way to distinguish the two
types remotes.

Hope that clarifies my conundrum.

Regards,
Bjorn
