Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2CA390F00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 05:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbhEZD7y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 23:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbhEZD7x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 23:59:53 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58890C061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 20:58:21 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id v22so267278oic.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 20:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1HPVClxABt2jCFgOAzTtzBbjmWzpeUBRvvM0l/gpF7s=;
        b=rZVNRfkLatkGnk9P/1ou/EbfSVzKxJLBoHjKQvkVwZXEaFxkQjpMKclV+didnwA/7R
         1mnAF70MpSYJLnNxaqGW13J+QaxS3h7LOvmXrAOxIXsRvf3E9zN19Yzd+7me/id+lw0+
         RQJACtU+/KeHrmAa0CP3cklGFfC35XhUXO40fJyG5uNPxvvlqyxr7CHUEhV4nDtJeoBU
         14ZT86EwCZLyqN5WA9gITfMgIZvCoiwwQZLlT/VX1Q42i6/z3Hsx9f3Fo8nrqTFsZTZ0
         zFrf2Tv5Q03MmHxG4snVrZvS8MYmVUvs0CJz6BLkPnJoaVJMuTybMvKZBiRJAp9xaDl7
         E7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1HPVClxABt2jCFgOAzTtzBbjmWzpeUBRvvM0l/gpF7s=;
        b=uPtgydtKHJ+qGGVYSaoG3HsjBDCVvpW43TrHvR0103dQ8be2V5AxSnzr+ZgR4m2hNf
         qbxlYdwYCKBGgkecnFVyWHpR1SvX464DpV5AEWUzw+rSAb3vvmZrhyAf/oJFNWMOz7H8
         Lcrrvv4ZaJG6B6zWfJ/QlzNTWCDY+74LUNw/XJRvunYZRz4TxOI39qDYoh67FuObNlLP
         +BKAAoMfHo25jR3mD0dCVWb1mvg4NvGzM7OuNNQEoj6RiT3PUxxJ6NJ+i/bK4gZeRiU0
         Al8itCk6f4cMiKMQaIJrUEKqgYjc7M0v8n0Lq/Qx47Bna365bSK4jPgHLkOKVR6gHOoU
         G7lQ==
X-Gm-Message-State: AOAM533K86cCHEdcpW8p91hYH801P/WRZsvtny8vqwwfDyU27Cwks/JN
        xkPtIbZ3ziel2vQF9MCCbX15CfXcgs0yqw==
X-Google-Smtp-Source: ABdhPJytvroZhJKWznFEO/Ui7UguScUUzjXW7OnW0380g2TVaOrpz8Vd7Od5hHPU5JeyLUaIh03AIQ==
X-Received: by 2002:a05:6808:1404:: with SMTP id w4mr588350oiv.53.1622001500071;
        Tue, 25 May 2021 20:58:20 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q22sm4091615otl.11.2021.05.25.20.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 20:58:19 -0700 (PDT)
Date:   Tue, 25 May 2021 22:58:17 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] soc: qcom: socinfo: import PMIC IDs from pmic-spmi
Message-ID: <YK3HWaAaM3PRWZ4l@builder.lan>
References: <20210504203752.95555-1-luca@z3ntu.xyz>
 <08fde8a5-1d9f-4676-41c2-133b7a9a1c75@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08fde8a5-1d9f-4676-41c2-133b7a9a1c75@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 05 May 14:14 CDT 2021, Konrad Dybcio wrote:

> Hi,
> 
> 
> > The driver in drivers/mfd/qcom-spmi-pmic.c has a more complete and more
> > up-to-date list of PMICs with the respective IDs. Use those names for
> > socinfo.
> >
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > I'm sending this as RFC because I'm not sure what names are correct for
> > the IDs that I've replaced (13, 16, 17, 20, 21, 24).
> > For PM8941, PM8841, PM8226 and PMA8084 I'm quite sure that the IDs are
> > correct, but I don't have devices with the other PMICs. Please advise
> > what to do.
> >
> As far as I'm aware, qcom did the lazy and ugly thing (as they usually do) and
> 
> decided to reuse previously-occupied IDs on newer kernel releases, where the legacy
> 
> PMICs weren't supported anymore. That's why some IDs have multiple candidates and unless
> 
> a better suggestion than "let's check if this 2013 PMIC+ 2019 SoC combo is sane" pops up, we
> 
> will probably just have to deal with ambiguity (for example `[20] PM8015/PM8998`).
> 

I like this suggestion, even though I think it's only PM8058 we at all
care about upstream (as of now).

Luca, can you please respin the patch accordingly?

Thanks,
Bjorn
