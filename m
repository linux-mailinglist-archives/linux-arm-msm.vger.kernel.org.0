Return-Path: <linux-arm-msm+bounces-89284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4DFD28A86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 22:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7F8B308E9AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4294186250;
	Thu, 15 Jan 2026 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cw33jvOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OaquHHO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4A72D0298
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511341; cv=none; b=OwByS9yPZ6/eKTFI8Klo9UxQbIK0ticdQIJydgbCNUFTwdpDe8zP62S6O2+lsni6g9GmTtFUkDlqYk5/g2e8Ow6Uir8qDogRSHAmdURD+iF5Dtb9UGjmRp2Bp9YP9ZOIs3cuYvnHInShwRk1jM6hQv2VnbFXaLTIjQjDZL3C2bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511341; c=relaxed/simple;
	bh=cYegzwpg+dpErr6n2Aa2uQAeSUCnxJcPaMjh7xfqpaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBuxCx1KhNthUVAQiuHr1Tts4LT9wArq+3FnuTueC4is+0ygO35a/al1zDrezx9tXxSeReDm77mp8Dd2limTnY06UTs6mjgFq7sPOPSMLEEm9iyhXWXtj1nA6IrWqcyXPHN1jhFbBR+rXF1Pt2lGSzPiusiWGkBoVgDn5pMyfl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cw33jvOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OaquHHO1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFfxfM2311968
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6CWr3YpvoBVCcskN6Xk0YpfdI325zkYISzpPc59M6Gg=; b=cw33jvOF2Hsg9vg8
	WObtnG9h/BL8Lt0TAyJT1iBhMAaJ/j5DBMNABjIKQ6QbQF/VPDF+45cNvPcXOzsP
	ox/zvf1RMn9QcHUSUtLg2U+D43Phk0wOJLM9tvCUBtPNdG+NIlyIrZUr6M9Pn+iA
	X8MTuK/w233EW6fqMJTcLbY9xTS9m+cTNbeeaunn3ObwKEjDLnCw3HplLAc1JODa
	l5m2MFfB7X74HFS7UZ5C5P9KwAtxZJqrszhv/TqvaOMtUqrn57Un1Ti5ADo8O3wJ
	xerSO4iLQaH7BSXj/lLve9fuvqvkmm1z/KgqveyabIy7RnGM2Ng3nCc7jiEq8/kf
	UkQ3xA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq340h3aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:08:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a4c50fe5so221289685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 13:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511338; x=1769116138; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6CWr3YpvoBVCcskN6Xk0YpfdI325zkYISzpPc59M6Gg=;
        b=OaquHHO1uWPO09oz1kGsqIHDQHwHH+wOtC9Y70bTNZLw97vudawfs4zdkHAE/BU3OI
         geQ6bvL5hfKz7xQN7bv33vq8GbnQ1JZ1/RKGLV41/1tuBSVN+0CGROXiZmZt3jOaHC1g
         YJFvPAzKXPzSKmgNCVBoEfwXBFIdZQkqCZAsB1m+5RH22aDZoH/puzhAjNl9zVVLPys8
         8gOwUn+Fb5pXU8lGKsxPPGi/LjiCIICyxGTzBZrMHNx1gndNd00PXJ7mS5DO4uWVyhnc
         9WlRTu3jjA3fu38vWHKUW4cl/f7hfnmAim/orLB1HnXDQu46Zk53PrBiR2KR1AEjbrFZ
         ktgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511338; x=1769116138;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6CWr3YpvoBVCcskN6Xk0YpfdI325zkYISzpPc59M6Gg=;
        b=CdPxFhPYQ4om9llwojbFUE89oxzcuicwyTOCCT0HN9yqKZKKa3dDhAD5uxsY3RgFwc
         8LTacWCVE7FGqlPqZ9knkuzRvSKeoWgkjZuzkaPF/3Pa1EHJdblm/GuyGQycpD4RwekJ
         OBcoR3+iM+/KOsNjhkOxVAVVcllY57y5D+cNLYyd1QdY0WfM3P60J/35i21KbcTmPDWk
         nQ5NleG14FXFryd8gRheQOOQDg/z0bX2Fta38YexPaBxPFROvYwXZBp+nDTTjt0y+Sh8
         LVuK4hrgnz7o6l5rtzZ6JTaP9cPtcW0DWctAyORwoDTz17Bjthr2JWM1ihonZsrIReAi
         Eo+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfIR8cWUFFhflLvLPSvp1P4anfRjDbaO5Vrljq83ArPZndI8MHQdxqbv3tv0jBAe0JTIBzraM78/ft971E@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6y/8PqvwDTvQOxoeWN+ffWhq7Ho6wqoErekRqJCbE1UJjsWYw
	OnwVEI5Lg7OxC08oF/RTYJIFqwfapo04MJLMTQoW9U5mUzNFA1GNMXomrNzQ4f7R/kOq6daYbI3
	r3qIWozkU+bMg5TXXdYNfc1Uhdf6ePWilZXjGMOHH1e23clel8UnXuu6/4tTY7cWgoK4a
X-Gm-Gg: AY/fxX4pGULf9Fg6L4G+LaL4aESjXwUu0Q1c1CDID5gqP/m2tsdUaViIIY3+FFSUvg6
	SGr7RPrXh2ZDYWuNGFggjG2yfcX0Ej6Rl3tGdEDK1f6nLf7kOwF/oL3CuTAc4LHgU1CaSoHTibd
	e7Ka9NEbcX/wyIE0Zx9YdYZO9bfZ8ugcuooXguquYTyzkv6CxCNkF9gSrMZRCNs/ZYfMfpVsclc
	akninkuTUpsg5tP+UCzY+fwvh/DRfFtCbPXRbCIqOfIyptvVbFN6O1fg3EGr8Fzr6vWL4FkS5T7
	3kmkdpb4+jZwHFiAKeOu/xqh1djXFEqCyOEO+gHJzRgM7zYuyo5m07Dsc8yECICWb0tCe9qkxCH
	PndHQ49asCkADLmffBKMD4lQRdyE0vmHD3hfW8Ce9nN8E4fbx/y9IxebOoWSweNCdfv52T9TKve
	D6aX2I+mYoxUEPBYTNGkF4dI8=
X-Received: by 2002:a05:620a:29c5:b0:8c5:359c:2821 with SMTP id af79cd13be357-8c6a6944eb4mr107586085a.42.1768511337906;
        Thu, 15 Jan 2026 13:08:57 -0800 (PST)
X-Received: by 2002:a05:620a:29c5:b0:8c5:359c:2821 with SMTP id af79cd13be357-8c6a6944eb4mr107580485a.42.1768511337300;
        Thu, 15 Jan 2026 13:08:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a1746sm154628e87.91.2026.01.15.13.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:08:56 -0800 (PST)
Date: Thu, 15 Jan 2026 23:08:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Xilin Wu <sophon@radxa.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
Message-ID: <iqst4yq3z5jlpr6f3r7fqbkzaxtn5ugene2j7tcvaa6jy2jwdi@k5zgxvqgxymi>
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com>
 <caf44ce9-48ec-45b4-b633-3a49b7705b1e@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <caf44ce9-48ec-45b4-b633-3a49b7705b1e@packett.cool>
X-Proofpoint-GUID: mTs_ENRIeTKT3d13U7J2wR9Dn8U_a4OX
X-Authority-Analysis: v=2.4 cv=bp9BxUai c=1 sm=1 tr=0 ts=6969576b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NaFzL-Qi7nr1PL-x3w4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mTs_ENRIeTKT3d13U7J2wR9Dn8U_a4OX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfXw94Lm1bhOQdk
 bHzeHnQrUq9DK6AhuFnGKYTS581J1nGYzg7Dd+VN6INpjGlUte4Yysi6WydaXY207idWfliwA9W
 7+/Oy9lTB/6hBUvwFlfJhP4dDA+H2L0CJhXhkONWbnC1QpcZzq8l4QEz5zSeCjuaavlfjsMqNgQ
 ROkAHlNt3ZD30TjYPAwIGVDtDkaUqrZDdZZWluPW7GBPWrXxqF5BJXmfYeTD1YSvHkiT2o/HoTH
 0r63UON18UoSlbNa1qdMeNIVjMZrMR69ogu8jMNeWqxCgpW28x6dP7vWAwLJuWoZUrd6Fx3bt/Q
 PenXTAbY6CbR8xI3z5OaM53hOSokjgNpPkYPwQYk0f8sZQffMelNR0q0sfGkoCFl7EvsneykX7T
 lrPyOMcGxNrUricfGFBHOmw6qwZ0cU2bd1sQnKtq3aVIiIY+5Z7kYKnn0toaMldkmBIeUyanQmi
 oF/AqladGOcMlkXFskQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165

On Mon, Jan 12, 2026 at 04:54:28AM -0300, Val Packett wrote:
> 
> On 1/12/26 3:31 AM, Xilin Wu wrote:
> > On 5/7/2025 9:38 AM, Jessica Zhang wrote:
> > > Filter out modes that have a clock rate greater than the max core clock
> > > rate when adjusted for the perf clock factor
> > > 
> > > This is especially important for chipsets such as QCS615 that have lower
> > > limits for the MDP max core clock.
> > > 
> > > Since the core CRTC clock is at least the mode clock (adjusted for the
> > > perf clock factor) [1], the modes supported by the driver should be less
> > > than the max core clock rate.
> > > 
> > > [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> > > 
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > 
> > Hi. This patch effectively filters out the 3840x2160@120Hz mode on
> > SC8280XP CRD. The calculated adjusted_mode_clk is 623700, which slightly
> > exceeds the supported max core clock of 600000.
> > 
> > However, 4K 120Hz works flawlessly with the limit removed on this
> > platform. I even tried connecting two 4K 120Hz displays, and they can
> > work properly simultaneously. Is it possible to bring back support for
> > this mode, or adjust the limits?
> 
> hm, interestingly on X1E80100 we didn't hit *that* limit,
> the adjusted_mode_clk (576318) was only above what disp_cc_mdss_mdp_clk was

Hmm, what is your modeline then? Xilin's mode params looks sane and
standard enough.

> set to (575000), and reducing the clk_inefficiency_factor from 105 to 104
> was enough to lower it.
> 
> https://gitlab.freedesktop.org/drm/msm/-/issues/38#note_3216051
> 
> I guess it's also sink dependent, like if the mode for some monitors has
> much more front/back porch etc.? What's the entire modeline that resulted
> in 623700?
> 
> ~val
> 

-- 
With best wishes
Dmitry

