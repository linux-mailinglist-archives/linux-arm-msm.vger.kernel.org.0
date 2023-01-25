Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94C3967AF4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 11:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjAYKHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 05:07:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235509AbjAYKHs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 05:07:48 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47B91B1;
        Wed, 25 Jan 2023 02:07:44 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30P9jVOb021226;
        Wed, 25 Jan 2023 10:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QG1hOKYyuBjZx2ZX+GmCBbFyswYwVCZj+QnlC00l60k=;
 b=pFzn5puRbpKPQGLVsClKUjAQiF3f2dBXL2ta1kuhSbldpdP+XOORhMouKF7xq3InIGWw
 /jnH6ji7oTMhPXt5uxzm/pyH9WOcSFsLOHqkOaT3bRDRAbW1gVpQY7j4GYk5HvaVaaQo
 nP2UaJF5o4lm+FqzczTAyzghv2S3vk4VbX3B1EAyFHFhh0kTtVV0OKLtdOhO+cPonl6f
 oE1+RBA9cRBhw7duupsTcygIR8Jo2B9k6maxA0lc455Yk5oZIEP0Ue0ZHDBOILgUnTaK
 DoWvtK0+8buiZRQWT3luWaFWczor1ArxxPnLtuBTx5j6NdwyoaGk8EzG5+MKROEAuXw1 1A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3najkh9kds-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 10:07:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30PA7WmH010412
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 10:07:32 GMT
Received: from [10.216.60.48] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 02:07:25 -0800
Message-ID: <0d9eab77-ad5f-be23-8ed6-d78c0d3ccef1@quicinc.com>
Date:   Wed, 25 Jan 2023 15:37:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From:   Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Subject: Re: [RFC v4 2/5] usb: dwc3: core: Refactor PHY logic to support
 Multiport Controller
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
        Pavan Kondeti <quic_pkondeti@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        "Harsh Agarwal" <quic_harshq@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>,
        <quic_shazhuss@quicinc.com>
References: <20230115114146.12628-1-quic_kriskura@quicinc.com>
 <20230115114146.12628-3-quic_kriskura@quicinc.com>
 <20230119003619.ane3weigd4ebsta6@synopsys.com>
 <7fa2d7b0-509d-ae90-4208-6f0245f927f7@quicinc.com>
 <20230120010226.wjwtisj4id6frirl@synopsys.com>
 <91fa86d8-f443-db13-1544-73e2dd50d964@quicinc.com>
 <20230120224400.77t2j3qtcdfqwt5s@synopsys.com>
Content-Language: en-US
In-Reply-To: <20230120224400.77t2j3qtcdfqwt5s@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: u4X8nYY1VlsZpwfuklTFI99wFmvUqZTW
X-Proofpoint-GUID: u4X8nYY1VlsZpwfuklTFI99wFmvUqZTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_04,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250092
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/21/2023 4:14 AM, Thinh Nguyen wrote:
> On Fri, Jan 20, 2023, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 1/20/2023 6:32 AM, Thinh Nguyen wrote:
>>> Hi,
>>>
>>> On Thu, Jan 19, 2023, Krishna Kurapati PSSNV wrote:
>>>>
>>>>
>>>> On 1/19/2023 6:06 AM, Thinh Nguyen wrote:
>>>>> Hi,
>>>>>
>>>>> On Sun, Jan 15, 2023, Krishna Kurapati wrote:
>>>>>> Currently the DWC3 driver supports only single port controller
>>>>>> which requires at most one HS and one SS PHY.
>>>>>
>>>>> Add note here that multi-port is for host mode for clarity.
>>>>>
>>>>>>
>>>>>> But the DWC3 USB controller can be connected to multiple ports and
>>>>>> each port can have their own PHYs. Each port of the multiport
>>>>>> controller can either be HS+SS capable or HS only capable
>>>>>> Proper quantification of them is required to modify GUSB2PHYCFG
>>>>>> and GUSB3PIPECTL registers appropriately.
>>>>>>
>>>>>> Add support for detecting, obtaining and configuring phy's supported
>>>>>> by a multiport controller and limit the max number of ports
>>>>>> supported to 4.
>>>>>>
>>>>>> Signed-off-by: Harsh Agarwal <quic_harshq@quicinc.com>
>>>>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>>>>> ---
>>>>>>     drivers/usb/dwc3/core.c | 304 +++++++++++++++++++++++++++++-----------
>>>>>>     drivers/usb/dwc3/core.h |  15 +-
>>>>>>     drivers/usb/dwc3/drd.c  |  14 +-
>>>>>>     3 files changed, 244 insertions(+), 89 deletions(-)
>>>>>>
>>>
>>> <snip>
>>>
>>>>>> @@ -1575,6 +1690,21 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>>>>>     	dwc->dis_split_quirk = device_property_read_bool(dev,
>>>>>>     				"snps,dis-split-quirk");
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * If no mulitport properties are defined, default
>>>>>
>>>>> multi*
>>>>>
>>>>>> +	 * the port count to '1'.
>>>>>> +	 */
>>>>>
>>>>> Can we initialize num_ports and num_ss_ports to 1 instead of setting it
>>>>> on error (similar to how we handle other properties).
>>>>>
>>>> Hi Thinh,
>>>>
>>>>     Thanks for the review. On the bindings, Rob and Krzysztof have suggested
>>>> to get the num-ports and num-ss-ports by counting the Phy-names in DT.
>>>
>>> This may be a bit problematic for non-DT device. Currently pci devices
>>> pass fake DT properties to send these kinds of info. But that's fine,
>>> we can enhance dwc3 for non-DT devices later.
>>>
>>>>
>>>> Since there may be many cases where the user might skip giving any Phy's or
>>>> even skip different ports in the DT if he doesn't want to use them, can we
>>>> design/refactor the below logic as follows while mandating the fact that
>>>> user must give the SS Phy's if any starting from Port-0.:
>>>>
>>>> num-ss-ports = max_port_index (usb3-portX) + 1
>>>> num-ports = max (max_port_index(usb2-portX), num-ss-ports) + 1
>>>>
>>>> Ex: If there are 3 ports and only 1 is SS capable and user decides to skip
>>>> port-2 HS Phy.
>>>>
>>>> case-1: phy-names = "usb2-port0", "usb3-port0", "usb2-port-1"
>>>> case-2: phy-names = "usb2-port0", "usb2-port-1", "usb3-port1"
>>>>
>>>> In both cases, only one SS is present, just the order is changed. (Not sure
>>>> if last few ports can be made SS Capable instead of the first ports on any
>>>> HW) ?
>>>>
>>>> But according to the above formula:
>>>>
>>>> In case-1 : (num-ports = 2, num-ss-ports = 1) - This is correct
>>>> In case-2: (num-ports = 2, num-ss-ports = 2) - This is wrong
>>>>
>>>
>>> Can't we just walk through all the phy names to figure that out? Let's
>>> not require the user to specify Port-0 is SS capable if they can skip
>>> it.
>>>
>> Hi Thinh,
>>
>> Thanks for the review.
>>
>>    May be I wasn't able to convey my intention properly in my previous
>> thread. The above suggested method doesn't tell that user must not skip any
>> phy.
>>
>> Let us take the below case for 2 Port (HS+SS) capable controller.
>> If the user skips ss-phy 2, then:
>>
>> phy-names = "usb2-port0", "usb3-port0", "usb2-port-1"
>>
>> We don't need to configure GUSB3PIPECTL2 (for port-2) register ere. If we
>> parse phy-names and find it out, we see there are 2 hs-phy's and 1-ssphy and
>> num-ports = 2 and num-ss-ports = 1.
>>
>> If the user skips ss-phy-1, then phy-names would be something like the
>> below:
>>
>> phy-names = "usb2-port0", "usb2-port-1",  "usb3-port1";
>>
>> We need to handle two types of interpretations here while parsing the
>> phy-names:
>>
>> a) There are 2 SS Phy's and we just skipped the first one. In this scenario,
>> if we consider (num-ss-ports = 2) and (num-ports = 2) by using the above
>> formula as reference, we configure both GUSB3PIPECTL registers present in
>> the address map although we never use SS Phy-1 but nothing must break. All
>> ports would still work as the user intends with the exception of
>> GUSB3PIPECTL1 (for-port1) still being modified.
>>
>> b) The second interpretation is something like, port-1 is only HS capable
>> and only Port-2 is SS Capable, and so in the phy-names only port-2 has been
>> provided a SS Phy. Just by parsing through the phy-names, it would not be
>> possible to get that info. So if we consider num-ss-ports as 2 in this
>> scenario, we end up meddling with wrong registers (as there is only 1
>> GUSB3PIPECTL reg and we are assuing there are 2). I wanted to make sure that
>> this scenario was not possible.
>>
>> num-ss-ports = max_port_index (usb3-portX) + 1
>> num-ports = max (max_port_index(usb2-portX), max_port_index(usb2-portX)) + 1
>>
>> Taking case of a quad port controller with all ports SS Capable, if the user
>> wants to completely skip port-4. Then with above formula, we get (num-ports
>> = 3) and (num-ss-ports = 3) by parsing the phy-names and we will configure
>> exactly those dwc3-phy registers and not touch the port-4 registers which is
>> still fine.
>>
>> Please let me know if the above idea helps us in this scenario.
>>
> 
> This becomes rather more complicated because the user can skip certain
> port in the DT. We have access to the host registers. Can we just
> temporarily map and access HCSPARAMS1 to get the MAXPORTS and each port
> capability before handing control over to the xHCI driver. We would be
> able to get the num_ports and num_ss_ports then.
> 
> Similarly, the xhci driver doesn't care whether the user skips certain
> port in the DT, it only checks and operates based on the capability
> registers.
> 
> If we have the exact num_ports and num_ss_ports, we can be sure the
> setting to GUSB3PIPECTLn and GUSB2PHYCFGn are valid.
> 

Hi Thinh,

   Thanks for the suggestion. Is the following diff / implementation 
good enough ? I Wanted to get it clarified from upstream as I am using 
*ioremap/iounmap* directly instead of *devm_* API's

I tested it and it works fine on SA8295P. Will do some further testing 
on other devices as well.


+static int dwc3_read_port_info(struct dwc3 *dwc, struct resource *res)
+{
+       void __iomem            *regs;
+       struct resource         dwc_res;
+       unsigned int            hw_mode;
+       u32                     offset;
+       u32                     temp;
+       u8                      major_revision;
+       u8                      minor_revision;
+
+       /*
+        * Request memory region including xHCI regs,
+        * since it is needed to get port info
+        */
+       dwc_res = *res;
+       dwc_res.start += 0;
+
+       regs = ioremap(dwc_res.start, resource_size(&dwc_res));
+       if (IS_ERR(regs)) {
+               return PTR_ERR(regs);
+       }
+
+       /*
+        * If the controller is not host-only, then it must be a
+        * single port controller.
+        */
+       temp = readl(regs + DWC3_GHWPARAMS0);
+       hw_mode = DWC3_GHWPARAMS0_MODE(temp);
+       if (hw_mode != DWC3_GHWPARAMS0_MODE_HOST) {
+               dwc->num_ports = 1;
+               dwc->num_ss_ports = 1;
+               return 0;
+       }
+
+       offset = xhci_find_next_ext_cap(regs, 0,
+                                       XHCI_EXT_CAPS_PROTOCOL);
+       while (offset) {
+               temp = readl(regs + offset);
+               major_revision = XHCI_EXT_PORT_MAJOR(temp);;
+               minor_revision = XHCI_EXT_PORT_MINOR(temp);
+
+               temp = readl(regs + offset + 0x08);
+               if (major_revision == 0x03) {
+                       dwc->num_ss_ports += XHCI_EXT_PORT_COUNT(temp);
+               } else if (major_revision <= 0x02) {
+                       dwc->num_ports += XHCI_EXT_PORT_COUNT(temp);
+               } else {
+                       dev_err(dwc->dev, "revision gone wrong\n");
+                       return -EINVAL;
+               }
+
+               offset = xhci_find_next_ext_cap(regs, offset,
+                                               XHCI_EXT_CAPS_PROTOCOL);
+       }
+
+       temp = readl(regs + DWC3_XHCI_HCSPARAMS1_OFFSET);
+       if (HCS_MAX_PORTS(temp) != (dwc->num_ss_ports + dwc->num_ports)) {
+               dev_err(dwc->dev, "inconsistency in port info\n");
+               return -EINVAL;
+       }
+
+       dev_info(dwc->dev, "num_ports: %d, num_ss_ports: %d\n", 
dwc->num_ports, dwc->num_ss_ports);
+       iounmap(regs);
+       return 0;
+}
+
  static int dwc3_probe(struct platform_device *pdev)
  {
         struct device           *dev = &pdev->dev;
@@ -1912,6 +1964,10 @@ static int dwc3_probe(struct platform_device *pdev)
         dwc->xhci_resources[0].flags = res->flags;
         dwc->xhci_resources[0].name = res->name;

+       ret = dwc3_read_port_info(dwc, res);
+       if (ret)
+               return ret;
+
         /*
          * Request memory region but exclude xHCI regs,
          * since it will be requested by the xhci-plat driver.
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 2f82eda9d44f..8535425b81d4 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -38,6 +38,9 @@
  /* Numer of ports supported by a multiport controller */
  #define MAX_PORTS_SUPPORTED    4

+/* XHCI Reg constants */
+#define DWC3_XHCI_HCSPARAMS1_OFFSET    0x04
+
  /* Global constants */
  #define DWC3_PULL_UP_TIMEOUT   500     /* ms */
  #define DWC3_BOUNCE_SIZE       1024    /* size of a superspeed bulk */



Please let me know if this would be acceptable.

BR,
Krishna,
