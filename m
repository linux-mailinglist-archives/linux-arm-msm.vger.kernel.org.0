Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83506743DE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 16:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232619AbjF3Ou7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 10:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbjF3Ouu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 10:50:50 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4363C07;
        Fri, 30 Jun 2023 07:50:35 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35UBpQcj008259;
        Fri, 30 Jun 2023 14:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : from : to : subject : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=z34ldGIkvJN+LU33oC52RjayGRYgtShNojdkuc1CrLo=;
 b=gI8GWbYwRHUeVyWj0BgGoCSE/ZE0qcKrCmbP/kpmaYSzCMX6jQYISmpIOVXpExJrsVMg
 arQpNJQx5cz9b1v4y33UPpvkzHGZH5EHwvLcASgVDhexSibTgHWMZTQfAp2TSEOrtJhX
 bUn58VOvcvn9Vo1baezJg3229CnVw25xwOuWta9qg8vEQAXL/L4If6Z+ocFhgNuVJgpr
 AcXmiJuh5xJGwW6bixpbLLN2/rW4/nZZYu0Bc9pruH24OsJ3QfG8KcPdQB1R8S/hRY4Z
 b062V8MT7nQ0Ot7IW06u3Cz7QkUDD1l+Ep0CEaLIjk1NAw4Er6zmGOv02L/HYBfOIgPY kw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rhnt0sg8p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jun 2023 14:50:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35UEoXbi019774
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jun 2023 14:50:33 GMT
Received: from [10.216.18.214] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Fri, 30 Jun
 2023 07:50:32 -0700
Message-ID: <fc857213-7b83-ed77-e0b7-0be49444b387@quicinc.com>
Date:   Fri, 30 Jun 2023 20:20:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
From:   Kathiravan T <quic_kathirav@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Guidance on removing the clock entries from IPQ9574 / IPQ5332 GCC
 driver
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MKiJ17iydwkMXj04A86nd2C0aCtI4Sjw
X-Proofpoint-ORIG-GUID: MKiJ17iydwkMXj04A86nd2C0aCtI4Sjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_05,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 mlxlogscore=641
 spamscore=0 clxscore=1011 impostorscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300124
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn, Konard, Stephen Boyd, all,

For IPQ5332 and IPQ9574 platforms, we wanted to remove some of the 
clocks, namely the WCSS, Q6 and MEM_NOC clocks due to the recent changes 
in the design. I just wanted to know how to proceed with dropping these 
clocks from the driver and binding.

Is it okay to just drop the clock entries from the driver and leave the 
binding untouched to keep the ABI compatibility or should I remove the 
entries from both driver and binding, so that no other drivers will not 
include those clocks by mistake?

Request your guidance on the same.

Thanks,

Kathiravan T.

