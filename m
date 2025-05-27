Return-Path: <linux-arm-msm+bounces-59570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 928EFAC51EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 17:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CE82162039
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA2C278772;
	Tue, 27 May 2025 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BvBC8bfP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B2514AD2B;
	Tue, 27 May 2025 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359439; cv=none; b=LE90aDqm4Bq3lx5v363ECiOimE2BduJ2osOjdddCbzOieJ9pRlpyPlr4NBo+jZ3EdaWSxkbg5VkYLl2Zride4W+Ymk77MAo+vS8geWGmQXM5ryUKHExDaazRaDgMZeg/Gw7QX9vt2Yy1Ih9KCDfKNTa21Txp/gE/B8ozWLEmbJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359439; c=relaxed/simple;
	bh=uHawQKNWyX/cJedS815p5gSoBiadOAdhl0e7BQ3THks=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mYR3qrCCKIaJl3KUGr/5ppKCobu27K9ASD7pPh352ElAtHm8fBZBO8af7DMcEqn0+sAT3maUnXVpa/4PSkm+q8Ht4O+bHF8Cv34NUtSt2lid3nX/bQnpuHuuIKmtVSJaBZFd94Gm93RsBZ8lYz3eZa93X/IK/Ze+APbFGt5OF08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BvBC8bfP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R7itaT028239;
	Tue, 27 May 2025 15:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WH41sOw46uGb0O/mCSIo69Vm7oio0sgM/j+ncmuu7NA=; b=BvBC8bfPOQEZR/j7
	+XXj7hmFjS2txjVbALo40AmFpZ81tzVhBpnPiVFH1xPSVhfSwwUS9aDVJZhsp2/0
	vXiMIqSsUXB88DDiulFauIY6PAhhmhDCGBJtalJ8dtl8cUkg88s/sm2/q6NFcElf
	G4SQL9sb4H2DZH7ihlmZIM9phup2jLObnJNMLt9eBl7PhIme3Ku042VBXBvusYWw
	AsidcLMrg2QAK49B6OiX5eiAZKPXXKECx/ubqf3FgkcElj+BFATjhGe1oiSKufOQ
	PsBKTUXG5J9AtWcbWb2FlSD5cMxqqHfufgB50A74uJ26dAuSXupJDxT9QO1Ddb4j
	JfQwfg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992hb1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 15:22:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54RFMsxm028681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 15:22:54 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 May
 2025 08:22:49 -0700
Message-ID: <93869cf3-de84-4f3b-b120-7126928a5ea6@quicinc.com>
Date: Tue, 27 May 2025 20:52:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 00/11] Refactor ufs phy powerup sequence
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@hansenpartnership.com>, <bvanassche@acm.org>,
        <andersson@kernel.org>, <neil.armstrong@linaro.org>,
        <konrad.dybcio@oss.qualcomm.com>, <quic_rdwivedi@quicinc.com>,
        <quic_cang@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <yq1msb6lowo.fsf@ca-mkp.ca.oracle.com>
 <ni7kedpcz7vchztb5qrs5msdt37mfdoabtt4gdqsaiwmbxlb2a@im4wurr77z43>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <ni7kedpcz7vchztb5qrs5msdt37mfdoabtt4gdqsaiwmbxlb2a@im4wurr77z43>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEyNyBTYWx0ZWRfX5pCPrc1zpff0
 ddINaK0caD+7H9oLrJq+xo1G13Cj9+QuLUJHQmSgyTHc/n4kwVEFi1/h+qVBCxNouy6ktD2sx2x
 6IbVaYZPgTE1HG7mH+SoHavsgMVNtFMnG4SZZCODBrENmr/TYs0XnjcRlyWjpC0dXoyfDPNUIPN
 ZTGR2fAh69hDDhb51jn7p5K5q8MwDVNGyS0RFSnCV+CCv0jcrwzOUYhRaW2gBV6cfGq1K72o3l5
 LI6O2vG+oGOPPzKIpc5qZk+TGprNOCGLzlavI0+5APsVw5uwG91cl/iek8/Zu0x654zE+z+gwXc
 u/582/GAL5YzEr99/S9MaSTStcJ1q7eEKm6kqJGO+ij8Mk08oMsWs3ikSAI2Qote4FHJu4t7xf4
 ffniZCHTl71+ZTxqckv6AWLUqz2+k/NRZvw2BnJxTjHuX/zCqiTyJMufiqbyFYTfUbz5Xbtq
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6835d8cf cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=HGgBVA14KErkiVD9HLEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: yiuvSsOzWlmG4o9TUWcDiMtnHK8qHTcw
X-Proofpoint-ORIG-GUID: yiuvSsOzWlmG4o9TUWcDiMtnHK8qHTcw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=904 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270127



On 5/21/2025 6:40 PM, Dmitry Baryshkov wrote:
> On Tue, May 20, 2025 at 09:45:40PM -0400, Martin K. Petersen wrote:
>>
>> Hi Nitin!
>>
>>> Nitin Rawat (11):
>>>    scsi: ufs: qcom: add a new phy calibrate API call
>>>    phy: qcom-qmp-ufs: Rename qmp_ufs_enable and qmp_ufs_power_on
>>>    phy: qcom-qmp-ufs: Refactor phy_power_on and phy_calibrate callbacks
>>>    phy: qcom-qmp-ufs: Refactor UFS PHY reset
>>>    phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
>>>    phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
>>>    phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and Inline qmp_ufs_com_exit()
>>>    phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
>>>    scsi: ufs: qcom : Refactor phy_power_on/off calls
>>>    scsi: ufs: qcom : Introduce phy_power_on/off wrapper function
>>>    scsi: ufs: qcom: Prevent calling phy_exit before phy_init
>>
>> What is your intent wrt. getting this series merged? Can the phy: and
>> scsi: patches be merged independently?
> 
> Unfortunately PHY patches depend on the first scsi patch.

Thanks, Dmitry, for mentioning the dependency

Hi Martin,

After addressing the review comments for v5, there has been a change in 
the patch order.

In the latest patchset (v6), Patch 2 (SCSI patch) is now required for 
the functional dependency of the subsequent PHY patches (Patch 3 to 
Patch 9).

Patch 1 (SCSI patch) addresses an existing issue and does not depend on 
any other changes.

Regards,
Nitin



> 


