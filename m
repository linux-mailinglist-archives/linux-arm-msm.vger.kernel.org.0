Return-Path: <linux-arm-msm+bounces-67737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0D9B1AD93
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 07:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C2623B2C92
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 05:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2A820A5EA;
	Tue,  5 Aug 2025 05:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6m1CGtr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168362904
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 05:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754371331; cv=none; b=i//dQxBFiOwEEXA78NvYsKajYs25PfWlQssu6TGe5BwMRpcgeSFHi+DAH1+dhKt2dBRuhmqRpuiVjbb5vdkGs9lxoNNZwTlTmFvR7zB5iVgCFGD3EUPk+8Rkiju0xl3bONFDrA6kmg1ztfF9XKWGEHWq3kWXfmqvPL5i+ytgu1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754371331; c=relaxed/simple;
	bh=n0hJY4w1kDyeyT48tVdbgBIl+jSvO4TXWsC4olFT8nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGfU7oUxKfb/mSHaaxsxHc/Chn7Kwki0AAsvrrBt8JhNFMwRQZPVifetPzzKs6tJDUR9TD+tc/oRKLTlQd+LAS/8WP29YkOwU9KVmSB2F5HRfutnDA53nJ/ON2A7BU9OB4N2p+CA1ZipY8CV28z+/XBOivQKCTO2gXx8ZhmACCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6m1CGtr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574K3Lh5003472
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 05:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U6r0duZ6z0j4LUAgrh0bZTc8
	SiFlhfG4hKd7EE2kjRo=; b=d6m1CGtrMlUPqNuTjx/N7iJyEjn9bdFB44lpZj/K
	0uMWGz8jyJ0HsVb5sWsQMtIpJN/COLnanaHgqOjjDyuekrAlFCqZu2qbeGVaMNeC
	m5hNiYN7eOi3CYLG74LnLURYqfLNEYw/vPJJ8AB1w97fdxzwQEsn9pTOhAnudcNK
	a2hI11jrp25AEzW78T6Z46w3HDLmAWyHsWYVkLxAq6SfzLKrXDDvIAp/zrpVgYDi
	PPqYuC0J9ALzDjg8wUrL6oad4ZVeRi9ByZlP1E+bUFenf+wziI0vSX2b1wxdbjfd
	WvG9rD9VjZuw5tbFLJYbtMWk4q+UPcJCzlRdxwwtovhwiA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b3j3s4hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 05:22:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b068c25f04so36676791cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 22:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754371327; x=1754976127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6r0duZ6z0j4LUAgrh0bZTc8SiFlhfG4hKd7EE2kjRo=;
        b=SWDYyZaGdBD/6hDQFDaJH3GFdz69r11I2XvovwUPX+UtidNDyirpVRslsZeAd94iZQ
         1sYkTF8oaZ1zIYGY7Qsuh0GKfhgcD9wqyBUouGtUElEs1IlpUJZ3yYw23jnk6/wSRL7u
         oz7NAu+5TNOJ+ZwvqUZXidvKQW619Sc21RNOQ6SWVGcYb9KI4Xiexb0JazOFwAoJ4Q3y
         erFQycxnDRULpadcgMKPPFR4DZtjh6ELHCcdCWhEB/uBjzK/LFcZxHfDfAuI1ISdu/54
         wP2+hFksiQhoLqZUP5G+s5GfhVv2mFA5SiQDeXq1VEvrXq2l7gNZ402saA7z0uAA82r+
         TCgA==
X-Forwarded-Encrypted: i=1; AJvYcCVeM4607j3i4kpOijwhjq1XYk2uMiqkBsf5KbmPU+SisTnMIJB8ZLcYCAEMSKd4HEmubbE1sCGwglHif9Ox@vger.kernel.org
X-Gm-Message-State: AOJu0YyXp6cGPAfoDa0nlRTecfqeMp8vZddnOZ3nBMjhWnjHhNK1sSVS
	YvQtToeL9iXSGbf2d3ScibU9Q70g+sCg64Rjmm1PXQZ2p/Bebw0ErbWUCkMfnGEm67QuO1JfZDw
	dHwivqUkd1Mp90bOhZ5d3rux66wj4RFXznI3jVmDRBA3RtKr45eboZfz8Wnmnl5eZPPjb
X-Gm-Gg: ASbGncuwMX5fOGoH9lUjwD993nwxPtpruRDGP1NetvdEBPSqz8CwT6lJAbJqsvdBAXg
	BSVBUelo6mTjJGrv/fQnuQ3LYKodR7+LfAKsr0lPjZbWYFP8tp4Z69s1hfHqzF4AOqQ54toavW8
	IKL07z+TgiIoNI/inurfWV/FBgheh2Lisow+NP5x9bhfHm4KB8werYrGoxP/YLxgDkY/joksC/h
	vagzw5VsZMIEr2s1stjA3UxJemqC4Ux74Vq+uoHGOB9AzltUrWgMFNq3ztj0IeVZajz4clFZ6lv
	2uaSVRoYBJp/zJ1x5CMlPO8jLGqsp5NwD3j8VNS5MNN9cBF+MT5NUojJainwtpdJT7SY0ZkjXUS
	aNZQvRJGFz0zfGjMJUfOxadbEdSSowU4tE1wuBDxea6F1zhz92Ab8
X-Received: by 2002:ac8:7d12:0:b0:4ae:cc49:e9ac with SMTP id d75a77b69052e-4b07fae5b1bmr39730291cf.29.1754371326736;
        Mon, 04 Aug 2025 22:22:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5FJGvEMEVRGjBRQoDRmCsXP+IaAhppJskHK2nnNuEQyHdtWleUEx2knWsRZd8WEk2HmV6YA==
X-Received: by 2002:ac8:7d12:0:b0:4ae:cc49:e9ac with SMTP id d75a77b69052e-4b07fae5b1bmr39730161cf.29.1754371326307;
        Mon, 04 Aug 2025 22:22:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889ac341sm1797075e87.60.2025.08.04.22.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 22:22:05 -0700 (PDT)
Date: Tue, 5 Aug 2025 08:22:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
Message-ID: <bnlnz6nz3eotle2mlhhhk7pmnpw5mjxl4efyvcmgzfwl4vzgg3@4x4og6dlg43n>
References: <20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com>
X-Proofpoint-GUID: xCXtyqTmg-aK92Lp_fJZsmQ_6SvLQ_Uu
X-Authority-Analysis: v=2.4 cv=TZ+WtQQh c=1 sm=1 tr=0 ts=68919500 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=TWSoFropmgQjW9t56BUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAzNiBTYWx0ZWRfX4Qhwh2Tq2hYB
 gwq0eUYIDsF3uyXb/ABPz8eqJVyFPnHc6IUx/ONkroPbSiIGSziqoP3JJ2H+pnzYEM8qUa2ePNN
 HQhK+NuE0kwQ6EDy9vSotJybG5sHr52ooyf7lPwa7UJUvjk91XMaj5u06/dmXsPza8+1ynOd3nq
 5U7XJnoY2vIxKgDwjvMfYTYzlaNsDUitvxwBbp3wZfgeVtudR7Lajpc2tLGcV7rutxtAwcjO8Op
 /o4KupFbjPQhdZrGdjQIj/r8WBWlO3lHn2lfKMburfmeMq5geGeyCyKBlhl6SCEjCWS4WcJEz+J
 U/psJVBgGTB50YCR9k6EqAZTjFDruUtY5OQCz4as6r4ynLDRN9lzlWKD3FUt6VbF5pRDSIqe0BW
 Ef2cLOTzf9ZlOYTQByltIURHVfyKhgKJt5F+oZ72fCYe3MnxBr8R20Iq9vB8tmescnAgsa0d
X-Proofpoint-ORIG-GUID: xCXtyqTmg-aK92Lp_fJZsmQ_6SvLQ_Uu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=971
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050036

On Mon, Aug 04, 2025 at 11:59:21PM +0530, Taniya Das wrote:
> gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
> boot. This happens due to the floor_ops tries to update the rcg
> configuration even if the clock is not enabled.

This has been working for other platforms (I see Milos, SAR2130P,
SM6375, SC8280XP, SM8550, SM8650 using shared ops, all other platforms
seem to use non-shared ops). What's the difference? Should we switch all
platforms? Is it related to the hypervisor?

> The shared_floor_ops ensures that the new parent configuration is
> cached in the parked_cfg in the case where the clock is off.
> 
> Ensure to use the ops for the other SDCC clock instances as well.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qcs615.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

