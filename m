Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E62096A71BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 18:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbjCARCq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 12:02:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbjCARCo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 12:02:44 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F34C47418;
        Wed,  1 Mar 2023 09:02:39 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3217kDhk014147;
        Wed, 1 Mar 2023 17:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=B384LgDtTrqNPNRhEpsk4sVPPOaN7FSQzuXwrgZKxUo=;
 b=lXNZ82RW0z6zjsoCZbAAraJeBYbVosmca0+acVtC9/ezMl8Xna2UH04Jhr4/hTzcYV1w
 Sv6OI8/pKUGW1gxgJwi/sK2odc3z3K/VS6Qmb3xy7myddGadxC8Oen0e5EDpX+Ni9yaU
 qkeeHRtbikepa36NybrO9ULS0cyKP0CjgIv44kRBN4gVClzdjChvNGnZdC1DRWq8QxdK
 IsMghbC5166iK+KIsngxSBxiur/5bryZycg2WEfGIMTAduFZY0v4tAeOD8w9zMkadc64
 /uw2T9Rpin4E38a2zFCa8smJDkmFeUKb2z2DkZg8uAua7ZjI7sMunV1Vo8N4NEQ9azGo 0g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p1n0tkm4m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Mar 2023 17:02:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 321H2Vme023856
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 1 Mar 2023 17:02:31 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 1 Mar 2023
 09:02:30 -0800
Message-ID: <5ad7e2d4-6fc8-0879-7957-41b88fc43ce6@quicinc.com>
Date:   Wed, 1 Mar 2023 10:02:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 4/8] accel/qaic: Add control path
Content-Language: en-US
To:     Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
CC:     <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>,
        <jacek.lawrynowicz@linux.intel.com>, <quic_pkanojiy@quicinc.com>,
        <quic_carlv@quicinc.com>, <quic_ajitpals@quicinc.com>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-5-git-send-email-quic_jhugo@quicinc.com>
 <20230301131816.GC3815307@linux.intel.com>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230301131816.GC3815307@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lI_n8EVFVXJDqdot6EeVTWulhgk8SBgD
X-Proofpoint-GUID: lI_n8EVFVXJDqdot6EeVTWulhgk8SBgD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_13,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 mlxlogscore=827
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303010140
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/1/2023 6:18 AM, Stanislaw Gruszka wrote:
> On Mon, Feb 06, 2023 at 08:41:41AM -0700, Jeffrey Hugo wrote:
>> +	 * It turns out several of the iommu drivers don't combine adjacent
>> +	 * regions, which is really what we expect based on the description of
>> +	 * dma_map_sgtable(), so lets see if that can be done.  It makes our message
>> +	 * more efficent.
>> +	 */
> 
> Interesting ...
> 
>> +	last = sgt->sgl;
>> +	nents_dma = nents;
>> +	size = QAIC_MANAGE_EXT_MSG_LENGTH - msg_hdr_len - sizeof(*out_trans);
>> +	for_each_sgtable_sg(sgt, sg, i) {
>> +		if (sg_dma_address(last) + sg_dma_len(last) !=
>> +		    sg_dma_address(sg)) {
>> +			size -= sizeof(*asp);
>> +			/* Save 1K for possible follow-up transactions. */
>> +			if (size < SZ_1K) {
>> +				nents_dma = i;
>> +				break;
>> +			}
>> +		}
>> +		last = sg;
>> +	}
> 
> I would say there is reason why iommu do not combine or there is problem in iommu driver.
> If there is reason for not-combining this code is wrong.
> If problem is in iommu driver why not fixup iommu ?

So, previously, dma_map_sg was routed to the IOMMU drivers, and many of 
them did not optimize the mappings (looked like a choice of simplicity 
over best effort).  Looking at the details today, it looks like the 
DMA-API is handled by a common iommu driver, and it looks like it does 
the optimization after the IOMMU drivers do their mapping.

I'm going to recheck if this is used after that refactor, and if not, 
rip it out.

