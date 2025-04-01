Return-Path: <linux-arm-msm+bounces-52981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 440B2A78097
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 18:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B71C7A3E81
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 16:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E42420D4F2;
	Tue,  1 Apr 2025 16:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHWcTYla"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B951C8612
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525448; cv=none; b=IGTZcRZtD7CJofuaXEXEc3HmaQWyikuMbR6d+A3SYozI3X8rMWeaRHXvS+TY0CtIF8jwSh8w5Zg6lGNndPcwlBW2k2uyfk7fvgvdrN0Z2BnR2xrMXaNgOrxexhYC7mFXK1yNTVgg4JHjobKQ3jWYBV5QC0Ix4OO3BM5gGYF/M/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525448; c=relaxed/simple;
	bh=xso3yVMv1IMS4sKIOz4iJ1XJ+y9QD15Nm6ONJyFulUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndbD7hyCNng/E8f0KB1KTMCV5rjLl5jIg+dErQg7iq4jDyhXuM1XLgAjez11lufeKvMZqR2ObXycidIc+ygljpQ2ODm4vTlo8oo5E9PlqT1JtlDWh9+jxuObr/dBt5qO0M2CQ08QaWeKs8A9OxUEav4qqVc/bYQLuZH8KEXvGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHWcTYla; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531Dek68007489
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Apr 2025 16:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKbhPlTz0jVjC2n4EBy1zzs4F3CjcmytkwZ1FbdlItY=; b=mHWcTYlaFdmTeZlK
	ql96SP8BJesuYNcqU5Ok4PBJ81iFViUKlCi4oW57Z9ZvRxdnKOZMcerfWCkSEqIA
	aVvcD+RnkfgpSOACL+OneHMz30KafrbMjvLa65EI4J6XQWI9lU95UOeWnqnIOFdA
	XDH5sEbKe7datLiyIxnvWI41o8oAHDOX5tfLpq5GJTrMbessZmkZcknp0dUqzr/b
	8OxeVWicJPdPqGZGnfCMeFK4OlmxjgbbdRLasinPN3CdAg8DoYKbkwmWw3AEcMei
	Fzpk2kbzNpGaKc/5o6alrvLj9ihsbWJ96NBOZJwsqVt9OziU+fhaWd4AdK5p77hy
	b0AGcw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rh7yggpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 16:37:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5466ca3e9so34919885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 09:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525444; x=1744130244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hKbhPlTz0jVjC2n4EBy1zzs4F3CjcmytkwZ1FbdlItY=;
        b=EI58SIv1c9zzca5zhSsGXrjY/bRpLtQWKYlnZBTWI0THg0hw2hIKGfhJouE12Q9D31
         PAR/apebu/ML4Nek3MilRwBpMdSy7OD2caXfxyvP9JlXNxblngnfbKWvruNv2ThqWz3Q
         DBQ3oSkm/6XHuWJRyx2do742GsrlBAVNcW2UVsWOj3t/YJyRxPH3N9h0zeAbMR/1y7sb
         kJ4bE51PmIuDfitkkHhvZhfhhPZxl2fkBFJ1f+wZV1WuHwePvIJekVxvXORFuyxl4LN2
         DQzW8SNM0q6FRXgUyZ2pOPf80R1RqowlVWhUWWgTN3Oodt1rBg86i3Is2N+F62wpX2fb
         YyTg==
X-Forwarded-Encrypted: i=1; AJvYcCU39l04i9t80OqPutee4hLQ6bf7qyEYPcoq96ICza7+vcqRg9CgxUVdYTvEecFmjE/Fn1wzGfuXzEMD6iYn@vger.kernel.org
X-Gm-Message-State: AOJu0YwkFVY7f31+44QR9jlXcxhdcHfbp1Hy3NuSbbYky/dqp7iYu35h
	jtsva8K/bbRMUO/M4yZGRTBV9uDMct/rTLdr/wk0vOPClL9sR36K8vOSfd5ZZtVM/hrGCshDR9I
	rjTiTY53I4G2lV3Y+QSWNdCw6OqUmB0FodY9Qnp1In/XR4oLS0ZcuOWL+MG+DU67lc101Vy9e
X-Gm-Gg: ASbGncuJuyifKWQJjmrzF0AP8J+Kwi6FAJh9aP3J6O0fFPTzZ+906egBDq7AsVpInkK
	q1vbiDiCnbMkCZDkx/5xYxloXe9vG+12b2P3PUts0KstjF2CUpJVfq1G/APF4Puwlk7e6nwxOj6
	cbuCLt6fHDvk9InhzBHN4sjOZgGXjComFCBqamzRe2Xr+cnSeJ7ag9POfOmyU9WbOcRQ+mIK7jZ
	BnIL3XRJdou04mSMeoW3Uf4SqimFcvmZsZ/T5x6kPO8cQf4NjU70mswg+HUAtozhhJ4y4W1mGHZ
	ySToeikVM0VmA4aBCjERCHlClMgEOYqx4im+hSaWBbKNdRG7HWVSFf2ocJuRecmD4lm7zQ==
X-Received: by 2002:a05:620a:4491:b0:7c0:c2ec:e560 with SMTP id af79cd13be357-7c75cbf574cmr166616185a.15.1743525444341;
        Tue, 01 Apr 2025 09:37:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY9F3T3aVlxlnrRQFttmbYcyMce6WTdjZjN6/Nqe8LfX/zNfyXhMverLlyrcOeYnZdRL0LaQ==
X-Received: by 2002:a05:620a:4491:b0:7c0:c2ec:e560 with SMTP id af79cd13be357-7c75cbf574cmr166614785a.15.1743525443965;
        Tue, 01 Apr 2025 09:37:23 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b027sm777628666b.47.2025.04.01.09.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:37:23 -0700 (PDT)
Message-ID: <f105d601-89c3-41b7-8893-f84965a7565f@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 18:37:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
 <20250327024943.3502313-3-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250327024943.3502313-3-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IYWHWXqa c=1 sm=1 tr=0 ts=67ec1645 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=NSQ7DHjqZRjaoW-GLy4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3JVuZ60dZV_NttGeRQYYCB-947_AatbL
X-Proofpoint-ORIG-GUID: 3JVuZ60dZV_NttGeRQYYCB-947_AatbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=661
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010102

On 3/27/25 3:49 AM, Jie Gan wrote:
> Add CTCU and ETR nodes in DT to enable expected functionalities.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

