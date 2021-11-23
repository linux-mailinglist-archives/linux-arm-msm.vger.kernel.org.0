Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7AC45A130
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 12:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234506AbhKWLVO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 06:21:14 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:42946 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234044AbhKWLVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 06:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637666286; x=1669202286;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=HB5qI31vucZBGIsfGDW0ofLzI2/3qx6sfULeQp33/J0=;
  b=HV60vp68cVWaSIVopmqbfImwHWlnbl1LI3Uk3solgHOw5wdUsqXHQmhf
   txP+j50dgOWdl00prpJlEtkJwrDF/E+sWSByLBNNmYv02dGN1cSlkvOsD
   HErNCfPG2zpMAVsSXaDv0pSawnqVqckxrC1olaoTL8E7ubNTsiMUtD5NO
   M=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 23 Nov 2021 03:18:05 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 03:18:05 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 03:18:04 -0800
Received: from [10.216.40.170] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 23 Nov
 2021 03:17:59 -0800
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: usb-xhci: Add bindings for
 usb-skip-phy-init property
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
CC:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Matthias Kaehlcke" <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_ppratap@quicinc.com>
References: <1636353710-25582-1-git-send-email-quic_c_sanm@quicinc.com>
 <1636353710-25582-2-git-send-email-quic_c_sanm@quicinc.com>
 <YY7vAzxj9aR/zBSB@robh.at.kernel.org>
 <3e02ae12-660b-8cf5-d6f8-3a8d1a2abc4e@quicinc.com>
 <20211117052703.GA6511@hu-pkondeti-hyd.qualcomm.com>
From:   Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Message-ID: <d24178ca-ef62-6cbd-601f-1c9565e10a70@quicinc.com>
Date:   Tue, 23 Nov 2021 16:47:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211117052703.GA6511@hu-pkondeti-hyd.qualcomm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Pavan,

On 11/17/2021 10:57 AM, Pavan Kondeti wrote:
> Hi Sandeep,
>
> On Tue, Nov 16, 2021 at 04:11:30PM +0530, Sandeep Maheswaram wrote:
>> On 11/13/2021 4:17 AM, Rob Herring wrote:
>>> On Mon, Nov 08, 2021 at 12:11:48PM +0530, Sandeep Maheswaram wrote:
>>>> Adding bindings for usb-skip-phy-init property.
>>>> Runtime suspend of phy drivers was failing from DWC3 driver as
>>>> runtime usage value is 2 because the phy is initialized from
>>>> DWC3 core and HCD core.
>>>> Some controllers like DWC3 and CDNS3 manage phy in their core drivers.
>>>> This property can be set to avoid phy initialization in HCD core.
>>> You already know if you have a DWC3 and CDNS3 controller, so you don't
>>> need more data in DT.
>> We don't have a device tree node for xhci platform device and create xhci
>> platform device from dwc3/host.c
>>
>> So we want to pass this property to check in xhci-plat.c and skip phy
>> initialization.
>>
> Would not the below condition from your other patch [1] work here too?
>
> if (of_device_is_compatible(dev->parent->of_node, "snps,dwc3"))
>
> [1] https://lore.kernel.org/linux-usb/1635753224-23975-2-git-send-email-quic_c_sanm@quicinc.com/
>
> Thanks,
> Pavan
Yes. This condition is working. Will send the new version with this change.
