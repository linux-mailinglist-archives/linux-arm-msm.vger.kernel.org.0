Return-Path: <linux-arm-msm+bounces-66699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C62BB11D57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 13:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 239DE1C873DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 11:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248002E6D0D;
	Fri, 25 Jul 2025 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqFT9LD2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965912E5B2B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 11:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753442137; cv=none; b=uH6fU6CkjlhAFY+P8fy8xrTofvQbAWxlwIjeFsjak+jnjckn/Go6Y6iIZqxZAy/mdMjLsvbW9fCDzHi7YHciXyk6qkGLQhPbptrjkVqmIk699YLDGZf0VJFE4KMiIRMl0SV3pfxnGqJYAd+xBdiKfFXGFmL8cZLCFBIXjqnC2Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753442137; c=relaxed/simple;
	bh=OSeqncM2dX7fMfBZmA+0l06FrlB0CNn9hMzKvIZiRvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd2BsE4hoqtfeSyIDCUDt/z6nc+5nGLkidXDyKqZDLeaU8qheHfkz1UebAHnoGqH3kSJ+elneOiFQYEXMxpQtnzyUc6pvqwNYjsUjCmtHrb5MENEgRTo9/nmPeWcLGBoOAPzKOjdqvCr/ij9HwGIKMYXE89adeMRU1W68jpq5Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqFT9LD2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8vEkh026745
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 11:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+d6fz0EHEv9D/K1jXUDJQkWp
	0TaHWL+EOqiDWQcysec=; b=RqFT9LD2k3CtCw+OeO9+pL23DKl3w0JrfG0UY32L
	bJ/qJAngW/YP7HFppZHEr2fHRD+egFn8wazcfL20XcrPgS5CBJJd9o3B5+vf4a63
	Ok0p2w9NVSR4DL9SiZO2T0joiNBB+onBdfwq9grdFIBk/U2v6mtLx31wr99yD6VO
	50vTPvFrD9HMMURtjhpjXjn2fdI2ioi+ZQit6WBCX88gLRDWfH15jUlXRFlU5tPm
	d8AnyQnncv9z9LKuTeiy6YW9SR8I/FV1CARdvVMlfwwrtNxqxFoiX283/0MtPPFo
	Y4/Jc1BbTqylONL3lNN9F2XEvyev1Dp/bKk2gFMy1Dbh7w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2u1uwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 11:15:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fabd295d12so39416736d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 04:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753442133; x=1754046933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+d6fz0EHEv9D/K1jXUDJQkWp0TaHWL+EOqiDWQcysec=;
        b=HutM8Hppxd367npBtjXrhcY338cPye3lUB5ha8/7oANH/2UYtiXDq2wzmKCMreI05O
         y6EVIJ7A8c+qRm7QCVdrmb9Wv7PTRokbqgxn1CEDXvAq6l9MVAW0V2HAnHoVGxyz5CVY
         bn+/EtxAfXMDOudfPd1NkkaWRFwQQgRplLRfmYY4sqqPb+GKFF7D9OKy2EAqOIlaNrzA
         JAhcW/KK8Hd3Cb4BYBYPETdU1Hw6yWwS6wCt58PsGqVhZ8h+/TdVtkwDbmevtUVC5z61
         39dPMnaP26wZlff6LhWkf9JiU6MFNmCS95LzxwqvIcq3v3C4sEfnP7RAKASwEK3Vao/1
         I4Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXYHSJ0ZeTLvBexDrrxqoFpSa8tmM10TbnPCICJYiEGDiD40BV4Lf67AYbH3WZ5oyZB47oSjTgjH/XwfoWG@vger.kernel.org
X-Gm-Message-State: AOJu0YzqcCUUbzd8rQPpLcQuskszN1oXZtO/DuEivOVACSsmi3S/zAel
	b9Jw2NmqmZXdZ4/xi7FdTXbiI/rCF1gQDL3BgfBLj9gCMlkuwZoB+F09Enrlh2OD33wC1j43110
	pLX4HkVFSDG2FzsktQGtdVHeAUWaHp2KM0TCB8v4ZaHYwUhZiXmpw2yFLSMvZ94k9q5Lz
X-Gm-Gg: ASbGncu8IPnyxneVH0Ji2THQiJ570ngj9p4dOWZOayvLWm9N6b0XI3p06yPEtAXr9nn
	g9SXOh93kg4ygl/rv6jVMkSXRjX9T8STn53b7w4ziQr1RM5DcqY41Z0zjXxWVIkdmV9W56tIRDZ
	Iga0G03vzsYJizf7MqXGyI3oP6cv79eRyvEWcCabutk3phzXXEx6CF7C45I0Con033MOqdk0p/N
	MPJlK386D0gmLyteaGo7ShPT2wy3etE9L882qirKZBV2Tu2IvamjaNc9DqJ0iXtnoqG04rYo+ZP
	RGIjssvErzkc5peNaoEUCKGTR/csAHsKb0+628Wc29Z0L1G4goUrJ/0nhR2+E9oe23sireZkAG2
	B/r2fWPDO1mClX7x7qjtLl8SL+ofGldVpnaAZ4tZHXhCAp4SUHGis
X-Received: by 2002:a05:6214:224b:b0:6fa:c5f0:bf57 with SMTP id 6a1803df08f44-707205d3de4mr17249366d6.38.1753442132383;
        Fri, 25 Jul 2025 04:15:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESU2wE4bOnOUGPBSZO0tkF4LSJGzJmhvaydJbduRXkqSSNO4+Pqqddr17Ym6JSe+xBXleipw==
X-Received: by 2002:a05:6214:224b:b0:6fa:c5f0:bf57 with SMTP id 6a1803df08f44-707205d3de4mr17248146d6.38.1753442131229;
        Fri, 25 Jul 2025 04:15:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53ca1973sm882413e87.198.2025.07.25.04.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 04:15:30 -0700 (PDT)
Date: Fri, 25 Jul 2025 14:15:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable display support
Message-ID: <h63j6zveofatmzk6zj2ffvqo325kiqu6vnn2vekb6t4lniyipk@k55zwfhga6uy>
References: <20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com>
 <6wwcxwgcf4wm4ekb3d4ukkyyqsseaawo6l66umzxim4kcilynm@fc6mwj6ymnes>
 <c7041754-7be9-44f5-89a4-03bb21e2d342@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7041754-7be9-44f5-89a4-03bb21e2d342@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA5NSBTYWx0ZWRfXwFWdE/DZenqU
 EHPswuR0jD63qXzm71bnMu/YYDEq7p2i1VmNrRrYdFeDwFY84bc00QpRJG9zP+weM+SF9gxW40Y
 iky5qt334I4GxuDss0fBc/6BeTgGb2PHhZH5SCsy7ZjyBKG1NEbMOI0RabIVxwI0vvC2p4dmm1v
 GX7LjC89QROUQjB10H2XJGQKXbRI9f36Nvxo22+t5PPCJ/QPMpbwPGXSHVliLTldpGG4Eq4A31F
 xguB6nPRmO5sCuKYOUrdeWYu181v6yasXc5A6Smc8m3i6Msx9Eor1zKPTy4ua86n7TRgjU3lu2M
 WOrknpL2zU9Gy+qU4Zn+P7VKDA5tnMkzI60o/lm0fp61kPk0s4T+tZ+RGZFFy9PwvdwrREUbypY
 Vubseo3ctsTbf4GxYr9q659EgZHGH2XrJBm0WCMlNkRouO2ltqzNOtFlErz0n0WThtO5jsl0
X-Proofpoint-ORIG-GUID: 5JFAW5b7MwrR692x21qTfxedxOxxxQLh
X-Authority-Analysis: v=2.4 cv=FcA3xI+6 c=1 sm=1 tr=0 ts=68836756 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=d_ojn6GSUL3iYoyApoIA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5JFAW5b7MwrR692x21qTfxedxOxxxQLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250095

On Thu, Jul 24, 2025 at 03:40:52PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/7/23 19:21, Dmitry Baryshkov wrote:
> > On Wed, Jul 23, 2025 at 02:14:55PM +0800, Yongxing Mou wrote:
> > > Enable DisplayPort support on all three USB-C ports of the
> > > hamoa-iot-evk platform.
> > > 
> > > Unlike most X1E-based boards, this platform uses FSUSB42 USB
> > > switches for the USB0 Type-C port, while USB1 and USB2 rely on
> > > Parade PS8830 retimers for Alt Mode switching.
> > > 
> > > Support for the PS8830 retimers was already included in the
> > > initial DTS, so this change adds support for the FSUSB42 switches.
> > > 
> > > Due to limitations in the USB/DP combo PHY driver, DisplayPort
> > > functionality is limited to 2 lanes instead of the maximum 4,
> > > consistent with other X1E-based platforms.
> > > 
> > > The platform also supports embedded DisplayPort (eDP) by default.
> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > > This change made top of initial DTS:
> > > https://lore.kernel.org/all/20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com/
> > > ---
> > >   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 156 +++++++++++++++++++++++++++++
> > >   1 file changed, 156 insertions(+)
> > > +
> > > +	ports {
> > > +		port@1 {
> > > +			reg = <1>;
> > > +			mdss_dp3_out: endpoint {
> > 
> > Add empty endpoint to x1e80100.dtsi, then patch it here like you do for
> > all other DP endpoints.
> > 
> Hi So i need to add mdss_dp3_out: endpoint {} in x1e80100.dtsi and
> +&mdss_dp3_out {
> +       data-lanes = <0 1 2 3>;
> ...
> in board dts..  is this understanding correct?
> 
> i just wondering that here can we just follow other x1e80100-based dts?
> others 8 x1e80100-based board dts all introduce edp-panel in this way..

I've sent a fix for that. While squashing this patchset, please update
it accordingly.

> > > +				data-lanes = <0 1 2 3>;
> > > +				link-frequencies = /bits/ 64 <1620000000 2700000000
> > > +							      5400000000 8100000000>;
> > > +
> > > +				remote-endpoint = <&edp_panel_in>;
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > +
> > 
> 

-- 
With best wishes
Dmitry

