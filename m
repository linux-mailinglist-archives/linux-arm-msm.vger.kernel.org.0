Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 368B0274CE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 00:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgIVW4H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 18:56:07 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:34393 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgIVW4H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 18:56:07 -0400
Received: by mail-io1-f46.google.com with SMTP id m17so21596441ioo.1;
        Tue, 22 Sep 2020 15:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B40zJiCxFwcIxVYw4+x2oC9UiQFIER9XDor8W76xqKw=;
        b=OJro6q3hpqMGeEUan9X0glNmpPAXw5jofc6RomFUPkQdOjx3B8R+VhC2K1ONG3Mu4s
         BT30wcrvEARWiKKGDi7HUYt49thsLOcZmUM/u/wBBu35Ds5dBFiNXyRRqz43igqDLoPZ
         MS+ixPLltYGUUCxasFfBt3MDkvd4MLFZm3tohHZaU8NDidLq49jBe9XXYFsCJSRBHCTi
         QU/NOPR9doQ6op0laUmUJnjFtX7QGGf3fdnJ0X7eUyeRNNF7vedfNWA/bi8B5f6QV+ar
         SpCNfIGnCRyGXvvsLOwqe2/Zcb7dccqKAvstEzaVvOXOSzzhHCbm1D0jfT3gEkLYx0uT
         L+BQ==
X-Gm-Message-State: AOAM531HxXlhkWzZE30DBp+6x1RQRPa6iJEdOwqBphpgOnpSxsaD8ipN
        Tx3DWWykPDSQaF/lToFEHA==
X-Google-Smtp-Source: ABdhPJydzv5F0MIVL+VDl6Y0085JV1JV6CtJS+xbd3abX4GRw7HpXNLJLK8qV8eQRDFfAWLfKpxlrw==
X-Received: by 2002:a02:9a0e:: with SMTP id b14mr6171053jal.22.1600815366152;
        Tue, 22 Sep 2020 15:56:06 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l6sm6817260ilo.21.2020.09.22.15.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:56:05 -0700 (PDT)
Received: (nullmailer pid 3417418 invoked by uid 1000);
        Tue, 22 Sep 2020 22:56:04 -0000
Date:   Tue, 22 Sep 2020 16:56:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC 1/4] dt-bindings: clock: qcom,dispcc: document power domain
 bindings
Message-ID: <20200922225604.GA3417362@bogus>
References: <20200911130950.578483-1-dmitry.baryshkov@linaro.org>
 <20200911130950.578483-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911130950.578483-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 11 Sep 2020 16:09:47 +0300, Dmitry Baryshkov wrote:
> SM8250 requires special power domain for accessing MMDS_GDSC registers.
> Add bindings for the MMCX power domain.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,dispcc.yaml           | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
