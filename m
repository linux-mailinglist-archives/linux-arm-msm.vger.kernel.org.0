Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B259B4F4BD9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 03:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1450322AbiDEXGb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 19:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573401AbiDETHK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 15:07:10 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E73DFD7C
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 12:05:11 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id y7-20020a4a9807000000b003296ea2104eso1142045ooi.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 12:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=k/P4HTCZVEzfUWOOxOtQU6Kr5BhLM038HkP4cKbJxBw=;
        b=frQ8ZzBqSNym5klc+oZd3SLmKdd94Rs1jUZAtmY77iuFQm9Duihv7tj8Yah8hnsPDp
         n/VPsrAwxGWC1DFtvBBPAX4ZmuHQOHBWefUYwQ6CXziGqHWTaTDPWSykVDoKEI8jkZUF
         h54p3zRsPEsb9bERVG92imQjR75fFRdYw+R3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=k/P4HTCZVEzfUWOOxOtQU6Kr5BhLM038HkP4cKbJxBw=;
        b=WgkC74XhbLdZZYYNndJ8PLVGoBy7K8qlYyXvXQiN1aB9SXHuejMEne0A0v+EJQT8e6
         Sr6+o5q4vrR+wdWiyX6Kdcazu3wxUUptFlZV0uylVxIydZrWZd60w8+UkOX7HADTKLuJ
         c1dvf3FYGErgDhc4sYClRMM1osR0HLGxQ88b3iyKRty22qjq+FXzFNqfsAYhPy8UoeNU
         98W0/HA6JMhmE89Ef1PL8P4u9pnKA14SQgNQrGX9N+QuaLsnev6qQxOOwVyZ50Eu7IYF
         0pUlikjWK8u72RwDKcDdVTdrl5HDF8CTZLjAOd3qrxf2FraI/wvx7TBv6jOIuWx2fqeD
         Rvxg==
X-Gm-Message-State: AOAM530s16JGtWlJPb5LoF0xB8wvLcoivX0y+bh+LayXTsY4HYX/AHlw
        rcAOtzrO9PuOGZ3ZNq/79YOSjH+4KiSumaPhv0kMVg==
X-Google-Smtp-Source: ABdhPJweVtFg8E7N4djphN6bnwEALoFejs04NWhd4NdeHUBFdheJOkh0Eux+TUqAElSv5mcAiLpL4g8x+gFIwrbllYw=
X-Received: by 2002:a4a:650c:0:b0:324:b0a0:2d23 with SMTP id
 y12-20020a4a650c000000b00324b0a02d23mr1581619ooc.25.1649185511251; Tue, 05
 Apr 2022 12:05:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 14:05:10 -0500
MIME-Version: 1.0
In-Reply-To: <1649166633-25872-3-git-send-email-quic_c_skakit@quicinc.com>
References: <1649166633-25872-1-git-send-email-quic_c_skakit@quicinc.com> <1649166633-25872-3-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Apr 2022 14:05:10 -0500
Message-ID: <CAE-0n51S5nB=rgJbEX+rbMCQVyKcb7wpOEc3+R64t_Yr0cXTOQ@mail.gmail.com>
Subject: Re: [PATCH V9 2/6] dt-bindings: mfd: pm8008: Add pm8008 regulator bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-04-05 06:50:29)
> Add bindings for pm8008 regulators device.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
