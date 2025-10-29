Return-Path: <linux-arm-msm+bounces-79314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A29C17F5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 02:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CC26E4E17D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 01:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FE02DF152;
	Wed, 29 Oct 2025 01:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gk1piDNa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bp0EdDcb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB512DA751
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761703135; cv=none; b=h4jK5/NWrQhpERkZECFBKzFzYQ6Vh23cnkCVXwnOP0av/Cjl0eYrNCPMoYU6W0duQ/AZ8u0z5aCiaU1i2t6UrFHJ2NR3HhpE0idcBUJGRwB3CDC0gpaJNtn4AQtiBZIWP/LewOoWQHyBrE7eQ1ec2xv/NAOhVgdKMuXZDXe1ZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761703135; c=relaxed/simple;
	bh=gEPztik0DarWvmLzMwy+9sVo0AjJ4WmJObG/Q41ZORY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXb3VZ6dn/UvoMKg+HTC89CtcNP+TmAZAzwihxGSiF8sUPwBWDHh9Qkg1fcPbzDDWI2WUJUXB3EcxnOLh0udGHFl80YmZ8h+5SYmWhd9UZ7YT2c8Kx8yznNlYc1ZMvHdgYzVpMREZNWVD+MFCT6u5dCBmTcEJlWA4yVUFBxx7Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gk1piDNa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bp0EdDcb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlPHK2502839
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9IavgnA3wJTsxViY9YsmCRsi
	9l8lOQx14IrwVBYaXOw=; b=gk1piDNaqjcYc7khLjvcbaS3hQHEM6gNLW0sgkjQ
	pasEx8zmvJnuk6HqMuOaPVxkCCwvLT3nAHjchhn6d7OeZFmC+4c/nzPUZH/V//PY
	3s0R5jL/IFziOEw/YsxMufZ53+fGOzFfLLrhDlB73vXfW+sKa7+JGCoN6+mvB3tj
	SorUxQqWLkAng9r1RpqT1hhUHgghoDIsKO+4dLnHpaze3FkRzYjswAPRH700LHFv
	uNgotEe2RW/iBh/zWt2yKNJYhNoYJwtE8PFu4wl12UzlDfwdGX1fKuvGmheu0aiy
	4loV4QLCExmB0qnma6zbGv2NqFU+ZD3QCId4xa0dC5lQpg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1gt3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:58:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-880047f8636so26856336d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 18:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761703131; x=1762307931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9IavgnA3wJTsxViY9YsmCRsi9l8lOQx14IrwVBYaXOw=;
        b=bp0EdDcbe863seAhEtHS6Zqcpuf6Y+moOGsIDnXoVyF51XObFg/zEfVflszwFix86F
         384JsG0JjsK9BN+DPHD0bzYXtCZ6cKme1eRajtwZ0fOBLCyEwcSqGw1Vahd7jTvjBG3r
         q9eJxjqn93PbC4KksWFq3QaOcLWFJEwM+zumlY9jNlNs+G3k5lPpVhukXHyWzmHqMfJV
         tpJsM9YKKE/qcGl9+gxlffHHdYkitdeQmEAlASFwYlB+nFF71geBvde8Q03oB0JrzLoY
         JMNYsBJ5dGOGGHYKUlPcrfJ6Xy+vKUX3NK/IdjsVGGsAAHFHqwt48vOyB3E9pToCNoPB
         R3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761703131; x=1762307931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IavgnA3wJTsxViY9YsmCRsi9l8lOQx14IrwVBYaXOw=;
        b=SpkURYsXKcVNC6Dt8YOLx6ey4eThVQWkgBYqoodcEP4NwRn68PfBw+vnVS/jU2xz4u
         pzVxUGNM5YnelHPFL7tH8kTozRft5QzD+wPXNZgkGHhBSCYANLa+d+ZsuLhmT/pgio9K
         UCwpw/9RjeJVmZffWtG0wadIMNVc5DrqsFZU8WndsGkGdYBnHgVL1zRCnfziNTA7g/zb
         uy2+oA8EjMaMpx18P+ZkRQBrVOWjWNUox0k0wlJUOyIe3YVBkoP22iaBSGW4k1fhb85o
         g9Zsy1xsjqVUlN6CwD36zMUi+x70A9/iUcm8klJVce0sZmL/n/hI1bxaM4JShr8AfzW/
         +i1w==
X-Forwarded-Encrypted: i=1; AJvYcCXxjIUN1SVhp7EWUOqmIA5n2SE7ZuigjA0CeJLyDKPzf2ZxKOoUl3pyodCKv8EvIj3Ni4g38k9/kjZWnkGk@vger.kernel.org
X-Gm-Message-State: AOJu0YzfyJQfuetXv73CpG0xEbpxMbR6F5Xf6wJP0g0sw2Bh/oSrA+lC
	c2rDqSllm87+CyBWjHpXftjcye/Ed7bBq5Nr+y9fwfiwpUO2n4vxdXnPo5hC57ka4pFOXezr7SR
	81Y5UBrn68EIptHSpdQukDsa8yriE6p9Kfso/kj4Ouc1eTHYvPI6mrh9rIzjHey4kjltG
X-Gm-Gg: ASbGncvvGPzmKvNn3hA4pQ4vSOEDSQNEK2ymj100tijzv2p7MnY+Cb86vdNGRhyuuKR
	S0YiT1qxVzRBvs/vPxC+Q4dyayJ7cEa/agGhdXeHcEuB3UEzaxeW6XXzvqcNehVRkJaxAbHzW7T
	a5WVGuqNzJLQScFZAFHL5mibHFXGjdbwpGa2UB4u4o0A9/E49BANOBeWYGe2W7jBrcZZOJRUCmo
	A5R768nrSmzBef8BzxsD6pXWb3uorJ4lQizjjqCMRdL5AuEymqXDPAf8jeMFji56HcnR7Hnr0Zt
	oLZbFT6ZYZEdsE/SxKPEgEnlWIh/ytyWF+zB7939GgTAaLeBTLHVmT9Je1S8/fADYKncQ3nnbmZ
	neBTw0PjeDYIjdQ5V4GitspwcrQBj1O+SSly9iyVZJU6cRFJSIWcvyyAzFvRti7F/
X-Received: by 2002:a05:6214:242f:b0:87d:f2e9:488 with SMTP id 6a1803df08f44-88009acdd94mr15033746d6.11.1761703131498;
        Tue, 28 Oct 2025 18:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDHmfG0LUjzp2Ek/MezF+lDC26fFhbmOLWFp413US458OqwG2FWmdGE+xxaaQJ07XpmM3Yzg==
X-Received: by 2002:a05:6214:242f:b0:87d:f2e9:488 with SMTP id 6a1803df08f44-88009acdd94mr15033436d6.11.1761703131057;
        Tue, 28 Oct 2025 18:58:51 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc4944a84sm91522446d6.36.2025.10.28.18.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 18:58:50 -0700 (PDT)
Date: Wed, 29 Oct 2025 09:58:39 +0800
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
Message-ID: <aQF0zzUpLeUu4lrC@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
 <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=690174dc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=RHm5ZmmhJtTlhXRmaf0A:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: XVGxg7GJRStK8kODvV2FdvIxC8sYUPs1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxMyBTYWx0ZWRfXyAMI4MekrWKC
 r+CPqZFDsb4A3tSEB7AOkJ7v93orK83IwtgxKxk+ahmNSqMWo2tfSTjMiSdd/7NsXKsuO1p9ZuX
 1aNGALsw95ACeIo98NEqcf1uwoB07LnNN9jiF2ru/oNSOiCoVKSJJZTUFKCbBOs5OAG0i43aSte
 pB6KuesCcUO5DEUsN6UWwzFAbrXtOFXnF+hshspgWRGmDi9MkIttk/s/5SXPNRs/O22RTjg7qyI
 Q4alJpHIjebcZstDXj9ro/LrF14fZg0/vWa3018WYxeQyIlQymfkp4E1ZRHUL9535Y7Nw//Rlot
 xFJyiYO+qwX34JZumhraXuS2kMpD2IA/nk8GIkC9wCD8gc+AbmST/mQbRWu4lKPIiWQ5mqgaa+0
 Gend8sXVYn4QpEr0XHLg5qSujDPC7w==
X-Proofpoint-GUID: XVGxg7GJRStK8kODvV2FdvIxC8sYUPs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290013

On Mon, Oct 27, 2025 at 02:22:04PM +0200, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
> > On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > 
> > > > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > > > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > > > 
> > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > > > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> > > >  	if (ret < 0)
> > > >  		return ret;
> > > >  
> > > > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > > > +				    1650000, 1950000);
> > > 
> > > This should be done in the DT. Limit the voltage per the user.
> > Two reason:
> > 1.
> > I see https://patchwork.freedesktop.org/patch/354612/
> > 
> > panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
> > so I do the same work.
> 
> Please look for the majority rather than the exceptions. Out of all
> panel drivers only two set the voltage directly.
> 
> > 
> > 2.     Kaanapali vddio regulator:
> > 
> > 		vreg_l12b_1p8: ldo12 {
> > 			regulator-name = "vreg_l12b_1p8";
> > 			regulator-min-microvolt = <1200000>;
> > 			regulator-max-microvolt = <1800000>;
> > 
> > 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
> > 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.
> 
> DT has to list the voltage values that work for the devices on that
> particular platform. So, ldo12 should be listing 1.64 - 1.8 V.
get it. I check downstream DT,
  dosnstream DT:
   regulator-min-microvolt = <1800000>;
   regulator-max-microvolt = <1800000>;

  I test 1.8V works, So I will add 1.8V in next patch, do you think it is ok?

Thanks,
Yuanjie
 
> > 
> > 
> > Thanks,
> > Yuanjie
> > 
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > >  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > > >  	if (IS_ERR(ctx->reset_gpio))
> > > >  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

