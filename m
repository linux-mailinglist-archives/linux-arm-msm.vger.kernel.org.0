Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07AAC778E3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 13:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjHKLvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 07:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjHKLvT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 07:51:19 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFC1DC;
        Fri, 11 Aug 2023 04:51:18 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37BBlRKA019472;
        Fri, 11 Aug 2023 11:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=1Z6oCYamo2xQg3871Q2Qd7ihLz0me4HirROMOgqLRRk=;
 b=XMUwvOTvwQwSkCkHy/0vmqJRAUgFMBukbHfvGmuONKVB9CAYrEJEKVQxxvG7SIke8KC4
 giZCJobShbhHOTzzR/SH2Uqm5/f6GWOCg7PqGVKYkDPYivhakPYzwUjKCdcMvTUkLubX
 0pXK4Uy9NJge+Ol0TJB4hHh6JWDMBgwZ7ycvSpNM+hj1TVq3NDLFH6LyZ/uDC5qBiTGM
 ustY2fuOuNTF38pboov4dXAoqb8mWPLyHuh5Rhw+58k6E5SGiNCnW9k5mnCLkWh8oR+j
 UEIGlyCS7jV6jYBJLHw6q/PbN8X3/bAvBvo21BbiLgxFRLlrCKDNILooxAe7ycWuqnt6 Ew== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sd9061f4k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Aug 2023 11:51:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37BBpCB8027710
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Aug 2023 11:51:12 GMT
Received: from [10.216.22.214] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 11 Aug
 2023 04:51:08 -0700
Message-ID: <af60c05b-4a0f-51b8-486a-1fc601602515@quicinc.com>
Date:   Fri, 11 Aug 2023 17:21:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
From:   Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Subject: Disconnect interrupt generation for QC targets when role switch is
 enabled
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cAgBcsdx_Iy3Ws3QWYPQTAFYf11Ch62T
X-Proofpoint-ORIG-GUID: cAgBcsdx_Iy3Ws3QWYPQTAFYf11Ch62T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-11_03,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 clxscore=1011 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308110108
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thinh, Johan, Bjorn, Konrad,

   On QC targets today, the disconnect event in device mode is generated 
by controller when software writes to QSCRATCH registers in qcom glue 
layer rather than the vbus line being routed to dwc3 core IP for it to 
recognize and generate conndone/disconnect events.

We need to write '1' to  UTMI_OTG_VBUS_VALID bit of QSCRATCH_HS_PHY_CTRL 
register to generate a connection done event and "0" if we need to 
generate a disconnect event during cable removal or mode switch. Exactly 
what is done by "dwc3_qcom_vbus_override_enable" call in dwc3-qcom. In 
case the user wants to enable runtime suspend for dwc3 and we don't 
generate a disconnect event, the dwc->connected flag will be "true" and 
it would block suspend entry.

Today, in dwc3-qcom, this qscratch modification is being done only for 
vbus/host notifiers where I assume dwc3-qcom would be receiving these 
notifications from charger driver regarding cable connect and removal 
and since we are receiving a copy of the information in dwc3-qcom as 
well, we would be knowing when to set/clear the VBUS_VALID bit.

But, when we have role switch in play, the role_set callback goes to DRD 
and Qcom driver is agnostic of what is actually happening. While this 
doesn't hinder mode switch, the role change notification never really 
reaches dwc3-qcom and we would never set this bit to "0" and disconnect 
event is not generated upon cable plug-out. Is there a way we can 
properly provide this notification to qcom glue driver ?

I had some idea on how to get the role notification reach qcom glue 
driver but wanted your opinion on whether they can be used or not:

1. Register a vendor_hook from glue driver and invoke that during 
__dwc3_set_mode.

2. Let the role notification reach dwc3-qcom first and then let qcom 
driver invoke role_set of drd. Something similar to what was implemented 
by Wesley on [1].

But both the options require dwc3_probe to be done in sync with 
of_platform_populate or we need to defer qcom probe if dwc3_probe is 
deferred. Since we are leaning towards async probe, not sure if the 
above two options would be proper.

Couple of more reasons to ask for the above two options:

1. We would know when we are in device/host mode and we can avoid having 
any layering violations in dwc3-qcom.

2. When it comes to runtime pm implementation for dwc3-qcom, an effort 
was done by Manivannan Sadhasivam previously [2], we can avoid modifying 
xhci-plat.c to set autosuspend delay to any specific value. We would be 
able to enable runtime/autosuspend for dwc->xhci->dev from dwc3-qcom 
itself upon entering host mode.

Can you help let know your thoughts on the above two options or if there 
is any way we can implement the role change / cable plug in(out) callback.

[1]: 
https://patchwork.kernel.org/project/linux-usb/patch/20201009082843.28503-4-wcheng@codeaurora.org/
[2]: 
https://patchwork.kernel.org/project/linux-usb/cover/20230325165217.31069-1-manivannan.sadhasivam@linaro.org/

Regards,
Krishna,
