Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCBD2A4D43
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 18:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgKCRko (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 12:40:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728697AbgKCRko (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 12:40:44 -0500
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E72EC0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 09:40:44 -0800 (PST)
Received: by mail-oo1-xc43.google.com with SMTP id l26so4385248oop.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 09:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b1f7x14StQHkJKjF4lhkVgxJQNr6aZC3WStUMGQmEuI=;
        b=pLzQhx38L2Tyv58tW8h9VQ7XucijukO2HnfAV+puaN6ElN2hwRCuCOUumiGvxSJgMQ
         ktXM3ZpnTgJsJWTUWcYHKfZ/4lMzeWG4/sCo9UkH2bDlLehWcfsKGA0EDN//0mZCuVTe
         Xr87I9IiMypVvrGsxkmNGJefu6TL/XR6wCgv0rXVpdan6hV/9VJow2DbCUzTr7bTFUL4
         vbT9OTm1CUxxaEhBKEn5DYzKSCMtsZR6TE9+gqhByS45x93txBCj14yjb+XvH2mcsr5T
         2tMiwml2Do4vNmc4tKuxL+Wn1pSK9O4v02UwLO6QLjjDB2OBl+YDZFEZ9P5Vyq9U0VyV
         LOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b1f7x14StQHkJKjF4lhkVgxJQNr6aZC3WStUMGQmEuI=;
        b=oBZRPbIC6YXMO2obq4KfCuV+6/Mtqz6VJwVzFzhyvALcX2aJXjDvcepWVoRaSb05ZE
         j3KW7lmU7zcE8HG68GURTl2seBB9IRGzNJZbc3XWPsKDPuGxY0shXhdmbSGjaCPULz5V
         tL3kNHwmN8MHc7mrJV5xTGUSlFHhbfPgpIkyw/tZFz35UTY+VwSBQai7iMoYXtSBX0Zk
         Q0e+lox5hfdUGwHLlo3lrmfvNOnc9hui7hExCybka3AQorbVEg8hNutFYI7uiI7jbyGe
         4r9B6RFKGLrpmVA/gV1iEVLtryqllGeC6wgSK+xFQvuiiHijNdTL4ayeWyWjf33XaQas
         mVeg==
X-Gm-Message-State: AOAM5316DFB2LGv8kXZ5l2hlIavanFaiRIpN9DmOLn3RFxG/8M1TrQxW
        fnjoPu9CNOFhAVrJlEqmTA/9OBq/ptIw+A==
X-Google-Smtp-Source: ABdhPJwZf3epwL2bWWJfFC18L3EIZTkWEJ7jNKhMTRTvUaLMPqlWMP5f3+phy80JsQKPslbdIhKPVQ==
X-Received: by 2002:a4a:ac4f:: with SMTP id q15mr16211328oon.68.1604425243976;
        Tue, 03 Nov 2020 09:40:43 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n128sm4133279oif.4.2020.11.03.09.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 09:40:42 -0800 (PST)
Date:   Tue, 3 Nov 2020 11:40:41 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: remove wakeup-parent for TLMM
 node
Message-ID: <20201103174041.GB65067@builder.lan>
References: <20201027015420.908945-1-dmitry.baryshkov@linaro.org>
 <20201028044056.GA3151@builder.lan>
 <947976df-05c5-bc6d-455f-e71aa061055f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <947976df-05c5-bc6d-455f-e71aa061055f@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 28 Oct 06:52 CDT 2020, Dmitry Baryshkov wrote:

> On 28/10/2020 07:40, Bjorn Andersson wrote:
> > On Mon 26 Oct 20:54 CDT 2020, Dmitry Baryshkov wrote:
> > 
> > > On SM8250 TLMM doesn't use PDC interrupt controller for wakeup events.
> > > Instead it handles them on their own (not implemented yet). In addition
> > > setting wakeup-parent property to &pdc will result in parent hwirq being
> > > set to ~0UL, which interact badly with the irqdomains trimming code. So
> > > remove the wakeup-parent property.
> > > 
> > 
> > Would you accept this patch instead?
> > 
> > https://lore.kernel.org/r/20201028043642.1141723-1-bjorn.andersson@linaro.org
> 
> not found
> 

Seems like the tubes where slow last week, but the link works now.
Please take a look and let me know if this works better for you.

Thanks,
Bjorn
