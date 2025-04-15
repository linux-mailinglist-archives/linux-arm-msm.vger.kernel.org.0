Return-Path: <linux-arm-msm+bounces-54393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACACEA89A86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1349E3A170C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4774528A1CE;
	Tue, 15 Apr 2025 10:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMOm5lev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E7F289376
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713765; cv=none; b=BP5sIB5ykiR5at81DxqHalb9+7Pgbbp7JnYBrpsTMkvpLHNG1ZCbbSi/8SUzO0rWh13V0RZFa8Y4482bONZFrmK1zPklOFDJRGImvNVOgthz3fx4hAugXSIvdaJ9PurHn79UkLituk/+0t2jribQRl3mQrnn4wfFjoOUZVIAZYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713765; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jv6PB17LfVSOW6lohwUnnbGKVHj8T8FoCgSttId+aC9jvtokKqMbnFoYwCUWbDbKZZU44Ii7W9DCSRBABuqaI81QfTOue7dVOicElpkJWYxUycTbFCAT9GFrwl3lHnWROIbQEBB6LVduJ+p+OYV2hTPOP/lww/1HjP6HNAh06/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMOm5lev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tG11013127
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=BMOm5lev92e+MOln
	PXaWU86xoGC7Cgz0ERiAzFTiAciUYsEeK9lC7qr7drPpoqtuZBWpE1oRsc9/K3xL
	a8j38OgEu4OCBosfDZ3cbZQ8p42hcqMNE4IYlqqkwO9UTW9RFuwpDMVRkFTIVgyB
	MRaZdyw5YmCuepIyLm64283W1h6/RHp93zngU7BIYGkMOrXJoOtVPSBj1l100ZpE
	AI9ZBdxj7kdjUq7G1/XVrj4RfESr4FFxi64R6tqSmfH9l43tAhufLN1f2XLMy6oM
	nSJLbqIVJwMttoKQfYzHBPtmJOQLsQg9M00WlhkgoavxIvoa9y3hJGDVGqdPQAHm
	nN7lhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fq3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:42:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53d5f85c9so126624685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713761; x=1745318561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=OMoOm6mLkIGUOqVRsTzjGvjREE5ZiKQ81es1S0I8jLaDWTYClgCbKsmQILFEGO7jGJ
         3xup13tbUAOJmj7JHsxzBgo8OY9i0KsR8aMgvbCYGW2L/elkfbPR62XMZKy+bsP2taAD
         O717F767e92knExwcibYLyoeIerLKu8rZtahc3Y+9mV4QrghRJ6kncuiB485V6nhYsXG
         kGc6x+SPVkTWlRiy7C5gt+/1agp91lCrxDed8QfwV9qEX/g38KOt2hO/2bg0DOF4wM1R
         NVEdKqkmnNv1P8iZWUgRc3DgQ/qf1ZwVIVVp6QmnsP5WXPo0/3qSymBFvFs4hb81skYK
         HBbA==
X-Gm-Message-State: AOJu0YzMy2n+7vv42RnQTXWNt7J+Asz8zyZdSJ1fFdPA633zypISP8iK
	1BlMUjlzY9ObySSwutoJLpXGM1nXgnqvF69W6bJpEKhyl4v+T/ISZfEu5CEOe70MbSjDv575KtQ
	kgQTR3Br2uZBgoqZYw6OUfxVqAmRd4F8F4vRJwKgWAxXiFGHbI5mOuAL6PAGaNJLy
X-Gm-Gg: ASbGncvXuFRJOwzB+nb7khJkbINKhgyyEp8jNkiy/ClUlA4msKJ3eUfAJ+QoT0btGMR
	zSwkQFd14ICSVGYovBWCzGu63sI1rzMbZ1m3N2BCopvcc/2eG/kueDeH+l1HPtpkyfDtP0Tpqy/
	AYwuiW6HWhwGsY9c3ndDSOLlBOb2G0ncpC4x8HG87ZDheTgVa4Zm+Sqae9RZNaHbEa2tQvy9Gxe
	Rj/9RdbXEBJiJk731WVOiFF0w4YUu7jFj6Rut1ZGAaloYCbRqzJzEneXJ5hiPbdwazEqCOOQOVd
	rKrIV1WvOyzop1038p0Xr/cDRu82xcJfJoPL1mNmsHHsQfWtH18b64vT1LQhv1IdftY=
X-Received: by 2002:a05:6214:5190:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f230cb4dc8mr83966106d6.2.1744713761430;
        Tue, 15 Apr 2025 03:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn2tx5QvoayzQ/616+pRht7ahmegqTYF8GDn0LbYDa/m8suDClYxNgbiYcKpGQF/QiJ/G7Mg==
X-Received: by 2002:a05:6214:5190:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f230cb4dc8mr83965946d6.2.1744713761165;
        Tue, 15 Apr 2025 03:42:41 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb351esm1059502766b.4.2025.04.15.03.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:42:40 -0700 (PDT)
Message-ID: <cabda8fe-e96e-45e5-bde0-01ce7dcd85d2@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:42:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/20] arm64: dts: qcom: sc7280: use correct size for VBIF
 regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-7-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-7-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RnUawqxKk65xQLLB5M9_c8cMujUtU6y-
X-Proofpoint-GUID: RnUawqxKk65xQLLB5M9_c8cMujUtU6y-
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe3822 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=630 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150075

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

