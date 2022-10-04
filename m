Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9498E5F47BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 18:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiJDQhd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 12:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiJDQhb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 12:37:31 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3755F209;
        Tue,  4 Oct 2022 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1664901451; x=1696437451;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=4xKFHhMa5zfB4wwpijtIZoLRV7h1tsBYmsv6+FgEBBc=;
  b=Fb/rbB4Ow/dwwqDqDnDPz+8p+I3x1qN2RVJMKHgv/pdi7MI5RJ/5L5ME
   tRklxQZ6bx0doF7PSfDGEEQZfCOPYgMtz1BylCxbDFQm/XcJounr73rQL
   vahxQzLPm2TTR0gloqp7HKhHRsUtJqXZ6YmJJpApqOtPnca1C39o2MAmP
   o=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Oct 2022 09:37:30 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 09:37:30 -0700
Received: from [10.110.81.239] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 4 Oct 2022
 09:37:29 -0700
Message-ID: <943ec4f3-e6a4-7614-fb6f-1adce1487857@quicinc.com>
Date:   Tue, 4 Oct 2022 09:37:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Qualcomm DT bindings and DTS cleanups - tracking community wide
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Vinod Koul <vinod.koul@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Caleb Connolly <kc@postmarketos.org>
References: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org>
 <faa4e821-00e0-4ee0-0c62-b5eb6f75abf7@linaro.org>
From:   Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <faa4e821-00e0-4ee0-0c62-b5eb6f75abf7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/4/2022 7:50 AM, Krzysztof Kozlowski wrote:
> On 22/09/2022 16:32, Krzysztof Kozlowski wrote:
>> Hi everyone,
>>
>> Quite a lot of people are working on Qualcomm DT bindings conversion
>> (TXT->YAML) and fixups to Qualcomm DTS. We track a bit of this effort
>> internally in Linaro, but that has many shortcomings and we would like
>> to track it rather community-wide with the support and contributions
>> from the community.
>>
>> What to track:
>> 1. Which bindings to convert to YAML,
>> 2. Missing compatibles (either entirely or because of missing conversion),
>> 3. `dt_binding_check` warnings (usually connected with 1-2),
>> 4. `dtbs_check` warnings.
>>
>> Rob's bot gives us daily output for 1-4, but how can we track current
>> efforts to avoid duplication of work? Also it would allow people to find
>> tasks for them to get contributions to Linux kernel :). Is anyone in
>> community interested in tracking it together, in a public way?
>>
>> If so, where?
>> A. elinux.org (needs some formatting when pasting the output from tools)
>> B. gitlab pages/wiki (maybe scripts could parse tools and create the page?)
>> C. gitlab dedicated repo - some text file
>> D. Linux kernel TODO file (might be difficult to keep updated)
>> E. kernel.org wiki (requires LF accounts, AFAIK, a bit pain to edit; I
>> have it for Exynos but I don't find it usable -
>> https://exynos.wiki.kernel.org/todo_tasks)
> 
> 
> Hi All,
> 
> Any thoughts on this? So far I did not receive any responses, so
> probably this could mean that there is little interest in this?

My preference for tracking is gitlab. B or C. Everyone will have login 
and understands the workflow.

---Trilok Soni
