Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 204D467630C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jan 2023 03:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjAUCZT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 21:25:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjAUCZS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 21:25:18 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF52A75A13;
        Fri, 20 Jan 2023 18:25:17 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30L2MFtm002522;
        Sat, 21 Jan 2023 02:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ObQwEUHojmcN7NVHuaHrfHaFdonTaSYcQVjjOWt9m50=;
 b=dJaWYllNeIXriLuWompeWCzg7P6dgAYJByP1tgx34oQogKyIimjGsqyOmVoxZj4c0R6d
 m98IWwmx58FLTUPqgNSFGGv4jei28cbbpb+DFpdubGJcHKbFswJSrBGP1ZyeCtnT3jSY
 t1MpvpfwBayA6xqyBFvSElPQjwNDBDaDCqhv0owEg7TefzLHJKLRXmm1vsK4M1F4o2PY
 VVfYRtAdTxtSb7lTH2MPr7nQogb6gOlSzTnPatQYObpl1Nd/yy08aJ50TUbLEYcUGyQw
 j7gtB/W/PRZeCXDBe6819jXRl5/Ei4effmD/s/eYAdtpeQOkZcrPA8mu6KWHf/lJl8ml 8w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n7yc60rda-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 21 Jan 2023 02:25:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30L2P7qq003341
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 21 Jan 2023 02:25:07 GMT
Received: from [10.216.48.43] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 20 Jan
 2023 18:25:02 -0800
Message-ID: <91dc8c42-3fda-1386-586a-59d0a9b6b153@quicinc.com>
Date:   Sat, 21 Jan 2023 07:54:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC v4 2/5] usb: dwc3: core: Refactor PHY logic to support
 Multiport Controller
Content-Language: en-US
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
        "quic_harshq@quicinc.com" <quic_harshq@quicinc.com>
References: <20230115114146.12628-1-quic_kriskura@quicinc.com>
 <20230115114146.12628-3-quic_kriskura@quicinc.com>
 <20230119003619.ane3weigd4ebsta6@synopsys.com>
 <20230120225719.3xau7vwlzxrtbnad@synopsys.com>
 <d2f541bd-ced6-d7b9-a2c3-43e78c249643@quicinc.com>
 <20230121021944.woat55q4qgq43ucq@synopsys.com>
From:   Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <20230121021944.woat55q4qgq43ucq@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y5E_NjjI1Ustae5r7sfEXPy44yksPhmd
X-Proofpoint-ORIG-GUID: y5E_NjjI1Ustae5r7sfEXPy44yksPhmd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_13,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxlogscore=943 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301210021
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/21/2023 7:49 AM, Thinh Nguyen wrote:
> On Sat, Jan 21, 2023, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 1/21/2023 4:27 AM, Thinh Nguyen wrote:
>>> On Thu, Jan 19, 2023, Thinh Nguyen wrote:
>>>> Hi,
>>>>
>>>> On Sun, Jan 15, 2023, Krishna Kurapati wrote:
>>>>> Currently the DWC3 driver supports only single port controller
>>>>> which requires at most one HS and one SS PHY.
>>>>
>>>> Add note here that multi-port is for host mode for clarity.
>>>>
>>>>>
>>>>> But the DWC3 USB controller can be connected to multiple ports and
>>>>> each port can have their own PHYs. Each port of the multiport
>>>>> controller can either be HS+SS capable or HS only capable
>>>>> Proper quantification of them is required to modify GUSB2PHYCFG
>>>>> and GUSB3PIPECTL registers appropriately.
>>>>>
>>>>> Add support for detecting, obtaining and configuring phy's supported
>>>>> by a multiport controller and limit the max number of ports
>>>>> supported to 4.
>>>>>
>>>>> Signed-off-by: Harsh Agarwal <quic_harshq@quicinc.com>
>>>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>>>> ---
>>>>>    drivers/usb/dwc3/core.c | 304 +++++++++++++++++++++++++++++-----------
>>>>>    drivers/usb/dwc3/core.h |  15 +-
>>>>>    drivers/usb/dwc3/drd.c  |  14 +-
>>>>>    3 files changed, 244 insertions(+), 89 deletions(-)
>>>>>
>>>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>>>> index 476b63618511..7e0a9a598dfd 100644
>>>>> --- a/drivers/usb/dwc3/core.c
>>>>> +++ b/drivers/usb/dwc3/core.c
>>>>> @@ -120,7 +120,7 @@ static void __dwc3_set_mode(struct work_struct *work)
>>>>>    {
>>>>>    	struct dwc3 *dwc = work_to_dwc(work);
>>>>>    	unsigned long flags;
>>>>> -	int ret;
>>>>> +	int ret, i;
>>>>
>>>> Can we declare variables in separate lines here and other places.
>>>>
>>>>>    	u32 reg;
>>>>>    	u32 desired_dr_role;
>>>>> @@ -200,8 +200,10 @@ static void __dwc3_set_mode(struct work_struct *work)
>>>>>    		} else {
>>>>>    			if (dwc->usb2_phy)
>>>>>    				otg_set_vbus(dwc->usb2_phy->otg, true);
>>>>> -			phy_set_mode(dwc->usb2_generic_phy, PHY_MODE_USB_HOST);
>>>>> -			phy_set_mode(dwc->usb3_generic_phy, PHY_MODE_USB_HOST);
>>>>> +			for (i = 0; i < dwc->num_ports; i++) {
>>>
>>> BTW, is num_ports the total of usb2 + usb3 ports?
>> Hi Thinh,
>>
>>    No, num_ports is just the total number of hw usb ports present (presuming
>> each port is hs capable, this is just the number of HS Phy's available).
>>
> 
> I see, thanks. Can you also make this clear in its description. I got
> mixed up at some point for the equivalent of HCPARAMS1.MAXPORTS.
> 
> Thanks,
> Thinh

Sure, Will add this to commit text.
But as you rightly mentioned, HCSPARAMS1 gives the total number of HS+SS 
Phy's available (HCSPARAMS1.MAXPORTS). Is there a way to segregate this 
value (to just number of hs and ss).

Regards,
Krishna,
