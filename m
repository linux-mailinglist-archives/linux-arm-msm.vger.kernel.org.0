Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2215F3488C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 07:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCYGIl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 02:08:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:52580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229461AbhCYGI2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 02:08:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0490761A1E;
        Thu, 25 Mar 2021 06:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616652507;
        bh=50XHICVED2w0OW9kAp/7/1VgbR+doRNa3zBU6nckmQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JV+74+jd5KF87nLnt/1vq9jBMuxGUFf1ykdCuuDkVgN+OMviJaJtgUb/hgk19G3Xw
         3N8MPm3eBpMGKG+UTTqQWT536Lngxtp4RxRYnvfkRrawuFQhN72/9zzKu7yOzvauJ5
         SD9NXkvIjQSzGAvnk2Uzv4mB7D11apv0naOB9IYtudXcE5+NHZQJtPs/+/FCVipoZL
         aTGoqj2XiL0TIg3T1S8Q1N21TsISc5B99zJ2jSRqkL3qJhdJCyVwdS2uIGfa1haqua
         8HymMgTQbtxo2HlpwCofsFeSRcUKx1xeEcHupwaX8G6aggeURGjcaheVgfpxM5y0g3
         ioDIGL0fTXr5A==
Date:   Thu, 25 Mar 2021 11:38:24 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: Add compatible for SM8350 IPCC
Message-ID: <YFwo2FrCMYJ4AhCs@vkoul-mobl.Dlink>
References: <20210312051203.3555751-1-vkoul@kernel.org>
 <YEukrpG06PBdgGAF@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEukrpG06PBdgGAF@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-03-21, 11:28, Bjorn Andersson wrote:
> On Thu 11 Mar 23:12 CST 2021, Vinod Koul wrote:
> 
> Adding Jassi as recipient. Please let Vinod know if you want him to
> resend this patch to you. (I send a patch for MAINTAINERS yesterday)

Jassi, should I resend or you can pick from lore?
> 
> > Add the compatible string for SM8350 IPCC block on this SoC
> > 
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn
> 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> > index 168beeb7e9f7..fe17ba9b84f2 100644
> > --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> > +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> > @@ -25,6 +25,7 @@ properties:
> >      items:
> >        - enum:
> >            - qcom,sm8250-ipcc
> > +          - qcom,sm8350-ipcc
> >        - const: qcom,ipcc
> >  
> >    reg:
> > -- 
> > 2.26.2
> > 

-- 
~Vinod
