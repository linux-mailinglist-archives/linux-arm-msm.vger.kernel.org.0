Return-Path: <linux-arm-msm+bounces-58893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD86ABF4FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E42B018907CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 13:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B7426C3BB;
	Wed, 21 May 2025 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHLUsocq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5968235C1E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832387; cv=none; b=tYOt6GhvMqnr7gaTHX/oeWF9IeiqkWy3lQCpi0tYI0ymHkVNiaK4jZW+bHM9tqGa/3Cf/or71S0y+xrYn7+NTG1m/rX+06eBt01ucrCAIIR50C2WhHFArxfBIPh4NY/+4ZQ+C/D5+Y8Toq6qF135riTt42MhHR1mIigl9mQ+2fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832387; c=relaxed/simple;
	bh=fNLPFd4xKlr3/lYdDZ86ImLr1zSXSvfTKD+9/Z5sUPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8BiNCiv1L50oGL6vLEh8gJOfd7Kr5+bmc3AkQ/P7OZL28BIRb5MqzISgWMhAGSKOQhpFuhTjcx3CpvD0+hSB9PZOIMphXum2YrydB300ONaBmuxvaPi8iv1cgu4WhRGJtlrlLfRO15tH6TgHWAyPaPQsC41Tlolx8D3MYZ95FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHLUsocq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XKOQ016577
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 12:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PQ8FelBJqVusuKqI01bafP6p
	gE/hxiJzISLHy0HpwSk=; b=OHLUsocqu+9QxrOtGR5b1KSyVIms2jesL2go7drl
	2ooIQ74FhKamY66Q2+4rbF/CcVtFhncW+d7IjQGlfS/6WxyhWco7BJM/fZfSbJSQ
	/jtP+SKQFdAmBjeaHs4qKhYeafhEr8G0H0NOpSco7EhBK61YtcRHRiy6zORt3dFA
	R9jpsIOb9YKPn99a/MzAs5bTku9R5dGOMcCVGZxnRFu/ajVq87JZRvC8SmJaygPo
	TturjWUKQhInUc8Xt0Jqc29IZc4VAv/Iq++KpDV7DW0hmSWfAULknkUOFReShf3y
	1wbqL4KTNLWE2IJXFHKjvMkZuXuJTuF077AiM2JOiy1cwg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9u0mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 12:59:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c9552514so69238936d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 05:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832383; x=1748437183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQ8FelBJqVusuKqI01bafP6pgE/hxiJzISLHy0HpwSk=;
        b=kBA8PrP1roqct0qOHEw0bBR9ctOlJ6+aZSd7rG5FCaGSkbCR758WH0XanRV8qrEinn
         Ef+PdGMfIoj/+LapMIQR2QMa0rC8+DlUStVXGShAZDn7DBrxjycQOEIXGGs1UZefOstA
         vA0Ey/Zvemf6DbsKYMNW6hmECk/BQkDP4Ih7HnvKrLqX0XZIOZHYbnfCGglzuDs6g4tM
         NzM5azOZ/f+z6fqFUPbziKrbnJ4BSe29w7qGJyqpXLs3b9KjTVBCBtz4CqUDQFF5eKv6
         0DNKEmINi39fjl6dswL/oYXBSc01z7pHLuT68qdi08mtyMhQyT42hAEY11/aLPMKdD3j
         s3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUxxxC5d3GXgWRZzzXF7KY6dhpAKMgl3ARxTySj7L9fojTmiG1Xh6Tn8synphjCjVlgT+fFQiLjqnM6UQPw@vger.kernel.org
X-Gm-Message-State: AOJu0YwtaufIeAXcrqwuyj8Y0uRoY6vgMoyATSHmVmB3E8fZNf6ehjDD
	gOcdBn8DtHngR6LSdf6uXCY0qO5mS/e3pRmUd+GQQ882rUHiRYprEJYJi038TybNqhNHMEJAc8a
	ZVHs+XABwOmyYJ4MKxkaGjyn+M6N2R3elbhLJ2CIt5pOh8q1KOSGw+oShb8jxgC5NzE2I
X-Gm-Gg: ASbGncvGgZQ0+EFhgRailH2aaFm1WKoykL9KBE/ijKTj43BfLCDSDOCXZH1t2Ejb0tF
	slNA5B5BhFdHXL+F2pvRd1kEeTesZndvKicNtA/KumnlBxkdPKD7iKitvCkojYncIuEvM7snOiq
	9nNjc3DDLsfnmDCndlI3XCqeLvMAJCb1rSom4rklPeACjWGBq+o38jIfW53C0fXhvRKFuJ6TTEN
	nKw/jOmM/26AnTrCRaPmxRT4pD9EWIqnuuLMHZKFJLFTaO5Lp8eAsjIuenr1ET2iTpxZ8OizOWS
	ipsAr3GPrQLUunlX0lldolEA/1QGhES4/LcD7Y5lcghbUmGmCad/w4yxSapSRHV7xDK2IyeKodw
	=
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id 6a1803df08f44-6f8d03572a0mr205090396d6.15.1747832383555;
        Wed, 21 May 2025 05:59:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUhnGy4gCGjXLtSemtXuIIR5DTpA42yEm9njhcNzOkanHSgLeUZ3VEd2gBEl+hjJ8sTmWA7w==
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id 6a1803df08f44-6f8d03572a0mr205090066d6.15.1747832383172;
        Wed, 21 May 2025 05:59:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702c9d8sm2856946e87.181.2025.05.21.05.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 05:59:42 -0700 (PDT)
Date: Wed, 21 May 2025 15:59:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
Message-ID: <ybbyhri7vydiyowr3iqrizefblrfpedk5it723o254vyklcd5c@cdx7rhx2f3rn>
References: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
 <3ywacd4x23zadvwikw4hdprgbgxxdmbcar3lyayy4ezmd5lcyw@3h2oosmbk6yb>
 <87af51dd-a35c-460a-af4c-813427cdaf84@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87af51dd-a35c-460a-af4c-813427cdaf84@linaro.org>
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682dce40 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=afxxqWxysUDinfw8BOsA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YFcd2M_g7ptcm4qEwY4QO0YBFaQYIBoj
X-Proofpoint-GUID: YFcd2M_g7ptcm4qEwY4QO0YBFaQYIBoj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNiBTYWx0ZWRfXxty0/ffLNqm/
 eyPU8CL/JuIe+UHnvGw8BQGzUiovmRyu9rGT5h5HrZ9i821BoFsQIHNXCgH8bGJ5jd9KMqX9ZwL
 wiUJRZ0X8flZ+2mf2PKN4o09l0fqRoskcPGSmdBG18+H3KkTvTzggXAytLzJngR6qUePY74RI0i
 hsVeemPEVcV6PB1WWyzOTbQXejSJp4c2MYnUru7hRSKKkDACbAcvCvHO+4AZbnfxI5/DS/6KAhZ
 oYZ6tk14QWfOKZfOrHYGlElylK+Myk5ji5TRt0tx4Dhf0arVTOsjVWu2J6ESDDbwmMc0W08Qe7u
 +YEwBFHY0/ii2mMCGXbDHpU2yQWbW4Cz9/VXHUxak277DX2ynaZwPTJ9y4Y2dC186fB8Rwjeb3T
 u0PN4J0lj4Yj8+DicjQO21QwHCxNrK7aNcsyqrI/84MvOywt5rNlAZHJXWst2bqxkcj/Of9N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=660 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210126

On Wed, May 21, 2025 at 08:09:14AM +0200, Krzysztof Kozlowski wrote:
> On 20/05/2025 22:06, Dmitry Baryshkov wrote:
> > On Tue, May 20, 2025 at 01:13:26PM +0200, Krzysztof Kozlowski wrote:
> >> Driver unconditionally saves current state on first init in
> >> dsi_pll_10nm_init(), but does not save the VCO rate, only some of the
> >> divider registers.  The state is then restored during probe/enable via
> >> msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
> >> dsi_10nm_pll_restore_state().
> >>
> >> Restoring calls dsi_pll_10nm_vco_set_rate() with
> >> pll_10nm->vco_current_rate=0, which basically overwrites existing rate of
> >> VCO and messes with clock hierarchy, by setting frequency to 0 to clock
> >> tree.  This makes anyway little sense - VCO rate was not saved, so
> >> should not be restored.
> >>
> >> If PLL was not configured configure it to minimum rate to avoid glitches
> >> and configuring entire in clock hierarchy to 0 Hz.
> >>
> >> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Link: https://lore.kernel.org/r/sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2/
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > Fixes?
> 
> Probably:
> Fixes: a4ccc37693a2 ("drm/msm/dsi_pll_10nm: restore VCO rate during
> restore_state")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> But CC stable would not be appropriate, since this was never reproduced
> on this PHY/hardware and we only guess a visible issue being fixed here.

Agreed.

-- 
With best wishes
Dmitry

