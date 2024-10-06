Return-Path: <linux-arm-msm+bounces-33300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC6899220B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 00:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57360B20FB8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DACE16EC19;
	Sun,  6 Oct 2024 22:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T4fu389D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF94E152165;
	Sun,  6 Oct 2024 22:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728252110; cv=none; b=kJrwcXZyNozxns4nbHB5uct3Dei2r96hb0HEn67B24xTKVXGCg3vg3u0ncOHc5Tj53wcgrLw/+zmDyeLC3Hx8J2zvK3HznReMaHQ0tapXEjL4CY53ART25n5zTGbtxt08tfT/SoI0/w7gafrpBFXYxH+LYfL01UqvTE6Tkr/A6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728252110; c=relaxed/simple;
	bh=Gy67jPuTIKdx+LMTo6vm6+onZ+nJSx1uLoldMnvmPvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m8Ugg1Baf14c4L20iXDuOV79Dm/2ffJ+lqiGNCDU2VJz6P0fEZNvhoFGjWxhpOHYPrtgfN1GZr6EH/ZAmVtx1KIEsY0tC2vodO1KOeatE+3+FV93JE2cTN5dCJ4j1jltbPSErssH1gEH4galiKPNeKAh8Y6tJnYTIY4gUl+0+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T4fu389D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 496M0mTb026839;
	Sun, 6 Oct 2024 22:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J39T85wvcA9vqhR4XPwXvsan9PQikhcxXtHsdQc70DE=; b=T4fu389DH97+TKYh
	sQnEabgHDXCp8rARDVBsEtoWOcvCRvZznG+BK1c26xkypVdXXrOtUkDmUEPtzH6t
	Fe4DiG+5Ah67dWn38QqSS9IsJ8VthKBgJRS+IEw4sQMjLSQuKIAWXrD2h99u98FT
	0FW85B6MFst6DcT+wHWN1EBXdHJgllEJX0BqVrmV2J4c1WXP0DsOYanfzeR0LMK6
	ZVkJ+AR8YO0BpZYb1dOGtWhlxpY6KOnNSv8BvkStYD7iI2T2YCrJEAhQbNixVrYJ
	Ye03pOYnhuBOyDex7rO0OeqU/DL0VeQ5ldsA2BzGqup/mjot9+vIrSSK3Ve1hre+
	5WwMdw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xr5jj6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Oct 2024 22:01:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 496M1WY0026764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 6 Oct 2024 22:01:32 GMT
Received: from [10.216.56.130] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 6 Oct 2024
 15:01:29 -0700
Message-ID: <9c8ae6ef-dd71-4a2f-91c7-49eddd36e4f7@quicinc.com>
Date: Mon, 7 Oct 2024 03:31:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: scm: Return -EOPNOTSUPP for
 unsupported SHM bridge enabling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <20241005140150.4109700-2-quic_kuldsing@quicinc.com>
 <2fi7pyhpetqyhipjiihuafddggwdrh7abuvfkks5hu5qid2rfm@ibuiecrhijey>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <2fi7pyhpetqyhipjiihuafddggwdrh7abuvfkks5hu5qid2rfm@ibuiecrhijey>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: innUSPBNFarW1hbGYU9UfRKsaKlhZS1d
X-Proofpoint-ORIG-GUID: innUSPBNFarW1hbGYU9UfRKsaKlhZS1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=865 priorityscore=1501 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410060158


>>  int qcom_scm_shm_bridge_enable(void)
>>  {
>> +	int ret;
>> +
>>  	struct qcom_scm_desc desc = {
>>  		.svc = QCOM_SCM_SVC_MP,
>>  		.cmd = QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
>> @@ -1373,7 +1379,11 @@ int qcom_scm_shm_bridge_enable(void)
>>  					  QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
>>  		return -EOPNOTSUPP;
>>  
>> -	return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0];
>> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
>> +	if (!ret && res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
>> +		return -EOPNOTSUPP;
>> +
>> +	return ret ?: res.result[0];
> 
> Could you please make it less cryptic?
> 
> if (ret)
> 	return ret;
> 
> if (res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
> 	return -EOPNOTSUPP;
> 
> return res.result[0];

Sure Dmitry, this looks more cleaner.
Will update in next rev.

-- 
Regards
Kuldeep

