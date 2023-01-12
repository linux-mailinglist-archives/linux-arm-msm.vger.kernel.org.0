Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFD4668557
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 22:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240867AbjALV3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 16:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbjALV2u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 16:28:50 -0500
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0156884625;
        Thu, 12 Jan 2023 13:08:04 -0800 (PST)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1433ef3b61fso20251105fac.10;
        Thu, 12 Jan 2023 13:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wzxahTcWDGCEgSTxgeRoQofJTG/+AnFDw9xq9Ks/aU=;
        b=V31/AW8yQHLXWc5KQB4lZ0IEw8ZoDWJ0C7q+724OPSGv4V+VVzIPXi9CI/saIvdO+5
         XBAD2xD5Ci8YxrcUiPVi8lqOkJ7bj5x7wOQq50hLu2YAao9xcJjq2wJAm7kWAiNLT+i9
         V9s1e4ceuiV6jXU2aapqgBpDq1VGPn2O126hYVSn53zQsqYmgivgFImi7SpLIZ2WILu4
         BaMuRiW/72gPwEvBAT0QV3Ckw02254SFPS8AgCP/tbu1LwG/vhqD+dcQuWI57F35vNLB
         X7jiCJlW3fpePLMK/ZNvcLCE4sIO+VKeCw90iDFhofuJ/zFkwQQnBr2MzwDaD0fng57Y
         jeTA==
X-Gm-Message-State: AFqh2krGCM7du58kpA3f5GVDkN8QmOVTJJP+fylNoaNSI1zB1vkBHA6h
        0QUHVwvTdoBcxZ6FjxkQnfouVd5hIg==
X-Google-Smtp-Source: AMrXdXtSCHXZRCilk8n8g+hV+Qa3jh7XqmJAWkAAZPkD0RohlzwE+ony/tG9xLXejF8oROMQVWtq1g==
X-Received: by 2002:a05:6870:238f:b0:144:9783:54dd with SMTP id e15-20020a056870238f00b00144978354ddmr40274406oap.11.1673557684061;
        Thu, 12 Jan 2023 13:08:04 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q18-20020a056870329200b00155ffbdbaffsm9500814oac.18.2023.01.12.13.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 13:08:03 -0800 (PST)
Received: (nullmailer pid 235012 invoked by uid 1000);
        Thu, 12 Jan 2023 21:08:03 -0000
Date:   Thu, 12 Jan 2023 15:08:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom,ids: Add a bunch of older SoCs
Message-ID: <20230112210803.GA228926-robh@kernel.org>
References: <20230104115348.25046-1-stephan@gerhold.net>
 <20230104115348.25046-4-stephan@gerhold.net>
 <20230108214052.GA313089-robh@kernel.org>
 <20230111194215.kpxjlv3pgniyoglr@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111194215.kpxjlv3pgniyoglr@builder.lan>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 11, 2023 at 01:42:15PM -0600, Bjorn Andersson wrote:
> On Sun, Jan 08, 2023 at 03:40:52PM -0600, Rob Herring wrote:
> > On Wed, Jan 04, 2023 at 12:53:47PM +0100, Stephan Gerhold wrote:
> > > Sync the SoC IDs in qcom,ids.h with relevant entries from Qualcomm's LK
> > > bootloader [1] that is used for almost all older Qualcomm SoCs.
> > > 
> > > Several of these are already supported, e.g.:
> > >   - MSM8960 -> APQ8060, MSM8260, ...
> > >   - MSM8976 -> APQ8076
> > >   - MSM8956 -> APQ8056
> > > Others are currently being worked on, e.g.:
> > >   - MSM8909(W) -> APQ8009(W), MSM8905, MSM8209, ...
> > >   - MSM8939 -> MSM8239, ...
> > > 
> > > And even all remaining ones added are close enough to what is already
> > > supported so that future support is realistic (if someone steps up to
> > > do the work).
> > > 
> > > Add all of them at once to avoid having to add them one by one in the
> > > future. This will also benefit other projects making use of the same
> > > dt-bindings, e.g. bootloaders where adding support for all these SoCs
> > > is a bit easier than on Linux.
> > 
> > The promise was in accepting the properties upstream is we'd only be 
> > adding these for bootloaders with dtbs that we can't otherwise update or 
> > change. Do all of those meet this criteria? Seems unlikely.
> > 
> 
> Independent of the question about qcom,msm-id and qcom,board-id, I would
> like these constants for the socinfo driver (as shown in patch 4).
> 
> Would you prefer that we keep a separate list in Linux?

No, its fine given there's more than one use and the schema only allows 
the properties on certain SoCs already.

Acked-by: Rob Herring <robh@kernel.org>

