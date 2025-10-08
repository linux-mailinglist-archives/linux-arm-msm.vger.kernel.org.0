Return-Path: <linux-arm-msm+bounces-76403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD7BBC4F5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D2F714EAA5C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE7425228C;
	Wed,  8 Oct 2025 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8En/Nhy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C45F2494F8
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759927775; cv=none; b=tHELX/waeOsYXayKWVSQ+UjBPzuIjU6qHDXKGgEbT/hhKMZEraoNPvKG9gaQuMNorolKw+C3Kgay616ZKsDXrUwBe2oZf/qzlSmlwLHbvMMl5hT7romVALi5uaTrnsTm8C7dHwK9txblt8uFPo5OadxZESng1CN20a0/EEUndaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759927775; c=relaxed/simple;
	bh=uvY8+U4GBK6Uc4Shp69kQpaAXpdtDNGDh91kAjLxILI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQrM+F+zRXixatP2C4KOTzDluCzM5i76WrmqcEFLfIRYKR/yp7ITQPyoyoF6cYmHD4WvZOQKAXVlStelSDIuywH0HVyjdia+gmBCLkfaYTxf4fKINYsR7fL7QjaXa6d539uyo6/TjjL4tvYgeOcWIkaLSjjk4f6YqIpkDAlWtik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8En/Nhy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Ofb028818
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 12:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o2l8a/RrMPRcP4HFtypecMkn
	iIuriznY41w/vPB6cWA=; b=A8En/NhyIRh4HBUKryyFxcP6tqikwtzeowJFs/Y/
	bSMfBxwyD7jcPRkkyhOpF7d6hk+X1brXogBJ38N35TZkVAPV88ISBzcEt9z7/ZJ5
	24O7ZR35KJEQii2T1RY91FDEExU1SqmS41wD7tKKuqRSEss2+PNneeq6e6zrjm3I
	lSwJ3QDc1Fpfojoap+WJtabhSPYUoC47wCl7qwaehiBk3X1laIHv6kw1IXjJndlF
	XplTvtDIBLRVK/fis3YjZk/AvZP1Fyn1hSDB6HiUmyr2hsgHPqFELpoecUDIGIwD
	fKw6dZmWAkOdv5SaqgwYtMhhYoynotcg79GgfeENCSeMFQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9e2qhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:49:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4df60ea7a1bso161111061cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 05:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759927772; x=1760532572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2l8a/RrMPRcP4HFtypecMkniIuriznY41w/vPB6cWA=;
        b=Wn1qrcGZJvvkISnqjs9n1Y0joxUOQH2oZ+rtBwWDUVbGyxtNP4kVVIc9caLlN/eReA
         DGdA2rpoqqjPzW0B2olT5EgGiEKAeYCAJvOSVBgJnxuIeXYzWrjUHbpkNnAqsQAiqlA2
         HWY2UJmOlNeqQ1Bta6ICihg9AQF9+B7AVmvKIBIgGOmp+HAdu79p6bEIK97y49g/qIB1
         Yxr6hpV0QW7tDi4fQq5epzhFUNrvfLfwPyvqRMcfDXyEm+V7m6bvkv0UxmmTE6h9vGbP
         YcqbLSSNjEqXEeCNMv+M3QlxHtzkzsQx0cPmzY+I9bFC5sFAiXrf/zL/Ei1IjcDlxkfF
         zRTg==
X-Forwarded-Encrypted: i=1; AJvYcCVuHNd/oLrqNhDKexVCTDLmrwg16pCUYL6ztLbwYVHn8pO44xP79+SflPVTpFCbcZqSKh6oB+9TdMy+ZKiv@vger.kernel.org
X-Gm-Message-State: AOJu0YyzeRn13jD1wiV2mlDbzEJrtOkLWd4IIelPe6LDxQVmb2Kqcb9r
	VTtDaHqatKXj1fraopeiuKZaI9PxhOo84jSTNLOt4ObxZoauc9wNx4do7bLbGkUn3YIzixQYa1A
	6XlXrQ1G8BI3CpB7GVScQmub+Vhyng6BU2zAEJ4j2byL6CWMPBlzLX7VbDeshfFFNZ0kM
X-Gm-Gg: ASbGncvF7AGCrrl6M1f5DZNon8fjxX92xTH/ISysJsk8TCac3L5z5YE35GwhtTi8h/7
	NnhsIixclWhqEuBGQHIsV4625SNDZeLa/VKZ2W+orxkQWOfYdGleBQHrbxJma1MCLf3lkMg+idq
	Aa81XUkozV4ypNq2t3OrG5mFZgj8ME4V62w3s2qlf0bfIAGsK5ciVRGZpcoVznYhP8dL0Sl0S3x
	LkcV5CgpgU+OjFQjQ8HL0gEk5olLqVsV8fPj0Ao+aAOA9akX9dToqzU2LnWHhpxwZv6zMKN31Uh
	ylFnXNcvLnAYK8tKOzyAALR0lf+EL1MEm5CPJ75gp4TzDFbvTKVFe7SbV/axZnurhp2DT5lTFp1
	JS2N7DL/Oe99eajJ7EL41oi8BOp3l2wAxmyNfHwK6CSQhZUpw0a4EvUg9Ww==
X-Received: by 2002:a05:622a:1492:b0:4dd:e207:fd0 with SMTP id d75a77b69052e-4e6ead694f8mr45839061cf.74.1759927772250;
        Wed, 08 Oct 2025 05:49:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6R45gywYeXfKfF/AAK9J8gCfjus0oEKiXMqBK9n/2HJsk3Zc+ToSrG2ZqrEHLeKIGtHha6Q==
X-Received: by 2002:a05:622a:1492:b0:4dd:e207:fd0 with SMTP id d75a77b69052e-4e6ead694f8mr45838661cf.74.1759927771781;
        Wed, 08 Oct 2025 05:49:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39fcb2dsm20195561fa.22.2025.10.08.05.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 05:49:30 -0700 (PDT)
Date: Wed, 8 Oct 2025 15:49:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
Message-ID: <6uo2w4lscjlx5mtio2xw3xgyyu6kem6kavtdxtu7cbyix6kews@h2ou2awbppzy>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e65ddd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=dL1b4mpT1AD2RcxrWJwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FVAZvvIVt4IzPe2JAfL7kY_V2QO3Eagz
X-Proofpoint-ORIG-GUID: FVAZvvIVt4IzPe2JAfL7kY_V2QO3Eagz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfXwnT6B5a14xiI
 svFFxn2VErd2kC2ysrUGUtGNt7l7JWtQi3YiSnDgMZc5l+ICeGMswOtjNlCcTPiAcNvJ2pNX9G4
 q4mkcIrOeCwMAs3IkGoZtgsNw7jO2qWVRr6pMxMR8zI3ahrpr0BEGbpixBWXc95okgoqcOD8wbq
 H+Exd2FFfA7G+bFWgtmH1lmktAKh56XuFXfciVKmAAjohJBDkVeoepJGcf1FTz2RuycOONbgTx4
 7mEIFEKuB0eNeCnMjUKHTCZsa5zWgyWmFMFDXmBIFk2f8c20czVHNM2Z2RUQmKldIIwrVtobVhE
 lGMc8NEqhsIdWvWQM127J/ZFGtcs0ItBoqCv+GM0SKOX/B1PCnLFZALmFsKSoiv1uVV8MKT9bX4
 BEZxoT7g1nRhbXn7/Oh5Nv0okz3l0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On Wed, Oct 08, 2025 at 02:40:35PM +0200, Konrad Dybcio wrote:
> On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> > Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> > with their corresponding PHYs.
> > 
> > Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> > ---
> 
> [...]
> 
> > +			mdss1_dp0: displayport-controller@22154000 {
> > +				compatible = "qcom,sa8775p-dp";
> > +
> > +				reg = <0x0 0x22154000 0x0 0x104>,
> 
> sz = 0x200

Hmm, why? I think the memory map specifies these sizes.

> 
> 
> > +			mdss1_dp1: displayport-controller@2215c000 {
> > +				compatible = "qcom,sa8775p-dp";
> > +
> > +				reg = <0x0 0x2215c000 0x0 0x104>,
> > +				      <0x0 0x2215c200 0x0 0x0c0>,
> > +				      <0x0 0x2215d000 0x0 0x770>,
> > +				      <0x0 0x2215e000 0x0 0x09c>,
> > +				      <0x0 0x2215f000 0x0 0x09c>,
> > +				      <0x0 0x22160000 0x0 0x09c>,
> > +				      <0x0 0x22161000 0x0 0x09c>,
> > +				      <0x0 0x22162000 0x0 0x23c>,
> > +				      <0x0 0x22163000 0x0 0x23c>;
> 
> 0x2216_2000 and _3000 don't exist, there's no MST2/3

Hmm, I will need to check this...

> 
> sizes should be changed similarly 
> 
> [...]
> 
> >  		dispcc1: clock-controller@22100000 {
> > @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
> >  				 <&rpmhcc RPMH_CXO_CLK>,
> >  				 <&rpmhcc RPMH_CXO_CLK_A>,
> >  				 <&sleep_clk>,
> > +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
> > +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
> >  				 <0>, <0>, <0>, <0>,
> 
> You need to remove the same amount of zeroes that you added

Nice catch. Which means that somebody was sending untested patches.
Nice.

-- 
With best wishes
Dmitry

