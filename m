Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2F558E3FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 02:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbiHJAH6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Aug 2022 20:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiHJAH5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Aug 2022 20:07:57 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D47F6A481;
        Tue,  9 Aug 2022 17:07:57 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 279NvHnx002410;
        Wed, 10 Aug 2022 00:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lWbYu3++mhXC3VULtB5yMgvf3VLBTVuYJYKpwX4CHB8=;
 b=Cr5ZqUliERtfqhLowRW5k4vHxuGEuHmJ7LpfXSZtGCKQk0bp3pkgwE9t1X2jTqmKHyt8
 M0OC6oXdNbtJAQhrMTbWfeoAvqYkbNaFYGsPQPB/c5d9TPPQrhucq6qW3jpXF1RNOQ4Z
 5SsyS6hEYTHHwS2sJaldo/gukwLgsqACDCU62FT/J74wBBw+e2t8n7WwXygjBE2TI7Hu
 DuF4HpOquH3v7SvQ3FWnfHxEJx0RLr+Wgj12VHXFulN1yQADTLQR6orthmqy7YwwZXkE
 5wqsrZQPZSPg5IJen2VUNou04tpD2OOf+K8PJ2Zl8WMGPcxTslq9m5Eks6FCVu34qFF/ xw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3huwqe0gr6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 Aug 2022 00:07:41 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27A07e9r015528
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 Aug 2022 00:07:40 GMT
Received: from [10.110.34.230] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 9 Aug 2022
 17:07:39 -0700
Message-ID: <36303c20-5d30-2edd-0863-0cad804e3f8f@quicinc.com>
Date:   Tue, 9 Aug 2022 17:07:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 00/11] Drivers for gunyah hypervisor
Content-Language: en-US
To:     Robin Murphy <robin.murphy@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Marc Zyngier" <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <50230652-c1ae-4ce2-907c-9bdc6b827f8e@linaro.org>
 <62073cb8-0211-3b49-11cb-aceea6df0845@quicinc.com>
 <a71bea49-130f-61d8-2692-23ab9a8fe939@arm.com>
From:   Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <a71bea49-130f-61d8-2692-23ab9a8fe939@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -PfFK1J0eA6naXjG4w3n4xs_0Fx-iPf2
X-Proofpoint-ORIG-GUID: -PfFK1J0eA6naXjG4w3n4xs_0Fx-iPf2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_05,2022-08-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 mlxscore=0 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=903 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208090089
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/9/2022 6:13 AM, Robin Murphy wrote:
> [drive-by observation since one thing caught my interest...] >

Appreciate all the comments.

Jassi,

I understood you have talked with some of our folks (Trilok and Carl) a
few years ago about using the mailbox APIs. We were steered away from
using mailboxes then. Is that still the recommendation today?

> On 2022-08-09 00:38, Elliot Berman wrote:
>>> I might be completely wrong about this, but if my in-mind picture of 
>>> Gunyah is correct, I'd have implemented the gunyah core subsytem as 
>>> mailbox provider, RM as a separate platform driver consuming these 
>>> mailboxes and in turn being a remoteproc driver, and consoles as 
>>> remoteproc subdevices. >
>>
>> The mailbox framework can only fit with message queues and not 
>> doorbells or vCPUs.
> 
> Is that so? There was a whole long drawn-out saga around the SCMI 
> protocol using the Arm MHU mailbox as a set of doorbells for 
> shared-memory payloads, but it did eventually get merged as the separate 
> arm_mhu_db.c driver, so unless we're talking about some completely 
> different notion of "doorbell"... :/
> 

Doorbells will be harder to fit into mailbox API framework.

  - Simple doorbells don't have any TX done acknowledgement model at
    the doorbell layer (see bullet 1 from 
https://lore.kernel.org/all/68e241fd-16f0-96b4-eab8-369628292e03@quicinc.com/).
    Doorbell clients might have a doorbell acknowledgement flow, but the
    only client I have for doorbells doesn't. IRQFDs would send an
    empty message to the mailbox and immediately do a client-triggered
    TX_DONE.

  - Using mailboxes for the more advanced use-case doorbell forces client
    to use doorbells a certain way because each channel could be a bit on
    the bitmask, or the client could have complete control of the entire
    bitmask. I think implementing the mailbox API would force the
    otherwise-generic doorbell code to make that decision for clients.

Further, I wanted to highlight one other challenge with fitting Gunyah
message queues into mailbox API:

  - Message queues track a flag which indicates whether there is space
    available in the queue. The flag is returned on msgq_send. When the
    message queue is full, an interrupt is raised when there is more
    space available. This could be used as a TX_DONE indicator, but
    mailbox framework's API prevents us from doing mbox_chan_txdone
    inside the send_data channel op.

I think this might be solvable by adding a new txdone mechanism.

>> The mailbox framework also relies on the mailbox being defined in the 
>> devicetree. RM is an exceptional case in that it is described in the 
>> devicetree. Message queues for other VMs would be dynamically created 
>> at runtime as/when that VM is created. Thus, the client of the message 
>> queue would need to "own" both the controller and client ends of the 
>> mailbox.
> 
> FWIW, if the mailbox API does fit conceptually then it looks like it 
> shouldn't be *too* hard to better abstract the DT details in the 
> framework itself and allow providers to offer additional means to 
> validate channel requests, which might be more productive than inventing 
> a whole new thing. >
Some notes about fitting mailboxes into Gunyah IPC:

  - A single mailbox controller can't cover all the gunyah devices. The
    number of gunyah devices is not fixed and varies per VM launched.
    Mailbox controller would need to be per-VM or per-device, where each
    channel represents a capability.

  - The other device types (like vCPU) don't fit into message-based
    style framework. I'd like to have a consistent way of binding a
    device's function with the device. If we use mailbox API, some
    devices will use mailbox and others will use some other mechanism.
    I'd prefer to consistently use "some other mechanism" throughout.

  - TX and RX message queues are independent and "combining" a TX and RX
    message queue happens at client layer by the client requesting access
    to two otherwise unassociated message queues. A mailbox channel would
    either be associated with a TX message queue capability or an RX
    message queue capability. This isn't a major hurdle per se, but it
    decreases how cleanly we can use the mailbox APIs IMO.
      - A VM might only have a TX message queue and no RX message queue,
        or vice versa. We won't be able to require coupling a TX and RX
        message queue for the mailbox.

  - TX done acknowledgement doesn't fit Gunyah IPC (see above) and a new
    TX_DONE mode would need to be implemented.

  - Need to make it possible for a client to binding a mailbox channel
    without DT.

I'm getting a bit apprehensive about the tweaks needed to make mailbox
framework usable for Gunyah. Will there be enough code re-use and help
with abstracting the direct-to-Gunyah APIs? IMO, there isn't, but
opinions are welcome :)

Thanks,
Elliot
