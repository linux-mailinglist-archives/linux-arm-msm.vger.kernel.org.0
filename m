Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8B171A17B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 00:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgDGWH1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 18:07:27 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42863 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgDGWH1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 18:07:27 -0400
Received: by mail-pg1-f194.google.com with SMTP id g6so2367894pgs.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 15:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xQ0CMqBW6HOiKsmKZ6VgVvjTVRhpyHMNm3H4n2IX4C8=;
        b=Rw68i3XJ5JnnwX/K/8I3yzixlUVsVtJ2etjO5TZhfnYbsajRHoeks03BiJgc4IfBou
         pplNLgCJb4AibRRMSKpOE+MgNY2ShgtRSuFxsEr0E7TMIntadjYbMmCzEJM82pfk37t5
         7ySqepJeD5kpr2jRBpC2O3hCv5zKx89jMhXvZIFEkqcwpMe0Zetu9YvY924vkJS9kNyA
         fq2slWBlcJ0DDuF/xaFlnd5Kx7z+uNpxn1I5a7EeBT7muxR+VxQ0iBnYWNlYN6s/07Gf
         3u0ljmf5E8+2Jg2asB/+5DNamV2GqzhneAUcBvpTDHXD8SF4Flpjfu8WvXugWRFK67OK
         pP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xQ0CMqBW6HOiKsmKZ6VgVvjTVRhpyHMNm3H4n2IX4C8=;
        b=psfXfrrAy/GMojp8efqG9h0jRtdFDaKmWBswfCCWYR6raGWfhSXQ3t9by5/NIq+CfC
         V/4QXD4w1ZKs7u6vc3x0HJm1V8RyVZkMnTMbEhzlTQDwNggahlV4kobzsSWYUep1Li+l
         ghgmr7aP8ksDoqAKInzZ0mtPCHGOLzHoiiB0+8mPCwBLpo8wMypsjkgA2bT6o0f0H1lf
         yn4K29J2W8uBDCqq4eGtT0qcIISb/v+9X6vmSTpwf7IIcCjVEUUV+bSe2YCWoeN+7W86
         70U3TLMHgbUeQffxWJSCUG2BpVz4h4OjZ+MnM30ZRk8f+HDHkEm+S1tqHeRdDhqfm0JI
         pajQ==
X-Gm-Message-State: AGi0Pub8Wsp+gFjVUCcm7yYotu9V0FNsBb98FM3Ox8+7wdMwc8Jd5203
        e2zR2rte2XgHErIAMi/L/NZXVg==
X-Google-Smtp-Source: APiQypImyD5jkZCA6R9BSgJ+PmtBP9/LG4f/aJX6aezk6OZplkgeFKHReg6Bg6r/hmACeL/V74aYKw==
X-Received: by 2002:a62:75d0:: with SMTP id q199mr4566702pfc.72.1586297245671;
        Tue, 07 Apr 2020 15:07:25 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r9sm14091252pfg.2.2020.04.07.15.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 15:07:24 -0700 (PDT)
Date:   Tue, 7 Apr 2020 15:07:30 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org, wsa@the-dreams.de,
        broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        georgi.djakov@linaro.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mka@chromium.org, dianders@chromium.org, evgreen@chromium.org
Subject: Re: [PATCH V3 2/8] soc: qcom: geni: Support for ICC voting
Message-ID: <20200407220730.GK20625@builder.lan>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-3-git-send-email-akashast@codeaurora.org>
 <20200331233209.GF254911@minitux>
 <45191b98-60fa-cd49-3067-d58c128d2c9c@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45191b98-60fa-cd49-3067-d58c128d2c9c@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 06 Apr 23:45 PDT 2020, Akash Asthana wrote:

> Hi Bjorn,
> 
> On 4/1/2020 5:02 AM, Bjorn Andersson wrote:
> > On Tue 31 Mar 04:09 PDT 2020, Akash Asthana wrote:
> > 
> > > Add necessary macros and structure variables to support ICC BW
> > > voting from individual SE drivers.
> > > 
> > > Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> > > ---
> > > Changes in V2:
> > >   - As per Bjorn's comment dropped enums for ICC paths, given the three
> > >     paths individual members
> > > 
> > > Changes in V3:
> > >   - Add geni_icc_get, geni_icc_vote_on and geni_icc_vote_off as helper API.
> > >   - Add geni_icc_path structure in common header
> > > 
> > >   drivers/soc/qcom/qcom-geni-se.c | 98 +++++++++++++++++++++++++++++++++++++++++
> > >   include/linux/qcom-geni-se.h    | 36 +++++++++++++++
> > >   2 files changed, 134 insertions(+)
> > > 
> > > diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> > > index 7d622ea..9344c14 100644
> > > --- a/drivers/soc/qcom/qcom-geni-se.c
> > > +++ b/drivers/soc/qcom/qcom-geni-se.c
> > > @@ -720,6 +720,104 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
> > >   }
> > >   EXPORT_SYMBOL(geni_se_rx_dma_unprep);
> > > +int geni_icc_get(struct geni_se *se, const char *icc_core, const char *icc_cpu,
> > > +		const char *icc_ddr)
> > > +{
> > > +	if (icc_core) {
> > Afaict it's only this that might be passed as NULL, so please drop these
> > conditionals (keep the last one).
> IIUC you're suggesting to drop if (icc_core/cpu) but keep if (icc_ddr) ?

Correct

Thanks,
Bjorn
