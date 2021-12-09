Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10DA246E2FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 08:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbhLIHOw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 02:14:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbhLIHOw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 02:14:52 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9937BC061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 23:11:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 1D314CE12A7
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 07:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88927C004DD;
        Thu,  9 Dec 2021 07:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639033875;
        bh=jlx92J9zgJBMQB1Ium6NTFonzF/oKa2rqvYrXd0exxw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bJCaoV7m/JowpwFrrJGJoyzf2ajRtxI7UxwPEL4K1/BfgL4XXsb9osxDYB8Y1eN3H
         jk+hsbC21uvSbC97/wrb1VLtPFeBqtNPSBwNmFln5wVO+sCX5Ed8gqbjzUJitf7e1v
         dqo/5bHxkAZRRo8FkW4xiDv7nvKOYYi/h4v2nUVzIP64OkWqjyNnZgMY1C4K5FLcef
         FbY3qBYjFD1Icz5a8vzunYBfOUFymQS07hT8UgWrCfJSO0vP4io+xU1gGlYQoCQzBu
         AEMYQOvL81Q9Ew0ecHJKjKufp15PtKpIKkXMckekHOnGlen5hIbQUyF4y19jQpXVRp
         /WK8bev+Jf3cw==
Date:   Thu, 9 Dec 2021 12:41:11 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH 14/15] arm64: dts: qcom: sm8450: add cpufreq support
Message-ID: <YbGsD4gbO2zGuVVy@matsya>
References: <20211201072915.3969178-1-vkoul@kernel.org>
 <20211201072915.3969178-15-vkoul@kernel.org>
 <725e7ac2-c4b1-8908-585f-d05d72bc7a95@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <725e7ac2-c4b1-8908-585f-d05d72bc7a95@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-12-21, 16:28, Konrad Dybcio wrote:
> 
> On 01.12.2021 08:29, Vinod Koul wrote:
> > From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> >
> > The change adds a description of a SM8450 cpufreq-epss controller and
> > references to it from CPU nodes.
> >
> > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8450.dtsi | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> [...]
> 
> 
> >  
> > +			cluster1 {
> >  				core4 {
> >  					cpu = <&CPU4>;
> >  				};
> > @@ -182,7 +192,9 @@ core5 {
> >  				core6 {
> >  					cpu = <&CPU6>;
> >  				};
> > +			};
> >  
> > +			cluster2 {
> >  				core7 {
> >  					cpu = <&CPU7>;
> >  				};
> 
> Weren't DynamIQ-enabled SoCs supposed to be treated as single-cluster
> 
> from the Linux POV? Or has it changed again with the new chips?

I discussed with Bjorn and yes we should have a single cluster for this.
will fix

-- 
~Vinod
