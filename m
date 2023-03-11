Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 258E76B57F3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 04:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjCKDEb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 22:04:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjCKDEa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 22:04:30 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53CE9117204;
        Fri, 10 Mar 2023 19:04:29 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32B2FLO9009086;
        Sat, 11 Mar 2023 03:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=S4ykzAnEezJVcvsC8LfSQObVXyuzOymxX+CDEd8cP6w=;
 b=gi8pfF90KvMlae+GxYZznYAF1ZBFCL92Bp0veLsNfKIKKGT0swQ2xkFhVKOpe/2SsLP6
 223dwCxYS6QyA4Lk0RWUMBfeQ12I0j913VpqQSAoeLn9y2P8HzhcMaZSxMH5/A4E8Lvd
 rXhLVUOReSB0OOFcOSknkK9afqoAa3vZ9LZ3zvfEny2R1w1hAciRyemnQltBQaWTJB9o
 q6TOF9p3e9oJ//RvBnkHEWmjqquc+Qp5C4C92mnEiGz/lH4kIHpt1IjG7oVkGZAJfgBt
 pOTW+F0+9VWlHAyTpi5DqjrgmadyV8yJAaF4+xGdBYNXLGQ9ZC7yQH+IhOmO9zxxKFbh Tg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p7mgrkvj9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 11 Mar 2023 03:04:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32B34FUu008309
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 11 Mar 2023 03:04:15 GMT
Received: from [10.216.47.40] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 10 Mar
 2023 19:04:08 -0800
Message-ID: <966c1001-6d64-9163-0c07-96595156fc8c@quicinc.com>
Date:   Sat, 11 Mar 2023 08:34:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/8] usb: dwc3: core: Access XHCI address space
 temporarily to read port info
Content-Language: en-US
From:   Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "quic_pkondeti@quicinc.com" <quic_pkondeti@quicinc.com>,
        "quic_ppratap@quicinc.com" <quic_ppratap@quicinc.com>,
        "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
        "quic_jackp@quicinc.com" <quic_jackp@quicinc.com>,
        "quic_harshq@quicinc.com" <quic_harshq@quicinc.com>,
        "ahalaney@redhat.com" <ahalaney@redhat.com>,
        "quic_shazhuss@quicinc.com" <quic_shazhuss@quicinc.com>
References: <20230310163420.7582-1-quic_kriskura@quicinc.com>
 <20230310163420.7582-3-quic_kriskura@quicinc.com>
 <20230310235537.afl76rs3pcifbn46@synopsys.com>
 <c23453b3-4f91-aa0a-c45a-de99ac369048@quicinc.com>
In-Reply-To: <c23453b3-4f91-aa0a-c45a-de99ac369048@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GgxoKi8JxsOKTaEYvopOlMEl-9gXXuxJ
X-Proofpoint-GUID: GgxoKi8JxsOKTaEYvopOlMEl-9gXXuxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303110025
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/11/2023 8:24 AM, Krishna Kurapati PSSNV wrote:
> 
> 
> On 3/11/2023 5:25 AM, Thinh Nguyen wrote:
>> On Fri, Mar 10, 2023, Krishna Kurapati wrote:
>>> Currently host-only capable DWC3 controllers support Multiport. 
>>> Temporarily
>>> map XHCI address space for host-only controllers and parse XHCI Extended
>>> Capabilities registers to read number of physical usb ports connected 
>>> to the
>>> multiport controller (presuming each port is at least HS capable) and 
>>> extract
>>> info on how many of these ports are Super Speed capable.
>>>
>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>> ---
>>>   drivers/usb/dwc3/core.c | 75 +++++++++++++++++++++++++++++++++++++++++
>>>   drivers/usb/dwc3/core.h |  9 +++++
>>>   2 files changed, 84 insertions(+)
>>>
>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>> index 476b63618511..076c0f8a4441 100644
>>> --- a/drivers/usb/dwc3/core.c
>>> +++ b/drivers/usb/dwc3/core.c
>>> @@ -37,6 +37,7 @@
>>>   #include "core.h"
>>>   #include "gadget.h"
>>>   #include "io.h"
>>> +#include "../host/xhci.h"
>>
>> I think better to duplicate some of the logic in dwc3 driver and avoid
>> any direct dependency with the xhci driver.
>>
>>>   #include "debug.h"
>>> @@ -1750,6 +1751,65 @@ static struct extcon_dev 
>>> *dwc3_get_extcon(struct dwc3 *dwc)
>>>       return edev;
>>>   }
>>> +static int dwc3_read_port_info(struct dwc3 *dwc, struct resource *res)
>>> +{
>>> +    void __iomem        *regs;
>>> +    struct resource         dwc_res;
>>> +    u32            offset;
>>> +    u32            temp;
>>> +    u8            major_revision;
>>> +    int            ret = 0;
>>> +
>>> +    /*
>>> +     * Remap xHCI address space to access XHCI ext cap regs,
>>> +     * since it is needed to get port info.
>>> +     */
>>> +    dwc_res = *res;
>>> +    dwc_res.start += 0;
>>> +    dwc_res.end = dwc->xhci_resources[0].start +
>>> +                DWC3_XHCI_REGS_END;
>>
>> Isn't dwc->xhci_resources[0] already setup at this point? Can we use
>> dwc->xhci_resources[0] directly without copy the setting in dwc_res?
>>
>>> +
>>> +    regs = ioremap(dwc_res.start, resource_size(&dwc_res));
>>> +    if (IS_ERR(regs))
>>> +        return PTR_ERR(regs);
>>> +
>>> +    offset = xhci_find_next_ext_cap(regs, 0,
>>> +                    XHCI_EXT_CAPS_PROTOCOL);
>>> +    while (offset) {
>>> +        temp = readl(regs + offset);
>>> +        major_revision = XHCI_EXT_PORT_MAJOR(temp);
>>> +
>>> +        temp = readl(regs + offset + 0x08);
>>> +        if (major_revision == 0x03) {
>>> +            dwc->num_ss_ports += XHCI_EXT_PORT_COUNT(temp);
>>> +        } else if (major_revision <= 0x02) {
>>> +            dwc->num_ports += XHCI_EXT_PORT_COUNT(temp);
>>> +        } else {
>>> +            dev_err(dwc->dev, "port revision seems wrong\n");
>>> +            ret = -EINVAL;
>>> +            goto unmap_reg;
>>> +        }
>>> +
>>> +        offset = xhci_find_next_ext_cap(regs, offset,
>>> +                        XHCI_EXT_CAPS_PROTOCOL);
>>> +    }
>>> +
>>> +    temp = readl(regs + DWC3_XHCI_HCSPARAMS1);
>>> +    if (HCS_MAX_PORTS(temp) != (dwc->num_ss_ports + dwc->num_ports)) {
>>> +        dev_err(dwc->dev, "inconsistency in port info\n");
>>> +        ret = -EINVAL;
>>> +        goto unmap_reg;
>>> +    }
>>> +
>>> +    dev_info(dwc->dev,
>>> +        "num-ports: %d ss-capable: %d\n", dwc->num_ports, 
>>> dwc->num_ss_ports);
>>
>> The end user doesn't need to know this info. This should be a debug
>> message. Perhaps it can be a tracepoint if needed?
>>
>>> +
>>> +unmap_reg:
>>> +    iounmap(regs);
>>> +    return ret;
>>> +}
>>> +
>>>   static int dwc3_probe(struct platform_device *pdev)
>>>   {
>>>       struct device        *dev = &pdev->dev;
>>> @@ -1757,6 +1817,7 @@ static int dwc3_probe(struct platform_device 
>>> *pdev)
>>>       struct dwc3        *dwc;
>>>       int            ret;
>>> +    unsigned int        hw_mode;
>>>       void __iomem        *regs;
>>> @@ -1880,6 +1941,20 @@ static int dwc3_probe(struct platform_device 
>>> *pdev)
>>>               goto disable_clks;
>>>       }
>>> +    /*
>>> +     * Currently DWC3 controllers that are host-only capable
>>> +     * support Multiport.
>>> +     */
>>> +    hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
>>> +    if (hw_mode == DWC3_GHWPARAMS0_MODE_HOST) {
>>> +        ret = dwc3_read_port_info(dwc, res);
>>> +        if (ret)
>>> +            goto disable_clks;
>>> +    } else {
>>> +        dwc->num_ports = 1;
>>> +        dwc->num_ss_ports = 1;
>>> +    }
>>> +
>>>       spin_lock_init(&dwc->lock);
>>>       mutex_init(&dwc->mutex);
>>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>>> index 582ebd9cf9c2..74386d6a0277 100644
>>> --- a/drivers/usb/dwc3/core.h
>>> +++ b/drivers/usb/dwc3/core.h
>>> @@ -35,6 +35,9 @@
>>>   #define DWC3_MSG_MAX    500
>>> +/* XHCI Reg constants */
>>> +#define DWC3_XHCI_HCSPARAMS1    0x04
>>> +
>>>   /* Global constants */
>>>   #define DWC3_PULL_UP_TIMEOUT    500    /* ms */
>>>   #define DWC3_BOUNCE_SIZE    1024    /* size of a superspeed bulk */
>>> @@ -1023,6 +1026,10 @@ struct dwc3_scratchpad_array {
>>>    * @usb_psy: pointer to power supply interface.
>>>    * @usb2_phy: pointer to USB2 PHY
>>>    * @usb3_phy: pointer to USB3 PHY
>>> + * @num_ports: Indicates the number of physical USB ports present on HW
>>> + *        presuming each port is at least HS capable
>>
>> This isn't the number of physical USB ports right? That's the number of
>> usb2 ports the controller is configured with right?. Perhaps we can use
>> num_usb2_ports and num_usb3_ports?
>>
> Hi Thinh,
> 
>    Yes, naming this might have created a little confusion.
> num_ports is supposed to indicate number of usb2 ports in the controller.
> 
> Incase of sa8295 (4 port controller with first two ports having ss 
> capability), num_ports would be 4 and num_ss_ports would be 2. (and not 
> 6 as what num_ports usually sounds).
> I can rename them accordingly in the next version and update the 
> description as well.
> 
> Regards,
> Krishna,
> 
Hi Thinh,

One reason I didn't mention something like num_hs_ports and sticked to 
num_ports is because in core driver, wherever we need to do phy 
operations like:

for (i = 0; i < num_ports; i++)
{
	phy_set_mode(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST);
	phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
}

The intention is as follows:
If number of usb2 ports is 4, the loop can go from 0-3 and its fine.
If number of usb3-ports is 2, we don't know for sure, if the first 2 
ports are SS capable or some other ports like (3 and 4) are SS capable.
So instead, I looped all phy operations around all usb2_generic_phy's 
and usb3_generic_phy's. If they are NULL, we just bail out inside phy 
operation.

While doing so, looping SS Phy operations around num_usb2_ports didn't 
sound good. From code view, it would be like we are looping usb3_phy ops 
around num_usb2_ports value (logically it is still correct as each port 
is atleast HS capable). So to avoid this, I named the variable as 
num_ports instead of num_usb2_ports

Regards,
Krishna,

>>> + * @num_ss_ports: Indicates the number of USB ports present on HW 
>>> that are
>>> + *        SS Capable
>>>    * @usb2_generic_phy: pointer to USB2 PHY
>>>    * @usb3_generic_phy: pointer to USB3 PHY
>>>    * @phys_ready: flag to indicate that PHYs are ready
>>> @@ -1158,6 +1165,8 @@ struct dwc3 {
>>>       struct usb_phy        *usb2_phy;
>>>       struct usb_phy        *usb3_phy;
>>> +    u32            num_ports;
>>> +    u32            num_ss_ports;
>>>       struct phy        *usb2_generic_phy;
>>>       struct phy        *usb3_generic_phy;
>>> -- 
>>> 2.39.0
>>>
>>
>> Thanks,
>> Thinh
