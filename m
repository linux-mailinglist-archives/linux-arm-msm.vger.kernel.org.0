Return-Path: <linux-arm-msm+bounces-58963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC72FABFF5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 00:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 276A68C64F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 22:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E1D238C27;
	Wed, 21 May 2025 22:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PtYtoo0S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B97D2B9A9;
	Wed, 21 May 2025 22:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747865951; cv=none; b=hZMGdKsvTyjuknvGL0k4MOuc5t183q22wmQm8QERwMXPG+8g5DQEBVd0kGzBAquLik66z9ciEzbxawTQGUSWcc6kmDIWpJwh6gFCa6ikWY9tYgogxPhECnMQ5pNLw27SwweuEtzWR+ZsAEgdR1XgM+Kj4oOJJWqbbJ+HzrSXvYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747865951; c=relaxed/simple;
	bh=9dioBGuLg63WOFbOrAzccqXfkE3rEgRjSBMlBXlMaOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MZbZc2z/nCFaV+lDyVip8ucJ6gBmIecQPNQT0DwHUzW7fekNiE1pTcfvX48tDaNDBgL8ewC+Pofjw18Aesyedn4y+mrpC3vzcjZ9SXCLiwAM8bTbwe53noAjpG+JSzQM+gA4Bqd4/+SSdOJwP0jkRRHtZTvNx0qRUEv+0KKbIzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PtYtoo0S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHxkhg000727;
	Wed, 21 May 2025 22:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zoRxXyZthiQFEzGEAlMtzgKEiFAVF4hasJkFnJdzlAU=; b=PtYtoo0SKU7AZRKR
	fGhOxDrVQYGucWA4ONFQrsUo11UW8DA3O+O0Cmn1o1VwYMS3mMVdOe6jiCOy3UaP
	CxKuB0X1XiOx1DWVu8zyaLAxaBmN7bkOwEVkUAY5dQWas5uedX/7d5AIRz8n/6h1
	3M7QDJN2KcDtFfWS7imPFByEZ1FX+mYOmtlpuGyjKNm270fDWWmmeQ5o7y9rhJ9J
	b37dAQnp+U97S5g4NJthWLTTr0YcacPtImi1AOfaBgbZM2bs7AfUabRxoGOl0OTy
	Cld1g7DruE2307pXPkbqLj6rbvE+a5N1RLpvpjev+GEg4uBoi8ZNSaX2mtZb8gKP
	KZ6akA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tjpvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:18:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LMIem6008058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:18:40 GMT
Received: from [10.216.45.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 15:18:34 -0700
Message-ID: <9092ed42-ef8b-42cc-a423-c5a486d3b998@quicinc.com>
Date: Thu, 22 May 2025 03:48:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 10/11] scsi: ufs: qcom : Introduce phy_power_on/off
 wrapper function
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <konrad.dybcio@oss.qualcomm.com>, <quic_rdwivedi@quicinc.com>,
        <quic_cang@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-11-quic_nitirawa@quicinc.com>
 <k37lk3poz6kzrgnby4sikwmz6rg4ysxsticn3opcil4j3njylp@cvmgwiw6nwy5>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <k37lk3poz6kzrgnby4sikwmz6rg4ysxsticn3opcil4j3njylp@cvmgwiw6nwy5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682e5147 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=5_CuNsIc6OICzRwY6LsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LC0e4SI_OTN2i58m76DCqxXebParwSWL
X-Proofpoint-GUID: LC0e4SI_OTN2i58m76DCqxXebParwSWL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIyMiBTYWx0ZWRfX9vJ6S7TGgrWx
 9u7Z8EBqeIhki+FYb7elDlT+rmaBDD7hELTEhF6WeZDRytE+81Sgr6YsQbGSKiGz0JcexpRdXHS
 tSApDSIWqOCo+EZRDPRColJKiZjBESJHmpmKreMwdQFk/DiMmxTvlPCF6EyMsGWHR+ZsWsoW60U
 0acteuPtYF2CS+6lM5WpwOoQxDVBbkS53cXo4SUX3x3BzjCKdAAU9XvGt1UbKYvtoH6VFdsUeSp
 Nf6OpzV5XSxmmvipTDn+dVOaiQsn3FudfBuLsRXdcJMHCxdF+/MgP0zzXSO32N3t+lQUZnUE5Bs
 dFgUljxClr+0okMSZHb/7GfUpdzEVdrJKBequvjev+WalHZ9eUQbnXZSlwtiqHjXTXeMWcEsgDR
 oLEPdBtPo4zI0v7SExedL3dTgUMhgvZNYcSDgne7OlS2sX+TAMIrtj4R+J2i/Ys3ynVu68ty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210222



On 5/21/2025 7:31 PM, Manivannan Sadhasivam wrote:
> On Thu, May 15, 2025 at 09:57:21PM +0530, Nitin Rawat wrote:
> 
> Subject should mention ufs_qcom_phy_power_{on/off} as phy_power_{on/off} are
> generic APIs.
> 
>> There can be scenarios where phy_power_on is called when PHY is
>> already on (phy_count=1). For instance, ufs_qcom_power_up_sequence
>> can be called multiple times from ufshcd_link_startup as part of
>> ufshcd_hba_enable call for each link startup retries(max retries =3),
>> causing the PHY reference count to increase and leading to inconsistent
>> phy behavior.
>>
>> Similarly, there can be scenarios where phy_power_on or phy_power_off
>> might be called directly from the UFS controller driver when the PHY
>> is already powered on or off respectiely, causing similar issues.
>>
>> To fix this, introduce ufs_qcom_phy_power_on and ufs_qcom_phy_power_off
>> wrappers for phy_power_on and phy_power_off. These wrappers will use an
>> is_phy_pwr_on flag to check if the PHY is already powered on or off,
>> avoiding redundant calls. Protect the is_phy_pwr_on flag with a mutex
>> to ensure safe usage and prevent race conditions.
>>
> 
> This smells like the phy_power_{on/off} calls are not balanced and you are
> trying to workaround that in the UFS driver.

Hi Mani,

Yes, there can be scenarios that were not previously encountered because 
phy_power_on and phy_power_off were only called during system suspend 
(spm_lvl = 5). However, with phy_power_on now moved to 
ufs_qcom_setup_clocks, there is a slightly more probability of 
phy_power_on being called twice, i.e., phy_power_on being invoked when 
the PHY is already on.

For instance, if the PHY power is already on and the UFS driver calls 
ufs_qcom_setup_clocks from an error handling context, phy_power_on could 
be called again which may increase phy_count and can cause inconsistent 
phy bheaviour . Therefore, we need to have a flag, is_phy_pwr_on, in the 
controller driver, protected by a mutex, to indicate the state of 
phy_power_on and phy_power_off.

This approach is also present in Qualcomm downstream UFS driver and 
similiar solution in mtk ufs driver to have flag in controller 
indictring phy power state in their upstream UFS drivers.

Regards,
Nitin



>> +			host->is_phy_pwr_on = false;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>>   {
>>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> @@ -507,7 +539,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>>   		return ret;
>>   
>>   	if (phy->power_count) {
>> -		phy_power_off(phy);
>> +		ufs_qcom_phy_power_off(hba);
>>   		phy_exit(phy);
>>   	}
>>   
>> @@ -524,7 +556,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>>   		goto out_disable_phy;
>>   
>>   	/* power on phy - start serdes and phy's power and clocks */
>> -	ret = phy_power_on(phy);
>> +	ret = ufs_qcom_phy_power_on(hba);
>>   	if (ret) {
>>   		dev_err(hba->dev, "%s: phy power on failed, ret = %d\n",
>>   			__func__, ret);
>> @@ -1121,7 +1153,6 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>>   				 enum ufs_notify_change_status status)
>>   {
>>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> -	struct phy *phy = host->generic_phy;
>>   	int err;
>>   
>>   	/*
>> @@ -1142,7 +1173,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>>   				ufs_qcom_dev_ref_clk_ctrl(host, false);
>>   			}
>>   
>> -			err = phy_power_off(phy);
>> +			err = ufs_qcom_phy_power_off(hba);
>>   			if (err) {
>>   				dev_err(hba->dev, "phy power off failed, ret=%d\n", err);
>>   				return err;
>> @@ -1151,7 +1182,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>>   		break;
>>   	case POST_CHANGE:
>>   		if (on) {
>> -			err = phy_power_on(phy);
>> +			err = ufs_qcom_phy_power_on(hba);
>>   			if (err) {
>>   				dev_err(hba->dev, "phy power on failed, ret = %d\n", err);
>>   				return err;
>> @@ -1339,10 +1370,9 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>>   static void ufs_qcom_exit(struct ufs_hba *hba)
>>   {
>>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> -	struct phy *phy = host->generic_phy;
>>   
>>   	ufs_qcom_disable_lane_clks(host);
>> -	phy_power_off(phy);
>> +	ufs_qcom_phy_power_off(hba);
>>   	phy_exit(host->generic_phy);
>>   }
>>   
>> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
>> index 0a5cfc2dd4f7..f51b774e17be 100644
>> --- a/drivers/ufs/host/ufs-qcom.h
>> +++ b/drivers/ufs/host/ufs-qcom.h
>> @@ -281,6 +281,10 @@ struct ufs_qcom_host {
>>   	u32 phy_gear;
>>   
>>   	bool esi_enabled;
>> +	/* flag to check if phy is powered on */
>> +	bool is_phy_pwr_on;
>> +	/* Protect the usage of is_phy_pwr_on against racing */
>> +	struct mutex phy_mutex;
>>   };
>>   
>>   struct ufs_qcom_drvdata {
>> -- 
>> 2.48.1
>>
> 


