Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0EA846EA8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2019 09:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbfFOHGo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Jun 2019 03:06:44 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38494 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfFOHGo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Jun 2019 03:06:44 -0400
Received: by mail-pl1-f193.google.com with SMTP id f97so1929854plb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Jun 2019 00:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nxfStrkoZ2f5uEaotGyNxBrt2oeXGj2yoJPwauA88HM=;
        b=BQljxYEsUcWx6IMUJWs3lt9f4P2pNVaKin9m6xUqR9H9LNqOdMLDtclGLYX11b74io
         /xFEGeBJUthHOtnhoFu6naZs+pQbH2gprvEvYfgRxH1hJLMfXIrliNCKf2aBfrL4enuO
         7Jv7couBfgBKbghqyfQquAUp2sor9PX1xt9xuNXyiM07hJTt6cWmghGQgeWoq8ZpGQf8
         FpuXUGUnhT9PI2i6c89dZ6NAn/sNJU2eMwtAcXD7mNiXaJfr/8yTjQfGJExcfmCscggp
         pdz6hm4bizPtTC3WfYTyvqGNMdfT2/aNGpADPBNdFn6bwXUK/xdRBDhURgEaIVYh2244
         5UFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nxfStrkoZ2f5uEaotGyNxBrt2oeXGj2yoJPwauA88HM=;
        b=oiZQul55PL+ExGE4SZWpXkc3Cw7ue7HvNLX8sHLMnwfVSe4mCa/PKMYbIgJsCwGcdp
         /8k4jh1HjCHlY4b6z6nkYAcXud8dSsHgB8RjKxTJS4prZqc2krbz4uZ0dpWMtlKRjHv2
         n7HGTp3C4aPAFns80qn5YgRz6xRTJbZEHgiO7uEZZIOikEesAiCY5i8t9clfOqWATZwv
         Fx+OzwXSWL93nEwpwDPcZyoqKXC3K7J+h97o+2Bq8PZ/rUc8oe2U1y3UWuFOxyAJPxXl
         v2iMu014vPJMFYUW2RLGjymEiNpeC1+JpfA77kgBMoPpK18Up8IQiseHodehAJK+vX/o
         c80A==
X-Gm-Message-State: APjAAAVVwlWEeU67r8jPAp3ftNdUlfWxCJeAghtRfYzb2qbP/c/2PUDA
        ImCWPT6PrwFX/z8HIXTB11ZzNg==
X-Google-Smtp-Source: APXvYqwRyuDbMyXOtqz9wjhQN4oYSmEs4Kbc4rLpIiSEpz/Xzcy8mvo3twNZXhAZt/2ICZStoevA0w==
X-Received: by 2002:a17:902:29a7:: with SMTP id h36mr45551825plb.158.1560582403432;
        Sat, 15 Jun 2019 00:06:43 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p2sm7963869pfb.118.2019.06.15.00.06.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 15 Jun 2019 00:06:42 -0700 (PDT)
Date:   Sat, 15 Jun 2019 00:07:29 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: apr: Don't use reg for domain id
Message-ID: <20190615070729.GB31088@tuxbook-pro>
References: <20190523150153.13136-1-bjorn.andersson@linaro.org>
 <20190614165724.GA3083@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614165724.GA3083@bogus>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 14 Jun 09:57 PDT 2019, Rob Herring wrote:

> On Thu, 23 May 2019 08:01:53 -0700, Bjorn Andersson wrote:
> > The reg property represents the address and size on the bus that a
> > device lives, but for APR the parent is a rpmsg bus, which does not have
> > numerical addresses. Simply defining #address/#size-cells to 1 and 0,
> > respectively, to silence the compiler is not an appropriate solution.
> > 
> > Replace the use of "reg" with an APR specific property.
> > 
> > Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v1:
> > - Fixed example to match change
> > 
> >  Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt | 6 +++---
> >  drivers/soc/qcom/apr.c                                  | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks Rob, patch applied.

Regards,
Bjorn
