Return-Path: <linux-arm-msm+bounces-22162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04882901D49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 10:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 021811C2123D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 08:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48324AEE3;
	Mon, 10 Jun 2024 08:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QHH0S0B0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261405227;
	Mon, 10 Jun 2024 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718009527; cv=none; b=Y4g5rdBnHRxzMJfbBYDEcu9hipACQ6MqdznHOv+8pF0sYVYzbfPw0ieKsFNbNpKY0qpE+kOu+uDigwXJO2oY71O0FYTmiivTg16khfZWM/X7ZD6yeSfhKbf1xFFq4BwKK8HQb2Kf61K8kopiBFvOgwDWNqb5HZq3s1N/wKA7oeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718009527; c=relaxed/simple;
	bh=cnBl0G07KDT0DpE0WWydfMt+Y294aI6+5esltgOvYQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rMYLMOLMI39Z1ZUUXrbep59g14q4fboFfD9Vao71Zi9aI3lBLdQiUTby510O/HLXJue5Bv+awj4ghk7ZfmfS90ms8V9Hq/CIF+G/OigmvL8lO/ShrmPNFOy+eHy24CkiMqakoFN6H2idM0rVwPtAA4TE56FaUz8EUUcHeMNc3PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QHH0S0B0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A1vFGI024507;
	Mon, 10 Jun 2024 08:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U2snvcJ8VsSYN6OMmzC+/kRRUFj+OPQPpJIe3GXf3wY=; b=QHH0S0B07Z+pDiZG
	K8rL4Y/t8L+Sa04ek+vcKi1rZqspc2Oz6i/c6h2zFHQiiN8qFXDmZUJLMWWf6zhc
	gLNldfNJdOGV612Ahed0kHH3rwRJBvXEXqtiRkIpuR3bxYcoTnld6LKJN6c/lvwp
	QmDILDAFtfP0uRpb6UQnyCELx3ooQnQxTMimEfWU2BLFPYOdZAa6nahSQhyAwnjK
	6cFdXE4kbZFu2AAd+4fRRIHI7/xYU/EZT2TcQCh5fFYY55wiKaa35wftMBsVYoVQ
	ERxR1nEg3DJMYt5B4y2Wo/hvzQ+r6ZP+EpNok7dEZNUaa5uVhs4XOg2FZv5IXJtW
	1Z+wDg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymcnmu0jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 08:52:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45A8q0s8023176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 08:52:00 GMT
Received: from [10.218.0.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 01:51:56 -0700
Message-ID: <b7107893-55b1-4113-a9cf-ed5f70aa959b@quicinc.com>
Date: Mon, 10 Jun 2024 14:21:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] clk: qcom: gcc-sa8775p: Remove support for UFS hw
 ctl clocks
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-2-quic_tdas@quicinc.com>
 <b9118c0e-93b0-4920-9107-42bc7c274472@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <b9118c0e-93b0-4920-9107-42bc7c274472@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 73fJ8jkExvBd6exn3qqmlVCDDZ1WNoVY
X-Proofpoint-ORIG-GUID: 73fJ8jkExvBd6exn3qqmlVCDDZ1WNoVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1011 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100067

Hi Krzysztof,

Thanks for your review.

On 5/31/2024 3:27 PM, Krzysztof Kozlowski wrote:
> On 31/05/2024 11:02, Taniya Das wrote:
>> The UFS hw ctl clocks are not being used on SA8775P, hence remove
>> support for the same.
>>
>> Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
> 
> Please describe the user-observable bug you are fixing. Commit msg
> suggests there is nothing to fix here...
> 

These hw ctl clocks are not used by any consumers and also they are not 
using the correct clock ops to manage the HW CTL of the branch clock, 
hence removing support for the same.

Sure, I will drop the fixes tag in next series.

> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

