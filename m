Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98ED3668645
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 23:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240157AbjALWAY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 17:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241166AbjALV7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 16:59:21 -0500
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2F26C7CC;
        Thu, 12 Jan 2023 13:50:23 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-15b9c93848dso12114756fac.1;
        Thu, 12 Jan 2023 13:50:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pt9a9FTky98yU2jJUKa3hat4M8RZa/qGbkgw4+4ead0=;
        b=YnhQxBNDbjhboGXGCMaV3M6OJ0tTW/IRghs6DLcenO+aStm+3Uz/rpDsiJNMwMHXkE
         ufsnFMq9sLLZuE6z4psiJtfaw6yc5o+gIS8DZ25Q9hB50pAKZ0/7eJVgAF9bCVOBOd9T
         mQugdnjVk1b3Si5S4bhCWT8u2ei07V6iATqMdZix64ZHfxDTN6/7VHAEviXNSUd/BkOG
         iALGlsfv9/VpOKU5TuwwvmHZcB6JshSzkn+QuVdkDwCTfgD0bGFPJvTiLAG0ZsfhbOJa
         WamCKD44XMmKyBoDhWURzU/B4/k5cV48QxZzNi6KnI5n153SR+NbCAGZjqIRk3AO4oTc
         IfkA==
X-Gm-Message-State: AFqh2kp+GcKTxVI5ZPfnGTFlGsXDNg8oY2/0Hb5BlMCUcFvSMrp0R4ko
        Zf1uxffXrOUmnrpJnFjLCA==
X-Google-Smtp-Source: AMrXdXtdTgojCFd9LO4w7xqLSVo9gQEqcuSIu/CV1U6mGVhTBvnN93Y5zJ4abtPbRJrgfYBsHwhIoA==
X-Received: by 2002:a05:6870:bd46:b0:14f:7db1:68b2 with SMTP id og6-20020a056870bd4600b0014f7db168b2mr30725597oab.59.1673560222230;
        Thu, 12 Jan 2023 13:50:22 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r10-20020a05687032ca00b0014ff15936casm9482066oac.40.2023.01.12.13.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 13:50:16 -0800 (PST)
Received: (nullmailer pid 281268 invoked by uid 1000);
        Thu, 12 Jan 2023 21:50:15 -0000
Date:   Thu, 12 Jan 2023 15:50:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 1/4] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Message-ID: <20230112215015.GA259261-robh@kernel.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-2-dmitry.baryshkov@linaro.org>
 <20230109074947.5vnfrn6shzpm6iqi@SoMainline.org>
 <997dbd09-03d6-d60d-1dce-db0bc6415582@linaro.org>
 <20230111222903.otbur6yi4iv4mpgz@SoMainline.org>
 <1d371e40-0639-16f8-abef-afcd05e72e22@linaro.org>
 <20230111223553.e3xrxmdys5zxxleh@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111223553.e3xrxmdys5zxxleh@SoMainline.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 11, 2023 at 11:35:53PM +0100, Marijn Suijten wrote:
> On 2023-01-12 00:31:33, Dmitry Baryshkov wrote:
> > On 12/01/2023 00:29, Marijn Suijten wrote:
> > > On 2023-01-10 06:40:27, Dmitry Baryshkov wrote:
> > >> On 09/01/2023 09:49, Marijn Suijten wrote:
> > >>> On 2023-01-09 07:01:49, Dmitry Baryshkov wrote:
> > > <snip>
> > >>>> +    description: |
> > >>>
> > >>> Should multiline descriptions be treated as a oneline string with `>`?

Depends if you want to keep paragraphs. Generally, we use '|' or 
nothing. If just a colon (or ???), then I think you want '>'.

I get tired of saying to drop unnecessary '|' in reviews. It would be 
nice to analyze the text to check what's needed automatically.


> > >> Ack, I'm fine with either of them, let's use the >
> > >>
> > >>>
> > >>>> +      Contains the list of output ports from DPU device. These ports
> > >>>> +      connect to interfaces that are external to the DPU hardware,
> > >>>> +      such as DSI, DP etc. MDP5 devices support up to 4 ports::
> > >>>
> > >>> How do these double colons render?  Is this intentional?
> > >>
> > >> double colons is an escape for a single colon if I remember correcly.
> > > 
> > > I thought no escaping was necessary here, especially since this is
> > > already a value - it is a multiline string.
> > 
> > I was mostly following examples, grep :: through the dt-bindings.
> 
> Saw that, maybe these "freeform" description strings are intended to be
> RST to support more elaborate rendering if/when that happens?

No, though some experiments have been done in that regard. It seemed to 
work.

> > >> BTW: how to render the DT schema?
> > > 
> > > I'm not sure if there's currently any rendering tool to view these docs
> > > in a "friendly" manner, e.g. an html page, or whether they're only used
> > > as specifications for DT validation.
> > 
> > Probably there will be one at some point. It might make good addition to 
> > devicetree.org.
> 
> Would be super cool to have some "interactive" / properly
> rendered/colored docs up there for DT :)

One of the original goals was to transform the DT spec to schema docs 
and then generate the spec from the schemas.

There's tools that do json-schema to docs already. They may just work. I 
haven't looked at them though as that's not really my itch and I simply 
don't have time. Maybe if we stop reviewing schemas for a while.

Rob
