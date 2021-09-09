Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E150D405951
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 16:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350852AbhIIOm1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 10:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243524AbhIIOmR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 10:42:17 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEEBC077584
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Sep 2021 07:07:05 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id g14so1878634pfm.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Sep 2021 07:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZsGmoKVeGSZ+m7Ek1UAVfUV/GOE24csmNWXi5Lpo+Ys=;
        b=WK1kvHbXWUR8DUmpIIOfo64sSAUbueIsVzFk8Trg3Cr9JiBZrHnSXRMBFjDYBeEuOg
         nUHYu8U4VvLkkDsI2iFv9RJ2ckvofdX0TkbxI6CyOX9M7m2Hv0aGnxj0Syv5MxOzV6QI
         8EVLd4XFQ07bX2I9QGSfM27gnStC2j/UdtNtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZsGmoKVeGSZ+m7Ek1UAVfUV/GOE24csmNWXi5Lpo+Ys=;
        b=l8lozULOx3vKhD2t+hJbQA6de9NnX4QSfOq0vgAsziP0EyDXszGnd0gnZSgVisgqUX
         4earFKB5h9a+39Kagh8TGDOH/qZTjE9RPO4v5JGAP3XswWHm69bLWs4k9T4d/bI7L/jq
         aL73Z1wGkF03N2aOpKsV5faEwT48te71mskcKVW7YD66+0jR0v6agQ9ZpL4WmGavQsqi
         o4cGGvF0fF5fp+fE5e1bz4Qn+Vp+bikyDl9QibqkOFtwnhjDD1t4mwv5+7MKsvTnaYRP
         06IF1NDD8eQQgadliEJoht+pw7RRSzLhRSZNMpHZ/9VmXEtNWEJb99WOX6V4BP4YJpjB
         IHfA==
X-Gm-Message-State: AOAM531LQ0ptwINk1HlMcw31c/CCXD1B8Sn5J3SHggiBVEhTlBPe780y
        rmZgj1Y69vtxZliOESAGeqW9ag==
X-Google-Smtp-Source: ABdhPJxx5sfoZckfMgasJEbDoPvi6d1RhwM18VfCsgxtQzpNnnEZTyclvB+pLSwyQPqUVpJIYx94qQ==
X-Received: by 2002:a63:4b53:: with SMTP id k19mr2805141pgl.3.1631196424789;
        Thu, 09 Sep 2021 07:07:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:27cc:a1d4:ed44:e1de])
        by smtp.gmail.com with UTF8SMTPSA id mv1sm2382673pjb.29.2021.09.09.07.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 07:07:04 -0700 (PDT)
Date:   Thu, 9 Sep 2021 07:07:02 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     rajpat@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org, dianders@chromium.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V7 6/7] arm64: dts: sc7280: Add QUPv3 wrapper_1 nodes
Message-ID: <YToVBqaa7FUL3GVw@google.com>
References: <1630643340-10373-1-git-send-email-rajpat@codeaurora.org>
 <1630643340-10373-7-git-send-email-rajpat@codeaurora.org>
 <YTJZ8YkjrCmyzNjG@google.com>
 <c0c74fc30ef3f3b1432ab2e614862b93@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c0c74fc30ef3f3b1432ab2e614862b93@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 09, 2021 at 10:14:18AM +0530, rajpat@codeaurora.org wrote:
> On 2021-09-03 22:52, Matthias Kaehlcke wrote:
> > On Fri, Sep 03, 2021 at 09:58:59AM +0530, Rajesh Patil wrote:
> > > From: Roja Rani Yarubandi <rojay@codeaurora.org>
> > > 
> > > Add QUPv3 wrapper_1 DT nodes for SC7280 SoC.
> > > 
> > > Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> > > Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 709
> > > +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 709 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > index 32d1354..8fe54bf 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > 
> > > +			qup_spi8_data_clk: qup-spi8-data-clk {
> > > +				pins = "gpio32", "gpio33", "gpio34";
> > > +				function = "qup10";
> > > +			};
> > > +
> > > +			qup_spi8_cs: qup-spi8-cs {
> > > +				pins = "gpio35";
> > > +				function = "qup10";
> > > +			};
> > 
> > As for wrapper_0, I think we still want the nodes to configure the CS as
> > GPIO.
> > 
> > If there are no other reasons to re-spin these could be added with a
> > follow-up
> > patch, so:
> > 
> shall we add all removed qup_spiN_cs_gpio nodes?

Yes
