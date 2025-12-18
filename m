Return-Path: <linux-arm-msm+bounces-85689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68435CCBD42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A01153016DF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E888332E735;
	Thu, 18 Dec 2025 12:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghLMNOLF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5utgGKt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA25325708
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766061889; cv=none; b=Tix5o9EShRlMDEUjx/XrDeNTxjYnTWt+XWBmRk1sHofDqISoNULM4J3FNIldGElvkuW7OxV84QyeHfW4/jPjz9vW5jZtmB7gl5/Z2WUSZ1ycnRAXiGY5is4Bfi5Gk5e9CuygG6xtZrgQQ7MRhFKX02rro2zatwDFlFpfsijD+pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766061889; c=relaxed/simple;
	bh=aHvla4IhhUhsOwt+mUUG6s2cj22BCSmUyBASQ+gZDxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8rx31oUAgGu1d7lVbmM5XjFlTRM1QjCFckQIOPMG+n4vijNhNzc9j0toGeV6RHYPfZ2sEgNbpZsHoBqDee/iiVa8ZQZ8IAYNHZCRAQAUFiHdrnE4FUYEHM5az4OWyBLC7jO3P5hOqMuYbZsQICa8kzrloH1seaUHfxGzJiqHzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghLMNOLF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5utgGKt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI95iHW237285
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vkp2NN+Wc+3qSMFRrBVcAE+6
	j4YuYUXtFj2q0Wb/h6s=; b=ghLMNOLFspgD2NgKfR3QZC1ziO5dXZr4jls8vYxi
	4HMcGbRkLNwX0Ype/SmKmKQqzZs0fDKD8qLivYCeOKNAAc/vsszcRIFJl5J1hyq8
	CWLBS+rbTq5GKkV8k6ChjW4JoXozstqymU07S2twMKqBPjCQrFgULrmV9rmLOAq8
	IckJufUnbZmH9nYz5pq3P58d/R6SZ1y8j1CQPwwEPg0LAqn/sP1SCnHDw0mCW2e1
	vTKqID5BORCVOL9uvEuuUsQeDZ+L8uTT11jrm2PjQl1cN1CVtYgdO1keBTS/0G9F
	W277MBsjQjkGpJQaQHk9fI5GGfFDmSuKBKUAwmuuWT5buA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3jdcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:44:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4a5dba954so4773771cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 04:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766061887; x=1766666687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vkp2NN+Wc+3qSMFRrBVcAE+6j4YuYUXtFj2q0Wb/h6s=;
        b=D5utgGKtQp+dveNAmbRKTeZqzAiuh1A4M5Fq+DrjCpMRqqcLo6WEtVNBz6FhnpRt96
         tvQQEagCy9kKk3uqKfU+mGwH+0EsBPkVCqI8WHR0kIqJE64G4ib2PGYck/NQoLJOOmNA
         t5TbfLMgom0p98hg783GVBVta/ZKKrpQ9c1q4RwkSvHzAZrcvnzqPNuCrDKcsP4IdDgv
         izTcIoJsKO7ij0XepUZvXuumg8GHud1o7RsISjbhGsOyffKL8Qpy5GWkUU1yNtHUR5vY
         w+09NElLWbfAeIXptv403AFi4hKa/Y7ghL4fXl96B56Gh2O+t6+Pgk6R+N/3zDUvxYdC
         1HmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061887; x=1766666687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vkp2NN+Wc+3qSMFRrBVcAE+6j4YuYUXtFj2q0Wb/h6s=;
        b=tYqYBUnT4b9JgZjKpE72pqJK2imqw9m55mkA1Y4puYCAwTxPt/dmqN/G1K3Z6VNP/y
         f9CwcRoh8zPSmb+OkohTAIjKc9MV5IyEXqKMryo4jIxAEGvfnjadUQV/B5uQ/lmwonAw
         G3INWPkD8UDMJJ7CGZlFIkBDPbooeSuhfHeXECq02CFoijxEhXLNLRWPt0ACZHgSy3Kl
         PlwzE4OtqVSL+bKKF+1DpGiXbBtP/Ul3Rs89RxGyStb8EaekTXQhMkXXkR0suh4YPqiE
         9loTc+FyQTmll/8o0/9UAUIC0bNniVibtpn+mdNnJT7kW06PrzaAiag67SgByd6o0QuE
         UilA==
X-Forwarded-Encrypted: i=1; AJvYcCUZmlXryBy1BJfBDlX/qqrwEY3i9eMyh8qMc9PNMhEV75y8EUdQ4QKElZ6OASYg8MgEd/uMGPxhpZ5F78j0@vger.kernel.org
X-Gm-Message-State: AOJu0YzndStt8G58622hUQGVOLwND8s4nBgOsEtZqSP5xJ1d5a8/d7U4
	39qzQcr5DVjIWGx/XncaLdOhSoU06AQ16yvCBPd83p+Bst4Fri5fVKpZ0rJQYneNCUN9x55R5Oz
	/p5VPOXfpJwAm7BbP8N1ijBIpumhONU0pGBzApPt7nhAXZOb0JLMBtwTFLfPP5sKUYcv6
X-Gm-Gg: AY/fxX5yxjOCESX75hpp8HSF2zUCz9f91vKRJAxqIvbh3Hec/+bx1xTrrwqc1nhcAzS
	ZP/H/fFTtxXTFyvEt5Y09UfMMXhg0TxbEslqdgoiK6wC5VjiXFR9ORl+7x3bZ6FXrThlf3U03X7
	1chfo54YfeKPVAf9x9/dpibx0Z8P1MxctUdDli4Zj9kQFkBRP0G6DHK3w4TK8sC3zv3HNhVIf+c
	GlN8GRJfIUhMA4f7UjGT9QVXXpcjihrLuB4InXaus+PonHt4wOBMa10GZYTyeq7l0ReeNA5hOiN
	RDwrLxUpPPgkaC5TIne0b0ejtGuYaHL1tmbfSFwXtMhRTIutidPSEm/roNDq0LzAoTLdH9oI1Jw
	fEDMmZp4ylYd2OMzq002Dhw==
X-Received: by 2002:ac8:7fc6:0:b0:4ee:173e:c73 with SMTP id d75a77b69052e-4f1d05dba12mr324702311cf.60.1766061886472;
        Thu, 18 Dec 2025 04:44:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkZvbwBL+XyDVvkuteQhWXC1sY/ZsY3GEvrYK/oeHlYP+ivcs9f0Xe75FewxfvYvy1hDenDw==
X-Received: by 2002:ac8:7fc6:0:b0:4ee:173e:c73 with SMTP id d75a77b69052e-4f1d05dba12mr324701771cf.60.1766061885772;
        Thu, 18 Dec 2025 04:44:45 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b5887d4a0sm2340823a12.23.2025.12.18.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:44:45 -0800 (PST)
Date: Thu, 18 Dec 2025 14:44:43 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 09/10] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <z75wnahrp7lrl5yhfdysr3np3qrs6xti2i4otkng4ex3blfgrx@xyiucge3xykb>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwNSBTYWx0ZWRfX7pz0uTVTEs7y
 VwzwdqRT1RQ53Ptvalqz9jLyfJeR1+QHMiTjnFqiHQrHNRRFcDan5qoe+rwM5pvz5YNsfBEGqkH
 2RMwtbjGNPXWdnUTBSC9HAdguJ/+BIY9oBYhRzVHJ4fmaRDaE96udc7gnP3T6ekrwYtgyWrP3CY
 5/7rlwY/szA6wt8cfNT6XRd8bEZSd99+3ZSN0T/xvqVtzreDtVgQTLYZDraOCshSjI2OHSGMT7r
 t29K7hjqcxJ6USfmqyF2hskJwktjIv/93bWAwKXTdOzZrjC4DSx9drNREHfQZC+E9ApKq5C8zpJ
 KHmQfOe64DljpGSP8U410QhGkyYuMZAkdOozUyiI929/+phH6TaFg8iijJlPVtUa20OiY7yj4Zu
 2991Ne0/saa03JB19my7BcXNl15CdA==
X-Proofpoint-GUID: Zqi4RrJFWBlZs52UhdYW81zGyTFg9iTG
X-Proofpoint-ORIG-GUID: Zqi4RrJFWBlZs52UhdYW81zGyTFg9iTG
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=6943f73f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1DU0rzas2IhrWo4RnhEA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180105

On 25-09-18 21:29:01, Jun Nie wrote:
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair in quad-pipe case, thus a LM pair should not blend any content
> that cross the half of screen in this case. Clip plane into pipes per
> left and right half screen ROI if topology is quad pipe case.
> 
> The clipped rectangle on every half of screen is futher handled by two
> pipes if its width exceeds a limit for a single pipe.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

At least on Hamoa based devices (CRD and xps13) I have been seeing on every
boot the following:

arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x3d0023, cbfrsynra=0x1c00, cb=13
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1c00
arm-smmu 15000000.iommu: FSYNR0 = 003d0023 [S1CBNDX=61 PNU PLVL=3]

Also there are some artifacts on eDP (no DP connected) on the xps13 with 2880x1800
(LGD 134WT1) panel. Not on CRD though.

Reverting this commit fixes it:
5978864e34b6 ("drm/msm/dpu: support plane splitting in quad-pipe case")

Discussing this off-list with Dmitry and Konrad, the conclusion was that
both this plus following commit should be reverted for the time being:

d7ec9366b15c ("drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case")

