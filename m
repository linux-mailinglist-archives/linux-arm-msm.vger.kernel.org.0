Return-Path: <linux-arm-msm+bounces-75255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A340BA2A3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C5104E1165
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBF6286D53;
	Fri, 26 Sep 2025 07:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3qVcvXY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384B528689F
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758870573; cv=none; b=tvtMRTeJFdkCQ10zpoDDfGDFimx5DieT7BhYkVY1BQdpIrLi1iKgO/3mJE2seLVr8kb6lN2mDVyWT7AL8XBgEEdR0CTJHasFpgGh/c6N6P70sgIHghsIngpcC2Mapiy7bOdtdDsqgsY95u/AbLSqYdO4tptcgnG127YA/znwoXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758870573; c=relaxed/simple;
	bh=TgPzTPR+Fe7zC5llvHWJQYlWmW4c4SjRxa4PU0/hZn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBWXBGajlTAQ2kGVQzFE7RZsShY66IebSI8iIBvawBVwhBJREfqglAwKbZyIIStx3V/4mhWxrWnhxjPR5At873vZPq8BTV5uGjAadEFvTMSAkrsZeoLwLc1jDn3ovOUxlrADyPxSrTfqQqIUhwQmJK0F18XwcnwY9LVHnwCb48E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3qVcvXY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6aEWl005116
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FiMzZ4vz22Rl097tXf+wFhXKFt60cY1ODkrhVnPMDCE=; b=J3qVcvXYlUuoRVqy
	lRjFU5FuKBu0X9L67bFI4kTqDbMAJtUQFL5w7b0crDrJwycWq4V0hzLQ3S3W9wFH
	UF+MnnXfmDNDWtt1o235ygNStK1U5hD42Y6fBUvampYbuMB+WtKMHWnhVhIcEzLH
	yyV3FK5FfJNfT9zGf/+7dwaaRZCHmwrF40yLxKZ1/Xppj3lCe5c5/5FtzD7mc8gr
	cW9Mex9W/kS1uvPV6aMZz/HHBqrjDBMj4qw7VRGvOvpy9FvppBLFoc9DMSkgnizo
	Ho65NtBMoHW6X8Ie8sprgpmS5ImuV9Gt9PDpYv6ccm0UNajT+6Ofmc6ALRfjQ4s7
	sOTCfw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db321sy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:09:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b554fdd710bso1379754a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 00:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758870570; x=1759475370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FiMzZ4vz22Rl097tXf+wFhXKFt60cY1ODkrhVnPMDCE=;
        b=GXbSxV4tOUIXiM9F26bIG1S1PXGWap23A13AVSuZRRjLXMOZACokmxzY1GyhKkw4Lv
         4yKq2X/sDvJ3+M4JaWcLsS1ijMP5aUvldlof6QJupGvLwbPwAVs2oaU6HgNOMG3+WyE4
         aXwwprQ0ZD4B3vT9gRBQ5ZHTVvu91qTg61VgJ73lJv7ZbrY2hFB0KMwmopTNd1r/eyNT
         vUA+DbofKlYyE7amKc0pBBIJZ2yFa0gG01zfgfKL4288i5HJY30v1RcmBKDvCcsNLB+A
         aKkFE2bO/wBBKH+jyBD0OVrbNpbu2rOwIGGLRnS4vtofbwHEFJ3buUj+sr6og7pF7JWi
         tL3Q==
X-Gm-Message-State: AOJu0Yw7qKAGep6XnLyBZMbaJfgVTIRxYUx3RgAIUDpWPRS22gJM62CZ
	wDg1WFnY1+N4OoC9SwHxE3W3+KsJNGD873GdRDAlEoBsxca2kDce75rNK1VxR3tXim+Pp/QUCkW
	Fkk4CMgmDU2CjyVvXgY34xGEF8VJW7N/hrqxBQXpPtnlCwr/vXP2CLiV63UYMjva2++E5
X-Gm-Gg: ASbGncuZ/7w8lOekXkxRD5wg1W7xHht5yt85WdbO9XsGKRu4UeIYabcjcuc35p7EBhQ
	EHDzRSdNbYXe6yjqitW9CiW8at7VvTV27mmFX06+T0dasEzm8kFM7lNFjh6rM0pElawBbJg+rFI
	qtlCT4nXFiVLhBHAeYz12TDUuXEgkuvbGjQAX+OvbRgeoY/qqHo/KzvpgYkHPFfiA0TmFgm2Zrx
	zZIAqz4f8p1vVSSy6/ycCActgR1+oxEFbqyzYjuE2D9kgevoPnuIFqKW+O/wpLG3DvnV7xWYOUi
	isPUQkHlqp4XZQuZR16nhLovvTJyu30OpXabS8qx9/SmJU322DfZhZO864n3zCtNwNSo
X-Received: by 2002:a17:903:32ce:b0:267:c984:8d9f with SMTP id d9443c01a7336-27ed4a0dba3mr75468905ad.24.1758870570331;
        Fri, 26 Sep 2025 00:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqHGrxe8xhPkP6vuNLzQiWx+Rm84GN1CL+4+QaWX56Yg2h/x7LJeftQZFHKJ2KkwePgdl9Uw==
X-Received: by 2002:a17:903:32ce:b0:267:c984:8d9f with SMTP id d9443c01a7336-27ed4a0dba3mr75468445ad.24.1758870569854;
        Fri, 26 Sep 2025 00:09:29 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac94ffsm44250615ad.136.2025.09.26.00.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 00:09:29 -0700 (PDT)
Message-ID: <b0541564-3ff2-4cfb-84ff-1d3d59449f86@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:39:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: clock: qcom: Add support for CAMCC for
 Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-3-d7ea96b4784a@oss.qualcomm.com>
 <4315205b-5320-4a8f-a707-45f5eb35ae51@linaro.org>
 <8c558ac3-541b-47c4-be4b-c9101997de7c@quicinc.com>
 <14df3870-6cb1-4e5d-9c4d-bb8acef8c594@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <14df3870-6cb1-4e5d-9c4d-bb8acef8c594@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d63c2b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=hVoh_Pt7g2FPdimnm9wA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: KPVE0hsdqveMU7DSkBeSXrKsBNMPoDeW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfXyqF4ypWM14kw
 2qidMaaoP7il4FwiHXhCrmlLj+aLE/e7SAkx6S44POI/UW+f5Dn9AyuMykxBMNWanvDX0V0PlA3
 GbQ3q8W13VZ5btuhzZGTnadxX/z+JkKMstVVaFLobJeHiqtvJJIMrkCywlmd9rrLEKpdg4u1a1u
 +Cr/uIJTCCxHmGccdT+nRmgUU/uevcJWVohA4Ax3lioi6154Uy/EeWkfpis95WZtdPhf8t5MpOm
 YdnehdCzsKXvuh6oNzXoq/NipvU+dlqiFn+sPQCInaDzZssJheyQ6eXnENUgOhmW/nbhS6IVsYW
 UNBiWbsD60ELfz7NsU1MmZNTV9V2NbHRzuEq6Y+nAhELil/+2dQ4/cLdR4vaZsdb1x0lzaskyt6
 0PCCekiko0DQyxf+KLksgveZKRmAaA==
X-Proofpoint-GUID: KPVE0hsdqveMU7DSkBeSXrKsBNMPoDeW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172



On 9/25/2025 2:31 PM, Bryan O'Donoghue wrote:
> On 25/09/2025 09:46, Taniya Das wrote:
>>> BIST == Built In Self Test ?
>>>
>>> Can this not just be put into one camcc header ?
>> These are two different clock controllers CAMCC and CAM_BIST_MCLK they
>> should not be in the same header.
> 
> BIST means Built In Self Test ?

Yes Bryan, this refers to the self test. However, the hardware does
support functional clocks for the camera MCLK.

> 
> Is this really something to be upstreamed ?
> 

As this block supports the functional mclks we need them to be upstreamed.

-- 
Thanks,
Taniya Das


