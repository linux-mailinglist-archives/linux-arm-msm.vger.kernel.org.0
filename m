Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCBA8575D1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jul 2022 10:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbiGOINO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jul 2022 04:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiGOINN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jul 2022 04:13:13 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1B17E833
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 01:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657872793; x=1689408793;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=h8v1eplkdl8MwBTorFNjxJf5E1u3k7xxjFL1qIDYDss=;
  b=Lk59Z3/ueWALt7s62w+ipJJmxxYX7Up4nyMD95LOmjJND1EAVgEljdkX
   u89T4kxhuwXfuTWEI28lr0B34ciUMG2UDXzbPjXzrhZ/w/DCz9CG6baOh
   d+dpYMeQ8Wsij/I+u00lBnON1Tk8lagwIM0wPX1P6OmKKqA3adEZPaPB8
   Y=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 15 Jul 2022 01:13:12 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 01:13:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Jul 2022 01:13:11 -0700
Received: from [10.50.55.40] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 15 Jul
 2022 01:13:08 -0700
Message-ID: <e3a50096-8790-274f-0b50-343ef339dd5f@quicinc.com>
Date:   Fri, 15 Jul 2022 13:43:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: fix apps_smmu irq
Content-Language: en-US
To:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20220712140009.20765-1-quic_ppareek@quicinc.com>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20220712140009.20765-1-quic_ppareek@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/12/2022 7:30 PM, Parikshit Pareek wrote:
> Wrong values have been introduced for interrupts property. Fix those
> ones, and correct the mapping of context banks to irq number.
>
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 7945cbb57bb4..1276a833251e 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -1580,7 +1580,6 @@
>   				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
> @@ -1591,6 +1590,7 @@
>   				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>

Thanks,
Sai
