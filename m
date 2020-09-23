Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61C5275C97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 17:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgIWP5X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 11:57:23 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:27661 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWP5X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 11:57:23 -0400
X-Greylist: delayed 352 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Sep 2020 11:57:22 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600876641;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=JSXbNGYquAx8XAlxMl9lVOp0vPPS65owIz27C5evBy8=;
        b=WTvSiY3iw+GMT8+Vn7p0WBSWEpjSFlmDn85bWmrfnTjoXTrdM606JHC5DMJZnVA38B
        v+ug4bO0rdtKPqrrebzZgONL3l9uFBkpElO0QRFSjzBX3sqANx75OJMGVziXvO4K4ush
        /jJJYH1m4aSaE+brIIfdnhvojtI/oFZVF/GwrgT/9iocQ/+SwYw96t9aJEs/DCWQpB5d
        N2ulzF2fSDmBFb9QnhEWbLNk1znnzQ+UuaVCLfhdlhvk3GHE+oe9zqRMl+GzkIjONEy8
        geeM/jfezJMkAuD/t8qoPxYEhWAeCtvItLU3cd/y7m5DyINPzcuPEAGpY41mHLeOBwjA
        KBtg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IcjDBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8NFpRcfQ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 23 Sep 2020 17:51:27 +0200 (CEST)
Date:   Wed, 23 Sep 2020 17:51:15 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 05/10] dt-bindings: remoteproc: qcom,q6v5: Deprecate
 regulators for PDs
Message-ID: <20200923155018.GA87584@gerhold.net>
References: <20200916104135.25085-1-stephan@gerhold.net>
 <20200916104135.25085-6-stephan@gerhold.net>
 <20200923153548.GA789614@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923153548.GA789614@bogus>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 23, 2020 at 09:35:48AM -0600, Rob Herring wrote:
> On Wed, Sep 16, 2020 at 12:41:30PM +0200, Stephan Gerhold wrote:
> > Newer platforms vote for necessary power domains through the power
> > domain subsystem. For historical reasons older platforms like MSM8916
> > or MSM8974 still control these as regulators.
> 
> Do you plan to change these platforms? If not then I wouldn't really 
> call this deprecated.
> 

Yes, MSM8916 is changed as part of this patch series.

It should also be done for MSM8974, but because I don't have any test
devices with it I'm not able to do it myself.

Actually the old binding likely works only because of other side effects
(other drivers voting for the same resources), so I personally I would
definitely call it deprecated.

Thanks!
Stephan
