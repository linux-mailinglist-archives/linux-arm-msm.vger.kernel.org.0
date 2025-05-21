Return-Path: <linux-arm-msm+bounces-58864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8CFABEEAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 10:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F2C63AC124
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 08:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963D621FF55;
	Wed, 21 May 2025 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GQy0Lnx5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43FF33EA;
	Wed, 21 May 2025 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817800; cv=none; b=rMt/O5aN4OVWHvq6JVtwd3jvDmzz9qzFKet5k4btIS80F34a1rXNwKQ7QopiND8vB1mnp/x6vAK8BS2z6NjKHVWM0EIzMbyBTsicQcEaeTXn2meGY2udnCwVZSD7/kla+J1p5MPnv0soykpLSQ52wfcur8RT1Q8CP02OrMbA2ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817800; c=relaxed/simple;
	bh=rsKPq6xbslj3xkT78HLw6P1t5XKTzvYYoBmzo7wm2AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uVXc/RoDkt/86HuVO0iF2KzHFJPhciAAr/kjsbNNGi23Ee7GUQd+vIVdgbVkheVFq9ugzdLy13gapZNgpm+90FoMaPOHzq4vdsCKRJeQ18Exi2dzjVvM0zh3pN3awArZWWNOKEAaAxfHRz8rEbBAl549WA20orCbkxkuu4Z2vVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GQy0Lnx5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5hqva014026;
	Wed, 21 May 2025 08:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xlZ8fW1X2E4grUCjho7hpFCrOvvv4aVzbCbXbKqAs0w=; b=GQy0Lnx5120Q74kp
	itJ5vDRCVUDdH4z86wpRVqFPxPC9PdLPMcRgRY4RhqIH5KD1BeAhg907JcHbgG0w
	ETKq3X7iyh5R/fYgcKkD/KPfjeN2+W5VpgcP1Ho2yd2hBjIBZUT+c7a/n2nq5Y3Q
	FINEvl5bSdHYLCcA073AnnWaQQhHvCI4HibjgYPuIJczShwzq5r4aZbsCVZwnF+S
	amrqg6JpDvLEV72VpZ4bFB4y5XfLsZvAWmusKGjpw81CM2I9xHKJOGMpFk9kIlJN
	rK9IKey/FcSIUAXIaYqropQmeSLySiWTNZX3FC+SWloYaahrauUy/8V6JHrmUp2p
	ixNBvQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb29aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 08:56:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54L8u9Vp007121
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 08:56:09 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 01:56:04 -0700
Message-ID: <b7b0b907-8f5c-481c-9a68-cb3e20b59cb0@quicinc.com>
Date: Wed, 21 May 2025 16:56:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] scsi: ufs: core: skip UFS clkscale if host
 asynchronous scan in progress
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
        "beanhuo@micron.com" <beanhuo@micron.com>,
        "avri.altman@wdc.com"
	<avri.altman@wdc.com>,
        "quic_rampraka@quicinc.com"
	<quic_rampraka@quicinc.com>,
        "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
        "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
        "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
        "bvanassche@acm.org"
	<bvanassche@acm.org>,
        "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>,
        "luca.weiss@fairphone.com"
	<luca.weiss@fairphone.com>,
        "konrad.dybcio@oss.qualcomm.com"
	<konrad.dybcio@oss.qualcomm.com>,
        "junwoo80.lee@samsung.com"
	<junwoo80.lee@samsung.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20250508093854.3281475-1-quic_ziqichen@quicinc.com>
 <fd13e179-f2d8-4085-86da-c6b0fce2de5b@acm.org>
 <5748d0cc-a603-4b44-bbfc-d39d684b2ea6@quicinc.com>
 <c428f074-c010-4225-960e-56aa65a799d8@acm.org>
 <486616b7-9400-4288-b4b4-c56ec628b0f3@quicinc.com>
 <f092c7a563f2f2b70ccb43340b95819adacb2ad6.camel@mediatek.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <f092c7a563f2f2b70ccb43340b95819adacb2ad6.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bI31KMDxb1HWjN0C3kVdSnvbBOHMoTis
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA4NyBTYWx0ZWRfX5pltyY9kXZp4
 KYbsb6RtBhwn2naDkSR77wxbyKZC+Hv4uVk34GYsuqAg/CODDyojNPU9OgjJOEdKBneCv+YvPLJ
 di9au+RfvjJgZaqp+SD+fj2sf/ub6pW3bWbK6L1JyN/HK9W7kBOhairy/ijgsKb4/h606o+boVX
 d3t1KoLIQNkhCztOUC2H6TlZpDbOxdjv4kXL7A+U3p04Ded9QK/a36t51aySdaFoDxXDiW1JG2a
 Rn2tZ7/qAjbK2xaYi9CAP47pp/389nprCdaAhK/jpOw0ySY33u52oZiSRx4lFkW16mVfSlS54Xa
 WK2aSWLsyO+vu19X7HRyKiGCp2R1gAS4viFRNsaz/TVrMb2fm9LN0/4xU2cX1EEZrL66eH/AFfW
 bR0lADgoREzgO49Rqizm0EQzk0eUB9UCnPIDuv7W/orrfRpB1/QWoStBQ5A6Q1hWOI7e6C/u
X-Proofpoint-GUID: bI31KMDxb1HWjN0C3kVdSnvbBOHMoTis
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682d952a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=D5H_ezefHQ2CrDQh4HgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210087



On 5/14/2025 5:05 PM, Peter Wang (王信友) wrote:
> On Wed, 2025-05-14 at 15:25 +0800, Ziqi Chen wrote:
>>
>> Hi Bart,
>>
>> I tried the scan_mutex, from debugging logs, it seems okay for now.
>> I will provide to our internal test team for stability test.
>> And I will try to collect the extra time spent on clock scaling
>> path with applying scan_mutex.
>> If everything is fine, I will update a new version.
>>
>> BRs,
>> Ziqi
>>
>>
>>
> 
> Hi Ziqi,
> 
> Could we enable devfreq when checking if hba->luns_avail equals 1
> in ufshcd_device_configure?
> I think we can use flow to ensure correctness; it doesn't
> necessarily need to be protected by a mutex.
> 
> Thanks
> Peter

Hi Peter,

Thanks for your suggestion, and sorry for the late response—I was out of
office last week.

It looks like checking hba->luns_avail == 1 in ufshcd_device_configure
before enabling devfreq can ensure correctness. But I think the
function name 'ufshcd_device_configure' suggests that enabling devfreq
inside it is not reasonable. That’s another same reason why we moved
ufshcd_devfreq_init() out of ufshcd_add_lus() in this patch.

BRs,
Ziqi

> 
> 


