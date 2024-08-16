Return-Path: <linux-arm-msm+bounces-28728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 959C59540F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 07:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3276F2828F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 05:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFD4383A5;
	Fri, 16 Aug 2024 05:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E7GEb9RV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0596EDE;
	Fri, 16 Aug 2024 05:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723785385; cv=none; b=J7KM8cKPrjyUOaf+mk3p1fHpqFMBHEyG4n3kF3p0Qg3jaMqjd/h2i1t2xOrLr8iG19PNuqjozB0Cfwk27CUXolnvqlpuiyW8hl8hp0dpiA0n2YzLFW03PfYs9e9g1gUeFwFJJDLe20upGSHrx7K5ZMHNoF6SRn3xkNdpua6cjt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723785385; c=relaxed/simple;
	bh=NDcbdECS0sqep55+825KWslLG88CutuW0SeSCsCDNRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lib2JXCJH6M8rmsIHFPHTnpnHKOsRpK9+HT9xHfCrPBMh1aI74CstX607RD92JOyRx6zlXW43Kx+W0f37qgSoz675YKuSFu+bfGHLqSdF6mdI5cWp/68WpaMXi4C24BjHHYZQ5lWH/HDF1rGilRM1WHlxzSkVXQkAS4XoZ5kV8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E7GEb9RV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FEbqkc028639;
	Fri, 16 Aug 2024 05:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9kcIYtE3AdrAhYmXufvY9f40CgPoc5CoECX9lxW2d2w=; b=E7GEb9RVWOrk//42
	t5pq/9TJg/Kxh7YBnAaxPTI6t2vrsiXyET0ZiQMNu7lkksAE6XztvRH7yJ1KoB9Q
	Sfuo9kGru0K+GM3pzYGtrpTE3TO3NtTZlJO4QUyi1ct/sGj9ygY5ibuL5uRNRWDu
	CjsgDb70//4z9lL67mgafpzSiOiVZmMATRBSZACL1/iU7l+58bMNDOBkwpous7WT
	LSmdTzU75UZrXJ4qT00HOUMvMCm3pATysthYlqEs53Kl1ptNrgsZ5OyXt8jcM/Ui
	MaPk0BPowgXUVAunal73KbnMGi8YPlgNyUZMbjgPwSUrAjnLqAf3hlmTkadE4y8F
	kv3Ffg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4116h5u93d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 05:16:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G5GG7D021857
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 05:16:16 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 Aug
 2024 22:16:12 -0700
Message-ID: <d83409d4-8d75-4ef5-b3fe-98279657bf4f@quicinc.com>
Date: Fri, 16 Aug 2024 10:46:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: Update sleep_clk frequency to
 32000 on SA8775P
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>
References: <20240715-sa8775p-mm-v3-v1-0-badaf35ed670@quicinc.com>
 <20240715-sa8775p-mm-v3-v1-8-badaf35ed670@quicinc.com>
 <16cd561d-d8d5-4acb-8536-cadc3f073201@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <16cd561d-d8d5-4acb-8536-cadc3f073201@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B5ZANz28_BoJSyRYLWArgZusaR9GyF61
X-Proofpoint-ORIG-GUID: B5ZANz28_BoJSyRYLWArgZusaR9GyF61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=917 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160036



On 7/16/2024 1:15 PM, Krzysztof Kozlowski wrote:
> On 15/07/2024 10:23, Taniya Das wrote:
>> The HW supported sleep_clk frequency on SA8775P is 32000, hence
>> update the sleep_clk frequency with the correct value on SA8775P.
>>
>> Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> Avoid combining fixes with features, but if you do, then fixes are never
> the last patch, but first.
> 
> Best regards,
> Krzysztof
> 
Thanks Krzysztof, I will change the order of the patch, putting it 
before the MM clock nodes.

-- 
Thanks & Regards,
Taniya Das.

