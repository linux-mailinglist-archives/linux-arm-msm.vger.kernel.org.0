Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 796F974FB98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 01:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjGKXBP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 19:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjGKXBO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 19:01:14 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C041110CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 16:01:13 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-38c35975545so5432749b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689116473; x=1691708473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sNgvvti22BaVOQpn7FMXRFccxTxteRm9qMZTNS49wJc=;
        b=SnsZzYcxC8uETuqw89Oj9ypwhEjQ5xsUGI4SCT2U/HLgMMEp7sCEUWb8Vfj8I33+63
         oFukQSrN7Qm89fretmaq0T4Dew04HmVnlsTcP8GFhXCFKKtYp0x6/Q0p9T8S8J4DhpTh
         BuAWsNJv/LJdL6mBX762L1gy5A8LxqvQMHjVoK08oJPeaNxpbVtPR27aIDI0FbinbM7a
         fanXkh2FvbI3T7LhG0lTeaEhfgZ2CdTQMSC8/XbuLMjxgIxl3lwLuq7MsRVt69g5VV1G
         7nmWluz6vuiaiquNi3nwbiScFyynqIVDVaC5AwmdOakV5IyV+Ld2qNRworcXYC6cwOkA
         0i1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689116473; x=1691708473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNgvvti22BaVOQpn7FMXRFccxTxteRm9qMZTNS49wJc=;
        b=Tw9YV5FlM1TK616jqml4oT3KRQPIWnzr5AQ62KUKVicq/klYXdf9gXpcZd/YddvXqm
         SGgQEUWuYXrnImpx2xsBJAVOYiizbNUfSYxNDDzNUrE2F0zZ7bAyf6zR8ZK4f+W/ONNL
         SjOyM8stJce7bD2dtSSM/DVwyBl9d+VGbcV3UTuNyGmJKV7RC4PR1oheR5ExnB+Oh1gl
         mrz/KW3iul5KlcZm0dcdFNd/u+1sX+aHsQkc/aR7xBDzkJNi4AOp1PJjWmKLBKQ63kmU
         u+vdpnLynmfPu5XsBE/OOd5RCb6xy0VLIwAon2qg31T6pRBf0/8Ti0tDZoK5BbYPVMJO
         P33w==
X-Gm-Message-State: ABy/qLYfn5VNk37WfuF+edGcBEFVz99lcJOOeKfNGrqcUJ3lnAOSXouP
        g04/Dsim0SiLtQi+kwLeaelhl5QTK8hXwhv9JmKYbRIhVmGmqbut
X-Google-Smtp-Source: APBJJlEkQ9HSi+CqGWUfrEa9mQbC5ePz8PSqoOABC9giUvRXnz9F6mkPYDAMXjPDWPnX5V9zeoA+Hz8x45tFMf9ARu4=
X-Received: by 2002:a05:6808:1441:b0:3a4:1319:9af1 with SMTP id
 x1-20020a056808144100b003a413199af1mr6467128oiv.51.1689116473078; Tue, 11 Jul
 2023 16:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-4-dmitry.baryshkov@linaro.org> <d80fab4d-f581-f6fa-4aa8-f8952f0c710c@linaro.org>
 <6968f4a5-fc5d-e166-3262-dc83762eeec1@linaro.org> <766ade98-f3c7-89a3-d3e0-63c8d01a8498@linaro.org>
In-Reply-To: <766ade98-f3c7-89a3-d3e0-63c8d01a8498@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 12 Jul 2023 02:01:02 +0300
Message-ID: <CAA8EJpqxuziMGqkCZsE18K6z=WyQ44nxo3+-He=SZhH7Gfggkg@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C redriver
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 12 Jul 2023 at 01:59, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 12.07.2023 00:39, Dmitry Baryshkov wrote:
> > On 12/07/2023 00:36, Konrad Dybcio wrote:
> >> On 9.07.2023 06:19, Dmitry Baryshkov wrote:
> >>> Add the nb7vpq904m, onboard USB-C redriver / retimer.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >> [...]
> >>
> >>> +            port@1 {
> >>> +                reg = <1>;
> >>> +
> >>> +                redriver_phy_con_ss: endpoint {
> >>> +                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
> >>> +                    data-lanes = <0 1 2 3>;
> >> That's USB+DP lines combined, or how does it work? I'm confused :/
> >
> > 4 generic purpose SS lanes, which can be purposed for USB or for DP.
> Okay, so my gut did better than my brain.
>
> Other than that, I'm reading the bindings and it looks like ports 0 and
> 1 may possibly be swapped?

Yes. But if I get schematics right, the lanes are not swapped in this case.

>
> Konrad
> >
> >>
> >> Konrad
> >>> +                };
> >>> +            };
> >>> +
> >>> +            port@2 {
> >>> +                reg = <2>;
> >>> +
> >>> +                redriver_usb_con_sbu: endpoint {
> >>> +                    remote-endpoint = <&pm8150b_typec_sbu_out>;
> >>> +                };
> >>> +            };
> >>> +        };
> >>> +    };
> >>>   };
> >>>     &mdss {
> >>> @@ -1294,7 +1334,7 @@ &usb_1_qmpphy {
> >>>   };
> >>>     &usb_1_qmpphy_typec_mux_in {
> >>> -    remote-endpoint = <&pm8150b_typec_mux_out>;
> >>> +    remote-endpoint = <&redriver_phy_con_ss>;
> >>>   };
> >>>     &usb_2 {
> >>> @@ -1382,7 +1422,15 @@ pm8150b_role_switch_out: endpoint {
> >>>               port@1 {
> >>>                   reg = <1>;
> >>>                   pm8150b_typec_mux_out: endpoint {
> >>> -                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
> >>> +                    remote-endpoint = <&redriver_usb_con_ss>;
> >>> +                };
> >>> +            };
> >>> +
> >>> +            port@2 {
> >>> +                reg = <2>;
> >>> +
> >>> +                pm8150b_typec_sbu_out: endpoint {
> >>> +                    remote-endpoint = <&redriver_usb_con_sbu>;
> >>>                   };
> >>>               };
> >>>           };
> >



-- 
With best wishes
Dmitry
