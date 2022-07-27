Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D98EF583210
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 20:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239709AbiG0Sd0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 14:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbiG0SdJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 14:33:09 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA09094656
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 10:31:09 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id d65-20020a17090a6f4700b001f303a97b14so2822236pjk.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 10:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LmCBfs2WW3NfL4Q2WAECQ3SJcL3MvIgv0G1LKqCA5+s=;
        b=luD3Yki0EVhKjTfuukT9qc77ZjHYo27BbgwSsT+U1g9rxEwphDlqqmXs62NaigLL0l
         CBc7BJ3b7nd9qn1Sm8nKdgjnEjkM4NBc6YvblNcJ+2iIcydBSLfN4wfB6DlxNaCfovpP
         z7XxvoxOQfJNGNrJ6P5rv7WTu8ghKariGrFss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LmCBfs2WW3NfL4Q2WAECQ3SJcL3MvIgv0G1LKqCA5+s=;
        b=xJHSobfXu0g2naaEMIPzi6nYEk+oWT4MUIelBUa9wXOa+alozfdxQFrUF1CXyu5hWU
         9W48CgEldfwcsC4e08c1mhAPFihsfSf4Ias9wB7vULD4zX5ZQE21EnUlNcDXqT28JCbJ
         69neYTIb2GZAD9PiE3OxfWubTqrRFfyseuRRpwzMk9riEyCSuFnMSV74gyMRnstZrcW3
         5CvJDvLiXNr152c1sIn0nMAwpP/T6goO2z0qypbpNmXLP2WhN6i1O+Cwrrivt0qRpevW
         7Ea8L02n7MGpObeJC4x+IYjQAaJkhl4qQEtWtWqwCEWSMIhav4bmF3/5AnqTDvwwLU8Q
         8Asg==
X-Gm-Message-State: AJIora+xU+v/W6grihwiGtP1s5AZIQrOBaxNGh5PNlPDS3ZSD5Uh9etZ
        AdH2zH2BvGjS9yv79xoo0MgO9g==
X-Google-Smtp-Source: AGRyM1s61hwu3OOAI7THZ86GAIVvVdAYUlKEMykBTMZ256AKnNkQODCbKZZC3RaY3jEpecyvONt+7Q==
X-Received: by 2002:a17:902:d651:b0:16b:f55e:c626 with SMTP id y17-20020a170902d65100b0016bf55ec626mr22746641plh.78.1658943066729;
        Wed, 27 Jul 2022 10:31:06 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:472c:7351:bacf:5228])
        by smtp.gmail.com with UTF8SMTPSA id mj1-20020a17090b368100b001f310564e8bsm1456767pjb.30.2022.07.27.10.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 10:31:06 -0700 (PDT)
Date:   Wed, 27 Jul 2022 10:31:04 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Krishna Kurapati <quic_kriskura@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: qcom: Defer dwc3-qcom probe if dwc3 isn't
 probed properly
Message-ID: <YuF2WLOx8iGiwvWO@google.com>
References: <1657891312-21748-1-git-send-email-quic_kriskura@quicinc.com>
 <YtHRFcol5uslEel1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YtHRFcol5uslEel1@google.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 15, 2022 at 01:41:57PM -0700, Matthias Kaehlcke wrote:
> On Fri, Jul 15, 2022 at 06:51:52PM +0530, Krishna Kurapati wrote:
> 
> > Subject: usb: dwc3: qcom: Defer dwc3-qcom probe if dwc3 isn't probed properly
> 
> nit: "isn't probed properly" sounds like a bug or HW issue. In case
> you re-spin maybe change it to "hasn't probed yet" or similar.
> 
> > On SC7180 devices, it is observed that dwc3 probing is deferred
> > because device_links_check_suppliers() finds that '88e3000.phy'
> > isn't ready yet.
> > 
> > As a part of its probe call, dwc3-qcom driver checks if dwc3 core
> > is wakeup capable or not. If the dwc3 core is wakeup capable, driver
> > configures dwc-qcom's power domain to be always ON. Also it configures
> > dp/dm interrupts accordingly to support wakeup from system suspend.
> > 
> > More info regarding the same can be found at:
> > commit d9be8d5c5b03 ("usb: dwc3: qcom: Keep power domain on to retain controller status")
> > commit 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during suspend")
> > 
> > In the event, dwc3 probe gets deferred and is processed after dwc3-qcom
> > probe, driver ends up reading the wakeup capability of dwc3 core as false
> > leading to instability in suspend/resume path.
> > 
> > To avoid this scenario, ensure dwc3_probe is successful by checking
> > if appropriate driver is assigned to it or not after the of_platform_populate
> > call. If it isn't then defer dwc3-qcom probe as well.
> > 
> > Fixes: 649f5c842ba3 ("usb: dwc3: core: Host wake up support from system suspend")
> > Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> 
> Reported-by: Matthias Kaehlcke <mka@chromium.org>
> Tested-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

(attempt to 'summarize' and move the discussion from v1 [1] to here)

gregkh> Why not limit this check to a device type like your changelog mentions?

mka> It is not an sc7180 specific issue. It can occur on any platform where the
mka> dwc3 core has supplies that aren't ready when the dwc3-qcom driver probes.
mka>
mka> It won't blow up right away since it requires 'wakeup-source' to be set for
mka> the dwc3 core, which currently is only the case for 'usb@a600000' of the
mka> sc7280 AFAIK (I set it for sc7180 in my tree for testing, which is when I
mka> found the issue this patch intends to address).

krishna> As Mathias pointed out, no issue was seen so far on present QC targets
krishna> as wakeup-source property was added recently and only for SC7180 and
krishna> SC7280. We ran into some issues like wakeup from system suspend in
krishna> host mode wasn't happening although we enabled wakeup-source in SC7180
krishna> that eventually led us to this bug. But, we tried to add debug prints
krishna> to follow the code flow and see that the issue is present on SM8350
krishna> as well : "supplier 88e9000.phy-wrapper not ready" and deferring dwc3
krishna> probe. This doesn't seem to be specific to SC7180.
krishna>
krishna> Since this is seen on multiple platforms, can we go ahead without
krishna> having any platforms specific checks in the code as in V2 version ?

[1] https://lore.kernel.org/all/YtAv1U1VYkhIY1GA@kroah.com/t/#m6714bf1f2309cfe8be92e6c270ef2a99a9b09ac6
