Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3341BFAFBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2019 12:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbfKMLcU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Nov 2019 06:32:20 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:45754 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727811AbfKMLcU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Nov 2019 06:32:20 -0500
Received: by mail-wr1-f42.google.com with SMTP id z10so1913429wrs.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2019 03:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=sS3GaEsmYVTT8e7e9aE8xCn5QY0c0oDK5wXddhigAzo=;
        b=CYO8M14unOarpyCMrij5/QgQvuSQhghb6lNIxYwEhmTJDfQAfPVC9+D7zTsLxANKmS
         XOhtiJRx+PgD9O/gBnG++DQiXFXLxHrROmodJu9nwj/KRsEGGR/sftjKT7S2uSI+5VLl
         yZe9beW3UNVHVWEbNmNwB8mDKLDxLgYDXytky5cZjStLFR3FjqTa61F3vDNXnNvvHzYe
         76Mtd4Rb98ulGoJENiFUg2nXaB9MM4MH+IALrHn9VUFjNIr1cubho30W9ayKiPYXDCGo
         CssQBKMiFAx8N4DrCpDWlqKhpuZNe4KLEWF3QmcEx3zZjaQK6pN0pOBJYFnXcN7QiGiW
         QAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=sS3GaEsmYVTT8e7e9aE8xCn5QY0c0oDK5wXddhigAzo=;
        b=XCQscOWYlQoQUAhOrwPEl6+DsuJc8UTiGXW8bsn3MjNBSRG8ciQoPCw4Ay9CxrTlZn
         37WduKSQkKuIbfqk9+gwAjFL4OaV1qT2/JtP74QWuUyea9mdT8ASZKxMH0ULBrqYcPwW
         D2BfkKO2GRMbMe4mzNy2q11fkX0Cg15bTNC6A0/3a3MUsbmzTaFUoHLpjiQDwIeDtfO5
         EDp4SQQZgPHX4vvuHrIP1+WWAH8hjz3XZxsQKg6+bQOMYBdA8EeDv0wJZju7Y3fLntmt
         qKGJnso6VA6brlxw5RI3doN5Dij1ZJoCH+7SE0znDlaTOZVWBQ2FQVlzGdASpMZl4dSa
         Gatg==
X-Gm-Message-State: APjAAAV8Trt23ljO8ydavnbP7TbB7clVlxNjOmCs8pBtmgsFXeuZ+XXP
        oWOvDhYu4+xcAHZlFtn5gFW2Kw==
X-Google-Smtp-Source: APXvYqznHxf9lTwtcWainnqvBciljEaqd825jlA+LPO+60naLZWLA4kld7qN7etRMPJUI7I//NyhTw==
X-Received: by 2002:adf:e94e:: with SMTP id m14mr2414909wrn.233.1573644738184;
        Wed, 13 Nov 2019 03:32:18 -0800 (PST)
Received: from dell ([2.27.35.135])
        by smtp.gmail.com with ESMTPSA id o10sm2519246wrq.92.2019.11.13.03.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 03:32:17 -0800 (PST)
Date:   Wed, 13 Nov 2019 11:32:06 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] backlight: qcom-wled: fix spelling mistake
 "trigged" -> "triggered"
Message-ID: <20191113113206.GB3285@dell>
References: <20191112093025.98638-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191112093025.98638-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Nov 2019, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_err error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/video/backlight/qcom-wled.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
