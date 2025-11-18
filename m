Return-Path: <linux-arm-msm+bounces-82303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C00C697E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6FFAA4F1143
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92264287254;
	Tue, 18 Nov 2025 12:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OTznrsjP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRWvbeFV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB042580EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470451; cv=none; b=qV8S0u2b0SMlXNwRkiBKnC2v43wAhQqLHz2az02kgEm7Syl0WB95dXtjH3tyTFN2xE9uoNGU2u0KSTbzbyJV4uo1OqRtVUN7PHYxq9oPZO6zq4lDV1shu0zxD4QEQAXiv6nJ2P96fcYoOjerV7iP5ulj5nDd+FGGfvDAomzDrjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470451; c=relaxed/simple;
	bh=DuS44FqrSwdsN9o3Kl2ivQS3d3u0oobBRnrBf6xZj2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1eBRcxwmqiLnbuMZQ8OH8ejkoC0G/6/syQWGXu/HJzTrwCH5uruXSRYppV6F2oRymoXgaD0QNhOxAyyfgRsVMBcAG42TJzZ1Vt4olQ9sayNyrodcWtksgppHS+W7ZG3dkyJI5tGfz5N2QqzGQZz3CPkPoAzVtz6chX9vRJAOdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OTznrsjP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRWvbeFV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6YLlK623776
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=knwBM8gjzCjsmHe3WmSNhjxC
	d1wPbIeSMMjROVDpEWY=; b=OTznrsjPMw5+p/X++Rgm6+dwJRTUn9coNAcLK6VW
	H/z7r6YRigZlQ5AXdQfiU90YHUGorqLKX/AOmNvedvicqJXmJvu7fxKnw7MCRi0P
	RgGwzUQGP2CwOMgAZNHcxxV7m2UevOJ+YMSciMxRQ5vmrZpSRp7zK1tf+NT3C14Z
	pCNB2zEYIZm3aGkGpVF7xLUXUbiEEZ8fgJzI1GuUnvH+LGml6612JatkORnsjr2s
	KxF9p+YS9O2Ut523KOHCHoj65Un5hJ/IHV7XOgTvzL548+OvQoZpdPXHKJDHjzMk
	DOsFjRhKgixXOcrBu2whEwrb1zN1Yc93tMv500VEmivLHA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahfafmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:54:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6e701d26so139796551cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763470447; x=1764075247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=knwBM8gjzCjsmHe3WmSNhjxCd1wPbIeSMMjROVDpEWY=;
        b=IRWvbeFVn8pbnI8ijpD96a47sLab6l/Ju++Lxr25BqqLUUtQTRyJOdr37b99xpI/a3
         31cY7G7/vh4/e/zJLgwDDJ47JuC6PWot1S6FmGnSrD8CUdhQPZ2PF2Voj5GBQRRfmBgr
         CvJ4q6xabzx3MrADdsVGLTSzVOLGmpoBgVBbq/mGd1Ppb+liYNazyD1jdiB37u8+e/oE
         pYiN4Rw7WuVEJexuD+ANJyguriH7ddvTdbN5coxI3RX26oNVDVYWYvQHHsxhDzhD6Wvg
         x+6kspz4Njram/dErNvRUVPCnAMNF7pPqPtWuzldzNeIDXgCMDYCVVQUVPoluJXLwkVz
         9Dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763470447; x=1764075247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knwBM8gjzCjsmHe3WmSNhjxCd1wPbIeSMMjROVDpEWY=;
        b=fjrKmOJL3gzzqzGwT6HUe6A98dUatypQlyQtbg4hl6TQODkN+DcTFUIghwBeRC0hYb
         XjutEW/jvOl9yFBkLwfjAjIUEjAohmafomwnrLtIC6rS5/5I1KsiSjtjrZd9Y1F+6LOb
         lZmh6YL+7N0vGW1wz5XuT4Ut+K3Wolxlh4tZ1YtCcSO3kZ3cQo5jwI+N2D2H4tHBJKz9
         A+Ori6WIjWM5ykxYHyvx2cqE4LS77AbtDc2KuBZS/hVvQ6TdWFcrMXVypoIThYli+IVX
         xhBPKTGA/1XImM63G5hAfzbE7wVN6x/0pcRXXtWybGiUkvv25e8Ty5OiiF6c/OUkeTnU
         SA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/AZiyyB0yhZjD1rvB0iEPhynXZOeiONSwUjm+Q1+zeF9jclpYbYdPAS6XDsmrWO3vh8WszfI0cRAXACbT@vger.kernel.org
X-Gm-Message-State: AOJu0YyGXZp+jzw1VSgVOQHpiAKJy4R6+7r6ZNX0RnWNmn7/mRxrz7aT
	LNl/JV+7e3D4Ujo6SjqBYgB7o7I2oZkdpEFn/S6b2lE5D2ZxHm8lV37UW520FHuOh1x3x60Tsmh
	452Q2lf4TIR1Ilha4QGPZFVgTjsaV99bdEcBHUwIfvY2JI994DvltePw69szNZMv3K0Tu
X-Gm-Gg: ASbGncuyoT9RPUO3xktTPijM68K/uH3lEb1nhPPkZTnyK/z9H5Co48/hRo94BqJHgjt
	DyBzLmCZ33MNBHiPQaMZQRtyyRYQJ7lSObvs6IkCGqk8gZye+1jXSdFLb+CvQQ++LnjzwQXOj/e
	ulDLK0uK5BKnHUlTXKkd0fkOXYRqJuw2ddJpsi9Fg58QceGmX7W1ex0ycfmHK5BHT4PmISTwOYG
	+L17XC8FLIUoQ8Bk9NDi6+pj55uuQOxvSsS+ROnYvXxtjZ61G0s1tc7fJQdcZ1ABRBQP/BUof9U
	c4g931Zbz7XhgmM3euiXPNEyIqkPyLKjr6AHPy07NqdFrF5RA/+xaPsizaL3c9QpSjbZz7TcZRs
	v2by6WFRAxeKgTi3NdZrFkgwvf3L2TwaNX55toX0Gp8XXpGZoH/DSyqD78mrUNTkVmnwQ0QtZzx
	0VGFvT5GXjA9eE
X-Received: by 2002:ac8:7e86:0:b0:4ec:f1a4:5511 with SMTP id d75a77b69052e-4edf2160d82mr196773521cf.65.1763470447520;
        Tue, 18 Nov 2025 04:54:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1BSGmQOsiNlVGVnqBMLEMjdnWhWDECCBZ5McaUVooeFBMFZy4LNjq9+fVO2TBCiXuFGPywQ==
X-Received: by 2002:ac8:7e86:0:b0:4ec:f1a4:5511 with SMTP id d75a77b69052e-4edf2160d82mr196773351cf.65.1763470447098;
        Tue, 18 Nov 2025 04:54:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce2798asm37452271fa.23.2025.11.18.04.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 04:54:06 -0800 (PST)
Date: Tue, 18 Nov 2025 14:54:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH RFC] arm64: dts: qcom: sdm845: add framebuffer reserved
 memory
Message-ID: <ajsfoahkkw4rbwedkuqmcppg2xjr4gqhmsppajg6njuyxouvso@syrbqmgvxorm>
References: <20251117-commonize-framebuffer-v1-1-e4c099b383c9@ixit.cz>
 <5c1948b7-aa3b-4c60-acf7-64a138450d57@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c1948b7-aa3b-4c60-acf7-64a138450d57@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwMyBTYWx0ZWRfX8LweC3s6YhIt
 b/PihT3xbOWPJTbeP3pJgY+B/g6YuArj+3lfCbeuN52iTDNOIi4Us+ixoRt8vwwYJlFRCPewEpL
 FEHFMolfhmbPF41e5DbrRc0SpMT+4Q1bxaFV+YdmPf22NJpidjC6e5fSQwXcKmMs4eejY6+Rur2
 736vLlTscv0JcwD4/3qsKoclV8W5o27pHgQRCpFPyg9Vj2AM1tOrzQSU3gMFP1HrpvFmc4Zp8Yt
 nlygFcCrgAEJCXu6JqzfaeZCdvxhOi5RZUaCacEVpxfqtXsZjdPNWGZt6D8CLJ2uPz6694gDSBh
 ljmA7uoBVQvasTPWMzwr4q9lrBatz52B75ATOhvMaf07OpMLgk+qjs56evq/rTXSzvpwrQ2nOwz
 XcCu+1p+l0lXbAoP31fUNV7augb6dw==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c6c70 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=iiYmOEhUz_7GOtcYMWYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6KuSfEfxIvnmwktj4Wf96o9mLtzCzlTf
X-Proofpoint-GUID: 6KuSfEfxIvnmwktj4Wf96o9mLtzCzlTf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180103

On Tue, Nov 18, 2025 at 01:26:17PM +0100, Konrad Dybcio wrote:
> On 11/17/25 1:27 PM, David Heidelberg via B4 Relay wrote:
> > From: Casey Connolly <casey.connolly@linaro.org>
> > 
> > Stick it with the other default reserved regions, all sdm845 devices
> > use this address except for cheza.
> > 
> > Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> > What do you think about this proposed change?
> > 
> > I assume QCOM recommends or by default use the default memory region,
> > but as can be seen on cheza or sdm850, it seems that vendor can customize
> > the region, thus it's not guranteed to have it always on the same address.
> > 
> > There are two approaches I see:
> > 1. keep as is defined in each device-tree frambuffer node
> > 2. commonize frambuffer node to sdm845.dtsi and in case of exception
> >    remove the node and definite it in device-tree.
> 
> Generally this carveout is useful only if you use the bootloader-
> initiated framebuffer. Post that, drm/msm allocates its own

Previously carveout could have been used for FB memory, but with the
switch to GPUVM I think we lost that ability.

-- 
With best wishes
Dmitry

