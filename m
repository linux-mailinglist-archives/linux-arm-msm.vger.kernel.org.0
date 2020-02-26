Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA9217092D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 21:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbgBZUFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 15:05:39 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37197 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbgBZUFj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 15:05:39 -0500
Received: by mail-ot1-f68.google.com with SMTP id b3so667829otp.4;
        Wed, 26 Feb 2020 12:05:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rfooh7DJ/puEMePfWhIF847RRO14nrehO8VpW6u2dqc=;
        b=saiVxvDFo8hVZnGsp9NWUNR5ptFExf6k5XWMDC4wQwUaijB/pfKbejBnCF+/PzSC4j
         k2PYmbjwpE2Qe4YRet1jM/CGt6vVLCBhAnL8CyLgoPm51eS8zot+ondip5Tfa99Go17T
         8EA7Dm9JMq3BgUgGbC2qDqjfeN0FTv2XvlJhN6IOyp+FqoH8xT67uYhrc8cpHArMLKaZ
         otkXPK4e4pxh2AGNIpB2qycvnKs51kQZPG8lM6Ml+Wd2la4PNoRsO87jJCKt3R05AWCm
         onzuY6eeIWhGzyJrsg9UhvBpKRFNwWio9T9fM1D8us7rlHwsKx2itdLTl2LvYstTbIou
         cwTw==
X-Gm-Message-State: APjAAAUIovUJq9nW7dsOab25PUN8SMZLdD0Y7IGHBivT1h3Im2sJZnlv
        xMwLFX2SUJ8symUhAuLwog==
X-Google-Smtp-Source: APXvYqwoExQts8kyL6ACiX7nqlcfseb2jryno1PV9+/zcCxooXzFpJaL6Shdc1qByEDsFjYB/p3G5A==
X-Received: by 2002:a05:6830:1e37:: with SMTP id t23mr439632otr.16.1582747538082;
        Wed, 26 Feb 2020 12:05:38 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n2sm1133092oia.58.2020.02.26.12.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 12:05:37 -0800 (PST)
Received: (nullmailer pid 31917 invoked by uid 1000);
        Wed, 26 Feb 2020 20:05:35 -0000
Date:   Wed, 26 Feb 2020 14:05:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: Introduce soc sleep stats bindings
 for Qualcomm SoCs
Message-ID: <20200226200535.GA31824@bogus>
References: <1582274986-17490-1-git-send-email-mkshah@codeaurora.org>
 <1582274986-17490-2-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582274986-17490-2-git-send-email-mkshah@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 21 Feb 2020 14:19:43 +0530, Maulik Shah wrote:
> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> 
> Add device binding documentation for Qualcomm Technology Inc's (QTI)
> SoC sleep stats driver. The driver is used for displaying SoC sleep
> statistic maintained by Always On Processor or Resource Power Manager.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  .../bindings/soc/qcom/soc-sleep-stats.yaml         | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
