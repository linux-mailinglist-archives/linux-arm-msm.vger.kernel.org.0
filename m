Return-Path: <linux-arm-msm+bounces-88537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24300D1222A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6404300440D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4EF6346AE3;
	Mon, 12 Jan 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N92VpAJm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+8cNa2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7835027FD5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215797; cv=none; b=XzjqcC31aBbSmuB5ia4VbRU68Z7mU4aCi7DGMa2kFvv/IM8aFbSSHZiE7XCJCHJNF5FMxD5EXsKGKBYg1IQp49UT1tQQ1jYKDBJXDSbB/38LxbwZ3lSi0XE/3Ma5/VsNN8yEVq4bDkGJEcF5JOOO2u7HXqIkrYo8420JIXbqV7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215797; c=relaxed/simple;
	bh=Ac0RtMxAr7r9nLWzPT4woiRfuaN43jxd9G1Dha2yJPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJ/R7KorvU16Je4tfY6J9g2YzTyO3UuXvWD7A5T6j1iw9qK1j4IXR7lXhravXwBEc8Su0NAXETb4ZcEogBhVf57wmUnoUkyf06G/n58PFnjNFp+G1i5NRNqnk6NBVxUew5gRI3vtsIHkppz6ck0KT+ZtxbQs1fjYhvE3VcNwQkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N92VpAJm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+8cNa2a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8BkRR1238549
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dh7GwtFX/nRTX/eU/m8L3lQyGYVksdn9wMWspYflDIU=; b=N92VpAJm2B0J72Xz
	ZktU0OSwjYr40awJYJIiU0YSL63Z6jPC10H6sqrh9GaUnWrtGnKWuAX6CggLNoWy
	yBrm6x1NOjdvs0un5q049WP1IGK1ZOGkD6IRdsDUc3AI/DAked3UKd1oX6wOG/ly
	RmC1XpK2VevFfqM/FiS+uqJda2Ij7ina/r14ks4TVFtzm8xQXsrM9Qxuh8xQv7A8
	Goi+ZuqiMPK6f+G7jXWCwX7Ha1ux9ec+FE4DL5udZTJEfos9q7L1vWemr7tc1BxQ
	xVo4UBaHieS+0XX9Cj124LA8WKgJ6rBEoffaDRmJMulRYWh3dTVPphGPLnNGY2Dd
	qYQWRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfvm77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:03:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1e17aa706so32658031cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768215794; x=1768820594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dh7GwtFX/nRTX/eU/m8L3lQyGYVksdn9wMWspYflDIU=;
        b=W+8cNa2adxiuvugquF5NO8+Bg2HX6eVLToK0i8qF7gFT5Kwb6k0NX/phRwHWMBdNgy
         dxjGDlO0p5wjtMGo8iC0E1ViIK27AYqWf+6SJNzCx9vCza/nxeeFy7nTFn/7W5xx2I5q
         bgvwrsWjQKewKW996UGlLLqkf4Yge44+Ja69v9OBQPrBBjHdv+SailKj9XOAEvyW7cB1
         yS+UOpy17kLLWyT4ggRnIBeo2kn2q9vIFEhu/9G9BDPeWdYuEpPOXA2MphZG58FOsXzw
         BzNJ/Byr8RGgY/MO2xjPf/3NTcGNOMtbqCZ7Q+xjUA8rjzBmkxITO7F3VYO2jEhbQ4iz
         J3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215794; x=1768820594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dh7GwtFX/nRTX/eU/m8L3lQyGYVksdn9wMWspYflDIU=;
        b=Asj04IvVLrYU/HE0PIC+0901G3GJBDeB6VD5d1J5VIMiin6JTKHTkmKLfI8kFx2TZb
         hSt4QlHBivbQC7vXd0QDWIIYLvjnRx6i4VUFez4jS0nvlWciIyolosXgWmAvfiekjV4a
         Yxz5V3n+2A4Z5PAxpj1kOsj20y8QHG1ycp/liRJg0Y6fAEZ6uXqQxe+5xa8NyThydlom
         9PwaLwu1Mfiy7L05ST6OKexKS3hKet6/etbMkR08MqLYv1NyKpYnUwPE532eYjhRoyvH
         pxLY4eKWiNlQq/rc135oaZ96/t1SGmGdwxBLFScnwS0E6iP+KpOzaelp+jTHJp89d3mQ
         0E6w==
X-Gm-Message-State: AOJu0YxcsYiSP63cY4txzX/erAp5JVHHptUrv0jPqmKQ0AWjo2l2fYbb
	8cbVKrv6RmFt9cz3zY2bS5q1hLtsqbme+OjkIXfWPLdiB1dPYx8oGbhOyHVsqeTXpiwztZK/RLr
	yZxl5AXqceWGWKCnS1eZJtntOEuERwtIkv0+1htxvxVMVn8tMl+1v1P9QhD85RAYet3t2
X-Gm-Gg: AY/fxX7mMGVvB5P2GGlWdJ4EFZfiU2JFopjlMDk7t+z5m8gc/iB1cPita8lztvzrte1
	msmHby9pU5GwqA08Zo3wReL4P2b2oBTRAEWCK8b6ODF3/a1lCOdbOaCChyGTIM5K6LpfyiOiN5M
	F1bdH1AR/s8LbCAltpNu/ScWDoWJ4rILCFcNW6fwgSKhSGyeYr8qJ8VoRWyweEq+j+kVz3dY5UJ
	TJ+f1DaIZEIPcJuITHIeddjXs/o3bV/RgD9Q8s/9A8YTQHd9FTxoA9UrfAm9typeS5z0hac5/8G
	y0o19p49H1/b8pEA0hu/9vNfv6GCDE98/DQj7aLrdOwVifJ7IhtjTR3KvmHRqhxUnvzPkWBrYaC
	kT1yPofFgDcu5gZQL6eASVcmtZbWtLYuEWgcxkTBgbcjh2e+yuWQQWdn0NDwN0eurMDU=
X-Received: by 2002:a05:622a:5a8f:b0:4ff:b754:3a52 with SMTP id d75a77b69052e-4ffb7544295mr183416141cf.0.1768215794621;
        Mon, 12 Jan 2026 03:03:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPdWC6RVtIWLJZLBsPSoSldl8ze1rlBRJp0qiP2IpWdz0SLjxgaaX3bN1FJ0pL6PgEwpUCsA==
X-Received: by 2002:a05:622a:5a8f:b0:4ff:b754:3a52 with SMTP id d75a77b69052e-4ffb7544295mr183415731cf.0.1768215794228;
        Mon, 12 Jan 2026 03:03:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b872642beb3sm153934766b.46.2026.01.12.03.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:03:13 -0800 (PST)
Message-ID: <5865a207-16a3-4448-955f-beb769c1931a@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:03:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GdjwS9koZCZIKZyjpilmFQli0wDVgfsd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NyBTYWx0ZWRfX4+itzduVFbqd
 UgU8LcotHaX78iNAFt8oCd9BeBnm6VLenJ1+DNyMOns6qLhc1mQoIRHiKzO0IplACEEEgXcdYGi
 TVnH53RDJcIh7UjFDzjt4qanZDmpqrCyLTFF4cN2fJ3xtPCdvqsjvEX9PSBMGGfrGlBRycuPtoz
 yOK+DjRTTjdBiBwlSiaLrs+Bw9jj6tKzB7nIFg2L1RWKnRBi9JdnKyBrFm21wZSHOyfLsKH4Khn
 +l02+L2WY9ww64X8UaIUpim8w9yAnJ/iTb/JS84VsydAeKE86TxWbHte8jL64Rlo6099tJ4L2r8
 Vo1HtY7egGT6FT5KkIXIbMCTiwn9ESEEfRlSCb1MHqs81QvNeg4ijff1EiHScFdq23DIQec2AXr
 5hCSRBU+2teEAJBEBpZjNjc9Rh56Glk7IGFRjlHaGsABfLH04wA+vpKM98hmZGWy/uuTjzTEvNI
 yba96mDGMyeREj37eEQ==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6964d4f3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ss-qTuU1ZYQsC6pQTdcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: GdjwS9koZCZIKZyjpilmFQli0wDVgfsd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120087

On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> The UBWC swizzle is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


