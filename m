Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5337F41B57F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241902AbhI1SAJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 14:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241601AbhI1SAJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 14:00:09 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63D0C061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 10:58:29 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id c26-20020a056830349a00b0054d96d25c1eso3500044otu.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uR5PuPkKUKvfXK5EmQYWYaGFwQD6gS7xkf2w5Ej+K1A=;
        b=j0MstjStaBqnpbINZTrtCPXme32ur1Fotw9+yVfHNgjjVIkqcgJPE0P7zkOEbS0C5e
         4kVksbtGEi1Zxr6nimYR/l2YgpxX3XwBattDHmMW9Kuuk9tnzHmrY3qtRAgT86mvP2G5
         fdAWtTYs1Vx4rNweAdSXSW6lNJKM/x9KGDFepSqwVSxJQDGTPBNgQAs4/fMvjuD7SrjH
         ezOMpwwZjcyctLiQ7OXqX3LCpgV9tOpx3L+Z3iyt4yGBh5fM5lkfqLZ4I4hCzgxqTd7i
         HTa+fDhC6sbrC0UVlPdFrOxrWbGfdexWhohL75GSog5LegEJJIzRFphnlE2lHMCLiNim
         Vi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uR5PuPkKUKvfXK5EmQYWYaGFwQD6gS7xkf2w5Ej+K1A=;
        b=Z7rSCrbjRyVzEdCKUu9NFX6xDQpgi4GLupaVMfeELjydon/aMHK5xSbVsehRP2VgiQ
         aLidr6ZqqTGc41pHewYzD7IYDvXSZS2wOXBIBmX0zGRN7HHxN4mNgzPpE9cZ9oqM6uin
         gKvHYFVLnB6RmCnpz35rl5dI4rTiKJPIhUAHJ373pPRgV3NzvckVjaPosk8vod1cLbxO
         RuTI6yyKKRCa/Bdj6VaDalyxyNd/d1X5UveIEOWGSzmnz10ffGDWnD1RXxt9vWAmu8Oc
         cPsx5b5IdRTSIA9xvOpLoQyIxFUxww2xv81FtSWDsw24WHupFD5GIhlRpNa4svukPVUT
         PLYw==
X-Gm-Message-State: AOAM530BgAJvXfTao8Ngepb8NF1OxeFJPkMJUdqXZCGQKWUR7wrbPMbS
        arsl2XKojze43glc7Bj7z32Fcw==
X-Google-Smtp-Source: ABdhPJyFZdU6lpvOXw+LZs11Myh1AgYn8nyQs+TzSh/UgyfeESrR431aGwkjyWoXYjjaKmU/14ehZw==
X-Received: by 2002:a9d:1913:: with SMTP id j19mr6412829ota.166.1632851909068;
        Tue, 28 Sep 2021 10:58:29 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id q133sm4158782oia.55.2021.09.28.10.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 10:58:28 -0700 (PDT)
Subject: Re: [PATCH] net: qrtr: combine nameservice into main module
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210928171156.6353-1-luca@z3ntu.xyz>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <45b1b34a-b826-9516-d6da-1272e5384bd3@kali.org>
Date:   Tue, 28 Sep 2021 12:58:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210928171156.6353-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/28/21 12:11 PM, Luca Weiss wrote:
> Previously with CONFIG_QRTR=m a separate ns.ko would be built which
> wasn't done on purpose and should be included in qrtr.ko.
>
> Rename qrtr.c to af_qrtr.c so we can build a qrtr.ko with both af_qrtr.c
> and ns.c.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  net/qrtr/Makefile              | 3 ++-
>  net/qrtr/{qrtr.c => af_qrtr.c} | 0
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  rename net/qrtr/{qrtr.c => af_qrtr.c} (100%)
>
> diff --git a/net/qrtr/Makefile b/net/qrtr/Makefile
> index 1b1411d158a7..8e0605f88a73 100644
> --- a/net/qrtr/Makefile
> +++ b/net/qrtr/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -obj-$(CONFIG_QRTR) := qrtr.o ns.o
> +obj-$(CONFIG_QRTR) += qrtr.o
> +qrtr-y	:= af_qrtr.o ns.o
>  
>  obj-$(CONFIG_QRTR_SMD) += qrtr-smd.o
>  qrtr-smd-y	:= smd.o
> diff --git a/net/qrtr/qrtr.c b/net/qrtr/af_qrtr.c
> similarity index 100%
> rename from net/qrtr/qrtr.c
> rename to net/qrtr/af_qrtr.c

Tested on the Lenovo Yoga C630

Tested-By: Steev Klimaszewski <steev@kali.org>

