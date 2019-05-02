Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8011245A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2019 23:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbfEBVxX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 May 2019 17:53:23 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37567 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfEBVxX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 May 2019 17:53:23 -0400
Received: by mail-pl1-f193.google.com with SMTP id z8so1653516pln.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 May 2019 14:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w1vsym+VrXUxu888VKEyKh7DbIh+ZlKwFQEO91uyHdc=;
        b=A2A9WvXYhkcaBkcIkEAggIKlHg32R8b6KF7wpp5n72GYve865rahjnN2fnLvRNW1LF
         oOr5KVDihyt907dHmjRJoeCmCK5Rc6iSoxs20BUoah0X0eI6qsUM9CfJaA518dq4nBwk
         BILKBNDtEbKGGwUGTs2r+EX2dEANJcnh3Des+ICthGQE0e6rTWcITAoBjn+zk0AF7W/s
         ETh1yOiWE67xijXeLuWZqWEUnwz6lljmaI/Pc3w1fBi+ho5Ggwq8H+eb92kBojFD1eIx
         hcIVBiqOjxPL6KlQ1GsmSi/JWuY7Aa0ge6HNPFp3YiVpeRxryi/JOHOZEG2C3gIStth+
         qnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w1vsym+VrXUxu888VKEyKh7DbIh+ZlKwFQEO91uyHdc=;
        b=Ymt+5zIhrYEgBvrmBgvUJKslrC7ALpmQiHBOeoFaM7xi7N7DdSmeaFg9XSBgSANYp2
         QTKfeyFVHcPifLYh2CZDwhbW8LhdNKMXrvVHZOwwU2GLGzFXz9BaEFWTtfGEPE+KYZvD
         AQ2PMoJfDky4BxCsRSwkPLdGyHt5thrVgVaj8hnGuY6bbXfeX7A2nMsPLFgGoZssI+5Q
         HXdLkwIjkFs/DCrp1aJAKML5YZcvOyOJ9q9AWUcd77LrdbbcK5pYy0d1O5uXpn0JBgCk
         9/l5qw+xSruGaPKemkjEYXIMy2dYHFM+IL+e78/iYH0tIQ7TXYaDf+r56zNi5Z0EwBLN
         VS0g==
X-Gm-Message-State: APjAAAU/vV2p+Oep/QyfAR/qQ83H4rTbeN61f+w4MhzfCsJYzvIsAF9r
        CCJiJD4/pEvSZsLMrswTiLH/hA==
X-Google-Smtp-Source: APXvYqy+enSbXuQz67CEldD74kAcDAwxSOBbFgkGIKktekOuxt/YWsxjqhlUreQE4XQt84FT2jV0QA==
X-Received: by 2002:a17:902:5c5:: with SMTP id f63mr6014865plf.327.1556834002723;
        Thu, 02 May 2019 14:53:22 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j22sm159179pfi.139.2019.05.02.14.53.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 14:53:21 -0700 (PDT)
Date:   Thu, 2 May 2019 14:53:19 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: gcc-qcs404: Add PCIe resets
Message-ID: <20190502215319.GG31438@minitux>
References: <20190502002138.10646-1-bjorn.andersson@linaro.org>
 <ecc6a7fb-14a8-3314-d376-433c9f98b692@free.fr>
 <20190502112024.GA18333@centauri>
 <155682982590.200842.4482547017911714715@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155682982590.200842.4482547017911714715@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 02 May 13:43 PDT 2019, Stephen Boyd wrote:

> Quoting Niklas Cassel (2019-05-02 04:20:24)
> > On Thu, May 02, 2019 at 12:53:33PM +0200, Marc Gonzalez wrote:
> > > On 02/05/2019 02:21, Bjorn Andersson wrote:
> > > 
> > > > diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt-bindings/clock/qcom,gcc-qcs404.h
> > > > index 454b3f43f538..5959399fed2e 100644
> > > > --- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
> > > > +++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
> > > > @@ -166,5 +166,12 @@
> > > >  #define GCC_PCIEPHY_0_PHY_BCR                              12
> > > >  #define GCC_EMAC_BCR                                       13
> > > >  #define GCC_CDSP_RESTART                           14
> > > > +#define GCC_PCIE_0_AXI_MASTER_STICKY_ARES          14
> > > 
> > > Seems weird that there would be two names for the same entry at index 14?
> > 
> > Changes since v2:
> > - Rebased patch
> > 
> > The proper tag in the subject should have been [PATCH v2].
> > 
> > This is most likely an issue caused by the rebase.
> > 
> 
> Please resend then.
> 

Yeah, I screwed up the rebase. v4 is coming.

Thanks Marc,
Bjorn
