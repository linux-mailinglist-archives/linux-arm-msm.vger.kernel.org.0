Return-Path: <linux-arm-msm+bounces-58873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3112ABF04D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 11:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BACF21BA79F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EE2253F36;
	Wed, 21 May 2025 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XQXPs3iP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCBD253952;
	Wed, 21 May 2025 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747820646; cv=none; b=i5KFKLAQaQJ7+CmULFp48WsAdjt4nL6OG68yEOakaEtUQyrihHcxwMb1iei2Hpcs9VN+boSDEyL4rkj9f/Q2qLzPWRNvo9+sPZI9slOgeocbY8qfoF6F3EWWCc4Rv1T/4PMhDuyMsAnHkGOpE5sWLNhe/QdBGtCQFBFqcauQqic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747820646; c=relaxed/simple;
	bh=6gq8U/8I0ZjP2g3LhAwHlKnKJxc0zLaHzeSeHx0WTHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m/gJ7ZbWuZuWNxinqk7T78Qxa+4azjd6tJV3lv+9J9XYHJynjg5MgHrauLyjlT89dBoTs/n68vTWXudx+bTsRsCPcmteoy2sOAMnP5KEewUXX20YGzXZEjR2YkWAadaz8WC/KApqTJSOwvyTdo7kuJnzjs3OgdEK4eM1lWvpX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XQXPs3iP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XK6U020965;
	Wed, 21 May 2025 09:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eh5pDmc1ztAF1UGNef0iRGlWuDe+I4TxhUMOWzvXSpA=; b=XQXPs3iPXMllaNNs
	Nxb9ZJzEXEoh8cMkE8SqaG7Xo6CJCRspr1Z556maqX+UioGJGSvfL5pwLHihoGtm
	meKP/bD3spCbawtEGGiEDP7sDxgPxzZMmseA4RTvkpWJZmcXhEK5v64DRgQbMOc9
	VUHJlN4SO9Y131Z/3bJLNuM/TsHRHLr21EUZYWrRdRpHka0Q9LHkPYb6bkw43C4I
	iS+oKOVRkaUHOoB1HzAzqoT5Vf7bm+hVZuXI8vczsOGWcsecI14ieAqZG6tZQovQ
	nmZKZT36jAhTdA0u+l4+pFJLeF80rzjdJT1kTlg4djD/O4AJv6bUEnSwu+IQ8pjR
	rFFYVg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf02geq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 09:44:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54L9hxAc009276
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 09:43:59 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 02:43:53 -0700
Message-ID: <264c7738-3fc3-4712-8880-cb150c8c44f1@quicinc.com>
Date: Wed, 21 May 2025 15:13:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/18] clk: qcom: videocc-sm8550: Move PLL & clk
 configuration to really probe
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-8-571c63297d01@quicinc.com>
 <51947214-47b7-496c-ac26-8185bcda2312@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <51947214-47b7-496c-ac26-8185bcda2312@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZYkl5UCCrq7FrQ38Ro5KRZt4VxRmkbFU
X-Proofpoint-ORIG-GUID: ZYkl5UCCrq7FrQ38Ro5KRZt4VxRmkbFU
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682da060 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=RgSoaAllXoQqQjjFTLkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA5NiBTYWx0ZWRfXz9rw9JFZCOCx
 67ZNyfkghNCzzPo/hB83kNlr52GwqjFgPRbMHBdecreSBSU1Ar07zo3n9x0LYEwF4p2NCSsuKPI
 6Pyd95GLxXKReFfDTbAmmry77pObvMKKweifIXOLJ3GYnB9Wmipmj4oBMxrz8eDq8nT/UGkWgN0
 0lCvNAN3Cpkwx2YLSVPMDly/5Plq6YzSALYbecTeTjtBfBhDwKozyfBDJlFv87akAF6ItJ29w10
 HTlHSi6axl3DLO80fEb2Q58TqE2oWYQLus9uYkJglE3kkbvp/lyIoXaf6VHhKBoDQGWxDlMGXf/
 tpkwKXbAZjugP6JSfHiuPOuP3LJietyXgb9Zj8ZAzZBtZ6KHLzgDRbXqCyjI7Xlx0nV8Ezg+1+c
 yTaP+6wRYm1Led1g4NMBsJoBElZI4YvwV/far5s/Z4xom5ftdKeKd/9EstAUT2OwYnGseRE/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210096



On 5/15/2025 9:08 PM, Konrad Dybcio wrote:
> On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
>> Video PLLs on SM8550/SM8650 require both MMCX and MXC rails to be kept ON
>> to configure the PLLs properly. Hence move runtime power management, PLL
>> configuration and enable critical clocks to qcom_cc_really_probe() which
>> ensures all required power domains are in enabled state before configuring
>> the PLLs or enabling the clocks.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
> 
> [...]
> 
>> -
>> -	pm_runtime_put(&pdev->dev);
>> +		/* Sleep clock offset changed to 0x8150 on SM8650 */
>> +		video_cc_sm8550_critical_cbcrs[2] = 0x8150;
>> +	}
> 
> Because we tend to sort these by address, this index will likely break
> the next time someone touches this
> 
> please introduce a separate array for 8650 instead
> 

Sure, will introduce separate array for SM8650 in next series.

Thanks,
Jagadeesh

> Konrad

