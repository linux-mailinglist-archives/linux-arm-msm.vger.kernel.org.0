Return-Path: <linux-arm-msm+bounces-62290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F37A2AE79AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A4E81895D59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 08:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A923320DD47;
	Wed, 25 Jun 2025 08:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NxLWfs3X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BF61E5B95;
	Wed, 25 Jun 2025 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839286; cv=none; b=MhZsMfWnUu2Id7i8NCsKfs+WJMNzTdRm0YXMMIDBqfNVvsfp2J0uaPZHTygzZIcU3EfUu2mRWiAaGTPXN0kSO/3gKgreEzsYHUERAJejGc1D/IXREdwb0CHTdztzCxeNtkQVoDK75cDxu0su88+0yvFnYRwdiWKTKa3KL8v2AL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839286; c=relaxed/simple;
	bh=GqL4CggirbV7hh3xRcy8wiv64QmZ9L7ToVZj95DQD6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=J+U1Mptaaj9n0psHj4154L2x5gJGCejupwT7boEB2ZHS94SLAtmF5mUtFpjQRQBOq7YAE/g9wVEcWi0F2NeBtLgHY+XoqLIC8auX3inHD3ALu3Jy6uGvVedXkFamiAhjTSK0udiEQCBpra/shuQWpILl1rEh1ADKFH8jTRttE4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NxLWfs3X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P3VeN8027585;
	Wed, 25 Jun 2025 08:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nRekJoixgz1lLAacTbvKF4g/prEyVh9BWko1JVSwWmM=; b=NxLWfs3X8Y9IVQoz
	k69ID8KA+w8iv6gs6kVp5gyUNFs3U9nppXlW+EwufyTGuZgwWiRFxwwaL16SoBo+
	/ToheVArOI9JWNijwXSC1gTlZcl0oDs66d208Ej2BhthefBFVJRn7ragWCmMbS9W
	mD8toV1p3R0AzMii4OfMWFBMIgJYqxt7WWLAMCq0UbXnHcQRqL8/tzqVhMOh10Hj
	aZNgfb+tAaKoQRoKtnTFyDXpNGllrJeDTfg2E8Le9Mat17azwA7r3vfgyXP3hJ4j
	VCdAeHt5BnYokVHz8Yli95to5hOOoQA3Qn8/DQKVwRfc0DQHRFevsKGqmVSwZYLW
	wY3EYA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqnjve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:14:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P8EJGk006042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:14:19 GMT
Received: from [10.216.41.135] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Jun
 2025 01:14:14 -0700
Message-ID: <c9528c12-378e-4072-804f-0f269246f4ed@quicinc.com>
Date: Wed, 25 Jun 2025 13:44:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] scsi: ufs: qcom : Fix NULL pointer dereference in
 ufs_qcom_setup_clocks
To: "Martin K. Petersen" <martin.petersen@oracle.com>,
        Vinod Koul
	<vkoul@kernel.org>
CC: <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>, <konrad.dybcio@oss.qualcomm.com>,
        <dmitry.baryshkov@oss.qualcomm.com>, <quic_cang@quicinc.com>,
        <vkoul@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Naresh Kamboju
	<naresh.kamboju@linaro.org>,
        Aishwarya <aishwarya.tcv@arm.com>,
        "Ram Kumar
 Dwivedi" <quic_rdwivedi@quicinc.com>
References: <20250623134809.20405-1-quic_nitirawa@quicinc.com>
 <yq1bjqcoblg.fsf@ca-mkp.ca.oracle.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <yq1bjqcoblg.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4oAVagPOQyK9XJNHnwVF2s5gUIqSxlnG
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685bafdc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8
 a=yCiMO8VnE8-TVoMtNoQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4oAVagPOQyK9XJNHnwVF2s5gUIqSxlnG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2MCBTYWx0ZWRfX0eh+pwMCeW8B
 GP3tTR09qzoiP4PQwmoMVW2GhUCbTsCGdHgsSX5ai9hOSmJ02N19vfVRxQ9wMjZjwZiNGzIeo8A
 ObYJW0DBDEcayH9fahHfaKfGioD8xg5AiMrEJTNxXUXK0KjLGs5KrEWN7Z5lpSo416MxR4zNmbK
 27Y2g9n5L4csxGCYQi+2tpgBwtpwupC96wZ5Ev2JXBj6q/+sPMDNNdYaAmUL2ElMquC1RMZWwK8
 W+CIMUO4xdGEQdj9ep6svAHFSIqmXR9aYFMhjP3PA/0eUsp6QQYp748H0ChGJCoTt+Q/VkK0Sv+
 fHg/sLs0wIrxdMhmI1hsPluF/DalFRQNtLjoAVLyUqZcBMBilDa5Ad2yEZVj5sEgAAcfywddubJ
 ZyF27RlsRTBv8SkGVv+x9wIRoHRll93nGfXO3JJIQXrjR5k+chTewR2sMNJnpJjMdFYvek7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250060



On 6/25/2025 6:58 AM, Martin K. Petersen wrote:
> 
> Nitin,
> 
>> Fix a NULL pointer dereference in ufs_qcom_setup_clocks due to an
>> uninitialized 'host' variable. The variable 'phy' is now assigned
>> after confirming 'host' is not NULL.
> 
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> 
> This will have to go through the phy tree since that's where the rest of
> these changes went.

Sure Martin. Thanks.

Hi Vinod,
Please could you merge this change through the phy tree.

Regards,
Nitin
> 


