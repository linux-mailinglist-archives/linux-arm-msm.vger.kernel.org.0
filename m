Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC61965F17D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 17:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234381AbjAEQzG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 11:55:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233450AbjAEQzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 11:55:05 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C00116A;
        Thu,  5 Jan 2023 08:55:04 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 305DeJvU002378;
        Thu, 5 Jan 2023 16:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=vI1DI2KQ0Fsy5vRXDrM4CuiG31w3dqMxsCH8s4bZ8wM=;
 b=WTapoAEua72mia4DR68/ZxNVe/ofN1Y8WDqizuaPPILaBq2yRWoYcXn0f+w6/nIW+FA5
 sbmHXg4swodKd/9R1ht4EIPPNrYyPofAANnhChDw13PrwFlqxp2jhiGMuVS1Ne+UOGfJ
 Nx5gVpkPuv6JRnJtquuHtN4RJknVmxo45NoEmxyDpkeH76VbYar94ARH0oBNwAx4hKgb
 IC4aqgPCeqpDkd5YpjbYTF2wVhTyuz4py3/3Ao3Yw5DdZreDmUyXPpm+FTf7wjRGk65Z
 Flsh0G/djglqEY3DkOIthEmxvh8ElHaRerJGb5d0T9qdrBDlSfbMHUYXAR94Viltb6Je Aw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwvapgqbd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Jan 2023 16:54:40 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 305Gsd42022343
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 5 Jan 2023 16:54:39 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 5 Jan 2023 08:54:39 -0800
Date:   Thu, 5 Jan 2023 08:54:39 -0800
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
CC:     <quic_cang@quicinc.com>, <linux-scsi@vger.kernel.org>,
        <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
        <stanley.chu@mediatek.com>, <eddie.huang@mediatek.com>,
        <daejun7.park@samsung.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v11 00/16] Add Multi Circular Queue Support
Message-ID: <20230105165438.GC8114@asutoshd-linux1.qualcomm.com>
References: <cover.1670541363.git.quic_asutoshd@quicinc.com>
 <yq1mt744jj7.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <yq1mt744jj7.fsf@ca-mkp.ca.oracle.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N2aQ9zzB_dkeRLX037ZzCJMM2cIouQk6
X-Proofpoint-ORIG-GUID: N2aQ9zzB_dkeRLX037ZzCJMM2cIouQk6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_07,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 mlxscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxlogscore=762 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301050133
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 30 2022 at 14:25 -0800, Martin K. Petersen wrote:
>
>Asutosh,
>
>> This patch series is an implementation of UFS Multi-Circular Queue.
>> Please consider this series for next merge window.  This
>> implementation has been verified on a Qualcomm & MediaTek platform.
>
>I'll push my 6.3 staging tree shortly. Please rebase, there are a bunch
>of conflicts.
>
Hello Martin
Rebased and pushed v12. Please take a look.

Thanks
-asd

