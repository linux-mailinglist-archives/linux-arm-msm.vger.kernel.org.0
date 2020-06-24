Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B3F206DCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 09:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389776AbgFXHcL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 03:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389642AbgFXHcL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 03:32:11 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F14C061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 00:32:11 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id n2so696053pld.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 00:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XiffTKYWfkRx2OuMiP/252mjsVT01Skep/qWi8vbGWk=;
        b=Ope4PDxZMKqo33DrekdQIdllBSDMkIlNiHCxw3yYG5stm7pwHar0QsGYxUv1ivqW1Z
         SRN16VM0aa5Mc9iKJyZnIz0LvX4yjs+p4eJ3aQeOtnZOvdchEvfZpHiutoDpAlcQwMug
         OSmVWqM98/0yw7XUkxvFRykp2Q2gCAgkNvEe7k+WplncMKqzuaatAWOXW+/8cGV1DBRP
         LjeBl/8cO8V89B5ICJpFG3VSGMgKkIIAuiJ3yfS5KGpv9inZK1+xFpgLIUzbieNES2lS
         NXgVHWc7cn5EjOaUNf3CDQumo78W0+VhABf/oM3A5Fb7M4cME54HpW8KUiEGo4oeauq3
         jMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XiffTKYWfkRx2OuMiP/252mjsVT01Skep/qWi8vbGWk=;
        b=rpqnmSCxYFLiIg4ub6rjIpSlROKzYPvP8AncnNPtdVsA8SHVJJdg0SNyPMLWveAEfx
         C5H9XpNUu4+Q6YtOKI3R/dwaK92g7WLAg9Yo79kLZG3Nfz1ErwTkk88UB30mBLfuRvGE
         FYXQbSBxmMCRIVg9fUknzOz2cBujycuIKpOcxDKYxQ8PTTAtttgeq/mgUkUz9PLKNeZ8
         9fKGFr3d/63ksum0OHxgg+8MoXZBx+Dsys+RN3EmJfg9rGW3Dh3psI9EHcfVEealIO0J
         aGOHKkumaeyjPsXRINR7d9mdZ1lcIcGGkr3R4KlUEI4zUuXZfp87+u4qC4H4iq/Cfx5a
         EuuQ==
X-Gm-Message-State: AOAM532EW7MZLPkLSoVbsNkRD3lsBHrWY7b+IaZd+sgF86ZJz6199eHS
        yf1pls0lULNgLliOW6ENL88VlA==
X-Google-Smtp-Source: ABdhPJzmmQR87baMbd/6VHklCBu0rFXvmKlmotKOEGTSQbtK8VLZjuez9jqsDKFhQIepFUxhRZLPwQ==
X-Received: by 2002:a17:90a:5c82:: with SMTP id r2mr16853142pji.161.1592983930591;
        Wed, 24 Jun 2020 00:32:10 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g21sm18765157pfh.134.2020.06.24.00.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 00:32:09 -0700 (PDT)
Date:   Wed, 24 Jun 2020 00:29:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/12] arm64: dts: qcom: msm8994: Add SCM node
Message-ID: <20200624072927.GT128451@builder.lan>
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-7-konradybcio@gmail.com>
 <20200623231919.GL128451@builder.lan>
 <CAMS8qEXeFO0vNKHoJeDKKprdECFLVtXOWnphc6iRjOBigeFe1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMS8qEXeFO0vNKHoJeDKKprdECFLVtXOWnphc6iRjOBigeFe1Q@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 23 Jun 16:30 PDT 2020, Konrad Dybcio wrote:

> >Shouldn't this be "qcom,scm-msm8992", "qcom,scm" ?
> >
> >(Or rather "qcom,scm-msm8994", "qcom,scm")
> 
> Some DTs only have the SoC-specific one, and some also
> have the generic one. But I can add the generic one if
> you wish.
> 
> I went with 8992, as I added it in the 8992 series
> (gonna update that one soon, too, so we can get it merged)
> and I didn't want to needlessly duplicate it. Ideally maybe we
> could switch to just qcom,scm for clockless SCM compats?
> 

It's fairly common practice to specify both a specific and a generic
compatible, this would allow us to in the driver do special handling of
the specific in the future if we need to - without having to update the
devicetree.

Regards,
Bjorn
