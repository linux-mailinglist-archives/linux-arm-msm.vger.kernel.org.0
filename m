Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B60332F46F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 21:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhCEUIy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 15:08:54 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:43503 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhCEUIn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 15:08:43 -0500
Received: by mail-ot1-f45.google.com with SMTP id v12so2982938ott.10;
        Fri, 05 Mar 2021 12:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1VkpyMwu7TaCcYJvn0nbhtT6vs+pfITfuVaHyqtsg9k=;
        b=pKTIR6waYJdcm2bkaL4qt/q5BLkb5hiJEFuQJojoqYOYRuvLSKZAcDypyJX6lvyInh
         h0+1NXL7YxUZlds1/lM0UzyTrZFfgmJc7xA9lS1NFrhi7wnfsRsfU0yD2goibuDZ5z9A
         4eAMywvW8i3pA/NfdERGCajNXG2nhyzzHFLqOAyrd84DEPg/G70i9uHKRKOlCT1yBI9+
         gf9HgwQLQS5Z6o2Cy8+tSq2Y0Zb7uJUfSAr2qWbJer8Q4n1kHoCeLK4siDZ8pOppHFn5
         TwU/YspDR/FQAwZCXlS9KU/nVimFeYoXilC6Hqkw3nRFa079MNvrsq5WEhj2ozejsutP
         23vA==
X-Gm-Message-State: AOAM530Ra/ysg1OE5sljTV4MgsRqvX4uuHLlfJLgIv2rtNG+0NlrYVQb
        9LN4KLpjmAXj0o3Aq1qnhg==
X-Google-Smtp-Source: ABdhPJymgBHpsJ5WIb9ih+wSBcL0CZncUV4NscumkU8TTxyZiONGrdMRwFRsrtj35wSMzi5PrPFb6A==
X-Received: by 2002:a05:6830:1e14:: with SMTP id s20mr4210656otr.199.1614974923199;
        Fri, 05 Mar 2021 12:08:43 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e13sm812769otj.64.2021.03.05.12.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 12:08:42 -0800 (PST)
Received: (nullmailer pid 566781 invoked by uid 1000);
        Fri, 05 Mar 2021 20:08:41 -0000
Date:   Fri, 5 Mar 2021 14:08:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH 02/13] dt-bindings: firmware: scm: Add SC7280 support
Message-ID: <20210305200841.GA566727@robh.at.kernel.org>
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org>
 <1613114930-1661-3-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613114930-1661-3-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 12 Feb 2021 12:58:39 +0530, Rajendra Nayak wrote:
> Add compatible for SC7280 SoC
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
