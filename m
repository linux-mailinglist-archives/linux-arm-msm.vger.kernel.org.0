Return-Path: <linux-arm-msm+bounces-60551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB37AD1545
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 00:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53FA3188ADBF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 22:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5931F875C;
	Sun,  8 Jun 2025 22:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BujmzGng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2AA1E25F8
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jun 2025 22:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749422166; cv=none; b=e6OAPL0m60GHHg6FMlqUGfp5VW+5AaAwPqT84aRtNpeBjF8OpBehhz5+GQWp7xaHH0/VR1LP2U6KLkzta/lvuaJqOa9oFlXp5tKFAUrdi64tcQb81aYmYPuRj/LLOUzJH46QK6MtWgehr+UxnDM2g6cykKPxNhq+Lx8HBWQe0RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749422166; c=relaxed/simple;
	bh=cNyWJQnx24t95brsZbr1rwPoDXMMy6ryyshdSi+KTuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=byjQ/clzqBkKlzWQCmdjYjWgRaNIxTm74u0L423SC1RUlyKHUGScdVmddyog8emC3NNm/iiN8PkRYsgqX00o+p5XhNADdbm/atsYpvwtc4F1oA7IOy5h025Ezrxqa7dNhXlD1cxOlxvD8vbtTi9286EDhZmTvgO01BG4jTknBh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BujmzGng; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558MElCo016705
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Jun 2025 22:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5UMciADcDBohw7l3Afqy21k4
	B5zDCEQKS7YSGnXaHgg=; b=BujmzGngVGPBb8uj3Mj5Gt7f1sKcye6En4vb5nnW
	5LTynp70edvk8QYYqK0naItmgF6aDsUQETuMaFYFa6HTLQm/sdCJIzlKs+NPW7IB
	K0UHG5oWKcP7R9RP1CnAh3An7oPjEhMa175nhsu7LHLAbKnPcTM9BPBcZPZhTxSY
	nOUzr+s3+Z7f3KjJDqJV+S+3pmwtowJG7yCIdR+FpvqAqlgFtNdEWwpkHtsy1+rF
	9jH5DB/mCetSuSuZI6PA5otnNaSk+tCmlMYWBkENEmxblRqTyLZ7vmLlrlTlIBS/
	71O+fiYLKqBIDxoKq9PWu5IlJ+PrlIAwBTC+17hUinOUcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn63ve9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 22:36:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c92425a8b1so608432085a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 15:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749422162; x=1750026962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UMciADcDBohw7l3Afqy21k4B5zDCEQKS7YSGnXaHgg=;
        b=ODOFN7LSwAfl/bDI75ng6SnTNREu4qRXThHZePdGx/H9WQi8xHQ3BBuvHLPh/mUClq
         c3UagHoBuQUN4Xr4CWIveKoUUcEqHeXazbPMuWSBKL45i3zed+kY1LmPSoFE2+3hdMfW
         beV1qRy1RBxvQV8d1KM3i+TT/jVYbe95/MIrjrokWcaDSZXzEI73tDjCoJykTQmqWeh6
         Qgl1j3joTE4y9pQLziJEiIdpBAr3NwbFNPi4KdNqbskn+pXiQRgNS0SqmrF7tZfuj1VK
         yaRNuJ7ymYcLVP7c1mWk0FoUejtcgt0y+UaZNtfhUAvYWJI48JEIheqV920mMjySLJpt
         hIQw==
X-Forwarded-Encrypted: i=1; AJvYcCX+3ghSDXn5dwRFu5eD8Y0lqgReX/3Jr4nn9CxomYZrMuvsN/TtTJtW2d2/vKigewm1lDNxZzH8UHUFqmiu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvv2+rJyTnjlbnq4KNtRyzeBahZTbqGIAhY5WAtYncyUVdNpK8
	zdBBpR8IaVwDQT+dqqGzbDHlchnWafwqV56lXDHB7f2EjoJw3BoJ/3eGWhzr+xg97669oW/SpMY
	S4kDhzwfOQeSbocySbJEd1TGSxhzHy0OpcXBvDUSC3usxUdk+3Obvg6d9+VNHTI1FEsAb
X-Gm-Gg: ASbGncuRDd7dfI0K5JzUIXWbV4OuJnhtEpH3DlWD6SGBfrwjcgjiwqRU9OAa5xjEMYc
	8Ag8zny2NkpJAGnGqnAaZbfbKGRM40g+mcveQZ8UDmXvtE9ZIfFAKzggMqFFhISBzVJKx1/Vkk4
	oYy0jnrX8JVh5I+y+kMEABd6lXu1WGiGnhUQO5Cp2Xtmv6T93EX/uzGQnK6M5GTYyrrntGggoNP
	BsqJxTl/tIJPF4OIHtZmtXjAqEg5ZLeP/TLCe6fAZEHWBcagDz8i7QyR+PRlvLzORYEOsWC/FeJ
	j5O8fK+0UvUjdXrNkep74QgTjrHdVPIuGIzX45qlmmtrZjEE9HVZ6spFni0PQOYZB6sPnsoMYX9
	l9AGz4ThscA==
X-Received: by 2002:a05:620a:3912:b0:7d0:9a17:7b93 with SMTP id af79cd13be357-7d38726d9f7mr1026518185a.25.1749422162519;
        Sun, 08 Jun 2025 15:36:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXlQeV3tbfCn8ZNJPWj35kb5AP7pQ1oBAPDaVCFROWwmvnWZ9k6Uz3+DKk6ZgzIutglpKe9w==
X-Received: by 2002:a05:620a:3912:b0:7d0:9a17:7b93 with SMTP id af79cd13be357-7d38726d9f7mr1026516185a.25.1749422162205;
        Sun, 08 Jun 2025 15:36:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d0183sm899166e87.49.2025.06.08.15.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 15:36:00 -0700 (PDT)
Date: Mon, 9 Jun 2025 01:35:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/msm/disp: Correct porch timing for SDM845
Message-ID: <3tmpywm2ipqbdhbu6qga7eb64jk6lcqpqvatmkgwwd36qcqkip@7yazfvwlvwit>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE4NCBTYWx0ZWRfX7MOqijmvtmaG
 TGYSBypBAliB8I4evXtGk2QXrAWjsFmjm4Qyg2+f+9cmCGiFXhvxAMbXMde1vzYZNIB+dSTuGqK
 Mv+vBphVGFp7cnAB+hsAu9gyt9OzsGEPzdr9XNxmhnqN1sMaKQfXMtT6Kt3IadcVZYlyD8n/VE+
 bCQbG7jETb5flcmWK4PFzjHClDbTMAAGiNVJIUrHBE8xDvrLQ8piOtJeOcewNSOYraizRYuFf8d
 YU4NCm3pE+qbpcfpC7NydL0yIbW1rfFaajdW5XVI4XAJfAWOf+czRYnNkvJQEhtoWGKiv1i9C82
 nfnl3l8ukbAzWHZ2puE2Zxsky3ACi55D3gM9GiX2HtuJOSQVY/tmiLVFaAkk0MgvE4dKf8dfJ4c
 KE47SDg4aHtj8wEvOv+5Eqtfbe1ZRlKyE2FabjlxXksmRNt9sR0424WIh/Go5Bv2z1sJkVMq
X-Proofpoint-GUID: gW5WW0_R1oWxJudLaiOwGQ2kXhMcl6cu
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68461053 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=OnwjkJn3o8bp6UkAWykA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gW5WW0_R1oWxJudLaiOwGQ2kXhMcl6cu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=993 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080184

On Wed, Feb 12, 2025 at 03:03:47PM -0800, James A. MacInnes wrote:
> Type-C DisplayPort inoperable due to incorrect porch settings.
> - Re-used wide_bus_en as flag to prevent porch shifting
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

