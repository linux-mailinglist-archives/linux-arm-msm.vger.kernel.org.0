Return-Path: <linux-arm-msm+bounces-57241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CD7AAF82A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 12:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55F649E35F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 10:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E27A2153CE;
	Thu,  8 May 2025 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TCpVtvS4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E961A2C3A;
	Thu,  8 May 2025 10:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700806; cv=none; b=VVOCsJfT2dkA6fS4MObAU2t6sAh2D0GaLhJMRiuFEBGDFYVnxtEn9uubhtl1E14NvBV/XSALIdwJmI5v6KTgo8OfySpGJNuj8Sa4qFVb/K2Qhg2H6FnnZ4e0TvvkAFl8hyKzH+l7Ck3ARW/RG6Sy8sAiHoZ3gR0HdHF5AOnzG34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700806; c=relaxed/simple;
	bh=lzp2J1+gsFdHtyb5OEJYe8qGILqb/HGxgnci7HjvFX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HnBrqKg9x9UhrAAUUAtzQR4fePYJXplKbJ+ECtNbDpbCJQiPtTUGdQkTpru66U0vpsCY6772hVUkgwsSSGrW2eHoeaVEnQSN2FY2i4TZqmgdNt8RNu1CQZCxnLyXFmdosE2aot7cJWCjQGgFbMKGsvKxaEN6PMHHscRJVB+qNFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TCpVtvS4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5488lSHV019189;
	Thu, 8 May 2025 10:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hr0aPinub4tAud9BSk7ccVmzmQHn/Ny8CMOYC/u3PMs=; b=TCpVtvS4ABLRrV+r
	YoHtLwbudtxA8JzdFYwM4YMKzDOLdMAsS7VaIViX0avXvm9rRiWwlo044z5UER9t
	h5ML/iJX+5R596lFCxIvyx9y7JQOrvWAyhwyW2ynpEyY/xGbXljYTQ28qmejgp/Z
	NhIKA+eObZBf4fNzQFTNlS6+MdnKxRy12x4/Fc9mMF0lELGpKSFQGY6aWvv4MAly
	sXBPqHOEe4N+uYPBv68Us8AC1hOSD4phjPHCP3Ale5tq31FgwG5wRJy/18R4yP7s
	nluT7eGj9CtfMkn9dNxG0VCl+zhBGVmQZG6vB9QghTH8bQZJrXOpaqUBsZ7Y7iFK
	V7MrIA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj0c94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 10:39:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548AdbW1011759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 10:39:37 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 03:39:32 -0700
Message-ID: <811c7c41-c52a-4c61-b35d-b921568429c3@quicinc.com>
Date: Thu, 8 May 2025 18:39:29 +0800
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
 <7c74a395-a8b8-4a12-9ddb-691f28c90885@quicinc.com>
 <D9PU9LEA7CLT.37IBLZRP90E9S@fairphone.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <D9PU9LEA7CLT.37IBLZRP90E9S@fairphone.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681c89ea cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=OEBQwLZ44JOV8wgSCF8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA5MiBTYWx0ZWRfX3AZjOpP8iy7b
 vJnbVEKUZOSN1o8tTuRRxKHNC5bxbw7H+kk21EeJr+8Zb8waGcsoCMO7b6D0rLPs4pUO8tNh1TE
 aUd1CZGqktMMG5Qpm0YvJklrcjRZMql6PI0FXksdQtQ2oo/srjLpIbiVr7TcV7asqMlcgbtkZ4y
 aKsHBSDoO+0DF5tfismFJvaeijf9nPI2E4odadCnmycyJ+OWaAgpxTkd8y+SO6Knf6XYFINyBDH
 vt1zMa/lWYCMxFciXwAsTIMNuNhl61ahoHRqYi/Knd8SNiYKOO9Thyq0Gc3O0FeDnH3K3xrWx18
 kfKgbL91NJByEa+wu9pUIVIO/4uvHNwqxMVNvKnybPDIXd1BQ0jmjRZZZ1tY5ZKEM2IReVdyr6S
 MWO2SsB6NNhzCW9l5JDcHBTUPhInnOgG2qEHAeeaNi8LRfYLyys/dNUHOWo0OQF6dq7pTZwE
X-Proofpoint-GUID: idujXSwdNlbp_1WJkM_BEi8XYtU8dIuR
X-Proofpoint-ORIG-GUID: idujXSwdNlbp_1WJkM_BEi8XYtU8dIuR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080092



On 5/7/2025 5:59 PM, Luca Weiss wrote:
> On Wed May 7, 2025 at 11:09 AM CEST, Ziqi Chen wrote:
>> Hi Luca,
>>
>> On 5/7/2025 4:19 PM, Luca Weiss wrote:
>>> Hi Ziqi,
>>>
>>> On Wed May 7, 2025 at 9:44 AM CEST, Ziqi Chen wrote:
>>>> From: Can Guo <quic_cang@quicinc.com>
>>>>
>>>> On some platforms, the devfreq OPP freq may be different than the unipro
>>>> core clock freq. Implement ufs_qcom_opp_freq_to_clk_freq() and use it to
>>>> find the unipro core clk freq.
>>>>
>>>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>>>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>>> ---
>>>>    drivers/ufs/host/ufs-qcom.c | 81 ++++++++++++++++++++++++++++++++-----
>>>>    1 file changed, 71 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>>> index 7f10926100a5..804c8ccd8d03 100644
>>>> --- a/drivers/ufs/host/ufs-qcom.c
>>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>>>    
>>>> +static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba *hba,
>>>> +												   unsigned long freq, char *name)
>>>> +{
>>>> +	struct ufs_clk_info *clki;
>>>> +	struct dev_pm_opp *opp;
>>>> +	unsigned long clk_freq;
>>>> +	int idx = 0;
>>>> +	bool found = false;
>>>> +
>>>> +	opp = dev_pm_opp_find_freq_exact_indexed(hba->dev, freq, 0, true);
>>>> +	if (IS_ERR(opp)) {
>>>> +		dev_err(hba->dev, "Failed to find OPP for exact frequency %lu\n", freq);
>>>
>>> I'm hitting this print on bootup:
>>>
>>> [    0.512515] ufshcd-qcom 1d84000.ufshc: Failed to find OPP for exact frequency 18446744073709551615
>>> [    0.512571] ufshcd-qcom 1d84000.ufshc: Failed to find OPP for exact frequency 18446744073709551615
>>>
>>> Doesn't look like it's intended? The number is (2^64 - 1)
>>>
>> Yes, this is expected. During link startup, the frequency
>> ULONG_MAX will be passed to ufs_qcom_set_core_clk_ctrl() and
>> ufs_qcom_cfg_timer(). This frequency cannot be found through the API
>> dev_pm_opp_find_freq_exact_indexed(). Therefore, we handle the
>> frequency ULONG_MAX separately within Ufs_qcom_set_core_clk_ctrl()
>> and ufs_qcom_cfg_timer().
>>
>> This print only be print twice during link startup. If you think print
>> such print during bootup is not make sense, I can improve the code and
>> update a new vwesion.
> 
> I'll let others comment on what should happen but certainly this large
> number looks more like a mistake, like an integer overflow, if you don't
> dig into what this number is supposed to represent.
> 
> Perhaps an idea could be to just skip the print (or even more code) for
> ULONG_MAX since an opp for that is not supposed to exist anyways?
> 
> I didn't check the code now but for other frequencies this would be an
> actual error I imagine where it should be visible.
> 
sure, let me clear away this prints in next version.

BRs,
Ziqi

> Regards
> Luca
> 
>>
>> BRs.
>> Ziqi
>>
>>> Regards
>>> Luca
>>>
> 


