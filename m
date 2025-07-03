Return-Path: <linux-arm-msm+bounces-63501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C793CAF6F1C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 11:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0143B4E32F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 09:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FA32D878D;
	Thu,  3 Jul 2025 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jfVfS0jo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7206A2D8788;
	Thu,  3 Jul 2025 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535927; cv=none; b=FGrnEfFxI5SjzAM3rhBYORrlwfWhM7vpnmPhIQ9NKXq9P0r/v/btSUmrU0Z+BlpSD04UzmFSjNVH/wPwyj9B7e4FWtVVhE/V5PCz9XuUVRy8zkGeX8yzkecZvP1TF9dqQ4ADMoFzANKTFz3Q0RK0Y7CBZTg5W2Qri1skPTxObgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535927; c=relaxed/simple;
	bh=BjLch1TME7EoCkxnFvc0UAaUcRXEs7j0nXMZrtFHXfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ecobz0BCN0mJaT3qj8Mz7u/2+lIDRsd4/+UbUtqE4Nu+gv6XikfYcs6rJ2Bi0fzdLFPO3VXiFH6VhwCFFOieGTOSxCFMbUBxSiVvsS+9LCxUhg5ko18fB9Ma/6OU7RrvNs3Xwvtm9/G5lXa+bbsSIeWSYY2kLBNvQ3OEiPn7V9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jfVfS0jo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5637PFTn010432;
	Thu, 3 Jul 2025 09:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n47CyqKNxOWPyS5Sz4WkEF1d+Hlx5v6ijEkoOPsKz4k=; b=jfVfS0joPHh2xseQ
	74Kd6PAWMt0881gAW2KEGUSP8FWdh/+HQW+Of7F0GIWDsNIb+m2WfVkwSeAENl63
	PIchZLvg6MWtrao6crFbYpUPYOrhhgNuKTELqO4K5fzP4Hpi3iKSg6DyvM8pyP2h
	xLmcDUXScSAkLRfrfyvQKMiSdNCnrjJswq/XUnB86AZmIwFycKjdi+hEo9z217cf
	6Vwcj/zHmf35qPgDR3bNwWKOCehatHyurijNd3AJRRmu1GsVnCP2/mzWxZcWEoCD
	IwkUCCXgkwnuZ1lnndATKWKW5O3NKBRMb0B5IcrN+aS2kFIm4emGU86DnGltTVAt
	nV2ziQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30cypr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 09:45:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5639jKVb032163
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 09:45:20 GMT
Received: from [10.216.58.113] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 3 Jul
 2025 02:45:17 -0700
Message-ID: <0bd5e108-9c98-4bcd-9652-05cf514d0e22@quicinc.com>
Date: Thu, 3 Jul 2025 15:15:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add support for two additional
 DDR frequencies
To: Krzysztof Kozlowski <krzk@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250701074334.1782967-1-quic_pussin@quicinc.com>
 <ea5058cd-29da-4939-990d-697396197ed9@kernel.org>
Content-Language: en-US
From: Pushpendra Singh <quic_pussin@quicinc.com>
In-Reply-To: <ea5058cd-29da-4939-990d-697396197ed9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=68665131 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=no11nyTW01Y9JOyM0NgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: b1BHHuZTh1mE9GdsfMlIi8agTBbIYtgl
X-Proofpoint-GUID: b1BHHuZTh1mE9GdsfMlIi8agTBbIYtgl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA4MCBTYWx0ZWRfX41YtHsZfYJnk
 EkDvEjRZ4lLQkgFrgTbPQYQ/jjKrmwZvlwndpU0lWm8lF4hTo4S15KMYexDzUWGeBjgeAx8ysIZ
 wZHuJjtSDB1com4oyXE8Y+n0iLxg0uxIitMDb7/48w1+JhQtDbfK5N0gO9FvR4g5tyZemmkI03a
 467eegTDZ67Gn8a+b7rVIlFQ8kUZj7dUZTPxKaJ9VxXRXTPQSci9WtSt6/ZD6mUsq1HnxCNghYz
 RRkyLz0xrF1ZMO9JJ55y5S7JCiJ+1t3LPmbwSUpGfTFyvrhJjSRd7UNnOHWFV3VcYK75953gDyv
 8ZUkQU0LeJnXSUJMheeDZuJx6GdQUOLrwJSUj8ZygDnkUNjsMLRQ0zCemRxwko5pYAIH0kGA1Xr
 T9SDUeKUI7KFxmzLYZhhCJ9d+VUYaPESs4p+3QHAjnhmlAA3eDjfuZ1FkgHyjizO5qSbzSwK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=965 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030080

On 7/1/2025 1:26 PM, Krzysztof Kozlowski wrote:
> On 01/07/2025 09:43, Pushpendra Singh wrote:
>> Cc: kernel@quicinc.com, kernel@oss.qualcomm.com
>>
>> The SC7280 SoC now supports two additional frequencies. This patch
>> add those frequencies to the BWMON OPP table and updates the frequency
>> mapping table accordingly.
>>
>> These changes do not impact existing platforms, as the updated mapping
>> only affects the highest OPP. On any given platform, this will continue
>> to vote for the maximum available OPP.
>>
>> Change-Id: Id3a91e065c49848d9af18e5c3edee0836cb693e5
>> Signed-off-by: Pushpendra Singh <quic_pussin@quicinc.com>
> 
> Doesn't your internal guideline tell you to run checkpatch before sending?
> 
> Also it mentions many other things, so read entire guideline prior to
> posting.
> 

You're absolutely right, I should have run checkpatch before submitting. I appreciate you pointing that out. I've reviewed the internal guidelines more thoroughly now and will make sure to follow them closely in future submissions. Also, the issues are addressed in v2.

Thanks,
Pushpendra 

> Best regards,
> Krzysztof


