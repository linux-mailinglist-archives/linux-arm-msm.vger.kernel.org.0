Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB0BB27C81D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 13:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730836AbgI2L7H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 07:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730315AbgI2Lla (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 07:41:30 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18360C0613D1;
        Tue, 29 Sep 2020 04:41:30 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a22so3715513ljp.13;
        Tue, 29 Sep 2020 04:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DKj1Mi05r/lPkJStEzGXk91YP8pjP5KDZ2CpBgL5/fY=;
        b=VtT92NPWEcjOGfhJuW86rj6W4WZTh2U8cHuHVrjGwqFoNczhNyPIJnekCrseB6gbud
         pXXTV7ZV5Rvffb+ND/Mw84w0sOy0cgauXMCMjbPQj6mCayHpaCwGC0eApOV8aXJkkHqU
         gsX0iXZkHRGTuQl4OLDlqVHJqzBNrrzCivUsGWYjo3P0fbVwVVtsI5N613V0i+SKNvQ9
         CwHj4wFKqZDrMcFHDX/GobZ0kWMvP9Nhd504rUVIUygsEVsN0Wf6tHpJqZz2NL2yxEfa
         NwB/QByCqqCaAizWPhDclWoLfgTSvAuiyM8VsNzeloj+V4kOGdGzYB1IhvTiAaAi2sF+
         yIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DKj1Mi05r/lPkJStEzGXk91YP8pjP5KDZ2CpBgL5/fY=;
        b=uHkKDU68d6nVy/ID+vFg2DgBhBTTcWFYSNzxWY+C3quQSvPRh7JUxgyKjN7q4vtoJL
         Kmu9dMk5TPQeMamLA8xObPC3Sm5kuywKsfXtIbWmmTLPpRPCg/E00gMA1kNmxn5qb+Z0
         Rilj/UIH1PzxHkbOXqWSMTlwHyQu2+YoIMWsuHD2u53Oz2KriMsAR/QDajX/Wh7YxN5D
         K67Gt/wNfCa4Gskv+djmWEb9pJ5h0/MhuXhGAebdY0ppaTHP0z/68oYSDmqXNatSHBjv
         Omeel7sPuxKPtkjHa8+bb28b8njA/MloC756x0WLfSVjM/njqHdMT+XaGeOk6uMS9rto
         rlBg==
X-Gm-Message-State: AOAM530HwHvUffIaRrjm62tgVI5zr+Vm/BUJ9gNDTBPvsfkQhTD7CPW7
        +UCmC8L1+UAeHHXlA6OPgBU=
X-Google-Smtp-Source: ABdhPJwcjlq0rjwvPdAuofQsWvJsOAit69kPFga73785R9VtbDaR1mTaMCt2hikSTX5+1iG4kI5CHw==
X-Received: by 2002:a2e:8798:: with SMTP id n24mr948762lji.373.1601379688550;
        Tue, 29 Sep 2020 04:41:28 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:861:66d4:f163:48a3:b6d3:9d73? ([2a00:1fa0:861:66d4:f163:48a3:b6d3:9d73])
        by smtp.gmail.com with ESMTPSA id v17sm3197612lfr.42.2020.09.29.04.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 04:41:28 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sc7180: Use pdc interrupts for
 USB instead of GIC interrupts
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
References: <1601376452-31839-1-git-send-email-sanm@codeaurora.org>
 <1601376452-31839-5-git-send-email-sanm@codeaurora.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <07de71c5-71d0-fbf1-8aa7-c039aeb9dffd@gmail.com>
Date:   Tue, 29 Sep 2020 14:41:19 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1601376452-31839-5-git-send-email-sanm@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello!

On 29.09.2020 13:47, Sandeep Maheswaram wrote:

> Using pdc interrupts for USB instead of GIC interrupts to
> support wake up in case xo shutdown.

    s/xo/of/?

> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
[...]

MBR, Sergei

