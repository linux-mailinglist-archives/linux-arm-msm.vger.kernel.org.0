Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4E358D92A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Aug 2022 15:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243648AbiHINN7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Aug 2022 09:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239452AbiHINN6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Aug 2022 09:13:58 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2E791140D8;
        Tue,  9 Aug 2022 06:13:58 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0B7323A;
        Tue,  9 Aug 2022 06:13:58 -0700 (PDT)
Received: from [10.57.74.141] (unknown [10.57.74.141])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 095A83F5A1;
        Tue,  9 Aug 2022 06:13:54 -0700 (PDT)
Message-ID: <a71bea49-130f-61d8-2692-23ab9a8fe939@arm.com>
Date:   Tue, 9 Aug 2022 14:13:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 00/11] Drivers for gunyah hypervisor
Content-Language: en-GB
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <50230652-c1ae-4ce2-907c-9bdc6b827f8e@linaro.org>
 <62073cb8-0211-3b49-11cb-aceea6df0845@quicinc.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <62073cb8-0211-3b49-11cb-aceea6df0845@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[drive-by observation since one thing caught my interest...]

On 2022-08-09 00:38, Elliot Berman wrote:
>> I might be completely wrong about this, but if my in-mind picture of 
>> Gunyah is correct, I'd have implemented the gunyah core subsytem as 
>> mailbox provider, RM as a separate platform driver consuming these 
>> mailboxes and in turn being a remoteproc driver, and consoles as 
>> remoteproc subdevices. >
> 
> The mailbox framework can only fit with message queues and not doorbells 
> or vCPUs.

Is that so? There was a whole long drawn-out saga around the SCMI 
protocol using the Arm MHU mailbox as a set of doorbells for 
shared-memory payloads, but it did eventually get merged as the separate 
arm_mhu_db.c driver, so unless we're talking about some completely 
different notion of "doorbell"... :/

> The mailbox framework also relies on the mailbox being defined 
> in the devicetree. RM is an exceptional case in that it is described in 
> the devicetree. Message queues for other VMs would be dynamically 
> created at runtime as/when that VM is created. Thus, the client of the 
> message queue would need to "own" both the controller and client ends of 
> the mailbox.

FWIW, if the mailbox API does fit conceptually then it looks like it 
shouldn't be *too* hard to better abstract the DT details in the 
framework itself and allow providers to offer additional means to 
validate channel requests, which might be more productive than inventing 
a whole new thing.

Thanks,
Robin.
