Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84CEE74417E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 19:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbjF3Rmj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 13:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbjF3Rmh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 13:42:37 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6052122
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 10:42:35 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-bff27026cb0so2065850276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 10:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688146955; x=1690738955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5GBVbHOFTdsyQJU8GGb14QvACpNRgooKdXsV/1n/jmE=;
        b=XIVwvb9ZkoK9yR1KK3wGqQiI5P1EA8aljusSHRUNJL6khr7ZfLkl948A85RZCIR882
         8XIkJG1rilOdOE6NFGi2sP4imn+Mg/ruQMamjrzH0qxDjK4mSERGFBDLHE78v2KI9c9B
         5WTugaH2dk3pCxdZRCvz9txTIuzlhS7UFVsWFPnexuzA1NhQKPOD0Bmh8wbbG19K/tbu
         Ara2OJOMLWzxwyYTH7lKDNeykcxgTSx3Fs3hppttITd0d2tpXGC7x3a1DHQhhRop40p2
         qZ6NJAfsCQ+JdbH3/1WxW6GmYSYtsDBWkWrxisbmtHmAlFKNcbALUVKSO4RXNSPNdfhv
         BJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688146955; x=1690738955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GBVbHOFTdsyQJU8GGb14QvACpNRgooKdXsV/1n/jmE=;
        b=MTJB6/2GsQ+azFJ9gmrhAhDL7fKvxsMiKSDJJxsEQVD0U67ivT+wvhiDbZJSo5IEDI
         U8QY4cvBkKZ4iOeEFwjtderEZ6atEhwyi+qq2YnG/OSjbPJWQumndA2wFS7573IGevRX
         s6qT81lfoHXTsvBcNEims4j9Mb2A9GCi/zQzeEd2sVby9VnrYnCp69kWj5+F0DhSxzx4
         yHsfBYxD/bRibO4YqinKfC1vQzAzuh+d7dbTl/FBXYH/1f2A8R+tWciwWXXMMhLGz7Iy
         bbGQs5TCXoXFb7MQKN07GiQAe1yrFLwiH9E3izn2dBT+9DJZV0+hEOLijBYVWhoG6vjD
         RpKw==
X-Gm-Message-State: ABy/qLZlildBWo20J5ZwvvEmDcs93qkTrwWvbwdPz/C7DLbl+u86hT8i
        zNLttygBaSMoXiIiVXKyvSdiYvyQ3+f0Z1aqmZRweg==
X-Google-Smtp-Source: APBJJlHEHXl3UILh2Mi9iFeCzRu6oPkIpCEYs+FuX67r8o+chF6UivHFOFWZstM8v89A8IaytZ+uanrvsla7hDq/bxI=
X-Received: by 2002:a25:db87:0:b0:c01:4d4a:cbaa with SMTP id
 g129-20020a25db87000000b00c014d4acbaamr3214487ybf.37.1688146955047; Fri, 30
 Jun 2023 10:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-8-dmitry.baryshkov@linaro.org> <c59d002b-9d06-d744-d90b-22da4186522a@linaro.org>
 <CAA8EJpp+b1KVaMK82j7T=iGovXVAu3jq51rTHu6yqPcnkwXoeg@mail.gmail.com>
 <65d9025b-134d-eb8c-98d8-ab7103a5dc44@linaro.org> <CAA8EJpopHRNTyuzi2V=1t7o5xbXaCjxjP=yQUigCYDJMULxb=Q@mail.gmail.com>
 <e2c6abdc-f586-be9c-b400-7bf57021d5fa@linaro.org>
In-Reply-To: <e2c6abdc-f586-be9c-b400-7bf57021d5fa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 30 Jun 2023 20:42:23 +0300
Message-ID: <CAA8EJpoN0nVJdBwYfRkS305fWjbHL6BUxcgo1CmS8jmn6gp2jg@mail.gmail.com>
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

On Fri, 30 Jun 2023 at 19:15, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 30.06.2023 14:57, Dmitry Baryshkov wrote:
> > On Fri, 30 Jun 2023 at 14:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >> On 30.06.2023 12:07, Dmitry Baryshkov wrote:
> >>> On Fri, 30 Jun 2023 at 11:19, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>>>
> >>>> On 30.06.2023 08:13, Dmitry Baryshkov wrote:
> >>>>> Add thermal zones controlled through the ADC-TM (ADC thermal monitoring)
> >>>>> PMIC interface. This includes several onboard sensors and the XO thermal
> >>>>> sensor.
> >>>>>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>> [...]
> >>>>>
> >>>>> +     channel@144 {
> >>>>> +             reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
> >>>> This define should be cleaned up.. Since it takes a sid argument,
> >>>> it really is ADC7_AMUX_THM1_100K_PU(sid)
> >>>
> >>> I don't think I understood your comment. The define itself is specific
> >>> to PM8350, other PMICs might have different channel assignments.
> >>
> >> include/dt-bindings/iio/qcom,spmi-vadc.h
> >> 263:#define ADC7_AMUX_THM1_100K_PU                      0x44
> >
> > Do you want to define PM8350_ADC7_AMUX_THM1_100K_PU(sid) using
> > ADC7_AMUX_THM1_100K_PU ?
> > Or to make all users use ADC7_AMUX_THM1_100K_PU?
>
>
> >Or add the SID
> > argument to ADC7_AMUX_THM1_100K_PU and switch to it?
> This.
>
> Since we have a generic binding for it (not sure what sort of ABI-ish rules
> apply here, probably not very many since it's just a dumb preprocessor define),
> we should not redefine it for each PMIC, especially since the SIDs are variable
> nowadays :/

I think it would be worth to have per-PMIC headers (which define which
channels are available on this PMIC), but to use values from the
qcom,spmi-vadc.h  header to define those per-PMIC values.

WDYT?

>
> Sorry for being too vague.
>
> Konrad
> >
> >>
> >> Konrad
> >>>
> >>>>
> >>>> Konrad
> >>>>
> >>>>> +             qcom,hw-settle-time = <200>;
> >>>>> +             qcom,ratiometric;
> >>>>> +             label = "skin_msm_temp";
> >>>>> +     };
> >>>>> +
> >>>>> +     channel@145 {
> >>>>> +             reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
> >>>>> +             qcom,hw-settle-time = <200>;
> >>>>> +             qcom,ratiometric;
> >>>>> +             label = "camera_temp";
> >>>>> +     };
> >>>>> +
> >>>>> +     channel@146 {
> >>>>> +             reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
> >>>>> +             qcom,hw-settle-time = <200>;
> >>>>> +             qcom,ratiometric;
> >>>>> +             label = "therm1_temp";
> >>>>> +     };
> >>>>> +
> >>>>> +     channel@147 {
> >>>>> +             reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
> >>>>> +             qcom,hw-settle-time = <200>;
> >>>>> +             qcom,ratiometric;
> >>>>> +             label = "wide_rfc_temp";
> >>>>> +     };
> >>>>> +
> >>>>> +     channel@148 {
> >>>>> +             reg = <PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
> >>>>> +             qcom,hw-settle-time = <200>;
> >>>>> +             qcom,ratiometric;
> >>>>> +             label = "rear_tof_temp";
> >>>>> +     };
> >>>>> +
> >>>>> +     channel@14c {
> >>>>> +             reg = <PM8350_ADC7_GPIO3_100K_PU(1)>;
> >>>>> +             qcom,hw-settle-time = <200>;
> >>>>> +             qcom,ratiometric;
> >>>>> +             label = "therm2_temp";
> >>>>> +     };
> >>>>> +
> >>>>>       channel@303 {
> >>>>>               reg = <PM8350B_ADC7_DIE_TEMP>;
> >>>>>               label = "pm8350b_die_temp";
> >>>>>       };
> >>>>>
> >>>>> +     channel@348 {
> >>>>> +             reg = <PM8350B_ADC7_AMUX_THM5_100K_PU>;
> >>>>> +             qcom,hw-settle-time = <200>;
> >>>>> +             qcom,ratiometric;
> >>>>> +             label = "usb_conn_temp";
> >>>>> +     };
> >>>>> +
> >>>>>       channel@403 {
> >>>>>               reg = <PMR735A_ADC7_DIE_TEMP>;
> >>>>>               label = "pmr735a_die_temp";
> >>>>>       };
> >>>>> +
> >>>>> +     channel@44a {
> >>>>> +             reg = <PMR735A_ADC7_GPIO1_100K_PU>;
> >>>>> +             qcom,hw-settle-time = <200>;
> >>>>> +             qcom,ratiometric;
> >>>>> +             label = "qtm_w_temp";
> >>>>> +     };
> >>>>> +
> >>>>> +     channel@44b {
> >>>>> +             reg = <PMR735A_ADC7_GPIO2_100K_PU>;
> >>>>> +             qcom,hw-settle-time = <200>;
> >>>>> +             qcom,ratiometric;
> >>>>> +             label = "qtm_n_temp";
> >>>>> +     };
> >>>>>  };
> >>>>>
> >>>>>  &remoteproc_adsp {
> >>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
