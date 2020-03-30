Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C08061987DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 01:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbgC3XKi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 19:10:38 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:39452 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgC3XKi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 19:10:38 -0400
Received: by mail-il1-f194.google.com with SMTP id r5so17612122ilq.6;
        Mon, 30 Mar 2020 16:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wMjPI/yKnzx8ZMDThBLvU02BMUS49h8m8pE+Plt4TKQ=;
        b=n+RqRSub53/uR57yrWT1VP0iQvGH13Qn7uvTO7HZt4npKBL0wOSKwLbEjp4jcKUDQi
         TTwZxSRqRZbscWGeUZG1q7af/4lH5XAg/UGXTASql4ipPXjr3uoFeN5IsQSn8iCyNysa
         noeDVi2D6K1q0ThqCuwV5zBrnYzd+lx3sYGrTJZ+dPqlNtY2HEzm1Mhq8jgTmqZ/02+a
         XBHjQolntBOIEudPA/Aatq6uq2ckBuen4+SqhG+rd9tioTFma1T4diFvA3dmlT67Ktnz
         hiEIJ9x8Vy8UhK0tv/xSrtG7N7Ck/kSxzjcQ25h4apckBB+AW7TVwjvcRU/W1djWmQY8
         eg/g==
X-Gm-Message-State: ANhLgQ1Z0sG8tt16ox8Qg74ltE5tnw15HKF9u+VfWAIuKJiVGa6p2lDy
        pV6Pfqgy0vnnvWxSTk89OQ==
X-Google-Smtp-Source: ADFU+vvNWYK99dPlPx1tH5tSkAkRlbi7ycuFHhKOo8RHSuWD6/khgAo9a9iHkP/WdAVAeNcl7HZ98w==
X-Received: by 2002:a92:8fdd:: with SMTP id r90mr13516679ilk.29.1585609837170;
        Mon, 30 Mar 2020 16:10:37 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k1sm4532088iob.48.2020.03.30.16.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 16:10:36 -0700 (PDT)
Received: (nullmailer pid 2557 invoked by uid 1000);
        Mon, 30 Mar 2020 23:10:35 -0000
Date:   Mon, 30 Mar 2020 17:10:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/4] clk: qcom: mmcc-msm8996: Properly describe GPU_GX
 gdsc
Message-ID: <20200330231035.GA326@bogus>
References: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
 <20200319053902.3415984-3-bjorn.andersson@linaro.org>
 <158474710844.125146.15515925711513283888@swboyd.mtv.corp.google.com>
 <20200321051612.GA5063@builder>
 <158481619279.125146.6917548675896981321@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158481619279.125146.6917548675896981321@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Mar 21, 2020 at 11:43:12AM -0700, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2020-03-20 22:16:12)
> > On Fri 20 Mar 16:31 PDT 2020, Stephen Boyd wrote:
> > 
> > > Quoting Bjorn Andersson (2020-03-18 22:39:00)
> > > > diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> > > > index 85518494ce43..65d9aa790581 100644
> > > > --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> > > > +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> > > > @@ -67,6 +67,10 @@ properties:
> > > >      description:
> > > >         Protected clock specifier list as per common clock binding
> > > >  
> > > > +  vdd_gfx-supply:
> > > 
> > > Why not vdd-gfx-supply? What's with the underscore?
> > > 
> > 
> > The pad is named "VDD_GFX" in the datasheet and the schematics. I see
> > that we've started y/_/-/ in some of the newly added bindings, would you
> > prefer I follow this?
> 
> If the datasheet has this then I guess it's fine. I'll wait for Rob to
> ack.

vddgfx or vdd-gfx.

Rob

