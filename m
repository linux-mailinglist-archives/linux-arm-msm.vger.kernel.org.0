Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28CA674028C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 19:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbjF0Rrz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 13:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbjF0Rrt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 13:47:49 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D200272D;
        Tue, 27 Jun 2023 10:47:48 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35RDnsBi028806;
        Tue, 27 Jun 2023 17:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cYQmnZv/Cl41q2rKNXtecqwirgwHkJYw3zbiXE3eNmE=;
 b=WSQXsW2L3kE1JOkjeZlYdVxtaoVjxrkzApxBhiKzGUiBlNGikfWye2yS4xrFppUkSiNy
 kVU3oMmhDzvjzHEQqspbNfgaWhEdLLfXWasNVEL4c6gG6KpyFAzu4iQDzdj6tfUtkFHO
 QFtFPBB8Vq6JQJZVIQ2Qq95RsJW9BePZdmPIGeeKiYfj4RMPTD3LJodx0F3rQ4tCwKgp
 LUTNtZbt7lVt2F5h0DH8jjBuYM4iqRilmKUYdzimtSSETg8XnmwedT4vqBM/llV45roN
 GSeG26GHSPzfPgiD1m2sgf+5q8jub8qaUGDZwsjMlvw5orHujnPRqnr3b/Jsd37Zg68I VQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rfcvtu5f6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 27 Jun 2023 17:47:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35RHlhlm006596
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 27 Jun 2023 17:47:43 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 27 Jun
 2023 10:47:43 -0700
Message-ID: <682ec499-ca01-51fe-340b-f5534599cc83@quicinc.com>
Date:   Tue, 27 Jun 2023 11:47:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] dt-bindings: clock: qcom: Update my email address
Content-Language: en-US
To:     Taniya Das <quic_tdas@quicinc.com>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mturquette@baylibre.com>, <robh+dt@kernel.org>, <sboyd@kernel.org>
References: <20230627173123.9221-1-quic_tdas@quicinc.com>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230627173123.9221-1-quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bQVrNmu43njXJipJvvClg3f1gKb5Qkiq
X-Proofpoint-GUID: bQVrNmu43njXJipJvvClg3f1gKb5Qkiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_12,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 malwarescore=0 priorityscore=1501 mlxscore=0 mlxlogscore=503 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306270161
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/27/2023 11:31 AM, Taniya Das wrote:
> Update my email address from the defunct codeaurora.org domain to the
> current quicinc.com domain.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
