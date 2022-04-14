Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5D79501C83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 22:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346211AbiDNUUr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 16:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346215AbiDNUUm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 16:20:42 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96304EB0A0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 13:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649967497; x=1681503497;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LYiczBUvca7nP1JdJGf6chvwICO7T39arORF4srp+U0=;
  b=xvqferxQi3FDokC6Dx8Q54n+MPvmhvL2ggL1OitE5lBw7xduRUCApgo8
   7XamSusHXNcfOytBFuVCgdUgXSbHqdHVSHBn++KEOsm5BUpXxsL7xqo7D
   sXWlysQXpR9V6BwYHvVo57lbLKuX+4Wh1kZsdaUahsoAFwDK5Nw20WXid
   s=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 14 Apr 2022 13:18:16 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 13:18:15 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 13:17:55 -0700
Received: from [10.111.169.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Apr
 2022 13:17:52 -0700
Message-ID: <a8605125-6fad-2600-ea4f-49e0b2760a5e@quicinc.com>
Date:   Thu, 14 Apr 2022 13:17:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector with
 drm_bridge_connector
Content-Language: en-US
To:     "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>,
        "swboyd@chromium.org" <swboyd@chromium.org>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
CC:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
References: <552d9809-0499-23b5-e437-a77c893b96c2@quicinc.com>
 <64a5ae1a-df65-b0a5-5d0d-cfb1d4da3bf7@quicinc.com>
 <MW4PR02MB7186CC4C92091EF914082C08E1119@MW4PR02MB7186.namprd02.prod.outlook.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <MW4PR02MB7186CC4C92091EF914082C08E1119@MW4PR02MB7186.namprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/16/2022 9:45 AM, Sankeerth Billakanti (QUIC) wrote:
>> Subject: Re: [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector with
>> drm_bridge_connector
>> Date: Wed, 23 Feb 2022 16:40:56 -0800
>> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> To: Stephen Boyd <swboyd@chromium.org>, Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org>
>> CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, Bjorn Andersson
>> <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
>> <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter
>> <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-
>> devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
>>
>>
>> On 2/23/2022 1:33 PM, Stephen Boyd wrote:
>>> Quoting Kuogee Hsieh (2022-02-23 10:27:26)
>>>> On 2/23/2022 10:22 AM, Dmitry Baryshkov wrote:
>>>>> On 23/02/2022 20:21, Kuogee Hsieh wrote:
>>>>>
>>>>> In the panel device node.
>>>>>
>>>>> Can you please share it too?
>>>>
>>>> &soc {
>>>>            edp_power_supply: edp_power {
>>>>                    compatible = "regulator-fixed";
>>>>                    regulator-name = "edp_backlight_power";
>>>>
>>>>                    regulator-always-on;
>>>>                    regulator-boot-on;
>>>>            };
>>>>
>>>>            edp_backlight: edp_backlight {
>>>>                    compatible = "pwm-backlight";
>>>>
>>>>                    pwms = <&pm8350c_pwm 3 65535>;
>>>>                    power-supply = <&edp_power_supply>;
>>>>                    enable-gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
>>>>
>>>>                    pinctrl-names = "default";
>>>>                    pinctrl-0 = <&backlight_pwm_default>;
>>>>            };
>>>>
>>>>            edp_panel: edp_panel {
>>>>                    compatible = "sharp_lq140m1jw46";
>>> Is that supposed to be sharp,lq140m1jw46 with a comma instead of an
>>> underscore?
>>
>> Stephen,
>>
>> This is our internal branch which does not have patches up to date yet.
>>
>> I will cherry-pick newer edp related patches which are under review now to
>> re test it.
> 
> Tested-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Detect returned eDP not connected because the panel power was not on and mode_valid was failing because the DP mode_valid is different from eDP
