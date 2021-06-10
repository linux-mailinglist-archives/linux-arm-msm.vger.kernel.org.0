Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B3A3A25B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 09:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhFJHrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 03:47:17 -0400
Received: from webserver.carbg.com ([212.45.67.1]:44470 "EHLO
        webserver.carbg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhFJHrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 03:47:16 -0400
X-Greylist: delayed 618 seconds by postgrey-1.27 at vger.kernel.org; Thu, 10 Jun 2021 03:47:14 EDT
Received: from localhost (localhost [127.0.0.1])
        by webserver.carbg.com (Postfix) with ESMTP id 420B212800FF;
        Thu, 10 Jun 2021 10:34:56 +0300 (EEST)
Received: from webserver.carbg.com ([127.0.0.1])
        by localhost (webserver.carbg.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uwRJpuT8_BLJ; Thu, 10 Jun 2021 10:34:48 +0300 (EEST)
Received: by webserver.carbg.com (Postfix, from userid 107)
        id 7B67912800FC; Thu, 10 Jun 2021 10:34:47 +0300 (EEST)
X-Spam-ASN:  
Received: from MacBook-Pro.local (macbook [10.44.66.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: georgi@djakov.com)
        by webserver.carbg.com (Postfix) with ESMTPSA id 05CA412800FB;
        Thu, 10 Jun 2021 10:34:29 +0300 (EEST)
Authentication-Results: webserver.carbg.com; dmarc=none header.from=kernel.org
Subject: Re: [PATCH V1] arm64: dts: qcom: sc7180: bus votes for eMMC and SD
 card
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, sartgarg@codeaurora.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        sibis@codeaurora.org, okukatla@codeaurora.org, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
References: <1623309189-27943-1-git-send-email-sbhanu@codeaurora.org>
From:   Georgi Djakov <djakov@kernel.org>
Message-ID: <b1d108f1-75c1-87a7-a9de-3a004f56596e@kernel.org>
Date:   Thu, 10 Jun 2021 10:34:28 +0300
MIME-Version: 1.0
In-Reply-To: <1623309189-27943-1-git-send-email-sbhanu@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sajida,

Thank you for the patch!

On 10.06.21 10:13, Shaik Sajida Bhanu wrote:
> Updated bus votes for eMMC and Sd card.

The commit text should also give answer to the question "Why is this 
patch necessary?". Do we need a Fixes: tag? The subject could be 
improved too. Please check:
https://www.kernel.org/doc/Documentation/process/submitting-patches.rst

Thanks,
Georgi

> 
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> ---
>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 295844e..1fce39d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -726,15 +726,15 @@
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
> @@ -2685,15 +2685,15 @@
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

