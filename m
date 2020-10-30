Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E092A11B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Oct 2020 00:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgJ3Xho (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 19:37:44 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:28683 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725446AbgJ3Xho (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 19:37:44 -0400
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 30 Oct 2020 16:37:43 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 30 Oct 2020 16:37:43 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id C20C5199F; Fri, 30 Oct 2020 16:37:42 -0700 (PDT)
Date:   Fri, 30 Oct 2020 16:37:42 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>
Subject: Re: [PATCH v4 2/3] bindings: pm8941-misc: Add support for VBUS
 detection
Message-ID: <20201030233742.GA29492@codeaurora.org>
References: <cover.1603869292.git.gurus@codeaurora.org>
 <6c6bd3601ec8f4c68f581452fca3ef96f2ae94f9.1603869292.git.gurus@codeaurora.org>
 <20201030133612.GB3721479@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030133612.GB3721479@bogus>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 30, 2020 at 08:36:12AM -0500, Rob Herring wrote:
> On Wed, Oct 28, 2020 at 12:18:53AM -0700, Guru Das Srinagesh wrote:
> > Add compatible string that adds support for reporting VBUS detection
> > status that can be detected via a dedicated PMIC pin.
> > 
> > Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
> > Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> > ---
> >  Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> > index e8eea83..15e3749 100644
> > --- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> > +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> > @@ -15,18 +15,23 @@ description: |
> >  
> >  properties:
> >    compatible:
> > +    minItems: 1
> >      items:
> >        - const: qcom,pm8941-misc
> > +      - const: qcom,pmd-vbus-det
> 
> Do you really need another compatible here? Just detect this by having a 
> 2nd interrupt.

Agreed; will drop this bit in the next patchset.

> 
> >  
> >    reg:
> >      maxItems: 1
> >  
> >    interrupts:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> >  
> >    interrupt-names:
> > +    minItems: 1
> >      items:
> >        - const: usb_id
> > +      - const: usb_vbus
> >  
> >  required:
> >    - compatible
> > -- 
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> > 
