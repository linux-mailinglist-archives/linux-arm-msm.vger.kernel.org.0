Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F41040DE1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 17:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239519AbhIPPes (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 11:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239507AbhIPPej (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 11:34:39 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EADE6C061767
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:33:18 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id a15so8399025iot.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ms3bl+nA5Ri+3UB+CCMQr3zf572ukgQ7gcT+ysEOLx4=;
        b=GCuBZd4DCB9aZj+pCfyCiLjwRu4LhUZquIp2PLs8FEt7Xt+aP6AYFjmRNrx2pLdLQO
         H7VqSWn/4MDPPI8YJ+CbpDmTTH+DRt4JLmX64snOhw2xy7fLxCGXDfmETRL3oUxZLHDj
         kreR9rErzUvoNNTD8le00ZhaWU4Ln4dzaTOr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ms3bl+nA5Ri+3UB+CCMQr3zf572ukgQ7gcT+ysEOLx4=;
        b=pwzoOqXYFgq/0ORcDSODPSNZgltCnD6YCQKh5MP5CxffMu8lA2aedAkyYouDX+iOwB
         kydoAqWBQ33ZXB25ZPylyd+VWnQIEahAITJwnoLSsHmCqy7R9goq/4ZhAzYffoC+SFBO
         7NaA+7MQQM6fplFmBv31jIp4UjoNH6480IHfb0gQhwnylNXJBN28J+41TndsJMGNN/L6
         RpwUUdcicQ2DJYmLyb2usvvmuINcJOIgy0D4Q42lhSBmfiApuhalZABwo0MqYRcBFvHY
         MYAG7zESDGvJ6OQHeVtj0PV+OwB393DoyP3EDobkYlLoiNR4jmx0axClkhI5MmI0m+r7
         UTtA==
X-Gm-Message-State: AOAM532p60/QxdIvYZd26+PKb/IZ4wqmD9sAI6OQIRe0wQ4/EEmA2RGp
        sq2nUwU3UxBkf4sT+rom6El36Q4OHUQ4AA==
X-Google-Smtp-Source: ABdhPJzB0AwzN7GCbmIYLlad+EuGftQLvCeF2P/73oXjs7mM7MLxhga3vtxKXcy8pfkK7NxuwCc89w==
X-Received: by 2002:a05:6638:1389:: with SMTP id w9mr4816627jad.138.1631806397809;
        Thu, 16 Sep 2021 08:33:17 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com. [209.85.166.169])
        by smtp.gmail.com with ESMTPSA id r7sm1905188ilm.5.2021.09.16.08.33.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 08:33:17 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id b8so6992078ilh.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:33:17 -0700 (PDT)
X-Received: by 2002:a05:6e02:1847:: with SMTP id b7mr4487370ilv.180.1631806396862;
 Thu, 16 Sep 2021 08:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210903122212.v2.1.I9777d0036ecbb749a4fb9ebb892f94c6e3a51772@changeid>
In-Reply-To: <20210903122212.v2.1.I9777d0036ecbb749a4fb9ebb892f94c6e3a51772@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 16 Sep 2021 08:33:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=rT5dLz6S7_y6kuZ4R_ijDZtdn25-UkHw2QhNVUu-hw@mail.gmail.com>
Message-ID: <CAD=FV=U=rT5dLz6S7_y6kuZ4R_ijDZtdn25-UkHw2QhNVUu-hw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180-trogdor: Delete ADC config
 for unused thermistors
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Sep 3, 2021 at 12:22 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The charger thermistor on Lazor, CoachZ rev1 and Pompom rev1+2 is
> either the wrong part or not stuffed at all, the same is true for
> the skin temperature thermistor on CoachZ rev1. The corresponding
> thermal zones are already disabled for these devices, in addition
> delete the ADC nodes of the thermistors.
>
> For Lazor and CoachZ rev1 also disable the PM6150 ADC and thermal
> monitor since none of the ADC channels is used.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v2:
> - also disable the ADC for Lazor and CoachZ rev1
> - updated commit message
>
>  .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts     | 14 ++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi | 12 ++++++++++++
>  .../boot/dts/qcom/sc7180-trogdor-pompom-r1.dts     |  8 ++++++++
>  .../boot/dts/qcom/sc7180-trogdor-pompom-r2.dts     |  8 ++++++++
>  4 files changed, 42 insertions(+)

I haven't done due diligence to review this patch since Stephen
already did, but it's been on the list of patches I was tracking that
I thought were ready to land. If there are no objections, it'd be a
keen time to land it. ;-)

-Doug
