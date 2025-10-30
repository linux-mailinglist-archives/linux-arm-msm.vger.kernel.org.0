Return-Path: <linux-arm-msm+bounces-79548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E7CC1E185
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 03:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 17B314E3660
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 02:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72FB2D8398;
	Thu, 30 Oct 2025 02:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/aiOE48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMh1lVT9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB15286D7D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761790126; cv=none; b=BmRuWj2sUDQFMkViq5SX0Vrpjkvi63l+6iv8HJlsyq3BsQPQeoWT+zXIdlaFfAAIL0295mGWSb/71xKR84RH7qe1zt1ymgCx/MkqaG+CJt98fcbSz9oX6GLD9CDlHdchFkc/y5BqLw349eF2GemuNm9u1qYYlQPCUi7Zk/Ni8zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761790126; c=relaxed/simple;
	bh=cHfHWUPdId3+SUm4bJWQGwD0CYTnsns3EJRZnEVwD6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5wO0PHvQsiBztGav1Yg49LhQ1t5tPhV6aKkstBCDHoQD/Rjj/0efLYaBTwWr9hBhrCP2hoB/euOPFpktl8XhUQJ/qZViC+fN9IwlL8rCEM8wQBy9/hAJBjcCzC5cSWWqDdKuoHlJgxU9L6AWOojyAYX+14zDm2t9WARHMkQUL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/aiOE48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMh1lVT9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U07U07810809
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O/baTxXJPCHgYea9og1wAW8N
	5bDqCLQ1vuQ5vgT1fIE=; b=e/aiOE48Z02ig1rIP7e4M6lp3d/MqYESQvmoQSI9
	QaJY8pHe1TiXXHq5VR0Hg3XfPI3ChmFEPOOlFQuGVGLa3ub5hYq66WQkDw3abiZt
	PTU/BjYftESI6i8BshQQ6y8RPODxJYMWvf0ClKjSFlcxbg8+GIcOTUKjGioOOZqX
	3M8h556CSw8R/pKBMtzN50ibyg/dQ1S0a16sst31GrI/e5IN8C4GT6SktVOShrMc
	jOLbTqwjfwLh4yk7O5tBIEh+zynp4yXpBE0jFbuIsRNaL932f7g1KE2y1FYf0i6i
	eoOIRdVS/WnSyxnTUdbrFJrAUVPuIIX4uM6TAedVLoZaTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mvg9x4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:08:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8908a248048so110329485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 19:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761790123; x=1762394923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O/baTxXJPCHgYea9og1wAW8N5bDqCLQ1vuQ5vgT1fIE=;
        b=DMh1lVT9q/xHBTrtxc0WjZ2OZMzuIaKx5BJ4wgY4B6FDQfn8bkfuOGmqodjGG9bd+t
         LVyKt7/RUR23QUJHpoMXPK4c/5UkaCqrrKs/hv9bXM/va2HtW0cq+ZoO6wcKX0V/tlCY
         R68bB9dm2R2W03Rz3GV0QlRsZsGt6fxTliFE9SKk5oHXTl6L4zkY8Ko3kyrc8a1zupsA
         RRVPkcT3u+SCmP04qSiWBPmG5hCEhlZ59tDDAw3PElUI+qigzXoUQhyvh/Ig87GkWQrS
         dgwETSiEYP/UACyKXeYBYfBXuSUas2gSO8vK39fVwOPD/x1wo+/DptPoI6PnRwZGCu0o
         WW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761790123; x=1762394923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/baTxXJPCHgYea9og1wAW8N5bDqCLQ1vuQ5vgT1fIE=;
        b=WaVI4eP6nrrxU1yxDE55Y347U6woI4o9tvDryb68dYX/vwqQu3DZfTK9GNEzzudV7F
         xjLnMHh8qVDQwHSunAU4CtDC06dFMDbDdVCJq+11GBLBupIOpNmxiWHrsHjUBp8Zl/DC
         WDUx7FSn8PcjV6IQ0K2g2689ts2x/kedTlAjUkQxZYPzw3NI9Nr2sh9mBfUHqHkx7PLU
         AgoUR9vZ1xfOZCXnks2Oebhq9XdnOJ3lVAwJfRU+4Peb0zlkC93sdVcHLrK6qPXTz3dh
         1s/iQAsf6MWr+HMbll2xg/MT91hk/eO8ccW9MHZZOF9LeVRpqlrpWe9mzzgdea9Zg0B3
         bJHg==
X-Forwarded-Encrypted: i=1; AJvYcCVOVhrIe8Lu8V1T7uSbD/0qzvqOJXD3UA2zsnAih+dcu6C8goEsXYUNQ02QXHN+4GX09Z0fu6McN0xHW6XA@vger.kernel.org
X-Gm-Message-State: AOJu0YzdKe78tAKwoNbfRl4uWj3ZWBTNxmcnYkfddxDU06433wBFHeuI
	aOCfkzvW01iMNzU2vEXNWVr42jfHSyXwFYAKyiBbh2DXZRTFf5udogFqtZoOTO0GcBFYvA3/cnW
	fiGRpmwS/0CON62AxbBLpthhKY5iPu5nfnYjidpd5yOBJmkDFCsG90cM1Y2Du8+5lKfNi
X-Gm-Gg: ASbGncsHrkdmOMdh/XcwYM6MHol6xAjX4aEf96L4dx/df30lQsm0Jl1HGmlzfleItFK
	XsZbQWznKbmCn8gcZa7MN5r07SUdESbBxo3Ct4tq7F1oG3Dz0pJ8p5u7uF51BEOpqy9ZTP894Ci
	bf7C9PYYDDy2u0psvLx06gcAd6cJsLMksSRMICGur1jwwNKqQ6XwuscwiCtvSqwC68q1512reMs
	c73bRLiIwx7zx06pwxWJNgoWYcvzyImp7C/ud0uhCl8MF+oYaTXz4qikDFoZpF8uWsyOvqbl2Q5
	cK+3tEYHYt4RPCMh+qtYnf0WzjHRG76oHPpuP2O5eRoFccPWWZ9/9Q9yRABWNnEVi08DHUYU522
	dffZua8G3X6X4z0GNmabieHK9Q3Cydl51UM7yAVve6kUJlI0qiHOglhifxYwK
X-Received: by 2002:a05:620a:45a3:b0:7e7:12c7:57d with SMTP id af79cd13be357-8aa2de73b12mr257836185a.44.1761790123303;
        Wed, 29 Oct 2025 19:08:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfgmXNfYz7FjFrXiMMcOt/IAAGlLFbwsCSB3+3x8FbOF3Ov9Sbc6o7BWOw3LDDSUkHLl+H0A==
X-Received: by 2002:a05:620a:45a3:b0:7e7:12c7:57d with SMTP id af79cd13be357-8aa2de73b12mr257833485a.44.1761790122795;
        Wed, 29 Oct 2025 19:08:42 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f25798afesm1161546485a.37.2025.10.29.19.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 19:08:41 -0700 (PDT)
Date: Thu, 30 Oct 2025 10:08:30 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
Message-ID: <aQLInjBCbeNJVanK@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
 <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
 <aQF0zzUpLeUu4lrC@yuanjiey.ap.qualcomm.com>
 <5hftxsuqz745mxxk2hjpwfxwrm73p2l3dxn2mb2uqb2c44fd2w@l5xvadj7gvvg>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5hftxsuqz745mxxk2hjpwfxwrm73p2l3dxn2mb2uqb2c44fd2w@l5xvadj7gvvg>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAxNSBTYWx0ZWRfXzgcqxuB2ImMB
 2ollUkfy/Ph/Q41RsGIZZxZ32f7cDI69G94ZsVf5QO/vEnbLL1iy3/lBUXuo3N5ENLt9Ts2bpZq
 PBHZJUQBmsdcgdQnOnk0+Xo/1qNtvuyL538B+vnfOzyW4C9UO/yobhLBTkDwPvDq5wsFuSdGZvI
 Zr3rMMR2/BSVis71uwxUi00LqQ2Rd6zAhVeBoQ5PAW5B1/nsaic2Ptv1i/lUHXXa2oOCiV1IvTd
 1RTw9Eao9qw3r+IyoAA1EQL4jRQdsHiwzdHn5+MTrM0svWKIvOiYSBhbrdJl59M45cV7TlAGEIa
 u8M5RuAS0MaEl6/6o1R+VRPW0iDN5B6tnvFa1KUowlXbbvyQP29CAUgmQG9SZHBhdeuZNQYK7EU
 WplS1mRRyFSMjT8DaDmpecpiT1AQvQ==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=6902c8ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=Glo02QtyTbYzxwwq8ScA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: cU0KNMqcq7czxTn6_Q2aL2Gl7Uw4Nhe5
X-Proofpoint-ORIG-GUID: cU0KNMqcq7czxTn6_Q2aL2Gl7Uw4Nhe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300015

On Wed, Oct 29, 2025 at 02:20:13PM +0200, Dmitry Baryshkov wrote:
> On Wed, Oct 29, 2025 at 09:58:39AM +0800, yuanjiey wrote:
> > On Mon, Oct 27, 2025 at 02:22:04PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
> > > > On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> > > > > On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > 
> > > > > > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > > > > > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > > > > > 
> > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> > > > > >  1 file changed, 5 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > > > > > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> > > > > >  	if (ret < 0)
> > > > > >  		return ret;
> > > > > >  
> > > > > > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > > > > > +				    1650000, 1950000);
> > > > > 
> > > > > This should be done in the DT. Limit the voltage per the user.
> > > > Two reason:
> > > > 1.
> > > > I see https://patchwork.freedesktop.org/patch/354612/
> > > > 
> > > > panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
> > > > so I do the same work.
> > > 
> > > Please look for the majority rather than the exceptions. Out of all
> > > panel drivers only two set the voltage directly.
> > > 
> > > > 
> > > > 2.     Kaanapali vddio regulator:
> > > > 
> > > > 		vreg_l12b_1p8: ldo12 {
> > > > 			regulator-name = "vreg_l12b_1p8";
> > > > 			regulator-min-microvolt = <1200000>;
> > > > 			regulator-max-microvolt = <1800000>;
> > > > 
> > > > 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
> > > > 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.
> > > 
> > > DT has to list the voltage values that work for the devices on that
> > > particular platform. So, ldo12 should be listing 1.64 - 1.8 V.
> > get it. I check downstream DT,
> >   dosnstream DT:
> >    regulator-min-microvolt = <1800000>;
> >    regulator-max-microvolt = <1800000>;
> > 
> >   I test 1.8V works, So I will add 1.8V in next patch, do you think it is ok?
> 
> What does panel's datasheet say?

The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
VDDI=1.65V~1.95V.

So I should follow datasheet to set DT ldo12: 1.64 - 1.8V ?

if you think it is ture, I will fix it in next patch.

Thanks,
Yuanjie
 
> -- 
> With best wishes
> Dmitry

