Return-Path: <linux-arm-msm+bounces-86246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25567CD69BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 16:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40C26305D668
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 15:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166DB2D12F1;
	Mon, 22 Dec 2025 15:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDAqqMk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWY3oR+h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E46F32D0D2
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418412; cv=none; b=J1/sPcSxN1wrKvLDYepVOn6rfcRWv0M/8i2H6EM1R5dXHnxBSfyQ3yiPGcdWkDRWKNlBUaUiuDFx+sh0DRG58FxTP2yafSm4QqFDRXndmJBLalwixsd1yrV9yjS7UiM/z70kLZteBvaVWcHi21WcGdbEFHG8uxc8vhg/mBuwhpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418412; c=relaxed/simple;
	bh=gKoDiGhXT0SNCsCp6ZuvAyklCOX1Xi562CRr5DR4LoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4OIuuDGg0vhLuwXO8UZKKR4o21xfN0UpOhSlqEDbRQIXDpoFweL7DL7AxFIcCaxUwAv2Oii5CUn+OgYLEA+kA+BDSdzsNjgADr+YHytkD97eHG2BtK/oIYXxnZE90r4r27nxYk0kMLdky43MNwoJhyIc1t29q6LxP3J1slGufY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDAqqMk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWY3oR+h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMEBxot1528818
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 15:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=InXyV+JNec0b7S1997VuA92q
	dfvh3YWc70bUG/cazkw=; b=MDAqqMk5nywR+7vGyHwdUFlaBY9Y+IAiF+ml33u+
	0J47yhcFlNx4Y6JfY5DYbE3MQxwPT2Y/kqKWi2snjSNKsV3R3VeQVRM80amWOCLY
	zkkhpkJU+zZg9wBDHOG9KsnI/xmyKHT6asT+98o6U0HmAo7WooIRjji0+kWgQdNC
	gF8Bo+V3gXAbkA90sksE2LrvILIif5oUU+J/efxlCguUiPN1blP4GgataWps0mZ4
	fEBYaRmUCCcZYO4oyAXjeXDIuPQd46n673hRhCxWSz3fGrLFSVLrfRiAeRi3GBOr
	vgQ91hbmxy0cqLUSl+axoSkZWPegqjDV5Y1zkdaN2gSTdg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y0nf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 15:46:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4a5dba954so95741551cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 07:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766418396; x=1767023196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=InXyV+JNec0b7S1997VuA92qdfvh3YWc70bUG/cazkw=;
        b=iWY3oR+hkswlZW3LXe1qj92YHcRo0BJ2mToNSYQhJ0j3vsnHuWX+iz23FpB++Il9D2
         l+zcuHUOtkw9nJnnhH8EKjMkmTJvqdzii/QWPIRWK1YOByHxjFdMV8DEWXt1sLcmcUrn
         W6DmTU+MQxXnu6RSRyl4ncFYBOAwfNocsL0F2myVoe4cWA1RgsNspXGg4u1CtLs72Gno
         UCVPGMPkqgyuinpRhKLGD3VdouYPxyHGfCOsu61v0nxVyG0SgjbvRIbXB3MwsnV/Tvrq
         ax9gK4C62/YWIH7LsyuhXgjjvi/pc0q/4ig0kKtrOu5Iw7L0LTT3eApJTWl2/iwu1kok
         VK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766418396; x=1767023196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InXyV+JNec0b7S1997VuA92qdfvh3YWc70bUG/cazkw=;
        b=r8BaNRZgQ3AGwdYetJp2Tanceg3KL/gZ+0FXi3AobAQF850IWqTCDzFhwYMMginNAU
         KZVFo4ibldv5qztZPq3aD2DhO15i+b7eIBaK58/GH64G5gIR8C+ySXm5a38kBCmQBa8l
         DBjoG9hQ9kBo7IvidAyyKsLdbgIMGsmsPEccxRrrsqqDrnlcbDK6kIWf6Z0uMh50FMiU
         VXJK1PQQ9D7SoNbfUuCqNnUj/ScXZZUyejiFNAWq3b5tQ3AoMFMspw7XQL+CPueVUt32
         oo9hfmoIsTSWWTfBpsfA+dbdtDxgkr/dDOUlJQfxsdOW6Git1JQRME81qvlyKCgPg9kX
         aL2A==
X-Forwarded-Encrypted: i=1; AJvYcCW1hgwSliBhUB0kAeFcQNRTcGl3MYYaHU7k42nXU4+8wSinbv5fSpAIiARt31z1DECZRMWmjbpyOft7+DqW@vger.kernel.org
X-Gm-Message-State: AOJu0YyBgy5pAx7WyyzvAidi+7cYo822aC9aABrBNUm4eeUjRLxeg2aF
	n/gLdqEsm94fRt/3wnVbpw4Jgl2D3MJZMhCmWCJfuThzuxKFO1YHvu0YIHuj3+pEAIfVz/0r0MB
	afCGF8AlZQwTHLOG1axZKh+rFSviIS3ooKE8W10mCSrYTurA/nsR/bkdb87iZ+0oyRcDN
X-Gm-Gg: AY/fxX41rDXZtnOaN49bZroJEeTlDVoX4pOcOYHuewukVGkXkiJw+qIBfsFiBk2aR3I
	s8LeFftILlDmPIy+JQximpcG9u9+GeNWa5Odn1ACsemm8gBzk42uih5F2siwjeENgkZk7TXWnLS
	z1id1NoNSaNOotgp/YMpeRZATOLqNFliTk7+/isekVdqDhqNUtovAZ/E7tFdd0EQHF55ILShG86
	7kpo2CbPcK8vIpeoYphiH6p3z+CC/k2mdRcC94f33aiHKPLKLq8GzH3pju2GwRz7FiPVbBV6CTM
	/AcvY9h92VhUF7uY/iytsUVCtgH+atOP1gSNU/ZZSDRfaJqc/u7UlRijYGyqC5gL9wZP5O7+o9v
	jwWPzBtJAg0L+iWacKecNqjlMq+z0KZWK8kIa1XVHuMv201o93J7+j6aas3rifJGq+xC9FT+Cp7
	UyY5ePBJ9RDX8gtC1nhgrNWQs=
X-Received: by 2002:ac8:5c8a:0:b0:4ee:ce3:6c9d with SMTP id d75a77b69052e-4f4abcf0bd7mr156435781cf.19.1766418395771;
        Mon, 22 Dec 2025 07:46:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmmqugqQzBG5o7UjHdZltBjI4DfhSKXTIQEZmXsOFv8dArc5Ft/vGe5LQyiJmWDAE0iWQoqg==
X-Received: by 2002:ac8:5c8a:0:b0:4ee:ce3:6c9d with SMTP id d75a77b69052e-4f4abcf0bd7mr156435361cf.19.1766418395229;
        Mon, 22 Dec 2025 07:46:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd7c8sm3175345e87.26.2025.12.22.07.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:46:34 -0800 (PST)
Date: Mon, 22 Dec 2025 17:46:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v4 05/11] drm/msm/mdss: Add support for Kaanapali
Message-ID: <3pgly22pfh3v3oia4svgapp2vqmckun6a5d4dyaljp6lf6ol2f@ddo5akmouzsb>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <20251222102400.1109-6-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222102400.1109-6-yuanjie.yang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694967dc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_XWVza19j1sFB8Qqp28A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: mJFjr1iDZCsTBi_sufze23hf-gia8NEi
X-Proofpoint-GUID: mJFjr1iDZCsTBi_sufze23hf-gia8NEi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE0NCBTYWx0ZWRfX5O4MfriqL0BP
 1qzK7saS1Q2Y2VWJwQKCm7OelPP4Ln9JC1/jb+whYfRScs8iFaP3rnGnj3nPn+DAHUcK/uDg/7q
 IyMxzWtfEegnKAq2EFtuZYmmVqYtfl6OSLoJFEEqZX+MLFFToM1CptwGSIljNR+m0gjPV84XsK5
 R4jNJT9SUK5Kk635Y6WD0hU1owCl8Xei0Ui0yLckDv1N2XOqYqeBJWs5n+NGALUmtCamEjnCJeh
 lDQx/YyG+Cd6IndPn7LP9w+nffCze2aI53Lu04nrh9VioyZHca4c98t7clk3iMgr4GbGHKKjMVX
 GQI0okYQ0T8+rLMGMcszolR5yIllrW9c9ELLA83u9IlQ/v8gA8s3g+sR5x6biwu4ej+NxNZ8rcq
 ZKsgUAfw6sHenH9txkrkC8tPTinbqgrBMAiQ0Mb8RGPnUobiBQXgoC1+pVwlBw8dL24+5sEYFo1
 9ngAeuiZwqZ0jUNE8Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220144

On Mon, Dec 22, 2025 at 06:23:54PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add mdss support for the Qualcomm Kaanapali platform.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

