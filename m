Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A750558DCB1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Aug 2022 19:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245267AbiHIRCb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Aug 2022 13:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245523AbiHIRCP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Aug 2022 13:02:15 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950941125;
        Tue,  9 Aug 2022 10:02:06 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 279EJXd4005332;
        Tue, 9 Aug 2022 17:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PsUe4sDedM4Xf0wEjxfdqjMyNjCBD2aCwnE+h/dNytU=;
 b=ijP+3kXYkLqmYj0zdFJ7LpYQl2jpApcBf8Nm6RlBptwtmUs7mT4cMw3wIGEE6ckeBQCz
 ejl5xnTaGY6DA185b7RLIOL57A8fw+1FB4lKhjs8FagKtUr0s913a/L/dm/JpM0OU7P2
 HHUsGQ/Sk1W0mL1tuJY67ZN3vK6o5ZJ2MKutLxmyxjxApRgWmoJYkxuVJLUzWLuxJfLQ
 eCN7kv5hLM5tM9dTMS9rYUSiOIUILcbVJZsEgbY0jy5VQsYVBU+z5K8FCig6ITzrr9od
 RnTyT2i4Bi9HzUx7J3IdNrVGkcRPSDl4h8QIKdsLaaN+OAFquYrmV8pRwv5fo+khmNkP vA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hudy5a8k4-12
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Aug 2022 17:01:42 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 279Go4Dh020626
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 9 Aug 2022 16:50:04 GMT
Received: from [10.110.34.230] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 9 Aug 2022
 09:50:03 -0700
Message-ID: <68e241fd-16f0-96b4-eab8-369628292e03@quicinc.com>
Date:   Tue, 9 Aug 2022 09:50:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 07/11] gunyah: msgq: Add Gunyah message queues
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>
CC:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Will Deacon" <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-8-quic_eberman@quicinc.com>
 <250945d2-3940-9830-63e5-beec5f44010b@linaro.org>
 <6fa6c86d-5b4c-4048-2df8-49a36c86e7d6@quicinc.com>
 <87zggdven5.wl-maz@kernel.org>
From:   Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <87zggdven5.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Y3DNha-5qTiN3rzu3I9OAriHyDmQgVHK
X-Proofpoint-ORIG-GUID: Y3DNha-5qTiN3rzu3I9OAriHyDmQgVHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_05,2022-08-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=578 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208090068
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/9/2022 4:29 AM, Marc Zyngier wrote:
> On Mon, 08 Aug 2022 23:22:48 +0100,
> Elliot Berman <quic_eberman@quicinc.com> wrote:
>>
>> In a future series, I'll add the support to load other virtual
>> machines. When running other virtual machines, additional gunyah
>> devices are needed for doorbells (e.g. to emulate interrupts for
>> paravirtualized devices) and to represent the vCPUs of that other
>> VM. Other gunyah devices are also possible, but those are the
>> immediate devices coming over the horizon.
> 
> Can you elaborate on this "doorbell" aspect? If you signal interrupts
> to guests, they should be signalled as actual interrupts, not as some
> hypervisor-specific events, as we rely on the interrupt semantics for
> most things.
> 
> Or are you talking about injecting an interrupt from a guest into
> another, the doorbell representing an interrupt source?
> 

Doorbells can operate either of these modes:
  1. As simple interrupt sources. The doorbell sender makes a hypercall
     and an interrupt is raised on the receiver. The hypervisor can be
     configured to raise a specific SPI on the receiver VM and simply
     acknowledging the SPI is enough to clear the interrupt assert. No
     hypervisor-specific code is needed on the receiver to handle these
     interrupts. This is the mode one would expect to use for
     paravirtualized devices.
  2. As hypervisor-specific events which must be acknowledged using
     hypercalls. We aren't currently using this advanced use-case and no
     plans currently to post these. However, I can try to briefly
     explain: These doorbells can operate on a bitfield and the sender
     can assert flags on the bitmask; the receiver can decide which bits
     should trigger the interrupt and which SPI the doorbell "runs" on.
     The "user story" for this doorbell is to support multiple sender
     using the same doorbell object. Each sender has a few designated
     bits they should set. The receiver can choose which events it wants
     an interrupt to be raised for and then can process all the pending
     events. To re-iterate, we don't have an interesting use-case for
     this yet, so don't plan on post patches for this second mode of
     doorbell.


> Thanks,
> 
> 	M.
> 
