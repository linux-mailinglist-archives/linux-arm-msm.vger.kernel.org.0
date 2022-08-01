Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25933587367
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Aug 2022 23:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbiHAVcA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Aug 2022 17:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233212AbiHAVb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Aug 2022 17:31:58 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1054F13F13;
        Mon,  1 Aug 2022 14:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659389518; x=1690925518;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=R5heWOrA0L7jVKQ4xtIbAlwPo9Q61Q40Wz0JXNi/NHs=;
  b=TToqGQ94h/YZ4LHZooyR0dCnZFTF9uDn0lFHNOwOBajX9dUvFa/LeKla
   oSb917VZf9yQWM8A4EqKN9dn4m6HMisV21rH7iqs56dZJ35C4hGeYksC8
   zWRWL9epFRst0tOshHc5iDodz1TIxX8d2aJXfG0uAV0cyUua6Ow7toHXA
   E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Aug 2022 14:31:57 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 14:31:57 -0700
Received: from [10.110.127.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 1 Aug 2022
 14:31:55 -0700
Message-ID: <81167190-d705-f19a-fb93-ee99a1bc7a92@quicinc.com>
Date:   Mon, 1 Aug 2022 14:31:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 00/11] Drivers for gunyah hypervisor
Content-Language: en-US
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Srivatsa Vaddagiri" <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Marc Zyngier" <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        DTML <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <CAOCk7NoZAg234iV0L0fvon+16vEP4k4on72rtO-8bkeHL+yWqw@mail.gmail.com>
From:   Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <CAOCk7NoZAg234iV0L0fvon+16vEP4k4on72rtO-8bkeHL+yWqw@mail.gmail.com>
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

Hi Jeffrey,

On 8/1/2022 2:27 PM, Jeffrey Hugo wrote:
> On Mon, Aug 1, 2022 at 3:16 PM Elliot Berman <quic_eberman@quicinc.com> wrote:
>>
>> Gunyah is a Type-1 hypervisor independent of any
>> high-level OS kernel, and runs in a higher CPU privilege level. It does
>> not depend on any lower-privileged OS kernel/code for its core
>> functionality. This increases its security and can support a much smaller
>> trusted computing base than a Type-2 hypervisor.
>>
>> Gunyah is an open source hypervisor. The source repo is available at
>> https://github.com/quic/gunyah-hypervisor.
> 
> Nowhere in this series do I see a change log, yet this is marked as
> v2.  How is anyone supposed to identify what is the difference between
> v1 and v2?
I dropped the message when copying cover letter:

Changes in v2:
  - DT bindings clean up
  - Switch hypercalls to follow SMCCC
