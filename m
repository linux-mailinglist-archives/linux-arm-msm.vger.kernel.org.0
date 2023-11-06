Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A187E1D5F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 10:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbjKFJmH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 04:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbjKFJmG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 04:42:06 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060AEEA
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 01:42:03 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A69UmJm013204;
        Mon, 6 Nov 2023 09:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XG7DqSJeQJKx8MHCJ/YU4nBle4JN6M8SRLuC5oNFqfY=;
 b=gjxrt1lI6EhD3qioqaUb7hS79A1MAMfE9n0DJJSSM2bST7Jf3PDaeZq8hEc0zCtTZFV5
 ySFZnGz+V4nIW+8J48EE0bI82i30KiaQPR9qwAONczwLpculY062ohzOrUNBtDyFOhP7
 SNuVuur274O1fuEuwro0eQzgYV7XN2u/FKbMs/agbM+IYGxnbFN4AUHmP/+CpYqKSaR0
 VKGsgHHEe98TMV6zBv8h0JCenLlF54cZ0vLbhCkDXn96jqGokx7rQP8xcFDTaoY/VgZZ
 Ptn+DBzlBslkIxKo4s7tPc9cY7QEr9AsuwnxzQCWOZkZDdCUUyJXS2nwA73IByU/HdEj jA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u5eg3uptj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Nov 2023 09:41:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A69ffCj014306
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 6 Nov 2023 09:41:41 GMT
Received: from [10.214.66.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 6 Nov
 2023 01:41:38 -0800
Message-ID: <67518705-cfc2-4ae0-9cd2-0c33146cf48b@quicinc.com>
Date:   Mon, 6 Nov 2023 15:11:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] phy: qcom-qmp-combo: correct sm8550 PHY
 programming
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>
References: <20230911203842.778411-1-dmitry.baryshkov@linaro.org>
 <aabb8345-7b5d-447d-af79-1e5743465315@quicinc.com>
 <CAA8EJpoQ0k_4GSQyrziLYn1v942ppzNOvwxN55sLkZUUDWLe4w@mail.gmail.com>
From:   Rohit Agarwal <quic_rohiagar@quicinc.com>
In-Reply-To: <CAA8EJpoQ0k_4GSQyrziLYn1v942ppzNOvwxN55sLkZUUDWLe4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SukmHfoCTb3zIWss7OKtOICtkaZZR5wX
X-Proofpoint-ORIG-GUID: SukmHfoCTb3zIWss7OKtOICtkaZZR5wX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_07,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=414 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311060082
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/6/2023 3:07 PM, Dmitry Baryshkov wrote:
> Hi Rohit,
>
> On Mon, 6 Nov 2023 at 08:46, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
>>
>> On 9/12/2023 2:08 AM, Dmitry Baryshkov wrote:
>>> Fix several small issues with the QMP USB+DP PHY programming on the
>>> Qualcomm SM8550 platform.
>> Hi Dmitry,
>>
>> Can we have a conclusion on this series?
> Yes. Version 3 of this series was accepted by Vinod:
>
> https://lore.kernel.org/linux-arm-msm/169719381727.165658.9377101716537787206.b4-ty@kernel.org/
Thanks for the update!!!.

Thanks,
Rohit.
>
>> The USB support series [1] for
>> SDX75 depends on it.
>> [1]
>> https://lore.kernel.org/all/1695359525-4548-1-git-send-email-quic_rohiagar@quicinc.com/
>
