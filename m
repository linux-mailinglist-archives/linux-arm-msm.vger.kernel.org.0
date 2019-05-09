Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3DD218533
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 08:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbfEIGOr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 02:14:47 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37513 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfEIGOr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 02:14:47 -0400
Received: by mail-wm1-f65.google.com with SMTP id y5so1513088wma.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2019 23:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=G2pFARh3jD41YsPZaIcRDmvVTe/jSjp+MpRky9XD4Eg=;
        b=eqeTUq9Ocp1R9Rjg1wN0c5jKiDqvsCwbgj7KfR3B2lLAEAYpUHpIVlwl+uGAH+W7ue
         6FSNSdzpuJZc8MmBxj5YszI/Mrzt7zgYrbiv6TPNeJeirpuDY6Hh2GT0CDMZX8k9vCrQ
         WSEc0hvWQbRt6dAO5QJ5J3yUMCpAjrLUEzsT0hGpCvuDCiPnZneDUfivhTkQ7FojsBZc
         ADEGBemkbUzbpZ9lW9U0WBKmM/Pgd8VxZ2MNaFDT1ACYDYbd82dHE4ZhtjEiyv8+/vTS
         mfC84gqO2kemvx7+nWaPa4iVFl1sQgwX3nScHhGFeu3BzbzybCqIrwOYPI+0b3+WTOr/
         RsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=G2pFARh3jD41YsPZaIcRDmvVTe/jSjp+MpRky9XD4Eg=;
        b=nRZKf1B6nr/E3+r0e+WAabICj8T9cIPaA1QJvYUxBMSZmUK1y+DTnjDGyxBfBGfHSU
         +KjsJkrSDXFSOcrg8gwuDskjJmIC/mt9P0Ckm8wzJzvfe7/QFC6epxvsYAH1I0AHWytC
         G97eBAX2jMwAXcmXKb0qqP2VGizxo3DuJCtZuCe02z5PwF2o9J0L0BDTd1fJBqc48jk7
         5b6Myy7VsVWdIwLBB9KWAkJw9POZAm3F5lLMD2sUfILpULX/iQLDd0/XjCpr9PDaB2b0
         /fWZAFCSclGzuh3iF0jJ0C5rB+daLULiq85bZsEhShQDHh5w/RGwBypLD7OTlh3B+qmh
         K7mg==
X-Gm-Message-State: APjAAAVwwycfbXnsqqmPJq/t5xgl0zxO0409x3TqRMG1d8dVF5oaNixs
        xXLHFaURp9fDvaIyrrV5nTOwhA==
X-Google-Smtp-Source: APXvYqxPIY1jQd4apWassxYYY8E0vNc4BXFm7KQORVOgWIQh/Ycw0ajJvSoEbk5ioXZ8ypDLevQcdA==
X-Received: by 2002:a7b:c743:: with SMTP id w3mr1384464wmk.22.1557382485439;
        Wed, 08 May 2019 23:14:45 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id t2sm1104419wma.13.2019.05.08.23.14.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 23:14:44 -0700 (PDT)
Date:   Thu, 9 May 2019 07:14:43 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH next v2] mfd: Use dev_get_drvdata()
Message-ID: <20190509061443.GU31645@dell>
References: <20190508103202.GJ3995@dell>
 <20190508135257.134747-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190508135257.134747-1-wangkefeng.wang@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 08 May 2019, Kefeng Wang wrote:

> Using dev_get_drvdata directly.
> 
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: David Brown <david.brown@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2:
> -use dev_get_drvdata() instead of to_ssbi()
> 
>  drivers/mfd/ssbi.c     |  6 ++----
>  drivers/mfd/t7l66xb.c  | 12 ++++--------
>  drivers/mfd/tc6387xb.c | 12 ++++--------
>  drivers/mfd/tc6393xb.c | 21 +++++++--------------
>  4 files changed, 17 insertions(+), 34 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
