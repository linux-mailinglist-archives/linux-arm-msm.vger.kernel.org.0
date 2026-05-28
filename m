Return-Path: <linux-arm-msm+bounces-110145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNFqDKViGGpEjggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:43:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 346AB5F4939
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F3AA300D541
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970092253EB;
	Thu, 28 May 2026 15:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLBnNZCK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8wr0XXR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D39335898
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981948; cv=none; b=Sz2op5F5bCkiIrFZE9yFcTVACSY0Yk4531q1OMo+COldBW86Lpms5n08fIMS+yivNONCw6/+20ov7YsnocoovdvoFTpbSYtKl+lN0aF7Zqx8sc5nFgcGLADmYxKka6SIaGIL1JK+9oNFJfo9Ep4v83CCIAtowVLxKGmI5Seq8+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981948; c=relaxed/simple;
	bh=h1QcrhxN1IKmwgyLwXFS8W2yJC9XI51nyPkPFtTzmyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhtZg2fj6+dDDeS/yiY0csPE7POS562Z4v+iTArkucUc1mQAbbT2NyX4LjZ8fBhHa0kHZFzyQ134hJOauvU9Vb1pXbq/XgRVoPZ1rf4w9NyXkzxz+JknnAuqYUsn+GlkdxQB4DKcocILlCR0XluybKBWu9AC8Clg+V5Pvgt6H14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLBnNZCK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8wr0XXR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vVM94031376
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ErmR1hLpUWMYC5McaPLOKuCL
	O2aW0JnKMVzTCEWLslY=; b=VLBnNZCK7s3NpUylF/G3q3yvonuDHJWtgJsIostA
	cem2KNgKrVjsGLsJ/h6s0PZ9uLE2k12/pXlid2NqPgzjfoyZENRxr2p4j+y2oLUZ
	SrQiZNjIlIUkZH+xb9f441sIH+3oQWLd6qHozeE+gjV+xFxXB/v9M79guHNjsxP0
	RtPigBKL1T4RA9Uk1Nba7NKcsd0kvwTwxqktictReR6fRGgXWi9rIVpTHUcyIlNI
	GRrQ7r7qsGDS5m6rE38ig9LaG33ht3bu1BfliVMWHIXEjpPfk1VFswcAfH9F/3b4
	2i73Scv3NXVdHVCjlK2RGq7LWQ/fFbTnenk2NXr5/cEKPw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y4uaxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:25:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516879bf1a7so315211971cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779981946; x=1780586746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ErmR1hLpUWMYC5McaPLOKuCLO2aW0JnKMVzTCEWLslY=;
        b=I8wr0XXRuYUCnAmC5M0+5X/nps2kplsKiebfYpy4Q0Rvr3QuLJGl18KkYFEIX9oB7G
         1oAgNqUIismLCCU4Gm3Fwqm7nWDyqqm7xMcIClzJGYYfKg31/KAs334ObjOwEIbp4Isy
         SLW96qs6FbryDMs6H8nXKpxJmTdBZ2pgRQLjRwLAkDp6Af6buXlSJ7Q32zoziHh41LQu
         9XIfNzrlYtavrpo6Ws6f6R7hdzM+iPvVHwfFYiiGw/90wVIUpCmKqAZp0dKy9vQ14RKe
         KkyuPjLVb3aSgADBhEpMaguylIwcRAkxz4pBgyDROKAPFvQ+8/8Zes12OpOX3RzpQ5cr
         7PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981946; x=1780586746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErmR1hLpUWMYC5McaPLOKuCLO2aW0JnKMVzTCEWLslY=;
        b=LkAZPqiw57v0l0LJorCeqdLXX7sRAo6gny5Pe3g0aP46FRbGhgHV2WXa9SUuIsl/2D
         Py0aGU9ksm44np5EO8uqIgi7FTnAb7Qgp52kyqgouTstsP24K/MXx29iCtLLphscwTWR
         +kRG929fEwaPiAH4S9qS/TnwdDn8BanYcdVRfWoyie/xkvpv4Sa7LF6tz7hAIODWVxrm
         akzrNBL3aNsdokE0xtVb2IiHLGwIS8E0X76U2pHUmTUEVHVBETI/N/EIdjDEgu++/FVM
         QS9hlXBX9mLgcGJ0s8h9SH5/H46Lo5LrxwLpL/bw8vgv17MeD7oRR0N6XLiRHa1J04pa
         3HFw==
X-Forwarded-Encrypted: i=1; AFNElJ/FyMyKoxTVCvXftJDzjd0Lzsg7Dic5sQiuyl55ZNhVuv87It8c2IEYwojL24Ysn9gnKoLXoMCp7YYX4slv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxigi39cX/XAT7wq4iPJFB3gYPXhdpubz+C/hFer05KsuXa5SMY
	q0dCeaQOijZOUR85g1H5j6FaRwxweGuV8/Pl+WmQGfId0QXLlXghpJwBWXumT63mE4842hSnPHH
	y8cg2ikywlUfg/YVEnCTbg4uQYi+wc9yhPznF+yd0n7lPACDmv5ba8TnKyfxpinLm6otm
X-Gm-Gg: Acq92OGOCc2Pw7GOTBCpIAtPnqFzqebO9BC0TVPiVC0bDg+48gbR38Er2d+xEXZpP0Q
	jrFPhUYeUZFnxGetxQ1Z5x4OBREIJ0g8BS4K4PywLcOaezbglMU58kdubD5ElZCc4LjtDG5BHlj
	AnX+h0pUX4EXPHJJBKMl/2Wvi5DhYFUo1XP0+BZjFnRzqO+9/ijPoV8vWJ+2fUT465bm/gzRabi
	COeHCX4vdaviY6gFK2HoQcFaIRdU4KzCNC0OrqVUUkhuijA3FOgV9FP+qI847IM6OZepsM2Qo8u
	B1Lh6j4pSJxAvfGiFzuZoivHVdXys69HQwpfCWi+pA5W9uXn4iWNQRceTxTRWhWBggk6n9uvqDH
	9ncy2GfoaCX1CLOrNW1ETyMa0cawwJPOVCp4Y+BVMnhTna1f8dYgtrNTQ5kHvNK/D+okmbdQ6fH
	/mlwzLWqZJOfyvT7ittNvkDnM8HZ6VLU3DUcbp4emsJSb0Ow==
X-Received: by 2002:a05:622a:1f06:b0:516:dc75:1aca with SMTP id d75a77b69052e-5172311597fmr22312021cf.26.1779981946565;
        Thu, 28 May 2026 08:25:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1f06:b0:516:dc75:1aca with SMTP id d75a77b69052e-5172311597fmr22311591cf.26.1779981946116;
        Thu, 28 May 2026 08:25:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa463312a5sm1960878e87.67.2026.05.28.08.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:25:45 -0700 (PDT)
Date: Thu, 28 May 2026 18:25:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v5 10/15] drm/msm/dp: allow dp_ctrl stream APIs to use
 any panel passed to it
Message-ID: <mar2smjimo3uoucxctofmjd25vsfun66m3l6i4prnyvo3z7dzg@7e565usiluvq>
References: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
 <20260528-dp_mstclean-v5-10-a9221c1f1f3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-dp_mstclean-v5-10-a9221c1f1f3b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE1NSBTYWx0ZWRfXwy9bSluwIYQO
 JNKHqWXV5WJndD/RslTI1FpmtL3BY5PhH6dwQDjzBsVv7yTBgi5d3PU+Kzss3xUNrwAjCAZKS2y
 pgGsKzdItU09h+oh//SelZa1PcHxjRgKXtlhcnD6S/7nuQKU/cdiDVxAgCdf8guLsUTZs3krYht
 9+desRL80fuTQj1cMq6eGLY0oIj3kffGyDD0h6vB2oNS6Bf7myVYz9/JNSz8y/Osm4tkxus8pFR
 rJF9qkszfmHjHLcdrXlec/gKJDvvOwWiPTrKFxWE5ExfFI5xK6nV5pQ8EvHIQ6rjhgVeh1gduto
 TDhFeCzd3DQQk+c5clSgCKqRMZ5i0Sdt8BNyZ2SvxS+yUL1BT8KaJxvxBi6hK29PDG8UqFlj5ZV
 jXLg7CX4gDoFKffdZf8n3PLEr2QIMzTucBJJbsdbXoXn/0RDZ5P+6HqJEJOAMqXvrh6M1ckGgns
 WBpE4BbPw5PCyRSkmQw==
X-Authority-Analysis: v=2.4 cv=feidDUQF c=1 sm=1 tr=0 ts=6a185e7b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=7VmRHP_rljhwBiH_WasA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: f4tneI6BRn4aWjd26aAXUScLMS_Wrm9t
X-Proofpoint-ORIG-GUID: f4tneI6BRn4aWjd26aAXUScLMS_Wrm9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280155
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110145-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 346AB5F4939
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 06:40:31PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> With MST, multiple sinks share a single DP controller, so a cached
> panel in msm_dp_ctrl_private can no longer represent the per-stream
> sink. Drop the cache and pass panel explicitly to all stream-related
> dp_ctrl APIs.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 208 ++++++++++++++++++++----------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  28 +++--
>  drivers/gpu/drm/msm/dp/dp_display.c |  24 ++---
>  3 files changed, 146 insertions(+), 114 deletions(-)
> 
> @@ -389,7 +389,7 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>  }
>  
>  static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
> -					    struct msm_dp_panel *msm_dp_panel)
> +					    struct msm_dp_panel *panel)

Please don't mix sensible changes with the renames / cleanups.

>  {
>  	u32 config = 0, tbd;
>  

-- 
With best wishes
Dmitry

