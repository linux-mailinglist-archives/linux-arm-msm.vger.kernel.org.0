Return-Path: <linux-arm-msm+bounces-1000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 683D27EF743
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 18:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98C241C20834
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 17:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A293C3A8D1;
	Fri, 17 Nov 2023 17:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mqWoj63s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC43A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 09:49:53 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AHEjqsL023140;
	Fri, 17 Nov 2023 17:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eI+9MtSNRjFcCd5vkGmHjvo8Ak2PAE40uynj0L+LhWA=;
 b=mqWoj63s+B7yjKPTiNOFAHGwPHIxw3qET9EdgmAwZPVsnhnVE7rGv+GEH59FimTK9eHI
 NflcWcFut8GznAQSbIKDy8mFiYS24HYOEzkDKk5sOd8WVS+gb5qphrji1KkxossWgC6d
 ewmE7ffkMCrHmXJsdqke6x/6XD1pcariw7zRX0T+oMnVUqq+mcCUz1rnli4/a1h5V/fd
 MRPPVGFyU+ipiiAEvQw4cTHGPsEV/yrjJS4dlnLk3XzgASOXx9QImPw+FHJYmowuCl5H
 UAxaof57ZUXLsP97GBs9iu0uWy5LU/EvLG6oXCquRdrgM2Ciz0hRw1dcLQIvdmphrGg/ VA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ue6x18tn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 17:49:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AHHnjnf028561
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 17:49:45 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 17 Nov
 2023 09:49:45 -0800
Message-ID: <6e153123-7367-6825-9a97-b600300ff288@quicinc.com>
Date: Fri, 17 Nov 2023 10:49:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Update MAX_ORDER use to be inclusive
Content-Language: en-US
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20231103153302.20642-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231103153302.20642-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: z-F4pTQi3YicqsqIVYdwtgJ8oVGKeyxr
X-Proofpoint-GUID: z-F4pTQi3YicqsqIVYdwtgJ8oVGKeyxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_16,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170133

On 11/3/2023 9:33 AM, Jeffrey Hugo wrote:
> MAX_ORDER was redefined so that valid allocations to the page allocator
> are in the range of 0..MAX_ORDER, inclusive in the commit
> 23baf831a32c ("mm, treewide: redefine MAX_ORDER sanely").
> 
> We are treating MAX_ORDER as an exclusive value, and thus could be
> requesting larger allocations.  Update our use to match the redefinition
> of MAX_ORDER.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>

Applied to drm-misc-next

-Jeff

