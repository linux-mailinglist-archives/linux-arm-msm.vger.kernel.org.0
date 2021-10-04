Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3E9421630
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 20:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234477AbhJDSQi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 14:16:38 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:39900 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232577AbhJDSQi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 14:16:38 -0400
Received: by mail-oi1-f181.google.com with SMTP id a3so22775517oid.6;
        Mon, 04 Oct 2021 11:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xmMc3rWEU1efxoTuQUPwz+mRri1cEQCNMADP+8wt6Ag=;
        b=BmlEMhvvuCPfCvvSfRm7pYeKVoe5wrNsjBDb1bWPveVzLWamRdxXMt6aCphheX1OCN
         HqcjGyFZMmdPLTzVoExu/yqZJbhi78KlkQHNhE+HzjqGOxAejoGl9gdWBVsx6dDZXUFU
         PCZX/51rQ09K278ZHYSgLDmtqlP6tfqMAfKPfp3HlmMn0TR3mCl2qZUNIfyYzwwcjWwd
         OUbLDtoyVjZSwHWyAQf2sxiMeBAiU2VCymF1rcnEUeB4moeX8/HrEzSyavZyGrINLNwb
         7LS9h2TwrFleem+2GDqv7HZc2DDCQqhGSgy/xHdl6FVD8cgH5b4JSfMmC6cFnzne61gO
         pFVw==
X-Gm-Message-State: AOAM5302mxYSEdIDmrM3HK+a168ixGUZ9BiJu3rU+zbgIgOcJGsuFrXA
        fANlorjVl38AMADUU6OPHQ==
X-Google-Smtp-Source: ABdhPJwweR08rYfQVmo9mS5FC4ORSY8zaEfqR67w5NN8q0Flrm0RAAnE9yHyUo7wtCTpOIT6vn4U+g==
X-Received: by 2002:a05:6808:15a3:: with SMTP id t35mr14498181oiw.92.1633371288751;
        Mon, 04 Oct 2021 11:14:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s13sm1194251oou.11.2021.10.04.11.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:14:48 -0700 (PDT)
Received: (nullmailer pid 1590538 invoked by uid 1000);
        Mon, 04 Oct 2021 18:14:47 -0000
Date:   Mon, 4 Oct 2021 13:14:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add QCM2290 USB3 PHY
Message-ID: <YVtEl5KCUM8UIpuT@robh.at.kernel.org>
References: <20210927064829.5752-1-shawn.guo@linaro.org>
 <20210927064829.5752-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927064829.5752-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 27 Sep 2021 14:48:28 +0800, Shawn Guo wrote:
> Add support for USB3 PHY found on Qualcomm QCM2290 SoC.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,qmp-phy.yaml | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
