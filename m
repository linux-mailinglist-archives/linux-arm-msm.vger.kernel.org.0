Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3913B234D8A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Aug 2020 00:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgGaW2J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 18:28:09 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39323 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgGaW2J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 18:28:09 -0400
Received: by mail-io1-f68.google.com with SMTP id z6so33218201iow.6;
        Fri, 31 Jul 2020 15:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lVipxMk9ygvfpcjJVZrzThQ+Zrm2/v1HmQBOyDjm7ck=;
        b=Sofo4MdpHe9O4EDhPqdveguegDLMJKt5Na+Xlz0BIuKTBefPONNojth4VES3hxFi6n
         JHh203C5roLXh0sy/X83jkrERuDpueO7dqnhTFTd/jFhbZ8PjCWYkLh2u1JFdlc5638x
         stk1wfHV6BSrO7Zb3nhj/AlrCV35bQzlFpT3t9PWCyUl8vy+KeJhV5AhoFHwpcC5/RDo
         peVMg3bs2IYWYlg5Lmu9eSUoosqSu+FaD1OeRfy0lk2N24536GyxuQq8Pzox6axQSpwT
         fgEzSWXWGRlxMB9KyO1BZyhGn9NuzLIHtloK2c6NmQ8qNISJXkojchb+DL07HkAb5Y+z
         xWGA==
X-Gm-Message-State: AOAM531+XDxyRXqUL0qzLJi/OmPKMDGSe0fCTy6fQYGkGJl4Kdl+M1R0
        g0Bfg1uOLoOa/MrqQ5gIaw==
X-Google-Smtp-Source: ABdhPJyhgkkbf5wFHQLPFhUz3p3G2zL0Mah1EkGWTiI20QWPkSh0QjyT3bIC9/72a43QevxfhpwLXQ==
X-Received: by 2002:a02:7786:: with SMTP id g128mr7214587jac.45.1596234488622;
        Fri, 31 Jul 2020 15:28:08 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s8sm5361787iow.11.2020.07.31.15.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 15:28:07 -0700 (PDT)
Received: (nullmailer pid 919097 invoked by uid 1000);
        Fri, 31 Jul 2020 22:28:07 -0000
Date:   Fri, 31 Jul 2020 16:28:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, sivaprak@codeaurora.org,
        robh+dt@kernel.org, broonie@kernel.org, agross@kernel.org,
        lgirdwood@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: add compatible for the IPQ6018
 SoC
Message-ID: <20200731222807.GA919019@bogus>
References: <1596098964-19878-1-git-send-email-kathirav@codeaurora.org>
 <1596098964-19878-2-git-send-email-kathirav@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596098964-19878-2-git-send-email-kathirav@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Jul 2020 14:19:22 +0530, Kathiravan T wrote:
> Add the mailbox compatible for the IPQ6018 SoC.
> 
> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
