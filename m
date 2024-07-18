Return-Path: <linux-arm-msm+bounces-26587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BAF9350AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 18:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 612C7282D33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 16:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD6457333;
	Thu, 18 Jul 2024 16:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gbhci9qM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71673143C60
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 16:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721319969; cv=none; b=qitWqun6cG3x1DbFHpPvctEvcnAuSBkZqnUXREukc4TO1IqV4+2Q724VrQXsA4zI/fkF53HXm0dj9FYq8mTanZUoZe3ZDT1fxTgvJeAB2StRe54Nd9/DJZyomU9FzuGy6sEQYcZ3BR8izH0xd7jePryn5BOyY0/uUicg80VUN44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721319969; c=relaxed/simple;
	bh=2QFiFBNZ4cA+KN4siYVfy284PDvQpfvjkaSyhDnITkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mGcTQZHVyPCcivki4ouQWpK/3SK90kfT0ZkpPWQrNFGr9l6991dL09SkNqYuy2CbYspHNOHoVynArUgdd1dFC4JCM0cfIjJFgHyGG2vtDbHvPbYwEbXIQpZYZxlfhNtvn7xRZB4m8kWZ0h2L7ZTaV1YJmlptmAIsweyB+RDZ1D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gbhci9qM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IBfNm3023188;
	Thu, 18 Jul 2024 16:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jJPkZ6EymQWs7ete+kHQVpVZi9/fKT9SommYxUKq0c=; b=Gbhci9qMX3SZxWw7
	YT86UtfOeFy9CD4ulD3aDYyrRQ0DZ532VpVrGS1iqyjgeyre5oMiCZms05vDiqc3
	KT7U3YMzjMUypGGZwvVKy0mOYL9YEBfOanDlJ3RhS2MjbJfCuzG7FKwNRFuaQK4T
	8zuTokzM2so/jBTMDZjUrGcQYYq11ES9HL8CJCxfFUT1hPvm1S4Vas+Z97RQnMk2
	a02qZypdwzcEoSpOcQZz5ja+3U2xLv3nfl6dmBQaVquFviBEzAdY8ljDTgRNEd4K
	opat/C1AflL3bfakJ+rik9sU2JNwazkfpG3fuuhkMC8nEsZrkivrmC8HDYOmdcnY
	e6C47w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfnp26p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 16:26:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46IGQ3I7004454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 16:26:03 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Jul
 2024 09:26:03 -0700
Message-ID: <b4d2fea3-673c-3ea0-3401-befcb1c588d1@quicinc.com>
Date: Thu, 18 Jul 2024 10:25:57 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 5/6] bus: mhi: check for RDDM cookie set by device to
 indicate readiness
Content-Language: en-US
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-6-quic_gokulsri@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240718061344.575653-6-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4jnT4W40PsBNaC4KlyNWvfYRZtMiLjrf
X-Proofpoint-ORIG-GUID: 4jnT4W40PsBNaC4KlyNWvfYRZtMiLjrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_11,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407180106

On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index c0c9bfc28e4a..2f90de8616f3 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -839,4 +839,12 @@ int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_
>    * @mhi_cntrl: MHI controller
>    */
>   void mhi_debug_reg_dump(struct mhi_controller *mhi_cntrl);
> +
> +/**
> + * mhi_scan_rddm_cookie - Look for supplied cookie value in the BHI debug
> + * registers set by device to indicate rddm readiness for debugging purposes.
> + * @mhi_cntrl: MHI controller
> + * @cookie: cookie/pattern value to match
> + */
> +bool mhi_scan_rddm_cookie(struct mhi_controller *mhi_cntrl, u32 cookie);
>   #endif /* _MHI_H_ */

NACK.  This is not used.

