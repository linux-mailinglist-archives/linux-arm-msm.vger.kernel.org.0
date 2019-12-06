Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28789115840
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2019 21:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbfLFUn7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 15:43:59 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40497 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfLFUn5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 15:43:57 -0500
Received: by mail-lf1-f65.google.com with SMTP id y5so6247746lfy.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 12:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oF+xlo1sx9gytHOVJmZzD5EHDYm2UDoLMUn75V8RhEs=;
        b=FI3uXTGCTF/CsvRtjzUm5SGnAxOj8iYUwPwy84nNUJAQJIy5Z6jDPZ43JCM/HizVKg
         wjalGmSGIL0vznEvGNI1fgY2QOncXYDyRCXqkbhLZL8a9TB613Tjf+UBXDFFD4K0KOTd
         X/6uFMhEOqGq73YaEAyW74x0y8WYPWnVAscv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oF+xlo1sx9gytHOVJmZzD5EHDYm2UDoLMUn75V8RhEs=;
        b=Pm4Vs5WpvgUP9/DfGtanL+KwsJhQeLSW/55779axVj3T5jSptEpSbTB3/4MMLiRmQZ
         DMsJljAZHGAlvW9jG4tuuZzr160rumNwRy35ZP6dPKImBHeCToHMVTjWLp3y91lrwrYj
         6HiyeMpkPmMgk6jI0dLWoHypKRJQwGEbDji+cNuxvkdGuiHs10PGDtQVpr3lTDTI61aJ
         EsaUguRzha8BuN7e6fW7jQVnjpi7hre7HwMHSTwCz/rEdcsWMv3Qa1dgZje7oSnZ+3N4
         yUa5rfyk1yTkj+u+LcwBLkFc+M9bm+wB2OCnG6kacGGb4JP7c0oC/yQAkfaH7dY8YA3d
         xAag==
X-Gm-Message-State: APjAAAXzwL/M1qy5I8xBxv0jzMKQ6lZWP9M+ZFHpnMP8P56cQKn1985W
        ZtXSroM5yQ51gvGeUWvXCdoC3aI9YdY=
X-Google-Smtp-Source: APXvYqxvsYmke0CGUB+zY2BnRh2cgHOUKBjsF+oXNgBcbYnBfc9/VGu7OtqSF13/Qa8b+K12apN2mg==
X-Received: by 2002:a05:6512:1dd:: with SMTP id f29mr5301833lfp.106.1575665034988;
        Fri, 06 Dec 2019 12:43:54 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id f14sm7191599lfj.32.2019.12.06.12.43.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2019 12:43:54 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id j6so9083784lja.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 12:43:53 -0800 (PST)
X-Received: by 2002:a05:651c:285:: with SMTP id b5mr9852969ljo.14.1575665033279;
 Fri, 06 Dec 2019 12:43:53 -0800 (PST)
MIME-Version: 1.0
References: <20191128134839.27606-1-georgi.djakov@linaro.org>
In-Reply-To: <20191128134839.27606-1-georgi.djakov@linaro.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 6 Dec 2019 12:43:17 -0800
X-Gmail-Original-Message-ID: <CAE=gft6YoDyOFvYLh-zOmpbNJwfgB0OGugeZKCORz0euMJyS0w@mail.gmail.com>
Message-ID: <CAE=gft6YoDyOFvYLh-zOmpbNJwfgB0OGugeZKCORz0euMJyS0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] interconnect: Add a common standard aggregate function
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Dai <daidavid1@codeaurora.org>, masneyb@onstation.org,
        Sibi Sankar <sibis@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 28, 2019 at 5:48 AM Georgi Djakov <georgi.djakov@linaro.org> wrote:
>
> Currently there is one very standard aggregation method that is used by
> several drivers. Let's add this as a common function, so that drivers
> could just point to it, instead of copy/pasting code.
>
> Suggested-by: Evan Green <evgreen@chromium.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
