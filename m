Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01EDA737687
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 23:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbjFTVRn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 17:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjFTVRl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 17:17:41 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16E71BCD
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 14:17:26 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35KKcEFB003231;
        Tue, 20 Jun 2023 21:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Y2+lOJFBzxAOHDSRZYpegeJjNKdxdYBF68Ffd3zqxI0=;
 b=gjwk7MBcviMTfo5Xjl7Kx0KBV/uVw4+mRrz85sWTX1rVfKj+4ASHLuoYo7jHt1kkBojd
 UILtMKymPKIhe+tHNaRrFwTiY9fVVKRhNWRFwFNtPDDH/72HNII3whSkp/O88tZt70wG
 fn/+a3Gd/2vpHbGvPsAWoBBym534gtIwKRxhb80gdaZwFrujqZGgfY6FZgsps5xV8RNx
 BMqgTdb+G5XFARE2nGnNQqoxEOd++OpwOpkWAEwBkzO83w4nKJ9j/9fdnhSdx5V0mzuK
 S4fGj0hoQeMPeLdcCNKB36ngEALD1TwFOX9us4yDCPsIBQDsWw8GCoIyqeJkFc8W3aL8 RQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rb1dtjhkk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Jun 2023 21:17:10 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35KLH95r009334
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Jun 2023 21:17:09 GMT
Received: from [10.110.24.68] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 20 Jun
 2023 14:17:08 -0700
Message-ID: <07ad7dd7-cb2f-d838-722b-022cfd7b31d6@quicinc.com>
Date:   Tue, 20 Jun 2023 14:17:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 16/20] arm64: enable Permission Indirection Extension
 (PIE)
To:     Marc Zyngier <maz@kernel.org>, <neil.armstrong@linaro.org>
CC:     Joey Gouly <joey.gouly@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <andersson@kernel.org>, <nd@arm.com>,
        <broonie@kernel.org>, <catalin.marinas@arm.com>,
        <james.morse@arm.com>, <mark.rutland@arm.com>,
        <oliver.upton@linux.dev>, <shuah@kernel.org>,
        <suzuki.poulose@arm.com>, <will@kernel.org>,
        <yuzenghui@huawei.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>
References: <20230606145859.697944-1-joey.gouly@arm.com>
 <20230606145859.697944-17-joey.gouly@arm.com>
 <c3598e8e-46a5-c8d6-bf9f-9fb8f6cd346e@linaro.org>
 <1c70fa1065b313d314707f22386972e3@kernel.org>
Content-Language: en-US
From:   Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <1c70fa1065b313d314707f22386972e3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: W_faszSL6xEEK9vmva9lHiOVLgqIRB3q
X-Proofpoint-GUID: W_faszSL6xEEK9vmva9lHiOVLgqIRB3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_16,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=845 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306200192
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/20/2023 1:35 PM, Marc Zyngier wrote:
> On 2023-06-20 20:16, Neil Armstrong wrote:
>> Hi Joey,
>>
>> On 06/06/2023 16:58, Joey Gouly wrote:
>>> Now that the necessary changes have been made, set the Permission 
>>> Indirection
>>> registers and enable the Permission Indirection Extension.
>>>
>>> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>>
>> This patch on linux-next causes a great amount of:
>>
>> X     xxx.xxxxxx Emulated RAZ for ID register: ISS 0x36002f
>>
>> messages printed by the system firmware on the Qualcomm SM8550 SoC,
>> and the platform is barely usable.
> 
> As others have said on this thread, this is a firmware bug.
> Not a lot we can do about that, unfortunately, apart from hiding
> the new feature behind a config option that you'd disable on this
> platform.
> 
> Alternatively, disabling idle management on this machine should
> reduce the screaming greatly.

I have informed Carl about the Gunyah messaging, I have also added him 
into this thread.

---Trilok Soni
