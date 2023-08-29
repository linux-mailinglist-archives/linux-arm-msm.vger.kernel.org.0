Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0366378C4EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 15:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232501AbjH2NNL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 09:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235935AbjH2NMi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 09:12:38 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37E390;
        Tue, 29 Aug 2023 06:12:34 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37TCC3Zu006643;
        Tue, 29 Aug 2023 13:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=aRvhbDSNBHrfBMzTta6N6C7WJuGvOKAdbHxdgC1vxes=;
 b=MqAp71LX5YMVecg8plzA8qd8TyvXJqfQjoTSJGncIbfLYZ5lxlVZe+62kAkqop8C4SHz
 KDnuCluBMd87bgwWtAe+cqT8AJPdO03ygJO13VMpWZNSb8Os2Au3ps7QWbAAAzyNljgg
 Pmm9UQN3vZlinZXjjg3x6SwzncXGffsi/tZ9YHY24KwFlyLRtgVeWo25auLySiwa9oTp
 7y/hLWGZ2Vni8VH0UB3lPNRFa+WSrY+8GRd52DbrUfgGWRFOXNzUpiDUeWcv1Gcu4T3L
 m8m05PPk0n+FCFv2xDjSFOezXBWYhbbat6+8ifR7+HeItOqJE666+CseUvEvNWMnDZzj SA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ss4wq1g8j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Aug 2023 13:12:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37TDCL6x011207
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Aug 2023 13:12:21 GMT
Received: from [10.216.57.128] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 29 Aug
 2023 06:12:17 -0700
Message-ID: <0bd1fddf-a05f-69a0-b4b0-1b2378bc0c58@quicinc.com>
Date:   Tue, 29 Aug 2023 18:42:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: Disconnect interrupt generation for QC targets when role switch
 is enabled
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <af60c05b-4a0f-51b8-486a-1fc601602515@quicinc.com>
 <20230816165455.GA23057@thinkpad>
Content-Language: en-US
From:   Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <20230816165455.GA23057@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1p3OLyTOqYr3AuzK-fT0RcIM3xKyQIij
X-Proofpoint-ORIG-GUID: 1p3OLyTOqYr3AuzK-fT0RcIM3xKyQIij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_10,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 adultscore=0
 mlxlogscore=795 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290114
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/16/2023 10:24 PM, Manivannan Sadhasivam wrote:
> 
> Since you have quoted my series, I'd like to get clarification on one issue I'm
> seeing. When resuming from runtime suspend in host mode, dwc3-qcom driver gets
> the wakeup event and it resumes the xhci driver. But the XHCI IRQs are received
> after some delay. Due to this, xhci driver doesn't resume the device, instead,
> all the drivers (dwc3-qcom, dwc3-core, xhci) went to runtime suspend again.
> 
> But once the XHCI IRQs are received, dwc3-qcom gets the wakeup event and this
> time, xhci driver resumes the device.
> 
> This is the reason why I added the autosuspend delay of 200ms to allow the xhci
> driver to wait for IRQs before going to runtime suspend.
> 
> Can you clarify why there is a delay in receiving XHCI IRQs?
> 

Hi Manivannan,

  Apologies for the delay in response. Can you help check if the phy 
clocks are ON at the instant we see that the xhci irq not coming up. I 
got to know that after resume, the clocks need to be ON for phy for it 
to signal the controller which would then generate the xhci irq. I also 
see that in resume_irq call in dwc3-qcom, we call runtime_resume for 
xhci->dev, probably causing it to resume before dwc3->dev (I might be 
wrong though). Can you confirm if the clocks for phy and GDSC for 
controller are ON when this issue is seen. Also can you let know how 
much time its taking for the xhci irq to be generated after resume.

Regards,
Krishna,
