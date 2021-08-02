Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4183B3DE296
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 00:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbhHBWiO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 18:38:14 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:36458 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231920AbhHBWiN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 18:38:13 -0400
Received: by mail-io1-f51.google.com with SMTP id f11so22115083ioj.3;
        Mon, 02 Aug 2021 15:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ng2y7/T03+Ba8dW5J8buOzlTMdBr+pr5kotQ3AFjeDI=;
        b=cmGRzEfhYt28ZgmVN1YlVQyHfxZpg09BpJqohxwW31yftcQ+gN4ahJ3TlFGSnnl8uK
         Y9U6LcH22wj758+WDIKSih8d8pM3hXwXfU1hb3lpVNxCvX25AFtQ9FHUjFQX0jIrPGnh
         EJ+TJGNjkoXUGXF2KEeE+Eo0LCkBkKvLXDmCHcFVdOOizxYkThxfai2/Gm3iVQqLmxsS
         PaLxp7Y+yUYnDYCk5hfOYueRvMq8vH2JZKCsyr2lM+Xc14cWvMq17SGFum/T332sEkf3
         AMa8YlvVpc2a1UAjbJEbMFNAPozkE5X+bBYFAFnBKG4olwloauZ2WGnkmOn/od48Mv4d
         PFAg==
X-Gm-Message-State: AOAM532h2bEJBbLfsDwjZ6FITrVd42W7Qf6AW7nLTRGXu3Kmpn+0DgNy
        R8MxNFS0yGoX+tvaXMsRnQ==
X-Google-Smtp-Source: ABdhPJx0ujFTJ6a7NaXu1vwbigp+ZC4igdEXJBxwvyoUtmewCs3yyN1KsU8jYnrYwG0/sSkiOU408g==
X-Received: by 2002:a6b:4015:: with SMTP id k21mr1937ioa.28.1627943883210;
        Mon, 02 Aug 2021 15:38:03 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z21sm4611883ioz.28.2021.08.02.15.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 15:38:02 -0700 (PDT)
Received: (nullmailer pid 1751266 invoked by uid 1000);
        Mon, 02 Aug 2021 22:38:00 -0000
Date:   Mon, 2 Aug 2021 16:38:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        martin.botka@somainline.org, Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        marijn.suijten@somainline.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-remoteproc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        jamipkettunen@somainline.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: adsp: Add SDM660 ADSP
Message-ID: <YQhzyA/sU99cwFMi@robh.at.kernel.org>
References: <20210728215212.18217-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728215212.18217-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 28 Jul 2021 23:52:11 +0200, Konrad Dybcio wrote:
> Add a compatible string for SDM660 ADSP.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
