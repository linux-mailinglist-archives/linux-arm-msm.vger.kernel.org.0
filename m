Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA5997438FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 12:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbjF3KI0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 06:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233056AbjF3KIW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 06:08:22 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884193AB4
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 03:07:51 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-bd77424c886so1652573276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688119671; x=1690711671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k2fW+M48gYbDUccjgLpcMFUwDgh2+7WfsmzWyIA2Z90=;
        b=miLeKSJ0PdWfroZ0EaqD/r3IF1SIbRDlXhHLZU3PKqiGvwgomdhEOdFUmtTM3qDlOF
         whmtaBWX581BK6QcCjOim/uiG3r+xIf6AOzXbNsHoj4D/kAvTIEmQBDraqjcJ585dMS3
         hmvyTIRuGSk2is0aFPgiY1e9Oxs9qY6wXT8mw2lme7BVfl1AiilGm45eZS9lvm1SgzAt
         OpcbMYD53A1/tTLHjQu5JrgAvR/wg/wSIFloauJ/6eAYzeK5MtGI6NtjflDf+tD5e7mJ
         o4FhUmnVlhQ60qzNZvHcrp1zbQqwVtCnHcQb8FsZ2J3E1wYN5GAk7tCHNpnyM7+iGZKM
         ptKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688119671; x=1690711671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2fW+M48gYbDUccjgLpcMFUwDgh2+7WfsmzWyIA2Z90=;
        b=VkEWOn7Lx4BssVib5b3rRJQbNuqV8PrNMb/jMazuiSYC877U56AMPaeBgEQAnMXbQG
         7IPLw/8z7pq3yZK2qgkd6wzgwZm+koj3Zr+pGNM3k8BPwYqlADMKIL14QrnAkaQZPaYS
         uQkI8AgA6VqitlIY6pzkO2bvDfqu5S5k29pg9Pyty3WoU6/Q59/vjolhWf2Q/Eg4k9hg
         tlGo4HWyHsXl3nXXhJmhWZgp9Im077MNEnd0urtExPUi5b7dN066653Dcoe7xf91gIbg
         9TjQyv9MVizTTtvaQ3JCkBXMq0B74UkniJqhiPUyvMK3l8Imva9UxIsgswFtFptBbv1q
         xbzQ==
X-Gm-Message-State: ABy/qLbhpA/SDe4M48Jz1HkaIoQev3s7NRwaL1r5Po2S9rE5QIyIl11l
        TOX6k98etq1kpnUOnF+sCq04Fen0RMr9LoRWfkRrD2aFChF0bCM2
X-Google-Smtp-Source: APBJJlG8Y3i2ZlPGcSLKQN4jEo/O6g/C6MwsMfQDczxZ4l05R3m+c0mTHmCtRszEFdo+09/bI/trLihXjuXNd2M/fXw=
X-Received: by 2002:a25:901:0:b0:c11:a10:aad0 with SMTP id 1-20020a250901000000b00c110a10aad0mr2379524ybj.37.1688119670754;
 Fri, 30 Jun 2023 03:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-8-dmitry.baryshkov@linaro.org> <c59d002b-9d06-d744-d90b-22da4186522a@linaro.org>
In-Reply-To: <c59d002b-9d06-d744-d90b-22da4186522a@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 30 Jun 2023 13:07:39 +0300
Message-ID: <CAA8EJpp+b1KVaMK82j7T=iGovXVAu3jq51rTHu6yqPcnkwXoeg@mail.gmail.com>
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 30 Jun 2023 at 11:19, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 30.06.2023 08:13, Dmitry Baryshkov wrote:
> > Add thermal zones controlled through the ADC-TM (ADC thermal monitoring)
> > PMIC interface. This includes several onboard sensors and the XO thermal
> > sensor.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> [...]
> >
> > +     channel@144 {
> > +             reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
> This define should be cleaned up.. Since it takes a sid argument,
> it really is ADC7_AMUX_THM1_100K_PU(sid)

I don't think I understood your comment. The define itself is specific
to PM8350, other PMICs might have different channel assignments.

>
> Konrad
>
> > +             qcom,hw-settle-time = <200>;
> > +             qcom,ratiometric;
> > +             label = "skin_msm_temp";
> > +     };
> > +
> > +     channel@145 {
> > +             reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
> > +             qcom,hw-settle-time = <200>;
> > +             qcom,ratiometric;
> > +             label = "camera_temp";
> > +     };
> > +
> > +     channel@146 {
> > +             reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
> > +             qcom,hw-settle-time = <200>;
> > +             qcom,ratiometric;
> > +             label = "therm1_temp";
> > +     };
> > +
> > +     channel@147 {
> > +             reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
> > +             qcom,hw-settle-time = <200>;
> > +             qcom,ratiometric;
> > +             label = "wide_rfc_temp";
> > +     };
> > +
> > +     channel@148 {
> > +             reg = <PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
> > +             qcom,hw-settle-time = <200>;
> > +             qcom,ratiometric;
> > +             label = "rear_tof_temp";
> > +     };
> > +
> > +     channel@14c {
> > +             reg = <PM8350_ADC7_GPIO3_100K_PU(1)>;
> > +             qcom,hw-settle-time = <200>;
> > +             qcom,ratiometric;
> > +             label = "therm2_temp";
> > +     };
> > +
> >       channel@303 {
> >               reg = <PM8350B_ADC7_DIE_TEMP>;
> >               label = "pm8350b_die_temp";
> >       };
> >
> > +     channel@348 {
> > +             reg = <PM8350B_ADC7_AMUX_THM5_100K_PU>;
> > +             qcom,hw-settle-time = <200>;
> > +             qcom,ratiometric;
> > +             label = "usb_conn_temp";
> > +     };
> > +
> >       channel@403 {
> >               reg = <PMR735A_ADC7_DIE_TEMP>;
> >               label = "pmr735a_die_temp";
> >       };
> > +
> > +     channel@44a {
> > +             reg = <PMR735A_ADC7_GPIO1_100K_PU>;
> > +             qcom,hw-settle-time = <200>;
> > +             qcom,ratiometric;
> > +             label = "qtm_w_temp";
> > +     };
> > +
> > +     channel@44b {
> > +             reg = <PMR735A_ADC7_GPIO2_100K_PU>;
> > +             qcom,hw-settle-time = <200>;
> > +             qcom,ratiometric;
> > +             label = "qtm_n_temp";
> > +     };
> >  };
> >
> >  &remoteproc_adsp {



-- 
With best wishes
Dmitry
