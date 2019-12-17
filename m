Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7BA122523
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 08:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfLQHCV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 02:02:21 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:57913 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726609AbfLQHCV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 02:02:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576566141; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=qvY0c/kPEqYat/tt5aFw4TSO/CSHVG9q3jysib3XFuY=; b=O1kgsewkeIvpXDbtJ3+11gEfgBNNWK3TFnkawq30kCcJh/O1JSqu+ShX6/IbNwtr27ESjg8A
 3qPdhSyDQsRb+C5mDSgnzcMfZzUDEw4IcgcsFMM0xjb9GI5F0OF362KdNCkUJ+M5e1ltEtdE
 2Ve8qxB3X5rjeBTMP4hsbRbm1Js=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df87d7c.7f9b722c7998-smtp-out-n02;
 Tue, 17 Dec 2019 07:02:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E6847C4479C; Tue, 17 Dec 2019 07:02:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.117.127] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D5A8EC433A2;
        Tue, 17 Dec 2019 07:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D5A8EC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Rename gic-its node to
 msi-controller
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20191216222021.1.I684f124a05a1c3f0b113c8d06d5f9da5d69b801e@changeid>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <9a604094-ae53-503f-0286-4aae40ba8b06@codeaurora.org>
Date:   Tue, 17 Dec 2019 12:32:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191216222021.1.I684f124a05a1c3f0b113c8d06d5f9da5d69b801e@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/17/2019 11:50 AM, Douglas Anderson wrote:
> This is just like commit ac00546a6780 ("arm64: dts: qcom: sc7180:
> Rename gic-its node to msi-controller") but for sdm845.  This fixes
> all arm64/qcom device trees that I could find.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

> 
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 407d26e92fcc..5d3b470f1be5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3203,7 +3203,7 @@ intc: interrupt-controller@17a00000 {
>   			      <0 0x17a60000 0 0x100000>;    /* GICR * 8 */
>   			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>   
> -			gic-its@17a40000 {
> +			msi-controller@17a40000 {
>   				compatible = "arm,gic-v3-its";
>   				msi-controller;
>   				#msi-cells = <1>;
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
