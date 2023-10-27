Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5249E7D9DDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Oct 2023 18:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbjJ0QTu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 12:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbjJ0QTu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 12:19:50 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CD5106
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 09:19:48 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39RF2DtG026778;
        Fri, 27 Oct 2023 16:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+65s+TLTQHcXQHIJuH5za54yBEVt6lyig0nLzB7//0A=;
 b=fBufskL7u9jbdezCNLRp+uh8gkN04pkE+mLMonM3qcDGJW3ZXKHpa0+e4ehqoHE9XYiN
 90KuxsKgzl7/IobIS1Mx8aKpAeOqa1nwkg7/f6f4TQWxAP/I6RVax+CkBigFZUr7r8+q
 rr0pPf72GgaHjAY1yclxr0/1fXmpBMA4JWb7trUXOr5xfumiNjIJAcap4xNauAhtiqbd
 6B/gYtk1w8RHrEeMMkE3ocSOEF0Rdy8hEkpF1nQJ+ECKXJSX5K/WUBFrdbTTTtJkW1nv
 gaIN0zYFO6ggim8V4GvWSDz7H9DrAU2MafKdba1PTNxTILIAg/WAXnI85P93QlJfT4Zu 4A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tyx3uah88-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Oct 2023 16:19:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39RGIpLf015338
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Oct 2023 16:18:51 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 27 Oct
 2023 09:18:50 -0700
Message-ID: <fc10a575-0bab-b25b-07f8-e5b8724bf252@quicinc.com>
Date:   Fri, 27 Oct 2023 10:18:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 0/2] accel/qaic: Add support for host/device timesync
Content-Language: en-US
To:     <quic_ajitpals@quicinc.com>, <quic_carlv@quicinc.com>,
        <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
        <ogabbay@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20231016170114.5446-1-quic_jhugo@quicinc.com>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231016170114.5446-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uQQ-2wHpBNcJ80QhjL9rHLbUKqFG2NPE
X-Proofpoint-GUID: uQQ-2wHpBNcJ80QhjL9rHLbUKqFG2NPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_15,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310270141
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/16/2023 11:01 AM, Jeffrey Hugo wrote:
> AIC100 supports a timesync mechanism that allows AIC100 to timestamp
> device logs with a host based time. This becomes useful for putting host
> logs in a unified timeline with device logs for debugging and performance
> profiling. The mechanism consists of a boot-time initialization and a
> runtime perodic resync to counteract the effects of time source drift
> over time between the host and device.
> 
> v2:
> - Fix readq usage on 32-bit powerpc
> - Fix doc warning due to trailing "_"
> 
> Ajit Pal Singh (1):
>    accel/qaic: Add support for periodic timesync
> 
> Pranjal Ramajor Asha Kanojiya (1):
>    accel/qaic: Support MHI QAIC_TIMESYNC channel
> 
>   Documentation/accel/qaic/aic100.rst |   6 +-
>   Documentation/accel/qaic/qaic.rst   |   5 +
>   drivers/accel/qaic/Makefile         |   3 +-
>   drivers/accel/qaic/mhi_controller.c |  36 ++-
>   drivers/accel/qaic/qaic.h           |   4 +
>   drivers/accel/qaic/qaic_drv.c       |  17 ++
>   drivers/accel/qaic/qaic_timesync.c  | 395 ++++++++++++++++++++++++++++
>   drivers/accel/qaic/qaic_timesync.h  |  11 +
>   8 files changed, 473 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/accel/qaic/qaic_timesync.c
>   create mode 100644 drivers/accel/qaic/qaic_timesync.h
> 

Pushed to drm-misc-next
