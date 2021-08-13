Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 177D13EBC14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 20:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhHMSb3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 14:31:29 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:41591 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233116AbhHMS3P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 14:29:15 -0400
Received: by mail-oi1-f179.google.com with SMTP id be20so17146539oib.8;
        Fri, 13 Aug 2021 11:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zZCdGU68OAkJc6X7hI5SXJs2mB8DxFZBfZ+b7CmoJgk=;
        b=lmIWKug6vRie56/gryTmcDTlhdqs+KT9M6w1XxYnjbMAjNXnVaAoGJGegGGN7sYeDe
         V99h06LvEvoQCaHgcbdlY38TzRGGnatWa0NO1P17vvLXuXb5sJaR/fc+rH/7AKak4kCT
         qVqQZpE6OBVBx69gzniXOjrLFa3wqnwwTjecGVFPftw4Y+kRyILLQhsA0pJSwey0fzf6
         5kPe/al0So2yfVx1bHp+XYNT80Cf0nHEvScZql/3eg+L0md01LTqpT70vfTMW565f3Z3
         Wax6oDkYcoXFf1LUa5ntTviTg4kH/6wxYengeyVZvWEKcwFv67xqtxh2o8mUFc/Kk1qz
         HhyQ==
X-Gm-Message-State: AOAM533ljmzAmTrYCPOvfJcQ27jDIMcO9tdJZzOm3jWDjy8ZHXQGfVyu
        iFK339z1l/VtiXEHnK2sUw==
X-Google-Smtp-Source: ABdhPJz9MREtiq35h0kEgBsz0lVLN1iN55g1Kkmm/x/pVF9OxvS3DVnNjeLNGCKCHRJDIPJ+7nUZ4A==
X-Received: by 2002:aca:5888:: with SMTP id m130mr3183934oib.3.1628879327512;
        Fri, 13 Aug 2021 11:28:47 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c18sm454677ots.81.2021.08.13.11.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 11:28:46 -0700 (PDT)
Received: (nullmailer pid 3814039 invoked by uid 1000);
        Fri, 13 Aug 2021 18:28:45 -0000
Date:   Fri, 13 Aug 2021 13:28:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sireesh Kodali <sireeshkodali@protonmail.com>
Cc:     mturquette@baylibre.com, robh+dt@kernel.org,
        phone-devel@vger.kernel.org, Vladimir Lypak <junak.pub@gmail.com>,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        Adam Skladowski <a_skl39@protonmail.com>,
        linux-clk@vger.kernel.org, agross@kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        sboyd@kernel.org
Subject: Re: [PATCH RESEND 1/2] dt-bindings: clock: add Qualcomm MSM8953 GCC
 driver bindings
Message-ID: <YRa53aqcX5I+8vji@robh.at.kernel.org>
References: <Q6uB3NRxqtD8Prsmliv8ZdsTXGeviv7lb2jQ743jr1E@cp4-web-036.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Q6uB3NRxqtD8Prsmliv8ZdsTXGeviv7lb2jQ743jr1E@cp4-web-036.plabs.ch>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 05 Aug 2021 09:06:42 +0000, Sireesh Kodali wrote:
> From: Vladimir Lypak <junak.pub@gmail.com>
> 
> Add bindings and compatible to document MSM8953 GCC (Global Clock
> Controller) driver.
> 
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> Signed-off-by: Adam Skladowski <a_skl39@protonmail.com>
> Signed-off-by: Sireesh Kodali <sireeshkodali@protonmail.com>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |   2 +
>  include/dt-bindings/clock/qcom,gcc-msm8953.h  | 234 ++++++++++++++++++
>  2 files changed, 236 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8953.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
