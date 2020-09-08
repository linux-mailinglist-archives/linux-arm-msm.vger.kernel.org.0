Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2718D26107B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 13:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729095AbgIHLIu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 07:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729479AbgIHLIQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 07:08:16 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96A4C061756
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 04:08:15 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b124so10640462pfg.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 04:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uOsDd9DMyOZifF47BsNOzynIQHRT+9Y8v/tFdBbWAkg=;
        b=t6e7fpKK8Yf9FoDYSk7OvjyJ7EL8PHIvpApgI7yIiVBCL0nqPj/OwRdT19SyyvnQpO
         3jog32acgbwRnRsOxPpEyF/PwGmG4yOoLi6vsyUrFIRSKquOx5iQ4Npoz8kfpyM7PE87
         1BLVbm0YDGIvF2nCAgT50FL9Em7AdGXqU5hcTXrk1PH1cuPuN9aFb/yvIFHTVCcE3Ujq
         7fKMvA1Y6L3EujQOalPf6b2auOqTchEnbNAkEu9ym/Mo8/cbB7ScLJ24x1hyNmQnalwt
         gc3Hw1Xn2S+ZRC6JZKYpdc2b24dJCtr2P784fOX4lWGK0GaAY0jk5zBvPV0vLamX7PZq
         8WAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uOsDd9DMyOZifF47BsNOzynIQHRT+9Y8v/tFdBbWAkg=;
        b=Ln6FbgdD4OAlAK5hr1yuAYrIsUG5F+jGeC9xJ5wxLV/9oGiUzkMqkFJs3YbE5UKQrq
         ExIvtSsOuQh7/Btgr/VEHVdgHrxv52M+y3Y857CmZmIMFSM8xWpXT3M3bGOT5Nid1Oat
         c+lFjJFoefHzd9qAQey7PaNEAqfBpAShUO60SCE2Nh9t71XkiQAOt7WDbLimHwivnARQ
         CFrmyJJqmszM0PazIoWnri09N90OtZMvyyGf053+sVAsRu5FrIVmvs+3ffQpe5kX6OeS
         I0ne3Jp1H80vcKXaLnNwR7EGsU6vbYMdRCuVdZ2T0NL5vOjfs/+A1VLBydMRQGf2ws+q
         aypA==
X-Gm-Message-State: AOAM530YFnMICyl5+LheC7MCXl7bbCIATcy0p1v7nuG21TsomJueOJqY
        +BSnBNzW0oGpTj3f6gj460e/
X-Google-Smtp-Source: ABdhPJxuck3EhYTcRgc7Sc7w+3F2tPmri6I4QbD81+dRboSfutsqtg3vk1pdj2ih+Ww5bUg0lzjxng==
X-Received: by 2002:a63:b44f:: with SMTP id n15mr20043609pgu.282.1599563294618;
        Tue, 08 Sep 2020 04:08:14 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id a15sm10009832pfi.119.2020.09.08.04.08.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 04:08:13 -0700 (PDT)
Date:   Tue, 8 Sep 2020 16:38:05 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     rjw@rjwysocki.net, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, amitk@kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org, tdas@codeaurora.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm8250: Add cpufreq hw node
Message-ID: <20200908110805.GA23095@mani>
References: <20200908075716.30357-1-manivannan.sadhasivam@linaro.org>
 <20200908075716.30357-3-manivannan.sadhasivam@linaro.org>
 <20200908103906.sgbaw3shfdpv5pma@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908103906.sgbaw3shfdpv5pma@vireshk-i7>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 0908, Viresh Kumar wrote:
> On 08-09-20, 13:27, Manivannan Sadhasivam wrote:
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > Add cpufreq HW device node to scale 4-Silver/3-Gold/1-Gold+ cores
> > on SM8250 SoCs.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> 
> You want this to go through my tree or ARM Soc ?
> 

Bjorn will take this through arm-soc. But it would be good if you can provide
the review.

Thanks,
Mani

> -- 
> viresh
