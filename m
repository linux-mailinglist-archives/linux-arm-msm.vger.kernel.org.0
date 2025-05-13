Return-Path: <linux-arm-msm+bounces-57699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79392AB55B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 15:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B94F27B4E72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 13:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB50328ECCE;
	Tue, 13 May 2025 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IGB1r/v/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9F228EA42;
	Tue, 13 May 2025 13:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141958; cv=none; b=G66Xb9nPIRRlBuaYxRlSjBXZt/I1tYRLqjwYQZkayVB8X+qDdhEaEj1xapnS9JiMWyhaczg/UzcLCqQ74HJknpZ+ilZ2BATemyj/tZM/f2bk7OU+3f91+w9JMvGEXTy3gjPIkCSAYAqex6PiE36iBYWDYViooUUN9SsXuPsQ2Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141958; c=relaxed/simple;
	bh=FD8ON+zcVfRRTenFUww2Qf/g79bXnESntwotq607B/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KjqbYFrNeBqBNy+x+gsty9wucuX/mXqZ2U62I9Qp6Q37FvZatRAJKtwOWWzlDB4KrYQyLFQFwucWn+KBlRvEw/4592yK3+EI9WmeMB17cpF9ItH7JQerZXOiJB0Z0gWrNnkUYqTPw/PAlBjN/cizhMPM/+5+pflxpl1Md+X6OoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IGB1r/v/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DBdfdD027707;
	Tue, 13 May 2025 13:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kCTGJVVj8RmqAo9suFmP593apdKnqfz+TSHKtS17EL8=; b=IGB1r/v/am20F2qI
	GbK31AjgQF62/53DwIWLHe0YjaJJe3Dmaitjh2ZRZXstvOoXGsxw8UQq+L+NUhBr
	96t9MHHDrdei0xA0D9N5sRmK/g8dFT7jqvKQSVDi6FEorJzp8WyuIgt1s2W0fE1s
	/JdBad9iYNIk8qnrqmnBR+377eVd3OTQ4O1SDKx5I1EKiksP6yG6PVNhOskASLQy
	/HoJJrQYOJgmJrSxw8b3C4OYAGgQdBLtf6uutf3QcnSpakH9Se6gq1fvz8ao3IOR
	zPYdhQ04aPbXmBZYmAB5YPPtZ91T6g4qo11mc1Rihil4is/PY2qai5Y7gTUUSplk
	srta5w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hvghg3v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 13:12:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54DDCDRx030092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 13:12:13 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 May
 2025 06:12:08 -0700
Message-ID: <939d4d07-c055-4e99-9d56-19cb7fdfa1c9@quicinc.com>
Date: Tue, 13 May 2025 18:42:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 10/11] scsi: ufs: qcom : Introduce phy_power_on/off
 wrapper function
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>
CC: <quic_rdwivedi@quicinc.com>, <quic_cang@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-11-quic_nitirawa@quicinc.com>
 <58d913b8-0715-41b0-883a-423f29cb5a8c@oss.qualcomm.com>
 <be69cd1e-c04c-4976-9be1-390631316d3f@quicinc.com>
 <4a72ea06-22a8-4f8c-92ad-b5b3afa25b70@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <4a72ea06-22a8-4f8c-92ad-b5b3afa25b70@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0lOilMgDkls3J-Oot3wGBUyIbpmjDo8z
X-Proofpoint-ORIG-GUID: 0lOilMgDkls3J-Oot3wGBUyIbpmjDo8z
X-Authority-Analysis: v=2.4 cv=AMDybF65 c=1 sm=1 tr=0 ts=6823452d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=sYTkcTt2xfybeOqe0B8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEyNiBTYWx0ZWRfX1VY38sj2SPpZ
 +AcNE40bOCJ8fUVkzZnmmOnQfwyrn2t9rPNKVyIL0OnI4QhBcpWI3CJr45Ky7gXJilN5DCmm+g7
 5vFWp0q2MQt79zE6zwfLP0fo0MtBtMGEo/ScNy9OhsCjXKzp/fOqoR9rYv7AanAxPvEKTR3QKSp
 GDAS61H0kiqS+/Qm9kNffmOD6Jz6CYMW/2CDleXJJRsEooKHLZHwwKFi1r/3xusmir2CwacX5A2
 nNMosc3zq5RAl4T9o9nP/qtl+JAHHzGPRz2s+j9JCaC37Orvv/RHs0iaomigckuror5qEs3a1wO
 myadJkgibOuE+rBvHzFj9bIOC8cV2Ss8CKPk+9ZWVGPrrsBGvVv1WaHgP9Eo4YiJJ6uLwk2weu4
 8LxK+mYpTzh8Zb4SdOCZSVbTvK1GWAdVTPS8uLPLZr4oIqbV0lYts3aLNHwEsJeaSTyjKNsV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=945 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130126



On 5/9/2025 5:30 PM, Konrad Dybcio wrote:
> On 5/9/25 1:49 PM, Nitin Rawat wrote:
>>
>>
>> On 5/9/2025 5:07 PM, Konrad Dybcio wrote:
>>> On 5/3/25 6:24 PM, Nitin Rawat wrote:
>>>> Introduce ufs_qcom_phy_power_on and ufs_qcom_phy_power_off wrapper
>>>> functions with mutex protection to ensure safe usage of is_phy_pwr_on
>>>> and prevent possible race conditions.
>>>>
>>>> Co-developed-by: Can Guo <quic_cang@quicinc.com>
>>>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>>>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>> ---
>>>
>>> The PHY framework does the same thing internally already, this seems
>>> unnecessary
>>
>> Hi Konrad,
>>
>> Thanks for the review. There are scenarios where ufshcd_link_startup() can call ufshcd_vops_link_startup_notify() multiple times during retries. This leads to the PHY reference count increasing continuously, preventing proper re-initialization of the PHY.
> 
> I'm assuming you're talking about the scenario where it jumps into
> ufs_qcom_power_up_sequence() - you have a label in there called
> `out_disable_phy` - add a phy_power_off() after phy_calibrate if
> things fail and you should be good to go if I'm reading things right.

Hi Konrad,

I meant, ufs_qcom_power_up_sequence can be called multiple times from 
ufshcd_link_startup as part of ufshcd_hba_enable calls for each 
retries(max retries =3) and each attempt of ufs_qcom_power_up_sequence 
is success increasing the power_count ref to value more than 1.
But this is handled using the patch 7bac65687510.

Similiar scenarios can be possible in ufs driver , where there can be 2
phy_power_on calls which may caused caused phy ref count to be more than 
1 and this inconsistent behaviour may cause issue.

Hence having is_phy_pwr_on flag can help here.

Thanks,
Nitin

> 
> Please include something resembling a call stack in the commit message,
> as currently everyone reviewing this has to make guesses about why this
> needs to be done
> 
> 
>> Recently, this issue was addressed with patch 7bac65687510 ("scsi: ufs:
>> qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()"). However, I still want to maintain a reference count (ref_cnt) to safeguard against similar conditions in the code. Additionally, this approach helps avoid unnecessary phy_power_on and phy_power_off calls. Please let me know your thoughts.
> 
> These unnecessary calls only amount to a couple of jumps and compares,
> just like your wrappers, as the framework keeps track of the enable
> count as well
> 
> Konrad


