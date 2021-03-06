Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0578E32FD4F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 22:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbhCFVBe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 16:01:34 -0500
Received: from mail-qt1-f180.google.com ([209.85.160.180]:36275 "EHLO
        mail-qt1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbhCFVBa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 16:01:30 -0500
Received: by mail-qt1-f180.google.com with SMTP id 18so4699054qty.3;
        Sat, 06 Mar 2021 13:01:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l85sQMIs+NfNFMSyOF38inzETHxxqxRPmN1d4ghhsRA=;
        b=udSXDzpHahF8xrHaxunEMK/WiE2tfJZkszd24bKp6o9/SafqNBBJcm4ovW0OhbdGql
         MbXol1Mu/iBdSAY16AvjlvsXAMb3sUU6hX3H/uBBfwbjkDscKpHaM+vVgBumy0kibMT5
         VTEnP1H45Uv++EcOiHVHqJ9Imwpp33b11Q4ZCXIrkGYjrPVPf4dB0S4wpFjy16dwIS6M
         EjknAuFVhO0ujzqnWUUtFK58v0Z3XiLxXVQtjq8mmunEnxXzuR6cLHjM8GqPCk8AjkH+
         b98DMGvyMb92g9neAxCf22wJt+dZeX0vUWGwQ/gp+3a1ZnPKeeqrf5XSuGNQZwDj1anf
         lVzw==
X-Gm-Message-State: AOAM5318zeXIoMQloE3OIcjFc469RkDXnUwccakbmNhEp5C+70/HVn3B
        FWFFF3tB1OUVIKJf2yXzo6PV7YrWgAxJ
X-Google-Smtp-Source: ABdhPJwcxDxL6OjU73HMeWCdrmgJ3tmXgvyChPWpEtRNLPoyQ+FJMd18SBMBCDOEgP0URXUs4vWwEw==
X-Received: by 2002:a05:622a:28d:: with SMTP id z13mr14573106qtw.87.1615064489260;
        Sat, 06 Mar 2021 13:01:29 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id d16sm4550200qka.43.2021.03.06.13.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 13:01:28 -0800 (PST)
Received: (nullmailer pid 1206171 invoked by uid 1000);
        Sat, 06 Mar 2021 21:01:23 -0000
Date:   Sat, 6 Mar 2021 14:01:23 -0700
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
        richard@nod.at, boris.brezillon@collabora.com,
        linux-arm-msm@vger.kernel.org, Daniele.Palmas@telit.com,
        vigneshr@ti.com, linux-mtd@lists.infradead.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mtd: Convert Qcom NANDc binding to
 YAML
Message-ID: <20210306210123.GA1206091@robh.at.kernel.org>
References: <20210225140842.66927-1-manivannan.sadhasivam@linaro.org>
 <20210225140842.66927-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225140842.66927-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 Feb 2021 19:38:40 +0530, Manivannan Sadhasivam wrote:
> Convert Qcom NANDc devicetree binding to YAML.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/mtd/qcom,nandc.yaml   | 196 ++++++++++++++++++
>  .../devicetree/bindings/mtd/qcom_nandc.txt    | 142 -------------
>  2 files changed, 196 insertions(+), 142 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
