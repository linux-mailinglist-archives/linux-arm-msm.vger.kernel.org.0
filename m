Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77A98373E05
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 16:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233338AbhEEO6y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 10:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbhEEO6x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 10:58:53 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 459DFC061761
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 07:57:57 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id p17so945095pjz.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 07:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z6+s7ClFTSCmHRUS+zDGYYUNz29NacIOGaA914mSXZQ=;
        b=AmXStwt9VYu+MKeiLgQsueoc1SEsbma2hCjuXwUqMTABYaxCm4vZ9u/2+4QAa4tyZZ
         Yfg9XCTMIDnh1zqY4nCVJGhQSu+6oYeqSPSmpU6xkIi12mRM24MWw/rnHkUzj4zAdMQX
         dfIKyrkE5Kq+bQaLpMsdnnKBKCLzqzBKaXSPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z6+s7ClFTSCmHRUS+zDGYYUNz29NacIOGaA914mSXZQ=;
        b=qR153DEUBAfhStYkwKqXx2CWkYJRz6qMf0jIK9lNaHVYF8CpXnFO8cj5FsJTLNkPSJ
         NM/bf8GoeskcfPVhb7GvwUISOi7sa8oBQATd7rlC9jluWbmlP3h+NNsUIh13hkn73mX2
         LV2iOUCATf922jBQth3kgzysoY1W+X6MvvfGGATlYECdT1LGibFKBEx0cTfVy+648sIM
         LKa83/Y0qKrwHitIq+nvn94yegx4JjZ3/uyASqSmQD4dFJLKNbfthAsc/CDmnEHNQzFM
         BMMFCYQvdAKMU3r7ks1sSEvr3EkAiS0EcXaqzqg0dgaBNrX/CpARkGvJZUkxgZiRYzyv
         O9Fw==
X-Gm-Message-State: AOAM531RJjA5vI18nI5zCjlRnfQzoQwMiNZo8i5Q2C35LVXzrRuyFg3E
        DGomdEJhKRUYPRucnpwEQBIHJw==
X-Google-Smtp-Source: ABdhPJwwMu0D3UCRccrXZoNzxuPBlkKi5Na3NwoqNTUQWqMi/Qugd3QBMlaOt8xeWv/3VjMP6mGkpg==
X-Received: by 2002:a17:902:dccc:b029:ed:32ed:e7d0 with SMTP id t12-20020a170902dcccb02900ed32ede7d0mr32034390pll.79.1620226676754;
        Wed, 05 May 2021 07:57:56 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:8770:f856:b2ff:e5e4])
        by smtp.gmail.com with UTF8SMTPSA id u12sm15203777pfh.122.2021.05.05.07.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 07:57:56 -0700 (PDT)
Date:   Wed, 5 May 2021 07:57:55 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sc7280: Include PMIC DT files
 for sc7280-idp
Message-ID: <YJKyc09bL/Z6YcK1@google.com>
References: <1620197726-23802-1-git-send-email-skakit@codeaurora.org>
 <1620197726-23802-9-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1620197726-23802-9-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 05, 2021 at 12:25:26PM +0530, satya priya wrote:
> The sc7280-idp has four PMICs, include their .dtsi files.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 02a14fc..704fb9a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -12,6 +12,10 @@
>  #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
>  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>  #include "sc7280.dtsi"
> +#include "pm7325.dtsi"
> +#include "pmr735a.dtsi"
> +#include "pm8350c.dtsi"
> +#include "pmk8350.dtsi"

Patch '[7/8] arm64: dts: qcom: sc7280: Add channel nodes for sc7280-idp'
of this series makes use of the label 'pmk8350_vadc', which doesn't exist
at that point.

A series should be organized in a way that applying only a
subset of the series (in order, starting with patch 1) doesn't
cause any build or runtime issues. To achieve this patch [7/8]
and [8/8] of this series need to be swapped.
