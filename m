Return-Path: <linux-arm-msm+bounces-68701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2AB2222B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3823B721275
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 08:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFEA2DAFB9;
	Tue, 12 Aug 2025 08:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLEHxVhM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4232E425E
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754988512; cv=none; b=OwYPmXPPEwBsp+b4p6J52ncFwzA+rebMIcDJDrFlSKgY1WMo13rgl7SQWMtR+wEnpgT1LVT/RpIS7WojVsUUw+iqVFr64HQZk92f/GRVNtRfoXCc0jBcJXouIWxR0wkQyZT8QSY9rx7++iS/05eS5HoWoXEe11ox9lxtzKFS4z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754988512; c=relaxed/simple;
	bh=bIaw2FNK0aavrRb6Xybh2kRuBOYiqlu0QUXQh1nDLb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NoQy1gfpLeW6VtyebXclqvrQL8cz8AttGIuaKlloKqnUJmOLTZZsdxSxRaznoR2RK1U/foYhRvxNQXhUAEcGouThN/g244CVPcsqFCkxV+Fc2rmXlnt6BCwyjmt0IKRwN/L2L46dgEAHvEym9cLoGrnYpiEnvGqoY3UjoUrusXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLEHxVhM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5BTbu029203
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3yei4bAWRTPlfjD9mJuCaf7V06gKwYYP2mn0nNjJIEY=; b=YLEHxVhMXGTLrKTB
	6inOCxhPCCG+SwslG+L6YC/DWarJSjoQ3ARSNrHSqqKcvuBuVXbGdY0Fa/w17uQT
	HdkJNrP8nK72Bktbd17izgld1oWf1sBqeF0kgAU2luxubb/nnEAmC3gg7IIinz4n
	rsEIYDoA9QSlOFVI6QkUJ0VVL0+rVu0gqPykJkxR51+Dbia/SbkrkycmHD4J5Q8T
	IT5MywbWbgzHKUZM+rlhbgDYihBrNlqiSyiUZhxCY1nlsylhYMPsS0r590Uz6p5S
	Dk2VKu9bpysH/7OlXpLPUwI9Yu0THLgLdKnAI8zw/y1KUpYlY8eKLSQtlB/CNUkK
	xUEO4g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmfdvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:48:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b071271e3eso13227531cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 01:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754988508; x=1755593308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yei4bAWRTPlfjD9mJuCaf7V06gKwYYP2mn0nNjJIEY=;
        b=Em1J+FKJD8762IpPXusyOVc15+C/Y5B35wBALvjI1IdXQQp0bVl8j9aFirP0vzKFH1
         /oQ0OTlsZgJP2SaULriPzvB2OIKgjcBXlV/H0DhpX7YsUvOhG49oi71ORwE5X0fScOyZ
         O4NygONM5OU0MozOSUwfagN5KQ9L+rMalmrwSwsUihENvyCOv4ykN1mjjPt0imaD0fFo
         KSFRpV2t9PxF/1PMF721xsBVE+YJG0cpXVglXL3Vy6vQyw34zfaZtxiDTVWEACpuiyhM
         kUvm6chMyNXUIO+dTNkHir3v2QQM/4rll2g50MVOhsJKWprND8RXj6Do7mXBqgvVZ3q7
         eEwQ==
X-Gm-Message-State: AOJu0Yz4JzIlZ0TDA5KFQzdUhXdIyzcdJfnUlj33WBAwdRZGqpMIo0w9
	3j4vAgcMCICJKKHyeV/48rtbCLEdkTcXBGEjtDsKKMKhimepHlcbS2LgogjjwSvuoBJXcKM4hnO
	SfSb9mygwWkn1wFcE8H2z+RBNui1vLbo50sRPPW/WtCTqA5V70QRBEMvpx6liVjmBW/w3
X-Gm-Gg: ASbGnctgd6kdSuaX7GVFVLxzkRK7FL7LWtBFe9VGN86R7e71ekBw3dK7s8D/m22fPX+
	kRiD6M0Ow5sFNxxuWdUpCbC/mMkzmTDvPJhscowruOV2deKTgN9+RlmGuiqFcAzAJiiAvhIrhxT
	1miVdNnQZLkzE3asgITGeZoOFvVTlUobLEkp7+zir92T8/fPYfB9UzVIBDvTT0bPXEoaDma0bOF
	YR6xrxc5IhkTg3rb5LY1YgtomBs9zlNPUlMJuKvqE6YS5neuwVfHMzugmdtPdJ1AAPVCuzBCFoe
	eLPrMdqZz07tezmyk2oG/8qWC/XUDfw1fN02/iGHCcLwD1gg/ai80KUMIIBEMSlX79HpC16i6kD
	F9QNCOHrzIr3Z6EoVdw==
X-Received: by 2002:ac8:7f8f:0:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0f4abde25mr1977151cf.12.1754988508332;
        Tue, 12 Aug 2025 01:48:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG49SlooCoq2QbTSVdsPIBo36eilKODoBGFzeYr2YfN/S4e5IAMokZikrVjfKkfSBp8TpMdyw==
X-Received: by 2002:ac8:7f8f:0:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0f4abde25mr1977031cf.12.1754988507544;
        Tue, 12 Aug 2025 01:48:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0753f9sm2178410966b.20.2025.08.12.01.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 01:48:27 -0700 (PDT)
Message-ID: <61a781d3-eb4f-4c56-8873-41c95999630f@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 10:48:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7280: Add MDSS_CORE reset to mdss
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
 <20250811-sc7280-mdss-reset-v1-3-83ceff1d48de@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-sc7280-mdss-reset-v1-3-83ceff1d48de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX0Yc9McqLvWHI
 BLM8QzNZow2eoi387wHtxGBw4fsyV9WTFsbJCAbSN6LD+buGaZE6CTR3qXaBjbdlhvtQUwjwOYW
 L1ZvLErXOTwlG1ZOjHYNvQGHhL1CsSzrmbOU6QsusSWZxAK3EjnpA4mYvLv+Q2mG5t5khXMXy56
 x110IOVgeTs5tavnm4uOtQXc4oJNyEU3l74UlWeMO4eJPK8zTewY8PKsTv7PgYtUxoa2E2gQ5/O
 Ii5VVkVN+V0Xluvml4vmYLKJmW3txNYi03KAtpMQ1CzbeEwyiwwCCw5qKIF5iXuFWFIvybA/hAz
 +Dpb6pL/j4ckL8fcLheFLbzaxDXFAVwiC1tsGChYoRvpgfFm7xdy+xLz2xWI4XIABcEQI//sGSC
 zAadfsBX
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=689affde cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=S_9igCkNjxJcElqm350A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 8sajiXOWbUGqDN_-zY7I_JdardSZ7L3E
X-Proofpoint-ORIG-GUID: 8sajiXOWbUGqDN_-zY7I_JdardSZ7L3E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On 8/12/25 5:11 AM, Bjorn Andersson wrote:
> Like on other platforms, if the OS does not support recovering the state
> left by the bootloader it needs access to MDSS_CORE, so that it can
> clear the MDSS configuration.
> 
> Until now it seems no version of the bootloaders have done so, but e.g.
> the Particle Tachyon ships with a bootloader that does leave the display
> in a state that results in a series of iommu faults.
> 
> So let's provide the reset, to allow the OS to clear that state.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

