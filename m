Return-Path: <linux-arm-msm+bounces-62577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF32AE94E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 06:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4336F3AD643
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 04:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6EC2153D4;
	Thu, 26 Jun 2025 04:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mooySDSQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D364214813
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 04:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750911236; cv=none; b=OypR4oWO/p7EYHhqKxvNF3F76giw9jXdc718FtuiiBD739N6UgMsTZZpjQ3nd4Zs1ILAtpblbNWmzToZy0gn2ZU3Q7XTvTBz5KMMhjDO3yERSpEW/VJjBHlg8AAp/0CvXMGhjxhpniNpU6E1oqMXt2/zj9zEUGFakChxJO/CJtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750911236; c=relaxed/simple;
	bh=b6lVQfJ0vHuT8NK2TkY0gGK7zVYAP+7JYX187Y436PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zym16pm4bEG4Kfrtd2JDXJzTOD0eFLdztAcdjH7Ie4rTUbC4TK6GQvJsWctpzRb7afMOvHE/j7p3QNElcZMbf6wQpaJciLJnRo2dfyUTXnulTSZTUQbrFSBCnTzoI4r3S7bWzJgZKoO9QZifBXXJuHkDTMhDgfRGFZKHmZA4BZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mooySDSQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0Drpv008400
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 04:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WKpaUH3ipuBOWo6fi6C40F5MzgfHqDpT6bHI2/67zCs=; b=mooySDSQemqTTQSX
	OHqw4k6q4ncS3vGS9VS+KyIvwPj5zPkoH2/eK6NZrZWUTqnE6UKqxC28lciQwMVI
	dJADaOJfhkvIRO8IDa1LLIR0iFqLG9Ds7NHH/zvma8D+9IeATUmnw5dIVV2oNeRF
	6wKOTTHkIB6+bPWWRxwfJKPfMc7ScfvO+KwPYnVcv+QxWKxRq0uW0yg7T1i0xenp
	StAg27dSCOpSdQHFOo/9RT5B6YzMA4WUrLt+CTKgyJU6mIl4CrN2f41qG8xeLJMA
	noVN2PiC7yi27fE1PR6n0aBhtLobes27hXV/9mcEsqB8PeWzSB7tqx0xDI+OqWbL
	ipRAuw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqrcak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 04:13:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23507382e64so5091405ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 21:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750911232; x=1751516032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WKpaUH3ipuBOWo6fi6C40F5MzgfHqDpT6bHI2/67zCs=;
        b=LkLz5hyY1ul4HeNIuHD+8sz5pBELI5RgJHwCsnzKGPQwBj7sI2+nHcnum1mvJ0o+aJ
         SmUJNDeXMa/gJS8DtT7csZjemQvHSe21xK6sKXs+iYIg8UTp5f0TEejblI4ls1Gsmfsu
         vDwg81UUIoviFbLl+HwnKMKKccYV/vamc1IHN1dvKbOeluZwdQfqWLpz67wYrKPPwVLR
         EDDR+A6XW7PHK2NU0r9IiRUEPfAiSgTINYXYc5WAd5MkFAhpEHz1bZgrkmWJqsQj74AC
         KVCxwVswAtmMz1AMDhjocVU+PACCWA6wPV6JY6Ws3OV5Vpe1Z+eAlD8FljV91867YkHy
         ILpA==
X-Gm-Message-State: AOJu0YznS8lwSagtS7LjITks5TVCxhR2TNWuXLeq0AsKM/j36VyVVQbx
	Prp+qJMlTRKUHfsp4MlvKsKYuD4XsbDQX94+Ig5OHWKqWmqegzf/F1jwq0RKXw69TCQrOCnhtHR
	1V0/Gl3V+xg3MdKqUcQ60gUPdT16D+nKHtA6v1d4chXRpDVB3P6/iHbMCzGPAzftFubj2
X-Gm-Gg: ASbGncsTuXDMu7Y+/PlwmUg2NAAxKx//6Ny8i4qipki84OAjtU6d1w0d7ZX5sYYS1nm
	mrDCOvvmEGCvZu19kgmO7Ryg+iZ/Spvul82zfLFGQyLlFYBhUHKAWiBcGrLZ5wJIxRB+yTiy6VI
	bRGuVU7rYNR0QHT5G/dccWKAYTznl3x7jlj4DdIENjCgzQ+CCzVS3zYiB5Bwxe4bfR8w3wKZkEV
	04HgYshNP3MbAsgBED1nyyN6mm3CqPgJOnWorRofP5sSnXyZRwyKNv1eRuYwfe6XQu2WdmF0wwB
	icBsFck4nlaFDio9c3nO7QrSY+8uxdMqF7J+rvPkrX+ytH16mXFGJCA8Ms3msYg=
X-Received: by 2002:a17:902:e80c:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-23824062835mr82016925ad.37.1750911232009;
        Wed, 25 Jun 2025 21:13:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXPk6FeEEtqsAdoxjcE2zNg/rqvl84KjzqDPyy3NBWA71HBoKOuG1wxIQkEElpXh0w3mnQlQ==
X-Received: by 2002:a17:902:e80c:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-23824062835mr82016515ad.37.1750911231447;
        Wed, 25 Jun 2025 21:13:51 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d866b000sm146530625ad.162.2025.06.25.21.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 21:13:50 -0700 (PDT)
Message-ID: <eb1a43a4-bc10-410c-a747-e2efd1c46aa7@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 09:43:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: phy-qcom-m31: Update IPQ5332 M31 USB phy
 initialization sequence
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20250625-ipq5332_hsphy_complaince-v1-1-06b4b8e66bc6@oss.qualcomm.com>
 <dad809f1-9fed-47f5-9aea-34369a9b3608@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <dad809f1-9fed-47f5-9aea-34369a9b3608@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gJo1sUbvId0SCarZ0jew6gu00Pot3TMn
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685cc901 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=G7AlkcFLQFj19gR95hsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: gJo1sUbvId0SCarZ0jew6gu00Pot3TMn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDAzMCBTYWx0ZWRfX0nmsBfSn0Z3v
 3uS3iXNFoLbE1bL247Qp1UoLYgNm/mpdj+4pgrKvgLZAvFhL5YQOUmGmcREtJgFdlrWKuPQWyVA
 NLRr0jbwpVqWDX1jaSrSxzgutYXzrwtZPqaRTjLBGaXXxa7lCq76BzXmpj6ceqPnMS3HhX0R6kI
 989cV+C/ySlIXhMBcLxK+tca2DuPFAmDh6U2Iz4jpJC6FSleGJvlTgkg4LfcByW30bDDOcqHUtB
 WXmS+w9F07rqUoCwnS/4S/hBmEgK5tgBykF42MUoaxSYmVwTggnWoe42iSVXYQRK+Tsykoctoqe
 BzaDWQ87yVwhjCEpppjoHHAjs8Y7n+ZZlsiqMLM5OwCmEykHLikAYhTJcV8zJ4B2Bsi4q4XFvzc
 5nI9Q+o4dN74naJVFPAe1pHd0MOwnip1Jqq5PMp/ZkxP0zS+LTyI6axenFm56DFCvMrFMbRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_02,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260030


On 6/25/2025 7:28 PM, Konrad Dybcio wrote:
> On 6/25/25 9:00 AM, Kathiravan Thirumoorthy wrote:
>> The current configuration used for the IPQ5332 M31 USB PHY fails the
>> Near End High Speed Signal Quality compliance test. To resolve this,
>> update the initialization sequence as specified in the Hardware Design
>> Document.
>>
>> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
>> Cc: stable@kernel.org
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-m31.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
>> index 7caeea1b109e922c0cd12e985bc8868d5bce8b4f..1a8a0f1262cd95bc00dfbf7397a1c48d88d52327 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-m31.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-m31.c
>> @@ -58,12 +58,14 @@
>>    #define USB2_0_TX_ENABLE		BIT(2)
>>   
>>   #define USB2PHY_USB_PHY_M31_XCFGI_4	0xc8
>> - #define HSTX_SLEW_RATE_565PS		GENMASK(1, 0)
>> + #define HSTX_SLEW_RATE_400PS		GENMASK(2, 0)
>>    #define PLL_CHARGING_PUMP_CURRENT_35UA	GENMASK(4, 3)
>>    #define ODT_VALUE_38_02_OHM		GENMASK(7, 6)
>>   
>> +#define USB2PHY_USB_PHY_M31_XCFGI_9	0xDC
> lowercase hex, please
>
> also, please add it below XCFGI_5, so that it's sorted
> both by name and by address

Ack. Will address this in V2.

>
> FWIW I can't find anything that would back up these changes, but
> I trust what you're saying is true

Thank You!. These changes are tested and confirmed by the relevant 
folks. I will try to find the doc and share it offline for reference.

>
> Konrad

