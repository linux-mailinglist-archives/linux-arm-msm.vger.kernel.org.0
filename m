Return-Path: <linux-arm-msm+bounces-78252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D88BFA1C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 07:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7E8DE503AF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 05:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96342EC0B0;
	Wed, 22 Oct 2025 05:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itPyFBoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092E5BE5E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 05:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761111980; cv=none; b=dsrA7WcKQWZmLjmB0KthJPrLjdLyDKxqw5CRBE+0J3FVoo2UY2zCx/0jzUySZ+/FIeq0ArwwtWg+DZDTmo0scxcUIhb1FCem4MRn6luP4aQ7v7elddmYJWstCceGhoMFda6pNm5viJZZqhFi3WgDFPNRBWyXTlynlwlNb+xAh7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761111980; c=relaxed/simple;
	bh=GPbtRPqIECeP0yclKwXqY9pSqHQ2lvzxM9YJWlNlbnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qRi+GmQBNiNHx27DNXwPYgjDaJ5Iqie2W3qd3qVWyVXp/wSL1iqyoiqt3WdH+3pyFs+/R6yRAciGX3Srl3qm5Kz2TB3U0ptHsl/rSk3s5hfG4VBreF8OE93e+2puhAXgKbRONAmeUFz+U6gPpjxnPIzerpICFLlcqRsbLEHs0do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itPyFBoZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LKfHJZ012327
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 05:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CainteRZ8Zd8o7nDkOh94ekQdPJKyfGA6FMGoE2UxGE=; b=itPyFBoZ7vZullgn
	Lbeb/ol/nIwiqcLEAHc2JyyC+bS5ma8gFXGt6j/WWcN3iYJdkV4P36mr9iwtV8nS
	GPFshO7E8mZVVKnKSMPlx8prY1iQeW7w1YJA+kByRsJ/xVoYRzJsnTZy6sa2jHEt
	D0sogVEKIuLQnjx25lkmkJEEhJpbVsnPWtZudFpCLL8MHrkh723JqjWJz41pl8+R
	Z2ygefy2h12LYzMNjr6dt1uFOrxZoQnkc1HaXjLt0cVczJBcUGeHrC6Riwle7Mlg
	/V2pNaW6PqKFQJrfDS9gNDq/D6YAB8I6hV8KDLcsCbva7kHMn18d5ok3neVX9y3b
	/kxv+Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0h7gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 05:46:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-336b9f3b5b0so6795283a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 22:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761111976; x=1761716776;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CainteRZ8Zd8o7nDkOh94ekQdPJKyfGA6FMGoE2UxGE=;
        b=qE4oGHvgPTd54Tu8tq+d6PzUwE1CqztSIeuEc0gP5FN7pkk5kp9ClValrLb1IFqm/n
         S8E32/fg957VGIN5hNpB9vWlSkky35aMAi/uEH8gKvvZBxg4agxs32Tq5KZ2UVH/dAIC
         1QUqDM6rgthUjlFuBWqADGQvzY8Gco0cNX7LzyeYE7OiDGRwet+Dth1wxizwYvj6u0CO
         npRn+9nkDSsgrld5e6Fh3rGhT4eqRWG5YMy8BlQKaWPwQ8Rcdz6iHRAaMV9NTNASDFz8
         NXOPoB9Vpkfscq5PmxXoE9gpBaFZw/EJPONNRj17dOzAx7Ro/zkk46tQh13is4vlc3MR
         5SLg==
X-Gm-Message-State: AOJu0YydwbaxylsZOa15K58UikE/gIXIUs85RAoEp6o5C+GvSwETFi9t
	WNfYN1WFF+rlkaq9lu1OPUDo3l/ghRZ5HvFYlOAOBE5iAzxAJ0CM9TdXq87OLuC+vQhAMMsO9wy
	V7cn4Qo1/SD20ir3Oz2bmKTx6AzHg2bUCrv2PiUIo0o2Oe3R7LAQ8OvHLaIlIfp+NLgwP
X-Gm-Gg: ASbGncv2p/am4Wwi+xMSjd7Dmy/cHRAbvwkmf6/9y+mVjLC31kdwE8ZJjGnUiSq8N2N
	VbgWV46p3AQlvRfPXaweQ1X5E+LOEIUE927mZ632BtrLUa+5M2FMQdoljsGDHz0c2Q56Y8f7pWm
	gqEapkWIxn2nGGhbDmxvLQVrAGjZGuoa6HwSzpEicWhESGR5w9FyYkdEuCCRE0eUk4Y+hw4r1/a
	mzcv9GZi4fFVN2NC1gCOTdgqnup9b+ICBgGRGlhoChPuF9MI5fWwR5WWUg2DTFtWukLq4PwKDPe
	0OrXhbCNZcB2ZAX+ePDZtYDd842BDBdaIrBcqLt+MUKfvwNmEihXJ0y38JhBOIEQjJr+I5HnsZX
	R1aAfS7Ai4Hz9v6a2oD0KLGS1aezDgWbNqQ==
X-Received: by 2002:a17:90b:3f8c:b0:339:a323:30fe with SMTP id 98e67ed59e1d1-33bcf87acdcmr21722175a91.14.1761111976598;
        Tue, 21 Oct 2025 22:46:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7gmWeAdo/ledsoYbIw1NxsAbbcauz1W825kuXhtPHAlp3ip6vJYAzoO9Gi57NsoB2yrPBQg==
X-Received: by 2002:a17:90b:3f8c:b0:339:a323:30fe with SMTP id 98e67ed59e1d1-33bcf87acdcmr21722145a91.14.1761111976164;
        Tue, 21 Oct 2025 22:46:16 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.252.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223f11f0sm1409058a91.13.2025.10.21.22.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 22:46:15 -0700 (PDT)
Message-ID: <9b9dbab2-7dd2-1ec6-4dec-50063171dd15@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 11:16:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 8/8] media: iris: Add platform data for kaanapali
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <bRFGFB-aXU67uJWfk8UwBE0tOCTXpquadL2rGHbdcoY0nEdQ17cATN_K1Khk6RWZ8cGONLIs9N6XLd_pe9CHOw==@protonmail.internalid>
 <20251017-knp_video-v2-8-f568ce1a4be3@oss.qualcomm.com>
 <9d39841e-d2c1-46e9-8745-1d4d8d073739@kernel.org>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <9d39841e-d2c1-46e9-8745-1d4d8d073739@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX/XMDGDgQxDsQ
 3fKq96gWcUy7kWQfp8O6Jc8bRXr2EN3ZB7dSuV23jbcW+uypyi9VeJxOMfk4cfd9e+K9ZfVY9UP
 /mkn/pbJfPDYSt3n2uVgrrqJtUmxj61YgGGJ8A29ePrkvMIblnNsNWM/FsE/NdjQWTUiMO2qBm7
 wvzCT610Pny2nSYCNcITisY6361Gmqjw0Qq2ywh92OQbvOdNNLms8oeQIBPg6/ySay8mfZ7Vz2Z
 uT30NeBNU8LvxYDkVwx8gnZSc1CQLGyJpH7wgM1pqvSYNzuHGJ5Dyyj0EaYnDolrtReYAEFxlaB
 6+CUjFdQ9X9PF5NJ6lls3jL5sBCVaN/ifvSBrpw6QxjrY4B16WmXJlg1mDGSc5z+uTjWTVgvMJ/
 eMJfm0uoidfSShGr0GPUpCmkq8Opnw==
X-Proofpoint-ORIG-GUID: vsX85qx_6hs6HQ3I9iCVTM-8v0xAYff7
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f86fa9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=FoPg1IWog9mqHsjG+aRTFA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=aMGEy1ZA8zrtvtRU1IMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: vsX85qx_6hs6HQ3I9iCVTM-8v0xAYff7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167


On 10/22/2025 5:09 AM, Bryan O'Donoghue wrote:
> On 17/10/2025 15:16, Vikash Garodia wrote:
>> +    .fwname = "qcom/vpu/vpu40_p2_s7.mbn",
> 
> Dmitry pays more attention to this stuff than I have but, is this a released
> firmware ?
> 
> If not, are we sure this _will_ be the correct name that hits linux-firmware
> upstream ?

Yes, the naming was discussed and the bins are accepted in linux-firmware

Regards,
Vikash

