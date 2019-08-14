Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3FF18CC05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 08:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbfHNGju (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 02:39:50 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39687 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfHNGjt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 02:39:49 -0400
Received: by mail-pl1-f196.google.com with SMTP id z3so3483023pln.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2019 23:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zf2wWfWQLgw3B0oEm2vP6fzK7dosG6tj+enF0TYXPfM=;
        b=ltuDIE+hqKfTuUTwmx+nnGg/v57zoNSyfiFh6MFLchdzk6TVcvtRTkWLMPAIXM2tR2
         qNXN1dqrSveF1Eh3SB2at2bMSjZ19YO9Dl8CPrEAcuvjyYhgb8Yl1+0p1OpYSoc0FjII
         fzi5siYXQ8dVO1TaCs1OdcdkchCUdxwFBdt+r5j7LB2u9ObyHUm9q7vqWy90Ie6wFagb
         WugWL6RCoeweME2RKCfsaDBaEsVoBHPMeYD71aeIMw6zkyAU4oniPkxXp4VA4U3fBR11
         u4f56QATqDHW9IutKuquROLkYQWv5cJEiWUt1wbAyu3sS853rwyatX/YGeRasCvamWhX
         jeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zf2wWfWQLgw3B0oEm2vP6fzK7dosG6tj+enF0TYXPfM=;
        b=kq9ifou3u6Ne8T96eJVbGJtdRmCNGAvaWfL/jAEbYPLhQ6yrf+k0U+KQsvlQeqlymq
         U2IVuXUKcruWoMYJ43XBa2nwZlrHGR4ntPgpHPi3M1IAZzg9/4E7s8zGrjkJWG3cC6cl
         fAMeNcV8zrDk406drue+l0VwJalnbvzaydBu2rowAXfVCL4UQZPys9b2wEIAxEIjesDH
         Dr8SuaQaa0GX7tpmFoC209PDM7M3/5mst2ncTmCIkSBW4KF5E7cE/izM4lTT2taBT5N2
         o/crz6uqSeJg5lkS1Ko3VN7NIyHuczO7sZto4BOvyHRXldznQ0fVk1W7IFvVwxO4smRQ
         9t8A==
X-Gm-Message-State: APjAAAVaFsshYRJ+kQHYnnv55lj/TLAN8Xxp10bHZiBTY2YlAri2feVJ
        yxi3Ibg+pO/JAwGliXKlFgz+52T2ITg=
X-Google-Smtp-Source: APXvYqx6bOqfSn4UUbxjPl/N5kmhQFUWOoqQ1D6DKJZNEPsRQQV3Nlkoa+FkM1NBt6vZWsq1AtA68w==
X-Received: by 2002:a17:902:b605:: with SMTP id b5mr11964409pls.103.1565764788918;
        Tue, 13 Aug 2019 23:39:48 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f12sm105879470pgo.85.2019.08.13.23.39.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 23:39:48 -0700 (PDT)
Date:   Tue, 13 Aug 2019 23:41:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Govind Singh <govinds@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>
Subject: Re: [v2 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock
 controller bindings
Message-ID: <20190814064126.GV26807@tuxbook-pro>
References: <20190813130946.16448-1-govinds@codeaurora.org>
 <20190813130946.16448-2-govinds@codeaurora.org>
 <CAL_JsqK-GK8arfRu6sqP9UjNrwc0=aUWXymMRF5fQhg+M2TNng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqK-GK8arfRu6sqP9UjNrwc0=aUWXymMRF5fQhg+M2TNng@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 13 Aug 06:43 PDT 2019, Rob Herring wrote:

> On Tue, Aug 13, 2019 at 7:10 AM Govind Singh <govinds@codeaurora.org> wrote:
> >
> > Add devicetree binding for the Q6SSTOP clock controller found in QCS404.
> 
> You need to test this with 'make dt_binding_check' and fix the errors.
> 
> >
> > Signed-off-by: Govind Singh <govinds@codeaurora.org>
> > ---
> >  .../bindings/clock/qcom,q6sstopcc.yaml        | 45 +++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> > new file mode 100644
> > index 000000000000..861e9ba97ca3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> > @@ -0,0 +1,45 @@
> > +# SPDX-License-Identifier: BSD-2-Clause
> 
> GPL-2.0-only OR BSD-2-Clause
> 

Is this a requirement of the devicetree project? Wouldn't the BSD
license alone be sufficient for the type of interoperability that we're
striving for?

Regards,
Bjorn
