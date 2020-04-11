Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5EF1A5313
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 19:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgDKRVS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Apr 2020 13:21:18 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:32807 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgDKRVS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Apr 2020 13:21:18 -0400
Received: by mail-lf1-f66.google.com with SMTP id h6so3530695lfc.0;
        Sat, 11 Apr 2020 10:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=oyBmc4xjNn3SLXRrYaMJxMSegPacZmPs2u2arwCQFwM=;
        b=VR/wGsp6AL6Cgg3JswO7WRYpRv1nWBBEmrdCY+rNoLnt8YCpj8wbVXp3eIYczY8jFh
         3XmMhQJnFPAzG7c0GvVfa/DN0/vBVx7G5vavJen+1HcXbtV67PXuyB+ffigY7AhNru+q
         oPUxJhXgHzRo/5k0mEen8hRHKRet3vc39nuHlop3L2UEhFK2vtdRPkpFdCNXF4Q1kYMB
         LKe05KupQYlHVjIBoW7I8/li2KsvyNDwGNYk3QzYI4ZaDtCprcwDBlzmQZwsA3Xs6l29
         G0jQU+vTCzCEJHXKNmOGd2w93ip4Bicf1M0+D7ujgIUchKoKdS0k5gNPtvslEa107Xkh
         e0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=oyBmc4xjNn3SLXRrYaMJxMSegPacZmPs2u2arwCQFwM=;
        b=CjmaQFKJMM67bQa2GWyUX49SW6Fpd4CoLYuHcjqPYJNFmXwrayws5Xm5d/I8yM2ttU
         PECeHXOzthdyoOFytvBYp+7W1eNtqgEk1IN9l7ilE89fl4u4IU8EyT4n0gtkiAGea37Q
         qKda2HE28gGFhuRmW5aSjQ0cpGkf85G1czPQQUpuDkDKogv2ZKqM+6gYPNdx/qxdTFC6
         5LwajHvtC9KwPXE8x+Vp5UjBNOCQlJ1/+jUlfF2EGiihHUJxD7mSsmp4u5ZDskgfutEe
         4sCXm4nslTjUhBKMteHWsSZUYb3sndl4i3BhA+D1wrfc8mRjXXt8oOdczmag5c+MC696
         GbFg==
X-Gm-Message-State: AGi0PuZFD9DqVqDAz7/G0TLLdjuS5XKN0pziD8HXk7xnLgWdEe9MhqKm
        kAA7cj+O0IYZXuGejeCrpFqCKsTEiqyjzQ==
X-Google-Smtp-Source: APiQypLeAJWvRiG4SW+wcKx7r0BSGgtySOu0j274CfwZ+izdGwEBBMzpQfpHUf4ztsokzU3wEqKAOQ==
X-Received: by 2002:ac2:5930:: with SMTP id v16mr5715089lfi.103.1586625674889;
        Sat, 11 Apr 2020 10:21:14 -0700 (PDT)
Received: from [192.168.86.24] ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id q21sm3769305ljh.38.2020.04.11.10.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2020 10:21:14 -0700 (PDT)
Subject: Re: [PATCH 5/6] ARM: dts: qcom: msm8974-klte: Remove inherited
 vreg_boost node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Daniele Debernardi <drebrez@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20200410023203.192048-1-iskren.chernev@gmail.com>
 <20200410023203.192048-6-iskren.chernev@gmail.com>
 <20200411013833.GI576963@builder.lan>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <b43ee298-50b2-ec1d-9b40-5683663e96c5@gmail.com>
Date:   Sat, 11 Apr 2020 20:21:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200411013833.GI576963@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/11/20 4:38 AM, Bjorn Andersson wrote:
> May I ask what PMICs this device actually has, if it doesn't have a
> PM8941 GPIO?

In terms of power, the device has PMA8084, MAX77826 (pure PMIC for
touchpad, camera, other peripherals), MAX77804k (MFD with fuel gauge,
charger, a few regulators + other). I'm sending a MAX77826 patch
shortly :)

In terms of GPIO controllers, PMA8084 has some pins, and the SoC
itself (qcom,msm8974-pinctrl) has gpio pins.

According to ./drivers/platform/msm/qpnp-revid.c from downstream,
these devices are covered by similar drivers: "PM8941", "PM8841",
"PM8019", "PM8226", "PM8110", "PMA8084", "PMI8962", "PMD9635", and my
KLTE prints the PMA8084, after querying the hardware.

I still don't have the full picture yet, but I'm pretty confident
there is no PM8941/PM8841 on the klte.

Regards,
Iskren

