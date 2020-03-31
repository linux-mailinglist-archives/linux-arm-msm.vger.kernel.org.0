Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E74FA199B0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 18:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbgCaQMA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 12:12:00 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44443 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731026AbgCaQL7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 12:11:59 -0400
Received: by mail-pg1-f195.google.com with SMTP id 142so10528438pgf.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2020 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HGjePE0GSqbKz6aKbzU/yxb5OZwh8Nq086ecagG4P/g=;
        b=FXZX8UehOEz9Kni4GELnb/5/v6Qj6xwLNsOHkCFRAvqmZJFoMimJsYJGlR8qWuT3JP
         /jiEuMvyz9s8viO8XrGdI9iGKa+z0LkGhzTuGioisjEORu/Jtd6YUUxEyaeT+fkbg+AI
         hklRTmvh3uljXeEwgl9dNw7H3nNlcCzTsAfVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HGjePE0GSqbKz6aKbzU/yxb5OZwh8Nq086ecagG4P/g=;
        b=k1Pq9DdSMBVacxuWnnrZVeoPJfOP04OOqlZ8igVcBpAYwRs4r3IIQoPdJdDwSTavMn
         o9u4zOtw4DBfRUVczPu7OcJ1SZQowMuob904d2OQjjW5p6xQU9cp4qei/Ejd8Ui+N6zN
         FFQMzaWZg0QOpNtx1Y2LklTaFdckmAJJeb9UiK5EAZNhFH88PXOliBdL2SiGO30z5vyZ
         DCU3A3jl1Eb/qIiNdNzl+uo8NBBc+xwEldi9AtxM2sOA3TFC/kwb9ojkSMVDCJSEqVvO
         0OIewIm0KOetOmtJUvAAkK/wWM/M5MLRYt1k11Vl/jytGXSyKa+VS7hIW4mbvg4NFomr
         dDBQ==
X-Gm-Message-State: ANhLgQ2VjbC6NzpEtI6fO3eWhsUQ98ah6QPcKO6yvwwff9Q/xSsQ5KC8
        xG+gRUE6wqCT/gLjnkuDmwBHHg==
X-Google-Smtp-Source: ADFU+vtfSPh8HumDN4cjkDTaweYzwxq2FI8K3EiPnKxEhov9TRTsTgaPcIbaDj4F/2NhI4oOVc9T0Q==
X-Received: by 2002:a62:7c15:: with SMTP id x21mr19812360pfc.132.1585671117785;
        Tue, 31 Mar 2020 09:11:57 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id z7sm12830932pfz.24.2020.03.31.09.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 09:11:57 -0700 (PDT)
Date:   Tue, 31 Mar 2020 09:11:55 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Cc:     Felipe Balbi <balbi@kernel.org>, Andy Gross <agross@kernel.org>,
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
Message-ID: <20200331161155.GD199755@google.com>
References: <1585302203-11008-1-git-send-email-sanm@codeaurora.org>
 <1585302203-11008-3-git-send-email-sanm@codeaurora.org>
 <20200329171756.GA199755@google.com>
 <87h7y62r28.fsf@kernel.org>
 <20200330155038.GC199755@google.com>
 <87zhbx1q6q.fsf@kernel.org>
 <ec7e921a-45fe-c178-cc04-2a04dd4a75f5@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ec7e921a-45fe-c178-cc04-2a04dd4a75f5@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 31, 2020 at 10:45:19AM +0530, Sandeep Maheswaram (Temp) wrote:
> Hi,
> 
> On 3/31/2020 3:05 AM, Felipe Balbi wrote:
> > Hi,
> > 
> > Matthias Kaehlcke <mka@chromium.org> writes:
> > > > Matthias Kaehlcke <mka@chromium.org> writes:
> > > > > > Add interconnect support in dwc3-qcom driver to vote for bus
> > > > > > bandwidth.
> > > > > > 
> > > > > > This requires for two different paths - from USB master to
> > > > > > DDR slave. The other is from APPS master to USB slave.
> > > > > > 
> > > > > > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > > > > > Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> > > > > > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> > > > > > ---
> > > > > >   drivers/usb/dwc3/dwc3-qcom.c | 128 ++++++++++++++++++++++++++++++++++++++++++-
> > > > > >   1 file changed, 126 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > > > > > index 1dfd024..7e85fe6 100644
> > > > > > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > > > > > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > > > > > 
> > > > > > ...
> > > > > > 
> > > > > > +/* To disable an interconnect, we just set its bandwidth to 0 */
> > > > > > +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
> > > > > > +{
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	ret = icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
> > > > > > +	if (ret)
> > > > > > +		return ret;
> > > > > > +
> > > > > > +	ret = icc_set_bw(qcom->apps_usb_icc_path, 0, 0);
> > > > > > +	if (ret)
> > > > > > +		goto err_reenable_memory_path;
> > > > > > +
> > > > > > +	return 0;
> > > > > > +
> > > > > > +	/* Re-enable things in the event of an error */
> > > > > > +err_reenable_memory_path:
> > > > > > +	ret = dwc3_qcom_interconnect_enable(qcom);
> > > > > This overwrites the error that led to the execution of this code path.
> > > > > The function should return original error, not the result of the
> > > > > _interconnect_enable() call.
> > > > > 
> > > > > I saw Felipe queued the patch for v5.8. I think the main options to fix this
> > > > > are:
> > > > > 
> > > > > - a v6 of this patch to replace v5 in Felipe's tree (which IIUC will be rebased
> > > > >    anyway once there is a v5.7-rc)
> > > > > - send the fix as a separate patch
> > > > > - Felipe amends the patch in his tree
> > > > > 
> > > > > Felipe, what would work best for you?
> > > > Let's go for a v6, which commits should I drop? I can't find anything
> > > > related to $subject in my queue:
> > > > 
> > > > $ git --no-pager log --oneline HEAD ^linus/master -- drivers/usb/dwc3/dwc3-qcom.c
> > > > 201c26c08db4 usb: dwc3: qcom: Replace <linux/clk-provider.h> by <linux/of_clk.h>
> > > I thought I saw a "queued for v5.8" message from you, but can't find that back.
> > > I guess I saw the "queued" message for the "Add USB DWC3 support for SC7180"
> > > series and thought it was for this one. Sorry for the confusion.
> > no worries :-)
> > 
> Should I remove the ret from below line and send a new version?
> +	ret = dwc3_qcom_interconnect_enable(qcom);

Yes, please!
