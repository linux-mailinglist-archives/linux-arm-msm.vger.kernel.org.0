Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91F7119802B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 17:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbgC3Pup (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 11:50:45 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38349 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbgC3Pup (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 11:50:45 -0400
Received: by mail-pl1-f196.google.com with SMTP id w3so6881201plz.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 08:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dZsn4EW/SyaRsmueE+/vYE2vemazchjXW/dbHmCRlUs=;
        b=cbD3U0SWemqC1mmtbV87ewilvyfjJ6wvBrx1Zv9z50jgAf9m1zNNdUG66wXMgyvK6w
         ZZdtz3wzvXNip6aIDfmUPWqG85OQxDWzLAzKrN9IJ2NIzLYVNAO6ke9IydE4kwJIysFp
         5v+XWRKX9MnKGNCQeTmnSp3izMpZzXfKXtPtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dZsn4EW/SyaRsmueE+/vYE2vemazchjXW/dbHmCRlUs=;
        b=VjjeuEeiODGxwPNX88Yw1Xi4T0q3KvUS2g4LOOiYGnnpGQT8PCxDhT83VN9xtJpNvv
         B3HQj2FhEMqVi8hQpTzGEHwtAMJQt1ExP+oQ/TjXab86nI7UQgByZC2Ya76lE1vYo8nw
         Bvcc6G8M2vJl2XKmnZgtFaGyG/fdojUKDosxvsdvBwqryXzmWtTlAnJpsa0LJyNJvR5e
         Ah15kyFl1ugByIGvDRXxhqeKN3gq+3DkSMuilHlP0TZc1rb2+693Jsgk11EylOC88NqL
         AKyUK/ApH87eOJEJXcDioIPxA4qTM1hAlqY4cTwYfBnoaqrKUTOo/Cr+6c2Ch5tIeUiI
         iuiw==
X-Gm-Message-State: ANhLgQ20ejxDYPv9EYnLls03rxler17SbOFFcsC6UjRK99HcwpMEtocy
        djZ1rs1m2DaDmMWVI3IIicg9fw==
X-Google-Smtp-Source: ADFU+vs3bQbui32mwgN4d69WBgcOI3D/G3nH3HTL6g28UawRkGYTx1Gv6AOqnTJmut2iCUcqWB559A==
X-Received: by 2002:a17:90a:3249:: with SMTP id k67mr16585418pjb.167.1585583442859;
        Mon, 30 Mar 2020 08:50:42 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id r7sm10438837pfg.38.2020.03.30.08.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 08:50:41 -0700 (PDT)
Date:   Mon, 30 Mar 2020 08:50:38 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v6 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20200330155038.GC199755@google.com>
References: <1585302203-11008-1-git-send-email-sanm@codeaurora.org>
 <1585302203-11008-3-git-send-email-sanm@codeaurora.org>
 <20200329171756.GA199755@google.com>
 <87h7y62r28.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h7y62r28.fsf@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 30, 2020 at 11:19:11AM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Matthias Kaehlcke <mka@chromium.org> writes:
> >> Add interconnect support in dwc3-qcom driver to vote for bus
> >> bandwidth.
> >> 
> >> This requires for two different paths - from USB master to
> >> DDR slave. The other is from APPS master to USB slave.
> >> 
> >> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> >> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> >> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> >> ---
> >>  drivers/usb/dwc3/dwc3-qcom.c | 128 ++++++++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 126 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> >> index 1dfd024..7e85fe6 100644
> >> --- a/drivers/usb/dwc3/dwc3-qcom.c
> >> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> >>
> >> ...
> >>
> >> +/* To disable an interconnect, we just set its bandwidth to 0 */
> >> +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
> >> +{
> >> +	int ret;
> >> +
> >> +	ret = icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ret = icc_set_bw(qcom->apps_usb_icc_path, 0, 0);
> >> +	if (ret)
> >> +		goto err_reenable_memory_path;
> >> +
> >> +	return 0;
> >> +
> >> +	/* Re-enable things in the event of an error */
> >> +err_reenable_memory_path:
> >> +	ret = dwc3_qcom_interconnect_enable(qcom);
> >
> > This overwrites the error that led to the execution of this code path.
> > The function should return original error, not the result of the
> > _interconnect_enable() call.
> >
> > I saw Felipe queued the patch for v5.8. I think the main options to fix this
> > are:
> >
> > - a v6 of this patch to replace v5 in Felipe's tree (which IIUC will be rebased
> >   anyway once there is a v5.7-rc)
> > - send the fix as a separate patch
> > - Felipe amends the patch in his tree
> >
> > Felipe, what would work best for you?
> 
> Let's go for a v6, which commits should I drop? I can't find anything
> related to $subject in my queue:
> 
> $ git --no-pager log --oneline HEAD ^linus/master -- drivers/usb/dwc3/dwc3-qcom.c
> 201c26c08db4 usb: dwc3: qcom: Replace <linux/clk-provider.h> by <linux/of_clk.h>

I thought I saw a "queued for v5.8" message from you, but can't find that back.
I guess I saw the "queued" message for the "Add USB DWC3 support for SC7180"
series and thought it was for this one. Sorry for the confusion.
