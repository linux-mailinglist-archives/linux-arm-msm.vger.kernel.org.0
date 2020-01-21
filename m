Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7EF144613
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 21:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgAUUte (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 15:49:34 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:36303 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728682AbgAUUte (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 15:49:34 -0500
Received: by mail-vs1-f67.google.com with SMTP id u14so2811077vsu.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 12:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EBEGZV2vj1MH0BvdgXGZZpVTB7oeQn2dvK8l+QN95lQ=;
        b=TMX1B8aJ0mdwyfWvhX3zw7IXUIZkSTpKbZyScUvStUxTx7Q9NKUZgT4sgEcmjjrk9P
         2nWvtVgAI4y13hFYT0QIelOR0ot1cS9WHWuxz0H09Ufx1/J8l3vCTMoXRTejA2iZxByt
         eTrt6dXm8H8h/06oBVvjTXLs7kgKY1Sdpq/Sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EBEGZV2vj1MH0BvdgXGZZpVTB7oeQn2dvK8l+QN95lQ=;
        b=iNFbi392QO0llzxMJKLcOoyLfCLPI/QyTQQaR/Z8DtfksA543c0/pARK4Y/GyuKQyb
         f8kNBUyViVeESlfYafpfXCoCVavlL7Y/XtLDl20ytNMzSXe7/OypLlezFCIyOD0wN2gd
         GxNKSP7celUcYqNQZvRaFyBXPzKKjH2ZYQlFW1PGF+4FTt4hR5/oxL7BUc14BtbyKDcF
         SIJQA4KlGsWpGBIH+f0PplDcDiUl+lraUYPTJcT0zrtJ0Xki1D6y8YhtgQUxM05720at
         ibZ4nWgA1ne6R41TE/O3fWkHeH39R9ITuY9wWmmovFtzY7tVt0e1mZl8GtoTMhTQmOUR
         jNuw==
X-Gm-Message-State: APjAAAW2pQ2x0ddarFLALm/z9axzjrFvSKAwwpXTB4Lw+bbAsPZPruVk
        TQXLcf+E5/j8nAda1ZoxjLrrg/aJ3p0=
X-Google-Smtp-Source: APXvYqxcDbQDZ2ojf0AyGlPcWsHy0pg7pgjOcZEy+oGDz32DMnX1o5qX5DtKK5yvrmkz/7Ha2rrqnw==
X-Received: by 2002:a67:6842:: with SMTP id d63mr476309vsc.171.1579639772778;
        Tue, 21 Jan 2020 12:49:32 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id k6sm9208813vsc.26.2020.01.21.12.49.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 12:49:31 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id u14so2811024vsu.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 12:49:31 -0800 (PST)
X-Received: by 2002:a67:e342:: with SMTP id s2mr473558vsm.198.1579639771288;
 Tue, 21 Jan 2020 12:49:31 -0800 (PST)
MIME-Version: 1.0
References: <20200121171806.9933-1-swboyd@chromium.org>
In-Reply-To: <20200121171806.9933-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 21 Jan 2020 12:49:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UAvQYemJonDhs3d700XYP7o5shgTwyMo1exzRCaapkXA@mail.gmail.com>
Message-ID: <CAD=FV=UAvQYemJonDhs3d700XYP7o5shgTwyMo1exzRCaapkXA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Disable pwrkey on Cheza
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jan 21, 2020 at 9:18 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We don't use the power key from the PMIC on Cheza. Disable this node so
> that we don't probe the driver for this device.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8998.dtsi       | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
