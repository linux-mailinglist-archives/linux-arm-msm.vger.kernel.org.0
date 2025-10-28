Return-Path: <linux-arm-msm+bounces-79292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD2FC1703F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 05510540EAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6EA357709;
	Tue, 28 Oct 2025 21:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnggW4ue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hrp0wkCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613B13570D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761686743; cv=none; b=s6k+72X2f/O2z4WJ2Rq6LkD045bI8esws00sq8QSw3UqJTVNLCAhDPR/fC1sCy19w85+toDu6PtA2P+RaBMuQTParURMLPs9dqy/oUDiLgMekXRlmawfjysR9xlcDP/S1TfNWSBze5nkdQJSoiBrC/okyB5Fl8wu5gkKPtJSy3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761686743; c=relaxed/simple;
	bh=6tzdUMnBDLHcEGBxx0GStn+k3emUYjHawO50lSO9HWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPD2LFlYmrOE6dNbLnzqyz++hHcDFsTnN/+5I801zBOg7zJx9Yg6u8c1aai2wmYnRJ7EbOet4+4OuuYfCXggspvXjqhHESqpZTMXxs2CH6yA9so78pfMxknbRuaUVPErOvCk/9fb92ODghhKs73oZod4WVhHqIaf8LziEy1xOzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnggW4ue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hrp0wkCj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlQeI2622290
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=buWf0Ypb6OYJRaVhj46HKhwl
	jA+c0LfBLxaOuJMXUF4=; b=TnggW4ueFlJVAw+iErtFvrfcjR0uJa/t/JJVhDMZ
	4i/rjpK4ZspqGXiWtLGp/TfOOLVY1C3+NE1PZRE3NnruanL2pn8JIacL4LPK8QyL
	NhhAE5P8Ji1VbYZL42ORQYoxc6bVtaGuAm3zd/s0EL6NBY8zE984xqQUHABe9Wxl
	7iIrHlHtzdUXjts02Pt2pke/uGNjmt+s8XDbp6IP6ZtY87yJ04FFRJhR70QtBowe
	95RGCM+0wS6cxqQrFPOT3EHTn03vA16oUf3Lcr30YyazdTPFoGh5fE2nrauwbf9d
	XwbAP0LSfhvV1vYrMEy8aUqgqNVPLuRKGbBPmCOGbfP1Jw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a107fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:25:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8a6fc271d46so515655985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761686740; x=1762291540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=buWf0Ypb6OYJRaVhj46HKhwljA+c0LfBLxaOuJMXUF4=;
        b=Hrp0wkCjYiI/m5aij9hL0wb8WhKpV9SZgndri9DP9ySopGEo1MEx+bV0Ny7YaLfoW8
         HRfSv+F0RssYFAgVoLzPqFTV2phrhO+Fkiziz8P5QitmcQRtNsxkA8Lh1PtNMFd49qGX
         sCqMdSA/K+X7zSYDUfsSoC/ZxCJgNz7ukZozPG0X/Oa93d8SpOmPSYKoUC5xa6lmBY7k
         DQyphQ4olo0Eq/2VCzhaySBEm5AXwa5nKvu4DoOuyiRUzaMCezc8V+4JLkOWY6V8tQR4
         H6FMYflZmaXDh/ckC8K72ZZfgYTHUOQWUP9KG1mN/Dhg065mt+4BTJNm1EV67P4z6/7p
         gpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761686740; x=1762291540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buWf0Ypb6OYJRaVhj46HKhwljA+c0LfBLxaOuJMXUF4=;
        b=cm8qFJlNRcqTYy3kJ8bdVvE0tYokR7Woh6cljkU00FI/quSMrBxGgLjOCZjMMpAzTS
         7/6X4iH9X3le5N+mm0r6uJ9bRA8ah2MVXbHhJ2eFbnVZxBJb0/4hdoTjYsRTG1lIANdx
         AUILozpUc+6kUCsKrvtEUWQUq/SVVhGEyR2JFG1q//B7KXLRbXCPId7IHMcooPmNRIE8
         JzVZiLVeq3sEB+V/DuZHwx6OWBjlw9K/1D4R+CAGuv74yR1SLFmm6E9f3v9Th6c0z1YS
         Nj/Ocw7e+ANpBZaJKirJVihIWCEjc+bSCbbj8elmxsmjKkJ0CQ/hquJp0SGSDdUYqKtr
         f8DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZS4fSWNNPtUUubaXXBYLZ5A8lS/oQOvvv/Ln4o+gIv+RTi6s5rixMVYjPyhm1QwZeY63qVE88OEiu7gk8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh6tgHFMhrr3Q7XAgo0VkRZVLL4y4XUXp2QAvDAbPzZ1za96tj
	bcv5t5xM/Je/vQJsigZMVdjAY7iKRjPdbn60x2DYFD1tFElshfeC7TlTr8B7CHh1L5HyLJTJzbL
	v/hGDjthXRQ0K/RNFLq8jpCKExjK64tKkHHfb2GOxp7b+6PU85HLTLFel8zrfoYL3YUeA
X-Gm-Gg: ASbGncuJWGALb9aFR8de6518KLi/Y3pVivf9sITkYuBaZEA6depMmSUjwIFtKF1nHen
	X6zyKDOb8fFrg5yJLvwL4JbcDy3k/h9p2wwjtzrPfDeBZsftscvYD+M8Tngxg/DjRuReVkORKfO
	LevzY77RzAOUWV2z6P6spusL57tYrBhBCQeVgP13wwRCA09Sexcrf/Z1N95gnsuXzIusKQzg5G9
	4Q3jXedXGvgLcb2vv0PyAVBwrZVq+83k+ArbVldWohm9yCl31EdRDBteD1GitUmsA+uPQfZ3xUd
	vwZFRv1qlxS47sqhrjn+Hr3I0WpU8/nJDdIFiBZ8jfXebbXqKgK3/dX62AoKS7l/hOrZ+vliTI6
	X8QnHrAaHcyyPfwxrJIcOaZf0vqjJZub0rxhwGgoeTd4FlLpULyFX9HvjDlxqb69+yEBd5+N8oL
	woxtsj1kPHMAsm
X-Received: by 2002:ac8:6909:0:b0:4e8:a560:d96b with SMTP id d75a77b69052e-4ed15c020b2mr10948351cf.41.1761686740421;
        Tue, 28 Oct 2025 14:25:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO5pCJUeWKODo7AqcDXtB24CKjFMyBTZ3ZE99nuuxHRCx3zn3Hq6WfRARXUseSiFF6FSGTDQ==
X-Received: by 2002:ac8:6909:0:b0:4e8:a560:d96b with SMTP id d75a77b69052e-4ed15c020b2mr10948011cf.41.1761686739982;
        Tue, 28 Oct 2025 14:25:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f8471csm3295318e87.106.2025.10.28.14.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:25:39 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:25:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] drm/msm/dpu: Disable scaling for unsupported scaler
 types
Message-ID: <a56tw3xxxn5u54hs4pt64b5ljlp26x23lvftu2tblwpvuzx5xh@quyr7xyn7sn6>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251017-b4-dpu-fixes-v1-3-40ce5993eeb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-b4-dpu-fixes-v1-3-40ce5993eeb6@gmail.com>
X-Proofpoint-GUID: w3WulCojMOuYRRlhC6kbUteuUUsnARZK
X-Proofpoint-ORIG-GUID: w3WulCojMOuYRRlhC6kbUteuUUsnARZK
X-Authority-Analysis: v=2.4 cv=A5dh/qWG c=1 sm=1 tr=0 ts=690134d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=LqUZSzWJFxV8yDGbkgcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfX2LkzyTCohkHK
 kJJtEF+PUvh37cHMkW5Q7k8CYi8OHvb44cWOE9pI4u7IAhQBBzAcU+ut3qPCWMSilY7SDK+Zvt8
 lvnQWaLSLXl6OClGM7sMwv0EihIVuu4Knu9FUMdEcWglxV+SEALIW82WhQ0lNJH/k13/P+v8kaj
 PSBL82IHKXuZ06xotShc+QP0AjFQ90OB/auf3iU+VBjDKPGQnYlgI0MIoF3KoDjgHxHE1YGkEba
 QSi1gmSHth4O6+CrtsCFH9VCmEEVDpz3CZfcnXTsQGcj+nxS2AIfuYefqLLhyeqRDqHt39AGopZ
 OpfqhIvxY0tUWZdz4ZdrwVIS0ac4KcRJuRGBHd6dgpjIU93iSwL3kAakwWI9GGX5L9QwpEOM0G2
 65xCji1dDJLDf8DvkNW4U69fWlAhwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280180

On Fri, Oct 17, 2025 at 07:58:37PM +0000, Vladimir Lypak wrote:
> Scaling is not implemented for some type of scalers (QSEED2 and RGB) but
> it was unintentionally re-enabled with change below. The remaining
> condition in dpu_plane_atomic_check_pipe is not enough because it only
> checks for length of scaler block (which is present). This patch adds a
> additional check for setup_scaler operation.

Nit: in future please refrain from using constructions like 'This patch
makes foo' (see Documentation/process/submitting-patches.rst).

For this patch:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Fixes: 8f15005783b8 ("drm/msm/dpu: move scaling limitations out of the hw_catalog")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

