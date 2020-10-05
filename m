Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED028283E5A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 20:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbgJESeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 14:34:15 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:2844 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725960AbgJESeP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 14:34:15 -0400
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Mon, 05 Oct 2020 14:34:15 EDT
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Oct 2020 11:28:11 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 05 Oct 2020 11:28:11 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 26E561936; Mon,  5 Oct 2020 11:28:11 -0700 (PDT)
Date:   Mon, 5 Oct 2020 11:28:11 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Anirudh Ghayal <aghayal@codeaurora.org>
Subject: Re: [RESEND PATCH v1 1/2] bindings: pm8941-misc: Add support for
 VBUS detection
Message-ID: <20201005182810.GA31035@codeaurora.org>
References: <cover.1601333246.git.gurus@codeaurora.org>
 <d9f8255a6996596e4fb9dc6404da160d7a4af77f.1601333246.git.gurus@codeaurora.org>
 <160167376992.310579.1594629547444861122@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160167376992.310579.1594629547444861122@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 02, 2020 at 02:22:49PM -0700, Stephen Boyd wrote:
> Quoting Guru Das Srinagesh (2020-09-28 15:49:08)
> > From: Anirudh Ghayal <aghayal@codeaurora.org>
> > 
> > VBUS can be detected via a dedicated PMIC pin. Enable compatible string
> > that adds support for reporting the VBUS status.
> > 
> > Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
> > Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> > ---
> >  Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt | 2 +-
> 
> Can this be converted to YAML?

Sure, will fix this in the next patchset.

> 
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
> > index 35383adb..91a49af 100644
> > --- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
> > +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
> > @@ -8,7 +8,7 @@ PROPERTIES
> >  - compatible:
> >      Usage: required
> >      Value type: <string>
> > -    Definition: Should contain "qcom,pm8941-misc";
> > +    Definition: Should contain "qcom,pm8941-misc" or "qcom,pmd-vbus-det";
> >  
> >  - reg:
> >      Usage: required
> > -- 
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> >
