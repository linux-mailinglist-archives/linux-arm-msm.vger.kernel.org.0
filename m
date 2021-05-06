Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219C4375689
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 17:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235244AbhEFPYm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 11:24:42 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:39793 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235204AbhEFPYd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 11:24:33 -0400
Received: by mail-ot1-f42.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso5188659otv.6;
        Thu, 06 May 2021 08:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3gd59Q00UsIN3VmjUeIhTthZ0QDrMCmfvT1a++zDiFI=;
        b=LYmZ0VKe1SL3XvHsoeiLxiYfM/Sf0pkCHi4ADNNnALkQhDr6nv2jGzFSwnsQssif9W
         ZXamHHCwmB9jq1XEMA4a7+p2zffSBQgPyivrAHH+RICl2rGjF0fV9BLoEOILTO24Cac9
         KlRCK9+dGcTZKqKsQ5ENvSyXlh0w/OcQkrpu8k9fZDMxH2B6xlbxactTztqPPnafi/gE
         gCygyw+DlG3RMVO1n7QgEpMzdv6fkjrVM6Ourr8ufpX23So1bMNhZfiyx/781L2lbEQm
         rEArpvrBbFRdBNAN3ASt7hgNH8PCRh4mO4kVO9a4cJCQG1MOTL4IDHoPMdQ3QmkAkdZ4
         ANNQ==
X-Gm-Message-State: AOAM533DUrTJdTfPl7t8fY+cKgLZzFJT88tKA05jgP6mhVZFTjGQ2rMM
        2hqpCe69IE3jeQSEOQvpUA==
X-Google-Smtp-Source: ABdhPJwvsQN2eK/NTlHbSE6SVGfw3ggGDQ0VkuZPxGExJK60BByW3DR4TypPYBPg6/iuBNu8VmJvIQ==
X-Received: by 2002:a9d:7f96:: with SMTP id t22mr4169872otp.152.1620314612632;
        Thu, 06 May 2021 08:23:32 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f13sm639959ote.46.2021.05.06.08.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 08:23:31 -0700 (PDT)
Received: (nullmailer pid 351881 invoked by uid 1000);
        Thu, 06 May 2021 15:23:30 -0000
Date:   Thu, 6 May 2021 10:23:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: qcom: Add MSM8939 APCS
 compatible
Message-ID: <20210506152330.GA351835@robh.at.kernel.org>
References: <20210503081334.17143-1-shawn.guo@linaro.org>
 <20210503081334.17143-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503081334.17143-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 03 May 2021 16:13:33 +0800, Shawn Guo wrote:
> Add compatible for the Qualcomm MSM8939 APCS block to the Qualcomm APCS
> bindings.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
