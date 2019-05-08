Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C50F17604
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 12:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbfEHKcK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 06:32:10 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36537 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727269AbfEHKcH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 06:32:07 -0400
Received: by mail-wm1-f68.google.com with SMTP id j187so2580493wmj.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2019 03:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=lTYtWH+vlDq1C8tSZ2s1Nk4aplc77EuzahEQKqSXH1w=;
        b=o3QJktUzhea3lHbIefLX+aNhSNRGeqRunVeT2IHCizVIXFqfS4luvNVPnBU4Lsq0Qi
         rc2thhYpQepQUtsSnj2eMPg2szR+6J8k4+Yolyo8IFppvYYW/bdqj4GRO6Efjo4pI4pj
         jrBu6D3zKyl0TBtGICj41PuFsd+FUSrfIbzVqyobDIaFu/anZw1N3T51qBBSkxLP9d3C
         Us1fIzm2jYVr+ZJoSYMWkaZsChb2XTQ8uIVRswge1AqtWk4ao8SmmIqETb5qYNAxMxX6
         qHG8mgVTKaT+qS2DvV9ME6uSWg8iOUbcr3/ozePgoTr1AilUiQljdYFXt8afs++LW40h
         7CgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=lTYtWH+vlDq1C8tSZ2s1Nk4aplc77EuzahEQKqSXH1w=;
        b=A7PO1a6HpIPzkfc24h6Vu7hQ7Bw9oX3Ovm7b21e9QWpwYNRSbtTkPBlegAra9eSWJ+
         plLXJfm8FZvnflPrtb8oAxmFK+F58smJpSiPN6M+Przn+3Bcqkbn8Y3kiEoKT8aKv0aj
         nMyzQW/kD+W0XI6I9DqjT8NFK6b6P+igEcx+tKBOhfhyEBsOsgDSxHX7OS4Li42rIYsz
         JFaA28yLWQ3BGvI3K7Rnn39GQTwHu3Wyi3OFvU8gaFjzbWfnRggE2nrO8ji/Bd9ZdYrG
         auJvSy/8iKF2U1j/SPnuhKTuSmeTv1+CX3YYSxAUQD572gtWbewmRoCyvE3zv/Gc4yG+
         8s9w==
X-Gm-Message-State: APjAAAXbNEppEXm+UmNI12k+FaiPmkDp/W2Ev9IfuXoKbCHeym1j9YUe
        3H3rskIi3quo4NXTEGZdvj7Tng==
X-Google-Smtp-Source: APXvYqyS2UuaH9kJHYVFIWfTSezTKbwt3gNBCgfakaqiMBVfMgfAFs5aOs/71Y4Ld7OaOjbph6TsxQ==
X-Received: by 2002:a1c:b756:: with SMTP id h83mr1245637wmf.64.1557311524716;
        Wed, 08 May 2019 03:32:04 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id f128sm2896834wme.28.2019.05.08.03.32.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 03:32:03 -0700 (PDT)
Date:   Wed, 8 May 2019 11:32:02 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH next 16/25] mfd: Use dev_get_drvdata()
Message-ID: <20190508103202.GJ3995@dell>
References: <20190423075020.173734-1-wangkefeng.wang@huawei.com>
 <20190423075020.173734-17-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190423075020.173734-17-wangkefeng.wang@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 23 Apr 2019, Kefeng Wang wrote:

> Using dev_get_drvdata directly.
> 
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: David Brown <david.brown@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  drivers/mfd/ssbi.c     |  2 +-
>  drivers/mfd/t7l66xb.c  | 12 ++++--------
>  drivers/mfd/tc6387xb.c | 12 ++++--------
>  drivers/mfd/tc6393xb.c | 21 +++++++--------------
>  4 files changed, 16 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/mfd/ssbi.c b/drivers/mfd/ssbi.c
> index 36b96fee4ce6..50f87d0f9151 100644
> --- a/drivers/mfd/ssbi.c
> +++ b/drivers/mfd/ssbi.c
> @@ -80,7 +80,7 @@ struct ssbi {
>  	int (*write)(struct ssbi *, u16 addr, const u8 *buf, int len);
>  };
>  
> -#define to_ssbi(dev)	platform_get_drvdata(to_platform_device(dev))
> +#define to_ssbi(dev)	dev_get_drvdata(dev)

If you could replace 'to_ssbi(dev)' with 'dev_get_drvdata(dev)' it
would be better.

The rest of the changes look fine.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
