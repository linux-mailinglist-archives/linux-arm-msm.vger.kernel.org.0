Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3585B421654
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 20:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238336AbhJDS0J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 14:26:09 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:39576 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238247AbhJDS0I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 14:26:08 -0400
Received: by mail-ot1-f51.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so22760757ota.6;
        Mon, 04 Oct 2021 11:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I8C6omRBM7w+zawURpweOZdbR8ZsGh4yPfXespsj7Mw=;
        b=r9a3uOuWpgN9EKxaUCZmq36mM9hgTfH8ZaTcjsbHegdQq4f88NTemi3lvTVhr/JeQ8
         7XfTX5o76XzjrpAhGVDgBfPr0iCqDQ+I1pErqTptE5T1F9mXFj05gUF2LP44PrUyx+kB
         pJiQ9Q2LjnohXFOf6z/OL3hFkk51e4m/wHQgJHO83UDc9sWtdpnm6+aZTaHyn6724sRh
         qdYg1VAS10ODpR6+WEnhYfo2mofFWkvj1Uqc43UsMWItkyE+oZJsy4mnVhlUA8H+oC4M
         CFa7b7CUhPSoZR+qzH4uJNMim1+YQ6++tOU/a3MVPYe+LbN2zBCpGNWFBmH177RFNl+S
         xqTQ==
X-Gm-Message-State: AOAM532h8y5cnRAEaYQz/Zd9ThnmXgYjTlsniKujFxovAcsOx1PwxlfX
        F6fzTNobsByocKUXmjbiAQ==
X-Google-Smtp-Source: ABdhPJyz3iyi8pdNozO1buCxQq0lKE7CZUj/lBglIAfSRb7shKh475ahJOdyldBMSKiA2gfK+3ymaw==
X-Received: by 2002:a9d:a47:: with SMTP id 65mr10736490otg.133.1633371859172;
        Mon, 04 Oct 2021 11:24:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k15sm2993763otp.68.2021.10.04.11.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:24:18 -0700 (PDT)
Received: (nullmailer pid 1605087 invoked by uid 1000);
        Mon, 04 Oct 2021 18:24:17 -0000
Date:   Mon, 4 Oct 2021 13:24:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Jami Kettunen <jamipkettunen@gmail.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-phy@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,qusb2: Add missing
 vdd-supply
Message-ID: <YVtG0Ykkfy3/Am3J@robh.at.kernel.org>
References: <20210928022002.26286-1-shawn.guo@linaro.org>
 <20210928022002.26286-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928022002.26286-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 28 Sep 2021 10:20:00 +0800, Shawn Guo wrote:
> Besides vdda-pll and vdda-phy-dpdm, vdd-supply is a required supply for
> PHY digital circuit operation.  Add it for correctness and completeness.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
