Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E98D452F5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 11:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234483AbhKPKpF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 05:45:05 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:27159 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234587AbhKPKol (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 05:44:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637059302; x=1668595302;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=SceYZYaxP3MyPUXhL7rmZQ2ur6GUtmAtRJ0oBSPiYcM=;
  b=KuIgsJsCq/4GcG8HJWyCtV8P6bS2+RCEi050aSz1XmaNwRKJMupoeJSW
   QEXHq+wNKHRystfhGVR3sczPrmPmsw/bHER5A1kEfBlK9dIqtbHWiFMrJ
   HPcGq8IKJ0viXQeUEctx9FHdDD7Rn/zPWMkT0hRYJmFgYOWETOYTEFfYH
   8=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Nov 2021 02:41:40 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 02:41:40 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 16 Nov 2021 02:41:39 -0800
Received: from [10.216.15.92] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 16 Nov
 2021 02:41:34 -0800
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: usb-xhci: Add bindings for
 usb-skip-phy-init property
To:     Rob Herring <robh@kernel.org>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Matthias Kaehlcke" <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_pkondeti@quicinc.com>, <quic_ppratap@quicinc.com>
References: <1636353710-25582-1-git-send-email-quic_c_sanm@quicinc.com>
 <1636353710-25582-2-git-send-email-quic_c_sanm@quicinc.com>
 <YY7vAzxj9aR/zBSB@robh.at.kernel.org>
From:   Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Message-ID: <3e02ae12-660b-8cf5-d6f8-3a8d1a2abc4e@quicinc.com>
Date:   Tue, 16 Nov 2021 16:11:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YY7vAzxj9aR/zBSB@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/13/2021 4:17 AM, Rob Herring wrote:
> On Mon, Nov 08, 2021 at 12:11:48PM +0530, Sandeep Maheswaram wrote:
>> Adding bindings for usb-skip-phy-init property.
>> Runtime suspend of phy drivers was failing from DWC3 driver as
>> runtime usage value is 2 because the phy is initialized from
>> DWC3 core and HCD core.
>> Some controllers like DWC3 and CDNS3 manage phy in their core drivers.
>> This property can be set to avoid phy initialization in HCD core.
> You already know if you have a DWC3 and CDNS3 controller, so you don't
> need more data in DT.

We don't have a device tree node for xhci platform device and create 
xhci platform device from dwc3/host.c

So we want to pass this property to check in xhci-plat.c and skip phy 
initialization.

>> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>> index 965f87f..a64d29f 100644
>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>> @@ -25,6 +25,10 @@ properties:
>>       description: Set if the controller has broken port disable mechanism
>>       type: boolean
>>   
>> +  usb-skip-phy-init:
>> +    description: Set if the phy initialization is managed by controller
>> +    type: boolean
>> +
>>     imod-interval-ns:
>>       description: Interrupt moderation interval
>>       default: 5000
>> -- 
>> 2.7.4
>>
>>
