Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B35A4CCA29
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Mar 2022 00:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235900AbiCCXlN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 18:41:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbiCCXlN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 18:41:13 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C331375B3
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 15:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1646350826; x=1677886826;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WWMIm6HjjY0kxnD7nyPXZtP5nGZ/E5M1aZ4oLPWnKe0=;
  b=Z5RvoRntTAfwK7hmGxc1lgg51u9HvfkcePEaUVl22OmDMCn4xBbQsaMH
   VNvLmAQ5YV/zW3PUcIIBmj5LTLo32E7zlSniY8wk6h2j4nnzQVs5/b0PL
   6VMlv7tBojTqqvWFlcGTfaxlIupzkoNNJhbSo9ENOon48h+GXEsHoBcfe
   Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Mar 2022 15:40:26 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 15:40:26 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 3 Mar 2022 15:40:25 -0800
Received: from [10.110.60.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 3 Mar 2022
 15:40:24 -0800
Message-ID: <db511ad8-469e-646c-eca2-bcb366e30ccd@quicinc.com>
Date:   Thu, 3 Mar 2022 15:40:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 00/12] Add writeback block support for DPU
Content-Language: en-US
To:     Stephen Boyd <swboyd@chromium.org>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <nganji@codeaurora.org>, <aravindh@codeaurora.org>,
        <daniel@ffwll.ch>, <dmitry.baryshkov@linaro.org>,
        <markyacoub@chromium.org>, <quic_jesszhan@quicinc.com>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <CAE-0n53-9+t4ruY9hykzZmP4LXZzvQLjRWRtmY=Ksm-BVaT78w@mail.gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n53-9+t4ruY9hykzZmP4LXZzvQLjRWRtmY=Ksm-BVaT78w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen

There is some discussion going on about the base dependency of the change:

https://patchwork.kernel.org/project/dri-devel/patch/20220202085429.22261-6-suraj.kandpal@intel.com/

I will resend this with comments addressed once the dependency is sorted 
out among intel, QC and laurent.

Thanks

Abhinav
On 3/3/2022 2:46 PM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2022-02-04 13:17:13)
>> This series adds support for writeback block on DPU. Writeback
>> block is extremely useful to validate boards having no physical displays
>> in addition to many other use-cases where we want to get the output
>> of the display pipeline to examine whether issue is with the display
>> pipeline or with the panel.
> 
> Is this series going to be resent?
