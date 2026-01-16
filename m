Return-Path: <linux-arm-msm+bounces-89364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8628D2F243
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0A5C301B4AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0E82EBB90;
	Fri, 16 Jan 2026 09:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPe3TG6O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ReQsXE+f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B883239594
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557470; cv=none; b=HmMONBSg/E6L5mFYpn2uhkcLQoKx0+mXqBomf8NNzjaCb5MOqeJ7EobFAkVotwUoZzugqrpdvb9M7GpmTOi6Mlkldr8tz3KHOaI7wGnDMVjv2CtL0uDjHcb/RrhhlANW1fyU9Roe8i4MGX8EnbwRj71x70Vn0445fLSafba7Zeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557470; c=relaxed/simple;
	bh=Uzi8m8vzjUN+e17N6OdIBew5wRoq84yb0bFd2iT4Aco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdmHaMivc7M/clkb/kMHl16nRHUUYWBn13Ao8pP+zQgBCAxVVhDX4C2Cd8tmsI5/lfmjgXxr/RkV9gXuGo+3F9P8kuroonelH2rl2/x8nT737tSdbOas81+jbn47oZvcnxuLVDTbTj4TbZ10o1vS/Jzyt1gFxk3b6/5FrP5e8PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MPe3TG6O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReQsXE+f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8W50L1241227
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+uJpy77A6qGXpHZGMOoyXWjGDOHGU5pnw9fJmRASH4=; b=MPe3TG6OQrHZR2J7
	I68gPXZBzRcZb8aZ6IjvZYHhejrHi0r5jdUyCD4zMzYPjMX5ty5lBTadI/aTOlpu
	bYaDvOgfluJvz+YHvNhrpMHyyjXptKjXY+07AyoxGI6ZawllpE00AgaZ15BF1v9w
	LLXbW6wx1N2aK7BSy2zKgc85YGDjgxMkvAQtN6mrid9HJ+u/MFwLzafur0S2BwRm
	RF6rz8UncEviMjabb7wKvXSEnetymItwvSkI8lYGJ7C8rGsL5WlUuzG7jAsStY9n
	YXjJ3xUydfXC5FIroEHx5Z6L28TvvRBhFb8CdGijr8tCbM5pNOhwrAe7XKylXGM6
	wlKt9Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96sspes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:57:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-501423e1faaso5389131cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 01:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768557467; x=1769162267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c+uJpy77A6qGXpHZGMOoyXWjGDOHGU5pnw9fJmRASH4=;
        b=ReQsXE+fqPKwkutjbokI/2UH5rC5HW8UY/uEjBeEsfBGWvWP7nU8Oy54ph96ZPlcdv
         uTfBq+QXa80Sg9PpVtggpdHc0QihbUcJBN/QvbLJQ5ovyousVeUOAd7SeGTWT0eUOLyQ
         VGKhI2sMXgHZBjR7FyVdFbmtVJTpMnjNg0jv1stnbcrj5vbx/gRNZkRn+0cAXbleijcH
         3rc/9e05oN7ke4mWW7Z2pSAv20Uk+/8u4VdV50pbXKWZaAAFDF3F99Iy2A7GIaRpzgDj
         ajFPSpr6mQ8MVyAymvPKqqnfnEvIjyoiKiql8D2SrKmYP5uOL1zedIyEEl/egCUrdE4C
         HrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557467; x=1769162267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+uJpy77A6qGXpHZGMOoyXWjGDOHGU5pnw9fJmRASH4=;
        b=RuDZD2x3zK7/hjJFRIw7VINknZsnP4Y+FJbfUHegJC/mldF7rbcKtmYDg5A45umtpY
         WYH5Nb32RH8qKvqXiUQVnBsyicnI723K5kykNoUSrf3FBXXeyepK50Nh44722GXVv7tz
         b5k9DetzzmuCHDoaj7tK9Q6t3VRLuxCi8mmwJihPY0eh4zv2ce+rvoY1jEuv/yVm6WZ5
         3xnYz12iRMN0TTPU6gSuGkG+EyS61jK9v9vZoeoa57vW6iPg3vv8pmOfmt4FWz6xR+X+
         CwX2CLtGzkLM26kD6cS8/DMVHa0ipsRYcSQeoBMA/xy3mozlJ98nUin1wEhbbuFP9X9R
         115A==
X-Gm-Message-State: AOJu0YwWpnyKzUP7oGWowD7k7eCkh+NKJcxfHG/XVKM1tVHU8qXSDD51
	bUNcRxIQ/UbxFoX5YrPWCzNuXfoB7DZE97JInrrontEAamAzukHPxLnY4Z/GPYTJdm+0Z7GamBW
	9pW3WAVPzA2WphbP36xWLvlCghNX87eXbSlNON5a9wws9Ojup9YPXBDlWhyP6t2y4rw0d
X-Gm-Gg: AY/fxX5WDHYiLp8haADqyoDurroybjbqapGAOSJZM+EphVE3nBIhOlQ/EmCInSHBOp7
	39qu4HhRpqvuisWy0ayhnTXuD/txveEkhbC3Q7F9XbAP8Z9u1/MpY/6bDBzVNgJfSCiAWjYZsYd
	pWSHkjvEAxXOLX8lV2mqR3M60y3vaiyQMDyHhjotbKcfy6bC1wH0nwQKDKVpSeK4RbcNxG+2H1a
	8bGu/D1ekQN8O3vxIJlE8DiNd0H/p57yRF3IGNFfieCGd9GabAfOj5mrqaGq+EWB6y4WgPmuW8Q
	kdaeeZaCpbRe9mf4XjMrFk2byQozf182eCkxmVhnVVLlcpeVRcAjON3fw0abKWQItggc+xRvusZ
	rotZ1vGnk8a1dAIyL8+KjFpmM87qVrsGhjuY2cxRMTCSgrdzN0gi+TMsiwiAB5dOsdE0=
X-Received: by 2002:ac8:59cd:0:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-502a17d68b2mr27218251cf.11.1768557467431;
        Fri, 16 Jan 2026 01:57:47 -0800 (PST)
X-Received: by 2002:ac8:59cd:0:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-502a17d68b2mr27218161cf.11.1768557467003;
        Fri, 16 Jan 2026 01:57:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce4c4sm1912925a12.4.2026.01.16.01.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:57:46 -0800 (PST)
Message-ID: <3019516e-afb7-411f-b80a-716540a3f8f5@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 10:57:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dpu: correct error messages in RM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-1-b73152c147b3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-dpu-fix-dspp-v1-1-b73152c147b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nEBOyJC8Fx4XMNHqWyGbdHcMtGJz_SQ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MyBTYWx0ZWRfX8SWuZZQZ58Fh
 gDb24nf05n29nC03cUvzJOdxzwpBfcuGUGfplYAd49HZqQUdwo+RlgX71BqEcwAmNx2vGVh42V9
 tcIadISY6uwGM1WvwfyUY3GmvD3L0Q7470hFnDjHROBhsHVvjFpxeM2YfgqHDxroIQn8DxkAlyy
 1HSUx6anUdbq/X1pYVSxL1522RnYa5/MuJeCOuKRFRJouahSRmgi96VxdeJrPDfrejcjn4c08wn
 KzCx2jgUxSPBX5coeceXuA4I32I+c+0WihqLCRUnAGfwYzfdshvO0Fg3o8RpiNUm0saS7d7CupV
 gJdZvAhsQN9pqJbwDAPtmHl+0Kk9QwGOE2pkRYpoj8hahbGuMcdNxq340BtdbFpFSIGrYqFDSBi
 JXyEebwKIgD32xZLTckM5bg/GwT7EHilFhR660IAMfadlJuC2of83mm0016DTnrsopPK0NndjIK
 ADv+Ji6ydUnjHttFKdA==
X-Proofpoint-GUID: nEBOyJC8Fx4XMNHqWyGbdHcMtGJz_SQ7
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=696a0b9c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W2xj9Y3iJeoAxjfXkiAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160073

On 1/15/26 9:05 PM, Dmitry Baryshkov wrote:
> Some of error messages in RM reference block index, while other print
> the enum value (which is shifted by 1), not to mention that some of the
> messages are misleading. Reformat the messages, making them more clear
> and also always printing the hardware block name.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


