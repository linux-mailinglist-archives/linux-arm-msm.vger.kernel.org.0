Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30DC344E5D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 12:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234728AbhKLL5o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 06:57:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234656AbhKLL5o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 06:57:44 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4833DC061767
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 03:54:53 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id t30so15009564wra.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 03:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xz6YO9tCi5FN4wwADc5RuSYXbQOxI0FfjZ6/8K/fqrM=;
        b=GasCN4JtdArIIS+5Qcq84OctFN9Jpn3uAD/FCH0Ygj+/MKZXblNqSGH+Zswh5qq5pV
         vl9VqzCF7wn1QPA5OxLualPg+dWN5hGHFNadLz023hDpSTa06QRyke2y/R/9nwgPf/lR
         WAVwVWPjDZTxvsKwciHcisC0Y1A69IjDTNsBGWnR0UXfmWeyPVBF5DadotRaJzsfzuff
         P9DfrJKJQ1JQwk6xtekeOJ+UrNdmNiVOzeBh4WWYLSyRB5BdY2CVvJqMduWGFkQVbuoI
         nv+PJiiyw494bYgAsQvevPDDFfkdQSo+JPrbKYRUzvvPMV7F74H/aeot0ChaCVHRMUPq
         LUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xz6YO9tCi5FN4wwADc5RuSYXbQOxI0FfjZ6/8K/fqrM=;
        b=yGBz6o2u0T249U6451/HSo3P71yJFO8hYtqe8YV1DwylMc11dvcBEoIuHTDwybhvbI
         aA9qmbs2VG388MuTY5pyllIYB+6cVusD9hwqgAiq5L0iI/mzYLYDBTpGCNADPPTr88PE
         JZ6TSopIvo88Z2NTl3P51CT/EKrp8jAkWifb5Qu+2+BmkhT1i7p4LxHtU7oWgL7EKqHI
         lyiHlT5mit9QTkCbAPr2IPq6Xu4NBhEcYr3DemjWJfOSaUXEu0ot/+5I9MNNyYsmV7nD
         +Z403GjlfwmuCe8qjipAWzocUo6LAm5xcKxfTR3s8QGxu2z6AzK1Eu9gMSvEJB08DtFx
         aqGQ==
X-Gm-Message-State: AOAM531sSAJhfN/5zjGBwqU0UDLHKyDtJ3fIcJkXz1P+n4hiC0GA9QBz
        nnL7ktpA/9Vda69l9lb5mR6gCQ==
X-Google-Smtp-Source: ABdhPJzKY1hxDEOL1WG7UNNqDzCOwMyQuKQTZu3mQhH9+LDBluzp2qvZX7JbowsrVOatJpuxV8ukdg==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr17459513wrs.270.1636718091828;
        Fri, 12 Nov 2021 03:54:51 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id g13sm5191616wmk.37.2021.11.12.03.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 03:54:51 -0800 (PST)
Date:   Fri, 12 Nov 2021 11:54:49 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [RESEND PATCH v2 01/13] backlight: qcom-wled: Validate enabled
 string indices in DT
Message-ID: <20211112115449.pg2h3gjzxok6dqho@maple.lan>
References: <20211112002706.453289-1-marijn.suijten@somainline.org>
 <20211112002706.453289-2-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112002706.453289-2-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 12, 2021 at 01:26:54AM +0100, Marijn Suijten wrote:
> The strings passed in DT may possibly cause out-of-bounds register
> accesses and should be validated before use.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
