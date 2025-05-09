Return-Path: <linux-arm-msm+bounces-57424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6667AB127F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 13:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AFE11BC753E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 11:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D6228F95D;
	Fri,  9 May 2025 11:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P2NFZNQi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E517D255F22;
	Fri,  9 May 2025 11:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746791467; cv=none; b=ODyr8ow1moIrY5/eFG9zAbOwL065PkwZZv1Tq5SUW8glfrlBZ6CUgBG1m3brzt4tk7LJBx5GTR3sDBfqUg91c2D2+C0g9otQEj6UX/z1zcdqKklZpLmoukclMs7E+csaAVdV5wSHzJddlh9q2PbkJ+2LEHqvMdoh3U9WZKDcJ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746791467; c=relaxed/simple;
	bh=xWAVJ7WXntaXs6R6b/9gxW02yhTWzLotIqYjdIhWdpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hPHVu/IUX0hMHk3So7sbYbUy5nLBTnDQ1oYAGBrhk6GYJa/Cl0xR0IIUNAaZG1BLShXa/Fu2T81xQRyc4q7IsdSMjybPiIRU57NMkaZ0K9wFof4Xd8EbpOe6wYS2TlWdmnWDkWPpT2gA5n3R5B/5+PQ1L1+/JCeAbRdhRssUl2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P2NFZNQi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BOjgC011683;
	Fri, 9 May 2025 11:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wcjyC4RU0XzRhe03o9O3Yoll6G1rZmCSFvV0iAa+k0=; b=P2NFZNQiPeg6rBnl
	apvrkTjvEkEWeX7mlYc62KKmAquKX3ChxF0FtRZEmDBPm0qgzxGNFj6jQ7nxdwc5
	GEMoVTKOaejFavPOROH+rwO2kZ0YC9ZtexH70/1pbEF7jYtIqc7xlIhr8ZMnv2Sz
	feSLhKQnzxCs44/BxhNy2ENtPoL7ceCqlMBeE0KI+igmTsvI5iHdjW31+qAPYU4F
	0nZShgM1HOVpgvB9U8E3f/hm2rY0SEgm2jG5WEp4e1RkdhG3zN4CvhQfy9wSsiZG
	dPoq0V1O/3/n8tkDd1KSbNLSeua6ZOld2Yn3kDGQe4HrYTuhAu/Plpd0ntOFFnjw
	3V6ijQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmmhsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 11:50:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 549BoibW009832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 11:50:44 GMT
Received: from [10.216.32.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 04:50:38 -0700
Message-ID: <584c9160-165c-467a-9ef0-1b6fd0441012@quicinc.com>
Date: Fri, 9 May 2025 17:20:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 11/11] scsi: ufs: qcom: Prevent calling phy_exit before
 phy_init
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>
CC: <quic_rdwivedi@quicinc.com>, <quic_cang@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-12-quic_nitirawa@quicinc.com>
 <104e863f-a5c6-432d-8f65-0fd87602b288@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <104e863f-a5c6-432d-8f65-0fd87602b288@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681dec14 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=IgDchYdROQb07t49yvYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7GUXL9fFmOILJ7u6gsJL1VsLiBh9R1dg
X-Proofpoint-GUID: 7GUXL9fFmOILJ7u6gsJL1VsLiBh9R1dg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDExNCBTYWx0ZWRfXxFnx14iNA0W2
 ZtlgknrmvaXtajTYoq0RWWHYb3Q67e3x6P0SR7AwVCz5pfTAaI6dpxLMnm+/rh8VvPJA4LkcHWv
 fXUw3RVN3zT+T3ElvN21TlP9fR+wUlkDOSBJQ1TgoASSNUQTbHtnw6I+weDxwjgdVlw47yoD4I2
 vBDmMa0iU6ONl9mrkcgGb867p7NkQQiQLyIVcPStQJzSF7S1DuwW/vSN1TNUScNb22DwCVwl6cq
 bT6I+HA6rZPMe1SWxxQxrL/mXJ301Ln99yo4apjeLWQnxp5h055ZCoItKysYP171bkh82+fSSJE
 x6YjfNIDsREEGPYoitl0d7oqfCl8tQNokOzxHAfuLHAB8vDeibU6zD1s6e4JfFBfXBSCUWMNzEa
 d5Q6KZ2u7SivGupjYRf+hQpsczQW/kvrRWT6VhRowZLgBqxWj0QsLvSwUA0380UfUY0troG/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090114



On 5/9/2025 5:08 PM, Konrad Dybcio wrote:
> On 5/3/25 6:24 PM, Nitin Rawat wrote:
>> Prevent calling phy_exit before phy_init to avoid abnormal power
>> count and the following warning during boot up.
>>
>> [5.146763] phy phy-1d80000.phy.0: phy_power_on was called before phy_init
>>
>> Fixes: 7bac65687510 ("scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()")
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index a7e9e06847f8..db51e1e7d836 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -482,7 +482,6 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>>
>>   	if (phy->power_count) {
>>   		ufs_qcom_phy_power_off(hba);
>> -		phy_exit(phy);
>>   	}
> 
> You can also remove the {} now
Sure will review while posting next patchset.
> 
> since this is a fix for existing issues, which I don't think has any dependencies
> on your other changes, please post it as the first patch so that the maintainer
> can pick it up more easily
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


