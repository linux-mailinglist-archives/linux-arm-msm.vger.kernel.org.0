Return-Path: <linux-arm-msm+bounces-26585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE1A9350A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 18:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F7FD1F223E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 16:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CF1144D3E;
	Thu, 18 Jul 2024 16:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LWWmfMdR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B045E144D28
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721319932; cv=none; b=TNhHq2crne/VKKoRBKUJRBTpRTF+h/m6jVT3bvXr1gDBHTDipJoefX+E2hAZwtGB/ReZ4tkerlToPl2K/Wbhjd9E17ePv6PBfL5cj5fw3yKORv1Jmrm1VwPh8OPsoq5dVSpG6PTa2ScUFtaGyUZ3ks6erw7LHlx4OerCzDx7WnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721319932; c=relaxed/simple;
	bh=c1Qii0YmCU+Ttd7hyMVd2vNI+0a680L4Wc0JIY2rpe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=htaqguYG4NrA/bd0Z68YAAaDO68UZzr+esHrZ+9l2B4ycMckfltMAaNzexyoJS0SBSJSg+T9MIYoo74ICd4RPbogzPFafwFNFkMjdZym3fdZSZw+3wwLovV04AMWD79MRH/fbNsx7wMwLh6s3D9fiVmSWe9ctZm1yvU57K5SyOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LWWmfMdR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IA0QTI001753;
	Thu, 18 Jul 2024 16:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v3mLpadcNFZ7FGtFFpm190pHgOWJ0WUTwJXF5ISNi+s=; b=LWWmfMdRovlIvxmp
	jjhLuchPeZyLUArx2mh+ygJy++69orzdagqPgBrZr8H9SkNUeKUiPJyBKF35AdDH
	9n8pmeCajjy4l7So/38cBDiVg86976PJBEUg7mHuO2hm28h7LwAf+lDxYiFzZzbr
	T70MUnh9Wl5+sF086Qm5nO++p0yd/axalEXoojgJiC69g7eFgpjaaFhuD+SuVTQF
	8VXMtdVXLumrxI1OFnEqX/fwsRJzjjNHN5HFH2seoNw6KuU6NCCwQdD7Eo+N5eaj
	Zp7l7+hXhgIrbq792sNkTpOdTf7PYAW4VTLWbQFe9kNPN2oQfOM1Le1aO8/c0jZu
	u2LQOw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40es1wsx6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 16:25:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46IGPQaL026816
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 16:25:27 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Jul
 2024 09:25:26 -0700
Message-ID: <fb793a71-dcdf-521a-a897-d1406e16fbf9@quicinc.com>
Date: Thu, 18 Jul 2024 10:25:25 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 4/6] bus: mhi: dump debug registers in critical sections
Content-Language: en-US
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-5-quic_gokulsri@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240718061344.575653-5-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MMylHWtK4zYSRjqCL0xFFD6VKKDn2_dn
X-Proofpoint-ORIG-GUID: MMylHWtK4zYSRjqCL0xFFD6VKKDn2_dn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_11,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=686 spamscore=0
 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180106

On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -834,4 +834,9 @@ bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir);
>    */
>   int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_offset);
>   
> +/**
> + * mhi_debug_reg_dump - dump MHI registers for debug purpose
> + * @mhi_cntrl: MHI controller
> + */
> +void mhi_debug_reg_dump(struct mhi_controller *mhi_cntrl);
>   #endif /* _MHI_H_ */

NACK.  This is not used.

