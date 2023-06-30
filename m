Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72155743C4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 14:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbjF3M6B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 08:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbjF3M6A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 08:58:00 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED9230C4
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 05:57:58 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-c17534f4c63so1745279276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 05:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688129878; x=1690721878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JQCrl7A/rIH8uSHfyu+uZL/P6cdZFk4n3tT8OtlO/xo=;
        b=oPdob9Hs78h0VuxLuMsHTSSKSQsy2omAIqIsV6s0BGW9C8IcOGEsP3TopefaUaVcs2
         0BRoy09i6N9rCPjIwaAt1DRcmgeaIIzl2lHU4czQ92j/HkjesDLWEt1QLsJ8g5y+dEtW
         iEeeyYbQSWlm3vml7PSXIuPi/YmXV7UDXs7DN/6VKUS+IrLR93m52mMfGwHXWci+1QYD
         9OXOQ3cX2/HmC1aqOhaMEUBpVspNTcJaqlceKBSN7wLb925UQf+6wcvBZBYROddnbahC
         yjJluvYYkP08yMXGTqj53mvmauHcbdg/OjbZScg4dChXax8bji+zQXzExxGoV06G99vy
         yAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688129878; x=1690721878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQCrl7A/rIH8uSHfyu+uZL/P6cdZFk4n3tT8OtlO/xo=;
        b=WoyTTCpknuwtKycHoro2ZnBX0Iq9rjAzCSSRdZS1O+Zgn+OwnEpt9qh97F42VrDMgX
         /5nhL3CZPEN+plSSpmsDFMP5NAZdWzxvvC5MlboKxP5eJahY6Qsf57atOGGASZ/lwcOz
         kGy9fOhZnUBvuYHQgbMnZ9QCvgCN+OJtgyRrmyf8IL3ChCgTa6XF9YH7LRDFaczHvRar
         QNNgTpKO0dbyPG9vH9pd8snq5o1fMI41xOPGPLPpGC/053b4qrCBVBslVJ0G80MsIiSj
         dIbo+HkmKa+2i+koWOyOp2uGDrkJQhd3whPW+vSNgpCZuFMEewBdgpDI53Qu7wqcxHxX
         BLkQ==
X-Gm-Message-State: ABy/qLaZSc/AakzDWkvr+UiHWw9gSDNKuLrnNs5PU2ms7CWU4EOrlcLm
        NznfTOcNlxNvQt4cG804L6A32S8jTXB2Mbb0jXGrqQ==
X-Google-Smtp-Source: APBJJlE5fHF6+9Pnv2C/x84Fx1XbeMTvYCz8/yQZzjx9rKb9aDS1JbMcOGbsBOJZrP7da0+PAKm4vBNtA+bm22TDvAQ=
X-Received: by 2002:a25:ed10:0:b0:bc9:92c9:7fd1 with SMTP id
 k16-20020a25ed10000000b00bc992c97fd1mr2750125ybh.3.1688129878014; Fri, 30 Jun
 2023 05:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-8-dmitry.baryshkov@linaro.org> <c59d002b-9d06-d744-d90b-22da4186522a@linaro.org>
 <CAA8EJpp+b1KVaMK82j7T=iGovXVAu3jq51rTHu6yqPcnkwXoeg@mail.gmail.com> <65d9025b-134d-eb8c-98d8-ab7103a5dc44@linaro.org>
In-Reply-To: <65d9025b-134d-eb8c-98d8-ab7103a5dc44@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 30 Jun 2023 15:57:46 +0300
Message-ID: <CAA8EJpopHRNTyuzi2V=1t7o5xbXaCjxjP=yQUigCYDJMULxb=Q@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8450-hdk: add ADC-TM thermal zones
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 30 Jun 2023 at 14:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 30.06.2023 12:07, Dmitry Baryshkov wrote:
> > On Fri, 30 Jun 2023 at 11:19, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >> On 30.06.2023 08:13, Dmitry Baryshkov wrote:
> >>> Add thermal zones controlled through the ADC-TM (ADC thermal monitoring)
> >>> PMIC interface. This includes several onboard sensors and the XO thermal
> >>> sensor.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >> [...]
> >>>
> >>> +     channel@144 {
> >>> +             reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
> >> This define should be cleaned up.. Since it takes a sid argument,
> >> it really is ADC7_AMUX_THM1_100K_PU(sid)
> >
> > I don't think I understood your comment. The define itself is specific
> > to PM8350, other PMICs might have different channel assignments.
>
> include/dt-bindings/iio/qcom,spmi-vadc.h
> 263:#define ADC7_AMUX_THM1_100K_PU                      0x44

Do you want to define PM8350_ADC7_AMUX_THM1_100K_PU(sid) using
ADC7_AMUX_THM1_100K_PU ?
Or to make all users use ADC7_AMUX_THM1_100K_PU? Or add the SID
argument to ADC7_AMUX_THM1_100K_PU and switch to it?

>
> Konrad
> >
> >>
> >> Konrad
> >>
> >>> +             qcom,hw-settle-time = <200>;
> >>> +             qcom,ratiometric;
> >>> +             label = "skin_msm_temp";
> >>> +     };
> >>> +
> >>> +     channel@145 {
> >>> +             reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
> >>> +             qcom,hw-settle-time = <200>;
> >>> +             qcom,ratiometric;
> >>> +             label = "camera_temp";
> >>> +     };
> >>> +
> >>> +     channel@146 {
> >>> +             reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
> >>> +             qcom,hw-settle-time = <200>;
> >>> +             qcom,ratiometric;
> >>> +             label = "therm1_temp";
> >>> +     };
> >>> +
> >>> +     channel@147 {
> >>> +             reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
> >>> +             qcom,hw-settle-time = <200>;
> >>> +             qcom,ratiometric;
> >>> +             label = "wide_rfc_temp";
> >>> +     };
> >>> +
> >>> +     channel@148 {
> >>> +             reg = <PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
> >>> +             qcom,hw-settle-time = <200>;
> >>> +             qcom,ratiometric;
> >>> +             label = "rear_tof_temp";
> >>> +     };
> >>> +
> >>> +     channel@14c {
> >>> +             reg = <PM8350_ADC7_GPIO3_100K_PU(1)>;
> >>> +             qcom,hw-settle-time = <200>;
> >>> +             qcom,ratiometric;
> >>> +             label = "therm2_temp";
> >>> +     };
> >>> +
> >>>       channel@303 {
> >>>               reg = <PM8350B_ADC7_DIE_TEMP>;
> >>>               label = "pm8350b_die_temp";
> >>>       };
> >>>
> >>> +     channel@348 {
> >>> +             reg = <PM8350B_ADC7_AMUX_THM5_100K_PU>;
> >>> +             qcom,hw-settle-time = <200>;
> >>> +             qcom,ratiometric;
> >>> +             label = "usb_conn_temp";
> >>> +     };
> >>> +
> >>>       channel@403 {
> >>>               reg = <PMR735A_ADC7_DIE_TEMP>;
> >>>               label = "pmr735a_die_temp";
> >>>       };
> >>> +
> >>> +     channel@44a {
> >>> +             reg = <PMR735A_ADC7_GPIO1_100K_PU>;
> >>> +             qcom,hw-settle-time = <200>;
> >>> +             qcom,ratiometric;
> >>> +             label = "qtm_w_temp";
> >>> +     };
> >>> +
> >>> +     channel@44b {
> >>> +             reg = <PMR735A_ADC7_GPIO2_100K_PU>;
> >>> +             qcom,hw-settle-time = <200>;
> >>> +             qcom,ratiometric;
> >>> +             label = "qtm_n_temp";
> >>> +     };
> >>>  };
> >>>
> >>>  &remoteproc_adsp {
> >
> >
> >



-- 
With best wishes
Dmitry
