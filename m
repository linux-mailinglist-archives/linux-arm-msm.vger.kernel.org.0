Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE2E253BBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 03:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbgH0B7r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 21:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgH0B7r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 21:59:47 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0D7C061369
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 18:59:46 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id g1so887911oop.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 18:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/oidMW/W20jF+NxvzsE3dEflfMY2KxJGTLWf/bdubB0=;
        b=TNH6cFFKpY9pf8bAPVka2j/qvuFuZXl2oamyYo9KGpvLnkLd45PTDkWk7TDAsR8WmD
         wtmSVzjkxcu6nAodWjSOp5f4imTr7yio+1pWt+I4H67LtWRMcKZCrcxlMgMuCXLglTiu
         jrmrM41U1j6Uzck5OkbUSJlCvHBWL5pjqYbNQSPcEbqWF8DCpJDa3nSzJFbM3ChUbkXV
         NlDOkl/1QvcyGsfV8r9aAIMn/qPzeP73cwIbdApi7+SFAWoUFPlt87UfAbsGjhi5d/aQ
         MByJ66EvunTGaOFQXs0QNh4zOOGNp9TNmmHEKknOwQNKpctUr89yiS+piTm0tDBhRsKx
         e3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/oidMW/W20jF+NxvzsE3dEflfMY2KxJGTLWf/bdubB0=;
        b=krxnnacHQgzwq0OQhqsxbtM2hfHQxb6vgqKxj86q2+SYqajTDZ1iR181iUQte8lqms
         YYuHmDyD7PSzk5WM9i5hN3/S7LerFSisrmEkQ2DUQrJVltiZjIZGyXN3rqthqSM6kIeg
         zzBtCHojZUqw1ri41pyyZBkh/GUGSo9xtN/zSN1zWPlgNVTEIEEgGeN6oZNZOkb0E0b5
         nnwRH+numwPlJfqVX865xygcUsbMcHmrD3fByhjlv07kXddxC4BTs7cwhGEWJqYvkDw5
         OD7dudyWsnc+WiCCdu0roz1kYjgJjMWOCmWUi9U27CJyLfj73+v0YtUzI0mg+Xx+VSi1
         EgJg==
X-Gm-Message-State: AOAM530Y6GiFFRAv08fMb5MIu9lbNbrXMVymOo3bwRF2Bx6gkDUxVHix
        8Y2J8zd/62ES34pkGioZzIYM2w==
X-Google-Smtp-Source: ABdhPJz1VZJHwh3gmPiQw0+0U/BOgIYqvt63leeGTunSeMa3alZx4TM5V6vrDU2f2Btu5AjcJXTfnw==
X-Received: by 2002:a4a:aa0e:: with SMTP id x14mr12438488oom.27.1598493585763;
        Wed, 26 Aug 2020 18:59:45 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id a16sm179248oop.17.2020.08.26.18.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 18:59:45 -0700 (PDT)
Date:   Wed, 26 Aug 2020 20:59:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v1 5/9] phy: qcom-qmp: Get dp_com I/O resource by index
Message-ID: <20200827015939.GI3715@yoga>
References: <20200826024711.220080-1-swboyd@chromium.org>
 <20200826024711.220080-6-swboyd@chromium.org>
 <20200826043616.GF3715@yoga>
 <159847755731.334488.13614233203912102191@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159847755731.334488.13614233203912102191@swboyd.mtv.corp.google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 26 Aug 16:32 CDT 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2020-08-25 21:36:16)
> > On Tue 25 Aug 21:47 CDT 2020, Stephen Boyd wrote:
> > 
> > > The dp_com resource is always at index 1 according to the dts files in
> > > the kernel. Get this resource by index so that we don't need to make
> > > future additions to the DT binding use 'reg-names'.
> > > 
> > 
> > Afaict the DT binding for the USB/DP phy defines that there should be a
> > reg name of "dp_com" and the current dts files all specifies this. Am I
> > missing something?
> 
> Yes the binding enforces this but this patch is removing that
> enforcement and instead mandating that dp_com is always at index 1 (i.e.
> the second one) so that we can add the DP serdes region directly after
> and avoid adding yet another reg-names property. I changed the binding
> for this usb3-dp phy compatible to make reg-names optional as well. I
> don't see any gain from using reg-names.
> 

Thanks for the explanation, I don't have any objections to this.

> > 
> > PS. Why isn't this a devm_platform_ioremap_resource{,_byname}()?
> 
> Sure. I'll roll that into this patch.

Thanks,
Bjorn
