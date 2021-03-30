Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE46834F1BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 21:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbhC3Tma (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 15:42:30 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:38485 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233113AbhC3TmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 15:42:24 -0400
Received: by mail-ot1-f48.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so16685481otk.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 12:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BijUzWJ/Srebt3CiLNB17AGU4V6AniCiS8DnMoS0K0M=;
        b=CRCLTSY9TepTSnCdgHhedCcrEI/kDqT3IX7RheTtMCS8mpvaPAyUCOXaJdII4QzpSy
         sjyQbtCxyBdXZHucVjELdHVuCvuF/fqLAOcvYDVckRicKvwXj1lLu9fXpCzN3IlqTLDv
         hnotV98WJjlVnh84ywATr4Q6xUDaFiMa0Rl5Zr7yRcEAd7/a3nLzf1Pk/3ueF3Ms2HYx
         7WYjlTmBGR/2fIwPwTvbgklEe4WywwTVBTLvJC8lLqlFmJPT/exe/s9JTDadqZrOp04a
         gbNNDDxtiWTS9kkRES8LjiaQUqTZGU/qZaNiK/u0Qcw3Lrc5BOzIWvS9j2AB+aB9Blsm
         +UwA==
X-Gm-Message-State: AOAM533yh7PDVYlpsEpW9MOT9oLvHYR03cSvx7+nojEK5G0BDcBf8Akt
        pghGYh18Q5yOgyn66c2FOA==
X-Google-Smtp-Source: ABdhPJxM7U40R/6Jiowr2Hkx5tvmKFK8MPEWS8LvxCbCsSqtrwQdgexjRR18TXBEbWm3MycI1JeEPA==
X-Received: by 2002:a05:6830:4121:: with SMTP id w33mr13159955ott.153.1617133343667;
        Tue, 30 Mar 2021 12:42:23 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p64sm4274131oib.57.2021.03.30.12.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 12:42:22 -0700 (PDT)
Received: (nullmailer pid 609864 invoked by uid 1000);
        Tue, 30 Mar 2021 19:42:21 -0000
Date:   Tue, 30 Mar 2021 14:42:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     mkrishn@codeaurora.org
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
Subject: Re: [PATCH v14 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 PHY bindings
Message-ID: <20210330194221.GA588861@robh.at.kernel.org>
References: <1616673661-20038-1-git-send-email-mkrishn@codeaurora.org>
 <1616673661-20038-3-git-send-email-mkrishn@codeaurora.org>
 <161671311714.3012082.4777798674596112311@swboyd.mtv.corp.google.com>
 <81ea21602c74d2b18e4b013dda3a3213@codeaurora.org>
 <161698798504.3012082.2821776620747041419@swboyd.mtv.corp.google.com>
 <b41d57010d51356bdc4af1cd9d9c01ec@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b41d57010d51356bdc4af1cd9d9c01ec@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 30, 2021 at 02:52:29PM +0530, mkrishn@codeaurora.org wrote:
> On 2021-03-29 08:49, Stephen Boyd wrote:
> > Quoting mkrishn@codeaurora.org (2021-03-26 03:36:30)
> > > On 2021-03-26 04:28, Stephen Boyd wrote:
> > > > Quoting Krishna Manikandan (2021-03-25 05:01:00)
> > > >> diff --git
> > > >> a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> > > >> b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> > > >> new file mode 100644
> > > >> index 0000000..4a26bef
> > > >> --- /dev/null
> > > >> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> > > >> @@ -0,0 +1,68 @@
> > > >> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> > > >> +%YAML 1.2
> > > >> +---
> > > >> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
> > > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > >> +
> > > >> +title: Qualcomm Display DSI 10nm PHY
> > > >> +
> > > >> +maintainers:
> > > >> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> > > >> +
> > > >> +allOf:
> > > >> +  - $ref: dsi-phy-common.yaml#
> > > >> +
> > > >> +properties:
> > > >> +  compatible:
> > > >> +    oneOf:
> > [..]
> > > >> and
> > > >> +      connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
> > > >> +
> > > >> +required:
> > > >> +  - compatible
> > > >> +  - reg
> > > >> +  - reg-names
> > > >> +  - vdds-supply
> > > >> +
> > > >> +unevaluatedProperties: false
> > > >
> > > > additionalProperties: false instead? This comment applies to the other
> > > > bindings in this patch.
> > > 
> > > Hi Stephen,
> > > We are referencing dsi-phy-common.yaml in this file. Since the
> > > properties of dsi-phy-common.yaml are applicable to this file also, I
> > > added unevaluatedProperties: false. If we add additionalProperties:
> > > false instead, then the properties of dsi-phy-common.yaml will not be
> > > applicable here and this will throw an error if we add the properties
> > > from dsi-phy-common.yaml in the example.
> > > 
> > 
> > Does that matter? I was wondering about that and so I peeked at the
> > qcom pinctrl binding and it seems to follow a similar design but doesn't
> > have unevaluatedProperties: false. Instead it has additionalProperies:
> > false. See qcom,sc8180x-pinctrl.yaml for an example. So did you try it
> > or does something say you can't do this?
> 
> Hi Stephen,
> I had tried the same thing in one of my initial patches and I got a comment
> from Rob that we have to use unevaluatedProperties when we are referring
> another file(https://patchwork.kernel.org/project/linux-arm-msm/patch/1589868421-30062-1-git-send-email-mkrishn@codeaurora.org/)

Maybe I had a wrong assumption that you needed the child nodes too?

> In latest dt-schema tool, we will get error if we try to change it to
> additionalProperties: false.
> For example, in this patch "#clock-cells' and '#phy-cells' are mentioned in
> dsi-phy-common.yaml and I am referring this file in dsi-phy-10nm.yaml. If I
> add
> additionalProperties: false instead of unevaluatedProperties: false, I will
> get the error mentioned below.
> 
> I checked qcom,sc8180x-pinctrl.yaml that you had mentioned in the comment
> and this file is compiling without any issues even though it is using
> additionalProperties: false. But I see that the properties mentioned in the
> reference file (in this case, qcom,tlmm-common.yaml) are again declared in
> the main file qcom,sc8180x-pinctrl.yaml even though these are mentioned as
> required properties in the common yaml file. If I remove these properties
> from qcom,sc8180x-pinctrl.yaml, I can see the same error that I am getting
> for my file also if additionalProperties are used. If I follow the same
> approach , ie define the properties again in dsi-phy-10nm.yaml and add
> additionalProperties: false, I dont see any errors during check (working
> change mentioned below). Should I make this change for all the files?
> 
> Error logs:
> mkrishn@mkrishn-linux:/local/mnt/workspace/linux-next-latest/linux-next$
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>   CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
>   DTEX
> Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.example.dts
>   DTC
> Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.example.dt.yaml
>   CHECK
> Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.example.dt.yaml
> /local/mnt/workspace/linux-next-latest/linux-next/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.example.dt.yaml:
> dsi-phy@ae94400: '#clock-cells', '#phy-cells', 'clock-names', 'clocks' do
> not match any of the regexes: 'pinctrl-[0-9]+'
>         From schema: /local/mnt/workspace/linux-next-latest/linux-next/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> 
> Working Change:
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -30,6 +30,11 @@ properties:
>        - const: dsi_phy_lane
>        - const: dsi_pll
> 
> +  '#clock-cells': true
> +  '#phy-cells': true
> +  clocks: true
> +  clock-names: true
> +
>    vdds-supply:
>      description: |
>        Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
> @@ -41,7 +46,7 @@ required:
>    - reg-names
>    - vdds-supply
> 
> -unevaluatedProperties: false
> +additionalProperties: false

This works if you want to use some, but not all properties in a 
referenced schema. If all apply or listing them all here is too much 
duplication (such as child nodes, but that's a judgement call), then use 
'unevaluatedProperties'.

unevaluatedProperties is also currently a nop because the underlying 
tools don't yet support it. So it won't catch any errors and those 
errors will all have to be fixed when the tools add support.

Rob
