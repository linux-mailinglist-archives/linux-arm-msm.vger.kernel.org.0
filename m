Return-Path: <linux-arm-msm+bounces-40717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 579429E68ED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1B7D1886A65
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 08:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAC41F541A;
	Fri,  6 Dec 2024 08:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ITdYJj9o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CAF1DFDAE;
	Fri,  6 Dec 2024 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473741; cv=none; b=Gsez96jn+8mYfh5185RL+t7O4L8m1j/0g6MJ41Hiq1Ypuac5OhvuQhEgm4ybFI+CDfrBE9K28QU1H63qBn5iV5sgNdqLAeqHWsOEWt8afYejXvy9F4rJw/Micn97yhURfwlgSL25+oyBKa7jJ2sahbdLushGFHFICKrDzm3jlD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473741; c=relaxed/simple;
	bh=wYahsY5KiIyLPKThPbdnAUMc3Rb45i6Vc4VC5tfmd6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IpFldQRhojyJDjrZ+rC2DJdbLfdQU3zCS66AEBV9w5L/VolMuwGmngzO85gm4IChVZu9vVF9ZG/qK+BaW5G1gF7PFd2pkADJnIdgqfDgfx4LhFmfiJVYtPjrQCvQY+Io4kTs4VztMw5ygE0BzAtClD7Q1kDXeQwGyETf7UUenBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ITdYJj9o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67iBcR003758;
	Fri, 6 Dec 2024 08:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCXy2PAOsllc1uGY8s2Ib6GQZ8BL+p3UT7SO8Rvjinw=; b=ITdYJj9oUf/17Keb
	PgFabscgtMo/UO68izasAMwBsNROv+c587Ru8Hk1PzzkCsUwyfIBgRxhJUazRnGa
	8rePOUFYRGZ16Qei63TjNulEbOQ+5/Z5mwIv0cO/XOoF+oLpEzIqVd1tIx9/kadJ
	OS8WlwtfSUVqnaqcjkIdOVkFNCNOtfqJl7jpH64s9Oh6ixVHRl2nI/Wvqk30OaFd
	HK8r7SAPYH69e0qiWzZ1/p2jLuVqv63XpwtIGrQIw9Ia1Na3hWhzyJtGgxAT6Oow
	w485fjGaiqU1pISSws078qVy/08pSz/BFzfzVAXjiN9UIdT/bxXVnCprclmPqlk5
	1NzWNA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbqm2w3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 08:28:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B68St0p027627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 08:28:55 GMT
Received: from [10.50.58.122] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 00:28:50 -0800
Message-ID: <d9ec7d8f-a187-4060-a197-c145a478b70f@quicinc.com>
Date: Fri, 6 Dec 2024 13:58:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: gcc-ipq5424: remove
 apss_dbg clock macro
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241205064037.1960323-1-quic_mmanikan@quicinc.com>
 <20241205064037.1960323-2-quic_mmanikan@quicinc.com>
 <dahqtkq6o6vrzfrmr76x7yd6iia4ihhcjfsaskilzw44wcjxth@ql2bkxnv6n3k>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <dahqtkq6o6vrzfrmr76x7yd6iia4ihhcjfsaskilzw44wcjxth@ql2bkxnv6n3k>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DSubngsBIG1H1cKgyaFEllwXefHjGopN
X-Proofpoint-ORIG-GUID: DSubngsBIG1H1cKgyaFEllwXefHjGopN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060060



On 12/5/2024 3:56 PM, Krzysztof Kozlowski wrote:
> On Thu, Dec 05, 2024 at 12:10:36PM +0530, Manikanta Mylavarapu wrote:
>> Since gcc_apss_dbg_clk has no consumers, the linux kernel will turn it
> 
> That's not a reason to drop a binding.
> 

Thank you for reviewing the patch.
I will drop this statement.

>> off. This causes a kernel crash because this clock is access protected
> 
> This could be. Please rephrase stating that this clock should not be
> exposed to any user because trust zone handles it and any access would
> trigger faults.
> 

I will rephrase it and include the changes in the next version.

Thanks & Regards,
Manikanta.

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 


