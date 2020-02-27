Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 116511724B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 18:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgB0RMa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 12:12:30 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35031 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728413AbgB0RM3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 12:12:29 -0500
Received: by mail-pl1-f196.google.com with SMTP id g6so52922plt.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 09:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LOyT5HvsVh4qMzW2jHlKrfdY1wfzL0iwi9fyqr1yxSg=;
        b=PjgAbV5itjXELWeRURFWOnDxWWgcVNwTRbKN2F+s+aCnI9XkbVuKaH4FNVfqdZu4G5
         yaJvoev4JVjgNE6vi+yAEwMkJYjpq08qN3rOQ2jp1J56AjF5IG+vP5TnBmhH4OwFiWh7
         qq+AMuXQdOVTlquHBCsVZzjJP9BHQdHP1sa1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LOyT5HvsVh4qMzW2jHlKrfdY1wfzL0iwi9fyqr1yxSg=;
        b=NmIcHySLgVUtA0v3Zu+epi28eFAWNqB89XSMva4C2iq+xUpCtHpryuj8NDzb/zbsXo
         fLf90rqHBSHhI1tkfmqDc1jYGnmNefAL+V81F1/zz590achwRfXI0qX1/rARNmxZ8B5A
         DoSrD9PF1Q55TUB5SmQkBZ1ltSWg14a5pleLV60HyDIyzMk7rulMrDaxCul+apC4O4WA
         jcz8/wqXvvOeFoy3j2Kvqma3qUaJOZsFX+btTMtvLkSQuvnSsFTYtynllvoNd4ZrnSfu
         IGy20RDc4pMa4gTv24z8q5xW0l0d1rB+Ud/MOK2l1SL5bZVIr9cSw2vRGPSmckBnoMcQ
         C2FA==
X-Gm-Message-State: APjAAAWt2GYnDJMI0DyJa8+vOHZNAi8gSe0FLozHq2LuIFT/vqTMsxwR
        UVlpcqfegKJX6DlVHQpiM+w7Zg==
X-Google-Smtp-Source: APXvYqx6fZfhqq+ecXx0OzqoQNR179JoYOMacTaNfi38ToDP70lt0Yh233FkLgWk5lXrSVbcwJbSvA==
X-Received: by 2002:a17:902:8f94:: with SMTP id z20mr741978plo.62.1582823549030;
        Thu, 27 Feb 2020 09:12:29 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id k1sm5789477pgt.70.2020.02.27.09.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 09:12:28 -0800 (PST)
Date:   Thu, 27 Feb 2020 09:12:26 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Odelu Kukatla <okukatla@codeaurora.org>
Cc:     georgi.djakov@linaro.org, daidavid1@codeaurora.org,
        bjorn.andersson@linaro.org, evgreen@google.com,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        ilina@codeaurora.org, seansw@qti.qualcomm.com, elder@linaro.org,
        linux-pm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org,
        Amit Kucheria <amit.kucheria@verdurent.com>
Subject: Re: [V4, 3/3] arm64: dts: sc7180: Add interconnect provider DT nodes
Message-ID: <20200227171226.GJ24720@google.com>
References: <1582646384-1458-1-git-send-email-okukatla@codeaurora.org>
 <1582646384-1458-4-git-send-email-okukatla@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1582646384-1458-4-git-send-email-okukatla@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 25, 2020 at 09:29:44PM +0530, Odelu Kukatla wrote:
> Add the DT nodes for the network-on-chip interconnect buses found
> on sc7180-based platforms.
> 
> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 95 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index cc5a94f..3e28f34 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi

v2 had:

+#include <dt-bindings/interconnect/qcom,sc7180.h>

I think we still want that, otherwise some patch that adds an
interconnect configuration for SC7180 needs to add it (see also
https://patchwork.kernel.org/patch/11386485/#23187545)
