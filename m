Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C05E41A0E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 22:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236843AbhI0U7q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 16:59:46 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:39884 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236723AbhI0U7p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 16:59:45 -0400
Received: by mail-ot1-f42.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so26204858ota.6;
        Mon, 27 Sep 2021 13:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T+oO+q9uTHene+6MJpbDZGG/hGqpkwIsiNpAYh7tp2c=;
        b=3gRfuHIF5rYdO630b9QRBQKYc7UbIdn8+b/oKNy3AwSUaZTFe5FCRa4a/8Xz2vufQI
         5fsQcg4qAMwZkvg0F6vk5OwPN4wY/lC+VrNGxhvrNMUOl+KimZOWJK2WvPUgkDbcLu3A
         IVPcLG2DmhMHYJM0OpdY6vgzHzD5v7qUeNyV5NfEJJUxsEY09V3bPQbrCUbtGBBuOBNs
         dQxjbvEOL4MxmZGCWmm5cakS+1OwSNg4th8nDgwENhT5X4tusz25ngjweT8Jb2mf16lR
         h44Bk6g2T6IILYSxv+e5nXToJVDWQixrZCGOU/16UkaCvVqG9wfv6PycmM47zwzbac3h
         a1Og==
X-Gm-Message-State: AOAM531Xiblw6/kr5/HEDkA8XxolPfiuF5tk+X3uKCMZ552lJfcqHFfc
        ++j68T0jW239NnqBd2n3qg==
X-Google-Smtp-Source: ABdhPJwbTL4lMi71JS4MYcb+wMczLubUBwcUPuBKqhkh2PAL1O98pWcD9XnrRWcNmRiJFE813CDSZA==
X-Received: by 2002:a9d:4e91:: with SMTP id v17mr1830005otk.297.1632776287237;
        Mon, 27 Sep 2021 13:58:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r19sm4355739otg.37.2021.09.27.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:58:06 -0700 (PDT)
Received: (nullmailer pid 3861865 invoked by uid 1000);
        Mon, 27 Sep 2021 20:58:05 -0000
Date:   Mon, 27 Sep 2021 15:58:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     jamipkettunen@somainline.org,
        angelogioacchino.delregno@somainline.org,
        martin.botka@somainline.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        marijn.suijten@somainline.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994
 GCC driver
Message-ID: <YVIwXXAE7HvXZxNt@robh.at.kernel.org>
References: <20210923162645.23257-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210923162645.23257-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Sep 2021 18:26:34 +0200, Konrad Dybcio wrote:
> Add documentation for the MSM8994 GCC driver. While at it, retire its
> compatible from the old, everyone-get-in-here file.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v3:
> - Don't document the compatible twice
> 
>  .../bindings/clock/qcom,gcc-msm8994.yaml      | 70 +++++++++++++++++++
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |  2 -
>  2 files changed, 70 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
