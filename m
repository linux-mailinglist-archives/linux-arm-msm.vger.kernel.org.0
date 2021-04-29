Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B5A36EB73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 15:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237349AbhD2Nko (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 09:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237527AbhD2Nkn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 09:40:43 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6DCC06138C
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 06:39:55 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id b14so6965315qvf.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 06:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nayZswG1pGWH/1ZVEDlOm+OC2v9MFMOWazufEH7nVHg=;
        b=m2IptUcSZXqa1ZQ2PcIocz7TAM9fkvwY26tRwZC1KB4hwMB/b7f3fZvwKk+IbRrDTv
         TZKSui3NWe0UTSLJSfrfP1NHMSRrFPuoOgFluUMWIY/oUtj90ili9/Z+8EpkuSMDxd9Z
         9gcgKhxEE5WrYbaqR19u+uEFAOQhqvpSt0n6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nayZswG1pGWH/1ZVEDlOm+OC2v9MFMOWazufEH7nVHg=;
        b=BxP2z15EmY5BnCojWi9V1zV4/QfzD7GBBTt3T4fod5CEwT/xVqbrBQK1hCwlEmot/X
         ADyb12lou3Ek1U48jhwMar0dZi8i1puRv9Re9tX9EpzOh9VjPM2sW3zImkspWSnFQBqY
         t1c2DOq+R5tAvKAEHQyVBaIdF82iZeBIKURqSpAbugI7r69LWwzNr0nIOvHyA7djKeQu
         MXwkDxDdUiCe5mwkFIdzStV4muunyAe5ApEoMCK/S0ihFSvv2IdeoCP4UMhJa4pGNKbg
         jjnXL6gWJgyW3ik/w01glM4yUnFWNSRpfXlKQNe5rB32N1Mv3xawZipZDTapvgVtbC3M
         rmcw==
X-Gm-Message-State: AOAM530ZkDzOx3FeXnDXz/S90raa4hrRUBLXGsR2S8FDxAKW4MLCAKOX
        nHlqiw57OJyPkGV5bD1R9rIQHAuB18qYgg==
X-Google-Smtp-Source: ABdhPJxGp8i1IlGmtjca7aZuvaEEGSMcAQpwT80bvS1FcNZW7vJkw9Wdj8LU7zxcOizgQMuIYg/DYw==
X-Received: by 2002:a05:6214:2b0:: with SMTP id m16mr7928346qvv.4.1619703594630;
        Thu, 29 Apr 2021 06:39:54 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id h16sm2035342qto.11.2021.04.29.06.39.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 06:39:54 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id j6so10792233ybh.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 06:39:54 -0700 (PDT)
X-Received: by 2002:a05:6902:567:: with SMTP id a7mr20668343ybt.276.1619703593609;
 Thu, 29 Apr 2021 06:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <1619674827-26650-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1619674827-26650-1-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 29 Apr 2021 06:39:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UARyDuE+vEQGX4kTaQdMiPg6rX3K5CuYzkriQaviQbAQ@mail.gmail.com>
Message-ID: <CAD=FV=UARyDuE+vEQGX4kTaQdMiPg6rX3K5CuYzkriQaviQbAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document google,senor board
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 28, 2021 at 10:41 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Document the google,senor board based on sc7280 SoC
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
