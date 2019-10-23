Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06657E19C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2019 14:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388917AbfJWMQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Oct 2019 08:16:39 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:51792 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730796AbfJWMQj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Oct 2019 08:16:39 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EFF6D60112; Wed, 23 Oct 2019 12:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571832998;
        bh=IuBmUElM00WvUbGKM5X/tRqNg/9nafBDP5xAYZmqdbs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=G3KKv5JB0RyFdGVhD863CarOsbVBbU/gBH4y/WHqBgx6C8t2l8ikRImGMe6iI38mk
         Qzaa2aysKBDb7axTL5HKnzo7reO9dtglGwTPl4sANW/VB7DR7HsekRaBvTb3mWHGCv
         pThCRi3hl+YeOD6/ihpJOJ+B0Y2Vb9gLfftuP4oE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id C9E2C6083E;
        Wed, 23 Oct 2019 12:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571832996;
        bh=IuBmUElM00WvUbGKM5X/tRqNg/9nafBDP5xAYZmqdbs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hEB1c2Y4RBvXQ98RHnaVzSXE/MQXh3M3lmd3m5eSkqxM7uZ22JcLJ9FQR3faod26s
         zgIIoi2rY8yK80JFFUODer7Z5ZWho36Mq3DBUk6SvnBRoxWxCLeDKFiWERcm5SONz1
         6NYq7bIO0bdiB5+R5me2oJ7m4gYMRpOk5eHHn1EA=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 23 Oct 2019 17:46:35 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v3 05/11] arm64: dts: qcom: sc7180: Add cmd_db reserved
 area
In-Reply-To: <20191023090219.15603-6-rnayak@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-6-rnayak@codeaurora.org>
Message-ID: <5bb4acef7f11af9e9c4016743d668f57@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-23 14:32, Rajendra Nayak wrote:
> From: Maulik Shah <mkshah@codeaurora.org>
> 
> Command_db provides mapping for resource key and address managed
> by remote processor. Add cmd_db reserved memory area.
> 
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index f17684148595..dfa49ef2bce0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -32,6 +32,18 @@
>  		};
>  	};
> 
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		cmd_db: reserved-memory@80820000 {

aop_cmd_db_mem: memory@80820000 {
please use ^^ instead

> +			reg = <0x0 0x80820000 0x0 0x20000>;
> +			compatible = "qcom,cmd-db";
> +			no-map;
> +		};
> +	};
> +
>  	cpus {
>  		#address-cells = <2>;
>  		#size-cells = <0>;

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
