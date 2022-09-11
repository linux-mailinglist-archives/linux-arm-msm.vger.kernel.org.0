Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 039FE5B505B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 19:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiIKRpe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 13:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiIKRpd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 13:45:33 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBAA91276E
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 10:45:31 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 202so9637740ybe.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 10:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ZcSkLIsXblWiUck8OJ+SgUpInZcR1xIm0ofo17gXyfA=;
        b=htzx+rPBSWmBexOWYgvvYalDR4sq9l9+h6JnVj2Yj9XX3q8g6C2J9BVfa7OumCJc8F
         W5a8Og0H27W2srS50J0/WVBoKMS3LaYi8IElKfVi9d9xhUiEyCe8NWg1eNbx349O+44L
         IIv4K2mmWJCFHcgq0NlnNmevgpfr7MZ4fH+YOCkmzEFqKoufQwB19u0TPR4JV95n5IzZ
         7VoXtxInrJIOV9ivmEZ2M5se+9p007W2D6AS6QoL6NWSmtNuJQYAmi9+JTwYdjlUrDph
         aWp5AIDihSEWmqa7lWNtVfG1gstpCgsoEqllNPPEGQvgc67nRtzDZAr8OkRm7C0S76yg
         iS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ZcSkLIsXblWiUck8OJ+SgUpInZcR1xIm0ofo17gXyfA=;
        b=VE8ejON9TUODhkTT7T+tzf086cFrvAn/lLp32NWZlYdvB4mBWCkiqEvJ6P+PukNKMb
         Ohk6CHXSFO3brOybprRmlHv5DXLj3LzQQ6AWBvpEFBuIpOWJvDaBMYVqOvDJ46Ce6uCH
         h//cJVq44RzPCkRP0CRw7mVAJA9LDfrdC6pobyxCzCAsgUWpse3UaXz7uU35c+fGIMPy
         xhF6RF+LD9ED/B49qKTkOoG+KT4YuDZeN277k11R5LXpAAB183tvOjTHFsYQWmIDTOM2
         IbBrTelaqWJSpDxoUj9Oczw2m7tCHclKiuC3QCUS05u76GFtfjcpjR4XtWzMbF1i7qcA
         U41g==
X-Gm-Message-State: ACgBeo3wptuGT6J1xqFCjT0Yqw9d2qkPkcOKjeudzJlew611z9/UcfOD
        NJbGRdWAyBf/YAWqMxbiISiegkpIYc6492z5vZ/M5A==
X-Google-Smtp-Source: AA6agR4c6Fc3MsDIpfTcUFqNXoFK01t8NfhXio0j+7mP1q7r3AQ5VpXCKyBYguMnVkBKKhEeTlNq52ZroBcK3bKK+i8=
X-Received: by 2002:a25:5c3:0:b0:6a9:90fb:c9e6 with SMTP id
 186-20020a2505c3000000b006a990fbc9e6mr19452672ybf.152.1662918331162; Sun, 11
 Sep 2022 10:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org> <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org> <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
 <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
 <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org> <CAA8EJpqHL-gO=zSG6Ek=-y4njGF5R66z0MwLeKZ9U4Ag1j51Og@mail.gmail.com>
 <e7a132e7-a819-ebe2-e6e5-c01cbfacef15@linaro.org> <CAA8EJpoPPRAQPfVQmSfrrDrroMp0bzvJ=-vHMRx72aKTBgPOTA@mail.gmail.com>
 <f013accb-96f7-a025-1d41-e2e97f8b2aa8@linaro.org>
In-Reply-To: <f013accb-96f7-a025-1d41-e2e97f8b2aa8@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 11 Sep 2022 20:45:20 +0300
Message-ID: <CAA8EJprnrKP9Ze__KTTNGDs8sj3QhqpiHnnhf1=ipq+CFCoXsQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 11 Sept 2022 at 16:57, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/09/2022 15:45, Dmitry Baryshkov wrote:
> > On Sun, 11 Sept 2022 at 14:27, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 10/09/2022 14:54, Dmitry Baryshkov wrote:
> >>>>
> >>>> However I think there is no such problem, as Dmitry said, that ref
> >>>> changes anything. There will be always failure - either from parent
> >>>> schema (using $ref) or from device child schema (the one which actually
> >>>> misses the property).
> >>>
> >>> Initially I stumbled upon this issue with the dsi and dsi_phy nodes
> >>> for msm8996 devices. If I have $ref here, dsi1/dsi1_phy nodes will
> >>> emit warnings regarding the missing -supply properties despite nodes
> >>> being disabled. If I use `compatible' here, the schema checks pass.
> >>> Thus I'd prefer to leave `compatible' here. Not to mention that it
> >>> also allows specifying a tighter binding than just using the $ref.
> >>
> >> I don't think we understood each other. I claim that error will be there
> >> anyway, just from different schema. So your change fixes nothing in
> >> total schema check...
> >
> > If the node is disabled, there will be no different schema check.
>
> As I wrote before, there was.

The following results were captured with the following command, with
most of the DSI and MDSS schema files fixed, using the following
command:
$ PATH=~/.local/bin/:$PATH make -C ../build-64/ ARCH=arm64
qcom/sda660-inforce-ifc6560.dtb  CHECK_DTBS=y
DT_SCHEMA_FILES=display/msm

As you can see from the example below, when using 'compatible' I'm
getting warnings just for the gpu@5000000 node, while using $ref I
also got warnings for the dsi-phy@c996400 node (disabled in the DT
file).
For your reference the tree in question is uploaded to the:
    https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-mdss-yaml

Logs:

#1 mdss.yaml using compatible enum for dsi-phy:
  "^dsi-phy@[1-9a-f][0-9a-f]*$":
    type: object
    properties:
      compatible:
        enum:
          - qcom,dsi-phy-14nm
          - qcom,dsi-phy-14nm-660
          - qcom,dsi-phy-20nm
          - qcom,dsi-phy-28nm-hpm
          - qcom,dsi-phy-28nm-lp

make: Entering directory '/home/lumag/Projects/Qcomm/build-64'
/home/lumag/Projects/Qcomm/kernel/arch/arm64/Makefile:36: Detected
assembler with broken .inst; disassembly will be unreliable
  UPD     include/config/kernel.release
  LINT    Documentation/devicetree/bindings
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
/home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml:
ignoring, error in schema: patternProperties:
^(5vs[1-2]|(l|s)[1-9][0-9]?|lvs[1-3])$: properties
  DTC/CHECK   arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb
/home/lumag/Projects/Qcomm/build-64/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb:
gpu@5000000: clock-names:4: 'anyOf' conditional failed, one must be
fixed:
'core' was expected
'iface' was expected
'mem' was expected
'mem_iface' was expected
'alt_mem_iface' was expected
'gfx3d' was expected
'rbbmtimer' was expected
From schema: /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/display/msm/gpu.yaml
make: Leaving directory '/home/lumag/Projects/Qcomm/build-64'


#2 mdss.yaml having dsi-phy rewritten to $ref:
  "^dsi-phy@[1-9a-f][0-9a-f]*$":
    type: object
    oneOf:
      - $ref: dsi-phy-14nm.yaml
      - $ref: dsi-phy-20nm.yaml
      - $ref: dsi-phy-28nm.yaml

make: Entering directory '/home/lumag/Projects/Qcomm/build-64'
/home/lumag/Projects/Qcomm/kernel/arch/arm64/Makefile:36: Detected
assembler with broken .inst; disassembly will be unreliable
  LINT    Documentation/devicetree/bindings
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
/home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml:
ignoring, error in schema: patternProperties:
^(5vs[1-2]|(l|s)[1-9][0-9]?|lvs[1-3])$: properties
  DTC/CHECK   arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb
/home/lumag/Projects/Qcomm/build-64/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb:
gpu@5000000: clock-names:4: 'anyOf' conditional failed, one must be
fixed:
'core' was expected
'iface' was expected
'mem' was expected
'mem_iface' was expected
'alt_mem_iface' was expected
'gfx3d' was expected
'rbbmtimer' was expected
From schema: /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/display/msm/gpu.yaml
/home/lumag/Projects/Qcomm/build-64/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb:
mdss@c900000: dsi-phy@c996400: 'oneOf' conditional failed, one must be
fixed:
'vcca-supply' is a required property
'vddio-supply' is a required property
Unevaluated properties are not allowed ('compatible', 'reg-names' were
unexpected)
'qcom,dsi-phy-20nm' was expected
'qcom,dsi-phy-14nm-660' is not one of ['qcom,dsi-phy-28nm-hpm',
'qcom,dsi-phy-28nm-lp', 'qcom,dsi-phy-28nm-8960']
'dsi_pll' was expected
'dsi_phy' was expected
'dsi_phy_regulator' was expected
From schema: /home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/display/msm/mdss.yaml
make: Leaving directory '/home/lumag/Projects/Qcomm/build-64'




-- 
With best wishes
Dmitry
