Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E34617A2284
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 17:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233963AbjIOPgo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 11:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236163AbjIOPgT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 11:36:19 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18BCE6A
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 08:36:13 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38FD5fgs010932;
        Fri, 15 Sep 2023 15:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=//QBrf3RuwpRYUZBA/EpAD1PbEHaiVhCrFfFXQ94wp0=;
 b=YWMUxZ5HuK1sW619wJSAZnC+IO171/134ly0klObd4su6QL+mBVGq8zy2Ke/SbEgjEEk
 HkT32ju7apQ8IxIitlSfTWXtAL7lqkMXldBDasEVLg2Hde/VGsYazs7is8ML2zqv1Nt5
 LFEuVekn9P51Eh7FTRr2zQdNu47TBcXYfltV56JTzSB+OYk1dck9ZVIL8q14qtzsf25T
 p+75lbg9gjjd+HtnQ7AsTBs04uxwWWMOVmGQuHeRWBySHZDgnYjFrY4NRiDAfHD/iT8G
 Xybw4Eeso9TQz4Tu4PGABjCelkgCremqhVvsXpF/ooKOotv8UfcNCOYRU8TXQt7TTMXW Sg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4f6v1mqs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 15:36:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FFa95v019896
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 15:36:09 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 08:36:08 -0700
Message-ID: <d1c41779-bcdb-9633-4372-9589e7ccbf1b@quicinc.com>
Date:   Fri, 15 Sep 2023 09:36:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Use devm_drm_dev_alloc() instead of
 drm_dev_alloc()
Content-Language: en-US
To:     Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
CC:     <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <ogabbay@kernel.org>,
        <dri-devel@lists.freedesktop.org>
References: <20230901161236.8371-1-quic_jhugo@quicinc.com>
 <20230904092855.GC184247@linux.intel.com>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230904092855.GC184247@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZpVx7sKG7y9ZDFpXe-CPZIWXXnEROu75
X-Proofpoint-ORIG-GUID: ZpVx7sKG7y9ZDFpXe-CPZIWXXnEROu75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_12,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=963 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150139
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/4/2023 3:28 AM, Stanislaw Gruszka wrote:
> On Fri, Sep 01, 2023 at 10:12:36AM -0600, Jeffrey Hugo wrote:
>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>
>> Since drm_dev_alloc() is deprecated it is recommended to use
>> devm_drm_dev_alloc() instead. Update the driver to start using
>> devm_drm_dev_alloc().
>>
>> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> +	/*
>> +	 * drm_dev_unregister() sets the driver data to NULL and
>> +	 * drm_dev_register() does not update the driver data. During a SOC
>> +	 * reset drm dev is unregistered and registered again leaving the
>> +	 * driver data to NULL.
>> +	 */
>> +	dev_set_drvdata(to_accel_kdev(qddev), drm->accel);
> 
> Yeah, explicitly nullified in drm_minor_unregister() with ' /* safety belt */
> comment. I think in long term goal would be device reset not require
> unregister/register.

Having a look at that.  It does tweak some of the semantics.  Would be 
nice on the driver side though.

-Jeff
