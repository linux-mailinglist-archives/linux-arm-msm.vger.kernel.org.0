Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD8B218DDF5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2020 06:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbgCUFQS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Mar 2020 01:16:18 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42448 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbgCUFQR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Mar 2020 01:16:17 -0400
Received: by mail-pg1-f194.google.com with SMTP id h8so4132604pgs.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2020 22:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XNi67lxb8U8NV5u7Vn404GtWj+hZ0U+9yVzYkz6He6c=;
        b=jq8uYH4KlVRzXv1z55n7X7m51bZgjDN7PaeFcN5NkEvGni89YjKSeIk1kY1qugZ2EW
         A2oUo07JhAZvwb6/Awi0TCpenPbNi8CujHTpna1iApfqArhDl0pHhWMY/zX20I+ZTfMV
         wYGuRj0e+22DUP2xtisJw0EabKIUIZ90TprLg087ujThJ0CTRoxsqE2/tNrzcEzT3SLw
         naQSXNKV23pdQ5DBrd+B64G5uOajpwStBJOPChgD7/VDf4jb1bbbZ8k+gFFFVnlv/mlY
         6R8BcXlqX8wcYF0H4m7kpMAD4q4jZcg4zM+6vHjBScFw8RLaVTvdzN+5RkZAoGwqBPbc
         9N4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XNi67lxb8U8NV5u7Vn404GtWj+hZ0U+9yVzYkz6He6c=;
        b=dlLqq8VDYkDMhaUh3a703TqLfpjBoRgxTo1gFdWdazitqyLZuPr3J+JNcAnP8M6VL2
         3brl99QGAmM/ZVg455jgkhuoGelUsKotM0XmzgQA5peE5jqq3cO9C7de0Kg0TD4Bpa+W
         MvxHmd9uuneoJet71uUFYH+MS9NGzUVxPHJqDajwePxI5+hi/mq1xaEfIt78kzDcynOM
         348EUqorEq17hdKuBJNdDzH03Lj72yjLKOg+R4VsoOOsyfxoScwloQfYEiS6u+Oir4rR
         R68yKMKkKvwBu6LSKIuLeDok07ihtjj5erVuVienVkl3+2PqtbpVfV50hbF7WFraUByO
         4GmA==
X-Gm-Message-State: ANhLgQ31Iigho3f2ZaGmz1/dk4XTtFMwLQ4Iqq0V8tCafq0YzyEMrtlk
        7wsp0E0TD0+DjPn1btaUGjAq/g==
X-Google-Smtp-Source: ADFU+vs2kNydDTd3Wn+dEAvpwU9bUvPxix2ypzpJD/vmL+TvIzEbcNGfc+1iSt2ank04tWaOQaCaVQ==
X-Received: by 2002:a63:18b:: with SMTP id 133mr2609937pgb.422.1584767775753;
        Fri, 20 Mar 2020 22:16:15 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i11sm6170637pje.30.2020.03.20.22.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 22:16:15 -0700 (PDT)
Date:   Fri, 20 Mar 2020 22:16:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/4] clk: qcom: mmcc-msm8996: Properly describe GPU_GX
 gdsc
Message-ID: <20200321051612.GA5063@builder>
References: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
 <20200319053902.3415984-3-bjorn.andersson@linaro.org>
 <158474710844.125146.15515925711513283888@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158474710844.125146.15515925711513283888@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 20 Mar 16:31 PDT 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2020-03-18 22:39:00)
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> > index 85518494ce43..65d9aa790581 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> > @@ -67,6 +67,10 @@ properties:
> >      description:
> >         Protected clock specifier list as per common clock binding
> >  
> > +  vdd_gfx-supply:
> 
> Why not vdd-gfx-supply? What's with the underscore?
> 

The pad is named "VDD_GFX" in the datasheet and the schematics. I see
that we've started y/_/-/ in some of the newly added bindings, would you
prefer I follow this?

Regards,
Bjorn

> > +    description:
> > +      Regulator supply for the GPU_GX GDSC
> > +
> >  required:
> >    - compatible
> >    - reg
