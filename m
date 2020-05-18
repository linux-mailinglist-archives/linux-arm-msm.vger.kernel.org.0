Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B121D8B0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 00:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728375AbgERWhB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 18:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728372AbgERWhA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 18:37:00 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83BA5C05BD0A
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 15:37:00 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t11so5496614pgg.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 15:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X67f6N/TB7/lmzTe8rOyg+PekxRmdn/lrnG7IaiK4Ik=;
        b=nAVHFKWUbfBnlT6fSExrrp8Vwi0yApBLMl38HX8egS5c7xDNaQkhsaHsv8k/yLhoNK
         onEufHENr57Vb2Uv85JpMb+nJYWovbjbOn0s3z+klub5Etn641hjl1/0hUqm0325p9Sc
         pfxfQ0dohgF8+3FM03a4I1ZA0X9JzNvf7n8y//ExsRPJfQZ7lrOCEEtH4jmOnK3rq6oJ
         y82T0aXWdXmYL6FmBkV1xP0fWZfKc6QTP9CY9pL0eyTSHdyQ5vVH80/3mj2xmh/v4om8
         3+4uuztUrJRSnYX9hs3BIw6/GkH1fUJAAYrM40cGgIGPAe0BePeZPPNb6w4GUvVAE8fw
         Gj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X67f6N/TB7/lmzTe8rOyg+PekxRmdn/lrnG7IaiK4Ik=;
        b=P0OQcokbldlEtZxkadNe65ffDrsczhXejlHGqIoLI7BTnumbbZP4BM7qN5sVKaWUp7
         lgZO2V4k8ekfsuENAlgsXR6e4XreFZWpS/1VSy6iCAaCS1rnMs6U2J7FBeFVBQjzTv2u
         7d8ABEbuT3GnVt391PN4FghYm851EGaCcpI7ymzd5mfYhBOcOOGr+N6Fkc+0zSqy+8a7
         cGfZbt0HeimOzweOzNM3mjfp5lzhnjcoRHDKjjcAt5Is7S2q6SVClRwk1H3OPwFo3yKb
         wjjyX4D3ajsJk9zpEv2KcjEEQhqqsfBFMDUKP8jdu0AqG1O//DP4Fvk2BLNIbrpkGHpA
         G6rQ==
X-Gm-Message-State: AOAM5328z09UcSx9voQHfnrfTEDiDxhEiZGolaJoOzhJXvRZGBjm07ml
        v7WxdPsn4kH5SXwP08TIkxLGug==
X-Google-Smtp-Source: ABdhPJxxmRJRzjqlDQUZoLrEMr+A2g4VH7fKXkn6ymAdxYa5w9ZqWt3+q0XntcXhA1ZpW3IBQp3MLQ==
X-Received: by 2002:a63:77c6:: with SMTP id s189mr16717156pgc.267.1589841419904;
        Mon, 18 May 2020 15:36:59 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o190sm9600752pfb.178.2020.05.18.15.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 15:36:59 -0700 (PDT)
Date:   Mon, 18 May 2020 15:35:36 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Support ETMv4 power
 management
Message-ID: <20200518223536.GJ2165@builder.lan>
References: <cover.1589539293.git.saiprakash.ranjan@codeaurora.org>
 <b0a2ac4ffefe7d3e216a83ab56867620f120ff08.1589539293.git.saiprakash.ranjan@codeaurora.org>
 <56a5563205da61c47eb4f8bbf6120e28@codeaurora.org>
 <20200518185124.GG2165@builder.lan>
 <badc88ecd5932033235ed9bcd173ea16@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <badc88ecd5932033235ed9bcd173ea16@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 May 12:08 PDT 2020, Sai Prakash Ranjan wrote:

> Hi Bjorn,
> 
> On 2020-05-19 00:21, Bjorn Andersson wrote:
> > On Fri 15 May 03:55 PDT 2020, Sai Prakash Ranjan wrote:
> 
> [...]
> 
> > > 
> > > 
> > > The previous version of this patch in QCOM tree seems to have added
> > > the
> > > property to replicator node instead of etm7 node, can you please drop
> > > that from the tree and apply this one?
> > > 
> > 
> > I'm not able to replace the old commit without rewriting the history of
> > the branch. So I've applied a patch ontop of the branch to fix this up
> > instead.
> > 
> > Please review the branch and let me know if there's any issues.
> > 
> 
> Thanks for the patch, I checked the branch and its good.
> Sorry, I should have sent a patch on top of the old one
> instead of repost.
> 

No worries, now you know for next time. Thanks confirming my fix.

Thanks,
Bjorn
