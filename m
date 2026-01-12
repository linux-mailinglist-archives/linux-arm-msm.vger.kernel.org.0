Return-Path: <linux-arm-msm+bounces-88543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 828D5D12303
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDE453096DAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027E135505E;
	Mon, 12 Jan 2026 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfx+xYZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YD3r6PeD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916D928F948
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216087; cv=none; b=P/HArNZKOc6fC5Jg8qLjKcgT/CWaI/aNeoitHks6/2M98x+LtFsEeExhwEoUlOth5zeYFT6TeG5ztmzgVbttsLK+4i34u5cpyU0K8CN+ZQgh31giARMJKFpX/NDW9fR7Ia38SWfzLU75azdV5U1hulu/QXrO3erlJYZp/v+wg4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216087; c=relaxed/simple;
	bh=ttRq3EIRIZYlO0QVYLhCDFcObVhsZ+Odd3rWoH7N9HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YFEujA+dQhn5BSsQIy/czEJxyira9Q3wy1hX9bd/btqpkexBSJAk3mRkuM3jLo92KPjmvsmuyyTcV5GfyKgEC6ANKk9HMWMk5/DRx8E2sfBTKIjzM7nufDTY1GyzDSkh/pDmq2ZMA8Mk1J4Hbc/tiTA7zJ7lgIgadq6XE4C0XYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfx+xYZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YD3r6PeD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CA6oON1381366
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=; b=hfx+xYZRpVkUeymA
	3Ja8ykcT4C3u6CIn0RzQonqRYyirG5dg5XnSuc/yDv+Vg1LBqfWtUq4XP1mOw4pP
	uQsYZFtCHvsb8Z7/aN8c65lRxdsURNE7GJkf4hPPB9/9Cgq0GJFRpGvTpfajeJA1
	MbbsTBgSJK2OaNIEHHseiuXlksLMhLCUpCtk8efail104nbPJYyIxjW85JOQo+BZ
	E1B2O/J+m/pUlEpcsAqcswd3giu941S8lyLfk0N7vJFe9jF+C/zEvmkNhHo7wHF/
	wZpd+zeOkp1KdC2wX8b4HywuXpRqT3IhAhyHJufU7tLb+LSwT8K3XoV7Hm8xJeJx
	lX9ZsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmxwv051f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:08:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ede0bd2154so19654301cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768216085; x=1768820885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
        b=YD3r6PeDytbiv0na47Eq8Vs7sEPFnqT86YLpjmur0WqITAXwhqqH4yx8tgq+NlpYOa
         vdBxe6X329Icjk/DyUzSZLOx6NZX8oPITQ+Md+i1cEWveaZQtkd7fm0WmI5MnV+Ulktp
         zbfmQuSPkU6ciKF1o17Y9VBr92hsoCfYmUNw+UGTB9c8IKUp/FGpgynp8gT0OxzHXFX4
         Ci/uQH4HdssuUrOQx1Rcyc/3mVEeubY2xagKiyZGgsxvK+FX9QEn+dn0zuGZxSvMhiFu
         LHtjczZ4tYLEnOMDYmgOelhjZj+/eGR6nAHTdeQBpUZqKmtOfbOYF+LupvaYsD8ml+ZN
         ax7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216085; x=1768820885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
        b=Ua8BbKQbUrGpRsJEPofi7goMbt/uor8X2UFyp3rdgIs77gHE6UZU8v/gJ7EOXfafUi
         ogh0wAYGaDDuqWRzgo5KIm9FRb9XHFDf3K7eBbjlBPx8Qe53UtrDDeHvjkmbA6WU5Px7
         W6tteBpBIbG8I5a1OvFChy58jK+ccTvCJjlYr4PFHuziPbAME213T/ju16dKikiFE0o7
         yRM40JpDQP9UHoNEpI0O9rG33Ib2BtANm0lzOcTtl6lKubVu1qpeK4AdYVtzaGoQt15U
         rhaUnKcW+EkQgE7K12h7K3fxmgl448AocpUZdzw3BrgmkH1raN0+zDJn7n+MXMUAAedX
         +WeQ==
X-Gm-Message-State: AOJu0Yxpu/W1aSpis8qY5wM9C4kQ9xTJBubL6jA6zfE1cAnKurfN6lfd
	8fUGzbTlBPaEL8VKDqXX0gcPqPdhNg43aTWbgul5gszVSwPvM396J37tGBmE0MUXtlG7xVVNMVt
	dM8aAVrYyG2JjtK9NPvdC5I689B+5dL7UCg09DsH/1ATuA6yh12cm7Il4MC+HPtkUt2cb
X-Gm-Gg: AY/fxX4GiF2T4PJkeou2iVnmWxqSkknT3OabN2rxXKhNfkVwFbtr72powdDOzdmg+A+
	s4FjzzmMEOoYHmspz+ShSZrDs8kFfCeHKq72vAeu5Mk6zI1gYjy4mkHIRMohoCHKAIXhinKDijV
	xn45rjzMleguvSjcolpoBpLlXrA1qlmUxuBUY/8hqSuyiPohWqdtZL3q8qblf2iWneNFrh/oNzn
	b/wnUvtMJ0RqGee2jvJYqcttZM1K993MjcfoMNFRV0oN/zoRvsqR4YP1yjZsRrepFyZipkciltv
	mZCXCLU7N615r2UohDwR4R66T/BQwKT9+BPMUeUkAgMiScUXKxW09F3CyCfN/i2jcO6riwo/iqA
	Z1JnQFjKR6OlhvrGCWR5bRqwU+Y41RBpI6J0tQypzQZtGf3/at5ZyFkUddmAu9iqu0pY=
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4ffb4a6d91cmr183969401cf.11.1768216084922;
        Mon, 12 Jan 2026 03:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMgyGfFYE6XaMmeLltZggmuQ6DITKn6VVK29vyczbb9806g1/vlY8V0ofwUK5H2Z36AvK6RQ==
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4ffb4a6d91cmr183969101cf.11.1768216084412;
        Mon, 12 Jan 2026 03:08:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87124e1a1esm374226066b.48.2026.01.12.03.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:08:03 -0800 (PST)
Message-ID: <0630acb2-f18b-43de-81d5-4260b1add934@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:08:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] drm/msm/mdss: use new helper to set min_acc length
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
 <20260110-iris-ubwc-v1-10-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-10-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GI4lhaYof22fgJMr05mvdCarq2KFoKUA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX/whrrplXQYDj
 qVWWUm9VfJGq+Wx9XrSlHWWNDcrz2quHhWVEqGD5eG9gNGCuKfQxOux53r/OYL8h/5XSOzSe2KA
 3mL3xvgrwQduLVPW7lJEUq1RwFg5T80qR9deujfXeFoXrrfofeisXyZMs/GHSTBREFe1qxwxL5r
 ZmguGarTZyPMpjowW9jT6nunazdBbw52fULlJm+R05u1Z12KcfFQ6k7Rh5rgYGS428c3twhLR7k
 9Jq77EpRSjgEmlE7fpibYQIrR841nBHceS0cetABKz2JXGgBu9ayzUglLx+2Pz1WFAY4m83ay1e
 Z+AYtyxOUvkBudiEObaDvjmqITW4LN5J4sVHl02NAUKIqXfznr5HlJpmsT12v05yMn3Rw7jKOlP
 HMKWvlyjhY8DHv/qQ9PH5P6NERp9k98wq4BYxvPdMvVXGQxp0406NH8NbVWZPV1WBd1Z2kJgHyJ
 6J8xGEDfQHVapBEubHA==
X-Proofpoint-ORIG-GUID: GI4lhaYof22fgJMr05mvdCarq2KFoKUA
X-Authority-Analysis: v=2.4 cv=C/XkCAP+ c=1 sm=1 tr=0 ts=6964d615 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=su5gWXN3lQTy_5l37lIA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120088

On 1/10/26 8:38 PM, Dmitry Baryshkov wrote:
> Use freshly defined helper instead of hardcoding the checks in the
> driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


