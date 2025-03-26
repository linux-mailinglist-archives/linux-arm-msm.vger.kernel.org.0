Return-Path: <linux-arm-msm+bounces-52548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD226A71D6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 18:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 555B5172478
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 17:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E2623E220;
	Wed, 26 Mar 2025 17:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JMMk6g+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70B723CEF8;
	Wed, 26 Mar 2025 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743010859; cv=none; b=BffuOoQEvaryi1+rh4VyVrhmU3lwHq89rsIMZxGjykAPFadebVA5Z7ZX1CrWCPKd0XMlxIokD0uolLV8VNu4GoTom4CETIbtvILwbfNKm9XBPP+WjFkS/Wbr2Qxyj8H4tLtM0ed2qJdjC/WGx33uLip1nKgqvhz2K+4BsHLlxkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743010859; c=relaxed/simple;
	bh=IF42i9xClxtYePVYE2whH/ER1KFPPZsWpexYaUu9dSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GmeiaSBFyjesIY1EDpKPDLWiICY6n5d403eKSs6fgfpsry/Flg1bMF8zSJbcTWlPgWH9+PlMe3YtxqviKcwTTwdXXV3JfzONdtLsq3ZM/zlAZW+ZjL+eHoOVx4Zz+IICsmDe2iyQ/Y1SpgmFAzGPmYSO6z5vokAuSxKtG1OmA2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JMMk6g+u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QF8A2E024742;
	Wed, 26 Mar 2025 17:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHRnI6rQduTyuoCapplXqH4C38WxPkK74mFfBzWXK8Q=; b=JMMk6g+uAxVkLdB4
	rrUp4ruz4xNWbfQ381Mwox6FL5n+mfxGCZNg+IbSvMii0gEnnaWamh3J8MwbSt+p
	QWRak+NZDBbk1VXT5yu4Gky+RBrTXx0cHSocnNrRLBiogy4KURF07ZifgM/vTdOr
	5jhCC6xLnWK0tDRsIPS66RcNy0Nz20QaoTE1psq9GcVhkQrgnNXEVWmM5JglU3Xx
	G0Qr4ZRqLSuEBfkakqAAaSqyDOTlH8KeCUC9HA8YRydhEfN5u0/hP3sclDDLMpEX
	/erN9IKDXGxLRwiWumUPotPZOwcYIly2DYG2NbgwcWC+mR2JGXKe+y+GYvGGGmXQ
	LLPUIg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd35t5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 17:40:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52QHes93022237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 17:40:54 GMT
Received: from [10.216.21.242] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Mar
 2025 10:40:50 -0700
Message-ID: <b57fa204-d3d2-4b74-8834-3f2d93726a99@quicinc.com>
Date: Wed, 26 Mar 2025 23:10:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: add QCrypto node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
 <ea79cee4-8c47-4054-bd17-2097ada4e583@kernel.org>
Content-Language: en-US
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
In-Reply-To: <ea79cee4-8c47-4054-bd17-2097ada4e583@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zW8KYUVskbdVNjT1Fx3MiyK_kODojyCH
X-Proofpoint-ORIG-GUID: zW8KYUVskbdVNjT1Fx3MiyK_kODojyCH
X-Authority-Analysis: v=2.4 cv=P646hjAu c=1 sm=1 tr=0 ts=67e43c26 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=ayhbSaANK0tth1sMJQ4A:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_08,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=861 priorityscore=1501 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260109

On 3/25/2025 1:00 PM, Krzysztof Kozlowski wrote:
> On 27/02/2025 19:08, Yuvaraj Ranganathan wrote:
>> The initial QCE node change is reverted by the following patch 
>> https://lore.kernel.org/all/20250128115333.95021-1-krzysztof.kozlowski@linaro.org/
> 
> Use commit SHA syntax (see submitting patches, checkpatch).
> 
>> because of the build warning,
>>
>>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>>     ...
>>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
> 
> Not relevant warning.
> 
> 
> 
> Best regards,
> Krzysztof

Are you saying this is not the warning seen at merging?

Thanks,
Yuvaraj.

