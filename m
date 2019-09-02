Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA1FCA57F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2019 15:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731045AbfIBNi4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Sep 2019 09:38:56 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40910 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731019AbfIBNiz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Sep 2019 09:38:55 -0400
Received: by mail-wr1-f66.google.com with SMTP id c3so14067306wrd.7;
        Mon, 02 Sep 2019 06:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=3MigCfRMPHZaTe6xntZFSgd60Ton27WsycAk1QzXSb8=;
        b=WcGFqW8VVEUW9shRtoBC0Rj3+Kt2edWEka8AQEGIjlZVW6lWqkD4fmkikfJ4el8Jes
         /t55O1Ih7pcqs/i9iDTQ1BctiA9QrqOMAtbKYNvLHuQAu6DGxO19ucPcSKg2gihc+egL
         w2tq9YwqjcNXSA6zzWJkE+ImPyvalDkZ9tfrDXk6bJ1LEE+IkqGbDH6Mah7W6JEvu+hd
         MsAXyWEkdYw8bnvlUOcG/0uHVJK1b3qKYXz/XYtMEBThSz0JHfgGWatIZOJJoUftS8hy
         SnxdJWhduMxOwBcfjageINOmhRmJl6RTaKzM4IWLseJWI7pxa+SphGGPiUHhwxZ7BC0v
         lDwg==
X-Gm-Message-State: APjAAAVDsaLBbE3fVuJpYoZmN63dF8MzOUGVZbatEHlozyA0ea7nQ0BW
        Avu/uGghlJeiXlpizO23sg==
X-Google-Smtp-Source: APXvYqzJYI/YKwgHJ8rDQWv7wGduOfTx+1tB96ZS93ckiyaJdJDOz7lX4rknN0anPKeGu35ijjfZRg==
X-Received: by 2002:adf:8043:: with SMTP id 61mr29988673wrk.115.1567431533168;
        Mon, 02 Sep 2019 06:38:53 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id x17sm11602618wmi.46.2019.09.02.06.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 06:38:52 -0700 (PDT)
Message-ID: <5d6d1b6c.1c69fb81.e1729.0655@mx.google.com>
Date:   Mon, 02 Sep 2019 14:38:51 +0100
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/3] scsi: ufs-qcom: Implement device_reset vops
References: <20190828191756.24312-1-bjorn.andersson@linaro.org> <20190828191756.24312-3-bjorn.andersson@linaro.org>
In-Reply-To: <20190828191756.24312-3-bjorn.andersson@linaro.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Andy Gross <agross@kernel.org>, Bean Huo <beanhuo@micron.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 28 Aug 2019 12:17:55 -0700, Bjorn Andersson wrote:
> The UFS_RESET pin on Qualcomm SoCs are controlled by TLMM and exposed
> through the GPIO framework. Acquire the device-reset GPIO and use this
> to implement the device_reset vops, to allow resetting the attached
> memory.
> 
> Based on downstream support implemented by Subhash Jadavani
> <subhashj@codeaurora.org>.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v3:
> - Renamed device-reset-gpios to just reset-gpios.
> - Explicitly bail on !host->device_reset, to not rely on passing NULL to
>   gpiod_set_value_cansleep()
> 
>  .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  2 ++
>  drivers/scsi/ufs/ufs-qcom.c                   | 36 +++++++++++++++++++
>  drivers/scsi/ufs/ufs-qcom.h                   |  4 +++
>  3 files changed, 42 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

