Return-Path: <linux-arm-msm+bounces-77257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26680BDB99D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 00:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AC7818879A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 22:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B762D877C;
	Tue, 14 Oct 2025 22:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9XLbw6F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844721E3DED
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 22:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760480228; cv=none; b=lAVCjieKUr+QPwTqMZ5sIi4xQZfGBHQnHIMounNgYGNvnxDxbBRGhpc0JflPMVx4ICcaoT8s77g5nrLKbxY9Gui8Ntbzot6mc5OPuGHtUBj5ppvb4mqL3Ll/VJnNn7NishWtn8CpoMiocPKf3SZhrFZgLT5DII9/3LyEsuCVa1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760480228; c=relaxed/simple;
	bh=UTBERQswmPtrfgvCDNGWHUY5Ci7MI6TrR3rlhhVtcuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJpDHkdFBWLeVlVqbHcLzobQpEmLu/k9wg8IevVzmq300W8/p/Tg1FSkDRqgu/DnKi8mvwiIXB7O5hpJsiB1BdAOHnZkgbXZUO2yeYQBef0E43cWGzSPoh7UQNSJttHWUjh6oZQi6iYYJzjTnrQC/DXjQSpPfLoXEY+4qGR8hAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B9XLbw6F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKSm1c018792
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 22:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=acxFHNB1qCMmBdmM94I3DPDY
	6fafFAZsfZx2OVrKtSs=; b=B9XLbw6Fx2zZ1zBQM570nvp2RMkPYfqyQDQkWZhv
	fzQTbA08rlojgXNeCKfhGuQOndGo3Y9tjj47AwmdGiNu8D62lfTRJqwRTWqzObbm
	xX6SwScK2mMiHynka1CbmHUJMHuVb5DV1hyIOwY0wpOeQ2enGaDuK/DwgLiZ8FrH
	VoyoZlgmM86qvCb+OekhKp3cfCmCoNexlt8FcneC3FxejfLl1BhtIjXifYcyBjaC
	GxUgqbLfCGJ0pdouIlqEZdznFyJgvzWwVOXiKK9ZPB2zaNkC7Ug2trpVYDm865Qt
	gxicwWVxfk9/n1UxpeD35z1/p3BZ2BpyDKkH01UxhTINyg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg225a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 22:17:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8574e8993cbso1231053085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760480224; x=1761085024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acxFHNB1qCMmBdmM94I3DPDY6fafFAZsfZx2OVrKtSs=;
        b=L5S7Z6+YmsvIHmo08kDzN0aXS4ue44n9R8YeQEUi4QQYx61wvb/gHNkT2yLUdXx++4
         i+lw1GGRI3ZNMAui5LVNUEPKzLdnytDSaFkyDvyuaacbXFVGfLhh+0vDtEPAA6C7tDZV
         YID96tvlXasIk3jSVGcCabFTl2P823b+UjCSrFe3wLzqRCgE6QkYpNfdBrELvp6I39Rs
         1ggbi/wJWYNAGnnjIYwbWApYcFrWNdk1o7bTs3MCG3GsouoTEaxbGCL5pwG0liJCMCIY
         qEA1mgaOh/TbjqOHFzj/eTKU9Nu5a2l+aQxt9trcaJBDhFRLHN0tdc8dQBnsF0Z+SsDX
         QxjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb1i43w7LeWYSAKN5TxTQZIGtJGfeN0q38voN/3YZLBEN233RQpRm+m6zaknR9qFcI+Gy1a27uBR6Kt2cr@vger.kernel.org
X-Gm-Message-State: AOJu0YwfbkVdL37cLb5Gons1gA5XGXowEN9A87SzgiB3OVdDtbB2zgnL
	7CwQEl4tkFdDbBEsHX9L/xD7liQPnin34T3celmF16fTWF5XMvCGKqIKprontDCW76W/PlCuWmT
	G5uPfOTM47sRfZM/wbZFEe9/Uql0HUqC1EIlkhZwb1hawPPXo0Q4Muzwkjxgl9d+5sPMN
X-Gm-Gg: ASbGncvz7DREY+LDI0sX0jZ8OEISvRrss08dWNqzSdTfaTRQLK0l11wLtjiiJb9yTFY
	SA8AUEVVhCm3ubQvYLW7chCTd/QKXTQz8jUGDSxVuzDTxV7+QIto7d+DnjHZH0vsIe2wPcHC7bL
	PM1+VWxNcEMopJ+7WemN1njOhnAnW4xYUAykUiBGUGePqWc4XhUhk9SGcAzZ5pboRl4Pyu8ODOk
	/68u51YJnSEzlHNkMuygCM4BfyOIrtF8OuNa2Coto21OyQY3pB/fgqqauHXz6OvtBwBjFM0kyr7
	+6yhnDK5KBrjlfRh1PEOe5zol4Fe2jCun2ZpIj6kyZfGSvSxkY/SDh7ekTQ+pl4GOpirsJ4QpbL
	dDmrPojzo/KsfX8ipM5iSOc8XnvKp3pCJkqmmib5snHBMj/U1XnKP
X-Received: by 2002:a05:620a:d96:b0:84e:2544:6be7 with SMTP id af79cd13be357-88356bece86mr3605347885a.65.1760480224036;
        Tue, 14 Oct 2025 15:17:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqry7gL0o/foP5bdIZkkIufw42pdC4mWKYSgvEtxW5lk93OwMTW4qm5JmsLq1hgKg1FOcqoQ==
X-Received: by 2002:a05:620a:d96:b0:84e:2544:6be7 with SMTP id af79cd13be357-88356bece86mr3605341585a.65.1760480223473;
        Tue, 14 Oct 2025 15:17:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77ea14sm42497401fa.7.2025.10.14.15.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:17:01 -0700 (PDT)
Date: Wed, 15 Oct 2025 01:16:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs615-ride: Enable DisplayPort
Message-ID: <geh3pbatv53bnk2zgyalnwvumvcsqaz6n7x6dniohsfk7r56sq@mpflfuye62ly>
References: <20251014-add-displayport-support-to-qcs615-devicetree-v3-0-74ec96ba8144@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v3-3-74ec96ba8144@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-add-displayport-support-to-qcs615-devicetree-v3-3-74ec96ba8144@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfXxrKOfJ2EcquD
 V3lbClSuaisZmnp0FxylzJiz83QXPitAOmFx1dcnRNqkpHnu23TyWYNcjayv2NuakvE7mYQIXQI
 jDfnKKbN1Pgmb4lu/LNLGuDQrryl1Pa2pN+/YucM/6hKiPKdN0NHLOE+Jdf1WQxRe++LiO8slEJ
 +MUfrWgfkZP7zeoMEb4yVmjzAROlDJS0qIiBIFt8+8px3b+z9v9H1Z03wglj+nj1w+9MWdNkKfx
 9l0BF78lgyjz2KB3v+Kjjiy5nSTQ4syuhFdAt0DZPRAHUwcNvPIXrTQKqQiAEXQggRtftafcZmI
 hv5zw1T+3jqrUlG5ClhNqM0fZO4PtSspZ51V8B6ynhNtyNP//jLqFGlGJcZ3Q/UWcgMPvtB94FE
 MU80AKOCVs+NwhEGBmECp+FJh/O2aA==
X-Proofpoint-GUID: rCq7cvCqKZNnQJJU7hgMGE4U-IRQYvbw
X-Proofpoint-ORIG-GUID: rCq7cvCqKZNnQJJU7hgMGE4U-IRQYvbw
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68eecbe1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=VdtQghO5X5uSFlG9jygA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

On Tue, Oct 14, 2025 at 07:54:56PM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Add DP connector node and configure MDSS DisplayPort controller for
> QCS615 Ride platform. Include lane mapping and PHY supply settings

The "lane mapping" no longer applies. LGTM otherwise.

> to support DP output.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

-- 
With best wishes
Dmitry

