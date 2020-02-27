Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4161726E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 19:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729580AbgB0STS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 13:19:18 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:34130 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729306AbgB0STS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 13:19:18 -0500
Received: by mail-vs1-f66.google.com with SMTP id g15so276302vsf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 10:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O3+t6YZki97dJn3TmsqtMQPSzhs2LsQfL/dODOkLgZk=;
        b=NVHhsqaJ7eLhlivtVpaS7uaXQFfxcmkuZnCtRTLYV3MYZWP6G1Y2cUurEHgtMKqGWL
         9h9VrA3IcEElvTZxH7PagPPJstv+J/QUbn1Dien0pGx99FV3Fe6vKPiVttL0b19DSN1n
         9EC8fsbCRcGXL2FQoLx/HsRiFdGof4zCx51nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O3+t6YZki97dJn3TmsqtMQPSzhs2LsQfL/dODOkLgZk=;
        b=iLudgoUMl/F/IQzwlkeqpKBLJuxq7U1JqZdWSrnFgWiUXv7FjmX1++juD3yVZ8wE4q
         66zkqW6D0wS/ASBIIVIOQcH1PgRf8g0ePoxZ4Bl2ASXWLrXN3tY8k3bjUEq9Ro0GZ0hK
         E3TlvYRu2A7HEcO8jxRCN2GbdCIvEsiCFyrZSndCYv3r8PScX4PCUUfVo4w1D82Fxy28
         T1XtqvTZNY3TldtF6tf9ujUD1CxDUyRZa9+sPGodX61rvvzpFj/G5L8YqduL8/8EovSu
         M0Xs4toNmRVH9jFly29QHgDyYnOf3EFDceq74wd6YOE685mj5WfU3iiUCmmjpWnbmT05
         RK/Q==
X-Gm-Message-State: ANhLgQ1WtezZeq2ViHi1iw5oI4AHqXrtzYlNq94bdvw78wx1yeLY2zer
        OXoxRqG/1ZF8LnbpyB2kK3HwBSoYIGA=
X-Google-Smtp-Source: ADFU+vvMrcgmrHC4T3nLMktgBMvSgjY7myos0OeCV3q4NfS3YHHuCjVxhRfYCHNTeSc5Fa4ObIbdqA==
X-Received: by 2002:a05:6102:8f:: with SMTP id t15mr343288vsp.77.1582827557187;
        Thu, 27 Feb 2020 10:19:17 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id p8sm2215384vkd.19.2020.02.27.10.19.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 10:19:16 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id o2so158617vka.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 10:19:16 -0800 (PST)
X-Received: by 2002:ac5:cdcd:: with SMTP id u13mr361384vkn.0.1582827555884;
 Thu, 27 Feb 2020 10:19:15 -0800 (PST)
MIME-Version: 1.0
References: <20200227092649.v3.1.I15e0f7eff0c67a2b49d4992f9d80fc1d2fdadf63@changeid>
In-Reply-To: <20200227092649.v3.1.I15e0f7eff0c67a2b49d4992f9d80fc1d2fdadf63@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 27 Feb 2020 10:19:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UuvSt0z+B4ymCW8u+c+rHQ5kGYtOQYGF8QLex__p31xQ@mail.gmail.com>
Message-ID: <CAD=FV=UuvSt0z+B4ymCW8u+c+rHQ5kGYtOQYGF8QLex__p31xQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: sc7180: Move venus node to the correct position
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Feb 27, 2020 at 9:26 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Per convention device nodes for SC7180 should be ordered by address.
> This is currently not the case for the venus node, move it to the
> correct position.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v3:
> - actually insert the venus node after usb@a6f8800 and not just
>   pretend to do it
>
> Changes in v2:
> - insert the venus node *after* the usb@a6f8800 node, not before
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 52 ++++++++++++++--------------
>  1 file changed, 26 insertions(+), 26 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
