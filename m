Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AD82FD649
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 18:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbhATPwY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 10:52:24 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:37970 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391084AbhATPvB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 10:51:01 -0500
Received: by mail-ot1-f46.google.com with SMTP id 34so12946502otd.5;
        Wed, 20 Jan 2021 07:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d1RIdVWUE4TQGWQdWOMOdBMzSo28XMRtLOv3LQVvbYY=;
        b=qwpc6KR2Mbs2hnNQymugjuOwxvGWW4BeTujV0I8qubQ7wVd9w2pqGzmHzXW0RXF5Ie
         RXxuTKy5dhSX5rpwC67Jotl6fCHqRjwtNUrKwH2djsv1vq4IOUnHDkcF8vN3bgUPyGeF
         Oz13yXgUzXRsUu1vCdxVhWz5xPnZEGQ/i8cLDXHZ9l9QUrqZPcfE6Lk2tPabyNr4AUOT
         UFba8tBc0XRx8ns60CXYA7JnPnqF+p+1C6ru3/V30mDXq1B3QGk5upt7QNQ5ieavuODu
         YR8DoloL3MKIE7DIK4NAItPbE5GkUOQw5gVglRsT5+yEVEpD2NQPixhJI33xnReTJ4Di
         vf/g==
X-Gm-Message-State: AOAM532d2yNKU0EOmJuJvGhCNMH6TW9J6LiuHynhUyDMnx3f2Yw4bSal
        eEI8uh9mJ1uSsvDzVItS1w==
X-Google-Smtp-Source: ABdhPJza+e1g6BqmYZCEdNrw4PdYHbZpUkkQnnQYFNep0IagbifZCgUs/DzozVcOsfQc40GCknXmSQ==
X-Received: by 2002:a05:6830:1ad4:: with SMTP id r20mr7218321otc.354.1611157820437;
        Wed, 20 Jan 2021 07:50:20 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x12sm423724oic.51.2021.01.20.07.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 07:50:19 -0800 (PST)
Received: (nullmailer pid 214205 invoked by uid 1000);
        Wed, 20 Jan 2021 15:50:18 -0000
Date:   Wed, 20 Jan 2021 09:50:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     bjorn.andersson@linaro.org, sboyd@kernel.org,
        jassisinghbrar@gmail.com, viresh.kumar@linaro.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, ulf.hansson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: Add Qualcomm A7 PLL binding
Message-ID: <20210120155018.GA213895@robh.at.kernel.org>
References: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
 <20210118041156.50016-4-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118041156.50016-4-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 Jan 2021 09:41:54 +0530, Manivannan Sadhasivam wrote:
> Add devicetree YAML binding for Cortex A7 PLL clock in Qualcomm
> platforms like SDX55.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,a7pll.yaml | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

