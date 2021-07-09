Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7933C1CCC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 02:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbhGIAjQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 20:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbhGIAjQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 20:39:16 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02B8C061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 17:36:32 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id f93-20020a9d03e60000b02904b1f1d7c5f4so6922246otf.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 17:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=tuF3IuVNzqSNHva85jiAQLO3B1aho/MneB4ZBDZXRy8=;
        b=jpIHei6yaeR9akW+Y2UzwS3BRvAlIRfRrFNZhvlYnqWDx7G9nDGozYWuVtpWL/BHM3
         AfduFwh+mXRuS511r5CPbsQLpr3d+wy4/CKTpAB0UONTXs6Umz++imz9TOtz+faqMw3e
         A8AwypOmuQO/6PYrPosJ0P+dgDSl0gaE8YheE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=tuF3IuVNzqSNHva85jiAQLO3B1aho/MneB4ZBDZXRy8=;
        b=btrINtATOK2kE2x7sWVYjk6VnGm44ZH6O9RIUf4VBGq0ZNsSkVBIQNO8x8c5SmOuux
         IziB358bB0AkhmdrsOZ/3jCNFvX+25Dycj5CWksSIS/DNByN/nbE+HTmNgcwVRLd4Sj0
         rsO01D1YfK+hOSUXs7KVKI0yTuaeEb+zFDp4MBfDvJFl9xxFb7rN3RHUdq41cjXpegcQ
         a2KYLR1ItWJWKIUGb4Dg682GfbZ2ybMIQJPRuIwDYZ4hyjrA4rf7H4HOiB7nswwzBanw
         wXRgQkCna37q5JddisgF6khyZYBH9VZp4xEteKMMPUhqO50h8r2Fi6MA9kzCUSLBEWQS
         xf5Q==
X-Gm-Message-State: AOAM531vQlvzRdk0pAjq16vRO1wmlgDlTep99aWUBEsgtSeIDB18x+kI
        bkM3KBcERZ84RT88OUeMjvzQS2xsliaNjuF6qoQ+tQ==
X-Google-Smtp-Source: ABdhPJx8hj2gTCj9PYRTgACjYv7kxabHym1eg1FH9L7bh5Agk44u+REO6GOw2ek1V3BqEZO2n50wOS9SKzQHTosBO2I=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr26372930otf.25.1625790992061;
 Thu, 08 Jul 2021 17:36:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 9 Jul 2021 00:36:31 +0000
MIME-Version: 1.0
In-Reply-To: <1625576413-12324-4-git-send-email-sanm@codeaurora.org>
References: <1625576413-12324-1-git-send-email-sanm@codeaurora.org> <1625576413-12324-4-git-send-email-sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 9 Jul 2021 00:36:31 +0000
Message-ID: <CAE-0n520agdVS4H9Lfrs8agF4T6+P8665YTXjWcr_aqEDcRy4Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sc7280: Add USB nodes for IDP board
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2021-07-06 06:00:13)
> Add USB nodes for sc7280 IDP board.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
