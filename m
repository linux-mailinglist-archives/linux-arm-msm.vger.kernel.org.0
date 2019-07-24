Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59D9B725AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 06:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbfGXEI4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 00:08:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:47572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725823AbfGXEI4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 00:08:56 -0400
Received: from localhost (unknown [171.76.105.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B756E20856;
        Wed, 24 Jul 2019 04:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563941335;
        bh=dhtJRLxWopXyRWAbEHDDcQBerRKU9r5DPb1MyOwrTj0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=08uQlih0iXWz8zosGxKkJOwj5OZAxTqyla+UmOORMPfGBd6gsOGttSxLLwmHg/KXe
         dy8Q+O7dUbx9zGZiLcUpUa5kFqRQ0RAYybHLRSypD+UPl0/G/c2SiWbuCXddsQnCGg
         5SE1EmmKYOpfP1ryEOQuVBrXOJc8tp61me5Vj7lM=
Date:   Wed, 24 Jul 2019 09:37:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sdm845: Add unit name to soc node
Message-ID: <20190724040743.GB12733@vkoul-mobl.Dlink>
References: <20190722123422.4571-1-vkoul@kernel.org>
 <20190722123422.4571-2-vkoul@kernel.org>
 <5d371e9d.1c69fb81.8d9f4.1ac0@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d371e9d.1c69fb81.8d9f4.1ac0@mx.google.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-07-19, 07:50, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-07-22 05:34:18)
> > We get a warning about missing unit name for soc node, so add it.
> > 
> > arch/arm64/boot/dts/qcom/sdm845.dtsi:623.11-2814.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks for the review
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 601cfb078bd5..e81f4a6d08ce 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -620,7 +620,7 @@
> >                 method = "smc";
> >         };
> >  
> > -       soc: soc {
> > +       soc: soc@0 {
> 
> This is kinda sad, but ok. Maybe you can apply this fix to at least all
> the qcom boards then.

Yeah that is the idea, start with sdm845 and 'reduce' the warns on all
qcom dts files

-- 
~Vinod
