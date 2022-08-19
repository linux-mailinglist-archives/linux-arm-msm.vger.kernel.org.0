Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F21E159A797
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 23:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351384AbiHSVPN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Aug 2022 17:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352371AbiHSVPK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Aug 2022 17:15:10 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C843E97C9
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Aug 2022 14:15:08 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27JL7UDx017572;
        Fri, 19 Aug 2022 21:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=heCEgxBj6Iarwlr6TWXPY0VMr9yIoi8EzYHN1otGpuI=;
 b=CYcdgA2dmPDbE5iUeUaIZO1KhQKhivbct17v5IdeJwfShKPry72DB50560cZ0wDT5Aop
 +BVxOEMN0kvJCSZlKwunObKiw476K2DVJQUFyVjezF25v2QE9aujPZxZxhi/hY9zp7w+
 0+JBmGRicmvTRpkiujD2tIk/tzkodxXY2LjzJFN1LG39cpSXwN0wk6IjPMsXIFQEHA7o
 yimqGcdv2AzUr3E6Oz4X3oGTDEc6+2YTl4f4Jgdeyp5+XIXYrgA4dDUpdHdex42Pi4Fn
 Uo81SO++RkLWvGIfd7GfFN4teNDkyULsPvu+3lY7Xp8QCj+/i0l4sTbOaURuZTYLEJIW XQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j26jaj7wu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Aug 2022 21:15:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27JLF48Y003282
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Aug 2022 21:15:04 GMT
Received: from [10.110.11.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 19 Aug
 2022 14:15:03 -0700
Message-ID: <7836a353-de84-2ab6-ab50-79e3823dadcf@quicinc.com>
Date:   Fri, 19 Aug 2022 14:15:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3] bus: mhi: make mhi_controller_config::event_cfg const
Content-Language: en-US
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <quic_hemantk@quicinc.com>
CC:     <linux-arm-msm@vger.kernel.org>, <mhi@lists.linux.dev>
References: <20220819210230.17773-1-quic_jjohnson@quicinc.com>
 <a1ebfbbb-4231-49b2-cf13-8b25a1cd839d@quicinc.com>
From:   Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <a1ebfbbb-4231-49b2-cf13-8b25a1cd839d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kLnA_qTBm5EPXz2SgAZuw4WbRsLxw6YE
X-Proofpoint-GUID: kLnA_qTBm5EPXz2SgAZuw4WbRsLxw6YE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_12,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208190080
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/19/2022 2:08 PM, Jeffrey Hugo wrote:
> On 8/19/2022 3:02 PM, Jeff Johnson wrote:
>> Currently the event_cfg pointer in struct mhi_controller_config is not
>> defined as a const pointer. This prevents clients from registering a
>> read-only configuration unless they use a typecast. Since the
>> event_cfg should not be modified once registered, add the const
>> qualifier to event_cfg. This is aligned with the definition of ch_cfg.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
> 
> v3 and no changelog?

Rookie mistake :)
v1: only header file changed
v2: added SOB
v3: added pci_generic.c change
