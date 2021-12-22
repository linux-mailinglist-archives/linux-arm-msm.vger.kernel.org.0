Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED3047CF0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 10:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236355AbhLVJTR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Dec 2021 04:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243833AbhLVJTQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Dec 2021 04:19:16 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5EEC06173F
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 01:19:16 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id s15so1833336pfk.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 01:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IdSO8jSbku57GoEt6LVkQ1tixUnyu5ct/xRZpyTqiy0=;
        b=fJgbtLjUAOl3BxZ00Vjl5kqR+2lxh6O+5WD6Nb7XDaHvwoeyaIUF8fPAU4q22E701P
         Z+rjGiMN6u2i7IMttMjc5v22KcSIxHt9kPDdjurufp3Ki1K8LCNQTjqlQQgx9B2bO5SI
         +IBPuD72WzA4C9LMnQDgvPIgFn2BDdb0nnGuKa+O4H/xqxpd8JMLyTVXjbEj1Gd/ILx+
         b3pYp3VcZYTkaK4Gu/4zCzakK6iM0IcNn+QoCq+VIHp7wC+T4k/rx0CV5t+zriTfvLs/
         ZZZo/nZkW/UN7b9+lGRFaqpa0DZmPws91J3j+Nbz1cKJwNhhrczSTi/KMJ4oQ4yOLGsr
         1pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IdSO8jSbku57GoEt6LVkQ1tixUnyu5ct/xRZpyTqiy0=;
        b=2+9VCLRLoqzpJowWtJ15ErZYhPciNV9k3JxdWafVO+QmHhAPzldUeOV+LOsn1rgMLq
         mis3IaU2LxhlN+4esVdUZfdWWT/bq0QN0g+exEsa1uums6RNZKoDLtk1+0P3+Hxu0SuC
         CoV2mTGXuIQbJ2RXP5eYNw9nULlSCYNmHhUtuSPhiSB33tAvsZtM9OqtxDfljZ8P66wK
         SprzpcaaDPO3rsmHzEuLRLyAFZdMjcWaB2T3fj9bl0uxOI5yaGVGF4HT/7OFNnbGbPtR
         nekXEANO2li6UI290TY3QQ0qqMzot8VMa0JpWBquRs400QywLwHtn7XbCadtQKnSEaO3
         RkFw==
X-Gm-Message-State: AOAM5330J+P6xzONezlfZhaSOKrRaYTIRG103p8MEedYlSFn7crrQ2Do
        S7dORjZpOa4aVDlktpxh03uH1zcWLu7D
X-Google-Smtp-Source: ABdhPJwV2yZYiWQh6AAhTL56gld2ZPjl8HqiRaRi6S4Xir+hBVSg6tEif1XsJNuPDQhcKv8VkcFzIg==
X-Received: by 2002:a05:6a00:a1d:b0:4ba:ac85:5b07 with SMTP id p29-20020a056a000a1d00b004baac855b07mr2343668pfh.9.1640164755963;
        Wed, 22 Dec 2021 01:19:15 -0800 (PST)
Received: from thinkpad ([202.21.42.200])
        by smtp.gmail.com with ESMTPSA id mw8sm1680513pjb.42.2021.12.22.01.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 01:19:15 -0800 (PST)
Date:   Wed, 22 Dec 2021 14:49:10 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Subject: Re: Question about node naming in [PATCH v3 13/18] ARM: dts: qcom:
 sdx55: Add spmi node
Message-ID: <20211222091910.GA5159@thinkpad>
References: <HTKF4R.5S1PY4MCM4QS@ixit.cz>
 <20211221071219.GD26872@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221071219.GD26872@thinkpad>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 21, 2021 at 12:42:25PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Dec 20, 2021 at 09:27:17PM +0100, David Heidelberg wrote:
> > Hello Manivannan,
> > 
> > I'd like to ask, if you had any particular reason to name node `qcom,spmi@`
> > instead of basic `spmi@`.
> > 
> 
> "spmi" node label was not documented by devicetree spec at that time. So I was
> using "qcom,spmi" but it was not correct either.
> 
> I've submitted a PR now to devicetree-spec repo [1] for listing it as the
> generic node name. So once it got accepted, we can use "spmi@" for the node
> name.
> 

PR is merged now. So you can proceed with using "spmi" node name in all dts.

Thanks,
Mani

> Thanks,
> Mani
> 
> [1] https://github.com/devicetree-org/devicetree-specification/pull/50
> 
> > I'm currently converting binding for
> > Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb and I'm
> > considering adding qcom,spmi into qcom,spmi-pmic-arb or just rename this and
> > arch/arm64/boot/dts/qcom/msm8996.dtsi `qcom,spmi@` occurences to `spmi@`.
> > 
> > Ideas, inputs?
> > 
> > Thank you
> > David
> > 
> > 
