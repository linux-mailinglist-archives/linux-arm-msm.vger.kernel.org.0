Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 613A17C4FE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 12:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbjJKKSA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 06:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbjJKKR7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 06:17:59 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2964592;
        Wed, 11 Oct 2023 03:17:58 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B5pEVH012416;
        Wed, 11 Oct 2023 10:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : to : from : subject : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=7eNL33mKoqTiLtcr0W1Yjo3k+nMvanQo5/8WLcWHPJU=;
 b=KyWrKA7JFEcg/16ewmvd7joO6GQkx5y4BGhFvsqCh8RiMkQ64lpcDorpsbTd1bHmJHN/
 2+7oz4JfUwiVin8kwsQvZyTmGDfcAZDA+Kv6nCEGZiES/NfpaIQU66sbiubMnslHoeK4
 Munz0bY/c4CCGeL0Ns8uAThfQBQXghpnKB7ggfBd4w9DAudaZDog3L5JJHexnF56OwbL
 TxhG+nTCVBZnZRgcEV5H3apxtPlhxEDIyQ+zClwNd5xY4pNHUSGzs/5fB+AxhxyDASNh
 kpuws5M2RlGxJds/RtquuwlbW7ShgQ41FVGr5MqZhfXHcx9EzArDRveGbrBhzt0h4O+U Xg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tnkwngrg0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Oct 2023 10:17:56 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39BAHtM2009457
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Oct 2023 10:17:55 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 11 Oct
 2023 03:17:54 -0700
Message-ID: <fc4189f4-8907-8a08-d7be-ffcb2425940a@quicinc.com>
Date:   Wed, 11 Oct 2023 18:17:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
From:   Ziqi Chen <quic_ziqichen@quicinc.com>
Subject: Does the branch 6.1 6.2 6.3 and 6.4 still accept bug fix now
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iBd6bSg0gdkRAYsSK0jQeYSJpmZMB-Xr
X-Proofpoint-GUID: iBd6bSg0gdkRAYsSK0jQeYSJpmZMB-Xr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_07,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=729
 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110090
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dear maintainers,

on the branch before 6.5, There is race condition between UFS clock 
scaling and ufshcd_ungate_work() would cause that host_self_block 
mismatch to scsi_block_reqs_cnt.

Case 1:

UFS driver didn’t call ufshcd_hold() before calling 
ufshcd_scsi_block_requests() from devfreq_monitor path:

--> Race condition happened between ufshcd_clock_scaling_prepare () and 
ufshcd_ungate_work().

--> host_self_blocked was not set to 1 after ufshcd_clock_scaling_prepare().

--> Requests keep being dispatched to UFS driver and be sent out after 
entering H8.



Case 2:

UFS driver has called  ufshcd_hold() before calling 
ufshcd_scsi_block_requests() from ufs calkscal enable/disable sysfs path:

--> The  ufshcd_ungate_work()  was running and already set UIC link 
status to ACTIVE before the ufshcd_hold() be invoked.

--> The ufshcd_hold() would not flush ufshcd_ungate_work() if  the link 
status already been set to ACTIVE.

--> Race condition happened between ufshcd_clock_scaling_prepare () and 
ufshcd_ungate_work().

--> host_self_blocked was not set to 1 after ufshcd_clock_scaling_prepare().

--> Requests keep being dispatched to UFS driver and be sent out after 
entering H8.


Since branch 6.5 , we would not see this issue as the 
ufshcd_scsi_block/unblock_requests() has been removed from ufshcd_hold() 
and ufshcd_ungate_work due to below commit.

So can we know if the branch 6.1 6.2 6.3 and 6.4 accept bug fix now?



scsi: ufs: Ungate the clock synchronously

Ungating the clock asynchronously causes ufshcd_queuecommand() to return
SCSI_MLQUEUE_HOST_BUSY and hence causes commands to be requeued.  This is
suboptimal. Allow ufshcd_queuecommand() to sleep such that clock ungating
does not trigger command requeuing. Remove the ufshcd_scsi_block_requests()
and ufshcd_scsi_unblock_requests() calls because these are no longer
needed. The flush_work(&hba->clk_gating.ungate_work) call is sufficient to
make the SCSI core wait for clock ungating to complete.



Best Regards,
Ziqi
