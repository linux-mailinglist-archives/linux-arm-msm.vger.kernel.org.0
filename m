Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24D63518CDE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 21:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241755AbiECTOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 15:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240276AbiECTNu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 15:13:50 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101E6E0C
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 12:10:17 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-e2fa360f6dso18155014fac.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 12:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=uaCl1B6CRw3idSw/17VvXAUHofDaVIGumwmcbBf6ZFU=;
        b=lBJ2+sVqy+m/C8NUXP3kz8uvDDJ9B7RRk7suGv2Sn2hxFH139JgdhwXwQBQveskzXF
         mRBqiy17WdYUXBcQy0lGhN5gOIJFHEDg5V645YcA5tVjNrROuz/38F20n4GDDWIedkEH
         4Cjkzef5G9b+sRFgBRSn7XYpn4z1JRslLef/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=uaCl1B6CRw3idSw/17VvXAUHofDaVIGumwmcbBf6ZFU=;
        b=CYHWb81PyrhxCYwP8XkoBFsFwGivoKF+PabT9JupQi96JbySFWrwikCnjtqWAjSpiN
         hXHZY7j76EMHjVQRWZSR42/S4ZBV/4fxpxEww4eF9/K/k7n19BTX9aVBKBqlcKRD7Q6T
         ACBFXCdPyP+hnf0AOahgY0c3Ta+KAc1f4B/SYVGvws7f/6qrY6GtRnHhgjEC22F2LN/N
         odn4a0BJhheLesZFcrOceV7xML96OY84IqtDxgmYNK09nY7wJXbIOKEUCKUwmmX9hWPQ
         ZEEqw7MW7fAISOCablAVND6Dlllc/EZOUwEbrLa2mtZE8OZKPWyRvBi7HplwHzd5+qOm
         7Qlg==
X-Gm-Message-State: AOAM532mgpmqnFVJMfdZB266zQD/bjF8F5oQXDDP5XLaelVBtykOG0JV
        1D2zu/UXlMUzMo+TvG3vVwlP0aVBptxEt4s2ngjM5Q==
X-Google-Smtp-Source: ABdhPJxFo5ggHOe9zdlulHSM44IQnMv8I2mC2dQpMif5+K6t2vh0Q6drt/5w1RKhWfqyrRvUEB63FcHidy2pvPXW9Uk=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr2456555oao.63.1651605015976; Tue, 03
 May 2022 12:10:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 May 2022 15:10:15 -0400
MIME-Version: 1.0
In-Reply-To: <20220503113246.13857-1-quic_tdas@quicinc.com>
References: <20220503113246.13857-1-quic_tdas@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 3 May 2022 15:10:15 -0400
Message-ID: <CAE-0n53QZn8VYB-dxzwccYDURU-0qW3ZwsuOEECwrKGAhYzwgw@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio
 clock controllers
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2022-05-03 04:32:46)
> Add the low pass audio clock controller device nodes. Keep the lpasscc
> clock node disabled and enabled for lpass pil based devices.

Does it mean that we're going to have overlapping reg ranges between
nodes in DT for clk controllers? That is not proper DT style, indicating
that we should combine the overlapping nodes and then have some
compatible or DT property telling us how to treat the clks in the audio
subsystem.

>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
> [v4]
>  * Mark lpasscc[lpasscc@3000000] device node as "disabled".
