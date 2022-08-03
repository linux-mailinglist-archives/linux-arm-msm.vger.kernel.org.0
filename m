Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA805893F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 23:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236764AbiHCVPf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Aug 2022 17:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236629AbiHCVPe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Aug 2022 17:15:34 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A266438;
        Wed,  3 Aug 2022 14:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659561332; x=1691097332;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0w88LZuPDXSZwsBSm1gnwJoM1Sx1Hf9Wz1DWZUbtL9s=;
  b=lFKbJN8GG1F27J9xJMb/sQ6Bbm+kbYMlLDI7PzezCzmHOUeLlOd7cifZ
   xX48seR1ZLJfraHmNmoI1jqIiGcoJv9CNIgRb7jUKQ+xncYnKpBx3xLGT
   zpg0gQoXxmncAiiIarVF8ljw6dFeR4nHP6qda0YY1ngMjqaThCTjMSgxB
   c=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Aug 2022 14:15:31 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 14:15:31 -0700
Received: from [10.134.65.5] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 3 Aug 2022
 14:15:30 -0700
Message-ID: <0f9afb39-83a9-96ec-2ee0-f511d4fa3403@quicinc.com>
Date:   Wed, 3 Aug 2022 14:15:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 03/11] arm64: gunyah: Add Gunyah hypercalls ABI
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>
CC:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-4-quic_eberman@quicinc.com>
 <e1a93490-7deb-8221-f3f8-83546946c61a@linaro.org>
From:   Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <e1a93490-7deb-8221-f3f8-83546946c61a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On 8/2/2022 6:34 AM, Dmitry Baryshkov wrote:
> On 02/08/2022 00:12, Elliot Berman wrote:
>> Add initial support to perform Gunyah hypercalls. The arm64 ABI for
>> Gunyah hypercalls generally follows the SMC Calling Convention.
> 
> Seeing a c&p (or c&rework) from arm-smccc.h, could you please describe:
> 
> 1) Why can't you use the existing arm_smccc_1_1_hvc()? I checked, you 
> don't seem to be getting more than 4 values back.
> 

The Gunyah APIs can return up to 8 values. As you observed though, these 
initial patches are only using the first 4 values back. I'd like to use 
the larger v1.2 so I don't need to update later.

> 2) If #1 is not possible, why can't you add necessary glue code to the 
> arm-smccc.h (as your code to support nargs/multiple return values is 
> generic enough) and use corresponding macro in asm/gunyah.h ?
> 

I think the code here may be considered Gunyah-specific as I am limiting 
to 8 arguments and return values. If I add to arm-smccc.h, I would need 
to expand out to x17. Does it make sense to add another SMCCC 1.2 
interface to arm-smccc.h?
