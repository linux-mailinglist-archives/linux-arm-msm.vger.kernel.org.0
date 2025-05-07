Return-Path: <linux-arm-msm+bounces-57126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1248FAADB27
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 11:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ED319A2F0D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 09:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDB9235044;
	Wed,  7 May 2025 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dAK32Fdk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229FF230BC6;
	Wed,  7 May 2025 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746609005; cv=none; b=ofjp2DB100JC3/nxTga8kwcGSHoskQIOTa8sh58wrrvEePyD6mbXjouiwoe+uiv/6XfRozA77ztOKVQGHq86i9HVZWEfsubSNHLoodIv3m8KPImzau3WMcLk/+gx4/M7tgXzYRwhDyFT80//GL1I1dI86Uh6NbOgk3MAT/HmBuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746609005; c=relaxed/simple;
	bh=oTEADaGhvVSEuaNFFV/TJPPDcsL5kQa8qkcI9R9Kmmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JeefMUoDt+dQn2TW3crh3vnWtVqehaKx0clThVSYUW5lnhsCUpPmbnUso1rcKohOwpJhfpnRgbYAz8/tHd1Iw7c1B7x+zH95HSuNRK3/xsmlR8Ilhe3cVc6/xAvlHtE7uV8LdhUe551+Vyt7oE6arUlX5xCQfSDkkRkeQjGNcpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dAK32Fdk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471HAoq018451;
	Wed, 7 May 2025 09:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBM8S074TwN2BfpJ9BPb0qos34gDmKjOr1NIAB/G5Dg=; b=dAK32Fdkln/BffKS
	3Bj4brnRaQFZPLjPTPi9gVo7LQOffPC4OjRzcCVWZ61QFTULNWgRUcj4VHLYwdDt
	IQYNsrMf2HjXP310v6Hy/2Js7XUfNbVKyCNku8xcUye3Q5BU9VN7oYUIOMMeOGtS
	q9+2KFAKoWB1KjUeZQRephB4ExspfY5vADkGPJWdPKi/afq/s+mGyqcqm7wtsZNu
	u+qJgNg3159q1dJlChyQ1DF8qGoL/M6l4mXFUWNgi7R1fIFqgKESPEc8s518iBNK
	wplOaguUemzxvlZwPt6fVGYVnJMi1KINopUlHCm7HhZY61lti/Bh3CVhPvo6B+aw
	xlezKg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tbd3qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 09:09:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54799aEI029229
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 09:09:36 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 May 2025
 02:09:31 -0700
Message-ID: <7c74a395-a8b8-4a12-9ddb-691f28c90885@quicinc.com>
Date: Wed, 7 May 2025 17:09:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] scsi: ufs: qcom: Map devfreq OPP freq to UniPro
 Core Clock freq
To: Luca Weiss <luca.weiss@fairphone.com>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <neil.armstrong@linaro.org>, <konrad.dybcio@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
 <20250507074415.2451940-3-quic_ziqichen@quicinc.com>
 <D9PS51XVRKLP.1AHMCRH9CZFWU@fairphone.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <D9PS51XVRKLP.1AHMCRH9CZFWU@fairphone.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gThEX7PQEC7rWMK1RSZtcS4KZZzRalq5
X-Proofpoint-GUID: gThEX7PQEC7rWMK1RSZtcS4KZZzRalq5
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=681b2351 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=1rUPmw_PEH3y1UJVBgkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA4NCBTYWx0ZWRfX31cra2OJhJEU
 8kTMHt73z33wJQfJH6bSCTb5ZkElo7U3ie9mgeuyHWSWIU+kbptXQ+ByvRIq2qpccY/ZE1PKoRa
 1X0jPw0kM67P6W4U8aY8sV1f30GiavRNahwoJj8b+CYTAckmtO+YWpXn5zpGcgjomA0s/z8mxuW
 xI3dTyUlJBQ6XyYWkt98lzua/0MqJL3HiE++2x2wlDhyH3Mz1bqpAc5HR5G/2VGDifsYzMhXgD9
 eHfby5phBBSNFxmTwEJ030OmPQH/G1vES8UU5kGM8W694UyJWGg1o9Z/UJJ3v394CNq4GrE52uY
 Qh4NSLyNmCraUMu0CgXQs3MC3e4my9TtVTWIXUB31euLFAwAm58zJ1p5tRYmm7MF686ksTqFRHJ
 zzuIP2iNJrmuJudKCBJ9ioG/kITiZZ6plXewjm3cwHqO4ib/PoTZpELVVJbyV/Ci9rLsYKi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070084

Hi Luca,

On 5/7/2025 4:19 PM, Luca Weiss wrote:
> Hi Ziqi,
> 
> On Wed May 7, 2025 at 9:44 AM CEST, Ziqi Chen wrote:
>> From: Can Guo <quic_cang@quicinc.com>
>>
>> On some platforms, the devfreq OPP freq may be different than the unipro
>> core clock freq. Implement ufs_qcom_opp_freq_to_clk_freq() and use it to
>> find the unipro core clk freq.
>>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 81 ++++++++++++++++++++++++++++++++-----
>>   1 file changed, 71 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 7f10926100a5..804c8ccd8d03 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>>   
>> +static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba *hba,
>> +												   unsigned long freq, char *name)
>> +{
>> +	struct ufs_clk_info *clki;
>> +	struct dev_pm_opp *opp;
>> +	unsigned long clk_freq;
>> +	int idx = 0;
>> +	bool found = false;
>> +
>> +	opp = dev_pm_opp_find_freq_exact_indexed(hba->dev, freq, 0, true);
>> +	if (IS_ERR(opp)) {
>> +		dev_err(hba->dev, "Failed to find OPP for exact frequency %lu\n", freq);
> 
> I'm hitting this print on bootup:
> 
> [    0.512515] ufshcd-qcom 1d84000.ufshc: Failed to find OPP for exact frequency 18446744073709551615
> [    0.512571] ufshcd-qcom 1d84000.ufshc: Failed to find OPP for exact frequency 18446744073709551615
> 
> Doesn't look like it's intended? The number is (2^64 - 1)
> 
Yes, this is expected. During link startup, the frequency
ULONG_MAX will be passed to ufs_qcom_set_core_clk_ctrl() and
ufs_qcom_cfg_timer(). This frequency cannot be found through the API
dev_pm_opp_find_freq_exact_indexed(). Therefore, we handle the
frequency ULONG_MAX separately within Ufs_qcom_set_core_clk_ctrl()
and ufs_qcom_cfg_timer().

This print only be print twice during link startup. If you think print
such print during bootup is not make sense, I can improve the code and
update a new vwesion.

BRs.
Ziqi

> Regards
> Luca
> 



