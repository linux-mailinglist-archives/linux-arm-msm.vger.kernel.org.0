Return-Path: <linux-arm-msm+bounces-66423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B72B101FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 509701C272D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 07:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D36230D14;
	Thu, 24 Jul 2025 07:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bn9F0a57"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640E6226D14;
	Thu, 24 Jul 2025 07:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753342590; cv=none; b=H06VtH/UeTUmCDGyQglMOn+AJ3OthI/v5DtaMby0EH0av09nBIGEZqlNW+tqwPzqAR3m2BC/uWf+QbM3zMKO2eKVumiBCCD7VgBoLUYzWwXlztxJv85nso77Pv7dZa3/TqGok7/2HZq+4lqpqLNce7FjFpSC4dijmcrnOWRh0yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753342590; c=relaxed/simple;
	bh=nMaCPNgJxAZ+Z6gUoYUV4uYMBAEZDlPPNfPPbFmr5Lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ejC0KLXaro7sjfMb+Szw3Zj+f/yw6mW12p8v28LopIyiBlXCSnI2QRgrouxp/wnMI5xhUqlA2q1ifL4DvW+mxe2NphJAt1+G5M+Q1NEItOHfvqo89K+jxrsrsyuzB4CdRzZwbUGa3AB/ylFEI3Ov6GltIU2cVIyf5ArxHhR8MXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bn9F0a57; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O6dGQ8026311;
	Thu, 24 Jul 2025 07:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CdBXK+9aEQTHVMQXScWXjgPZoDh4Ht96J3vUY1AVD/I=; b=Bn9F0a57vYypS+KT
	7EmmFy90cR9YHj2f8l+HUixDrQZCPOsDzxp8h2XEB7RU+mzOYN8yMiQ+IKi85m6N
	44RVjC8K1/b9q4kZ7UJWcrJGyuD9R9T6U7Yo3BMw9d9Maen87+CC3yj1lrAqi5nO
	nZTXMrA1iYjkhulugWJtFRxrTjWopht95MwF7u4WVyxdIptjNBTMcnEBW6P+x01o
	obtgTy7LgAPyebLvFupVUdwAk7UBcaiTFSu8NgLDiJAJxmTfWSsHzG1sxgTGYieD
	cmXsO65kuNzCZUnqH7E3veScvOIZitOJrrvT7iBhLcubzhV6WuZzMhKx49eEqQBn
	FGgWpQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483frk056s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 07:36:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56O7aHMX017380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 07:36:17 GMT
Received: from [10.216.5.39] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 24 Jul
 2025 00:36:11 -0700
Message-ID: <ca3ac027-3cd0-4093-90b2-6e097e7f8cf8@quicinc.com>
Date: Thu, 24 Jul 2025 13:06:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <James.Bottomley@hansenpartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-3-quic_rdwivedi@quicinc.com>
 <kavkq2wgtapagzcdvm3lcvy52bcgbqul6oqjaluvzi3q2a5z6g@jzrowliqets6>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <kavkq2wgtapagzcdvm3lcvy52bcgbqul6oqjaluvzi3q2a5z6g@jzrowliqets6>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA1MyBTYWx0ZWRfX7wNfYM3vL1M4
 C+Gl1ImqmMc2UwGt7W1gIuA8RyRxmIQzkv4sTgYRNKeuvm8WhJnwMKUdXapkVy4fL9w0K/Q4e8c
 hQRaHvOv4t6LbrRuW+LjuGA1Oel/jgnQKpEUTQMzjdLfbz+Jh9HgbO8vHp3ozAJLBV939LbShYW
 n22KhvNpWHRl6djp951/UuVu8aEdINoAxk0y6RHl4VqwnkG/Whv3CW+1pYUfbdehFnlOKfmwTQh
 KBJyFQ/4GlKZh+V1Wl85Js70FHL8X2tuomx8kOjepNUDuI03cH/HOd+HrLgW18PcbcmRocVZkvr
 ZuBfXDflgxZzLBBkmEOCU9W5SwghEoAfODmDBenl8mUm3j+IWLltLz/EQHLw1Pt7DZJzBllGn9O
 ahXae0wNpFZVBCBlJ46VWizIlozjFVHjiVAm92HGBNFkVmMDR3ajc0OamQ+CM+cb9tH6RsVo
X-Proofpoint-GUID: Kbwc_vFq2V-40s_XseoHCYRoUuWDmFcj
X-Authority-Analysis: v=2.4 cv=WbsMa1hX c=1 sm=1 tr=0 ts=6881e271 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=qcF69C7N8eRB8g94KTgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Kbwc_vFq2V-40s_XseoHCYRoUuWDmFcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240053



On 23-Jul-25 12:25 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 22, 2025 at 09:41:02PM +0530, Ram Kumar Dwivedi wrote:
>> Add optional limit-hs-gear and limit-rate properties to the UFS node to
>> support automotive use cases that require limiting the maximum Tx/Rx HS
>> gear and rate due to hardware constraints.
> 
> 
> If they are optional and they are for automotive, then why are you
> adding them to the SM8150 DTSi file, enforcing them for all SM8150
> targets?
> 
Hi Dmitry,

I have moved them to board specific file sa8155p.dtsi in latest patchset.

Thanks,
Ram.



>>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> index b5494bcf5cff..87e8b60b3b2d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> @@ -2082,6 +2082,9 @@ ufs_mem_hc: ufshc@1d84000 {
>>  			resets = <&gcc GCC_UFS_PHY_BCR>;
>>  			reset-names = "rst";
>>  
>> +			limit-hs-gear = <3>;
>> +			limit-rate = <1>;
>> +
>>  			iommus = <&apps_smmu 0x300 0>;
>>  
>>  			clock-names =
>> -- 
>> 2.50.1
>>
> 


