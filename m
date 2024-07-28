Return-Path: <linux-arm-msm+bounces-27149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A893E58C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 15:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 341BDB21805
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 13:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805093FE55;
	Sun, 28 Jul 2024 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IfUs40e6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A6E1B86C2
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jul 2024 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722174098; cv=none; b=Bm7RkOEG5rm1kjozNUuoix5K3QyBO3Btzxjh5GeDMrD84gZtXG2cOf8gcZxyiOqzq1jT82Qt9L/vYk7tz7PNWfE1Tm1dC0UQFekQPXNmjDblIzZYp9ieeIKxulKvOmBqEhkg5m1PmSQ4MA8i9YB1DKIHASRnpkG7eu+6YAna9Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722174098; c=relaxed/simple;
	bh=VyBkskwjsXNsRXFHVokiyL2BqXi/cX/HGnSOshAoysU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=pIP5E1Psr/+MG9tI4YQ+HVy/2e8HZSDiZZxYtaY+YxN5UEh4QiE/olwy5NH19iwDbl4O6veSKc/3gp6wBnNx5xJJugAirqGVOH2END6sWqJgu+qkWsvZ/y+XgMJ6g94jcCeNYYlQa2GRXMCan5xdltrWDB/c6Z3sKwg6GglqFJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IfUs40e6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SDKZE9015031;
	Sun, 28 Jul 2024 13:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M6MozLfsqhbuHswf2fQrvPyB8Ftz4KCW6+RqwA29tuA=; b=IfUs40e6J4VezW/G
	Q371+wDDFYN8TcVSRDK8uQ1och54FQN4+F6zKzrBLC5UYJWPdtWRXSVIawpIiu0a
	Ya9/4gtYuFnds5tDst8jXQQuQpJNsypaIMiaLj7HSPgzfS+vSSQh7rEqe5qe7EwE
	2oE2eXpW9WGqRGTkdppXCY29j7Uo3McqKremduho6AFKEGa5DlnZZnRvOtUMNfYP
	Es6fqoDiuvMXEbZsUp6qQ+1eTr64k1wBrrDJH/wRl8RB5xidq9fcoP7N1GqUGBYC
	QkEAeeqQ3YbjvepbpDs9fMuFRFIBVAJi8MD5tb0avXXxgTUkEdUDU0Arr6oxyOTu
	62tCxg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mr7ghy7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 13:41:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46SDfQHI004239
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 13:41:26 GMT
Received: from [10.216.18.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 28 Jul
 2024 06:41:23 -0700
Message-ID: <518fad2e-7419-41eb-b145-b5936a5def3b@quicinc.com>
Date: Sun, 28 Jul 2024 19:11:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
Subject: Re: [PATCH 5/6] bus: mhi: check for RDDM cookie set by device to
 indicate readiness
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-6-quic_gokulsri@quicinc.com>
 <b4d2fea3-673c-3ea0-3401-befcb1c588d1@quicinc.com>
Content-Language: en-US
In-Reply-To: <b4d2fea3-673c-3ea0-3401-befcb1c588d1@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s8hqQdJjEA2FiHswc6wGMEI1zVL-2dJY
X-Proofpoint-GUID: s8hqQdJjEA2FiHswc6wGMEI1zVL-2dJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-28_10,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407280100


On 7/18/2024 9:55 PM, Jeffrey Hugo wrote:
> On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>> index c0c9bfc28e4a..2f90de8616f3 100644
>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -839,4 +839,12 @@ int mhi_get_channel_doorbell_offset(struct 
>> mhi_controller *mhi_cntrl, u32 *chdb_
>>    * @mhi_cntrl: MHI controller
>>    */
>>   void mhi_debug_reg_dump(struct mhi_controller *mhi_cntrl);
>> +
>> +/**
>> + * mhi_scan_rddm_cookie - Look for supplied cookie value in the BHI 
>> debug
>> + * registers set by device to indicate rddm readiness for debugging 
>> purposes.
>> + * @mhi_cntrl: MHI controller
>> + * @cookie: cookie/pattern value to match
>> + */
>> +bool mhi_scan_rddm_cookie(struct mhi_controller *mhi_cntrl, u32 
>> cookie);
>>   #endif /* _MHI_H_ */
>
> NACK.  This is not used.

mhi_debug_reg_dump - this is added in 3 places, mhi_fw_load_bhi( ), 
mhi_fw_load_bhie( ) and mhi_download_rddm_image( ) to print error codes 
on failure scenarios.

What do you mean by not used?

Regards,

Gokul


