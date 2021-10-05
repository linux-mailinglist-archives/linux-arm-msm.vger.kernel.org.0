Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC3F423063
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 20:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235113AbhJESwn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 14:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234500AbhJESwl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 14:52:41 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE8DC061753
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 11:50:50 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so107844otx.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 11:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Xo0OGV/ZUiPKgbD5HPrkjo/F/a3NnSi3YP8gAkh8iCY=;
        b=TLXgjh4ToYp4L5wZ9wa2GsVgHenprfEFVxFIhITFK0WYtOWIaJF8j4qZ6/RAQ9C1r6
         EpvOaDxqumTiruAkli7zPPmCKL0JSrF9LfGknFKwVgzHYam4/+1+Rr9UnfZlEU6cIl9U
         d8Q6IKYeC3/AyJhc+AeQmAzNNc8w99c60xeLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Xo0OGV/ZUiPKgbD5HPrkjo/F/a3NnSi3YP8gAkh8iCY=;
        b=PAw35Uv/IA4QkarwvaO8tv+S2j0nKt/3AVQgW50Vx552hcaD88Lx5Cv2r55ahVJO5I
         Rt/5WG9/wSrCGtbgpN3ZE5Tt6VGIzvnlEgNUXVqeRPG9IV49ZFgZ7Wb0M8vPuDiWFop1
         iOGkXpcqvbbiTt7LgaxgdG8sWNZ/SqLiHRUfkzMXebvAHtSDgeH3stpRDC7XaBVFlbzB
         f1MjzEru1zbrCzWiLuuWACMZXLt14C+tGOJYfxaux9YbdgmhYMVsXcR2/tXYUq+oqfDi
         rnNg67+KMePh6Ijd+xuPWAxurtMJxQjnXpQ3R94zZ02SUnfeLtcu0FyRaaGKbtydpxR/
         qDHg==
X-Gm-Message-State: AOAM530UddOdGVmn+BlajaiQjUVGQmRf+J6WXndxVQpHWkj47t1hDgJz
        S/pHda1M8dTdPfyjwkqT8pBS+748ApFYw8KPFMJZlg==
X-Google-Smtp-Source: ABdhPJxre14riLWd/0Vk02OXaJCmQW1uYI8QN3QfKNpl8EpzGV8Umsr6ysW7Vq58lYjpRA0Ei9xoDL68KK8/ibgSmx8=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr16259964otn.126.1633459849811;
 Tue, 05 Oct 2021 11:50:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 11:50:49 -0700
MIME-Version: 1.0
In-Reply-To: <1633459359-31517-4-git-send-email-pmaliset@codeaurora.org>
References: <1633459359-31517-1-git-send-email-pmaliset@codeaurora.org> <1633459359-31517-4-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 5 Oct 2021 11:50:49 -0700
Message-ID: <CAE-0n521dCW4mc_Fu=YZ8w-DOwrE_+4S1tmU3WUzA0B9ODfYUg@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org, svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org,
        linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Prasad Malisetty (2021-10-05 11:42:37)
> Enable PCIe controller and PHY for sc7280 IDP board.
> Add specific NVMe GPIO entries for SKU1 and SKU2 support.
>
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
