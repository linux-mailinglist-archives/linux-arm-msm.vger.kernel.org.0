Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E1922B43E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 19:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730013AbgGWRLh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 13:11:37 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:46829 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729811AbgGWRLd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 13:11:33 -0400
Received: by mail-il1-f195.google.com with SMTP id p15so4913962ilh.13;
        Thu, 23 Jul 2020 10:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W10uFRF9PNlMYJayv5R1Pm2HIaj5J/vliPwEy5KAVAA=;
        b=rRHWKfCM14cJp9kTXs+pyyvjGC9gvCyf5FzwsTi31Efai/Q7fW8x/urQxippMcmUp2
         vSjzpPCRUWud486R976/UQcjtSGlUA+3KbaNxz/60fYNCN0sHRF7Leh39mOrjIFa33hg
         t81o8l9xq2A8i9NbT2Mc1lHWIDWoy6Ectt8SbLEY7VOd4BMEtHlBtMHHnuSZu3kzYeWt
         M73OmTYymfG8zDU0/actWbZI+bUqfQOORRFrqvKMlQpDhm0qPqWN3FFGJDSmvoX2i9Dd
         tOjmVI4KYXKKb4TcZvI31aTbjw+QAYLQqXcRP4cqhNb5Ize+xxDVzzR4GtKyeALU9Kfw
         uQrQ==
X-Gm-Message-State: AOAM530owS3DiUyYTf89+SGDjQ4r2upBVxJHLvTeQkTLwyjGIBlBOH1y
        H0/Ub7f4zNgIW7hiAjGjiA==
X-Google-Smtp-Source: ABdhPJwBOwWbNgntw6RkaJvSYZqmju6uJjrnsDHD6EwiLBFu8XLvtd0BZCUpcGvP1P6XjnZITh2bPQ==
X-Received: by 2002:a92:c011:: with SMTP id q17mr5990026ild.290.1595524291809;
        Thu, 23 Jul 2020 10:11:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f18sm1733238ilj.15.2020.07.23.10.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 10:11:31 -0700 (PDT)
Received: (nullmailer pid 547620 invoked by uid 1000);
        Thu, 23 Jul 2020 17:11:30 -0000
Date:   Thu, 23 Jul 2020 11:11:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rohit kumar <rohitkr@codeaurora.org>
Cc:     broonie@kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        agross@kernel.org, perex@perex.cz, robh+dt@kernel.org,
        Ajit Pandey <ajitp@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, lgirdwood@gmail.com,
        bgoswami@codeaurora.org, srinivas.kandagatla@linaro.org,
        plai@codeaurora.org, tiwai@suse.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 08/12] include: dt-bindings: sound: Add sc7180-lpass
 bindings header
Message-ID: <20200723171130.GA547571@bogus>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-9-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595413915-17867-9-git-send-email-rohitkr@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 22 Jul 2020 16:01:51 +0530, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Add header defining dai-id and mclk id for SC7180 lpass soc.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>  include/dt-bindings/sound/sc7180-lpass.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 include/dt-bindings/sound/sc7180-lpass.h
> 

Acked-by: Rob Herring <robh@kernel.org>
