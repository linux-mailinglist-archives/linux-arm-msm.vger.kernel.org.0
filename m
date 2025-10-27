Return-Path: <linux-arm-msm+bounces-78891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7F6C0D7B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 337B44F20E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E88285C99;
	Mon, 27 Oct 2025 12:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBs6Fgk9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2762E2F12CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761567734; cv=none; b=RrugV7j1TIzAZUgKkfHprw/YxQiyhUaCQejafMuqsUkQG5XY4v+laI8uUMSToUzsn3ztLJgNwlDxp0edH+UtdCN8XxIbpg/qab7L6QEJnZD4e9jZwCXETsLbyffazdoBWsLkjP8ID+lSPypHfAkjvmh2vQo5jnzhI134zR56v6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761567734; c=relaxed/simple;
	bh=5HTqrOYqCuummTRQY5R3kBtRSlzJ1dTedKBPppB19TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rve5Lzayof7zv18QUTpb3eMCYlSXC8uhSDNEmRuOq0SfmOE1CYKHzYGlph2df15W6aZ4jfYzA3GWql6zD5cHXru9k/DqM++DH8ONOKrj5kOANturRn2YUeqBZwhKfBMpzv9VoBlvdGBtIvVwRDebxmGXRwVmmQvJChakiJ+SYe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBs6Fgk9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R89xAq914853
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Psg+67BfDLKR1waGwn5a3FoQ
	zpaxCzLH0+T9U8DBvbg=; b=mBs6Fgk95ffbn4ieruXYrS9Ov7pW4DuApfupuktD
	bX+M9/sG7KIZXUhn+qqhj100+ee+Iv5KD2GbjThnS4Yhp53XXfxDuex4rPALtaIj
	Fcpz1NKhX3QA1O75SAhUAC1YG399L0jTTLEXYrBLQ4XQGFwktwrkPkKVQrsF6vkA
	gzXRTmfqrUQvFbCLXpbqm5K//BKz0vLluu/2Srtx/T1Bin3VOpkZGJRg+5u1Mgv2
	hXcpprUqVZT4lrMiXbNwjpCWqxOHJwO6pS5wDPUIYgF7a2A/lQq/U4jFsGqEUitM
	oAte68UO9chMnRCUZy5W/CTreeeuHk3HxAiuT5CutnrrGQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnb4k8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:22:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eba247f3efso53611701cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 05:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761567731; x=1762172531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Psg+67BfDLKR1waGwn5a3FoQzpaxCzLH0+T9U8DBvbg=;
        b=kWo/WxVMfHI4kKwR9M7eLQTXLrX6qrsQGpJobclHXCfnKd/x5p660JqNGGqrKsGvDC
         WPG8fFC0bzepBQ4DhrdVwxQGpIglkKfIB+nse09uUeLgzs20j6gxNVo4pdsKdmWdDWVh
         v6y2dH+d38JHN0spO43FJkZiSq2X8cMysBLP/o3J+Mp8zrYQQglsIV83SQ0v9qVzgokd
         zfWCpAqUyoqk9mZ1MdwYnI5HIZmOZPqIyQqGrjR6FMXose6VyVQQm3KAzoEGwmh5FcH8
         lzhxO/q0Rio4s9XAh2r9AaXq+5m17Y/4I69KLgCFwiS53JLDan+QeHkESmNxCfNvU2Sh
         Ob3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBuvvQwXgJvRSt3pcqSbxWxjIquEMBl6bKgr41eWq0nOj/7KbTd2BK6lNk0MLciGHEMDs36P5BO0nxOA8x@vger.kernel.org
X-Gm-Message-State: AOJu0YwCAAGzhAZ7mp2JsBobd70uMupXBwlrmH6jzPYBPPtvp7TmaCMN
	qNZkGXMs4wfZ3wLOly2Y6/1Pps/mTVME5+GqkgxoqrjPahDbgN4V/8aHW4vYMDwRzjtR9k7TPEd
	YvckqMHCZPWqnVDkbvg1zea3e0kvJ0qpVAohoZNEmtl5XsJ/batmnMGgMWEVPBr0oEhtW
X-Gm-Gg: ASbGncvhtM7eDlF11euTgQTAbX55RwmKzMwrU83qxAdkQ+9LvoNDDRSVgyTeFIWjfLF
	+31g3ky4b31IZawonZmU2I9vnx5A5AzH2Bytcv76hNQO6Ckpc6C4LJcqqXuo8qIEtLFik5FhElP
	kOq2qd2/IGpTXQR1GvbpSdRUTNIdcIZh1iPGNtmsBiFKWTr6I1B9qDR8Y9WizCFROY8pUcYu80J
	d+yGteB9/K0mPo0GdYrjG7+nAaUv/QNyu5WwDi/FLmgbE8fyz+udh68rQzmuTcL/3Vlmc4eVb/H
	6DpZWGJEqyoazeESjpqhuSZy8nvr1isjIAfh27/t41TvqQUNi2Nw6/25UauP6MqtpeDN5NSyFyb
	oMhsWILrH+nu+PuH+XSwFwZnJn8l4pnpUyO+hXhieVDodCAR+aGfAuRV6dtu6npAZ3uKd5FO+ZZ
	sWNhI3p/YWrB91
X-Received: by 2002:a05:622a:2291:b0:4ec:f017:9e2c with SMTP id d75a77b69052e-4ecf017a075mr61636061cf.35.1761567728652;
        Mon, 27 Oct 2025 05:22:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGYgD/La2Tib5FQl2fihboVZ7Zt1I5VSs9oXv2jbhiaDS8YaEpcF2SppZieSQXcjQmVktSMA==
X-Received: by 2002:a05:622a:2291:b0:4ec:f017:9e2c with SMTP id d75a77b69052e-4ecf017a075mr61634961cf.35.1761567727214;
        Mon, 27 Oct 2025 05:22:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0c342csm19672521fa.26.2025.10.27.05.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:22:06 -0700 (PDT)
Date: Mon, 27 Oct 2025 14:22:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
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
Message-ID: <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
X-Proofpoint-GUID: cdgDkcQITg0yensBF3cbjoi_k0Anv3Gl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNSBTYWx0ZWRfX2lQ8weJf9FVk
 gh1c85rsRXNwDyFg0IU38aW1c4GsAsDg38d0MLNBT2TGWSH5iIyBQFRsZ3BOTz0qp2XxiSKNWoU
 Om/iJN4YZF72tg50t1xSGmS4ktCauxeE52J5Z4ATonAUBpSCoW/e617xYe6ypnAf7j2y0NRrvks
 izxiFfUwDm4KM1RmfoOjQepEyCbceOEY6SX9gmd65D0T3HHUg1kEzCwzoF1huBZarmSdmq/kxYp
 AeMo3jkH6tttfYTOaSy+aMuwslCEtiJwj5t0NT4GB3TFr6wiFYqutG+Ra9u03CRSDS6Z0HdRR0v
 vN/gBvjjjm+6Xlqmnmacc7KCL0HFF/NSBB+2vkviKZD3lFlak8pwhrn5GAcjHZKHHoVPWHnWDJo
 ysV45I0FDKT7tPxmOVmSUi+YSy6GYw==
X-Authority-Analysis: v=2.4 cv=AJoZt3K7 c=1 sm=1 tr=0 ts=68ff63f4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=UzKOEE2XrYQWi1Oh8k0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: cdgDkcQITg0yensBF3cbjoi_k0Anv3Gl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270115

On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> > >  	if (ret < 0)
> > >  		return ret;
> > >  
> > > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > > +				    1650000, 1950000);
> > 
> > This should be done in the DT. Limit the voltage per the user.
> Two reason:
> 1.
> I see https://patchwork.freedesktop.org/patch/354612/
> 
> panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
> so I do the same work.

Please look for the majority rather than the exceptions. Out of all
panel drivers only two set the voltage directly.

> 
> 2.     Kaanapali vddio regulator:
> 
> 		vreg_l12b_1p8: ldo12 {
> 			regulator-name = "vreg_l12b_1p8";
> 			regulator-min-microvolt = <1200000>;
> 			regulator-max-microvolt = <1800000>;
> 
> 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
> 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.

DT has to list the voltage values that work for the devices on that
particular platform. So, ldo12 should be listing 1.64 - 1.8 V.

> 
> 
> Thanks,
> Yuanjie
> 
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > >  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > >  	if (IS_ERR(ctx->reset_gpio))
> > >  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

