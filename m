Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5FDB3B36FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 21:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbhFXT3A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 15:29:00 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:39789 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232729AbhFXT27 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 15:28:59 -0400
Received: by mail-il1-f176.google.com with SMTP id o10so2566458ils.6;
        Thu, 24 Jun 2021 12:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dSG5iyMydBCniM77uDjax6qhqUdcjRFfdotREnD1yf8=;
        b=abDSVqawn8UwNoucomArvWXDpdyREcH8uNTHZiJNGXPMgZlXW85hTf/FzYddo48z04
         cxDSsrNi0jnNKq3+Fa7G3MsM51ZzqhyiEB/rT+pnz84J/gpCNiDC7U9iVfAQyv4btbSN
         uynlGhOsuhxP9Xnx2ynjSt6BrzgyS1CdQ/QzkZtQ32JMJkWDD+Co2UJ5waVcNp0leYiE
         x28tFRJu4mNIrq/W/3NeeLOddnx1wX8Dz/f/pyhwSsZ16jqJNVz0lDKS7qH45MgfupGe
         fUxvNiaTI/fIVlfO6oxPUbkfvPB8vbZQru0eydP0X106OJ+Z7mxGuvM8g+gGjMwpNdWf
         xRAw==
X-Gm-Message-State: AOAM531oMEyw017gIzuL8X1HG1v05GQTMA10ZVu7eOfV/kTnHYoqqT5H
        XoB02lmu3+VmkixkOVqHrg==
X-Google-Smtp-Source: ABdhPJxosHZ6UCf4ZBWT4AAFBdYXYV2tlYS5vA1EcK/D2wvxLEbubSX6DPNEoAEOImWhjPNxSl5vGw==
X-Received: by 2002:a05:6e02:1486:: with SMTP id n6mr4760863ilk.174.1624562799612;
        Thu, 24 Jun 2021 12:26:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q7sm1770304iob.49.2021.06.24.12.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 12:26:38 -0700 (PDT)
Received: (nullmailer pid 1847240 invoked by uid 1000);
        Thu, 24 Jun 2021 19:26:34 -0000
Date:   Thu, 24 Jun 2021 13:26:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     marijn.suijten@somainline.org, konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, jamipkettunen@somainline.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH V3 2/3] dt-bindings: mailbox: Add binding for sm6125
Message-ID: <20210624192634.GA1847185@robh.at.kernel.org>
References: <20210612094631.89980-1-martin.botka@somainline.org>
 <20210612094631.89980-2-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210612094631.89980-2-martin.botka@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 12 Jun 2021 11:46:29 +0200, Martin Botka wrote:
> This patch adds the binding for sm6125
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in V3:
> Add this file
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
