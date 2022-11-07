Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3857161FAB4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 18:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232273AbiKGRAo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 12:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbiKGRAn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 12:00:43 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8569722B16
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 09:00:39 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id kt23so31805609ejc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 09:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aK/Mb1lQmrWp0WIZzAQZyGa5kst0gFmBMRnnMnq6heo=;
        b=YEKGVkj/9lV6H+WKl0DAv5UsTSd+466O/ymx34swbdZo5yizFGQodVqLifmQr1B9Ts
         P//nlccbfUoJEv5iOO2ROpD1floSrnCSDZBZ8NO14TGSi7FGdj52KeZbbE8QJ6dB0UzZ
         Yzal/BE/Z4JuuZAvAx4mN8D0lQbULbSyaxyGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aK/Mb1lQmrWp0WIZzAQZyGa5kst0gFmBMRnnMnq6heo=;
        b=JsdiCpCwonI7ID6tyScCUTX3E9vYbg/Eu6W4I/qb+petNCNZ0eJpSaEmR+yfmW5rj2
         H/1sHA5xQLgZpwk1HKJQhkQQbVIj4CFefHohaJZFHXkLMSV0w60ZFIzrjBuqjMcHURY/
         0p7qYpv+IyX8fBbDJNJo8ZkxpnVDp8xA5tSUP+q7/ATuXW4kG6vY4GSQUciOUC8udT4g
         Zel84bR4CqZW/fZ/Lus5J6SBWoEurOhG7+MVp5q15QO7SP3zckaPw7UZaq96s2rAFkzT
         Fyyx8WR6JeQeDBorHy/GC1Tf2nGC0OPnyvPn4g4iCVIPgsYYq0k0PjH3uZlWfhq8ezEU
         KlMw==
X-Gm-Message-State: ACrzQf1qDYTrIAWnEThJjQZKepZt93cLn8PaveW6EVOPF2cgZuZbfVRG
        c01qZB8UEDpOewKjwZOt5qcPNXOAkLJNiRRn
X-Google-Smtp-Source: AMsMyM7CO3pCH8eRappsLSGu6deYphuFmUJpn71HUYvz0WFKbSbuJSE1K+uhvI53llZjwEMAcpQuoQ==
X-Received: by 2002:a17:906:2353:b0:7ad:daae:6edd with SMTP id m19-20020a170906235300b007addaae6eddmr38473593eja.40.1667840437339;
        Mon, 07 Nov 2022 09:00:37 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id x4-20020aa7d6c4000000b0045cf4f72b04sm4418084edr.94.2022.11.07.09.00.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 09:00:33 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso7557293wmo.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 09:00:32 -0800 (PST)
X-Received: by 2002:a05:600c:2212:b0:3cf:6068:3c40 with SMTP id
 z18-20020a05600c221200b003cf60683c40mr34107154wml.57.1667840431739; Mon, 07
 Nov 2022 09:00:31 -0800 (PST)
MIME-Version: 1.0
References: <1666159535-6447-1-git-send-email-quic_c_skakit@quicinc.com>
 <CAE-0n52N6oxSLoU_=Cq1xK9bVX7H+AvPsR3dLepMNjKywdffvQ@mail.gmail.com> <21cd992c-334e-3a28-f3ac-68a49a4ef00b@quicinc.com>
In-Reply-To: <21cd992c-334e-3a28-f3ac-68a49a4ef00b@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 7 Nov 2022 09:00:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WRCJ6d6jTHH2ZHvuh+c4yTeXhS_D5LZcvfMn1c4NP2aA@mail.gmail.com>
Message-ID: <CAD=FV=WRCJ6d6jTHH2ZHvuh+c4yTeXhS_D5LZcvfMn1c4NP2aA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: Update the force mem core bit for GPU clocks
To:     "Satya Priya Kakitapalli (Temp)" <quic_c_skakit@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tdas@quicinc.com, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Nov 6, 2022 at 9:38 PM Satya Priya Kakitapalli (Temp)
<quic_c_skakit@quicinc.com> wrote:
>
>
> On 10/28/2022 5:54 AM, Stephen Boyd wrote:
> > Quoting Satya Priya (2022-10-18 23:05:35)
> >> From: Taniya Das <quic_tdas@quicinc.com>
> >>
> >> There are few GPU clocks which are powering up the memories
> >> and thus enable the FORCE_MEM_PERIPH always for these clocks
> >> to force the periph_on signal to remain active during halt
> >> state of the clock.
> > I take it that missing this causes GPU to lose state when it suspends
> > and that confuses the driver?
>
>
> It is more related to GPU SMMU states and the stability issues that are
> encountered.

I see a very similar code sequence for sc7180. Is any similar fix
needed for sc7180, or is this something unique for sc7280?

-Doug
