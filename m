Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAEC74F740
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 19:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbjGKRdk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 13:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbjGKRdj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 13:33:39 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF462133;
        Tue, 11 Jul 2023 10:33:38 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36BHOVtn013908;
        Tue, 11 Jul 2023 17:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=z7T5oV2DSUOFNxiqNqHYOl+TjOXCp7JIjpEtX1OTqqc=;
 b=FQX9VR/ND/opMw9sn20u3e/ScqmCrG22fLoySjY/Al8wGnez0DSnx3tokepGIdT+VI4S
 uc0j7iw3aBplIL59iKQXuDKCv+lvTvQlE0xxGy7SfbG9lRh4gUsNWt/SQwJuwlLZ2VNV
 sI8vYg0UOw3QksKZhCHU2lL1WpDNRVw0tgeDNqaVn/MXA+oUHIAz6Z4ylFZy/xfeH3Ss
 j6rZmrLny7ehN06GJit9AIS3bqonbafAmqPg57ybD4sqByXMc5PLD0T55gKfycF7N0eb
 8k84OrV/9iX20aA0BgVWqHH+w7yCu++2y1URmeZZJSz8JYsies8rj9/HitugzGV2hYJe Gg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rsben80u3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Jul 2023 17:33:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36BHXWl6001819
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Jul 2023 17:33:32 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 11 Jul
 2023 10:33:31 -0700
Message-ID: <0919d2f7-dbb3-2e8b-adb7-f836b21e6482@quicinc.com>
Date:   Tue, 11 Jul 2023 11:33:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/5 v4] accel/qaic: Improve bounds checking in
 encode/decode
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <kernel-janitors@vger.kernel.org>
References: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ex0lXBaBMBx5IRz3bO-EgbtPMoALOYQx
X-Proofpoint-ORIG-GUID: ex0lXBaBMBx5IRz3bO-EgbtPMoALOYQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_10,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=528
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110157
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/11/2023 2:20 AM, Dan Carpenter wrote:
> Fixed in v4: Send the correct [PATCH 1/5] patch.
> 
> Fixed in v3: Redo messed up threading
> 
> Fixed two things in v2:  Include the <linux/overflow.h> file.  Change
> the >= in encode and decode to >.
> 
> regards,
> dan carpenter

Did you intentionally drop tags from previous versions?

For 1-3, 5
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Looks like 3,5 are reviewed by Pranjal and also good. I see 5 is also 
reviewed by Dafna.  Expect those to be merged.  1,2 need a review from 
Pranjal, but I expect all is good and will be merged.

I did not see feedback on my question for 4.  Would like your feedback 
before queuing that one up.

Overall, thanks for your work.  I think we are pretty close to wrapping 
this up.

-Jeff
