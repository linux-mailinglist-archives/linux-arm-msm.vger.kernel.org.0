Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4347E0537
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Nov 2023 16:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbjKCPCv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 11:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbjKCPCu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 11:02:50 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D278BD55
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 08:02:40 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A3Cx5YU004204;
        Fri, 3 Nov 2023 15:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=09GQcEKHjDsKrItqZTo4C9CPd4HpuD7WEFjXGdy+A8k=;
 b=RZ3prD7BawWpSAvkeGrwUX0X2+I3KP6cxyfFBtYT8+TFUevRuLekeWulMM2/SH2cxgn1
 9G6HUO9YCyPbWT53U9IXRcedEngs/MdfF+BluuElT3HQ+v9TMwns8h5qGwxYEDuRQ2eP
 /uHWI+sSDJuFT3TJSK7H0PUunVwEyyZnAYeltc/IRz6dXYQ0cn6vxHbUq72/YpIv6usu
 4UBa4Apxe4DL3kHlzGlboS/RLJO/nrBaypCJKMKRdqBjl4ciRFT42y758C3mFegPSihn
 F3aaz901VPHjaz54iUMNxXdrxnxdkog6ec10zA665RnmdkumEESw2g27yeZuU8SDVfjQ fA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u4yk0rfk9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Nov 2023 15:02:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A3F2KqT001997
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 3 Nov 2023 15:02:20 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 3 Nov
 2023 08:02:19 -0700
Message-ID: <317ff41e-f19d-5f46-52f7-ca40b1026176@quicinc.com>
Date:   Fri, 3 Nov 2023 09:02:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Quiet array bounds check on DMA abort message
Content-Language: en-US
To:     <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        "kernel test robot" <lkp@intel.com>
References: <20231027180810.4873-1-quic_jhugo@quicinc.com>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231027180810.4873-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FVeENaWMQWnMHc5Niw-PF7NiDOqxtwU4
X-Proofpoint-GUID: FVeENaWMQWnMHc5Niw-PF7NiDOqxtwU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_14,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxlogscore=937 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311030127
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/27/2023 12:08 PM, Jeffrey Hugo wrote:
> From: Carl Vanderlip <quic_carlv@quicinc.com>
> 
> Current wrapper is right-sized to the message being transferred;
> however, this is smaller than the structure defining message wrappers
> since the trailing element is a union of message/transfer headers of
> various sizes (8 and 32 bytes on 32-bit system where issue was
> reported). Using the smaller header with a small message
> (wire_trans_dma_xfer is 24 bytes including header) ends up being smaller
> than a wrapper with the larger header. There are no accesses outside of
> the defined size, however they are possible if the larger union member
> is referenced.
> 
> Abort messages are outside of hot-path and changing the wrapper struct
> would require a larger rewrite, so having the memory allocated to the
> message be 8 bytes too big is acceptable.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310182253.bcb9JcyJ-lkp@intel.com/
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Pushed to drm-misc-next

-Jeff
