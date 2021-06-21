Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30443AE565
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 10:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhFUI7M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 04:59:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:40202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229618AbhFUI7L (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 04:59:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C83260FE9;
        Mon, 21 Jun 2021 08:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624265817;
        bh=YExwmU+u6BVwXlkye/63k32gjtySTQvDE+hPHrJjKNk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=pboonfM18U3V0GS3mu/bTPSqa4S2oqxmJuOXhFBkxFvyoxGc614j0BJZYZvuhMyYz
         m8sjfPLk5Zs9uUnNbfeoIDciiPx9vCwbWsOLkDg24IfIh5EzGWgTXIEjIumj4/cmjN
         Eet87/OikJWM/eKxSaQ5JJSxYvYfJb04ZV0W92U1oAoQK9DSl7URNcyfAeOXnBqF/m
         minlx75YLi8mds3zKlFWilVYdNF7D2uch2TeFECavlNO8QrnYes9fYo8vg3+7hn9sc
         NWwXHtj3Ol54MG+S0TvGIns9mugI6or1MWqS8X82lqy2amm4oupRkXyhNlv5/AoUIF
         6gO6xNOr/B14w==
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7180: bus votes for eMMC and SD
 card
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        bjorn.andersson@linaro.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, sartgarg@codeaurora.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        sibis@codeaurora.org, okukatla@codeaurora.org, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org
References: <1623835344-29607-1-git-send-email-sbhanu@codeaurora.org>
From:   Georgi Djakov <djakov@kernel.org>
Message-ID: <3229daff-9a32-bced-7e02-c557f7f8b572@kernel.org>
Date:   Mon, 21 Jun 2021 11:56:48 +0300
MIME-Version: 1.0
In-Reply-To: <1623835344-29607-1-git-send-email-sbhanu@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16.06.21 12:22, Shaik Sajida Bhanu wrote:
> Update peak bandwidth and average bandwidth vote values for eMMC and
> SDCard. This patch calculates the new votes as per the comments from
> https://lore.kernel.org/patchwork/patch/1399453/#1619566.
> 
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>

Reviewed-by: Georgi Djakov <djakov@kernel.org>

> ---
> 
> Changes since V1:
> 	- Updated the commit message with proper information.
> ---
>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index fb1d9ad..a5d58eb 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -727,15 +727,15 @@
>   				opp-100000000 {
>   					opp-hz = /bits/ 64 <100000000>;
>   					required-opps = <&rpmhpd_opp_low_svs>;
> -					opp-peak-kBps = <100000 100000>;
> -					opp-avg-kBps = <100000 50000>;
> +					opp-peak-kBps = <1800000 600000>;
> +					opp-avg-kBps = <100000 0>;
>   				};
>   
>   				opp-384000000 {
>   					opp-hz = /bits/ 64 <384000000>;
> -					required-opps = <&rpmhpd_opp_svs_l1>;
> -					opp-peak-kBps = <600000 900000>;
> -					opp-avg-kBps = <261438 300000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +					opp-peak-kBps = <5400000 1600000>;
> +					opp-avg-kBps = <390000 0>;
>   				};
>   			};
>   		};
> @@ -2585,15 +2585,15 @@
>   				opp-100000000 {
>   					opp-hz = /bits/ 64 <100000000>;
>   					required-opps = <&rpmhpd_opp_low_svs>;
> -					opp-peak-kBps = <160000 100000>;
> -					opp-avg-kBps = <80000 50000>;
> +					opp-peak-kBps = <1800000 600000>;
> +					opp-avg-kBps = <100000 0>;
>   				};
>   
>   				opp-202000000 {
>   					opp-hz = /bits/ 64 <202000000>;
> -					required-opps = <&rpmhpd_opp_svs_l1>;
> -					opp-peak-kBps = <200000	120000>;
> -					opp-avg-kBps = <100000 60000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +					opp-peak-kBps = <5400000 1600000>;
> +					opp-avg-kBps = <200000 0>;
>   				};
>   			};
>   		};
> 

