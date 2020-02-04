Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 199A91522E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 00:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727608AbgBDXPN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 18:15:13 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36572 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbgBDXPM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 18:15:12 -0500
Received: by mail-pl1-f194.google.com with SMTP id a6so43082plm.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 15:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eHL57O5Lzv9h0dmVqfW61X6PePuavBPvsAF59IMgl1g=;
        b=CQFG9weUlLK1Zu7Zfgkxnny8IqBI2BzJSepTO/sqAVKxSyjZ6+wdiMch925et+bAfO
         mU0oQhsCzTxAEosyBr2cX942wbPZY6xf80Tj/Q2fUY6yfDOnBEY49xmSYVJtmaPDC5bc
         KYombeK6wjGdm8lzmDgNjBJtcKx4oEUm63RlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eHL57O5Lzv9h0dmVqfW61X6PePuavBPvsAF59IMgl1g=;
        b=EePHPDqFWhBOqcT4CLLzdv2vsi6n+lTFABgvGYjAMt9ivMm/eHpP1scof7RCReTn7r
         bFsgGS54xTNSm8rYSmxzKJkWm/L69ktj51Axuy+9lFYVi7IGRGIeOKPit1lBLkEJgfmI
         6FqX8ZsfadlVUhxXl2pl+uCW40so87DGbOjfNBQ0mhYUzSDet6fcyK9WhYTYcJMmRj7e
         rY5n98O5cYTR/qxd/5lME2zHPOGwu0QLAaiWBupaI2xSh046rZoh/TDSh7akdWdbCoTW
         5qUbn8Btlbq5uyPRxkd/zt1x6gNz6ZgBFjb4+uH2p0aqAwWT6kb9fcMjOi7FP4PCLIl6
         4VjQ==
X-Gm-Message-State: APjAAAWf6YCfouLUkGyY1gFpZIMC/nijokVkj6ytkV+r75goFlK7YfSb
        m5G6g42L4vsHzC9lVaqTBNZnUg==
X-Google-Smtp-Source: APXvYqyFPGXQmmH7C4ggqmXijaSpcmMAXH+pQ3854xeghzQF/MlW6fcJmdLmu4uW+b8rKx1bNNBa2w==
X-Received: by 2002:a17:902:7790:: with SMTP id o16mr31145864pll.271.1580858111944;
        Tue, 04 Feb 2020 15:15:11 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id w26sm25319641pfj.119.2020.02.04.15.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 15:15:11 -0800 (PST)
Date:   Tue, 4 Feb 2020 15:15:09 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, agross@kernel.org, david.brown@linaro.org,
        sudeep.holla@arm.com, Lorenzo.Pieralisi@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bjorn.andersson@linaro.org, evgreen@chromium.org,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: sc7180: Add cpuidle low power
 states
Message-ID: <20200204231509.GB18972@google.com>
References: <1580736940-6985-1-git-send-email-mkshah@codeaurora.org>
 <1580736940-6985-7-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1580736940-6985-7-git-send-email-mkshah@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 03, 2020 at 07:05:39PM +0530, Maulik Shah wrote:
> Add device bindings for cpuidle states for cpu devices.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 78 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 8011c5f..0aa0ced 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -86,6 +86,9 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> +					   &LITTLE_CPU_SLEEP_1
> +					   &CLUSTER_SLEEP_0>;

These entries are deleted again by the next patch in this series ('arm64:
dts: qcom: sc7180: Convert to the hierarchical CPU topology layout').
What is the point in adding them in the first place?
