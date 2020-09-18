Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 143DB27060B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 22:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgIRUME (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 16:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgIRUME (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 16:12:04 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2749C0613D0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 13:12:03 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id bg9so3564416plb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 13:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=WYax7v4NuEypPEvd+V/vHx29fv7IIwQqylMWYbQJGb4=;
        b=g2nFX6vYp55iT9QkeDSx3oS1z2dptOcTFIaCgSCPj9ilpajYlt1BQD81Og5YUnR4Y+
         XPil1W1fK1i2p1puAc5IWOIVCs15vliGXNejHzd9xjUQKCzUEX1V42FizDovyDQ/sLy2
         Qj6rA5BIktF0J3kXMbgq8L25B0tQxU/nQsZgqtf8/3H4VoXLgzeJlmFQcjo4qlJSahap
         58kOrc6zn1uLyOfDitW6o5GLwSVm6WlE5/X+TtGpWPlo+d4G3UR4wW2HCZ5ekK3/czw9
         uqXWD2RadIBCXo8mgSvQwVv7/XSmVXuUMyRzvizhBeeT/bkNWLriRAEVz6/k+PDTopZY
         +99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=WYax7v4NuEypPEvd+V/vHx29fv7IIwQqylMWYbQJGb4=;
        b=F+dl6mP+aDOpeAM8q7iN19dxpzw1FDCleTMeFDko3Av8I2ca80iPPh461i4DoV8YIS
         Ud6zEQj/bW5KsfXMBvOJw1KdMQbNnwsYg2C2mSlgpusbVhI6mxdYYoX1tfFpKI8Kv7A/
         T8lrlyAlkCHvlL87ip7LlGBPQKy/hKqYJ6AMIi4JaDlbCh+vozG3olnW5yZDVv7Gcpff
         Xwi25ZkdYrfJFM+pgeW53Klza7lMUv1upPKU1qscMcQpXpDh8UWwrOamfK++f6H68ZgW
         ahAQmB++oFJC9bDvACzphl2hmI3P0+hjiiY8xGBNZYkTwM27TNusO/XSAhoFm1h/idlK
         lPCg==
X-Gm-Message-State: AOAM532TsX46XwSUsO0cboRc/X42isqG48D1qVBwkGhh1M/AZfPNDU5l
        e6OzuHUwbb9z0ga8ux41cerO5Q==
X-Google-Smtp-Source: ABdhPJwSY0Hzmg5C+Z/FHs4BwlJgD3AAS3rxUQWe3xi7RXPELvqajT4QHxfxQkQWHWg43jTmhbkMfQ==
X-Received: by 2002:a17:902:c206:b029:d1:e598:3fff with SMTP id 6-20020a170902c206b02900d1e5983fffmr17975673pll.57.1600459922118;
        Fri, 18 Sep 2020 13:12:02 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id p68sm4330181pfb.40.2020.09.18.13.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 13:12:01 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liu Shixin <liushixin2@huawei.com>
Cc:     Niklas Cassel <nks@flawful.org>, Andy Gross <agross@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, Nishanth Menon <nm@ti.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH -next] power: avs: qcom-cpr: simplify the return expression of cpr_disable()
In-Reply-To: <20200915031714.GA670377@yoga>
References: <20200915032629.1772569-1-liushixin2@huawei.com> <20200915031714.GA670377@yoga>
Date:   Fri, 18 Sep 2020 13:12:00 -0700
Message-ID: <7hwo0qdeun.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn Andersson <bjorn.andersson@linaro.org> writes:

> On Mon 14 Sep 22:26 CDT 2020, Liu Shixin wrote:
>
>> Simplify the return expression.
>> 
>> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Kevin Hilman <khilman@baylibre.com>

Rafael, please apply directly.
