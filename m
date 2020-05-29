Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648E41E7F71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 15:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgE2N6g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 09:58:36 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:27456 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726968AbgE2N6f (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 09:58:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590760715; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=hhOcU0EHJxY1kOnhPXt5mTZ3KEnrZzRXFlaRDPFVDAY=; b=tKpy28OYvUViyMSTWiH5yjjvij0hly7TRLGgBW/BKKgGZMBlEmSwktlSzB7UFPQXxhKAdI/9
 FzrtU4mxilbbcszm4Ko+WcDjmDcW7tiYX4+wvrIGk2yGuXv0vak8lqsMjoq/qx2QNj+nZvTN
 LhSc6Ro8xjWrSPk7j/bejJpftzI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5ed114f7b4f0a9ae22bf7378 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 May 2020 13:58:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11A43C433C6; Fri, 29 May 2020 13:58:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.253.15.221] (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C170EC433CA;
        Fri, 29 May 2020 13:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C170EC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=zijuhu@codeaurora.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Fix qca6390 enable failure after
 warm reboot
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org
References: <1590719360-28257-1-git-send-email-zijuhu@codeaurora.org>
 <6C68EF2F-7DEC-4CA4-A0E8-8C775B3CF62B@holtmann.org>
From:   Zijun Hu <zijuhu@codeaurora.org>
Message-ID: <7ef3637f-3d49-ab17-fba1-6d29ac6c069a@codeaurora.org>
Date:   Fri, 29 May 2020 21:58:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <6C68EF2F-7DEC-4CA4-A0E8-8C775B3CF62B@holtmann.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/29/2020 7:45 PM, Marcel Holtmann wrote:
> Hi Zijun,
> 
>> On May 29, 2020, at 04:29, Zijun Hu <zijuhu@codeaurora.org> wrote:
>>
>> Warm reboot can not reset controller qca6390 due to
>> lack of controllable power supply, so causes firmware
>> download failure during enable.
>>
>> Fixed by sending VSC EDL_SOC_RESET to reset qca6390
>> within added device shutdown implementation.
>>
>> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
>> Tested-by: Zijun Hu <zijuhu@codeaurora.org>
>> ---
>> drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
>> 1 file changed, 33 insertions(+)
> 
> patch does not apply to bluetooth-next tree, please rebase.
> 
rebased at v2
> Regards
> 
> Marcel
> 
