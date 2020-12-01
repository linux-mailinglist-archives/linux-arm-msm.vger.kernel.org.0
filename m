Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19AD52C9697
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 05:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbgLAEpe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 23:45:34 -0500
Received: from m42-5.mailgun.net ([69.72.42.5]:63318 "EHLO m42-5.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728229AbgLAEpd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 23:45:33 -0500
X-Greylist: delayed 352 seconds by postgrey-1.27 at vger.kernel.org; Mon, 30 Nov 2020 23:45:33 EST
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606797908; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TLtwrpKiu92S9nqp5k7/JViYA+Gv4RHwKqws+WomKeI=;
 b=PxkT4mXcVMpOMU97bXW22hVIPAqxhUeqerZwaCzJ9Wx+uIeNvVfY1/mrfLPneuYbIF9S+B/8
 BlVqJR+/9370SAJCuRRulb/CBPGtPwm9DXplDwztkRf/SGsHNFReVtAEjqSMV1A3qLAGR+XS
 ELG12ITUvrYilO742ZGKB/1NomM=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fc5c8d51f6054cb8d7d1512 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Dec 2020 04:38:45
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 53D9FC43462; Tue,  1 Dec 2020 04:38:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C3EBC433ED;
        Tue,  1 Dec 2020 04:38:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Dec 2020 10:08:43 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8250: Add support for LLCC
 block
In-Reply-To: <20201130093924.45057-3-manivannan.sadhasivam@linaro.org>
References: <20201130093924.45057-1-manivannan.sadhasivam@linaro.org>
 <20201130093924.45057-3-manivannan.sadhasivam@linaro.org>
Message-ID: <ffd62c419433562f1f61ddf0c4e145b3@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-30 15:09, Manivannan Sadhasivam wrote:
> Add support for Last Level Cache Controller (LLCC) in SM8250 SoC.
> This LLCC is used to provide common cache memory pool for the cores in
> the SM8250 SoC thereby minimizing the percore caches.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 65acd1f381eb..118b6bb29ebc 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -1758,6 +1758,12 @@ usb_1_dwc3: dwc3@a600000 {
>  			};
>  		};
> 
> +		system-cache-controller@9200000 {
> +			compatible = "qcom,sm8250-llcc";
> +			reg = <0 0x09200000 0 0x1d0000>, <0 0x09600000 0 0x50000>;
> +			reg-names = "llcc_base", "llcc_broadcast_base";
> +		};
> +
>  		usb_2: usb@a8f8800 {
>  			compatible = "qcom,sm8250-dwc3", "qcom,dwc3";
>  			reg = <0 0x0a8f8800 0 0x400>;

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
