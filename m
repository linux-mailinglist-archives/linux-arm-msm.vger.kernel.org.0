Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D45B81B14FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 20:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgDTSp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 14:45:58 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43330 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgDTSp6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 14:45:58 -0400
Received: by mail-oi1-f194.google.com with SMTP id j16so9716146oih.10;
        Mon, 20 Apr 2020 11:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XsG9QK9dAoW9muwGTb9GQutYVR9s3SDoK6UGUt9eOoI=;
        b=AXzIMLOi3wxCvpWOWO/O/sbWKwFb0g96WvOOC+FiW2sZ7M5NZAY1Qqqz6XVTuXv/5o
         h6ynghiFZOVkOO/KPHAr5Cbnj3k5kVN/8PkBffE4DcYSnz0i/amNCoZA40oT7qEI5Pkr
         3ZX33cYDf+MDs2mE9VPjp9T/frvy2dHG1SWi5k/gHVpUmdVY5fn0FOEEn8EQOBRDFLlk
         8PjlMdb+RQ2qujaxsa5EPi3NtdrMcU0YMguJAIApvGr0eZs5kkEaB8/ACne0rSvPuhNZ
         So3QmSuotKq7ddMvYIAqxEoT5hT4dFifuAkx2SaHQvyo/DX8092Fh02ORRQcjxuxMhVg
         7Cqw==
X-Gm-Message-State: AGi0PubOKzMK1XT2azvLpvZj3ajsiDH4Kk5XJp8iS7FOQKvipwsOP/fd
        F9ypctc8iNwOIyjwcpcojg==
X-Google-Smtp-Source: APiQypLRAdtkYVjy4p7D3yVGkjCPhwTk5dbmBpu9n631ISbzrQ14DWeHGLHxuMEMQEPtPqvG8JFtWQ==
X-Received: by 2002:aca:c3c1:: with SMTP id t184mr545846oif.171.1587408357184;
        Mon, 20 Apr 2020 11:45:57 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v14sm63557ooe.10.2020.04.20.11.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 11:45:56 -0700 (PDT)
Received: (nullmailer pid 26216 invoked by uid 1000);
        Mon, 20 Apr 2020 18:45:55 -0000
Date:   Mon, 20 Apr 2020 13:45:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: Re: [PATCH V2 1/5] dt-bindings: phy: qcom,qmp: Add ipq8074 usb dt
 bindings
Message-ID: <20200420184555.GA26160@bogus>
References: <1586581352-27017-1-git-send-email-sivaprak@codeaurora.org>
 <1586581352-27017-2-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586581352-27017-2-git-send-email-sivaprak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 11 Apr 2020 10:32:28 +0530, Sivaprakash Murugesan wrote:
> Add ipq8074 qmp phy device compatible for super speed usb support.
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
> [V2]
>  * corrected typo in compatible
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
