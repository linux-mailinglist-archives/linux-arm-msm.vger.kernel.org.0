Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24EA3ED21A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 12:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232390AbhHPKjp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 06:39:45 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:62912 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235650AbhHPKjo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 06:39:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629110353; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7FQMN00bWUtkew/aYXgY67FhLuXjMYkzri60rq8/V1I=;
 b=OLv+4lKZ+hiBNg9nPH3F+7keshM4pWxTjBtqWDJny2ZoWbxlg+4j42IbHeoe8xpl3EABmuJZ
 WVnTOY14b7O70M2HihPwF7wkm5WLmqcNRgn65VWC+4Puof5GaOpg/ufj/KddUSNjWhS3Mn/b
 ivc7jIYj0FuG4WqH3fc1R6PcTrA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 611a403e454b7a558fc1c90c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 16 Aug 2021 10:38:54
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8B089C4360C; Mon, 16 Aug 2021 10:38:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C8AF0C4338F;
        Mon, 16 Aug 2021 10:38:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 16 Aug 2021 16:08:52 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>,
        Trilok Soni <quic_tsoni@quicinc.com>, quic_eberman@quicinc.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 0/3] soc: qcom: Add download mode support for QTI
 platforms
In-Reply-To: <CAE-0n52PzadMxB_4h2DGJGLO++Bu_PCSsxS8NHe+cuhv=Mw0sA@mail.gmail.com>
References: <cover.1628757036.git.saiprakash.ranjan@codeaurora.org>
 <CAE-0n52PzadMxB_4h2DGJGLO++Bu_PCSsxS8NHe+cuhv=Mw0sA@mail.gmail.com>
Message-ID: <30aba45d0e657fd77adba119e5fad345@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-13 05:46, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2021-08-12 02:17:39)
>> Collecting ramdumps on QTI platforms mainly require two things,
>> SDI (System Debug Image) enabled firmware and kernel support to
>> configure download mode cookies and SDI settings. Ramdumps can
>> be collected once the system enters the download mode. To enter
>> download mode, magic values or cookies need to be set in IMEM
>> which is used by firmware to decide to enter download mode or not.
>> Download mode cookies remain the same across targets and SDI disable
>> register needs to be set or SDI needs to be disabled in case of normal
>> reboot since ramdumps are supposed to be for crash debugging and
>> not for every reboot. This series adds the kernel support required
>> to enter download mode.
> 
> I don't recall if we discussed this on the list, but I'd really prefer
> that we don't make kernel changes to support this beyond implementing
> PSCI SYSTEM_RESET2 support and then some sort of vendor specific (or if
> ARM is willing to update the spec then ARM specific) reset command on
> panic reboot paths. The idea is to set the cookie in the bootloader
> before the kernel is booted, then any insta-reboots/watchdogs would go
> into download mode, no special init code required to lay down the 
> cookie
> or clear it on normal reboot. The normal reboot PSCI call would clear
> the cookie in the firmware, in case something goes wrong after the
> kernel hands off control to PSCI, and then panics that want to go into
> download mode would make the SYSTEM_RESET2 reboot call into PSCI that
> sets the cookie.
> 
> Maybe it could be a linux specific psci number or maybe we could
> configure the reboot call in the psci node to be this specific number 
> so
> that it can be different based on the firmware implementation if
> consolidating around a single number doesn't work. Either way, that all
> seems manageable and we can keep these cookie details out of the kernel
> and the reboot/panic paths.
> 

Alright, I think we can probably make it work without much/any changes
in kernel. So following what you said, we can just implement
PSCI_SYSTEM_RESET2 in firmware to enter the download mode having cookies
already set by default and the cookie is cleared when we have a normal
reboot via PSCI_SYSTEM_RESET. For panic reboot, we already have a 
cmdline
*reboot=panic_warm* to identify panic reboots and can call into
PSCI_SYSTEM_RESET2. I have just tested and it works fine if we have
psci_system_reset2_supported as true.

@Trilok/@Elliot, you can check if above works for your usecases in 
android
as well and it doesn't need any of your additional changes to kernel.

Thanks,
Sai

>> 
>> Currently this series doesn't add support for android targets where
>> a couple of SCM calls are required to set/unset the download mode
>> cookies and SDI configuration but can be easily added gradually to
>> the same driver, so as of now only chrome platforms are supported
>> and tested.
>> 
>> Sai Prakash Ranjan (3):
>>   soc: qcom: Add download mode support
>>   dt-bindings: msm: Add QTI download mode support binding
>>   arm64: dts: qcom: sc7180: Add IMEM, pil info and download mode 
>> region
>> 
>>  .../bindings/arm/msm/qcom,dload-mode.yaml     |  53 ++++++
>>  MAINTAINERS                                   |   7 +
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi          |  21 +++
>>  drivers/soc/qcom/Kconfig                      |  10 ++
>>  drivers/soc/qcom/Makefile                     |   1 +
>>  drivers/soc/qcom/download_mode.c              | 152 
>> ++++++++++++++++++
>>  6 files changed, 244 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml
>>  create mode 100644 drivers/soc/qcom/download_mode.c
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
