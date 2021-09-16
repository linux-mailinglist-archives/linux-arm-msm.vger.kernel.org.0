Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D96C40DDF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 17:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238950AbhIPP3Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 11:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238927AbhIPP3X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 11:29:23 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68541C061766
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:28:03 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id g9so8359939ioq.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9PGyga+u2JMpsASTRDGCIEIQqGlu+knYZsympOND9rQ=;
        b=InU3QiCwubwJ7wJwH2fV9uC/toVkZlNbVLSyRxruFnAVHOXGg8qvphDFYNBNPGxhhe
         4mmIwTZtIsJwMy6F0zfAo1dq23wBKs4+xMPWb339vAePTt0htSMmm0NVpzhLB1T7WH6k
         ohYTSufm2x5u42lzIV0PUetLBqPuk6V88BKEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9PGyga+u2JMpsASTRDGCIEIQqGlu+knYZsympOND9rQ=;
        b=T5NYe/z+YB+G6krY9ZuzevpLFQP384Z1TTnbJvDRkHr3w0BzDSndxNesK13tpd1hxl
         Xj8EgjI4BwtyCTIifXXBOd/xAktzG+1cjbiUmFyV/wFD76Xm7ITH/Pkqxv5Tn0i/Bi6P
         ZMYfrybddnNX5YBO9XsdRrZzAKnq1ye/PqZwjmsOOigeDsXRE2SxyGcCzmZs1lTYuSBy
         +PErk951D+L4OMtUk8EwA0/b/dIJ1+W1v9jMPeuBLXoVM9TO6y0fF7u3Fgj1nfPOjslH
         KeJlnYFW5NYQ6H3BoQcs35e3wJI4E6qmMDvAMvbnFRYJVkW8IFQmlXw0rrk51S2k7HoL
         vTpg==
X-Gm-Message-State: AOAM531SQQssYjnxDOaZKvOqZeYZ6/fkhrUvMPAS4Aaxj9ef4iebXeKL
        +BTnzQCtWi3k2jprfIACToQSnpGzxPF9qw==
X-Google-Smtp-Source: ABdhPJyhavIBTTj5zitfnpr70AasyoiU8NjnyPg5L7jWybXRaWbcyTS0GSpMIIHFyCK8GoMdaSS3IA==
X-Received: by 2002:a5e:c603:: with SMTP id f3mr1258508iok.14.1631806082698;
        Thu, 16 Sep 2021 08:28:02 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id y27sm1863326iot.10.2021.09.16.08.28.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 08:28:02 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id x2so6962934ila.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:28:01 -0700 (PDT)
X-Received: by 2002:a92:da0c:: with SMTP id z12mr4329512ilm.120.1631806081058;
 Thu, 16 Sep 2021 08:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210830080621.1.Ia15d97bc4a81f2916290e23a8fde9cbc66186159@changeid>
In-Reply-To: <20210830080621.1.Ia15d97bc4a81f2916290e23a8fde9cbc66186159@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 16 Sep 2021 08:27:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XSFHgUEo2BrEY+o7Vavd3jHcwSZ7hKgwYOTPSHhHaZAw@mail.gmail.com>
Message-ID: <CAD=FV=XSFHgUEo2BrEY+o7Vavd3jHcwSZ7hKgwYOTPSHhHaZAw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Move the SD CD GPIO pin out of
 the dtsi file
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Aug 30, 2021 at 8:07 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> There's nothing magical about GPIO91 and boards could use different
> GPIOs for card detect. Move the pin out of the dtsi file and to the
> only existing board file.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sc7280.dtsi     | 4 ----
>  2 files changed, 1 insertion(+), 4 deletions(-)

If there are no concerns with this patch, I think it's ready to land
now. Thanks!

-Doug
