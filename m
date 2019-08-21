Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6597B984A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 21:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729903AbfHUTjB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 15:39:01 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43990 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729817AbfHUTjB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 15:39:01 -0400
Received: by mail-ot1-f65.google.com with SMTP id e12so3166533otp.10;
        Wed, 21 Aug 2019 12:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8mSUBvKyZ2vGMMc++yVXStFOpJ1mZn6ZVsHLCooip10=;
        b=De4QM4HqMq4c+LKzSY1t8z42h3S1u0634OfIS1wD0i0OQkXFwM7ktAVDat7fdhP/WE
         tX67HR5SbYFF0fjRfwi41FIZS6K4ISkt850IPXMOVrO15fTSs6Y6el2UHxNv8qYJYTZZ
         MoFMycOUizwrI+e8ZM5G0WqxKmxdXosJDN74iQDfnaFEINaW4/vIlXwlMItPdu/YLKFb
         noocdz0TJ9dc/EGzpeP8fSScDjd7QdwsKCN1H6PdLphICOccfPUfIw8XWZQ7ViR8edWj
         lMZXl2SI5DNaWM0RyyyfcjP1nllmPPKq9qRmkOZJ3PkGlm4v8MmkIjDqD+lhynj+dGJS
         scaw==
X-Gm-Message-State: APjAAAXyHeF/c0l+fqXoIFXdPxsmgyvmQacBF4/xihcVM5GIXjaRt+C1
        6vYnXbnkiUJLoszNFBxAiA==
X-Google-Smtp-Source: APXvYqwoLYGtfF56/vswmktteXtONurodUPUBZPKvAOpmRfHnkX4zAc3WGz12QNBgagn7e3WbidDFA==
X-Received: by 2002:a05:6830:1b65:: with SMTP id d5mr28520331ote.278.1566416340440;
        Wed, 21 Aug 2019 12:39:00 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 65sm7769301otw.2.2019.08.21.12.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 12:39:00 -0700 (PDT)
Date:   Wed, 21 Aug 2019 14:38:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org,
        aneela@codeaurora.org, mark.rutland@arm.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 4/7] dt-bindings: mailbox: Add APSS shared for SM8150
 and SC7180 SoCs
Message-ID: <20190821193859.GA12514@bogus>
References: <20190807070957.30655-1-sibis@codeaurora.org>
 <20190807070957.30655-5-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807070957.30655-5-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed,  7 Aug 2019 12:39:54 +0530, Sibi Sankar wrote:
> Add SM8150 and SC7180 APSS shared to the list of possible bindings.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt       | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
