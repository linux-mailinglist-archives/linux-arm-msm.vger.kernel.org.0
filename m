Return-Path: <linux-arm-msm+bounces-79778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A075FC22FAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 03:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA271188D8E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 02:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8057274B30;
	Fri, 31 Oct 2025 02:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTKCRy3C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfZeAdov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A75274643
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877331; cv=none; b=SxcfX+P+3w/luZ/q/350DNebLqEn6QAJ4HrIrjA9yJ0Bj96UT1MAQFzbO4ckK9mPqfQ1l+3kty8WHVnl0J50eYv8zW9WLC6G4c4050B7Pi0aKeW8CiHOuWahhfCd0yLw9AICS0sVCXpkuqvN5m+yYwT51/rkEzWxuhNJzDZLRHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877331; c=relaxed/simple;
	bh=GDH8b2/gQBMRAEIq8JShRRNhVZCWvHt8kDM4sifpUmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbAAVxB8a6To1eLoXtpP0j5cRUuFx4khXGmdPpvkixW8QZzKb6B+2tP651p06jL14e75VHfiWqHrGMMCkmvlypHJSfQa8LpjZFv5dAXgOvu8do3kwKsAEZ51FfOG0Z7vwrOW7YjuvywX532+rgoO1vz1JYtG1QqRw60L1Sb9IE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTKCRy3C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfZeAdov; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UIVHfi3117271
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3c1obq8ZZLIS5GwXPjQ6YRMj
	wgPZ1GO2NkBLtaKSH38=; b=MTKCRy3C00PEmbbajCqM9XMRIvF2EC05LSoBw22u
	eBnXU0FrabPR3cpF6hGOD6gYTkAwQbQVRIRA6vDvQseAOEqQuepSKlej9SmCLIWq
	e2NEU7cTHtO9Q1fTh7ttZfb9Fr0+nZFQAGnMg7PaGSB1VdO1iN+t6iQKJlSe+R94
	VSVsxtVahIg6dFuwWyYJGPhBbt1hEkkAVkLluopHS+5Up4/vmjaFPxTaBDGcnz8G
	nqe0iX16qBTXFM6298vQqSNWwAfaIx0u4tgbi6k/FhbIh+/VXiEWoaTvtIJQHbaZ
	yKkQDWtjrB9O+FKhanWMBct4H+tbv2+pjILWPSVoFDgW8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45frjjh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:22:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eba1cea10dso59650711cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 19:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761877327; x=1762482127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3c1obq8ZZLIS5GwXPjQ6YRMjwgPZ1GO2NkBLtaKSH38=;
        b=PfZeAdovsrZ7x1/ual/vn4flHF6k6GItvODUrNXxysL52FblgD2aFVdLx5aJrU57mX
         DO03I++W5EVYiTzhOEOi0AwcUQ44SVhe6MOmt8OmZr5K4KCT7yhXdb08MWKGzyOQHX2c
         JY9nz3H/15Ady8gnQuFrzUIT+340EewlliOuY0YxlDlGpHOCfF1HZVN+6q80PBrnOZnG
         1OyBHEnhyPvhvThZNDG+5r2aIffOeswtmcQB9lBApA9ZPqeL39HX9/BsV64BDByYUe7B
         MtVEGhiTQ50LXZmJ3gJpLuHihdzwG+qlnUq68RJLI5O+NjtwMRod5qXxe8cA07PCZBEr
         A6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761877327; x=1762482127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c1obq8ZZLIS5GwXPjQ6YRMjwgPZ1GO2NkBLtaKSH38=;
        b=Jh5wZ4CzFzrwjvNIdZFQImDiMrPkWb/nCALt2KuOK2BR6uAiXMvZ8duGc7C+NiAh/K
         lSEJJohNx7nErjl+Ezdlxvmv2THAgqhi6nVLv9n0FxHlzTEZqnaiA8ZPTIJIxu3keOIu
         1Z8Itn3HJzGunMv+OZhIC4H6qqHHDal990yjybzdVfvNhWnxWziYA9h4tmV5nZJSJYHy
         yDwjvGheipMmm+j2c4X0hL5ztE6GzHVFUC7wxq6goYDgRcGPYhxYXPLxyyIUEVZuDocE
         wBZmfJYjBFHkxRf2QoY2RQPGAcPrdSOfQjrLlT6CoJgBR9Ytp/kmhUj1S2SpHzo2upl0
         FN3g==
X-Forwarded-Encrypted: i=1; AJvYcCUi9FzgLVMvkSRd227zYtXhrZGz8BUhYjkGH451WZ4z6nc8ePnplB5vdRp82X/qhnJ04pkchzphqm0dhC1O@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr3QB1Khp671ozGS0aUe678qYrILx02U+tocbcpp7MLsHox8Wl
	ZDzRkIRdaAeImmJNpd9RPBZGWsKG+K1fR0Jihc6vZg2wApwZ17YmVrt+HSfaNh232MMugiPMZzB
	pKIHtlxu+4SZILG8Zzs+g7ozed6HcPxY3HHoOKlr1cQb+/7GlrbXX4/dHXGTOe+b/bmHJ
X-Gm-Gg: ASbGncvhH0LU2aL83+gNr+UJQZfPxi94R7ACB/b9nPZzKEbK2ei4L3mvAEAiAQZUTEW
	xbT/lwz51QtASlIJhSUuDImqh9B4cWfQG7Q4jOlbXa/9MI0tMy7mYASJC8GG0H21xsSfEZkoCDt
	lPWNL3Yw+eFdxGc/CUwy3QxYn6oTifJI5GtCe3Ub44a6IEJUZSGnLrkHWf7+5pBdi4S57LkYWan
	ArA2XJiH7kzPBpR9HzwMqa6ne4Wdw66w4ChuR+PtmMo13ANgWS8w28KlpFIs17MYHr2BzG776Vh
	qnmMFE5dQH82FgLRoGWlqNKmRWiJFUnygjzvSk5RaX5isMajAG59rLyiP6bLVKQjTbp7GCUIV1/
	aYCM4UsAEcpJPXMxUzPWNPPblT7El2kJIkzaV7cKHLa5s4qT/w4T72PxIlqmc
X-Received: by 2002:a05:622a:44c:b0:4ed:2715:611d with SMTP id d75a77b69052e-4ed31076fc4mr20775601cf.65.1761877327115;
        Thu, 30 Oct 2025 19:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGarE31FcqziYFgtP5AQeoEmQTIs0pBD7iyBHmNixxePHSIEujlFrVA2g4rLiwQlMH6ljRAYw==
X-Received: by 2002:a05:622a:44c:b0:4ed:2715:611d with SMTP id d75a77b69052e-4ed31076fc4mr20775461cf.65.1761877326654;
        Thu, 30 Oct 2025 19:22:06 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ac03a75453sm23545385a.51.2025.10.30.19.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 19:22:06 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:21:54 +0800
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
Message-ID: <aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
 <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
 <aQF0zzUpLeUu4lrC@yuanjiey.ap.qualcomm.com>
 <5hftxsuqz745mxxk2hjpwfxwrm73p2l3dxn2mb2uqb2c44fd2w@l5xvadj7gvvg>
 <aQLInjBCbeNJVanK@yuanjiey.ap.qualcomm.com>
 <r3sbg5r5pesrfrave7l6nx4ws62eogfn7m4f5c3ur2a6xkhsss@f5vfre2hd2cr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r3sbg5r5pesrfrave7l6nx4ws62eogfn7m4f5c3ur2a6xkhsss@f5vfre2hd2cr>
X-Authority-Analysis: v=2.4 cv=KupAGGWN c=1 sm=1 tr=0 ts=69041d50 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=hV_kQwtX5ugguncQdNAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 5Txb52JW0zF55zB6_HIbYn-zWArvEDWI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAxOSBTYWx0ZWRfX3pHbn208F7Bh
 6wLmdejYPJrsiB6AgPa0+22WHj4TWjfpJO7RD7BFV+dUyhMPZJprvRMTt2mH9Yk3ywEOZItOTIN
 jWe7NB9hZxjmT9oUV6AHRxLRmdAFUWhr1iuYj7j/yAjQ4Vu+Ebo4AKs40TFVURBBdx9hFYLTKB6
 cOtak6oeuMjX/xjfaDNyoyCow+JBH3INMeC5SjKnyAMN/m3Ap/1wh5R9vV0PL4Mvk4qMSsCt9x+
 7OP9vI7FBHnIrzJ7E3to8Y3cQNWu+feu8vq+hDPKNLCqiV53Sp3yQUjUwWMk+2a/D3isOrGCi3+
 VFn8ptfoIhFG+oYDCOpTuet8GFKi/e6mJ7DCaVY0ga6migfxTuNxOvdQ+7g+IW/3F6BjuYmZ3Rg
 C+Q8n9P/Xw2+KUx6TR5CxU+L78a4Pg==
X-Proofpoint-GUID: 5Txb52JW0zF55zB6_HIbYn-zWArvEDWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310019

On Thu, Oct 30, 2025 at 07:57:46PM +0200, Dmitry Baryshkov wrote:
> On Thu, Oct 30, 2025 at 10:08:30AM +0800, yuanjiey wrote:
> > On Wed, Oct 29, 2025 at 02:20:13PM +0200, Dmitry Baryshkov wrote:
> > > On Wed, Oct 29, 2025 at 09:58:39AM +0800, yuanjiey wrote:
> > > > On Mon, Oct 27, 2025 at 02:22:04PM +0200, Dmitry Baryshkov wrote:
> > > > > On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
> > > > > > On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> > > > > > > On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > > > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > > > 
> > > > > > > > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > > > > > > > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > > > > > > > 
> > > > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> > > > > > > >  1 file changed, 5 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > > > > > > > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> > > > > > > >  	if (ret < 0)
> > > > > > > >  		return ret;
> > > > > > > >  
> > > > > > > > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > > > > > > > +				    1650000, 1950000);
> > > > > > > 
> > > > > > > This should be done in the DT. Limit the voltage per the user.
> > > > > > Two reason:
> > > > > > 1.
> > > > > > I see https://patchwork.freedesktop.org/patch/354612/
> > > > > > 
> > > > > > panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
> > > > > > so I do the same work.
> > > > > 
> > > > > Please look for the majority rather than the exceptions. Out of all
> > > > > panel drivers only two set the voltage directly.
> > > > > 
> > > > > > 
> > > > > > 2.     Kaanapali vddio regulator:
> > > > > > 
> > > > > > 		vreg_l12b_1p8: ldo12 {
> > > > > > 			regulator-name = "vreg_l12b_1p8";
> > > > > > 			regulator-min-microvolt = <1200000>;
> > > > > > 			regulator-max-microvolt = <1800000>;
> > > > > > 
> > > > > > 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
> > > > > > 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.
> > > > > 
> > > > > DT has to list the voltage values that work for the devices on that
> > > > > particular platform. So, ldo12 should be listing 1.64 - 1.8 V.
> > > > get it. I check downstream DT,
> > > >   dosnstream DT:
> > > >    regulator-min-microvolt = <1800000>;
> > > >    regulator-max-microvolt = <1800000>;
> > > > 
> > > >   I test 1.8V works, So I will add 1.8V in next patch, do you think it is ok?
> > > 
> > > What does panel's datasheet say?
> > 
> > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
> > VDDI=1.65V~1.95V.
> > 
> > So I should follow datasheet to set DT ldo12: 1.64 - 1.8V ?
> 
> If the panel declares minimum voltage to 1.65 V, why are you declaring
> 1.64 V as the mimimal voltage for the rail?

Corrcet here:

DT ldo12 will be  1.65 - 1.8V

Thanks,
Yuanjie

 
> > 
> > if you think it is ture, I will fix it in next patch.
> -- 
> With best wishes
> Dmitry

