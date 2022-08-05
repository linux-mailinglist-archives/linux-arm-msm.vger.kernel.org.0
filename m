Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 153B658AD80
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 17:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241100AbiHEPvZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Aug 2022 11:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241132AbiHEPvM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Aug 2022 11:51:12 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D46C25C2;
        Fri,  5 Aug 2022 08:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659714540; x=1691250540;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/GoEO3MQX6GpaiRN/wVo8Qf4miq+EhSGO4siUcJ3nck=;
  b=lNQ3gFAhjW/SUpL42cKDVy827s91j5gZU+4ep1w2JtRyQaE4pASkU++K
   LtJ1tR2jmBR+iltKQmUEhSh9Y1u8E33fcb+YAj1LIqF7+A4SE2fzCKkjY
   tkk7pxD3pvRAtDrbDAmF6kWFUAzBTR95tdlBUqmalwJcyImSouRJwI2PV
   M=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 05 Aug 2022 08:48:56 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2022 08:48:56 -0700
Received: from [10.110.78.233] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 5 Aug 2022
 08:48:55 -0700
Message-ID: <91e1c682-b33f-d136-d3bb-2ed4f07d7029@quicinc.com>
Date:   Fri, 5 Aug 2022 08:48:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 01/11] docs: gunyah: Introduce Gunyah Hypervisor
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Srivatsa Vaddagiri" <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Marc Zyngier" <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-2-quic_eberman@quicinc.com>
 <YuyL/ThXq5FTdDF/@debian.me>
From:   Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <YuyL/ThXq5FTdDF/@debian.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/4/2022 8:18 PM, Bagas Sanjaya wrote:
> On Mon, Aug 01, 2022 at 02:12:30PM -0700, Elliot Berman wrote:
>> +Communication with the resource manager from each guest VM happens with message-queue.rst. Details
>> +about the specific messages can be found in drivers/virt/gunyah/rsc_mgr.c
>> +
>> +::
>> +  +-------+   +--------+   +--------+
>> +  |  RM   |   |  VM_A  |   |  VM_B  |
>> +  +-.-.-.-+   +---.----+   +---.----+
>> +    | |           |            |
>> +  +-.-.-----------.------------.----+
>> +  | | \==========/             |    |
>> +  |  \========================/     |
>> +  |            Gunyah               |
>> +  +---------------------------------+
>> +
>   
> Hi,
> 
> The diagram above triggers htmldocs warnings:
> 
> Documentation/virt/gunyah/index.rst:71: WARNING: Unexpected indentation.
> Documentation/virt/gunyah/index.rst:72: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> I have applied the fixup:
> 
> diff --git a/Documentation/virt/gunyah/index.rst b/Documentation/virt/gunyah/index.rst
> index 95ba9b71ab30d2..b74f7a6f9d4904 100644
> --- a/Documentation/virt/gunyah/index.rst
> +++ b/Documentation/virt/gunyah/index.rst
> @@ -65,6 +65,7 @@ Communication with the resource manager from each guest VM happens with message-
>   about the specific messages can be found in drivers/virt/gunyah/rsc_mgr.c
>   
>   ::
> +
>     +-------+   +--------+   +--------+
>     |  RM   |   |  VM_A  |   |  VM_B  |
>     +-.-.-.-+   +---.----+   +---.----+
> 
> Thanks.
> 

Thanks! Updated for v3.
