Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE5119A772
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 10:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731836AbgDAIis (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 04:38:48 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46700 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgDAIis (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 04:38:48 -0400
Received: by mail-ed1-f65.google.com with SMTP id cf14so28641550edb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2020 01:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qedAMkO7HvLO65FKGD4WHqER0H4lcOPhnGRlZf+AyX0=;
        b=QknYesGt4YCzQ66HY2Ib7fGuiCKy+PfvdCVINGb0euPOFVRvJYagATd6VVJlU/ADs0
         PaswJqz/nqEOnq84kRWSZonHF9sIwLNnZAgCYbFQM6E+AKpABKAvd/r2EtJRI19WS0Gy
         v23+5hsCmcj1A0KCFQkYkZ59uMM4zZNY3Oje/ErroeTB+ZXHlpyQnt398poprX1PU5Fy
         u0PE+t8RfsS/sW3qE+oNHdpjj8HiUCl2cmoMS211QPmffJ2bNsZ+ZI+Cj3wQJ1KCFJug
         aSfbqBKK2wUsKwsOqRlNUFHU0mhJ/AGN5ZuTwB79+49/wYhDc2RbP8PiSoSLGCB7zIRE
         dubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qedAMkO7HvLO65FKGD4WHqER0H4lcOPhnGRlZf+AyX0=;
        b=ABtdpCiAOklR2V2vYyEuYOk0PIo38K1QJD1LbhOYiJg0NfgDg1xfCMPj+OACIaHR0e
         hywKzuyj0gkxtn2rwoEj1iv1gaE+quF7xnkpqunvSFt7FTk4PNoU3akmbujoe0ciBHz9
         UWdiUQ4ai65W5k7IoxPk5iV32drhucFL6YY1IgzOXagd11oZn/kbyWIpCO4SVYoOl19l
         AQErCcwA3fwVH82Uf+0lZ7jqJHtb1RLtcr6MXGSyrWdXoSw053ttAReFInefPdzGDXdq
         2NQ9fqYqhwMnbb765D0GKDGCfzF8OBIak1kdavH3m+QBsuoa3da7DsIggi2drF5DaLSE
         Xd2A==
X-Gm-Message-State: ANhLgQ0u1gpYSieNu7sdUNMP0WoQ9iOIXUiPVg6BCYQBgfesPLLaLE40
        uPdtQF6KFcXPrzoAKwKbcj0Zkg==
X-Google-Smtp-Source: ADFU+vuQjhmU+fjkwGa2mxV5/rznsI7j5uyBOZPzTgXx9rCsRcB7z7VeAAt8jbAodF1OBMZk0wFLzw==
X-Received: by 2002:a50:ef16:: with SMTP id m22mr7848143eds.82.1585730326304;
        Wed, 01 Apr 2020 01:38:46 -0700 (PDT)
Received: from [192.168.1.4] (212-5-158-119.ip.btc-net.bg. [212.5.158.119])
        by smtp.googlemail.com with ESMTPSA id m21sm277245edb.90.2020.04.01.01.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 01:38:45 -0700 (PDT)
Subject: Re: [PATCH][next] media: venus: hfi_msgs.h: Replace zero-length array
 with flexible-array member
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200319222229.GA19280@embeddedor.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <edb3bc39-3f4a-362f-1432-b2675689e874@linaro.org>
Date:   Wed, 1 Apr 2020 11:38:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319222229.GA19280@embeddedor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Gustavo,

Thanks for the patch!

On 3/20/20 12:22 AM, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_msgs.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

-- 
regards,
Stan
