Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0241D31D461
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 05:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhBQEJT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 23:09:19 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:15336 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230508AbhBQEJT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 23:09:19 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613534938; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YysYH/GSLHY0oS3M61cKg31+GE3yMoJz/jVJSF6zO8g=;
 b=VrJfGHkUBnt1GlQuc1ePs2wfL7EpNVQx6v29lhHHA2JtIKaPS5GP62FxTz9/jXaMuxDs+IZI
 qWgtsvhfw7IIHf+SF85qwCI43IYzpzIjteSNtBC94LsOXcVlH2GJOimn74qlkFiOOKxUORDz
 lorjLULEnqZb79/2hRyXDSGlsG4=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 602c962a0b8eba4b5269e250 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 04:06:02
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 21338C43461; Wed, 17 Feb 2021 04:06:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 764A2C433C6;
        Wed, 17 Feb 2021 04:06:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 17 Feb 2021 09:36:01 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Fix epss_l3 unit address
In-Reply-To: <20210211193637.9737-1-georgi.djakov@linaro.org>
References: <20210211193637.9737-1-georgi.djakov@linaro.org>
Message-ID: <b944d97297425cb59ff310fd51569a61@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-12 01:06, Georgi Djakov wrote:
> The unit address of the epss_l3 node is incorrect and does not match
> the address of its "reg" property. Let's fix it.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Thanks for catching it :)

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 947e1accae3a..80fe1cfe8271 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3721,7 +3721,7 @@ apps_bcm_voter: bcm_voter {
>  			};
>  		};
> 
> -		epss_l3: interconnect@18591000 {
> +		epss_l3: interconnect@18590000 {
>  			compatible = "qcom,sm8250-epss-l3";
>  			reg = <0 0x18590000 0 0x1000>;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
