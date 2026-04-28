Return-Path: <linux-arm-msm+bounces-104992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPz9BBSw8GkfXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:03:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D638E48574B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D1B3308534C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8A044102A;
	Tue, 28 Apr 2026 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AaXsBEdG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h2VdBa9g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DB243E9D2
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380693; cv=none; b=U74sz047AQ5uYUvTkNt3knQaaV5lRyndzS43zHXM4TD65E1IbCd7PXW/HXTEj7xGU6Hte0d0iwdhKTH3omni1Et8t4tXtf92ecTTC0n9oYiXvi8eR1KV0tT4GvFuSVs1AiQUBDqT5wG1goRY/qYmprjY2syCIQHwnDQGoTkoVp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380693; c=relaxed/simple;
	bh=DLG9cd84eMTQRY9d3GsWQEOz9qP7OuVsz5ozgsGvlLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9VylHQACejk83OClR5jTnjL9P02Gojf6gKDRDugIebzNyqqRiI/nWKnpuP+XMlagvRgpskbnEZWH2MTJ8QMkVeQKFL8iq7GWVYKcxF2WGcM7ShEH9kTFHZvZUxA2f0nCie3Mjpf+cp2U+JzEyG5zJKq9t329rUc+rWwJtnlsRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AaXsBEdG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h2VdBa9g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAhWxr819296
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=32t3b21r1KQk2fgkjfbu0iKT
	hIYQpu1nQvpOz4FMAcc=; b=AaXsBEdGC5H4uhwWSyMgzFjAfiYYKeTWlcdO4BnB
	CFqezHNd9YGUoU+HnH17XAaDGiMRMqdyyQ77ekAC5MsOFUaE/U/xOCp6BG9J3fc5
	5dvlQ28UXObRBG+ZoIIc9Qm6qP+XSIgQPwhqE4S+nEp2HNq5OEANCNDUOWlGkCO4
	2c0oIeYVBU4IjPs7QVobdnfrHKiGaD7FR/hBuMN059SpvXT1EpcgfQFBS1cWWgUZ
	I+w9kdRlYZaJ6EROpcJWQiSKbUVnZq9GLJwoq94KHNVKluiYGliKAU6guwkBSwhh
	KWF08wT9gJoDVHa5o77118ESg1mURhwycjvA+F6OLfambA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtud20e9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:51:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50da31af14cso301192851cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777380688; x=1777985488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=32t3b21r1KQk2fgkjfbu0iKThIYQpu1nQvpOz4FMAcc=;
        b=h2VdBa9gm8OkRBIgE4PMVjc+SABzTNdwBVH72NURU7L4yok1uwlYlj2XO+pmaynBH9
         mdJw0vv5ZiF1vXPNMq7cIVBaJvZpBU0oGFszIG7BozLnzZ2w6o/zCnLn0mBQWlibkJ7z
         TLgqipaa6ZZJsZgDcqhUyvWBeyW8uyfi7o7CeMLF/y5p5tejYCotmrgx5D1okwXVa0Zb
         70wrmlgxmmY0aa2JFeBNsUAbKpIGZi+VhVyrpoNn3PXYIqag/02pZyXj0gtA6wUgMMuA
         ceUExrkTCVwMhtpCcxOIlDIuCbVY4KR+LgzMSWn/wJNlzyXPSvr7fHmfnZ69ZiV7k0bk
         81vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380688; x=1777985488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32t3b21r1KQk2fgkjfbu0iKThIYQpu1nQvpOz4FMAcc=;
        b=sRXDy+k1YqG9JPlhK8wULss7FWwgDwqekRWD3wIXxl1xTN8RG0pMZrGRFNR4/VMw97
         chxdJHTr/6uFwQ1Gek/aBS/ulWKLe/MSaLHw5znPCnvXxDG25S/wRc9Z4+BbhBqGWTij
         RPL4Ap5VIKmXLgT0ToIBWGLogC412F7fhdouzgJxkuqd4MbfS3waxg/yRfboqplusO1o
         Pi1pJzYpnR/uf2AX7Aq+igQxxopOQItu6fWPHuACnzEanJQcR09LIopNN85ulWS9HLDh
         J2rdIkl+ZC7wIotRJfXJXaAtCvnUvzliSR5GD5jSWX6XJ16V1HtHQb8bmg/CTOM8gLaX
         TUYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ywRiVA9AJDf6nNGJgM2ReLEs1/1x2c9Wn001SB3Q3w2bBeUfm2ysjEBZnOrhiLlP7bXdGTT9ePFuGoCL4@vger.kernel.org
X-Gm-Message-State: AOJu0YyC5sH5rTXMiLVedD91c/w0ZPiApWYUqQc7MFRJ5jPnXX0YwR3x
	dxWt2zelXgO43Cjk0Wots9YdJXLwq47QKdYPrRXZbVQ0ICV0jZK+T6VQzYY0KdVOw5oHdxa6IvY
	NNGxVlRYKZT75IBzDay8TUBqyD+fW1c03eteUWdAC+BsW8MHQrGh0yqaQ0OOPQAew8Cbp
X-Gm-Gg: AeBDietoe227eWN243uzsdBWHt3TkAHhWYIcq9gG08E6mrujR/fo8mH2QQMz6ODvCT0
	DyS3AhZ8KgKNr2M5thCwfZw4MJ3n50BepVehO0tHX2I/YCYZtrIxPb4O+QbvpwSivMhp5M+04bI
	ZTm2gjmtHZcEAYaWVUCqoyfwrEkY71EB7CbTk8fba2q9sD8z0BFHa6fSGLu/MPuGmBzJkhmlM4c
	sKmelfi9L9SHz/dHgO9DC8fcssFdAOBIAv36l6v7bWSVAhE4+3rVz7AW7pgGZWNGJhyLQ06dpHL
	sDfc3gNx5kpT8acJg35OvlIbPq2xlNx/b4X0DSctmdCzt+Uc/MK/qIyi00F3a/Usp5xlVXX+bwl
	8fZXccmZik5lahYxVhoxI6JE9qL5kRIsRJ5vzUaldJTwfrO37qqihuaBw5dG10b5EtthKMVpPxY
	ahG2y2KEQsasYYkbtZyc2tzOV/9n6onP8oU3niPBYvWrEE1g==
X-Received: by 2002:ac8:7c4b:0:b0:50b:4778:ac60 with SMTP id d75a77b69052e-5100e107b18mr39674041cf.10.1777380688143;
        Tue, 28 Apr 2026 05:51:28 -0700 (PDT)
X-Received: by 2002:ac8:7c4b:0:b0:50b:4778:ac60 with SMTP id d75a77b69052e-5100e107b18mr39673101cf.10.1777380687032;
        Tue, 28 Apr 2026 05:51:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5f91sm600051e87.43.2026.04.28.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:51:26 -0700 (PDT)
Date: Tue, 28 Apr 2026 15:51:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix Kaanapali CWB register configuration
Message-ID: <kgbs7sg5itirg5ovidtifw3rwf35ehjdegatcww2hdlqoefxid@bicocpkv6jd2>
References: <20260428-kaanapali_cwb-v1-1-51fdb2c65498@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-kaanapali_cwb-v1-1-51fdb2c65498@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a/0AM0SF c=1 sm=1 tr=0 ts=69f0ad50 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=g7eih2tgvwwgKFoWVAgA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: llc0NzR4BOC5tYQ5GEeNgGCkj5Ahm4bJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExNyBTYWx0ZWRfXzpZUDrCogxwd
 0JgYaW/c6g63ALYWNHkygsN53nv+kdoV3gK3JkJh1yVgTEyGC3GcR0uid/2GyxO20EQn8tROiXN
 fQ0vqSgLfs3Li2iAMisoeE1gORFbS2mdwkAZDOvTs0vhlJkHi/1oHnpAw3ZFt7JRhJulLFGw+PU
 jDGhjYEkhnYCvFDCy3WlCE3JOfuCNTEk5z68SbxFW/DtCZtcRdGvZXMvt9V8dpwDWHTPNBFXC1m
 p5yV0s/oiQkseX7eHyxNJr/rnImVc5vreB/DwGFlVhSychT5hUNVQYXoaNzAp76R4jeXu3ukvy+
 +3e3hnko0pWjEdmAjRLjuRRYEXGvgj0c8eoFcKP8w+YAQXucrtd1WuXP9NQKJB1CM2jHlVDYCz+
 Mzo0JmkYzIrj+FmkF2070hJA21lQJ3HdmTGm7+ucJ6AJz3c1dWwHmHOzERvLCuQu1Pcy+ocEI5K
 RDowfTGgV/uX03o/wmg==
X-Proofpoint-GUID: llc0NzR4BOC5tYQ5GEeNgGCkj5Ahm4bJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280117
X-Rspamd-Queue-Id: D638E48574B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104992-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.c.6.3.0.1.0.0.e.4.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 05:14:25PM +0530, Mahadevan P wrote:
> The Kaanapali DPU catalog defines kaanapali_cwb[] with the correct
> CWB base addresses for this platform (0x169200, 0x169600, 0x16a200,
> 0x16a600), but the dpu_kaanapali_cfg struct was mistakenly pointing
> to sm8650_cwb instead. The SM8650 CWB blocks sit at completely
> different offsets (0x66200, 0x66600, 0x7E200, 0x7E600), so using
> them on Kaanapali would program CWB registers at wrong addresses,
> corrupting unrelated hardware blocks and breaking writeback capture.
> 
> Fix this by pointing .cwb to the correct kaanapali_cwb array.
> 
> Fixes: 83fe2cd56b1d ("drm/msm/dpu: Add support for Kaanapali DPU")
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

