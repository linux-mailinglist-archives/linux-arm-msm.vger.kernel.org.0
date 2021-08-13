Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750C73EAF55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 06:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236136AbhHMEbh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 00:31:37 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:22715 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235002AbhHMEbh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 00:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1628829071; x=1660365071;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=2Qn8uclZhD6XPeMfCxSgFOazhwYXJ3l60HI88f+/yDc=;
  b=nx+zmMAEQd/puFCvKJdkqVdHQ5QRn+iX7m1nZQ/kl3Z7KOOneuNCqbYO
   1WW18YbMzpHqLTbaB1l8CpnYU8KkyKh5JHmtMnMyXem7Sd9he3NAkAv2m
   EWQ8IisaYLJ0NvH3Vy531rdHyNMn09hCSwaipp9Pf9Yh72tr4YDP9Ltwo
   Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 12 Aug 2021 21:31:10 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 21:31:10 -0700
Received: from [10.110.12.68] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.858.15; Thu, 12 Aug
 2021 21:31:09 -0700
Subject: Re: [PATCH 0/3] soc: qcom: Add download mode support for QTI
 platforms
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Sai Prakash Ranjan" <saiprakash.ranjan@codeaurora.org>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        "Rajendra Nayak" <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>, <quic_eberman@quicinc.com>
References: <cover.1628757036.git.saiprakash.ranjan@codeaurora.org>
 <CAE-0n52PzadMxB_4h2DGJGLO++Bu_PCSsxS8NHe+cuhv=Mw0sA@mail.gmail.com>
From:   Trilok Soni <quic_tsoni@quicinc.com>
Message-ID: <0178821e-a8cd-87c8-640c-4928201a3b5a@quicinc.com>
Date:   Thu, 12 Aug 2021 21:31:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n52PzadMxB_4h2DGJGLO++Bu_PCSsxS8NHe+cuhv=Mw0sA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03f.na.qualcomm.com (10.85.0.47) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stephen,

On 8/12/2021 5:16 PM, Stephen Boyd wrote:
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
> into download mode, no special init code required to lay down the cookie
>>   create mode 100644 drivers/soc/qcom/download_mode.c

Some discussion by Elliot on the PSCI_SYSTEM_RESET2 and vendor bits was 
done here. You may want to check.

https://lkml.org/lkml/2020/2/24/1137

---Trilok Soni
