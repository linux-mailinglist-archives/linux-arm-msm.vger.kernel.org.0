Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B4642E55E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 02:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234641AbhJOArK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 20:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234652AbhJOArH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 20:47:07 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C040C061762
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 17:45:01 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id s18-20020a0568301e1200b0054e77a16651so10623021otr.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 17:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1vZ6v7ZT1GG7mkeMAu0qlNHqCe5dhlkQS7AG2Jdz1p4=;
        b=FHcMrwUKGhHPKTNLzCoqrtyXCwB7ekkT7gOhYPgvuAblhBDgPbtcgQeQi1vPC8flnw
         Ozp2/727o/5QzLQpzRwVv0NcQOk3+ph4cpeW8r27dh2sGqKgp2OP67PSVxUKJcBPXmXo
         l8UiMsOQ++wQRZS0kgwUz8W/dH2HnSHntik+yscbQmv6QqjqXJAKq0YAXPz1smR1c0FL
         XOHCDzA13lENodRSDppBMSI3whU/bqh174+9nXbzFTRSfMjeKdmB8iQczjuSHq6JqHqv
         TD/LWiGPxsNmROlx+p6Ja5JceZm84JtNACVLQPMkAo66GuwVfyV9W4Xo49amaN4LdV0Y
         K2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1vZ6v7ZT1GG7mkeMAu0qlNHqCe5dhlkQS7AG2Jdz1p4=;
        b=VZJhPkfUxNMh3tQVf6t4gHhNFoqy6zuuEzSB9KVhmdr/8/RBClR4gXV5fB1MVfDxvH
         Wnp8s+qVImwsJo3FmaGS12bvPKlvBI+DPquJku6kt/hX8VQLQSdIGxpm/XbP9G0suRC6
         hcj9Jc4hxfppb/oAjwde44fOYfZYRcdClD8vdtiXZosgU0/j/magkOd3FT+gLLk41wc7
         xpqtbie6p7l5D/ZnmHI9jR6qbWBJI6syxUisNS07MIjJAQNq8XfBf4K4ndOKhwGHwPzs
         Y988rvCwxmr8f4nF67AqFCNCRxKx2VnLV8UlYsIXnxP9oDH/c01Kx4Vy4KUaE8wZyxp0
         VA1Q==
X-Gm-Message-State: AOAM531ykVV4cPclDUPSX56Y6loxWaL92B0WnjYXaxOnMdAqY3VGXc3j
        X1/H3DQg0rgGfoM4qcLHwRkE9w==
X-Google-Smtp-Source: ABdhPJzigQ6sWVXDvXUV/ljPyNWpgJU8dq4hQEOHyEi1UITklWvbS/GPWSdW0/HGga9BWLwlg2cDUA==
X-Received: by 2002:a9d:6081:: with SMTP id m1mr5491426otj.262.1634258700733;
        Thu, 14 Oct 2021 17:45:00 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id q39sm970956oiw.47.2021.10.14.17.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 17:45:00 -0700 (PDT)
Date:   Thu, 14 Oct 2021 17:46:51 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>, open list:
        DRM DRIVER FOR MSM ADRENO GPU 
        <linux-arm-msm@vger.kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        COMMON CLK FRAMEWORK <linux-clk@vger.kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
Subject: Re: [PATCH v7 7/8] clk: qcom: dispcc-sm8250: stop using mmcx
 regulator
Message-ID: <YWjPexTTQYyZ9JNM@ripper>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
 <20210829154757.784699-8-dmitry.baryshkov@linaro.org>
 <YV8WsQb9H7+CaLjP@ripper>
 <4614587c-b87a-4375-cb6a-6af6f5462c6b@linaro.org>
 <163415465484.936110.9292145029740247591@swboyd.mtv.corp.google.com>
 <070b1b25-3718-5f3a-869b-a3954fdcc7c5@linaro.org>
 <163425629248.1688384.14367506222343416862@swboyd.mtv.corp.google.com>
 <CAA8EJpo4SCSPMVstxO_eTGHVNCEkhguJDcfE4=6Y3YSDQ+SeOw@mail.gmail.com>
 <163425751841.1688384.11770181770221059842@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163425751841.1688384.11770181770221059842@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 14 Oct 17:25 PDT 2021, Stephen Boyd wrote:

> Quoting Dmitry Baryshkov (2021-10-14 17:15:39)
> > On Fri, 15 Oct 2021 at 03:04, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Dmitry Baryshkov (2021-10-14 02:53:41)
> > > > On 13/10/2021 22:50, Stephen Boyd wrote:
> > > > > Quoting Dmitry Baryshkov (2021-10-07 09:16:13)
> > > > >> On 07/10/2021 18:48, Bjorn Andersson wrote:
> > > > >>> On Sun 29 Aug 08:47 PDT 2021, Dmitry Baryshkov wrote:
> > > > >>>
> > > > >>>> Now as the common qcom clock controller code has been taught about power
> > > > >>>> domains, stop mentioning mmcx supply as a way to power up the clock
> > > > >>>> controller's gdsc.
> > > > >>>>
> > > > >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > >>>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > >>>
> > > > >>> Once we merge these, I expect that the boards will start crashing if
> > > > >>> the kernel is booted using an existing DTB?
> > > > >>>
> > > > >>> Is it okay to just merge the first 6 patches in the series now and
> > > > >>> postpone these two until we've had the dts change sitting for a while?
> > > > >>
> > > > >> Sure it is.
> > > > >>
> > > > >
> > > > > What's the merge strategy? It goes through arm-soc?
> > > >
> > > > I think this should go through the clk tree. There is little chance of
> > > > conflicts.
> > > >
> > >
> > > The other thing that concerns me is that we don't have backwards
> > > compat code. If things are going to start crashing that's not very nice.
> > > Is there some way to make it work with old and new DTB for one release
> > > so that we don't have to worry about this problem?
> > 
> > I have to admit that I did not check that, but without the patch 7 the
> > dispcc and videocc would be compatible with the old DTB. The 'supply =
> > "mmcx"' would ensure that it is used if it is defined.
> > 
> 
> So I can skip patch 7 and take everything else?

If you take patch 1-5 and I pick up patch 6 for v5.16 then we should
have transitioned with backwards compatibility.

Then we can resubmit 7 & 8 in 1-2 releases.

Regards,
Bjorn
