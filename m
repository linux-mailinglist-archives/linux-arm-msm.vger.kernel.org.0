Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A92CFF85A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 01:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfKLAzh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 19:55:37 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37546 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfKLAzh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 19:55:37 -0500
Received: by mail-ot1-f65.google.com with SMTP id d5so12899280otp.4;
        Mon, 11 Nov 2019 16:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+z0lCoBUADm3R12lZfFDcZyZCyiTz2wqkm2IayUdiM0=;
        b=QWVyVFOrdI6pBr2LfT2m6q/9lIeU3hGNzmuZVkwQaGAFR5Vex8hjcTtLBU4k5I+8E+
         niYxJdlZl1Dr1RkbcNq99faAywpYnBRLd5EIWqifzc7tBDETF1xcMnzQK8Yg9GRAT90L
         OF1oY+GG00NMhFLZCXfSFbolZBMM5xmwUIZMpX9MyIOsmidgJXqbFORZ4rrEq2rbWX1u
         oKSL4Xfq+SUVBXLxQS7qV7zbNEZZXsF1Y5pkHQZTCXpzL600huqlV1OhqEBYpboVS1h0
         gJZC6dsYtWDEYsByjkV2DfFPvB+aaOtBAia32i7c4mV3UY/8c603GFIIJWb9TeTmCn9c
         VHHg==
X-Gm-Message-State: APjAAAVlRC66BogYIEMrIEFWAwt5zH1aBj6NyINdH67FoLrNgOQwj09h
        mvwlQGbjoqGGuVXJ1LDe1Q==
X-Google-Smtp-Source: APXvYqwL8yt7UtDKW+o7Qx7dwCNLZg8iJkhnbTBSLmJxk2Tf9FK20JkPABtLDnyJMutfD/0SSf4Tvg==
X-Received: by 2002:a9d:6141:: with SMTP id c1mr23902824otk.117.1573520128782;
        Mon, 11 Nov 2019 16:55:28 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e93sm5925344otb.60.2019.11.11.16.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 16:55:28 -0800 (PST)
Date:   Mon, 11 Nov 2019 18:55:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v8 3/4] dt-bindings: clock: Add support for the MSM8998
 mmcc
Message-ID: <20191112005527.GA7038@bogus>
References: <1573254987-10241-1-git-send-email-jhugo@codeaurora.org>
 <1573255068-10400-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573255068-10400-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri,  8 Nov 2019 16:17:48 -0700, Jeffrey Hugo wrote:
> Document the multimedia clock controller found on MSM8998.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,mmcc.yaml       |  36 ++++
>  include/dt-bindings/clock/qcom,mmcc-msm8998.h      | 210 +++++++++++++++++++++
>  2 files changed, 246 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8998.h
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
