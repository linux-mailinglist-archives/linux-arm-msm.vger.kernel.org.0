Return-Path: <linux-arm-msm+bounces-27269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 288FC93F75E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 16:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC005282705
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 14:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141D314F9EE;
	Mon, 29 Jul 2024 14:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZaEmEcJz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FF114F9E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722262432; cv=none; b=NTN+k7dYmdA6juAXBVKgDNh51Ec+o7umQk22gOwHH/EfoUJK4ugWgJakQGXBUEIAJXgs5HZIxqYazQNMf1sqoy9FJAk6KM9MavyAFYdPPcn0PnES9PgeGXqM2NG83wdqG1WwEFVohMDkmCc9wXFd2bxc1CVsKIQXqzCKdC6Nwcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722262432; c=relaxed/simple;
	bh=zMmDKCEyHl4S4ued6wYVvi1UyTyHW3qxXJ5rMKTmTmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=R+MvhRojCdkpt+o3/r4QTs/eddO4s+KWlevAPGfTNLtxRCW9IKT35Oa7lTIKP6y/sfLmkWWOtRzFntiYm2txaGUqfGOsN4Qzshg6igefFAzN/JzM5CQ5grZW7YojKrIqAJvAjKrFbnWSo3BeiKYJRaIEtvP4VPbYVltUhlo8aag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZaEmEcJz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TB439T006480;
	Mon, 29 Jul 2024 14:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yEMpu9bWob0DdDixU8n8Pg+wsLC+sFlO3nohUKI6D6o=; b=ZaEmEcJzp87pgFt0
	+EOET1wZnbuLwWZ+mgAYYyXstlmYvqGx8Tm8yKRbC6PqkIfZlK4gfDgNbySj3gZJ
	VHw/GBwoBDN8hBTIzcHssJ2vKCrJVah06QZiBzLHaQznDYkvVHtOvJ3WwAvR3JfX
	m9p8J7Sk2cErhFWtZo077BeYkqWNL3BDw3ryQcHkQuuXnF5mJUvxtHp6/R7bA6Xx
	+V/WijT0uBiB6xGN+ttHsag6sOftB5fBG484I6U/nZTRlCI9bfr2UaUJsrwl7CyF
	0m58HXk2yoYEieJRYJbXsXqZoU8wZbDtk/7UhB9Qu927AaBBIx4xqcRChR8Qp4ub
	vp7kkw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mqurmgms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 14:13:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TEDdp5030545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 14:13:39 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 07:13:38 -0700
Message-ID: <ca8c093a-15ee-08aa-453f-225ecfb01844@quicinc.com>
Date: Mon, 29 Jul 2024 08:13:38 -0600
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
To: Gokul Sriram P <quic_gokulsri@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-5-quic_gokulsri@quicinc.com>
 <fb793a71-dcdf-521a-a897-d1406e16fbf9@quicinc.com>
 <b5903003-3b3f-4a00-a01c-916c91caea62@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <b5903003-3b3f-4a00-a01c-916c91caea62@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: orY7dTtVKuEx6pTH5szykJFk0UEGRbYa
X-Proofpoint-ORIG-GUID: orY7dTtVKuEx6pTH5szykJFk0UEGRbYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=800 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290095

On 7/28/2024 11:47 PM, Gokul Sriram P wrote:
> 
> On 7/18/2024 9:55 PM, Jeffrey Hugo wrote:
>> On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
>>> --- a/include/linux/mhi.h
>>> +++ b/include/linux/mhi.h
>>> @@ -834,4 +834,9 @@ bool mhi_queue_is_full(struct mhi_device 
>>> *mhi_dev, enum dma_data_direction dir);
>>>    */
>>>   int mhi_get_channel_doorbell_offset(struct mhi_controller 
>>> *mhi_cntrl, u32 *chdb_offset);
>>>   +/**
>>> + * mhi_debug_reg_dump - dump MHI registers for debug purpose
>>> + * @mhi_cntrl: MHI controller
>>> + */
>>> +void mhi_debug_reg_dump(struct mhi_controller *mhi_cntrl);
>>>   #endif /* _MHI_H_ */
>>
>> NACK.  This is not used.
> mhi_debug_reg_dump - this is added in 3 places, mhi_fw_load_bhi( ), 
> mhi_fw_load_bhie( ) and mhi_download_rddm_image( ) to print error codes 
> on failure scenarios.

You add this to the MHI API and export it as a symbol.  Nothing outside 
MHI uses this.

