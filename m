Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B10206D10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 08:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388972AbgFXGxb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 02:53:31 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:38341 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389229AbgFXGxa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 02:53:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592981610; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mfTvbat16k8ntfxME31zkmPcnDzW9AvI4GxEfGq3e5Q=;
 b=D5iX7IG6LRkKxsvhQK5jYCWM5NxQ62jUoW7ioM4QMq0MpE47AqFwaojmsReBEH4Ohvr4DWXH
 dBrVbCbo5vGRuWS5r22/Q4d1FGYsFcrlAiVm3yozS4y5Nkimgf6T9ioj3PvltiyDwF2s4RjG
 Y5Tnq5jUDBolAoLbb8Nab6G1Hwc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ef2f8668fe116ddd9308e00 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Jun 2020 06:53:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 615DAC433A0; Wed, 24 Jun 2020 06:53:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B31C6C433C8;
        Wed, 24 Jun 2020 06:53:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 24 Jun 2020 12:23:24 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv3] coresight: tmc: Add shutdown callback for TMC ETR
In-Reply-To: <20200623172532.GA1843779@xps15>
References: <20200616045623.27549-1-saiprakash.ranjan@codeaurora.org>
 <20200623172532.GA1843779@xps15>
Message-ID: <7bfbef95a0ec59fd45b101ea05a9ce36@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-23 22:55, Mathieu Poirier wrote:
> On Tue, Jun 16, 2020 at 10:26:23AM +0530, Sai Prakash Ranjan wrote:
>> Implement a shutdown callback to ensure ETR hardware is
>> properly shutdown in reboot/shutdown path. This is required
>> for ETR which has SMMU address translation enabled like on
>> SC7180 SoC and few others. If the hardware is still accessing
>> memory after SMMU translation is disabled as part of SMMU
>> shutdown callback in system reboot or shutdown path, then
>> IOVAs(I/O virtual address) which it was using will go on the
>> bus as the physical addresses which might result in unknown
>> crashes (NoC/interconnect errors). So we make sure from this
>> shutdown callback that the ETR is shutdown before SMMU translation
>> is disabled and device_link in SMMU driver will take care of
>> ordering of shutdown callbacks such that SMMU shutdown callback
>> is not called before any of its consumer shutdown callbacks.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
> 
> I have applied your patch.
> 

Thanks Mathieu.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
