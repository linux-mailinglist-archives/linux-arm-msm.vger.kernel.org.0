Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCD2594B59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 19:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbfHSRKd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 13:10:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:56986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726627AbfHSRKd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 13:10:33 -0400
Received: from localhost (unknown [122.182.221.154])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E9C32087E;
        Mon, 19 Aug 2019 17:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566234632;
        bh=0Eu0bktvzMys0ZV9UHjJ/Ycrb7Zfo27tEnF7YjB4lw4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yyrfiaGbp4s0zbvsPiXZaZy0qmFQLqFBMOzsRgqKKbxlu2JRBcSqXFLQiGNESxXWK
         Bj12aKSZsQ3zUKirWoNIx6V2qttZb9SscKeirW5veWouMV8dr9/CFBhk+jIpok1lJW
         YhNcbKBFtXE8/6RJbcX4g5khle0UujMtEIctomEU=
Date:   Mon, 19 Aug 2019 22:39:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/22] arm64: dts: qcom: sm8150: add tlmm node
Message-ID: <20190819170915.GH12733@vkoul-mobl.Dlink>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-4-vkoul@kernel.org>
 <20190814170105.027C42063F@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814170105.027C42063F@mail.kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-08-19, 10:01, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-08-14 05:49:53)
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> 
> Add some commit text? Or just squash with the first patch? Not sure why
> it's a different commit.
> 
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index cd9fcadaeacb..5f2f21270e2d 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -189,6 +189,21 @@
> >                         };
> >                 };
> >  
> > +               tlmm: pinctrl@3100000 {
> > +                       compatible = "qcom,sm8150-pinctrl";
> > +                       reg = <0x03100000 0x300000>,
> > +                             <0x03500000 0x300000>,
> > +                             <0x03900000 0x300000>,
> > +                             <0x03D00000 0x300000>;
> 
> Please don't use capitalized hex characters.

Sure, this seems to be only instance where this crept in. Fixed now

-- 
~Vinod
