Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC238870BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 06:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfHIEo6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Aug 2019 00:44:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:53278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725811AbfHIEo6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Aug 2019 00:44:58 -0400
Received: from localhost (unknown [122.167.65.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2CD62171F;
        Fri,  9 Aug 2019 04:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565325897;
        bh=wx35CGCBu19AAI9ovQr+RZzEgQxYOVtOczu1UFuEmr4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mSggko1Rm8xseCKNc6Mjrq/AfV+AyaGR/l3ChzIbw5G13JdrqvSILIrjhlEsAHSCv
         kYFrrisU6I/F2i4+B4WefztYKtFLWzmTB1vmSnzo4INV4t+TAII91U6rjuAhUv+hKe
         ZjjI7coiXK/6HS5smqbQOm22MkeddrV+bfY0I/Y0=
Date:   Fri, 9 Aug 2019 10:13:45 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] regulator: dt-bindings: Add PM8150x compatibles
Message-ID: <20190809044345.GD12733@vkoul-mobl.Dlink>
References: <20190808093343.5600-1-vkoul@kernel.org>
 <20190809032915.GK26807@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809032915.GK26807@tuxbook-pro>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-08-19, 20:29, Bjorn Andersson wrote:
> On Thu 08 Aug 02:33 PDT 2019, Vinod Koul wrote:
> 
> > Add PM8150, PM8150L and PM8009 compatibles for these PMICs found
> > in some Qualcomm platforms.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> > index 14d2eee96b3d..1a9cab50503a 100644
> > --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> > +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> > @@ -25,6 +25,9 @@ Supported regulator node names:
> >  	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
> >  	PMI8998:	bob
> >  	PM8005:		smps1 - smps4
> > +	PM8150:		smps1 - smps10, ldo1 - ldo18
> > +	PM8150L:	smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
> > +	PM8009:		smps1 - smps2, ld01 - ldo7
> 
> Please maintain the sort order.

Ah yes, Mark has applied the patch, I will send a sort order patch. Even
in previous entries, PM8005 should be the first one..

> 
> Apart from that
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks for the review.

-- 
~Vinod
