Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E991BD169
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 02:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgD2AwW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 20:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726451AbgD2AwV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 20:52:21 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1498AC03C1AE
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 17:52:21 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id h12so1696116pjz.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 17:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rN6lzh1HO7SQ5a1mJWUzVv7pQ/WYiEXJe4nN1cTa5qQ=;
        b=MfYvGkg0E36KkDEUNVqNoMHi4kvTBkFhVPDMvs9JK86Ojx9aJWa7Pg/QX9KT4cZo8x
         vp+NJ3MbB39Q7sc2/bFpuOq6mR2ppSAAw8TIbfe52vt3vnOXuBJPzk+RsoyK+4jMO8Bh
         8BWgeEw0zmhh7uvFJxmfp8wa1ARMXdqAHBMWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rN6lzh1HO7SQ5a1mJWUzVv7pQ/WYiEXJe4nN1cTa5qQ=;
        b=ceqtTw9h51ehiFSG1j7MuvZeXPG/Sv4LYFS2YH6oSxSOx2ihS8JsdaSQnxyoz8Bckp
         LA2XoUJ5iThwU4tYmXj2tJnlRPOhaxmrp3HTJCeIBbzNJyZRKVjeJHR0ah2O8SDPZNWn
         wX4a32WrwB4iPEuixJ8FDxeRkgwGYInyJnxWYLJqh2WFTGnvnc1r6OQZZ0R5iE1dTVxE
         rOgmJsC8ERRBd2ZZHwI2lHoXZSnKqIm6QwOBwVwCqZ+AdpI9AIG2q0rZLkH0tG+cmPz3
         e9yzFfExdu3axPEZ8hF6ZrkIHh63JtAcGzBybA4IVG3Fo3APRigXeiHjQNXW82KeSQxF
         PXuQ==
X-Gm-Message-State: AGi0PuZUqFK8DJMI4+FQMSC/LLqWOiPp6tkP5M3mbY1rUQbnXRbVysdE
        k8sJIrlkED+5X6n2FRFQ+2hKPQ==
X-Google-Smtp-Source: APiQypJ3CMyOvb8iG4oSBSb6yTfenmSgIpnIcDpYDhZ0ot1VO0Sx06ThIhO9CBG26qDIlXxW/OVNJg==
X-Received: by 2002:a17:902:690b:: with SMTP id j11mr32585184plk.145.1588121540569;
        Tue, 28 Apr 2020 17:52:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id o1sm3114190pjs.35.2020.04.28.17.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 17:52:20 -0700 (PDT)
Date:   Tue, 28 Apr 2020 17:52:19 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 16/17] arm64: dts: sdm845: Add qspi opps and
 power-domains
Message-ID: <20200429005219.GQ4525@google.com>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-17-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588080785-6812-17-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 28, 2020 at 07:03:04PM +0530, Rajendra Nayak wrote:
> Add the power domain supporting performance state and the corresponding
> OPP tables for the qspi device on sdm845
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 67e3b90..1843123 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3017,6 +3017,30 @@
>  			status = "disabled";
>  		};
>  
> +		qspi_opp_table: qspi-opp-table {
> +			compatible = "operating-points-v2";
> +
> +			opp-19200000 {
> +				opp-hz = /bits/ 64 <19200000>;
> +				required-opps = <&rpmhpd_opp_min_svs>;
> +			};
> +
> +			opp-100000000 {
> +				opp-hz = /bits/ 64 <100000000>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +			};
> +
> +			opp-150000000 {
> +				opp-hz = /bits/ 64 <150000000>;
> +				required-opps = <&rpmhpd_opp_svs>;
> +			};
> +
> +			opp-300000000 {
> +				opp-hz = /bits/ 64 <300000000>;
> +				required-opps = <&rpmhpd_opp_nom>;
> +			};
> +		};

move OPP table inside the 'qspi' node (like 'rpmhpd_opp_table',
'gpu_opp_table' or 'gmu_opp_table').
