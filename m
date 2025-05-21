Return-Path: <linux-arm-msm+bounces-58958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 660D8ABFF12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 23:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6A889E545A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 21:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C62239570;
	Wed, 21 May 2025 21:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TZ58m1Ao"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2603E22F745;
	Wed, 21 May 2025 21:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863910; cv=none; b=plChZW6bo1buyKu44tLDemMIQ4Df/7/2JpJDnQaOodYkLwHIJ2fWoTet8Ne5KkJ0dI106kZvjV0dL3nCSSD/qJOPIl8055cMmtl/pH+qsmkVswWS7QBKr1tmTacAH2WjN6SCH3DJJUZIuPg45rHKDp8gUjgz9hmkvnd3PAvmTt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863910; c=relaxed/simple;
	bh=5UDoD6uNiAVnwsFbRmC2Sqg/tMItLCEkm2lxo9GT++0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BB99h0sfyypTJihwL7A38IUbEhH7N89HznHj+EpIC63sL4ch++ypvidWICAKjQkTrWSS/exM7xoXMkGgh2U/KK+xyJpja4tSHrRAtcgacR33jovNaHjvYLaLxFwhNn8vLgvTbf6m0tJ3i2MHsrhhGIEEYS9/iogiBWOWs+WpHfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TZ58m1Ao; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHowQQ013436;
	Wed, 21 May 2025 21:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hbYNi7fzlTGKCVUTa6TmmbhtpKJ4cc+vpIiXEXf5LU0=; b=TZ58m1AoFuk8j2Et
	ih70mRwnV14LkdG0OlhcQzMGEe4oupwQt2+sCQ7hPOujNzemZxRvDcFbLPhFb7jj
	n7DVP4BxcAyDsXjXaIqad9qR2TCwXeqZUZKzArjjDhXVE/CtKNZk9XH95zteLO1R
	KppSn+MGoa7nNPc0Bhxopvh9uv6UWdBq1Rs+FK9waSSCOEBOmeBPpx0ojvuaHx91
	WLnphvJOt6z1RajtHwcZQwpSdq8YFgdjqakwu1Oj6Q1dEGhpzF+mqQxzqnI5OnEs
	ZmzXwJWUNABiPxqbuigb1Z1ypcq+ohAM7HObUeCpAI0xcDwrOeaEni5bMndTCUDB
	W8yZNw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5ccf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 21:44:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LLimpW015166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 21:44:48 GMT
Received: from [10.216.45.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 14:44:42 -0700
Message-ID: <5d63551f-5401-4c4a-981f-1fa71d73387f@quicinc.com>
Date: Thu, 22 May 2025 03:14:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 01/11] scsi: ufs: qcom: add a new phy calibrate API
 call
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
 <20250515162722.6933-2-quic_nitirawa@quicinc.com>
 <jnftkie5c5hi6nqhliktxqbj7gykj53lvm5gibt3fjdcq7dber@bh4fxrp3fezu>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <jnftkie5c5hi6nqhliktxqbj7gykj53lvm5gibt3fjdcq7dber@bh4fxrp3fezu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIxNiBTYWx0ZWRfX4hx3VjyCr3+s
 vQyr/F+UhUzQraJTqeLOAQrKSZnHBoCGw3SG+Ag3HUwW83wyDMyXReC+sZ4ST7egU/OHVWuSizC
 7SdTZy4IdjXecv2tLGttI5mYhaWSFpdSSVx4V5qt+2AubDVIslHAjGxRpWVCNM1FvUIA2tJKrOy
 LwjRAVZplBAG2AX+osKXdqphirMVYWDj42B8goMmewBc32ORGa0Pv/esAn25Hk0dBxFilCflONw
 IT4Dims7z6GKFRNCaxkSAGeRyey+XvIysBOMieX9VwTW8T7lWs0+R6WhyilApDm8ctZkUZlF5J7
 PJAJnvfibXw+N8T9JDIUbHoF5J10eaqbwlIR8cd/rP6Q69njCW2kGg1RD9h6pcIBcE1mGi2hwSb
 ZXQ3tEQIooGn/V2bTe8GHfl2AZ9Kt3oRQUq5WxsmfGNe6AreFfVZWE3t8IbYyEuriZXWVX63
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682e4951 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=TbsVHaqHX9x0TOAX2_kA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SyHNXZD8ln8Oyw6kUtUz_a_vKhIO_Y_a
X-Proofpoint-ORIG-GUID: SyHNXZD8ln8Oyw6kUtUz_a_vKhIO_Y_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210216



On 5/21/2025 6:38 PM, Manivannan Sadhasivam wrote:
> On Thu, May 15, 2025 at 09:57:12PM +0530, Nitin Rawat wrote:
>> Introduce a new phy calibrate API call in the UFS Qualcomm driver to
>> separate phy calibration from phy power-on. This change is a precursor
>> to the next patchset in this series, which requires these two operations
> 
> 'next patchset in the series' wouldn't make sense once this patch gets merged.
> They all become commits. So you should mention 'successive commits'.

Sure, will address in next patchset.

> 
>> to be distinct.
>>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> - Mani
> 
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 37887ec68412..23b4fc84dc8c 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -531,6 +531,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>>   		goto out_disable_phy;
>>   	}
>>   
>> +	ret = phy_calibrate(phy);
>> +	if (ret) {
>> +		dev_err(hba->dev, "Failed to calibrate PHY: %d\n", ret);
>> +		goto out_disable_phy;
>> +	}
>> +
>>   	ufs_qcom_select_unipro_mode(host);
>>   
>>   	return 0;
>> -- 
>> 2.48.1
>>
> 


