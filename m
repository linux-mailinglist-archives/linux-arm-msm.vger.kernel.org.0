Return-Path: <linux-arm-msm+bounces-78466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B262BFF6E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 051B33A4F0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 06:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46A7270EA3;
	Thu, 23 Oct 2025 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khCqelEB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE831B7F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 06:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761202613; cv=none; b=sqFqOa8ZUaTt53O+NONirL520oq3chioRnPkmFxD/XXo8pVcmMFAOtJsb0TRrdGUAAUHQ0VuH86BdVgVh+MghBmAFtIr7rb4U+IhEkrlNyg8pBEKk0qAeCV3WzJ65fkoim6f5uqX0g3YVk9f3pgPjp7VxJB+GxhuC+eL21GGT+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761202613; c=relaxed/simple;
	bh=BW+kg8htBMkugNFEx4R0pb35ItCAPtb2W8sPE7A0J6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/gNN0OhrYUBZ+fEqP7V1OmGmMABv5i06Nfx+FQA78LHbzrwQUrKGKWZqDBsN1wi3nuDogXEwV7NlJUUIKZj7bT9CchWmAi2OebvWzkBSeG+Ze25QMP1TlACHq4AYVLTwp2uNXLFeZQNlKobpm1zRe7PZ3PkwO7yjfcwa8zGXi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khCqelEB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6tS7t022437
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 06:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+efyRDA4riV9spYnZlw/APnqKUaUaN3qfqzGJ8qH2uc=; b=khCqelEBy4lVeQ7+
	FYXiHgICW1lqub4Fz526fKpkit0d1GcoHObWhLZfP4e+1w5eMhN8G9m92i8kOQbu
	pk6tdkx9zXgqdiF3kCVo2ncrZoUNjwSuwsJghNhwBdxlGuzvtFQMbfSevvJ//YN2
	xaBzoYaf1mCYqA/vu9vEJu7lwl1UdnkxeqFlr/AhRNGDBdgGOkcKltniP2j4DY89
	mSdzsn4y/O47MJJd281VFpl0ABxugU/dlhSaPBX1+UHisWZapQFH0zWSaPTvlucQ
	Z76p1tLGpXpgKa4LLIrOoNibnam0TYiW29b4eCiRWWTONiGwArDeBYkCbNgRv4e+
	axpTAA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w87baj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 06:56:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29085106b99so5104975ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 23:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761202608; x=1761807408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+efyRDA4riV9spYnZlw/APnqKUaUaN3qfqzGJ8qH2uc=;
        b=CfPeXiTQESGtHz6i5L0nUYHFIUHlGaCRAW9dCRrw9+EBNb8of0jyzg157a/DzwhmK3
         grBnfGidOBWmLt51F6fCkZmntBdEHPmr18J/Os6zGzOl1lmW+RUcgGV23uIVQDxOL1in
         QHRC1eWBBScQZFX1PkvccHMKLp8N0C0GiHuFS5LVW7d8zEKnqjde6UvPHn0Z3s1PdwTI
         ATh0gYpkXd8MUiv42AnPjnm5W4HmjldOcgRowqjgMEz/Z0jz4cfaZ+MO2IroTN1s30am
         ReqEjtf1bI5cBdXU1Hdro6TjY3ehC5DOGunjyfFBahn2bsYogSNE1jcvnQhz6DJiD81t
         v8cg==
X-Forwarded-Encrypted: i=1; AJvYcCVQptJcjEWNnlv6GFIDhZF9ZJhu+U5O54yEdRuPBFPFW+J1fX2/DF2CpphhOuJN/iAaExF08MEpFRtAUYNf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3tOdiINaXPiK8dTwVnNgWRAfRhkLfdOexa9y2mtyRhNO7Rt9t
	w5dK48oO0CkfdAOX+2BIke69gOkQasd0/J68ML9MwJOUmFRsnAib0/mZjDjvDcuR0t8O3fGl+P0
	bO35rn8404ohG0m70bmtqb5TVCsBtwRdnrSs6CGoTyu86c0bNHlwoSyKea5/K7d8p1rtI
X-Gm-Gg: ASbGncvDL5qB3xvyS9Ii/8OFcWQcbgC4VWx6BzYFQqstHJLMo5THF1Iy3LS/dGD9GnQ
	B4oYikf4uxL0NXhDw/sjrKEO7MKs8HkiItWqQjY/Ef2Xu/FvOBPaubQtCZoxZpYkE/UYfx20RhI
	Hi+h1VzvxKPf5geUOE81JmQNvt4ymju8dVSapo4uyMXDGPD6UjiSpPMlkM3vWZY4hxmFj7KPSEc
	oXhdlyw/jNyG7qkeHMYtG677z8qWTAiENZVNvn54PFZH2XoZMks1Gvhbnoe6hqGfAemZlys6naJ
	41kbKlatYJAH4dt75ZG2bE1KLBxzKAzU3KElZ0k1f2flKVoHGubyR+3KOy7a6bSt55SwOcaNd9M
	dOPiyZllTaP0nXNiZJlu5/s6Sh/4=
X-Received: by 2002:a17:902:e5ce:b0:290:af0e:1191 with SMTP id d9443c01a7336-2946dea1368mr22465155ad.21.1761202607963;
        Wed, 22 Oct 2025 23:56:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUW0YEaHqb+o6OIwpRYA3a26EAhwWv+kJ8gb2tFkO8g+VN+YewDwGtLNYa5D2L0rAadSuNVg==
X-Received: by 2002:a17:902:e5ce:b0:290:af0e:1191 with SMTP id d9443c01a7336-2946dea1368mr22464925ad.21.1761202607483;
        Wed, 22 Oct 2025 23:56:47 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946de02357sm13016435ad.41.2025.10.22.23.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 23:56:47 -0700 (PDT)
Message-ID: <c2429e35-7d33-4500-8e0d-a992cad99f63@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 12:26:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] clk: qcom: Update TCSR clock driver for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-5-29b02b818782@oss.qualcomm.com>
 <jr6qz23acm2ipspsvyxjpabg3b4bspapia2pqd7b2grrtvnct5@v7mjwnr5o6qa>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <jr6qz23acm2ipspsvyxjpabg3b4bspapia2pqd7b2grrtvnct5@v7mjwnr5o6qa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX8rk4PK7iC9JV
 qTCWzgex3fecFiZsiQwXDSBVIQeuU6ZMc6VwZ8uUP7uXCn5GrecmopRq5yi0R6XQosgBVW6SF7y
 K/XRgaZA2zkyIfCcFYR/40lrF2crcDlgavsBY4oUfhaLnk3S5tq765X40bGdDW3bkleLysjQ0Pj
 xOe/oYuupPbGARf6VsjIB4U1u3duwgLHJDXmB/tWb0DQ/SNSAwXEAqh0x5YFc7GKtFenO5VBZK1
 nJfIYnsRwgzgZsXoTnpBwt2R1tW5bmfrqZAvf+7oT+ZPT7iuAvBBZ0LvLmIbBCYkPNcwVRdQHkK
 nrL6+DI9eWH+S5eEgqmfFjSWiOkf4VPFlt7+oR46vYlnzMCwf1LKNNDyVKKpqiyFIcV6OcuHVap
 wNUVMy9xt60yXurQTRIbDhUmQVH5qg==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f9d1b1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=peCUsVMnvPp5iizJ5UwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: tIWRwO-rfHdkYWw1y_Ka1hWCh1e4HHiE
X-Proofpoint-ORIG-GUID: tIWRwO-rfHdkYWw1y_Ka1hWCh1e4HHiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015



On 10/20/2025 4:33 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 03:58:57PM -0700, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> The TCSR clock controller found on Kaanapali provides refclks for PCIE, USB
>> and UFS. Update the SM8750 driver to fix the offsets for the clocks.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/tcsrcc-sm8750.c | 34 ++++++++++++++++++++++++++++++++--
>>  1 file changed, 32 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/tcsrcc-sm8750.c b/drivers/clk/qcom/tcsrcc-sm8750.c
>> index 242e320986ef..f905f3824d7e 100644
>> --- a/drivers/clk/qcom/tcsrcc-sm8750.c
>> +++ b/drivers/clk/qcom/tcsrcc-sm8750.c
>> @@ -100,21 +100,51 @@ static const struct regmap_config tcsr_cc_sm8750_regmap_config = {
>>  	.fast_io = true,
>>  };
>>  
>> +static const struct regmap_config tcsr_cc_kaanapali_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.max_register = 0x18,
>> +	.fast_io = true,
>> +};
>> +
>>  static const struct qcom_cc_desc tcsr_cc_sm8750_desc = {
>>  	.config = &tcsr_cc_sm8750_regmap_config,
>>  	.clks = tcsr_cc_sm8750_clocks,
>>  	.num_clks = ARRAY_SIZE(tcsr_cc_sm8750_clocks),
>>  };
>>  
>> +static const struct qcom_cc_desc tcsr_cc_kaanapali_desc = {
>> +	.config = &tcsr_cc_kaanapali_regmap_config,
>> +	.clks = tcsr_cc_sm8750_clocks,
>> +	.num_clks = ARRAY_SIZE(tcsr_cc_sm8750_clocks),
>> +};
>> +
>>  static const struct of_device_id tcsr_cc_sm8750_match_table[] = {
>> -	{ .compatible = "qcom,sm8750-tcsr" },
>> +	{ .compatible = "qcom,kaanapali-tcsr", .data = &tcsr_cc_kaanapali_desc},
>> +	{ .compatible = "qcom,sm8750-tcsr", .data = &tcsr_cc_sm8750_desc},
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(of, tcsr_cc_sm8750_match_table);
>>  
>>  static int tcsr_cc_sm8750_probe(struct platform_device *pdev)
>>  {
>> -	return qcom_cc_probe(pdev, &tcsr_cc_sm8750_desc);
>> +	const struct qcom_cc_desc *desc;
>> +
>> +	desc = device_get_match_data(&pdev->dev);
>> +
>> +	if (device_is_compatible(&pdev->dev, "qcom,kaanapali-tcsr")) {
>> +		tcsr_ufs_clkref_en.halt_reg = 0x10;
>> +		tcsr_ufs_clkref_en.clkr.enable_reg = 0x10;
>> +
>> +		tcsr_usb2_clkref_en.halt_reg = 0x18;
>> +		tcsr_usb2_clkref_en.clkr.enable_reg = 0x18;
>> +
>> +		tcsr_usb3_clkref_en.halt_reg = 0x8;
>> +		tcsr_usb3_clkref_en.clkr.enable_reg = 0x8;
>> +	}
> 
> Granted the size of the driver, it doesn't feel like these two entries
> belong to the same driver. Please split it to a separate one.
> 

Sure Dmitry, I was looking for re-usability, but if it improves
readability and clarity, I can split it in a separate driver.

>> +
>> +	return qcom_cc_probe(pdev, desc);
>>  }
>>  
>>  static struct platform_driver tcsr_cc_sm8750_driver = {
>>
>> -- 
>> 2.25.1
>>
> 

-- 
Thanks,
Taniya Das


