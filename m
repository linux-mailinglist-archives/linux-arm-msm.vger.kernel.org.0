Return-Path: <linux-arm-msm+bounces-77264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFCABDBFDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 03:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 234CD4E0F6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 01:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD36C28489A;
	Wed, 15 Oct 2025 01:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkHXfgjX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6015C27990C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 01:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760492121; cv=none; b=s2DU+pcV6MOwbk64uUwGPKdNF79pXp5ASIdbi62Nql8jF0lhSbUBmtLO9g4/DnAWpfkhwkM3ZpsZhngruWYTsJdPs4ADRf97xlq37N2H5dktHVTGWs7dG6O8mhOZTHaC74E+NsMMX665U1FzLR1V656mkfK2IBf8Nze2QY7hAk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760492121; c=relaxed/simple;
	bh=lGfyomj8ywCzIvERjBIWuMLzvtnAKZcUA5B+1/3dARQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxvGdnX1A3Z/QtKwXuzFS9WBd8zx/jn3KvTi/AWcNHUcvJYAkkfEJR4ExvYyAxyaoDPE6G+tunPOE8Qrycdobo3uoAe5UhXrajht5NthACAYkCFg2szWOHS8vgD01CkNDtaxyKfu4tJ+OLHdWzTovXEw2QkYCe4F0puGxNKqC6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkHXfgjX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKRDre015537
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 01:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k2n5J3Jvlq5ovhLn5DGN5KkteKpvoUV0qo2PgJM6Fp0=; b=WkHXfgjXNdO/iuhp
	iSWmUM3w50cjnd4o7FH7Yc7dq20uzSaIAHKnp766ugBFJbUpt/i+WluFzWTu4wWp
	IcY1HybFxkhHF2Ck2kRyeljJhsliSzo/gkQe66b90M15G9LdbKmJSVU+ypnmvL7K
	01DcAPUvK6sSRvTnOIrZ3M2NwYI/fjUR2P7yMWXVmsohrFNApmm39hsqnGdjl+3t
	80PL6jhZGrbor9cqVMql3jDzipq6lT4iRFhUNOAzVDux4vW49Aj3Y990UlOOQUmy
	AQwd/2H2aETVxO1u6lr2RBDXcc+Q4My+zdZ9bCQkRgS4uR4+zampQ/zvEN9t0STt
	T7zupg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c2jqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 01:35:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33085284badso1987100a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 18:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760492119; x=1761096919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k2n5J3Jvlq5ovhLn5DGN5KkteKpvoUV0qo2PgJM6Fp0=;
        b=VrJbgKeEAdeNhX6BA3SVeB6UsO7fQya9oU+YAZfJolyaY8H3e+L5hdgdT2sQazHlWb
         qbJNIYXy1y4tYOTPmTv/7Q9o7TO/z/j2ldBj9dZobMiasYq4eRBswxBpEU+z6qrmmtnF
         g8aILM3TsVAusBZDUnAEJACDqlyz02JgRJliuDtKEYhUjYjRGDmW2mTISBgoUlDfaklE
         8bKeeDQ7/Yi1mORqinSfKxJmuTx/ZNes97jmsGFNyzCGTarv9jNslK5uY+7WEZ2LnTen
         a/jd5I+nhW6BCh8+Yp1ABlnUMriLPEM2SZ8Gse3yISIeigIciH9NgojhqA9t5TDTnlm0
         L9Wg==
X-Forwarded-Encrypted: i=1; AJvYcCX2LqHLwpJyXQhdpqcx4W68F4Ncmt2YRodZemxYe+cDMS3cTKdb4zb/EfeBLWwyNO/1ym5KNUSCFWAjTyR/@vger.kernel.org
X-Gm-Message-State: AOJu0YxsVdAHCTybALhCMltSeAxMbsSq/VCySnJuXSEvM1fMBqJByXeb
	0y0ZoafqUAJj1SSBPS75ycCtF5/hK6Vvb7YWKOTM83n5KQ/zy1UXSqG0PGGB4pLnsvAxYgWN263
	KGIoIMg1fr3A0RdZR7xb8GJAaMC8gyF0u3juulw1ySc4SUTfiRtTLkgvL3kY3IDKn2t9U
X-Gm-Gg: ASbGncsx58emkNLrq+ZdepbSYHrunPQkvB0n4PfoMgih0W4DDpaLJ8QUR6nZH2hwbgc
	Y7dgWR38axXTjPVzrik+Y5qCj+W6hGOLnKlP8XWks3YL0CWAhqGQgyQ6NQo8q68Hq5WFO/6Izzf
	9C30a/MG3/rj3AwzjoUfzl94jufD+N11BxXU6eZT9xRvAOZIUhKsRQ11TeoIN5JrycTfSd4yjZu
	1T2C43T2MXmsWNQGmt/qpnAVPKySdKlK+hMpOeqztxGgiBTkp3nalfOwMzyKQhOcXzRPWT9QOlV
	g/yXySr/i/NXpdNTUuO8dHVAPRuFl0HvFu6tI19X30VB8rsgB/rB+1a5O4UEqoAziHVesG9BbRw
	QIyRyTG8mO13VufSpICGhGoHJWuvOptnWS/g=
X-Received: by 2002:a17:90b:1d10:b0:32b:dfd7:e42c with SMTP id 98e67ed59e1d1-33b95dfc275mr970054a91.5.1760492118735;
        Tue, 14 Oct 2025 18:35:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc+CZt0xREG6/4LPwJm/Rd0O6qubFBGwHV4l8y5dMCUoHmdZH14Lg5AhY6jiw29nPPSwGWyA==
X-Received: by 2002:a17:90b:1d10:b0:32b:dfd7:e42c with SMTP id 98e67ed59e1d1-33b95dfc275mr970028a91.5.1760492118252;
        Tue, 14 Oct 2025 18:35:18 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df7e1d1sm13305597a12.40.2025.10.14.18.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 18:35:17 -0700 (PDT)
Message-ID: <fb83f6b4-019d-4dca-86d5-87ed018153a3@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 09:35:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs615-ride: Enable DisplayPort
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
References: <20251014-add-displayport-support-to-qcs615-devicetree-v3-0-74ec96ba8144@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v3-3-74ec96ba8144@oss.qualcomm.com>
 <geh3pbatv53bnk2zgyalnwvumvcsqaz6n7x6dniohsfk7r56sq@mpflfuye62ly>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <geh3pbatv53bnk2zgyalnwvumvcsqaz6n7x6dniohsfk7r56sq@mpflfuye62ly>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _vg3KlBKr3gqOVO-SDj3x9aZGMMYk4yu
X-Proofpoint-ORIG-GUID: _vg3KlBKr3gqOVO-SDj3x9aZGMMYk4yu
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68eefa57 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2THbcKMbQ0HsdItsycQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX63atKagajtpH
 qSag1Wj/qfzb07N01ML7YvEwtJaTPnnlgDVFkxAr8GA+e6hqnHeXee5PZ3vbwzbOPpcRK1OLGYk
 /OjuGeojlHIXYDtoSsMwTf7A0MCg27LC4DFZrJxf1xJWqvlW1lTNC1DaKLfoagBn4HUnS764sbe
 GeRIbNwwWGNCt0dXFYZUHQVQugaBtUjjCPKY+lTCbkA85kfGurILT/VjoUZhxa7okHlK5YKoOL2
 Lnq6vmwN7jStdQRhVarF39vM/JbTH0wtuc57rlQum/+CQlQwFNy+oq/Y/aEfU8g4RFznskbogyi
 3fogQYdKumbYqNv4g9YjSyk947FwqRCgIopA0lJxmBxz0/A58KunblRkJWkLpx8VxsyXNgBAqV5
 PfyYq3RUruxi8sD6/i1wn41BGvb7Gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022


On 10/15/2025 6:16 AM, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 07:54:56PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Add DP connector node and configure MDSS DisplayPort controller for
>> QCS615 Ride platform. Include lane mapping and PHY supply settings
> The "lane mapping" no longer applies. LGTM otherwise.


Oh, I forgot to update the commit message. I’ll fix it in the next version.


>> to support DP output.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 30 ++++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>

