Return-Path: <linux-arm-msm+bounces-57242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57507AAF839
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 12:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59B157B24AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 10:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAAC1212B3E;
	Thu,  8 May 2025 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a1DInkkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EAF211A3F;
	Thu,  8 May 2025 10:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700994; cv=none; b=u3OOUXlZBV1yTi2yRDZFKAME/azrYqrcDhLVjy3Dou/ok5DmKQX/e59GZtTyWE6vGfgnBPra9OCAgtgNjXy7PJtcyQ+tZQFCeeupb+2OLvLXLGH+kB7UufDN89JSRJea+7ymSOfyI6KkuFBQpwL/GHFRcOFmvjyJPmZ3pJ9tP7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700994; c=relaxed/simple;
	bh=Oj+f3fNpaRmywlP/8WRe2gvKZdCHEW9rgRJAIINkey0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pJflU1Tcd7Q5EF+Z9heHEzf+6HPDDdNHmAYvkhaKqIzMq6ziUFYTiywLoMdYW0DQcalkrwvahVuS8cxNiohqv5FjRaMOz85FiB0AZXm/eMsJhmXGv9hhfc2uKtVo3NTV1A/V0kjvdfGmy92/ZX/xYKn05pCCqTDX7fjy4rXL0i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a1DInkkd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484X2c4010563;
	Thu, 8 May 2025 10:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Tq41nLm+5muL4bx925dxv59LEk5NNNsuX/r1mf5DwM=; b=a1DInkkd8VNthU0k
	2vTozj4pY+9xmXGYnJvMQHCbOEslm7JZdSHTrEyrYcC1yt+VsJzERbKySGmTsjYS
	7xFQFRsw4PLpSTSnXjHpYTGqBieeYBme5K1sKzYgajt8mkxj+zwBS1jVp6ArZmW3
	gqnqJ61kaJw6vwYtKbTTJVnzZGMPEYtssDxKWlaq9HgyoZqEwlrgLcorCMOYacqg
	6LzEoBGqm175KDLTTjaxBDe7dAFG9nZ3zMl9ElJV7YOqeGjSOR/yiKD6Jh6aAd+0
	cnoiCbSpC9eQr3JmBRvLp6d3g6ZDDjxZMLOJ7oDaVjd9i5j91JA7W5miNn+eqAS4
	3id+mQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp79172-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 10:42:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548AgmeM001995
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 10:42:48 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 03:42:43 -0700
Message-ID: <933da6f7-c53b-4d29-9198-016b95d7dc9c@quicinc.com>
Date: Thu, 8 May 2025 18:42:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] scsi: ufs: qcom: Map devfreq OPP freq to UniPro
 Core Clock freq
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Luca Weiss
	<luca.weiss@fairphone.com>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <konrad.dybcio@oss.qualcomm.com>
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
 <7ccbd722-c99a-43b3-9ceb-4c207521822d@linaro.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <7ccbd722-c99a-43b3-9ceb-4c207521822d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA5MyBTYWx0ZWRfX/hJma7aj3SRl
 z5j+TD08KaESgXBmMv+6RSB+NNHm9YvZNm0QBJb9kLqwbeqXrjGQtWW4HwyP+gDsDC/9N9RLCkc
 iKooTtl519OqV3KaC8iVkkYFLejt5ab2f5p9/6nnY7gok4pMjlvSmxpOhzsLFYlJzLAN04i2psa
 0zyX0mNZnKHv5LhuRL4chfPYfv+BFekYxN5aWt9yRa177orHaW0XNBQQeecX1N5Jq1H7ZAy7gVL
 VUxemkElHiWfAMAI08CLYLe0Ep7a4Za6Rj80e9wV1lUYVgFLsNUJgUr5M93xCDZTIbPIZMo6hJf
 KFUK0lph/W/5Pd8uUVSj8AdOTpAK8I+QYFpmQUoEDzUbTbX4ckNxHz8P492Guq1UtRcsajfCEwO
 NlUbBk07LwcNPz+sN9WfE5hw82CD2rBU7pkmMnYI3Ibui0q+RBrlgp0N5gkDECbu5qq4F41W
X-Proofpoint-GUID: nLAuIsnqO4otcvbnxe3QPSdzptv6EF0R
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681c8aa8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=OEBQwLZ44JOV8wgSCF8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: nLAuIsnqO4otcvbnxe3QPSdzptv6EF0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080093



On 5/7/2025 7:59 PM, neil.armstrong@linaro.org wrote:
> On 07/05/2025 11:09, Ziqi Chen wrote:
>> Hi Luca,
>>
>> On 5/7/2025 4:19 PM, Luca Weiss wrote:
>>> Hi Ziqi,
>>>
>>> On Wed May 7, 2025 at 9:44 AM CEST, Ziqi Chen wrote:
>>>> From: Can Guo <quic_cang@quicinc.com>
>>>>
>>>> On some platforms, the devfreq OPP freq may be different than the 
>>>> unipro
>>>> core clock freq. Implement ufs_qcom_opp_freq_to_clk_freq() and use 
>>>> it to
>>>> find the unipro core clk freq.
>>>>
>>>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>>>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>>> ---
>>>>   drivers/ufs/host/ufs-qcom.c | 81 +++++++++++++++++++++++++++++++ 
>>>> +-----
>>>>   1 file changed, 71 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>>> index 7f10926100a5..804c8ccd8d03 100644
>>>> --- a/drivers/ufs/host/ufs-qcom.c
>>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>>> +static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba 
>>>> *hba,
>>>> +                                                   unsigned long 
>>>> freq, char *name)
>>>> +{
>>>> +    struct ufs_clk_info *clki;
>>>> +    struct dev_pm_opp *opp;
>>>> +    unsigned long clk_freq;
>>>> +    int idx = 0;
>>>> +    bool found = false;
>>>> +
>>>> +    opp = dev_pm_opp_find_freq_exact_indexed(hba->dev, freq, 0, true);
>>>> +    if (IS_ERR(opp)) {
>>>> +        dev_err(hba->dev, "Failed to find OPP for exact frequency 
>>>> %lu\n", freq);
>>>
>>> I'm hitting this print on bootup:
>>>
>>> [    0.512515] ufshcd-qcom 1d84000.ufshc: Failed to find OPP for 
>>> exact frequency 18446744073709551615
>>> [    0.512571] ufshcd-qcom 1d84000.ufshc: Failed to find OPP for 
>>> exact frequency 18446744073709551615
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
> I think just don't call ufs_qcom_opp_freq_to_clk_freq() if freq==ULONG_MAX
> 
Thanks Neil,  yes, it is a way , let me discuss internally and update 
new version.

BRs,
Ziqi

> Neil
> 
>>
>> BRs.
>> Ziqi
>>
>>> Regards
>>> Luca
>>>
>>
>>
> 


