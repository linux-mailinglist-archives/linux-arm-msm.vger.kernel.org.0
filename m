Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2C33315AF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 01:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234998AbhBJATD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 19:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234091AbhBIX7b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 18:59:31 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2C8C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 15:58:11 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id x3so372815qti.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 15:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H6mlUmFT8LIngqyTOnDVwQwuXJYKI4DArIuOUAqJRas=;
        b=KRIj5pJ5nbaaTkjPqe6uFIcdzKg6sZH7FpAGlqyzvmAq+SBMzVBEDgYpen8I/pUpYx
         tYGm9nY0jcmZOLD95tQCKY8EGTxW17AsAoTquk5XW7IGsRG1GVIxWUJSNmdjsKqRzw16
         Neplz477qqI9RyY8KhIkQe0Gxgadb1WtbbrVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H6mlUmFT8LIngqyTOnDVwQwuXJYKI4DArIuOUAqJRas=;
        b=cvPLitNthD0Gc4/EdOAv7RipZwp9D7unydOKywdoR559Vh6HfKGd6ujWpNlXhrWv4T
         96hTfzg20xTrkammXIf15MwGgVPjABOudNnCHo/nVK1VhB1nZNtNufFgwSJ7HqxY04CH
         3b7aMFFdxDcxYPsz1Y4Lu0zGuXrGdWpbVIzYfn1kkg+U2PE5Lu6UsdSk/yjPxH8uUarZ
         rB/AwBwTc/pb9+URJlJxVYoh8/UMoJZb/xt2XZSnE2dEji0NH0m6PVLXP4RQlNAxVBlw
         e6/Fo+vC7Hk9gEx9DJ+dvSCxXZ2MuQhpT3T3fUwIErhS+whBk19/bXKdEnleUSq83wHv
         YQ6A==
X-Gm-Message-State: AOAM532VvMJBfy9p7DZjnXNFbqT7eXW+P2enTMEJA0uNygs+S7ZJ8Kt7
        vEHy8csiR2ozbxIjF4cAbA4MG8USSnP3ww==
X-Google-Smtp-Source: ABdhPJw2dM6RwiZKMtLijxYOsuXfHU+Q1j3MWyT8oSZDsWY+3mVQQQkucyradKYfzcenLfT0y1CSxg==
X-Received: by 2002:ac8:7191:: with SMTP id w17mr484265qto.327.1612915090547;
        Tue, 09 Feb 2021 15:58:10 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id 138sm269080qkh.7.2021.02.09.15.58.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 15:58:10 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id i71so214325ybg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 15:58:09 -0800 (PST)
X-Received: by 2002:a25:60d6:: with SMTP id u205mr521474ybb.276.1612915089289;
 Tue, 09 Feb 2021 15:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20210209202849.1148569-1-dmitry.baryshkov@linaro.org> <20210209202849.1148569-4-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210209202849.1148569-4-dmitry.baryshkov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 9 Feb 2021 15:57:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W5SWYONzygS+mGnHB18pOLQv2U9R-qPCKry9+j9fuBrw@mail.gmail.com>
Message-ID: <CAD=FV=W5SWYONzygS+mGnHB18pOLQv2U9R-qPCKry9+j9fuBrw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8250: add pinctrl for SPI
 using GPIO as a CS
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

On Tue, Feb 9, 2021 at 12:29 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> GENI SPI controller shows several issues if it manages the CS on its own
> (see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
> use GPIO for CS")) for the details. Provide pinctrl entries for SPI
> controllers using the same CS pin but in GPIO mode.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 100 +++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
