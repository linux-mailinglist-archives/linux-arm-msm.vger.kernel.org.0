Return-Path: <linux-arm-msm+bounces-88153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CF6D06CDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 03:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BA05300B9BF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 02:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77A9267714;
	Fri,  9 Jan 2026 02:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADVLehNN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPDuoy7F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F49C1DE3B7
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 02:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767924719; cv=none; b=KJuKiJUf/LkCJaHuLTMYM2mUU6u9WXqTBQwcTXzR4DAni6VffUvOu2TjKQ4dsRhc5naYzhYz6loE9Uilnav6t5YY4Ir2trQnqDhHYDKx1fkWTozSxVVFlajetQLLRdwmm2nmINgXkVD+EKO0M/NB+M/vTeY/gzlQb3He5M5ZEw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767924719; c=relaxed/simple;
	bh=wbxwVDIO4m+Swdu7LtaX4KKf5DaSXcltrbIRf/kykqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHTiZTVnz+/Vvt/aQ2oCPSUOv82XbORrWFqOuZ5R8Q4D/fNyH5cppnBq/Gk6v7V41FRWW7LsxNRBzGQZfYtfCUOesloLX24ynTwx7mWCHT4HmvElR/rxzAXFau03Fta9EEgeqgRl520C7EN2aBOSCNCjNLmLhqW+COpxsAtNqeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADVLehNN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPDuoy7F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Hk98h3165855
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 02:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AbPapbWjEtwG0ngR4Zig8WPJ
	PQw5W5mPOIGiGu1uXZw=; b=ADVLehNNl+8jyFf0GRZ3s6iaYTT3nffdDjdGMhBU
	A2jHJ1K6haA3OBTISrMhe2d5n45YWPcbivd82w3z4zyXYOKgILefQUMSx5BWO2XG
	MSHnrEj+lU/PIfl4zUjhOWUUNGEYaetunbor9QkuHzv+MEN8gALAoWIRhRe4xhQ5
	B7b/EMzU0DhVR4hHlFK5o8OCWaqm/vp69yzHCYokT7BknbhOE6KFwp1mu+KWQM0X
	N+u4WkLRLJEuEHnY/TgQqPre/pUD4HDZIlpOFgbztqpFv8vH42zXc0yksrjn3UEH
	Sof1MBbz2lNry+d2807mnqEaU+30elOxsOdumGtN8GkNIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj89235y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 02:11:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b1d8f56e24so967067585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 18:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767924717; x=1768529517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AbPapbWjEtwG0ngR4Zig8WPJPQw5W5mPOIGiGu1uXZw=;
        b=jPDuoy7FdQjoRDe5TWMVu+5pOgQIjlrsev//XadrTLCH/01qSD7wafG58+Xczd6Qww
         YPKvkFMWt4JF5DraYDYREtfmPJvGiq5H7NomWpz/n2vcjF3hiwZ8pqgKsUAVAQ1L09+d
         sl/E0PBJykykL5oM+5LlH/Yz8PQvDtzWskLq/8p+fs96GYJNALbnB9HMcImZ6fZlK9Pm
         SAyp/u9IdpotSd1vNqIjtiFsx0KzeUt4xeg2ZrtN3ml1r9aW9X6nZ69U9xFOM9DFf/4H
         IPADSJ/E3kRmrffrB1mih9d2wM8ZJybAGgJ1vUgxltMIFsSC6PJfHUmqdw/keRthO/g0
         6IZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767924717; x=1768529517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbPapbWjEtwG0ngR4Zig8WPJPQw5W5mPOIGiGu1uXZw=;
        b=vyTmjp9AmwguzJHDKduuxMRSucPi+ZedRl1JHeOkpsGve3gfIfmSFrZGVDkUmsMj35
         j5ZAy4FkXQ0R4ueMvViyiJuDlw+eM7T6DuSBxXHncqybxP4nAYmpDuB/vk+Lwa0BawUx
         83IcygNT3hSbHAccmrCggPfNHcufF6pQSdJ49VXCfDVmy5Y24O6ZGg06C7nBmEg2x7WB
         nmaqORYi8hVAPPtpGLVZ3T1sg7Ur9WcfbbelIlbdemmtDsD7NuKF9xR3epW28dqdvx5J
         tE3sb9uFTVWZ7z8RQAh+oyhWdHahJu+wiqZsbe/XxzyQtUkyzreYtnSh8N0R8s6NJa93
         dkMA==
X-Forwarded-Encrypted: i=1; AJvYcCVAmvTT+UPY4irdi+DTrEt3hSyR6sd0+7e8l8+86mIsFD9gNK6Th1tXVscg2lMqR9xGNhxTHsxyYhvw6srj@vger.kernel.org
X-Gm-Message-State: AOJu0YwzeYMGltI1Xa71lbQVef5eAtnsf9MSSmIdT7QRP9dgBKBxFVuU
	lDZgQygVu0OsjXbmFYTrlJZ7g8jhMRs1IuH0qwbJUHXtAcbmOrn3jN9GoTuDQdrWzZVEf09J7IA
	Jb17gZVMlq+43Weqb9nTvNifExY2N4/roJwOe9BUWrNwwRMu44XPgjMEIXROOOVqYGgFh
X-Gm-Gg: AY/fxX5o8TqNPfqkelbdPmiDCTQgMeEVWdLJByM2e8amY2bS0O7KeCN64lOIPS8xyU4
	OgQI9r1vqoEgoAUPzazmkFVa82f9NuPNdjOym6JD18QZxALQUdaEFMtKM/rcOt4rgr0bnN8c8ca
	RZWr0VrMzOFLUo/2uLQiHXgUoIQwwnQcl1+CGv8bUBvr5Xx5aHPi8qkMZDrGoukHK1FzwFoZD+z
	EMoEQXDW1p5ZmzqEHTqcBMlqWQzco72TrzKOZkF/8QdovNnJv0l4j1CrE10LO9WOCAXIPzXRdoN
	47D6oDV4E8/Ia9CRp/RK/1rSGkRZTsrzGl1Q6/zzwHf9qbczO+JhX/xeT8TU5ByvnynM872gMlu
	AoUFP6CnotvyLUGmXRS3v1EZVovxvcVoRQlhMCM2IT4uS6ydsEJYnglPo+elvMf5sxu9ZUwnnjR
	0P2rH5esHM16K9g72V9rxyNn8=
X-Received: by 2002:a05:620a:25ce:b0:8be:64e5:52ab with SMTP id af79cd13be357-8c3893f7d16mr1047451385a.60.1767924716652;
        Thu, 08 Jan 2026 18:11:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaOpEi3tRshyFmUISjNyEsVcsEClu5A7WlBIFPE6bvDk+VIq/dWLqQca2+qps42a3ubPt6eg==
X-Received: by 2002:a05:620a:25ce:b0:8be:64e5:52ab with SMTP id af79cd13be357-8c3893f7d16mr1047449085a.60.1767924716182;
        Thu, 08 Jan 2026 18:11:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8a9bddsm20328181fa.25.2026.01.08.18.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:11:54 -0800 (PST)
Date: Fri, 9 Jan 2026 04:11:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kery Qi <qikeyu2017@gmail.com>
Cc: robin.clark@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: vid: guard hw_pp before accessing merge_3d
Message-ID: <pnfgtaze7hl2gsnytzgcqxo4we6emhyyh7u6b4uv7xskrs6uzc@44htg4tako4v>
References: <20260108213634.1905-1-qikeyu2017@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108213634.1905-1-qikeyu2017@gmail.com>
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=696063ed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=PWMy9OdgYKYvia0LldkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RgJo1kdlsXCsqqz12VJ53viYTONo4lze
X-Proofpoint-GUID: RgJo1kdlsXCsqqz12VJ53viYTONo4lze
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMiBTYWx0ZWRfXxCUvJ7yw3WoV
 9bM1X2+i6BWMUBy2J1OEei/tNl00+rEfgK/OK2lN7rd7f/Z1OSak0fPDF/5zymGMmcOFlMN3Dbj
 Ioilgphf5azDL13pT0ZryL8Woai/Ywvz8vqnre5pcwtLuNG13SSMttU2/WKTdy71J674rwJmW9V
 y/ptPrnyBrG6pR+DJw6RKLXgL4XZfh//rYjaNxmOgZUIu7smwRlxgLI38ZYnYkQ69RAA4Hh9TGU
 a8rV/kxKR8XDVg1M2BcQMrdQl54LuUJ0ySvCSBap6usEm/SQ3VOSHUM1F49ECpk4GdpTc59NE93
 g6yjPQ9LQPAIpsSLFfzz2Vzpoh2OHhKdPvkEofde1AP4RefJIXIeU4MiV/avKw5Fg7mDYqvtSq6
 ZF9/uaCXEAV4dhPEVv7ZjPgBFcoM/4SdD9gfBjbex4JC4SlhBGEx6pqFRiSutBprwF4mbGmr5xU
 ldZzqHrqEa1MqZ9m1xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090012

On Fri, Jan 09, 2026 at 05:36:34AM +0800, Kery Qi wrote:
> dpu_encoder_phys_vid_setup_timing_engine() dereferences phys_enc->hw_pp
> when checking/using the merge_3d block.
> 
> hw_pp is not guaranteed to be present for a video phys encoder until the
> virtual encoder atomic_mode_set path assigns it. If this function is
> reached on an error/unwind path (or after a partial setup) before hw_pp is
> assigned, the merge_3d checks can trigger a NULL pointer dereference and
> crash the kernel.
> 
> Guard merge_3d accesses with a hw_pp NULL check.

This function is only called from dpu_encoder_phys_vid_enable(), which
is a part of atomic_enable() path. at this point all non-optional
resources are already assigned.

> 
> Fixes: f87f3b80abaf ("drm/msm/dpu: don't always program merge_3d block")
> Fixes: dfa35bac9930 ("drm/msm/dpu: use struct dpu_hw_merge_3d in dpu_hw_pingpong")
> Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
-- 
With best wishes
Dmitry

