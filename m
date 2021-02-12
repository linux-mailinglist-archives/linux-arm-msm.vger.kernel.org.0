Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D3031993A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 05:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhBLEic (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 23:38:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:36194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhBLEi2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 23:38:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2522964E6B;
        Fri, 12 Feb 2021 04:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613104668;
        bh=4De3mzBZ+mqAwyW0Wsfgk0cGyXtUPIYJ8BazedKSyq0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lfH94CfbcfbOVPkrbhfRmwNXExIR3Q0ExwWk4qI23kNJXIVGzztqqSU56d6NAKKGt
         5JZQSqxf7O/XtjubHfsXSfxuab/286gEngC6VWWtQ12zQL5+K6VtW0gng3ci+bfrkC
         OYz0b8hDgrq9Zg0k4mYXcZvDuUKDf3Scsw0esQ7raXZ92g/KqnJhR3Yn9czfjOSQeC
         C5dFRSw9OMSCCQ3sbLLZDPVQ5SgAO4ZCZIwXANMkbFzC1EY5nJM5cQUChDm+/yx4tU
         UeTGEnHB7IiJmrRE7orD71SyTgv4C6oCN1CM5a2ZD+kJkJflTN9A7l4nZr+JXGPB2J
         CO3F8x7QCExTA==
Date:   Fri, 12 Feb 2021 10:07:44 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: pas: Add SM8350
 remoteprocs
Message-ID: <20210212043744.GL2774@vkoul-mobl.Dlink>
References: <20210210104539.340349-1-vkoul@kernel.org>
 <YCV80dfkxXEPBveo@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCV80dfkxXEPBveo@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-02-21, 12:52, Bjorn Andersson wrote:
> On Wed 10 Feb 04:45 CST 2021, Vinod Koul wrote:
> 
> > Add the SM8350 audio, compute, modem and sensor remoteprocs to the PAS
> > DT binding.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  .../devicetree/bindings/remoteproc/qcom,adsp.txt     | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> > index 54737024da20..41eaa2466aab 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> > @@ -25,6 +25,10 @@ on the Qualcomm ADSP Hexagon core.
> >  		    "qcom,sm8250-adsp-pas"
> >  		    "qcom,sm8250-cdsp-pas"
> >  		    "qcom,sm8250-slpi-pas"
> > +		    "qcom,sm8350-adsp-pas"
> > +		    "qcom,sm8350-cdsp-pas"
> > +		    "qcom,sm8350-slpi-pas"
> > +		    "qcom,sm8350-mpss-pas"
> >  
> >  - interrupts-extended:
> >  	Usage: required
> > @@ -51,10 +55,14 @@ on the Qualcomm ADSP Hexagon core.
> >  	qcom,sm8250-adsp-pas:
> >  	qcom,sm8250-cdsp-pas:
> >  	qcom,sm8250-slpi-pas:
> > +	qcom,sm8350-adsp-pas:
> > +	qcom,sm8350-cdsp-pas:
> > +	qcom,sm8350-slpi-pas:
> >  		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
> >  	qcom,qcs404-wcss-pas:
> >  	qcom,sc7180-mpss-pas:
> >  	qcom,sm8150-mpss-pas:
> > +	qcom,sm8350-mpss-pas:
> >  		    must be "wdog", "fatal", "ready", "handover", "stop-ack",
> >  		    "shutdown-ack"
> >  
> > @@ -113,14 +121,18 @@ on the Qualcomm ADSP Hexagon core.
> >  	qcom,sdm845-cdsp-pas:
> >  	qcom,sm8150-adsp-pas:
> >  	qcom,sm8150-cdsp-pas:
> > +	qcom,sm8250-cdsp-pas:
> 
> This should be sm8350, I fixed this up and applied the patch.

Sorry for missing this and thanks for fixing it up

-- 
~Vinod
