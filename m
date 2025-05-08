Return-Path: <linux-arm-msm+bounces-57327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D993AB04C3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 22:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 218D93B676A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 20:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8572A28C2A0;
	Thu,  8 May 2025 20:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8KokouO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF644317D
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 20:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736825; cv=none; b=QiuPZsYtwPcsgez4YuvWOU3V5Dzm1BpWSYxtGSRH3HLrSVkU7TfrP9i5QK36MXBS1iFCYCCwuGuhubmo+2B0Lzy/aXPGrrTFAPb1q9m7pqOBbxEQo5KurkuoHYDnZoonLJAmwOQ9+M7+8kg8/dFs/1ZJHsG6DE/cQmw9ooM619E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736825; c=relaxed/simple;
	bh=AhHF+Zg9P6AUlvNG6nBBUhRwMQWQDJSBWU7BJowAgTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KY9Z2S0J/8REDd9F0xraMoSpLRTkaWg4bOI/485paHGK1+CShXzaxnxlVJp+ksxpuEPoGGkJT/bcKtZAuVfFT8f7FlGCBP4kQ7Dqquv4BGr47//dwgFo2TB0C5JBTaOAZ6dsFjJ4WU+q/uAgeGsSZg4+7OZbuOKzVc3Kq1a6Wfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8KokouO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548Cs6cC008448
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 20:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhHF+Zg9P6AUlvNG6nBBUhRwMQWQDJSBWU7BJowAgTY=; b=b8KokouOyCVL8bxG
	KIpe85dIDDbXhz2GGZlm97ukbmHTrWJ0YxPx9qzf0bA1mmtyhl/cAdXsWWdX3O1k
	/5RqlykhyHJ/yRfbQNJ5a1pxs7Ns45ARUrw0b464PLFlYW26PyTsaI29CZOAGO8s
	Ee7KT8c2/0+VE1ytDQ5MN3ETBHiBsbxBzs+BQykGypAqzJ1dGa0TopiSOGD6I+2q
	M9U1UcT6fRWX3iIFfWJ1QfJFEzhSTnaP2DmIv0tlk6fQWZ/PJiQIUgFAGUoWBVQn
	exOmSLqMQu/UyOdDxuKqmYZ1e/M1oAOgJ0yoiHRpnIjUITCMqPC9/trR6c7oSux1
	JSTmyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5ah5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 20:40:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22e544a4c83so20787745ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 13:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746736820; x=1747341620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AhHF+Zg9P6AUlvNG6nBBUhRwMQWQDJSBWU7BJowAgTY=;
        b=Z7tLPLFu2x4Gmp8wAmoNxw3302WBq03OF9sa26PCneVSTz+qrL4fmAJPspjvnpW0qy
         yS4dGKSs0X0e5TyLbHGvCWtCodcKwiPBPPBgq7Y4sqn+JYYaI3gttwqIeynpIhm3bQKN
         gvyocZfkwBMapGN10akOfPKhzSR2ix3sqsvN8R6rpG7nHyGw11KkfUK1tybXPB3UygEK
         xo2zLbr4N+C8QJsg770w0JB5XHZ7QnywDVEN/ACzou+fBo6XWECKnkvRa5Aqrilm48Q4
         rbXBukN3MDIM2BpV3xbpwz7FWsS6Lsf7Qj3haL4dffzuQ0o2A+Ww0CNv4ugkWHnPK/ad
         2lgg==
X-Gm-Message-State: AOJu0YwQio/C+S7nfksq1GhLblhYFzhxegK4erYe6BhDSV5jHPsnNHNL
	N/WUirPX2lGn9rnUdrRYl8Q9Js6EJoAZOtGqtwO+MHYbELSCxmZlAouz/ClN9pGA03H2ne4r0VN
	AMRwZoGDhuy9AJOE0exIY7E25PfKDuqaOSvngnghcxGThfs8thBSEfnayMwuS2kxn
X-Gm-Gg: ASbGnctYWTsSMo6rlc7RDilznr72ipcH5yCOTDxYsk4l+u+4ReOYaODbWt7zljj94vR
	Kd4klRBunPPleoIBSRWmaKwbU2dCROmdYAfHzARfcbVd0F+LtNvDGCSn1La5iw3luTrBCfMo0qS
	JQrYCdTvsd2wQGEt6AVDcXu5ngGRD3bEyUJuptSD40u41PcS8N/mB3JGhxlVxXWlC4Fj/T5Piy7
	msAsui7vzXTY2NyeG7bmRySc057/NdHEgaumXOpEyNmRtisrnftag4UF5drfXLvrgSMBjOMl3vL
	qmEshhjPf8jtDVu7dGLn5AraFVvMA0Wfcs6i6Gb4wmyIkGoq9k9AYUy/4qPzv38yt7Q=
X-Received: by 2002:a17:903:2307:b0:22d:e57a:27b0 with SMTP id d9443c01a7336-22e846e080dmr67100815ad.2.1746736820181;
        Thu, 08 May 2025 13:40:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoX0i0ze/m/yNJGb+SqmO3r1KcN2VR3l7IPxJUQFWcGhzOdj0P7XfpBMsof0CFauO/d6kk8Q==
X-Received: by 2002:a17:903:2307:b0:22d:e57a:27b0 with SMTP id d9443c01a7336-22e846e080dmr67100625ad.2.1746736819783;
        Thu, 08 May 2025 13:40:19 -0700 (PDT)
Received: from [10.71.111.209] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39dc8accsm446266a91.7.2025.05.08.13.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 13:40:19 -0700 (PDT)
Message-ID: <ab93bdde-1889-429a-9235-ed4cc53b5010@oss.qualcomm.com>
Date: Thu, 8 May 2025 13:40:18 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] soc: qcom: socinfo: add SM8750 SoC ID
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
In-Reply-To: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681d16b5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=J9Vk1PX46GMNcKasQmoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: OcyFCXg6-Az3hr3_9GbwVpv-8fNdyDeH
X-Proofpoint-ORIG-GUID: OcyFCXg6-Az3hr3_9GbwVpv-8fNdyDeH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE4NCBTYWx0ZWRfX8ufxtfwC/daB
 Tf1RS7ZltJrTkW6wEiS1fagywPExyRiRe6/NTuMWYso2FUI+0N8rZn8LnqWkAnuWT36JQw2syJD
 +QTAckcTu3wUmncysLriIMB2hbQeo9macslyq5IVEhx2wGXjCL0StJSU5by0/t0euM2y7gDJPWP
 Pzujyq3RZRw+EUV4j4LZnAxYRm1GspCG3vAG1iG6o6VzJWM1aYI2rsujy3fJpqj58qPiD34Wz6f
 QR5RAd4TCU4jHgbqRyYegQITVfFnAf5d67BvkdhU2rO+aE2lEqb5YCaMRZZw/96gSNBfFXLYp4Q
 9X/lYd2cP+GTpA+hemjEj5IfJ2vITs9tM+hJK8b/1iQtJFq9zh0lhwPoi8dSkRx3zzYsb8+JiNa
 rv+227F1J9SLKybzzvpywbVEMn4sneZi/375RKQuTWftdQS86J9k8Cf0HfTWtyNyYkHixp4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_06,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=667
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080184



On 5/8/2025 6:46 AM, Mukesh Ojha wrote:
> Update soc_id table for the Qualcomm SM8750 SoC to represent
> SM8750 machine.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Melody Olvera <melody.olvera@oss.qualcomm.com>

Thanks,
Melody

