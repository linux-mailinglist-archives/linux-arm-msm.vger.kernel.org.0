Return-Path: <linux-arm-msm+bounces-69649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF36FB2B7BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 05:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A9213B8D4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 03:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E8324E4AF;
	Tue, 19 Aug 2025 03:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LwFrj8ny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869551D88B4;
	Tue, 19 Aug 2025 03:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755574688; cv=none; b=aOUrAPSLt1jX0LG03WO5hUr1SvR4EEqf4NkPujCfgCssn/v05NsgYBzoP4pP3DNNJlAHCB6dgTxCU8gRo87G7ey4jfNXjUZ2ogN91IhxSR3YMrzUhAKlwPX2G3CCmga7KNcwYFh7Lupl37I0X/U/DhsUFJvE+FihilNZ7s/KBY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755574688; c=relaxed/simple;
	bh=FgKb3OsWtXPTfdRuS/8qmk5do1nvaI5xsBSzwUj2oBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ANKkvDsnAs85fVqu2RvM6XfTP3qpO9eMeZzLBj4FJx4CuLqezFhWEG8tVgy+qY53kgR4Ais2Pd3kmW2DiwUYf4dQbK+nmDWNppLO9h96+DqMJdr34PV6A1QfxVQ7chtkOhFC9YAJMLXP7Yn4L6TUbrABB9MqClK9Y/3d2Fo3wzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LwFrj8ny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2XOg3025437;
	Tue, 19 Aug 2025 03:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIWKnzTpY0HBjNQvH30+ojgaXG40mR0nsxqhjgtdjA8=; b=LwFrj8ny2TdXPuh1
	H+vcNgawSxI7VplOSzitdViIyZWv8jOeq6bcddzAIQNCPP4BCC01vsDzxW07lzmH
	WWYOgqXM3whxoJEUGo05YvbTHB6L/TsTl40ddPjEzXfc5DgwwSvGc9/ErkuvzbkO
	dEx4FaT9Q3BXTmUIx7oZk5mikpAE/RQdC8B4UAV3RwOeRdNFdjw1p6bJT0G99mX7
	eZoSvA7OenzM3thTnJ+0y64roStm0UKw4FHzHx52hgfFHcCyGDBrCWCdf7rRzkIf
	HkvVkcEi+Y5OsbBUEEKgzIIUO5jU7B1PCkHD7Dfc2hkRT5/Zyzv9c6IMP/g2IJIG
	eySSVw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71chrkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 03:38:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57J3c5KT015088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 03:38:05 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 18 Aug
 2025 20:38:03 -0700
Message-ID: <11d06cd6-60d3-44fa-94d1-7917adaa0230@quicinc.com>
Date: Tue, 19 Aug 2025 11:38:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] driver: bluetooth: hci_qca: fix host IBS state
 after SSR
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bt@quicinc.com>
References: <20250814124704.2531811-1-quic_shuaz@quicinc.com>
 <20250814124704.2531811-3-quic_shuaz@quicinc.com>
 <ndgufkvb7gkqeco45xlru2x5ai335s3vhx6wso7pksqcyfdjll@azfjjboa7bc4>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <ndgufkvb7gkqeco45xlru2x5ai335s3vhx6wso7pksqcyfdjll@azfjjboa7bc4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iTOzWrOsStNpWMc5UJ-XajABnetDr_Uw
X-Proofpoint-GUID: iTOzWrOsStNpWMc5UJ-XajABnetDr_Uw
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a3f19d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=gAjkoLQkR5Zn5Q47fV8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX5MScGlRP/hC/
 mXlGdhdE6AMiRafKLOzQSiZv/xyTsUKmoy6cpj6qXcGrho8RDnopsskx4QkdRoa5VupTOk/kwCs
 3wJbGLnKlpdzHh+gyhflmg26WgiwU21fHngb0R71PtcMTUMT10ygXPvcF3av7JA02NdP88+C03p
 RJrTRdPKRSeEXxxxs0TqoP8QJtsyKTDZ+MyftvyWAtXNTuyxeAnBoMr85mPPiWKhRHy44sOv0RQ
 bcnJT8t/GuKqY+BmCQpnAG9LtBkLZLLlsS1ninvWjp0TxV9SGHNB/hQyFp5JQYrn6cCQa0Gl+qS
 Dbwv+DZowjbR4daD9nCXQpRw4UgxFSZvJuU5rkjWelf1M+RMzsI8MlbeiHhFj6+9C+mmCBNW945
 +N7/zb6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147

Hi Dmitry 

On 8/16/2025 5:50 AM, Dmitry Baryshkov wrote:
> On Thu, Aug 14, 2025 at 08:47:02PM +0800, Shuai Zhang wrote:
>> After SSR, host will not download the firmware, causing
>> controller to remain in the IBS_WAKE state. Host needs
>> to synchronize with the controller to maintain proper operation.
> 
> It totally feels like all these patches fix the same issue and should be
> squashed together. Please also add a sensible Fixes: tag. Possibly
> add cc:stable too.

Although these issues are all related to SSR, the underlying causes of the
errors are different. Would it be appropriate to merge them into one patch?

> 
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>  drivers/bluetooth/hci_qca.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 91009c6a7..d37cd2368 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1660,10 +1660,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>  	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
>>  	 * command timeout.
>>  	 * Add an msleep delay to ensure controller completes the SSR process.
>> +	 *
>> +	 * Host will not download the firmware after SSR, controller to remain
>> +	 * in the IBS_WAKE state, and the host needs to synchronize with it
>>  	 */
>>  	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>>  		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>>  		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>> +		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
>>  		msleep(50);
>>  	}
>>  
>> -- 
>> 2.34.1
>>
> 

BR,
Shuai

