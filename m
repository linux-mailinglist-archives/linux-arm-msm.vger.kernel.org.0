Return-Path: <linux-arm-msm+bounces-49197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C71CA42DB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 21:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DCA017445B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 20:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FBF1DE4D3;
	Mon, 24 Feb 2025 20:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+cEEI41"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986481DF982
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 20:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740428762; cv=none; b=FHBOW9eenUYSCpCSkh/9v3nyLVE3Bz64PF4xfoWV3jb8R118ZM+JVQ6C3dECMBREQji77AoXlniT0itEIzgvs959GFMCyCTNfdymfKbsCclbfXFqJaVEJqOtvVsusLagF967c7/Padxe1TpkGJtj/p+J1+YM5RHvifNmP6VPQOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740428762; c=relaxed/simple;
	bh=1j/g1K7Ja5vbzknnuLCVHa/8XApl+L1E/ioFi17G0B4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agG5JV/ESDgEA8DAi1F6AbfJMJTk1RxsVFOtzG2gJ7SnC6a7gASSRsRxaPU9eA7lSMaGfZa1VfR7QH/FiMVeVqPNTOXve8iSHabQ0uXe0Qn16DfDldlzxjmuFFaMECrXuQXE4MkmNKUf2nIJG/yDbyckbeCx4PdaYyXcV/7arVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+cEEI41; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OKOOlY020077
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 20:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	65ZKk2GtEBap0WC6JfQnvOCcYk0q6mp1fm75hAwKexE=; b=L+cEEI41C6nWNjyv
	x3fE+tlVbbb1p6Qn/6V/hxl/wNoyArBMgKbJPPbfVEQq+jgfI8bADBOjsP8DPFVj
	6mdOXo1i26JUOCe3akULpU3cnUlQAGO1VV7OMS3xdfZYRC8WacaOp63oqDhvSk0+
	3EFRGZ86ccJfmJ/1cckB6ats39mRFy1Cs4DKSFqrSLAZCp1eU1kGpPg/wvsiVrmd
	QbN1oZ5xIb2apWMxgMpLNKsmAHU2/QquJ2nRpqd1x4GpaZyeYlRsNtifNlFRloL4
	ADeTOYfGHraIn4T5yy5jtWd97LpB4YVizyIFzfylEBDLtq42XxF3PzpdIMJEGImU
	dozm6g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6t2pbjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 20:25:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e65bc4f2d8so7260046d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 12:25:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740428758; x=1741033558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65ZKk2GtEBap0WC6JfQnvOCcYk0q6mp1fm75hAwKexE=;
        b=tO29mVqrfFP8b2XX6kg6n/K/Y4WqpdSm41yJlloO4UCXLU1WqkTIGuXqIOLnTw0doc
         48LAdeBV6xq8N+FaG8o/6UzY/6twpqw74yF8KhIhuNVXH6iG30LbW0rOqj0nbE0FAHRg
         EAhyhkKPuQ4U9O2kZpIYdWu+Y3ayqSMPd1Nj6/2BBMONv9sE5l4trHMemSJiu+2WC7Wf
         VInC6LuxxTkUuUKUyY/5+SWzJSYkmQF7sDU4a3QebddwahpgtCmu+x1jZG0WMn061hDN
         MWFIvw9Giwaxh2TVzb4ZX8SbbL4NBxCGpBYNpgoBeeZ88Rzc/D2+MKw/JG1CZxgvC16L
         5R6g==
X-Forwarded-Encrypted: i=1; AJvYcCVrY7sxYXk1pml2YIyLllY6wp8l2lJS/bF5lZeESDmVnOYLubFqbV2bFMK1tkUrDqJ48fpeBvMn8aMGUYuc@vger.kernel.org
X-Gm-Message-State: AOJu0YzygIg0kljUAoDmlk8g+2xaKwTfdNzQ+iTY6uILSPvvEbzjedMX
	H1JCA5+9VDWYbCyO7hoJqS7TAspCylx88DaGFF9jokG8uDoUV2C55AWwV8dHyqRYsEAJ9cuPr8I
	tsXweYmC7LlHyB8eSyqCzTWOyQCg523f4rdfqZN7FVc6rpuTwuCofga/hqI8tYCMW
X-Gm-Gg: ASbGncv6sl2Y1R2CQL2wClG+04Y9OxJOz4VMGdj8PRgTQmDPeSSIi/nSfTSYH1CjLNp
	kzGFDm0W34egQoTBCqnJby4X56RQuQms6qBUMW68fWwNgEXh62dP4Fq0GGZ/xV4VIPpbU1A/HmC
	Act1c6XdbbzNLu8zUr4o/psIdN7Zbyfy2XH7tlVf5uQ44N+TqH2bAZhGB68U8F4G6C32InJV1O8
	0JuxvqJhn3ylD6yyaTR1Q+CSnb/Dp/yfhCUKHDrumAMvfnjFRoD2mhpsDmRHTt8XykswDVXLub7
	+52A+U/uJFKjgl1P0fLBJhrDRuqjHYjQNbdTWPrZQ/61fTepy0PTvNZ2MONMQOBCxRANGw==
X-Received: by 2002:ad4:594d:0:b0:6e6:5d69:ec2f with SMTP id 6a1803df08f44-6e6ae9d2e05mr63774616d6.8.1740428758385;
        Mon, 24 Feb 2025 12:25:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfKUxFcIDY7voAldnprBxDRpcJ8vSl3Q4jTMO+GbQSLIoMZ1VG0lqyLwhpCWUnpAzTaWApvQ==
X-Received: by 2002:ad4:594d:0:b0:6e6:5d69:ec2f with SMTP id 6a1803df08f44-6e6ae9d2e05mr63774336d6.8.1740428757890;
        Mon, 24 Feb 2025 12:25:57 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1da1c2dsm17830366b.77.2025.02.24.12.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 12:25:57 -0800 (PST)
Message-ID: <6fe42573-7e98-47d1-8815-c11d44671395@oss.qualcomm.com>
Date: Mon, 24 Feb 2025 21:25:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable
 display and GPU
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
 <20250222-fp3-display-v1-4-ccd812e16952@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250222-fp3-display-v1-4-ccd812e16952@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XRb1ZiTWDJ3_hlYvdIONZpQfR8w-85xD
X-Proofpoint-GUID: XRb1ZiTWDJ3_hlYvdIONZpQfR8w-85xD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_10,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=998 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240129

On 22.02.2025 6:58 PM, Luca Weiss wrote:
> Add the description for the display panel found on this phone.
> Unfortunately the LCDB module on PMI632 isn't yet supported upstream so
> we need to use a dummy regulator-fixed in the meantime.
> 
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

