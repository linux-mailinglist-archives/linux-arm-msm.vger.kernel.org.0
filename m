Return-Path: <linux-arm-msm+bounces-21420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D41268D7762
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 19:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72C5F1F21246
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 17:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EB85EE78;
	Sun,  2 Jun 2024 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Al2tqFif"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1288226AE8;
	Sun,  2 Jun 2024 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717351122; cv=none; b=qVM3d+ugWLzkaqMPb9BvjijpI8wG2jgqiiz3GsmH8W3722YkloEWlVFTk4zGjX0LP1XvKePv9NHgdnODHBgKFAlmpMjTq7kyaB2tFSABjLLC73DrEk8LxuXT6aT/5oHCvGhnqu12BUXcRs28bzi0p/IOZrL/t8unhGrzJzq8I7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717351122; c=relaxed/simple;
	bh=RCGxMFLhelUBTxVfs8sZCP1ojBxslH7nBmUh1g0Kf1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X+1kjjqqVRqjdCRpmN+81CquZ9blWEYNcfSUG7//I7z/1kTv2gYpE/7S7VtUp2CN0gWcohzP84N1CVbhBKPZqzFOrWgjKfxnGuinU11GYdAj8ucVPwKTWqSb/+JFdD4r1082PDxNBWkOYNN1cBoNdJ9agYA23PepQyzdpbObTV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Al2tqFif; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 452GgOdb014036;
	Sun, 2 Jun 2024 17:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6aiuTtzSdKe07xacfCcVbQG/5EOxDkCifChWy3BjnI=; b=Al2tqFifK1/f/741
	srizqIyWekH2M+5mutULJaPGLEe4WJZ+7O0OWHYwjd6FRSmlvo8xROOLhUXOHtrk
	8VzN73mAHdUiYKORMV4U1qZW0Y5d01/KadObqRgMT/iSHwU0eV7CcwC5Ft8HQrCt
	fT+eAK5bwRs2+/3VtYrUWzva3d2nBHHizm1v1WfEDhM/LEjdcHy+MLrky9s5UjLN
	MjBloZNK6H1WBmsaTXTUfqeOyekrTh7D+S9msn5tWk67CKkqyLH7Jolw/chlhHN6
	Db6A8M0Fh39xzBBPdm2BWHQqs9rSrnxFfGPt/NS/N6r78zh1oB9zMgngGnyXpMu9
	uj1D5A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw3r2epm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Jun 2024 17:58:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 452HwYa7018260
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 2 Jun 2024 17:58:34 GMT
Received: from [10.110.25.66] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 2 Jun 2024
 10:58:33 -0700
Message-ID: <e683f291-0216-f802-3007-eef32db1e130@quicinc.com>
Date: Sun, 2 Jun 2024 10:58:32 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 04/13] clk: qcom: gpucc-sa8775p: Remove the
 CLK_IS_CRITICAL and ALWAYS_ON flags
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-5-quic_tdas@quicinc.com>
 <0f56831e-8572-46f5-89cf-d1e990813a02@linaro.org>
 <cb1066a9-d3b2-d921-9af6-01300987d37b@quicinc.com>
 <drkjvvoxvzfbkvuylwtxbyroxuv7bf7w7cn6lmrovsqe72re57@xspcrygo3pl4>
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <drkjvvoxvzfbkvuylwtxbyroxuv7bf7w7cn6lmrovsqe72re57@xspcrygo3pl4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PH0R36rsRhQegpY8OD7Ix73hM7zeJZrL
X-Proofpoint-GUID: PH0R36rsRhQegpY8OD7Ix73hM7zeJZrL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 mlxlogscore=871
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406020155

On 6/1/2024 9:08 PM, Bjorn Andersson wrote:
>>> I fail to see why this is a fix. They were marked as critical on
>>> purpose. It was needed, wasn't it?
>>>
>>> Provide jsutification for commits, not just sprinkle Fixes tag all around.
>> Taniya - please separate fixes into another series? 
>>
> There's no problem including fixes in a series with other changes, but
> keeping them at the beginning of the series is generally preferred - as
> this both enable them being picked for some -fixes branch and avoid
> potential issues when backporting.

Sure, but I prefer that these fixes are not blocked by open items
and feedback to other drivers in the series. Once the fixes are reviewed
and picked up independently of the drivers later in the series then I am fine. 


-- 
---Trilok Soni


