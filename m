Return-Path: <linux-arm-msm+bounces-42945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B09F8F2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8096189705A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43941A841B;
	Fri, 20 Dec 2024 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dl+HCQtV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF75F4FA
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687587; cv=none; b=SuRAVaSCDamNvz1hyZMDqyLTXjp1G4Yd25u0EOdQayGrq0OUY9mYd2xtWFUzWMdkKD4cCMNW4TWV8FsrZHyNPXALjgyaBhZDukTFd7Qz4YAiYgAFsy7OFNaw5WyfjSoBy1LxRXT1hE+TcqR1BrdyAAXDDSeajUtwbVqh6ZyamHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687587; c=relaxed/simple;
	bh=XdUNAms0qxcM44lPFO+p4DztNRVd7br7eiAXmsu2Xq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElGBiWqZB142gqzaq3j6d78lW5ifapJYSoUhlGmoywVw3DPNCR9nW25GdDiDGN3zDbfy0sSQ2YuUEY9YmFNRyUZ3AOn5SESt7kduYrEXE7gtxnPYU1IYrgO+fqoAQOvbzsY6GftaJPQCoRq2l0F6iNZ8UdirV2MoQ/jZoBNNXO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dl+HCQtV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK94ZqL025182
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pXEjqlySniK6YJsLvzZNjHslOtB2ibC2KkifTthkqGc=; b=dl+HCQtV20lNSrVv
	bzCumTQc2DnkDsyMOmfMACe5p6kTB6BnH/ilqFIT9/PHh9Iq+2a0Z5dL+a3tFbmC
	+3YbTHb/Fx6/Mqb1fMx27jJ+uniRPfw6ATSzC4iI2g1dD380Mnm8dCHbC7gNWabv
	ZLbiJW3dVfLtZxnIAP3Mmudz5DmJPsCUP6UL1XViAIwxvf4PvD6E3CLPVhB5/tBD
	ep5tx/+83nwHiLOB0NYVZsOt/IMPK4P7VgII4jV5r8wcbkV6fqw+vfuqBNxossl8
	l3vtlUbTznPZrhuGxPSt1mHIAbJrLrmQ/EhQ1kga90iTu15asWpHMoL1NWMbbo95
	Gl3M1w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mt1wsrhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:39:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467922cf961so4331391cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687584; x=1735292384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXEjqlySniK6YJsLvzZNjHslOtB2ibC2KkifTthkqGc=;
        b=tYR8L5sQGvFv+sOvLOjT9IvjCncXKGlXlC+FCeDM9GYwiPiMh2MxKTucskmoyJlb10
         aHkvcU5Y5cdDsRzqS2CPuOGwvGOprVeGihxmX6j9DSD6B5E0ttSdmoKKwWMdRRlL7ZTk
         FE7e5o5Ms5lc64XPpL79OyD31jGVu0OVuPmGkPURfA7IIx/tjIKHWg5GO/EnBO429PfY
         F3bbCq+0WvH7UT10eGLXgFlcRBX2mXbfNza49Si/QF5+kTX04hzGj0osCZyjpsmET9Ax
         JexMuk8btKxM3yNFtrjLnX5U9RGGNSMDlE3OvBnBnkxmZY7qwN5CNzv7Q4+1SkxrZ8L5
         72yA==
X-Forwarded-Encrypted: i=1; AJvYcCU9G25Fzh/gW9VGMnGSaiPD/EamC/NwyrLxJeYRfTWRdTlvIip/IaKN6Ums+yWk0H3h1G2436U6LACxVuKu@vger.kernel.org
X-Gm-Message-State: AOJu0YzkGTg6cg60U47H3itpwbuBxCE3eniDokplHPjS7U0GAc1C6/1e
	xsh5DiPTYruQWw47Iv9RPUK+dqEnQ+2R/NIxgtHnSuPWqN4HXFqfV9kZnLHRhqQDCgquj2r+xpb
	7Ub5Mcm3KBOtveHrG27Qk5twB8hg+W1t+rrfN2Nmf/ot9CBFr212y/jSH4ZRVHzvG
X-Gm-Gg: ASbGncvlq4P0Sz4hDG5cBG3jIV9btI3G6oB39N4Fkfs+XYjqmfL62WgorE1imgyAoYs
	7Gal1mB2gxyAoTxMNzQVRcReSXUjgGFqN9TzkY0nTGvm7789RZnwBfSqpJH2PJLxyA1BmRNsslX
	SQtOSggnms/TYtkuHaB38t4vczzt8UPv6oMLDRh84cf07IIDmqM1bQP3qh4lJRbb0woZG0CtWoc
	EMfff885mQWNUdGcbJGsINcrPsH7aCM+UBi9vAox9RwFK77wPQjNMnGp1eNmH3bil6uNfI9Yseg
	r9tJMlP7bGoxXAxDOS59HU2IjBHM/xUhLjQ=
X-Received: by 2002:ac8:5d07:0:b0:467:6eee:1138 with SMTP id d75a77b69052e-46a4a8cdd91mr14731801cf.6.1734687584223;
        Fri, 20 Dec 2024 01:39:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlpgeEfpXcAFgwF67AkPseev6b9+v7GkTVyvIxVXgq4A+FJFBQtIbM8jXWyuFZxSrcoitcKw==
X-Received: by 2002:ac8:5d07:0:b0:467:6eee:1138 with SMTP id d75a77b69052e-46a4a8cdd91mr14731651cf.6.1734687583811;
        Fri, 20 Dec 2024 01:39:43 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f7casm155682666b.3.2024.12.20.01.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:39:43 -0800 (PST)
Message-ID: <2ee51e35-da7d-42c6-a868-bd8f8700d617@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:39:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pd_mapper: Add SM7225 compatible
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241220-pd-mapper-sm7225-v1-1-68f85a87288d@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220-pd-mapper-sm7225-v1-1-68f85a87288d@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7iBnceNUfA_eDy9r2y3N-EWg052yrdjI
X-Proofpoint-ORIG-GUID: 7iBnceNUfA_eDy9r2y3N-EWg052yrdjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200079

On 20.12.2024 9:39 AM, Luca Weiss wrote:
> The Qualcomm SM7225 is practically identical to SM6350, so add an entry
> using that data.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

I think we should instead add the fallback compatible, like

- enum:
      - asdf,asdf
- const: qcom,sm7225
- const: qcom,sm6350

as we've done for speedbin/rename variants of SoCs lately, with separate
entries being added for "actually different" sillicon.

Konrad

