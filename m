Return-Path: <linux-arm-msm+bounces-75041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B14EB9E45F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C0E11B26DD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03EC2E1C7C;
	Thu, 25 Sep 2025 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owxgzDMu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF242D9EF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792051; cv=none; b=HYhkhVtXnVT1h1T5h9PhbV1fs0HolbVAzGFC9WHx2coRJdnV0VJea8T99Uf49RzIdM+B6mZyn/2gY/qMd9kCmyqippnIyqfBTGxC8NoCYUlBQSa9g2mXrJSNYyiXy6//Mk0KisovMf+SIegZfzz96poWuoeKTGSgGy70b01oJQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792051; c=relaxed/simple;
	bh=rRSNO0HrYXDp9U7u3xqD9uyslqRK9KBJ8DGC+QY73uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJZWaWgJQm9fHMTgrTOR8ON/G713nKXvwPXRqqhwnCFLHDAbqNtKFgvdvwhpNFutaFuj0TAjxZx2BfJ2NgFwOLB6Y8iU7IIYHO8p2Ptp4iq4ypuh0bEeLfEGvp/RpxQdYWPkyzeY0tnUKs40CzYUsqMAsh+vjw2/B7ESvyXo/7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owxgzDMu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1J5A8002652
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J03QPepsogPpGOX5Hp1cEWYgqtb4aYw0wehT27zRwhc=; b=owxgzDMu2Fk3akuO
	VePtbRXRjuHYx2ZWq/g6KNqV8mw7XOy+F2Q1I9PSKa9njAGhk3dyhLcO9/GlR6Aw
	fj69wBCMRkyajcj6HJrInkarA9M0wKRSSpwU0dAVkXlymSVvzd6ReYrM9YJ0ePKa
	EcF4DuFYcLcQniD5DhSjB34AnRsnXa3s3GXM0OpcQ/oxRczgzjrSWqiBMpqlTlXN
	ePkl2Kvkp82f5ZcZnAkhc8LDNlhAuQoZhKO2eHWWjZT2MrxFHDyX/0zGhb54QmlZ
	hrM3xM1q0MHlSmdWKo6nSJSqzEHD+pbCAN2xOAapiB93m2P9fAtEzqIBjL0UJqVN
	E7QGEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf230b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:20:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e8707701f2so26529685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792048; x=1759396848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J03QPepsogPpGOX5Hp1cEWYgqtb4aYw0wehT27zRwhc=;
        b=ohY/LCWnqCkwNhO6iut4JoAe259nXlfncGPqSv1hupCxPR45ffhDVWDQh33EsXZV2b
         Hy9ncZ/AbtMhzQoZoK/LWGlSSaMo4mS9W/T9iDZlO9jVumBpi+I+xmkCt0sF+iWoODf7
         1t8zhayDEege8MidTKAR1c6fmn5BQo5/H0iwmc2kkkLggiVEzfsZiCrIXqbfGrVocrKj
         EYPbOp/Y8L/kgWcdYjyYtY3b1FiM0s5M8i5tu4s8p6xLfCdk1KJGtptkWFHvou7KbYTP
         YoNLqtkkC53iMpMe3/HgDWzqbyMtcjdW77FMAh1TdjLgCvaI198Ng6kwqJ7jI1rlLqHZ
         UgvA==
X-Forwarded-Encrypted: i=1; AJvYcCW8puOdVrV8vdtzZMlzwpoh+vmBfQrGJIN7fvFYjQ0QDfTPTRF+4yqp0mV3FU4lKS5yepkIU1V0ebfVj6Ym@vger.kernel.org
X-Gm-Message-State: AOJu0YwYfkwItwdVVTWTFX5viZlJplsJ8qK/c7C/rfuJADYdyCN5GQoQ
	R9mlZ8aSsVaHAFJ5I5E7RWNTfjKHa/BxbBzvbNznDEHOTrhgGPUzYPszDwq92kXZWsFzdrWR32l
	FX/UX+zp29J7RoEPRD68xrACOXEddSjDjuhfRJmRjlbaT4Wqp5WNdRWJeIo5z96JO+UKi
X-Gm-Gg: ASbGnctJc/Q3NHXax6Lgp+SMDwuPeU7BZjVB8nZbwqM0vNFgfS34iRXYHu0lWfH0AEB
	Al16c713ruxqDyx+T6T3aTnKK+qYehAmwCv19FN41wDw98K/Z/TJTlrUDpEv4fxlVNGrsJUrNpT
	bYHD0RyelmlYlARvRwuZNNHo5B0/26HueLVHTc4t5q0HDYAw3Z0smVUvTOGUxEj09lpMgkN1gRi
	oYPRYeHfdJaVOJcUNF6qpHAPBXssKCTpseZtdVeGI/gnpLldSwB56zVmVHjOPTAeXJcTDdiXmn0
	K9YshiucL6imuKcBwFJOsos+61KMluSPLIH5cSvn19PDltO+oOMawAIlUaYfcz8Pq/+jJ1dcgCh
	LfYDUB3MOBSvWJZ5pADmrUw==
X-Received: by 2002:a05:620a:2954:b0:80b:2e03:dc88 with SMTP id af79cd13be357-85adeb4da48mr256639085a.3.1758792048220;
        Thu, 25 Sep 2025 02:20:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxlKFEMgfLPnWUY+9AW+CoP7+beslOB5aFZUiExK3V8Ym0wfYrxR4gKAsXlJWjx7TSAIaVSg==
X-Received: by 2002:a05:620a:2954:b0:80b:2e03:dc88 with SMTP id af79cd13be357-85adeb4da48mr256636285a.3.1758792047678;
        Thu, 25 Sep 2025 02:20:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fcddf1sm129596366b.77.2025.09.25.02.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:20:47 -0700 (PDT)
Message-ID: <55ca6423-a27b-4ac0-9c36-ba20bf8172ee@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:20:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sdm845-oneplus: Describe panel vci
 and poc supplies
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding
 <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-3-9293016768f7@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-s6e3fc2x01-v1-3-9293016768f7@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4tIn867KdLpXEzhoyxC7QWfJTas_F2Jo
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d50971 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=CJSKMeR5ttdQttduZpoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX8aTNrZ7AIa2V
 8Rq186G5jjItpDDfHGa2bT7uuMAfbG/g/qtjX/q6LEK45+sQBmor7sMxuDn/lKRWSIxQYOLKcEV
 J91lEblEIN6UAmST9meP6tNwF0uZ2k4suI0ZQJ74O1hBaDovb6biG+CvvvLUqgX7ThRqBw+PfVh
 IhJ98LOF81Tyw+X+vrbNYvc7Gm3TIPWWTtsDJ3jznegxxHg72EHQTyfrSA/WNjKnR0ArFE5Z3nR
 bvos4EJKRjj3edjFIPFM8iKzpdEkbYbIHOPsfA54zV9zG9RF7m9m4DeZZJiTjhcZFrpsQvzS4fN
 jymwcN25sUj22wklC+Z7LX5xhWeX4Tcf0Ol39q003160fjt0pK3OS3xMVObjybo+13JX7HUiC1j
 WziT9qMz
X-Proofpoint-ORIG-GUID: 4tIn867KdLpXEzhoyxC7QWfJTas_F2Jo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

On 9/25/25 11:12 AM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> There are two additional supplies used by the panel, both are GPIO
> controlled and are left enabled by the bootloader for continuous splash.
> 
> Previously these were (incorrectly) modelled as pinctrl. Describe them
> properly so that the panel can control them.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

You may want to add a pinctrl config for them, to ensure the
GPIOs are not in a funky state

Konrad

