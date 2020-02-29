Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB4D21743B3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Feb 2020 01:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgB2ALK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 19:11:10 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39342 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbgB2ALJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 19:11:09 -0500
Received: by mail-lj1-f193.google.com with SMTP id o15so5255268ljg.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 16:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wJ2G0YZDBOYXpJWKorsJb22qVg865pSK3S5BA357pVU=;
        b=D2R/m89rmjQl6qPgxblXu/R6YGXFPUV+572xaAsecqEToxOlSOUoJUDxyHOfT0nXVM
         8+F8oUY2dvpU8minzX/Re6oqcR+ufYai6mftEnCgKmEZcFV0IFHLIcdZYUZeR3zw8Ucm
         jZZBqI9ujjn8AmjaKP3csW6n9NRrwoUTa5Qoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wJ2G0YZDBOYXpJWKorsJb22qVg865pSK3S5BA357pVU=;
        b=gm8ZnECMgs1Hn0HhI90pN4eQFt80RDapApPvAYksmXAGZm4rqBgsRlAiabP4XxO1of
         dr8tVHkNPKoJplBzGMM1cY1VTbOlXLb/PntAgaVvhguw9JsrY8GRlB1RVR4t/NyXqkns
         FKM0CBcwfcGquNwUFaJZEMTCxUxH+tSed4z5xt8ul7BNj8uKIQNHhwXMSHFAB0wv7jsB
         m1mO4DnXKNrbeuD3tYHQVD3xBZ1lMONFpL1oN1e5fBxsZc3Ug4AkezYhnMOsG3iV8qIZ
         bZJPUPoDvIZHwCDMqdDuWr1ugUFObWXpv/7I9tytYMHqyYO07iOToJihH/DeBhPboWYB
         iJqw==
X-Gm-Message-State: ANhLgQ1uGAs4NFUuNjLI52O1gTqQyc7AxDZuvt0j0/gO+6A6JmAKbQV0
        u8fdbeKDXaX+g6+64J7bvby5k5Dh5Zg=
X-Google-Smtp-Source: ADFU+vs4vvYlmaXVJIRUdgnZn314N+rIzJEPn0KnFsNRSILS2xD5pdN849CkHqNtJkOiuqbt6VFFkQ==
X-Received: by 2002:a05:651c:2046:: with SMTP id t6mr4475301ljo.180.1582935065253;
        Fri, 28 Feb 2020 16:11:05 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id y12sm5940036lfe.85.2020.02.28.16.11.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 16:11:04 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id a12so4189404ljj.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 16:11:04 -0800 (PST)
X-Received: by 2002:a2e:b4a4:: with SMTP id q4mr4387327ljm.208.1582935063547;
 Fri, 28 Feb 2020 16:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20200227105632.15041-1-sibis@codeaurora.org> <20200227105632.15041-7-sibis@codeaurora.org>
In-Reply-To: <20200227105632.15041-7-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 28 Feb 2020 16:10:26 -0800
X-Gmail-Original-Message-ID: <CAE=gft66VUxk8QYsmHUy9H6zb5EE88n0Y+Wm5f953KgzxATonA@mail.gmail.com>
Message-ID: <CAE=gft66VUxk8QYsmHUy9H6zb5EE88n0Y+Wm5f953KgzxATonA@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] arm64: dts: qcom: sdm845: Add OSM L3 interconnect provider
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Saravana Kannan <saravanak@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Odelu Kukatla <okukatla@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 27, 2020 at 2:57 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add Operation State Manager (OSM) L3 interconnect provider on SDM845 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
