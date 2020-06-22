Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A234B202EFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 06:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgFVEYy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 00:24:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58711 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725497AbgFVEYx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 00:24:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592799893; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=QOGbP7xw45L6+TnXfSqJbGnxxIvLYYfyNWvygSEtEps=;
 b=bT5x7iOS8+a180wFAzOfSJw7Cm7QQFaxtpqVRX6eWZKSY3Rb4VGN3YmEGkfTITivI5JHXHGx
 +9+JdWas1wAJm5Bv3grdvEXAdoJbOcjzIVpITJpcnJtuVN/d4njubUoWgJMMzLxftDch+sDK
 z2j4X4vd0We01/m8OenFP8EPUII=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5ef0328b6f2ee827dae95791 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Jun 2020 04:24:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5A4AEC433C8; Mon, 22 Jun 2020 04:24:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mansur)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C0824C433C6;
        Mon, 22 Jun 2020 04:24:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 22 Jun 2020 09:54:42 +0530
From:   mansur@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH] venus: core: add shutdown callback for venus
In-Reply-To: <6748ea90-15d6-a34d-e436-00771b165a60@linaro.org>
References: <1592044386-15654-1-git-send-email-mansur@codeaurora.org>
 <6748ea90-15d6-a34d-e436-00771b165a60@linaro.org>
Message-ID: <ba206c679c9602c216f1f16bd70eddd8@codeaurora.org>
X-Sender: mansur@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stan,

> On 2020-06-13 17:43, Stanimir Varbanov wrote:
>> Hi Mansur,
>> 
>> Thanks for the patch!
>> 
>> How you test this? Is it enough to start playback and issue reboot 
>> (did
>> you test with reboot -f) ?
Yes, I have tested it with "reboot -f" and started video playback 
(YouTube browser and local video)
and issue reboot command.

>> On 6/13/20 1:33 PM, Mansur Alisha Shaik wrote:
>>> After the SMMU translation is disabled in the
>>> arm-smmu shutdown callback during reboot, if
>>> any subsystem are still alive then IOVAs they
>>> are using will become PAs on bus, which may
>>> lead to crash.
>>> 
>>> Below are the consumers of smmu from venus
>>> arm-smmu: consumer: aa00000.video-codec supplier=15000000.iommu
>>> arm-smmu: consumer: video-firmware.0 supplier=15000000.iommu
>>> 
>>> So implemented shutdown callback, which detach iommu maps.
>>> 
>>> Change-Id: I0f0f331056e0b84b92f1d86f66618d4b1caaa24a
>>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>>> ---
>>>  drivers/media/platform/qcom/venus/core.c | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>> 
>>> diff --git a/drivers/media/platform/qcom/venus/core.c 
>>> b/drivers/media/platform/qcom/venus/core.c
>>> index 30d4b9e..acf798c 100644
>>> --- a/drivers/media/platform/qcom/venus/core.c
>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>> @@ -371,6 +371,14 @@ static int venus_remove(struct platform_device 
>>> *pdev)
>>>  	return ret;
>>>  }
>>> 
>>> +static void venus_core_shutdown(struct platform_device *pdev)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = venus_remove(pdev);
>>> +	WARN_ON(ret < 0);
>>> +}
>>> +
>>>  static __maybe_unused int venus_runtime_suspend(struct device *dev)
>>>  {
>>>  	struct venus_core *core = dev_get_drvdata(dev);
>>> @@ -628,6 +636,7 @@ static struct platform_driver qcom_venus_driver = 
>>> {
>>>  		.of_match_table = venus_dt_match,
>>>  		.pm = &venus_pm_ops,
>>>  	},
>>> +	.shutdown = venus_core_shutdown,
>>>  };
>>>  module_platform_driver(qcom_venus_driver);
>>> 
>>> 
Thank,
Mansur
