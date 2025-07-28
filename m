Return-Path: <linux-arm-msm+bounces-66931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 677C6B1424F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 20:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF6737A4717
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 18:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CDD276059;
	Mon, 28 Jul 2025 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcFmvrzc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D597275B1D
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753729153; cv=none; b=WcBJ/hUNTqLOgdkncGC6XpeTgb0Z74M5ilRK5OJQjP/Yxq5kUIbL/krNhnIufrIetSsSyZ+R2Nmi0tNfd3YWgRJDenTBFbEdUflvfQhWqBbHIX5sfqOjbc4LBl331lxXbnzE9WBZvOWopifSvSUyj+QS3IE1avZSt86HtnohFAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753729153; c=relaxed/simple;
	bh=IWpZoNGayIjThY9y6ABT29cNtcvfwrGLV6Mv5IWqx5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1FihRK2vAB2Q42IcYk9rG23Hif6iIarmkmm8K5lBPqPrUXvcOpbSg6LN5+r8/OnQ8TuhmOlBX91tZUu7d1WUq5r9vZKx4AuDbPI/m2XpfybI45l46moR3mhyE0EA+L03Coiqsyq9WSgLhyX7GJvm3XDGPUGmmcVO+dwFE3FPi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcFmvrzc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlK0v014609
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 18:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g3b9mjC0DOS1TwNiZSFPS5aw
	kCSouvEfEECI0Xi46LI=; b=pcFmvrzckhuIL++xLIxfre8lNoQD6k+Ws3MV2M6w
	btcd6Titg9W1w/jUeebgyZbMIgfwYKc71Bk4rnApD8XY5EW56PdJbompNCwbJD6i
	7EJJFtNSbNprjMuS4Q4D1+uFs7lTCMbC4XEfoyKTyeCdskXzGVBU7WRjYpoBY+Ja
	SN0Kvz3cnFujCiq09UUWfWtxoUcdQODiGRdSJW11M7f9iWeef1BK4lwP24g4mlzc
	555Cn72oYPTQ2krMRu6FUoksgZWFWkquoVIClMOc4IjftpJe/tQsP7a79kW4XV8p
	iBmXxnTXff2Xo2YnHgUMWfqh5RrVhqlwsmZAlYSdeqOSoQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xnjrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 18:59:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7073834cda0so32066026d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 11:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753729149; x=1754333949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3b9mjC0DOS1TwNiZSFPS5awkCSouvEfEECI0Xi46LI=;
        b=gZwPXbPYbUcjKP0Uo97OAOy4CIVmhdrkk44iVmv21pK4JS8jDFildnth3intdYxNRD
         c10N0HIjs3PqtmqJBUT2ob27uxE54C+Z8ivmCKSDMJNNPLjyW1m7KmaHJqg6v3FzzhZn
         NPbt0xyWEqOZ0dMZuZ9Pg0pZuZM5WcE8i1wUUWCJ/Vt5AbM5MZ05dQKCMQGluwDKYWKF
         q7T4oCk+8s/pa3O/i7EWlkkJKEVyEye68ZBL4FwUdT9HWRw0xSz1z6YDrN8319e4YkBW
         loB8L39qrM0RJbFsBMHxQ0c8FJu9KuSprZR12jBNev/dd+iJUukOrZXcPc8fkktze20g
         LOgg==
X-Forwarded-Encrypted: i=1; AJvYcCU+a1wey1MAnnYocxLVAXUx+kyH46K26jeK/WObUxLgfO3HuGBazckj3Qbis1kLWaontF04CWm0EXxUrpoI@vger.kernel.org
X-Gm-Message-State: AOJu0YwhEqIn/Wmw8E2nwraGNg08lkTy6Xq+nA0vXhx8xlmGdqclGFCT
	RYmPtEMqygztoP/WHzeTlhae/HfEc9+RjNQ/WYrHX6ALQzEkGAwwKDMQaekg8cfBOg46UGiewn8
	BBj5n2Y3Sj9fgWQSmq9pW/o8oW/EOE6FHeFP607oqu8VRHQ9A15rRo1UYp4Y0xvn69Myd
X-Gm-Gg: ASbGnctoVGp/0wTQhzDO3RjLEClhecbqbk51sTaLoXMfi//tB9EEqAIc4TOCHXO6onk
	MnRg/yWPzQokC93YumCen41SUC4P8qO7ynxy8s0kURapy3dtpEGNJLVT+LkCwkbDk4MvimQgcT2
	3LmkssuYE/dRT8+wkX/6kXEImUMslGJ8+Q0edyGg4mRhACHuapbat7N0lTx/hIB2Z4pqGrdGJXQ
	eYdVG69B4vZVm2CHu7cveX7IFbU3cQiI8tev6uDPfaLWIfXq3YGGZ+NagoYWzOp1rjLnqqcjuId
	LNeDwEmvu6w/fgx+POFtQdTQglYF3rlZlgRkc3xxlowJMXcCZwkqsPIjTtPJe+AmNO8F+/hwN7w
	eoj9oDFsVRezo+CBPXlC90yNjNUDqKIygpLcS3Ykz7Ktfv04p8zVf
X-Received: by 2002:a05:6214:2261:b0:707:1b3c:4124 with SMTP id 6a1803df08f44-70720514bc6mr139816056d6.6.1753729148814;
        Mon, 28 Jul 2025 11:59:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeR/e5yy2Dmbqpj9B2szzZpphi7NqKMlFSMX2Qojm62xxZ84NsscDMGppFa+sWmqZGFGaQuQ==
X-Received: by 2002:a05:6214:2261:b0:707:1b3c:4124 with SMTP id 6a1803df08f44-70720514bc6mr139815506d6.6.1753729148113;
        Mon, 28 Jul 2025 11:59:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f4267695sm13324171fa.50.2025.07.28.11.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 11:59:07 -0700 (PDT)
Date: Mon, 28 Jul 2025 21:59:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH] dt-bindings: display/msm: dp-controller: allow eDP for
 X1E8 and SA8775P
Message-ID: <kvnw3wkbn3jedfxryqdikef4db6ij4lobgj4qp4dgrpd3sliga@w6do67fiyhri>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
 <8399dc75-6363-4ae1-98cc-59b5b62dc8b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8399dc75-6363-4ae1-98cc-59b5b62dc8b5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6887c87e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=_uIZQMxxb9QNBo7-lSMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: rE8u_mUMsGcThNVJtqahf8IzmmWpDKDi
X-Proofpoint-GUID: rE8u_mUMsGcThNVJtqahf8IzmmWpDKDi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE0MCBTYWx0ZWRfX+Jr8bv+zEebN
 HLZVxg9k7wX4iCLaLa0jjw4uKYJbk3jtNDD4nFodmrBYdC1SqPcDaBw/bPV9ZVt6zc3wNT8Sa9I
 2OHMqvR3w1FeHwOuhwJz2oMiF1M3AipRPFynvbNpqX9uMfM24Zb35UM9LPEoSb2CWMbJUfnIJkP
 PQCqDKE8BubTUpFgrH22RGEpEZrBoRFPdaBxPaXSLrBfTjn4ET1QxOjCGceHwmGRD8+SDt+L4TZ
 xpriC1hhOwxt6Lu4kVBmee2GGLzVdcRtmLyxkiCFglyyJJ0sjN7YRZhvqglVI/IO7DLR8GRobWY
 veCR/GvlyPE4fw16TZb/+NBpDfU5IP8DZoybd5Sz6qjZxq71b5g+ySNLL8OsAghXE8lpQ//T47p
 l6pumP/Bq0GtF1nLchyEc5LsCRJ049Uz5ZA54v8ndSScf128vJRT7mMVUDlv8Y4MP2TLokkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=671
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280140

On Mon, Jul 28, 2025 at 11:29:31AM -0700, Jessica Zhang wrote:
> 
> 
> On 7/19/2025 2:14 AM, Dmitry Baryshkov wrote:
> > 
> > On Qualcomm SA8775P and X1E80100 the DP controller might be driving
> > either a DisplayPort or a eDP sink (depending on the PHY that is tied to
> > the controller). Reflect that in the schema.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > 
> > Jessica, your X1E8 patch also triggers warnings for several X1E8-based
> > laptops. Please include this patch into the series (either separately
> > or, better, by squashing into your first patch).
> 
> Hey Dmitry,
> 
> Thanks for providing this patch -- I'll squash this with patch 1 and add
> your signed-off-by w/note.

Perfect! Then it should be S-o-B and Co-developed-by. Thank you!


-- 
With best wishes
Dmitry

