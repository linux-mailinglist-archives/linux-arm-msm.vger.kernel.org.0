Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B92C866A4CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 22:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjAMVLU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 16:11:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjAMVLR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 16:11:17 -0500
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8ACFCE7;
        Fri, 13 Jan 2023 13:11:16 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id j16-20020a056830271000b0067202045ee9so12885722otu.7;
        Fri, 13 Jan 2023 13:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luAGLKKbhZaaB2JSoQizSdSMKFqku7/SQlTvGVUwEXM=;
        b=gqqfsSRSjkhWNZLYAbyEi0H2KEVyg1tLCc/BfpP9yIyNlLQ9yl/ATef7TxjN/BuOhZ
         TaUvRqk5tci2vdbETq8FzensV25AeKm+4ktejObzrJEHVBwq1xdrdkdILby84HHvuJJD
         sTTWCZ7h7Htd2p5Pep6mzHmCOMqKwI74+r5Ff5wXLrb1vS60FOgNMp5PHzQMiu46sxnv
         WhToT98Mf7iKezi8V5PkZACHLqK59D4RR7KwLT1PpS1LFNgozygjUngH5IF1riVQB3YP
         yX0Al2cwZypReBXizj50pMCjG9RtDV0YdEPvc4YS64vhBK958ok8Nmv98DwNb23lP6Y6
         OS7w==
X-Gm-Message-State: AFqh2kobjQdbHNChzrPcw5sxXOSayjyKxi3iBQWVxUJipsVQTSKItNza
        cd84jqfaz29Xc2iXC11zPQ==
X-Google-Smtp-Source: AMrXdXtUvUrJ2oTWz8Ht97YcbiU9WNAxZzE1IB4sdZ4haln+t0n822e24B5iXwvgwP6TaVyUbgJF+w==
X-Received: by 2002:a05:6830:43:b0:670:99fe:2dcc with SMTP id d3-20020a056830004300b0067099fe2dccmr38358170otp.18.1673644275551;
        Fri, 13 Jan 2023 13:11:15 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id dz9-20020a056808438900b0035b4b6d1bbfsm9671400oib.28.2023.01.13.13.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:11:15 -0800 (PST)
Received: (nullmailer pid 2947870 invoked by uid 1000);
        Fri, 13 Jan 2023 21:11:14 -0000
Date:   Fri, 13 Jan 2023 15:11:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v6 01/11] dt-bindings: display/msm: convert MDP5 schema
 to YAML format
Message-ID: <20230113211114.GA2925393-robh@kernel.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-2-dmitry.baryshkov@linaro.org>
 <167362343145.2212490.16180994187587985655.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167362343145.2212490.16180994187587985655.robh@kernel.org>
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

On Fri, Jan 13, 2023 at 09:26:52AM -0600, Rob Herring wrote:
> 
> On Fri, 13 Jan 2023 10:37:10 +0200, Dmitry Baryshkov wrote:
> > Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
> >  - MSM8996 has additional "iommu" clock, define it separately
> >  - Add new properties used on some of platforms:
> >    - interconnects, interconnect-names
> >    - iommus
> >    - power-domains
> >    - operating-points-v2, opp-table
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/mdp5.txt  | 132 -----------------
> >  .../bindings/display/msm/qcom,mdp5.yaml       | 138 ++++++++++++++++++
> >  2 files changed, 138 insertions(+), 132 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230113083720.39224-2-dmitry.baryshkov@linaro.org
> 
> 
> mdp@1a01000: compatible:0: 'qcom,mdp5' was expected
> 	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb
> 
> mdp@1a01000: compatible: ['qcom,msm8953-mdp5', 'qcom,mdp5'] is too long
> 	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

If your thought is to drop 'qcom,msm8953-mdp5' here that doesn't really 
seem great.

Rob
