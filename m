Return-Path: <linux-arm-msm+bounces-73751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBACB59BFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 258271777CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0DC313267;
	Tue, 16 Sep 2025 15:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z1FytrLZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150C12D94BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758036249; cv=none; b=TBg8FL3rWhMn4TMR5FM3Hx3nGceMn2ue78opVB1vo23mpb7N1Qtx5aaVuPhAQTl2I98HumJFRRqmO9S5IZWKjvg5zE3ebfRVaVrO7NYyUrgK/7wr+hn93HlXfkLFpXCkxQG1F8z3pJQ/PIg7bP0jEH7riOKsDX19OjUPEV0R6YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758036249; c=relaxed/simple;
	bh=QtaKSBDW16KCWpDQej0w3KV1bPwSRIUQZFPEM7MtEI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gltpPpHnNRVaCgLa6zyAyfyKmjuvNH+zrAcks9sHyGB8INHV+YzwGgEvU8WqbxRGDvoDGA7oqMPhSVYuO+pht2eshoH98SfgNhpqhoUwEuuQmK4H4oDklCtyrELj71PgJhVdq3DFWR30UyE1JulRCx4Q7b1dPVqK2gDezwdF5Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z1FytrLZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAAdIo012286
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YOAZ40DrsPCGrdYCkt8MTvOj
	Gy7jGDD/2JSb9vwK9ps=; b=Z1FytrLZt9wFuBQrrMGpBNnYUiHlqKmretL6Qev4
	n5J0xGXBBsdPv3FP11sZxEp0yBfLFd9c/c5b0z9iuuhsZTiE41ITRAQjEWp99Y7S
	l/1uSHccNcP5vkoW5M/FUViN9Im3nU3QlLEcpSEljp+ymZmmxwIKqMOjwP5d2VD/
	4h9gE6yNq5hLrWBqgZuPxAcoHeWt/GKxTxeYhZFthqjoEay0w+fWMCTBY/69fnwn
	1j+OXy4NuCAaIvdwcs7g59QxJq5ZDG1cZj1Q3j91zkfpjHVAIc9c/vliia+MY5bI
	DvutR6XWcr2f870YPy95LzCKGRpTUmAHyeJyLiwgYn6mmA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g12n153-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:24:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f290579aso114804761cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758036245; x=1758641045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOAZ40DrsPCGrdYCkt8MTvOjGy7jGDD/2JSb9vwK9ps=;
        b=dhW0+dtz+uKdgxgWvWi4oFwMzFAdTnz/uUVvZoaODlrxRgNOxZzMbq4YUhHgWlMdeh
         bK5FXXy8Bwf2jk/l56D0VtVdRe6fKYg1q90vl9IBio/m3GX8faAMUMLyVaRXp8sC4hMB
         kWn0CSRuBk5/Qy0LGhB7d3A3m9oePI4HhNh4gNUWndOvFGDB02W0OpHeJX/LwmvUR+nI
         kJ8l4+puK7hW6xVUG0LubFwgs0mAHXfKO7MCcvDp6hDsQUJjNNbrPiHROcP6cdsjWIZE
         5a7oouf0xEedYPdzTy9GLB/O6MQgjFLaUIxPVY4KPqueBjkvsG+9MzixpaQErk7kX96G
         hpFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOrZZX2QK2pBdGLHY8r/oYgJ+xSQ3xfe3Zh48u3gDeMUgg4m0ErMTgGtW3mQsp+cxee3IeYkvqZ79fNos0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0U4Xyr/eGTTYVzeiBgbfRg+sR9M79OTE0dKR+srX0/WaN0xDV
	GdIS9hyzrBBjLwn7qqDWHeQNpqtiUvYxeEbBOPGkD/vz7puvf/HreUldrtxHaTwBuYeglnIWbNz
	VvYCX5X2OCZItD50+FfrhlfD3smC6xzNx22sE8p3pOsi63bFBmS1vf9dCEsFqV7NJNiTVCreBru
	gX
X-Gm-Gg: ASbGncuiPDRpSLaPfQbHPDMmQlweFJKrvK0fpQjSVqLGotBfF+1M0vFfVNthdKeEP75
	hwWQYvixra+TVqtKoXW1nEHUxBZaAFrpjR6X+fflR/TVHy/VHNtOdTOKTCriEkGgE/99FgLNGhU
	9U35YdKCYei/2EbbTXoo38ubKS+1TAk+fjMcFmqBy6CyZEXoVPZA5MRTgWvNgIwGWJFE4rivH+L
	/lBBGCYVByYNRUW+bEMDxB/6JATMs4rlhcu6kO3onXjHe1eE6BR0MFr5EpJ0fcuj6S63dskIOzo
	nDP1IY9BsUQWfkokLr3iADbRLRRtP5ocN9Yw19Zjg+LthXIBfl8t+6GpJcz2MvUZhE4jECkfNFv
	7xIi73762Nd4Q8LsCDgKyyDSfOns/BCKCkT4Lo5EuQabKlE3A+xzr
X-Received: by 2002:a05:622a:4d45:b0:4b5:e644:67e with SMTP id d75a77b69052e-4b77cf982a8mr280631121cf.16.1758036245357;
        Tue, 16 Sep 2025 08:24:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoeXaD4RPHM2aloTgPF1kNC7rywOjcpj1oNZKOTTj1VqcL1edfsgvTKtAJQPrPo3ytrJ6T8g==
X-Received: by 2002:a05:622a:4d45:b0:4b5:e644:67e with SMTP id d75a77b69052e-4b77cf982a8mr280630341cf.16.1758036244775;
        Tue, 16 Sep 2025 08:24:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f15a58316sm36218721fa.8.2025.09.16.08.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:24:03 -0700 (PDT)
Date: Tue, 16 Sep 2025 18:24:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Remove unnecessary cells from
 DSI nodes
Message-ID: <ww5libgz6c6cfisch5um7sanhdvnm6aoz6uaqq4vbiraygmiei@fmxpat6ofd7a>
References: <20250916141931.601957-1-eugen.hristev@linaro.org>
 <kday4tlzjmycgfexiaxgwnan3a3nfxt7sgslncsktcyw5bmr7d@nmjtdm3gd2sk>
 <9d74713c-00fc-4a17-92ed-b3e3420160e1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d74713c-00fc-4a17-92ed-b3e3420160e1@linaro.org>
X-Proofpoint-ORIG-GUID: sbSkzxWmL39B5FvWXCaq6PxB2RAzmiig
X-Proofpoint-GUID: sbSkzxWmL39B5FvWXCaq6PxB2RAzmiig
X-Authority-Analysis: v=2.4 cv=E5PNpbdl c=1 sm=1 tr=0 ts=68c98117 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=kvEb3oXna-i2HelZiMwA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX5vL+iu9ywcEn
 P++yFRej/LUwawavdHH+7fBZJhH6y55P6J86uSTyFbZutxr/Sz4ezSoLSpp31J6YyVDfOiXQwJ6
 yIER5+c9ltFwkLIowul82/F6qe+2vRy95TkeioT/rFSD3IchbSWzgfyIjWa1zusnMSChBc88uqX
 E2SAUVTJAJjXfF91zvgxOEG9H9nWvAsqbwrrci3fQ37dc0891MK8UxxVFu+55jqVDHYdTRmiyWN
 d0S4hEQ6AhI/Am16rFdaJ+o4Eduv3BIdKqWndYt3WF197QyZ13EQL/JxgcFzsJXTubMtsrrgO5c
 CtCVZP2TLsjQ3cAlJI2+EF5IiAmpk3VBgcziudL+ukGiL9/vrmw3CVcIa2sH/JY/+LaAmg0C/t3
 B5+QlXK8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086

On Tue, Sep 16, 2025 at 06:11:07PM +0300, Eugen Hristev wrote:
> 
> 
> On 9/16/25 18:03, Dmitry Baryshkov wrote:
> > On Tue, Sep 16, 2025 at 05:19:31PM +0300, Eugen Hristev wrote:
> >> Fix warnings
> >> Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000:
> >> unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >>
> >> Fixes: 73db32b01c9f ("arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes")
> >> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> >> ---
> >> I haven't found a pending patch for this, so here it goes, sorry if someone
> >> already sent.
> > 
> > Thanks, but no. The nodes are correct. I don't think we should be having
> > the -cells boilerplate each time somebody adds a panel under the DSI
> > node.
> > 
> 
> I understand your point. But leaving out warnings for a possible future
> node is not ok from my point of view.

Then please fix the compiler not to produce those warnings. This applies
to most if not all DSI hosts, not just DSI controllers on Qualcomm
lemans platform.

> 
> >>
> >>  arch/arm64/boot/dts/qcom/lemans.dtsi | 6 ------
> >>  1 file changed, 6 deletions(-)
> >>
> > 
> 

-- 
With best wishes
Dmitry

