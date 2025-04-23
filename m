Return-Path: <linux-arm-msm+bounces-55113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E90BAA9880E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CFBB1B61F92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094611E0DE4;
	Wed, 23 Apr 2025 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hw5xqQQ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48016C8DC;
	Wed, 23 Apr 2025 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406118; cv=none; b=I1lqIS+0h8ALanPugbMxL6/N5M/NWP7pEuTI7oUgFyi2Rw/3pGwzJ3tvw590GABxLpYJD/pM/q/iBBDro5u/5Atx5yRVzPMU5nwbJPPxX8ekGUpPgjMslStOxP1Dp+suKkmDFTs6JaXCOPS9HtWfKEcqhZPjmfn+u18XNa0+9yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406118; c=relaxed/simple;
	bh=JYlrtdPkn/dvF6hlr6tukfBn7HmNVmOGZEnDppujC3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TOSqL/l18Y27IFSeO6DGDaREvK8bBDpnlyiOdcZJb4z8ydFgnyY3qJ4nxIt/nkltavJiqAsJ7KJIgKzT2g3SwC1TFNRs3Z2Afk4d8oe1M0sKk+/Ju/LO52hqkBXf1sj708fiEdqm3p9IGQomPMZcZrzwFVeI76vF/ywObmrlCaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hw5xqQQ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAlafx016858;
	Wed, 23 Apr 2025 11:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zVJ+/vVepkGmQcMwQNA4ogt+cMKPxrjlVD7qz32ZD8M=; b=hw5xqQQ9sGk6XbAm
	wjujz0ybA0MbZnNkgycifoKLoTvauLB52KXhpmRgXPtF+ZrFqWiBDWJIrUrLU4do
	x2sEYAR/fWQ0u3W/j0ZJ1iWc6gs3BUdpHpvjP/GXBkEVCSvVjXk9aqm89HsnsE3x
	Kp3GfSo8aFjLmjEEgMEybTa56RHKlMp9k91Z91d8prgAx8XyIDDrazTLzFfXX83S
	sK3ifn5deeJxyJ8AJvtdS44uom5afeKGJ4SpLQape4FlbBsbaqBfkwRRAFBjj08b
	y6Wvb5/Bmagx4gFsEGe+EevDgfjU4s3NOM3ULC8fYhu6EBEOZbCOa7AlSXG5v68r
	Q2tUUw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh01vq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 11:01:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NB1FsA027322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 11:01:15 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 04:01:10 -0700
Message-ID: <fb4394e2-991f-4aba-9ddc-ce6cfb7c695d@quicinc.com>
Date: Wed, 23 Apr 2025 16:31:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/9] scsi: ufs: qcom: add a new phy calibrate API call
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <bjorande@quicinc.com>,
        <neil.armstrong@linaro.org>
CC: <quic_rdwivedi@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-2-quic_nitirawa@quicinc.com>
 <3735f288-5ba2-4582-afbe-8b3f5d0f280c@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <3735f288-5ba2-4582-afbe-8b3f5d0f280c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3NiBTYWx0ZWRfXxQdhnEa3a5Bh zKXvCem6WoDUvwXSPHTeOqJm1N1gwUz71oNKBg5UHO7PHlrRF19A3ocpVqV1d8LALGSrHkV8KGF ECq7tEajbAuOOwOf2t1DGN+iahr2Zp8t/eFlZc+p/G4g4GmMJYXS8jbX+YXXo3ArBRcLYKRQU8c
 C4fUl+FBxjcysKm9xIW6mIbSMPkPBIyJUIrIcpZwXX4LhxKoQ3b5lR8W/kIF5SLMH2l48Yh9vjz xesmXdMCHspku1ecy7pGY74sEKmMi+Y6RtO/GmOdLQMelychyz6Kqa8R3NW1YLvL+mLgZboe4wa 4Nb/KNe4jGVJmUlq8ZgNtmIbC3gKI6VIaJcwotsFutC/tT2l5exoD5+evl/BlP3ASNOJeyeTuJu
 +XqJLFEHsIbh/6YPIX+fWB4zR08Hn4L/D53/SQeCg9jPSCltv/sCcYEqye2jxcbpN4hdAO9d
X-Proofpoint-GUID: OHlltBr3yQZ-e07YpU48PUXMyoym35pf
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=6808c88d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=oORsJjWy4k12e7USA60A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OHlltBr3yQZ-e07YpU48PUXMyoym35pf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230076



On 4/23/2025 4:12 PM, Konrad Dybcio wrote:
> On 4/10/25 11:00 AM, Nitin Rawat wrote:
>> Introduce a new phy calibrate API call in the UFS Qualcomm driver to
>> separate phy calibration from phy power-on. This change is a precursor
>> to the next patchset in this series, which requires these two operations
>> to be distinct.
>>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 1b37449fbffc..4998656e9267 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -473,6 +473,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>>   		goto out_disable_phy;
>>   	}
>>   
>> +	ret = phy_calibrate(phy);
>> +	if (ret) {
>> +		dev_err(hba->dev, "%s: Failed to calibrate PHY %d\n",
> 
> Please add a colon, so that it becomes "..PHY: %d\n"
> 
>> +			__func__, ret);
> Avoid __func__, this print is fine without it

Sure will update this in next patchset.

> 
> Shouldn't we fail the power-on if this can't succeed?

Thanks for the catch. Yes we should return power-on failure if calibrate 
fails.
Even if there is calibrate phy ops registered, it will return 0. So for 
so nonzero return value we should treat failure and fail poweron.
Sure will this in next patchset.

Thanks,
Nitin

> 
> Konrad


