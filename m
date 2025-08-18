Return-Path: <linux-arm-msm+bounces-69489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E34B29A9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 09:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9E512064BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 07:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688D327A135;
	Mon, 18 Aug 2025 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glmIizsz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E188927933E
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755501227; cv=none; b=RKiNuuOmOC8abKkeDZ5S/mWGGJ/jqIa0MH4PfCmAWK+tJyJiSORM3dNqKCC7kMmITM9PNNFazmRqmCycbBh5jKjWUAwIR4aJmBZ2JjXamMrThLxd1iZyRZyfPy7LQRJeoRA2SOGArOqT14QRlURO0G/zQ1aOLCSLUKLdr/mu0Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755501227; c=relaxed/simple;
	bh=7h+Nc4eirPiFhfph7HvTBvBW2d9R1HcOAcmS9qcq/SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jd6h39AHBBq5T5iD/Pc/QjHAIQJybxvLZSy4hRhbNi2f+1mRNEtwLTQq0DX3BDCQ4/de1b1vWY/2KvG3zLRYyaPX8PDJTvCqBSuvsn/Puu2VQuG3eC2j4KrlOirhnnOaY2DxspSAumwENZRGJRI6r+fTrl1fdlt82fuJwBhB3ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glmIizsz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HMaZ7o015639
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 07:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eO7wadraGhre+LJhTfVeJor488W/8ImtdDnMyxSeuN8=; b=glmIizszRqn3/+U+
	AQB6xcC8EP+OqOJ7w+DsAbFyuSIbb5/21T7AShl/+fevJU6Z2rOWZxz2SpccdLe5
	oqcdd4L5ua0fZZqDr7GPdOPWpph+zDF49+S/Q5OkOoGkMV/iMgfVkenf0vRapAKc
	yVuMIthwebhXF9OBg40/SrJiLng9n5MuhPrePLkKBcqkJ4hWYf444lReEOkEfWkR
	pSf1OBbqx6o6CNGgY5/g2+9MXxhGMDOzILaBIBF3Ad4mEOcdoxgo6xtxcQ3NIEFp
	wM01PcoiibPISy38rnrAxcaJUotGB/eqHBfo8679ErvBGg2efl6+HkpoeJ2OpUYR
	1OUPKQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mbkq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 07:13:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244581c62faso38903285ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 00:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755501224; x=1756106024;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eO7wadraGhre+LJhTfVeJor488W/8ImtdDnMyxSeuN8=;
        b=P/Cyl8Yoq5xz0qJGPj1f/yXkMKlm9C1XfyqJPZh2jk8RL6e3w5biY6YcY5XZrqtomS
         4ewjgudIuNvEYnW284zhWvfnfPqX99/dZWKtsTNzUhb0Ng/JkHttCRdLfnYYmjRQu1BG
         VGT+TXvKMGp08mWvldPfJdp+kPf+t0cr96O5kiuVpe7ps3u8zEckFZ8tCaSPb+p50M56
         bzpRHTlL8Qbrh7g4DvhzxCi6yDVSxcrKUy2FrZikLLJucbRoeybKI8X/6VTe9j+nag9R
         P5LXJtNP673DMJbvsv7j95GfiJX8QVwiVnv6SOpGoXqxIVwcRKsbyb1swmmaej56ohqb
         pQvQ==
X-Gm-Message-State: AOJu0YwP80Yju2vXY3yO7x3pXsGa+q9hCHYx7cLIpNZP/UAHPxp4WXK0
	0L6fvqSURHNL5gqAGG2RvwhmlAf9UOnxVrwsYGA7zoojPeQHAxAuZG4Lyl4IHsiflRcEnND2CtW
	eRWTrpA5disFc4U7icGlO6aq3bc0aaWI3gHJjyiOsTpR0vw8yE06O68WcWszvrYlOAJhn
X-Gm-Gg: ASbGncvopocuTmNkyQ1rAxd3hZWQf1oaYZWnhmcBHJkXwGhlARtFve84ODgndz9kxaH
	l6kv93mIVLNJ3CuwyKBEHsKBg5JuifzTPy9860HhyYX7QjxzLXfhVfZvFLgm9BqeCUmDLUy0ITt
	xNapNWYcP+rmfNZu7GwLJ7Ym8m21Ypendb2cf8f+quR0kEaMC4lLIsZ28aEP5Cov0IjDguhkurl
	3Q3JegZp3vcBPN4KGzgRuq/Yf/2jNGNH5RA/dL6rW2wc/fPv6fCkm6sFjhKCt24jF9M2Y2GJcsm
	Fkj0WFurSy9IuYHNnbjl1NsProeHiIFmaOCjaz8Qxz5fiGljcjkd261CmYOT2b1X
X-Received: by 2002:a17:903:2d0:b0:226:38ff:1d6a with SMTP id d9443c01a7336-2446d6e4c8fmr162951765ad.7.1755501224254;
        Mon, 18 Aug 2025 00:13:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKK/VsGw2K363BINLgo4z0OW/kcKqNy2Al0tPXrsMMCPgwF+XIrPg9LBdfU+0MmAtu3XKsaA==
X-Received: by 2002:a17:903:2d0:b0:226:38ff:1d6a with SMTP id d9443c01a7336-2446d6e4c8fmr162951415ad.7.1755501223816;
        Mon, 18 Aug 2025 00:13:43 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.229.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9d043sm71010145ad.12.2025.08.18.00.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 00:13:43 -0700 (PDT)
Message-ID: <026b1a09-c8db-4a5d-af43-3be4fe24a824@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:43:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a2d2a9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=9Q8gPALlkHEzzDxkdHlyxw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1B6o04Z4kyHWbw-D5gsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: meCyKM-2sMTZTfRC7MZSOXm0s4B6Up7A
X-Proofpoint-GUID: meCyKM-2sMTZTfRC7MZSOXm0s4B6Up7A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX8P+KP0UHWQda
 GR6G+am1ug/rhPh7pNpDhAuB3apIStN0+cAWPIIo+Eva1J+f/RT8eICAiGgyoV8a+kRjrFXNbDx
 IMjZ/KmDF2LSBcGjEiggyUqMy3+PokBeDuQGN2iM4hZRrPRgJKsF32PRJKPX7ybtxzQz4rqQTzD
 avZrTag3xd1hxL/wvX+XZxbKDK5gWUI/o2bk8rKLiF7sNxR7QxLjJouZMgoarOHwwOHl5CUBrfE
 p0lKp7Mj4x06GTtO28tKnPykXQpsdOEvbiWw8v/NbCcniyE0035q6w4cAEli/a1yfbD26uxpRK4
 YVnXclUnfKDaotwrGxyoKYia3CsQapLSvLmrQD2BsLCdedHuLM7v8XcvQbDwRHecNAkFFh8/aWU
 aQrX7xSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042

On 7/25/2025 2:05 PM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> Declare the Bus Control Modules (BCMs) and the corresponding parameters
> in the GPU info struct to allow the GMU to vote for the bandwidth.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
> Changes in v2:
> - Used proper ACV perfmode bit/freq
> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.gmu_chipid = 0x7050001,
>  			.gmu_cgc_mode = 0x00020202,
> +			.bcms = (const struct a6xx_bcm[]) {
> +				{ .name = "SH0", .buswidth = 16 },
> +				{ .name = "MC0", .buswidth = 4 },
> +				{
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(3),
> +					.perfmode_bw = 16500000,
> +				},
> +				{ /* sentinel */ },
> +			},
>  		},
>  		.preempt_record_size = 4192 * SZ_1K,
>  		.speedbins = ADRENO_SPEEDBINS(
> 
> ---
> base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
> change-id: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3
> 
> Best regards,


