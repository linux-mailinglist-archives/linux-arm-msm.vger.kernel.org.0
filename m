Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB371521DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 22:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727669AbgBDVTG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 16:19:06 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:34575 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727534AbgBDVTG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 16:19:06 -0500
Received: by mail-ua1-f67.google.com with SMTP id 1so43897uao.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 13:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cDQhf3pngJwbR1rzpvQJkKUBb4tiCCEEJ4Q4M59w1tI=;
        b=M0ctaJidym4w3v7F3eWRuV5lKNaGvr7QcuL8CyBluGLOCIRUMJ+MyNiUbAv2YFH6dR
         z+UgAPYCogS/3dgL2A0nO8wJo5dwiG7JsrrJLEeymRo8PxvngwNow3za7KlB7LdOFatn
         q9/Zt7Y8c0MKbEf9RjOKPOEsWMHoz/k431xxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cDQhf3pngJwbR1rzpvQJkKUBb4tiCCEEJ4Q4M59w1tI=;
        b=e8ShuTY/JRTnDwzzORB2/oeUmEldbztKtdJY/DOgAJAWuQkALWIV1EQJ1yhOUA4099
         bJCHmiBwP0oF87QvhukDSwdwubN8BYKsvoNEMzpe4mmS30kl8Td0b5D5kWA+XQVxqH+V
         SFcqOBHZeDg2vN8Mhr8zqDbLFCc9EfKV9FqtVAmYaVws5qdxoBr8OJF0xPyAYB5yhOy2
         1OQiHsv++8sjGViRfrXgdUMtqfHNOy2D8lB6PCZW7xFhrk4sza0PlaMkfHJ/poDxY+dT
         deDYi0CSOa+0MHfKjOekM+SylksBeEhlzSRtpYBURDTbpNEA6ddGyDgE1XzMuhJYa/UY
         uSyg==
X-Gm-Message-State: APjAAAXWDe5sPEKO+OoNDzhYgw2WeVR+GhZ3J8D4xnmcwhqS/CZBFMki
        ylcSVU7vu1GH4sVajFYdJ89zmUy2KFQ=
X-Google-Smtp-Source: APXvYqxzIBXGeR0ZEMf15lqAm76HEMTNIwQgkls94ly8HsgWI7cxAmnzdxNaG/Y7fUDcdlPp46uTTQ==
X-Received: by 2002:ab0:3350:: with SMTP id h16mr17926695uap.142.1580851144886;
        Tue, 04 Feb 2020 13:19:04 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id j29sm5099567uab.0.2020.02.04.13.19.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 13:19:04 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id p14so12467313vsq.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 13:19:04 -0800 (PST)
X-Received: by 2002:a67:8704:: with SMTP id j4mr21048875vsd.106.1580851143693;
 Tue, 04 Feb 2020 13:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20200204193152.124980-1-swboyd@chromium.org> <20200204193152.124980-4-swboyd@chromium.org>
In-Reply-To: <20200204193152.124980-4-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Feb 2020 13:18:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XynUY1++OqZMMWVQq0FJCxPUBp0umeDOxs4W8WH6bNQw@mail.gmail.com>
Message-ID: <CAD=FV=XynUY1++OqZMMWVQq0FJCxPUBp0umeDOxs4W8WH6bNQw@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: qcom-geni: Drop of_platform.h include
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 11:31 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This driver doesn't call any DT platform functions like of_platform_*().
> Remove the include as it isn't used.
>
> Cc: Girish Mahadevan <girishm@codeaurora.org>
> Cc: Dilip Kota <dkota@codeaurora.org>
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
