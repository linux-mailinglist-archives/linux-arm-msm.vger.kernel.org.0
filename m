Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C98E234C2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 22:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgGaU0H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 16:26:07 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39964 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgGaU0G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 16:26:06 -0400
Received: by mail-io1-f67.google.com with SMTP id l17so32888619iok.7;
        Fri, 31 Jul 2020 13:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BGJ0cV6tlcyXT1xqGGOkGIW3JZcU+nzmQwF+b4XNxkk=;
        b=Bx14m6H/LPyFSWX2VzgS4o4q1xTt0gNUTAEVBO4k1t60Bm+MT7osUy+TVAaneP7u31
         QhXugoz5j+VWNQu3OzzePCRiGb3Fay3rW1GkgDo2zSzZL/QOOUEu46A3HhcKvIGiNlNn
         lj8Fe5zv32lph9VPg+wsY5zGPE++x9fITIDs92WVbuckucVEqVt6yGTN45bwDpbn1DUt
         ENyoM3JZ60/EmI/VHMaTn/2jguhx4JLPs1ndmadKn05OokM+QmkKNBIv3XfxIjfnltsQ
         QNnM60CJgpamWMMD6cBY/ddYCyIJ3BaeF5IlcA6xIB8Za61wog6lQOyYfw5CilAFmItj
         3KJA==
X-Gm-Message-State: AOAM5324akj5nMQDo+LDKy9ywDnigm6jdWgVAy/mYWE3ERKa3z22oXHN
        dVbF1mzWFCYVK1di3ekRCQ==
X-Google-Smtp-Source: ABdhPJwE1oeviUbVjkAV9WCXrw2poWOORAGd9woxfUZAaudtQVnqWHqszu63PdcS8I49J5RJfronOg==
X-Received: by 2002:a02:6009:: with SMTP id i9mr6756397jac.78.1596227165611;
        Fri, 31 Jul 2020 13:26:05 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n1sm5322084ilo.68.2020.07.31.13.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 13:26:04 -0700 (PDT)
Received: (nullmailer pid 722926 invoked by uid 1000);
        Fri, 31 Jul 2020 20:26:00 -0000
Date:   Fri, 31 Jul 2020 14:26:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     freedreno@lists.freedesktop.org,
        Michael Turquette <mturquette@baylibre.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        dri-devel@lists.freedesktop.org, zhengbin <zhengbin13@huawei.com>,
        Sean Paul <sean@poorly.run>, Felipe Balbi <balbi@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        David Airlie <airlied@linux.ie>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-usb@vger.kernel.org, Krzysztof Wilczynski <kw@linux.com>,
        martin.botka1@gmail.com, Brian Masney <masneyb@onstation.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/9] phy: qcom-qusb2: Add support for SDM630/660
Message-ID: <20200731202600.GA722818@bogus>
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-3-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726111215.22361-3-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 26 Jul 2020 13:11:59 +0200, Konrad Dybcio wrote:
> QUSB on these SoCs actually uses *almost* the same
> configuration that msm8996 does, so we can reuse
> the phy_cfg from there with just a single change
> (se clock scheme).
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  drivers/phy/qualcomm/phy-qcom-qusb2.c                     | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
