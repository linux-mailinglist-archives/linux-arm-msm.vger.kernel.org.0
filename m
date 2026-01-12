Return-Path: <linux-arm-msm+bounces-88486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0077D113EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86C9430080DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F097E340A46;
	Mon, 12 Jan 2026 08:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ok/qQLrY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dY0/682n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB5D1FB1
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768206784; cv=none; b=JArARAzz70ZdacwDOAMeGPKsHVna0CkzSce2unUPEHvnNcWmtwIPamooxSA17nD9hCDyu7qaDsVr7ksOrw3h6dYJpkBQyK9WP+aOUn0cT8KdTWQy7j/dqtpUUVsfUf+8Vsyv1ojkGWJJjo27/Qv/dkNGbGs/W/6xQ6OXUXUEO2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768206784; c=relaxed/simple;
	bh=trJmRDLfDcxvkAiStkClwN0/nkQwIsKabB9sszEgQ7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZkoRo0r3KncHae6BN/P1lSRdMebn93EvShomZd7c+HHQVkJyUE7LCdTTvZuxbs9hltpiD5pn7WCt9DKEGrjYshRDpjn2RQs3Ss/SuUyY+KjwVb0iO3DvzP1pRnZ2AG3t3AlsRuUgLq6WXYadc9eVGiDy/74WWivYikbxDc1Mr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ok/qQLrY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dY0/682n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C84U8r4089281
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jvVDn+Q8yLrpobDvO87/Y5O5
	MwzvoIhPaYmN1aL/3GA=; b=ok/qQLrYJ/FCvKoU7dv7U0QoFt44LnMop2T9ZI2P
	DZnzvHDCBYlD072dY2CX9I7+6dSDUi1fFycFY5LJwuj+bxsK6Go7j983HIKBK4R2
	Eoo2vWKw9oCRzTsYn8HatsoNXAWBurYAvMWYRBu0z7VGeuJW7EGtUQxU2I/AT6H2
	0nqRbNYAbHwsm0naKVMAXlFD+KKOWxcuAFop/GxOfWEgiF2gClHiNf5S92n6JMqA
	lfZwid0+ivLltokiPztnUujmTHMTWn9yKWg7PW4a/zOR0EjPQeZ2ROBcHa2Iq/OY
	58QidchNZSLZhQbGAWLDTfiz4zwAZnz+ETA1HL5srJtQ9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkeusm7h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:33:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bbe16e0a34so1517199285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 00:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768206781; x=1768811581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jvVDn+Q8yLrpobDvO87/Y5O5MwzvoIhPaYmN1aL/3GA=;
        b=dY0/682nwcg6jA1xruB9QrmUGxx3GcadxvMjkrZSRdVlUHSP/47g4d4keXgJvReYp3
         G291fGrbjn6M57VKnSfdL3v9B2IKwxQBrxlwcQT4YqGFNThnBouUevA1J3Lae4jGmxSL
         AKLGUKIF3hNJS/NDEV7g866X25UxcbYXlZW2VgYT6mj8KWS7zCltmWP4EXrWHj9T6g7v
         H2z7i0Sx6+uk5MgVs4XPvFaGujTuhuhw+Fr2vyt9FDv4JMCgh3goUH0nIkxm1g9DVKUm
         wyFXV7Lv3DiRRjj9D8HRKbC68JwlSF5quRosCbTyeqt7GvQ2VmPnY/jlqpnXncnJtrWx
         L9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768206781; x=1768811581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvVDn+Q8yLrpobDvO87/Y5O5MwzvoIhPaYmN1aL/3GA=;
        b=Hl6+MNYmPbBNTFAMKvLfF9/KagQesoLGdKck87QjYztI+f2BRdVH/zgl7BnM6mD6MY
         3ZZ8Fw2LooGoxPVDZSmwuWOnwMnMaSakCVfN1J2yCVtSv3rxhKeDLIq8689k1te23zIS
         6wi8p3cH8zWuvhJGwH2Qo6UDF7WHP5K+IzK1FnNGk5pkd7iH8mz0gG5pIsZ6BWRFt1/3
         Iz9KUN1Fcjrne2dZMoMGThp9QDEBslytjUxvWf/k78rKfDm0hSTUpHsZf7uv38dTRAvx
         mRG5HRzaXC938rPw/AqkOIABkVEBeiBlhXjFegCpnherpugkC0FhHOlZXaTaA2GRK5kf
         gm2w==
X-Forwarded-Encrypted: i=1; AJvYcCVVLThwnY4ZfdZg5mD+A1PF3TBSQs0YMtp53TqYsGWURo841DFj13YPTLsepqOj6TJcF6Gxrh2/7oc/wxdW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc1UFAIbiTxFRUnRtwHEFHeA5eAfvmAq0BTV1haE64KV8AfnY1
	rmqwMwho6s/VnY8+adAA1WXQyb4NKPdAu6f9DRDgKkmkVG/W/+s750ZxFQXUTGE8qvIZogHwZPQ
	Bw+lTS2FxAKoV6zcYJhJRZroS9ePO7xSs8Q4tqYGgH0c2BIEV2KwIt8FbbPe4HgC8Q4AW
X-Gm-Gg: AY/fxX4FxYLSo1dvS+TZvMeCB5APAB14avZJJehcjLMxwfBVVydj4CnpR1MrS2G1acD
	EhjF0qZIhN8cF9RX/ZWCCXM0uv3CWP7x/EXHQo/nwCwRwtXjZrnOG73xVSl5q2Pnc6uqt3f7HvW
	ewC+3jCrndVoc4SJWGwhze7aJ14fXt33nuCN3lbog8Vz691JekVzOzvpCkZu5HGY/OQC8+a93Ho
	F7gD8cv64Ia28lrrP9OiqgnTDhiyooouw4OkIojaBjBoI7d7hFeqWjAFaZ294/bVPuC08KpSEiq
	ANwYYBsc+2tmmnbnpBijCs0HXEc0fSEf6SfeqKaDCeLWfvENRrtyDgl+E7om7YUIauRWe/Uv1ye
	LpOooXn2P0PHL11p2vRg7ceZvSdA8pRvBNbUrLL12IoWShieTzKMgieqU4LC4HAwZonyhsGQXBf
	ukr1emOqeOpEA8DrxYlwE3GtA=
X-Received: by 2002:a05:620a:294c:b0:8b2:62ae:acba with SMTP id af79cd13be357-8c37f51e848mr2652706385a.26.1768206781469;
        Mon, 12 Jan 2026 00:33:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3Gm9wf+0hbyvj9tvcV6WOwEYs8utTSe9Uo2vj3hxYui4D8sJ+VoYBES4fJKvryhsbSfH/0w==
X-Received: by 2002:a05:620a:294c:b0:8b2:62ae:acba with SMTP id af79cd13be357-8c37f51e848mr2652704885a.26.1768206780968;
        Mon, 12 Jan 2026 00:33:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b7d1ae8e8sm2414467e87.6.2026.01.12.00.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:33:00 -0800 (PST)
Date: Mon, 12 Jan 2026 10:32:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
Message-ID: <5frg3jfsy2hhg4l2cgpcf3h24o4paqmk4n5djgfoxhlgonyg4q@mna4o5uc33fi>
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <6381550a-4c1a-429d-b6c1-8c7ae77bf325@linaro.org>
 <da56lghirjcwesz4usdlfpttwcmvoql2h6bvjommoyfskjdkgk@hrlgx4ukt4aa>
 <09cbf40d-6536-4bda-94d6-5b45a5746962@linaro.org>
 <w4lwl34mtd7xv7it72nvomv6te2bcybisvirfdwzdazzqisd73@fvyusj6m5cb2>
 <ed323916-f0e4-4669-935c-6fc8ae6a9490@linaro.org>
 <58b5fc9e-890c-4b89-97fa-5d1638cffd3d@oss.qualcomm.com>
 <1418f8d1-a243-4798-9179-5d5add57198e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1418f8d1-a243-4798-9179-5d5add57198e@linaro.org>
X-Proofpoint-ORIG-GUID: hj4YsQ5P9-4em-0Uju903XoGaegOgFtp
X-Authority-Analysis: v=2.4 cv=GNMF0+NK c=1 sm=1 tr=0 ts=6964b1be cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=XwQ1i7gJwNEEeRwJ6_wA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hj4YsQ5P9-4em-0Uju903XoGaegOgFtp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2NiBTYWx0ZWRfX+Wm7QDW9Mqym
 uk1lEJBFBaqtMIikk8ZU3T94uL8yBcyXTu57hRDFidSa9UaIK/hkozzyEHcepPWUir515yqi84F
 T/VaC4+LLfbocOTWMYkr19m/M1THL3Q5ecrrxMw5EVEKtIyZtBWy88FhV1LDRHe1y93CQnYke8Q
 hcEHTgLDU6nPj4peGDWMPngfEKrOxXfPvvM0Bntr2m4dd/Z4/uzIlPw8bJCjyOwdSbWwclZ5tAn
 ZP73XPL6Xh3N539QGnSrU3U+JL9Y9IFtNzbNuNnkNP2toPJ98R8/Z9o62GXpV4nEYg9HwKgxSVv
 hum5R4JrRPXYeICyVAQRSj1zeDezOqD4YOuNJpKM2/4Djscn97AI6D41T5rr0ZBm6Iyy6e/fxzP
 T9d7r7ORRyAqNJv3OhSdg9CieCha9h+P0YnliqHoG5PMUZmZa4L/oQiLmwm12wF/pwRP/5gSzPU
 2fyRHlWLvztpJvMpLxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120066

On Wed, Oct 29, 2025 at 02:18:49PM +0100, Neil Armstrong wrote:
> On 10/29/25 13:55, Dmitry Baryshkov wrote:
> > On 29/10/2025 14:49, Neil Armstrong wrote:
> > > On 10/29/25 13:30, Dmitry Baryshkov wrote:
> > > > On Wed, Oct 29, 2025 at 10:40:25AM +0100, Neil Armstrong wrote:
> > > > > On 10/28/25 20:52, Dmitry Baryshkov wrote:
> > > > > > On Tue, Oct 28, 2025 at 09:42:57AM +0100, neil.armstrong@linaro.org wrote:
> > > > > > > On 5/7/25 03:38, Jessica Zhang wrote:
> > > > > > > > Filter out modes that have a clock rate greater than the max core clock rate when adjusted for the perf clock factor
> > > > > > > > 
> > > > > > > > This is especially important for chipsets such as QCS615 that have lower limits for the MDP max core clock.
> > > > > > > > 
> > > > > > > > Since the core CRTC clock is at least the mode clock (adjusted for the perf clock factor) [1], the modes supported by the driver should be less than the max core clock rate.
> > > > > > > > 
> > > > > > > > [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/ drm/msm/disp/dpu1/dpu_core_perf.c#L83
> > > > > > > > 
> > > > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com> --- Changes in v2: - *crtc_clock -> *mode_clock (Dmitry) - Changed adjusted_mode_clk check to use multiplication (Dmitry) - Switch from quic_* email to OSS email - Link to v1: https://lore.kernel.org/lkml/20241212-filter-mode- clock-v1-1-f4441988d6aa@quicinc.com/ --- drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 35 +++++++++++ +++++++--------- drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++ drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++ 3 files changed, 39 insertions(+), 11 deletions(-)
> > > > > > > > 
> > > > > > > 
> > > > > > > This test doesn't take in account if the mode is for a bonded DSI mode, which is the same mode on 2 interfaces doubled, but it's valid since we could literally set both modes separately. In bonded DSI this mode_clk must be again divided bv 2 in addition to the fix: https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix- v2-1-01fcd0b2465a@oss.qualcomm.com/
> > > > > > 
> > > > > > From the docs:
> > > > > > 
> > > > > > * Since this function is both called from the check phase of an atomic * commit, and the mode validation in the probe paths it is not allowed * to look at anything else but the passed-in mode, and validate it * against configuration-invariant hardware constraints. Any further * limits which depend upon the configuration can only be checked in * @mode_fixup or @atomic_check.
> > > > > > 
> > > > > > Additionally, I don't think it is correct to divide mode_clk by two. In the end, the DPU processes the mode in a single pass, so the perf constrains applies as is, without additional dividers.
> > > > > 
> > > > > Sorry but this is not correct, the current check means nothing. If you enable 2 separate DSI outputs or enable then in bonded mode, the DPU processes it the same so the bonded doubled mode should be valid.
> > > > > 
> > > > > The difference between separate or bonded DSI DPU-wise is only the synchronisation of vsyncs between interfaces.
> > > > 
> > > > I think there is some sort of confusion. It might be on my side. Please correct me if I'm wrong.
> > > > 
> > > > Each CRTC requires certain MDP clock rate to function: to process pixel data, for scanout, etc. This is captured in dpu_core_perf.c. The patch in question verifies that the mode can actually be set, that MDP can function at the required clock rate. Otherwise we end up in a situation when the driver lists a particular mode, but then the atomic_check rejects that mode.
> > > 
> > > A CRTC will be associated to 1 or multiple LMs, the LM is the actual block you want to check for frequency. Speaking of CRTC means nothing for the DPU.
> > > 
> > > We should basically run a lightweight version of dpu_rm_reserve() in mode_valid, and check against all the assigned blocks to see if we can handle the mode.
> > > 
> > > But is it worth it ? What did the original patch solve exactly ?
> > > 
> > > Do we have formal proof about which max clock frequency a complete HW setup is able to support ?
> > > 
> > > > 
> > > > With that in mind, there is a difference between independent and bonded DSI panels: bonded panels use single CRTC, while independent panels use two different CRTCs. As such (again, please correct me if I'm wrong), we need 2x MDP clock for a single CRTC.
> > > 
> > > Any mode can use 1 or multiple LMs, in independent or bonded DSI. As I said the bonded DSI with a 2x mode will lead to __exactly__ the same setup as 2 independed DSI displays. And in bonded mode, you'll always have 2 LMs.
> > > 
> > > > 
> > > > > So this check against the max frequency means nothing and should be removed, but we should solely rely on the bandwidth calculation instead.
> > > > 
> > > > We need both. If you have a particular usecase which fails, lets discuss it:
> > > > 
> > > > - 2 DSI panels, resolution WxH, N Hz, the mode uses l LMs, m DSC units and foo bar baz to output.
> > > > 
> > > > - The dpu_crtc_mode_valid() calculates the clock ABC, which is more than the max value of DEF
> > > > 
> > > > - The actual modesetting results in a clock GHI, which is less than DEF
> > > 
> > > I don't understand what you need,
> > 
> > I have been asking for exact W, H, N, l, m, etc. numbers.
> 
> This is irrelevant, checking a frequency for a "CRTC" which doesn't always
> maps 1:1 to an actual hardware is buggy.
> 
> Dividing by 2 if there's a has_3d_merge is already a hack since 2 LMs will
> be associated to a CRTC. I don't see why the bonded DSI cannot have the same handling
> since 2 LMs will be associated to the CRTC.

I have been looking at your case again. Shouldn't we be setting
DRM_MODE_FLAG_CLKDIV2 for the bonded DSI modes?

-- 
With best wishes
Dmitry

