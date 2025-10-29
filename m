Return-Path: <linux-arm-msm+bounces-79414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C676BC19D2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AFEB1C2021B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8A5334C32;
	Wed, 29 Oct 2025 10:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nbb83M2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9343346A4;
	Wed, 29 Oct 2025 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761733878; cv=none; b=tXo0hYN/HwXxqtHVpQQqVhjX3+jefsOQQuOhyx9yqkmxhKcNN0J6x8oLjTc1b/B7lzlYaJ/6BXtrzAVgAjcZwONaz6l61RxaKol8/0wTEbrRr/WcZfl5QbIxe6N//sCbXMQPc2kjC280b/cX38m3VicjKGjVK7xFoEpeBe8Q3H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761733878; c=relaxed/simple;
	bh=8eFTykUa+0KR3mSmEIxVLqPvOottdLp+WnEMKgFbO3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gZvkWvAGtaCEFGWqAmBVYbN+w98k3H3IT5YLcVRwffrwXLRjtcFgDO888+/IYN5WJ2+8JU6J/TN7oBBYjopfr6bSpCDJORIj+2uR91pANJi7hVi65h111tazNdDd38gSXAUq4QsgizMpO9CAFaWDJo/UfZXMaRwUpBqQixFfs7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nbb83M2g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v3dg3663756;
	Wed, 29 Oct 2025 10:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l2nqfiJYvOOYBVGgpWsJ3r4uPE2CoyvnCh2eRWzR2aU=; b=nbb83M2gwPaf7Kou
	9ceZBJ/fz9Opz4LibsPiKBmHamiadaSpMBKT+5xoVeAAdeKlSPIiueluKCac4twB
	oradKa3NET/nrGJegYi/BJFnV2tIvYRRFd8jFLwlqXDjgfPRvh/eTPVf7BNez/lp
	3Ipt9O+xqZ2qmYAibMlmJIcn8rv6sTnW6WmXkeybkGEwie/Ci5d338QTujtFCMFM
	AfXGRnjOvJLQx8A3mABW/wDvQQZxDztZKvKH1uwH948Q6LHaPeh4cKdu7xZJ4xx7
	jklH2Z/N1OvzQWRNNDYBtJtzXXoCXmdccS+UjL9xIjsdL/tZX7l1qDKEXXgKrRGh
	cQx3WQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1t5d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 10:31:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59TAV9j7028557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 10:31:09 GMT
Received: from [10.217.217.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 29 Oct
 2025 03:31:06 -0700
Message-ID: <557ff048-7e5d-409e-bf21-98328a834bc8@quicinc.com>
Date: Wed, 29 Oct 2025 16:01:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: gcc-qcs615: Update the SDCC clock to use
 shared_floor_ops
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das
	<taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona
	<jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20251029-sdcc_rcg2_shared_ops-v3-1-ecf47d9601d1@oss.qualcomm.com>
 <c361ea17-7480-4a10-b446-5072e8edd76d@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <c361ea17-7480-4a10-b446-5072e8edd76d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8zlFBJqvffgyfl2lOtMvD8IJMWZLRjQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3NyBTYWx0ZWRfXwogLLyJ5pLuL
 +gjLafU4mSdD+9nIUPsugSHmBKwKqxUnt+dt0b7i+oRZPSSzxnOacNHieP/+/7Cb9/ETy0yizuG
 lHFsSiUlJZKWuUV5xRej0hJaXIcFvDvnIwTfMGIobcjccxrq3LG1j84KY0yuCbT+tSMB3gi9F0p
 J6v56FD3M1/P8IL/+XOOK2oCAPNR2oiYDP0GqM6dFEO9QeZh21uj4Ehsafb8SnQ7HdyxcGKFasV
 uKpX1BEQq+3sIhwZ7/7Zi9rCPml+O4HczLy647hB8c613X9qGh+Uitu1VNwpedZPPZbFE4sj820
 5LbZ2neZhRzrl7F6ytelMjwWysu6gXEUgVjoLvOFg5SQBGNw4o+zGmj2lof10wLsCvsyb4F2/K2
 md2CW0cUsl1MbzB3vPIV1EB2rX5L8g==
X-Proofpoint-ORIG-GUID: 8zlFBJqvffgyfl2lOtMvD8IJMWZLRjQ8
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=6901ecee cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=hK7KpB9GTeAz0Edsr5cA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290077



On 10/29/2025 3:17 PM, Konrad Dybcio wrote:
> I noticed none of SM8[1234567]50 / hamoa / glymur uses _shared_ here.. 
> 
> I see that e.g. SM8250's downstream sets it though - should some of
> these be fixed up too?

I wanted to fix them as well, just trying to check the downstream
history of these clocks and then update them.

Regards,
Taniya.


