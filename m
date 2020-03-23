Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6917218F407
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 13:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727337AbgCWMFU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 08:05:20 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43040 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbgCWMFU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 08:05:20 -0400
Received: by mail-ed1-f67.google.com with SMTP id bd14so2017359edb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 05:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2i68poVy8vRwd9t209Q59KIy3oA1QEuhKJcVAvdbNzQ=;
        b=n/FIUW93odegnuVAHbDAoqF5qOyvWhkd3r5gPEV60GzlYpZLNeo057Ey+kAPMGjTt1
         9BO1tOWT0UmCMGJNAu3/RpHV8hLZsbVOJBaccZdacpZZmLsvLRz0DSZaENog2N7Om8G+
         a2hY4aAjsTjF8TC8h+aKxtsJW6dMNSbtuprhA/Hn7BoTB2I2gbZirWlKjhRSUhoZjbGx
         jS5qTQWGfTK8V5FGN1StqPqir+0KAcVMhO80vPS/9zXMr6qBnqhZNFTf9BCFDUXnn9FY
         c1HNazUOzhxNg536OLMn53k5i+TjKOSwPmUsALqyaT+lv6ndCppTNmieeRy+cSHTZdZg
         XYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2i68poVy8vRwd9t209Q59KIy3oA1QEuhKJcVAvdbNzQ=;
        b=eEABRmyp5ojKbNL0N/oFnTxDtJVp8UTgClNxrpguKqrYYVWnbPJ2xXE2Z8cSrErUBq
         hmQPXvKOyAhbvAqKCEdA+wK0T0v3vOJFlgFQ+SfrRT0JHZGNU60mZfErEnpHgFefFHHn
         JFB9ZPRE+MQHrJw45EEfU8lcoON4tkcXum2ppTc96ns+t3VFV6iNjNqw7irb8BFutGjY
         czvZJM8JROnG8Qr0tjbsLDzhNvNUrxKoFZwDudp6UZbJXmxkqPe6VF1FR5G+W566g6eG
         Pa4H/8P/jLYsrH/AVrqubBEUQc3NLHuM0qObQiJf5kiEy5CAyf3933o/FtsK2OfnwqTo
         OTXg==
X-Gm-Message-State: ANhLgQ0ZhXp6VWSSZ0db6RIr8itqpWOjoVDjlSW66xPmOARk4ObO7E/x
        gcicvlByheMIqb7uiqeAeDGSLPDUgjUtSLGqowuRtg==
X-Google-Smtp-Source: ADFU+vviAe9P7a4/rcdpyF4F5OZW/tR/DqEMJypVKiZyXFhL2pruiQG6Qkg4B4XRSHTQJ8ygj4NwJ0x2xs62/xGIo58=
X-Received: by 2002:a17:906:d8b0:: with SMTP id qc16mr11014551ejb.64.1584965118308;
 Mon, 23 Mar 2020 05:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <1583770998-25449-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1583770998-25449-1-git-send-email-loic.poulain@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 23 Mar 2020 13:08:49 +0100
Message-ID: <CAMZdPi9U5Ls7dRQfxWsaZJtYpKGXUsPEpCvWbDz_LQUSKPDp1Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] i2c: Add Qualcomm CCI I2C driver
To:     wsa@the-dreams.de
Cc:     Vinod Koul <vkoul@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Todor Tomov <todor.tomov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Wolfram,

On Mon, 9 Mar 2020 at 17:19, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> This commit adds I2C bus support for the Camera Control Interface
> (CCI) I2C controller found on the Qualcomm SoC processors. This I2C
> controller supports two masters and they are registered to the core.
>
> CCI versions supported in the driver are msm8916, msm8996 and sdm845.
>
> This is a rework of the patch posted by Vinod:
> https://patchwork.kernel.org/patch/10569961/
>
> With additional fixes + most of the comments addressed.
>
> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Tested-by: Robert Foss <robert.foss@linaro.org>

Is there anything more I can do on my side to help you review this?

Regards,
Loic
