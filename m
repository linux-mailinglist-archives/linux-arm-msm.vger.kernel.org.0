Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 638D46B5C40
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 14:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjCKNcT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Mar 2023 08:32:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjCKNcS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Mar 2023 08:32:18 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D2102E0F9
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 05:32:17 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-536af432ee5so154158167b3.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 05:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678541536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JROGcEBcLkwWjsFbL29UK7bVFuHFrwh+heAFvT0sBUc=;
        b=y8M8LIyCYjgptBoJ7w1GsZrnQB8ex02EXdkVW0q4iX+ZYIo5qaJgM52z+EAzOhdpI7
         U0m/s6UG1WEXitNCHizAT7u7UEn36f7JBvvLcHcHz6KTdEEVlsiLf6GU4D4hqzEhT7N7
         fp3D/A4LrGRotn/4HUEpB748FEN6Eh3dladYyZApbrnfhsXN42YHny3lW4+AnRzCjTK8
         BfGSayUI0ZxsddGbVjymkThUwsRHF5qoCuNs6KoLHbvx779xEkimrvhl7OQASqaU9dxz
         UUKtrkPwgcLQzVbHsSEgmJgjYh11m8hG885pM1zAGPyoMhewZUsWalV+oBZiOGEFNHzF
         5WWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678541536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JROGcEBcLkwWjsFbL29UK7bVFuHFrwh+heAFvT0sBUc=;
        b=lk91MItq2XvjbSayhC48xgkyvsDl90MxnQVDExstxV7DcAkyQvEZyCrVchM1CH6qT2
         CdKjEWwW7Zv1s7rz3/Mq+FhW1B1Zev1NRD15bZV62Ap1DX02lktQ6PYT8NbENzlGJ0w1
         G8KuE1MCNk4Kze/CTKnsNa1deCMAV3TlfkyzjxzA9a1/lxmOeCOviUTH2G+grvTDChG6
         gQx+GLyYGlDTu5jZR58w0wDgbQn2DA7f5IfK16dq07CXaRxCvDVIVi2JMAkJc8DTyIMR
         cutDZ7rlNtTTSBhK6aU4myFE4SbT53AocyeSRxXnpTQyG0PoUi9t15+PnqnLAIJBHsaF
         7Pew==
X-Gm-Message-State: AO0yUKVetLrZ1yWVriIRfGs80CL+qkPdvVx8uj3+8UjVG4XRezv0BKP2
        fepvbcLugpXeXe8pGf08RyAS5PT5IU7pc/FwLHr7JA==
X-Google-Smtp-Source: AK7set/7HiHYL5eW78ZBNSZ38mIUB1aBNYtIXyUpaYdA5rIb/ax8pB0saCrGLSs60FsOsiJMqZI7dRGrbLExw+I5shQ=
X-Received: by 2002:a81:ae66:0:b0:541:7266:3fd7 with SMTP id
 g38-20020a81ae66000000b0054172663fd7mr656589ywk.3.1678541536631; Sat, 11 Mar
 2023 05:32:16 -0800 (PST)
MIME-Version: 1.0
References: <20230228-topic-qos-v7-0-815606092fff@linaro.org>
 <20230228-topic-qos-v7-6-815606092fff@linaro.org> <50f03895-816f-be8d-d956-d237fb13f5a0@linaro.org>
 <6d10906e-08cd-0380-5f5d-3ac0eec60276@linaro.org> <67590cd3-5543-59ed-6158-b272103ebd05@linaro.org>
 <858a8925-f11b-652d-3f02-f5ceea7d11fa@linaro.org> <74c0c724-b6a9-3755-7f56-9f421cece1a3@linaro.org>
 <500c7924-c43c-4233-1688-f8b6fbbad66f@linaro.org> <544e6f22-f2f4-2c7c-1978-a96c9763e2ab@linaro.org>
In-Reply-To: <544e6f22-f2f4-2c7c-1978-a96c9763e2ab@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 11 Mar 2023 15:32:05 +0200
Message-ID: <CAA8EJpr_zrk0cikiE52xvxBFTfj4Bq93UdOxVyThvkRoJayDKw@mail.gmail.com>
Subject: Re: [PATCH v7 6/9] interconnect: qcom: rpm: Handle interface clocks
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 11 Mar 2023 at 14:11, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 11/03/2023 00:54, Konrad Dybcio wrote:
> >> - Update the commit log and potentially the structure comments
> > I'm probably just very biased because I authored these commits, but I can't
> > see which part is not clear.. Could I (and this is not passive-aggressive or
> > anything) ask for a pointer there?
> >
>
> I mean to say "non scaling clocks" isn't an indicator IMO of the fact
> that these are QoS node specific clocks.
>
> Right now the interconnect model is predicated on bus and bus_a but,
> you've found that on some SoCs we have node-specific clocks too.
>
> :g/non\ scaling/s//non-scaling\ node-specific/g
>
> would do or "QoS node-specific" the fact the clocks don't scale is
> incidental the dependency though is that IMO at least these are
> additional node-specific clocks we need to enable.

This looks somewhat close to what we have observed in the patches for
ipq9574 platform. It doesn't have a scaling interconnect (in other
words, no bus clocks), but some devices have clocks driving the NIU
(Network Interface Units) which connect the device to NoC.

>
> ---
> bod




--
With best wishes
Dmitry
