Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B09CA99F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 07:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730232AbfIEFL5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 01:11:57 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43820 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbfIEFL5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 01:11:57 -0400
Received: by mail-pf1-f194.google.com with SMTP id d15so913008pfo.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 22:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=m1T6OFZ8m2OWHUM6Qhu5Jm50/Ym1vGzeOil0qzo7tJ8=;
        b=QKFEqV2objc8mgIk7kxxl1GLBQ29uyx6yPkqpACsRyMRcKuo3pKhKnffLnK/+kbvP3
         37QZ6d92Vjv5p8W4wIdIpRqQMAn9y2TQ9Z0OeS1H5E19lsLaixlMpNiZf9aIZE4I+BzO
         9aYLX5o99EfVVLkFxaMJinGWQo5loFz6Oe4xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=m1T6OFZ8m2OWHUM6Qhu5Jm50/Ym1vGzeOil0qzo7tJ8=;
        b=J2b737Vt6lvHuFm+IcKstvx7y+ufZN5CaN+SK0k26K3czoThlv3dtZ2aaFbOVJeLaX
         Q1tLFE15aaV+VtxdjTC5sBH9F9rikFkYdesKDKV5jYUQooL2fEXRbZR8plYQIIcQwfU1
         cm3qMeC3UO/s6zOgvBkOQk1ftzlyh2G6+g+4EFYQUXnQTFR6Ix2uzH4SjC2aSB8AwLgn
         MU/942SUbB7U0scNgH1uLkjQf++wF3TZWxIIVySXbXZXTRUgTD99bijZqmDNcPOj1Nww
         bwoHJ08FiY3P/jIxHEB6+BuV4IxBAqzqnK+bvlhHEOwqQyuuLakl9ccuiaQ5VjKoicbK
         SgjQ==
X-Gm-Message-State: APjAAAXbvrYYvKGVyeRKModFavMqxjb5uWhxSPUhwASOM8aY2m5nEpmH
        1EEmrrw2vakEjQBUPqICQXOUAQ==
X-Google-Smtp-Source: APXvYqzE/1hkGubnNED6jSeSVXtJEmEmJBapGn6BoztzrTpGIG8FVBwmgN87YsxsNnFZ9BFJ1ZwNOg==
X-Received: by 2002:a17:90a:17cb:: with SMTP id q69mr1782442pja.135.1567660316843;
        Wed, 04 Sep 2019 22:11:56 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i137sm733977pgc.4.2019.09.04.22.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 22:11:56 -0700 (PDT)
Message-ID: <5d70991c.1c69fb81.c0590.2f13@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190829092926.12037-6-srinivas.kandagatla@linaro.org>
References: <20190829092926.12037-1-srinivas.kandagatla@linaro.org> <20190829092926.12037-6-srinivas.kandagatla@linaro.org>
Cc:     arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mayank Chopra <mak.chopra@codeaurora.org>
Subject: Re: [PATCH v2 5/5] misc: fastrpc: free dma buf scatter list
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        gregkh@linuxfoundation.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 04 Sep 2019 22:11:55 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivas Kandagatla (2019-08-29 02:29:26)
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index eee2bb398947..47ae84afac2e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -550,6 +550,7 @@ static void fastrpc_dma_buf_detatch(struct dma_buf *d=
mabuf,

Is the function really called buf_detatch? Is it supposed to be
buf_detach?

>         mutex_lock(&buffer->lock);
>         list_del(&a->node);
>         mutex_unlock(&buffer->lock);
> +       sg_free_table(&a->sgt);
>         kfree(a);
