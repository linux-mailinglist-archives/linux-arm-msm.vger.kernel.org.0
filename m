Return-Path: <linux-arm-msm+bounces-52545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 142E5A71CF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 18:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F47919C00C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 17:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FB51FC0E2;
	Wed, 26 Mar 2025 17:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkaRsmdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FC71FBEAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743009430; cv=none; b=YEFX/pWkNcH1ZXd82vlf+7cLWZ2q5t5brJAVJnAoYy+RXla2X5U7XdZhkSbsYnkGxb+ttJzMIKSvugtdVunsIvSJfPyVI/exdYD8H4QWoJx9v2xMd0eeQ4Sh//gTDkv7wapLYeVkj4/h5VvRdHL7aUV9H4je89fkj2ZhrYY4TxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743009430; c=relaxed/simple;
	bh=ULQll42SpXp13/9+pqAM5sMEpJ0dbiOa04Hrg2p6sXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4t0td6kRHWwG3atDOYQjVSDorktlzKmEUDq6nGJvmM44ta4R63Zd0CX4ygWQDckWLNh6+FFvlvvAdsMu24BpTRLpt6k3fsr/nurWRFTZln2xIBs84hnWfdURyi30D9p4SP8uEbjYQh65/VmFTK+2hNd9cRhLcQx3Y4p1KWxJdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkaRsmdO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QFR5NB029039
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=57VyLFaymf8F9QU36mtSjFzj
	QMz+UO59TFULkEduc7g=; b=WkaRsmdOaVzXTCXblrwhQ7etqbA9GJ8a7O3AI+A9
	N0aYAr1dPUV3QNo7t/pkbcW+NO+iEvGg/FhM9wvxzlzKbVGoaLdaOWu7Lus9tdWK
	eeWnWdgTGREkjZkoH5mPlJs1uDrUOyPamsEQE1mLHUM0OzXHwjCbcktrPOpLn0KI
	FSSHkY/5RPHbY9o1KMFMG19zZmEHRmsbOXHQbdQ0KJoxLe9vNpN/+/7n7qRP9ra+
	CfXNNIR7+oMYjE8KbVScA1tOl8++kb1GHuf//T2T3RnP/3cSkNmNum80TBXHlhqa
	FjGMwnYhOGsU9+vVp1znwKEYZ0IKzEzlto7Kl3IB4VCVRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ktenckrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:17:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c3c8f8ab79so15609085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 10:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743009427; x=1743614227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57VyLFaymf8F9QU36mtSjFzjQMz+UO59TFULkEduc7g=;
        b=ZJ0N8XRE2vEeakhFjd6y+ZLQGblbpwme8ScNy//9YzNx6FBwmiKP5M13lA7zn7gkq/
         KVvtqFuEQLTWOShme/InT5LvktniFE9N5PXHZTH7usxJUzO7wMdIGB0RaEPqi7ir016j
         0JZaVAloY8h1ymPHngIf5zHG1cyhCgfuue42EScQiK6e4yEK7Y2RGPvvDDF8c64gUkfa
         lZ4hFg94xh6RdHYD3pMXl1Md3Q5UO2CtIHNJ1Vt2iuAT6tImt4PUtzBYXGL8zO087Nps
         SgWQBPvRrP8HeFW0j67mjR1ilFZwI10mzlZGmW27zFbQVY065gXjeZXjGr3+B7zaQUFI
         bjfg==
X-Forwarded-Encrypted: i=1; AJvYcCU3/9Q3E+d3CgZSXWTO6Tky68bFk+6OrS9aHjs48i6XgbHAVcT6sVsr5uUJ+F/DngbeYjOblLL21PlOhK0+@vger.kernel.org
X-Gm-Message-State: AOJu0YzQoUXsmCeQgMAXikIyBV5H+vjtQeDvexdAT+y+pykq6OcEqrLk
	fvOws0j09RzDTY7d0PdNj95mIb8MAIqn7CGHv7MWDp0QwdOlek+6iF9YIVBWiEu88m/RQxPfFJ2
	uWY9lisf9H4c12ew3xejMqtuZ3HyBoO6xPQtwrfINTQw9R3fajn9hHwQ32WkdtF3u
X-Gm-Gg: ASbGnctK48dKMKMarAqCCIyxiR9D5QtoZ6XQeUOKLMUkcHj5qDu8Te7RoUM7esuQtWk
	hc6eef2k9zyTyoGWSNvGPR3qyA+XdcqF4c4Omv/4vRZ9U0BZFLHTgKlMSTWPBGSPwbbMPu0RE0l
	i2S27OHbU8yiMhSecp8EjBQ1sn4XiEM/lUO/t47wjMBPawfRgVxuysL4cvAZBii9E1fE4/mU0kt
	wuKqACNy52TPe4DOUyPEGpb65I0cU1MVz0d9QGc4WyE3hDS63ZT9aFaHaOEbLeptnDNsa+qmeSg
	SOecWXyjOaXs79QKRoGrP2mzWvHOu52tyWV8G34DkwHlcqpee5SADhlfpeA2nhMTNVRIWGM4hoO
	Lw1g=
X-Received: by 2002:a05:620a:2483:b0:7c5:df79:f2f with SMTP id af79cd13be357-7c5ed9f2cd8mr77468285a.18.1743009426604;
        Wed, 26 Mar 2025 10:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZVayB4qjwN0UyX1tnhJiLkSyjaqLbzhmrB0L0YbneGkZGXSc7GvgkWAaXLuLzkuqSASIp2Q==
X-Received: by 2002:a05:620a:2483:b0:7c5:df79:f2f with SMTP id af79cd13be357-7c5ed9f2cd8mr77462885a.18.1743009426112;
        Wed, 26 Mar 2025 10:17:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d8f4280sm21672611fa.73.2025.03.26.10.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 10:17:05 -0700 (PDT)
Date: Wed, 26 Mar 2025 19:17:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/dp: fallback to maximum when PWM bit count is
 zero
Message-ID: <jbowz36pz7es7koc3abi3maw6ytz4auuobhkmkqelvwavilqkr@gxgsdhao3skr>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>
 <2cfdf7f3-56a6-495e-83cf-1921a2e0ef8d@oss.qualcomm.com>
 <CACr-zFBFpqgHVRiH37ooeVJ4Jk1UA4AhP5J5L5yV8_CHBTG07g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACr-zFBFpqgHVRiH37ooeVJ4Jk1UA4AhP5J5L5yV8_CHBTG07g@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e43693 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=cpwuP4bK5o1WZ1zuufgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: FWorgkQHoCpLZaauKIx5hxe0mhC4q1px
X-Proofpoint-ORIG-GUID: FWorgkQHoCpLZaauKIx5hxe0mhC4q1px
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_08,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260106

On Wed, Mar 26, 2025 at 03:08:30PM +0000, Christopher Obbard wrote:
> Hi Dmitry,
> 
> On Tue, 25 Mar 2025 at 22:53, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On 25/03/2025 21:21, Christopher Obbard wrote:
> > > Some eDP devices report DP_EDP_PWMGEN_BIT_COUNT as 0, but still provide
> > > valid non-zero MIN and MAX values. This patch reworks the logic to
> > > fallback to the max value in such cases, ensuring correct backlight PWM
> > > configuration even when the bit count value is not explicitly set.
> >
> > I don't think this matches the eDP standard. It tells to use MIN if
> > BIT_COUNT is less than MIN, if I understand it correctly.
> 
> Thanks for your comment; that's a good point.
> 
> I need to re-read this section of the spec; but at least on this
> hardware I printed the values of the registers and it seems like
> MIN and MAX are the same, so I could switch the patch around to use
> MIN in the next version.

SGTM.

-- 
With best wishes
Dmitry

