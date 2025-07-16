Return-Path: <linux-arm-msm+bounces-65134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD485B06D47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 07:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBC573B7A61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 05:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEA12E7199;
	Wed, 16 Jul 2025 05:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QNuKN/kl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A711720C00C;
	Wed, 16 Jul 2025 05:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752644249; cv=none; b=WLgfxbPKoJj9CMakgmsyrqm9LJOHWTMQRrIFEPnQUl2KIYMYjcOer9j7ZgKEVb2OuvwNucerHjrcYYI3fqN4SVsm+U/Eg+QXKn/aQSb358ObGhKQV4TjZnfa2Vrjg3sNLOJooj7LV7BfZCn+siuNrxyIL2yG7Zf8sgatlod+LjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752644249; c=relaxed/simple;
	bh=EBbcboKUANeM3+VhB8+AVSQYjjl9Q2rxibruR9G9DtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KdlRMQrlO+fJI3fQkrT8oBH8CgF8uac3QgHzdzWlUaDqxZJBNYggho+rwU6g5qmje6wG0wVw5Vd/nCeAM80lU+Y8lGXSb3ysWTRtQbz1QqqY0OCQZZsOR2wP7tYn/ixyuOiPPfoUlV/QI2l8eVbpK1JDyo/jZEciduoOGXzbsmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QNuKN/kl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDHrZ031181;
	Wed, 16 Jul 2025 05:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/95ZRIkxvITzEEU2AdWOtsZUy1NgjSXTTdVFZEdbn4=; b=QNuKN/klFQ303H+U
	49Mc/9JwNatFV6uk4p6INvaAz9RrCVXpmIKTieaoSfWycIxdBBDcmIyQqPU22RbM
	t0rB+SDJH4mB3WfeAfxxis2gWt6AcLMmfEjoZcPkN2Te7exRw4i5gw0mb0AOVZqW
	1mycJuYFSb8um5qGF8hZ03qZdW2yqyJweyyTxrs3GX/7c7A3CuLVEsCaIGrUpuVV
	6L3rXJlJYcI2qhkz9tOhWcR9/vQecKmq7ZM4M2WP+O4kd21a5bTkbeQyPDfmHo51
	Y1AQWxdVqXcsigxbYwTSYMfVahE3hFjfS1FtRwj7AdSQD1dnlF2XCRoJY77I4WBh
	g9DR/g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufutahg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 05:37:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G5bMin031389
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 05:37:22 GMT
Received: from [10.218.37.122] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 22:37:18 -0700
Message-ID: <989518a6-5626-4724-a9e9-eadc081f5d67@quicinc.com>
Date: Wed, 16 Jul 2025 11:07:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: ep: Fix chained transfer handling in read path
To: Sumit Kumar <quic_sumk@quicinc.com>,
        Manivannan Sadhasivam
	<mani@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_akhvin@quicinc.com>,
        <quic_skananth@quicinc.com>, <quic_vbadigan@quicinc.com>,
        Sumit Kumar
	<sumk@qti.qualcomm.com>, <stable@vger.kernel.org>,
        Akhil Vinod
	<akhvin@qti.qualcomm.com>
References: <20250709-chained_transfer-v1-1-2326a4605c9c@quicinc.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <20250709-chained_transfer-v1-1-2326a4605c9c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=68773a93 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=9xu2jfKr8A-WS2Z9FkgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: s2S1uq_Yhylj3Yzx1twvWWzTToqG7YAg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA0OCBTYWx0ZWRfXzU8C3RSF+D4E
 u9KJkeKnZubVjgan0D2lEe0OEoqwotd7nlA0B4jNEphq8LAXJYPb25TN6ZYcLYTVdJ3krtG3zBs
 ELhkKtX98mgzm82KOP6nyWJvFrV1A/MEfbRQVr6ZNkX0ntJmLcyblM9KHxOTdkTHz2tWpALnpfJ
 EfUWBi4JKML+cXMFLMwfM4EH7xvOs7vvHwZXBCWxWZEFFN5QUmYJqCa1vXuomAqYmkuOuJ3ssWV
 JJme6PLZdc6siWTbcHqwjtWKUcbMW2+nCu7V1l0PXMX48YUTJQNW3bWVmzG5ceaHyY1C4H0+LIY
 SA9rOeWZtjIsUQ0pN2vollq5FOvJTCaLINkS0VWBvGs3Io9BgnJNLgBe/eEw7AETrMvJYPTmSne
 DNrDM5PGdB8FRUGy8CZcUG8lqn76kg/6urB3DQW0FmCyU9IhK47ogEBcaM9WF/8AadBYnwSN
X-Proofpoint-ORIG-GUID: s2S1uq_Yhylj3Yzx1twvWWzTToqG7YAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1011 adultscore=0
 malwarescore=0 mlxlogscore=637 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160048



On 7/9/2025 4:03 PM, Sumit Kumar wrote:
> From: Sumit Kumar <sumk@qti.qualcomm.com>
> 
> The current implementation of mhi_ep_read_channel, in case of chained
> transactions, assumes the End of Transfer(EOT) bit is received with the
> doorbell. As a result, it may incorrectly advance mhi_chan->rd_offset
> beyond wr_offset during host-to-device transfers when EOT has not yet
> arrived. This can lead to access of unmapped host memory, causing
> IOMMU faults and processing of stale TREs.
> 
> This change modifies the loop condition to ensure rd_offset remains behind
> wr_offset, allowing the function to process only valid TREs up to the
> current write pointer. This prevents premature reads and ensures safe
> traversal of chained TREs.
> 
> Fixes: 5301258899773 ("bus: mhi: ep: Add support for reading from the host")
> Cc: stable@vger.kernel.org
> Co-developed-by: Akhil Vinod <akhvin@qti.qualcomm.com>
> Signed-off-by: Akhil Vinod <akhvin@qti.qualcomm.com>
> Signed-off-by: Sumit Kumar <sumk@qti.qualcomm.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/ep/main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..2e134f44952d1070c62c24aeca9effc7fd325860 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -468,7 +468,7 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
>   
>   			mhi_chan->rd_offset = (mhi_chan->rd_offset + 1) % ring->ring_size;
>   		}
> -	} while (buf_left && !tr_done);
> +	} while (buf_left && !tr_done && mhi_chan->rd_offset != ring->wr_offset);
>   
>   	return 0;
>   
> 
> ---
> base-commit: 4c06e63b92038fadb566b652ec3ec04e228931e8
> change-id: 20250709-chained_transfer-0b95f8afa487
> 
> Best regards,

