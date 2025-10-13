Return-Path: <linux-arm-msm+bounces-77012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 34990BD3212
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 15:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 053D94E85F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 13:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B602727F8;
	Mon, 13 Oct 2025 13:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dtBS/5TV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A1261B9C;
	Mon, 13 Oct 2025 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760360699; cv=none; b=iFIo6Cp5VLsXhgd1d71SLTAWkQ0AUUfOQ9wG/MmcGPaxp64lsp7S6asWk2oiPN0vlV6adqWGNRozfyGhkis4pMef0N7PfV6OIsxcBki/IwxuFnEi7HEvgFNCxNhIY6cdjWqrcWkz13JqihBpYgoCfkZrBc1cb3bEtKsBXllPPTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760360699; c=relaxed/simple;
	bh=Z31FwIulc8WU+gcD8GzAisYqYzH73HsiD11LIJzVDFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZX1t7G0HhVIVRPM089ScieV0vwy0306xhn82lM3dd1Ssf7i8nA8KIbKqQOYChjVnkmu4aOOu2Hb7SVa6AFILErash7CEWyKTIFdFm5UIRfXHYCs2fof3xlOSyJlCk1F1aiXTqXwqJaDNhYalvGoA6QTcQFDeO1aduzF+QKHTOcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dtBS/5TV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAeg7g024965;
	Mon, 13 Oct 2025 13:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u5mIcqwHkZGxdUu45ahV5aGvY4oLNJAusDI+4mcOJog=; b=dtBS/5TV2aNGPvtS
	3c+1B97XQ5M5D9GiXRjinhrtGbJsGTtgbfz0XncuyhKNuZYTlsPmVMzqN1EYYyHh
	9OLhl5gpLE+xi1VfE3cvNKnCCezqQzk2NOLvcdBTpL48GMKjpxB1dxeVepJyd+xb
	sBVmcuk/8AYP7X6UVg/M9eMlhLcatRI6fdFeeAS6/UJJ9bf+52HpTLg44qw8IVp0
	d5TAdy/2u4+1IWLhsNWm47WSxRfuM7Em5C5/HscGuizRjgyzmtoBMcd6QcvHxQQe
	43UcmdQ65IcUmAM92pn/Yr2OHHOWmT1meHn6HLBF41anhQtxquZ/OgZ5wt7BT2LM
	1GMbcQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa84p90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 13:04:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59DD4o3c032493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 13:04:50 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 13 Oct
 2025 06:04:45 -0700
Message-ID: <88220541-e344-443d-353c-be738437254e@quicinc.com>
Date: Mon, 13 Oct 2025 18:34:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 1/4] dt-bindings: mmc: Add dll-hsr-list for HS400 and
 HS200 modes
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
	<robh@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <quic_pragalla@quicinc.com>, <quic_sayalil@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <kernel@oss.qualcomm.com>, Sachin Gupta <quic_sachgupt@quicinc.com>
References: <20250929113515.26752-1-quic_rampraka@quicinc.com>
 <20250929113515.26752-2-quic_rampraka@quicinc.com>
 <20251006214830.GB625548-robh@kernel.org>
 <817f02aa-dfb8-a134-2fd4-fbdf8e8a714e@quicinc.com>
 <1d052b98-4dfd-4ee3-b46f-ac043b406d58@oss.qualcomm.com>
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <1d052b98-4dfd-4ee3-b46f-ac043b406d58@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ff5d8oTEayibpIVhbQvK0FbTVxkqdv6z
X-Proofpoint-ORIG-GUID: Ff5d8oTEayibpIVhbQvK0FbTVxkqdv6z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX/x8zUw4OyqgU
 jDFGVhaWOfDlodZStUtPDviW9+dWSyNFlmoi7Tn4+OFTRgQjmVCxQqYpA3wQ/fLaxblxMhx+jXV
 Fz9jVKJPhbNz84bWORPRZ0flSIWplKV53cj8f15Ln+M8U32VMwo5Lhb2AM1U9I7KywPkkozdyuB
 Q5WmT+MHGE1Z1gg6UHqlyWCKZOrMW8AVwE1hC0f7AdYUzJD2kyzDiBBnwMzNyVpLtJZu6aiFluK
 dF6/AjEw67+MXNF8OCDfj8Uikg0XIZ3pyPf+5sAHZDs2IeQL5KOxxiDdQj/M3NTbCE7Rx1jZ+CW
 kWCycwrWr6soa1ZaastG9wfeY1Bvc1tf830ufiYxrV3KxoqWGhNh3Xx+8CNvWPYzmLlLW6Rjdrm
 +DfXgaxUuebe0FVh8Y8XABeF8I41Xw==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ecf8f3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8
 a=NQjy_NEe_Y9d4xOi-4gA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017


On 10/7/2025 5:12 PM, Konrad Dybcio wrote:
> On 10/7/25 1:16 PM, Ram Prakash Gupta wrote:
>> On 10/7/2025 3:18 AM, Rob Herring wrote:
>>> On Mon, Sep 29, 2025 at 05:05:12PM +0530, Ram Prakash Gupta wrote:
>>>> From: Sachin Gupta <quic_sachgupt@quicinc.com>
>>>>
>>>> Document the 'dll-hsr-list' property for MMC device tree bindings.
>>>> The 'dll-hsr-list' property defines the DLL configurations for HS400
>>>> and HS200 modes.
>>>>
>>>> QC SoCs can have 0 to 4 SDHCI instances, and each one may need
>>>> different tuning.
>>>>
>>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> index 22d1f50c3fd1..a60222473990 100644
>>>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> @@ -137,6 +137,11 @@ properties:
>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>>      description: platform specific settings for DLL_CONFIG reg.
>>>>  
>>>> +  qcom,dll-hsr-list:
>>> '-list' doesn't add anything.
>> list was used as there are 5 dll register, but '-list' can be
>> dropped, and it can be renamed to qcom,dll-hsr, I will update in
>> next patchset.
>>
>>> What is 'hsr'?
>> Hardware Settings Reference
> Maybe "qcom,dll-presets" would be more clear?
>
> Konrad

sure, sounds good.


