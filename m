Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE87F5A2865
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 15:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344309AbiHZNTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 09:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344293AbiHZNTk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 09:19:40 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05B3D290E
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 06:19:39 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id ds12-20020a17090b08cc00b001fae6343d9fso7788508pjb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 06:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=UuUeKU+F2TuPuXjU63OwY5aV49Rkwt6KCQRg7YK+zgU=;
        b=oVtUXFwve8NV5pya7rcH3nmZprxX1bpaWZHlzH8Xbyr7KJeIQ+l/TsJxQnN9W8HOA9
         wZJ6cYC5f70BbsFzO9fUEj+EWkpCGOtV45SxRkTxmwdUfneY2yB+Y9qzkEsRDM5MX14e
         R7GX8XvSTh/VuTB8QvCjm4CnuOpXA+Kt0wpiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=UuUeKU+F2TuPuXjU63OwY5aV49Rkwt6KCQRg7YK+zgU=;
        b=laL+7INbPDgPOjouKdiUwPWB9AHm4wWgTCT1dSv+hZruE9ORYiXqO4eZT7eD0/ek8D
         xs8mg74Z4MZGy8bK3NCYbNJrnYya6xU38Fy3SJcX5vG/uVzvR0Zblx5gBCsHy3YWK+nV
         /iDGTW8BVd2F5z/sGxd0noqOjVwDq1Qx2RNc0wuC/asXBfNtJHDR653wB7EyRteBY/4D
         +WPKIVP9MGfUqEhnOWuyswAQdzeEWwmP3M4V5A2TnQwsqiJ+cwFyv/mpuFihOfKAtTil
         RIf/ppx2FfjQAs0KvS6mtcfkcVy018prm3f85cIONeuc7+fj1SMZCQwBSQmG3aJUQ77G
         lPwg==
X-Gm-Message-State: ACgBeo0vCmTJKgkesQucqhuvQRouJ5X+ZpErUVSESkLrOxv0EVAFzrIs
        EGYuUeoLfDXLyhMljZESqFfn9w==
X-Google-Smtp-Source: AA6agR62r2nAPFf5KcLaPR5WyNY4aXXJOqI0lj3p3mDTS7FiXoKbGUayN3R1blolaKn6fuk4b+xQlw==
X-Received: by 2002:a17:902:d4ca:b0:16f:8311:54b0 with SMTP id o10-20020a170902d4ca00b0016f831154b0mr3795952plg.108.1661519979503;
        Fri, 26 Aug 2022 06:19:39 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:2a3c:773f:ac25:a127])
        by smtp.gmail.com with UTF8SMTPSA id i64-20020a62c143000000b00537713b93edsm1709277pfg.110.2022.08.26.06.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 06:19:39 -0700 (PDT)
Date:   Fri, 26 Aug 2022 06:19:37 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sc7280: Keep USB GDSC power domains
 on when USB wakeup is enabled
Message-ID: <YwjIadKu0Wv2+VDk@google.com>
References: <20220822115246.1.I45235b7c40997bc2abf813e4722b4dcdd6aecf6b@changeid>
 <20220822115246.2.If09027f73daa6e1ed95f5eab02326b543c67132e@changeid>
 <YwS3FCOqIeajMEgz@hovoldconsulting.com>
 <YwUDjaG6n95Ddij2@google.com>
 <YwXlsK3pjK/q1xwO@hovoldconsulting.com>
 <Ywf02oIXEL8G/Heo@google.com>
 <YwjFD9uHnSxoZHvT@google.com>
 <YwjGpSXOscDwbvQH@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YwjGpSXOscDwbvQH@hovoldconsulting.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 26, 2022 at 03:12:05PM +0200, Johan Hovold wrote:
> On Fri, Aug 26, 2022 at 06:05:19AM -0700, Matthias Kaehlcke wrote:
> > On Thu, Aug 25, 2022 at 03:16:58PM -0700, Matthias Kaehlcke wrote:
> > > On Wed, Aug 24, 2022 at 10:47:44AM +0200, Johan Hovold wrote:
> 
> > > > The wakeup setting doesn't seem to have anything to do with the genpd
> > > > issues on sc8280xp and the controller doesn't resume properly regardless
> > > > of whether the PHYs have been disabled or not during suspend unless the
> > > > PD is left on.
> > > 
> > > I'm essentially seeing the same. USB is hosed after resume unless the PD
> > > is left on.
> > > 
> > > On Chrome OS we currently work around that with a version of commit
> > > d9be8d5c5b03 ("usb: dwc3: qcom: Keep power domain on to retain controller
> > > status") which was reverted upstream. I'm not sure whether USB worked after
> > > resume before we enabled wakeup support. I would have sworn it did, but we
> > > landed an old version of the wakeup patches a long time ago, so my
> > > memory might be failing me.
> > 
> > I need to remind myself that keeping the GDSC on is only needed when the PHYs
> > are kept on. The PHYs were always off before wakeup support was added, which
> > is why USB wasn't broken after suspend in the pre-wakeup days.
> 
> Ok, so to be clear: if you disable wakeup with my patches applied so
> that the PD is actually turned off, USB still resumes with only
> GENPD_FLAG_ACTIVE_WAKEUP set?
> 
> That is, you don't need to set ALWAYS_ON as I do with sc8280xp?

Correct

The USB controller isn't entirely happy:

[   23.062936] xhci-hcd xhci-hcd.13.auto: xHC error in resume, USBSTS 0x411, Reinit

but USB still works.
