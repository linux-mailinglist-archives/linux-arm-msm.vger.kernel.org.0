Return-Path: <linux-arm-msm+bounces-103866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMBbDgLZ5mmE1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 03:55:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3912A43558A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 03:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34BB930013B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 01:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAF61A9FA4;
	Tue, 21 Apr 2026 01:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0lz7zBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4HcTm2M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E5D3D76
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 01:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776736507; cv=none; b=haofxwg7w22MpAz2EFPeGA6a/GUOgYuJcYRJo7YVv8RG4Lv0PvzXOxB8WI0H6x3Cq+uouEg2kOzWhISQar/IvjHwc/HGOZr6dGSnZLN/hL/LUsqlrJe+pp74t3cOVXIwbsTqgMOHqxmGzo0IuCT4QcMMDHMtkULDKTwmL/skHRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776736507; c=relaxed/simple;
	bh=9tOvG+6kQ9h32nWHp/gvERMYx5CBRkVWJd7mw+X3Yxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9yed20bPp5C+0dp6CZxxYzLo20heRGza00LbKecjLAB8R1vcu3CMdYDz3dSjSyNRV5jpwGRj71EtO24IzVTC8bd5mgSjLmPRkIUjTfFQtEUdR21rF3IkPIGFaR9GBUuXI8O0FPGjdejE6mUq9GiBcIRuNn8aA8FZNoh1UgTu88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0lz7zBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4HcTm2M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KG11Pd2980855
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 01:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=78k24sGovg1DTm8PpM75Wm3V
	cwUiG1h7+NdhF0k7e2c=; b=T0lz7zBqDZeX/f47KoIPoIOA2eOpWIHas0JDzCnm
	3NQv2edj9s8Z8moIQEqI2Qfs3oay6MK9QtwBjm6YmQKOruX6gUwrwxyTHxWr9EG2
	5jIqv5aD9ooLOtDdovSVb34oRfgIbH0TpfGUOG8l1z2sAncAhWuWS2isppi0kuJh
	eLjFW6ZCn9euqSP+z6JzDV0rkY6XQvjgRQWGZr/2clWGXErJHarawdCuHIsIvpeb
	AInYIZQacNAuzVgFfSu5D23T5hVg2/irsHlGiuWhLf1FqWrG+UedMe0WzkRm1uzY
	mRl5hcBGHiaQ2pHIHtbua35F+UKZyEknsmTDtCd5SZxkhg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnj2pu0f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 01:55:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50eb8bad331so1389801cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 18:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776736505; x=1777341305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=78k24sGovg1DTm8PpM75Wm3VcwUiG1h7+NdhF0k7e2c=;
        b=C4HcTm2MmArElFhYfxdy+0S8T/GkObppsckCg1+Fbd7Mao6nsg/VJI3q6vqyJVzyp1
         Z3TMwoRmgDIvlqn/Nm6ZNVMjq1r0ZK8VPD07spjZeGewDWdGk2f0tX76v0oAnDKPgaHz
         k/iiMKTLq4X0W2mgwh9Qh5CGwu/T0Vbk7NFgYXbCNIyoOk3M5g4Ni6doKb9NypdnyQc3
         LNWun7gODUWdtd7Vf9w9ZgJ3p9A/qloxYfCQrYFFuHMQVswZ67xeBlJnfFQ7OqKfZXkO
         XzprJbww0aRED2Jjkibo6iLr9uEmF5JT7ZL1TqdJn9MrnXjBh367w2RYDdpktZupG4LL
         w1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776736505; x=1777341305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78k24sGovg1DTm8PpM75Wm3VcwUiG1h7+NdhF0k7e2c=;
        b=M/UVTqKMcuf3+AT57tZOeJqPkHZfzFzsNvcLimtd70OHSTUqdLeXzT6pt6gWf9h6cp
         I5GqaSBl1sugXAvqq7jHqQbu7j33K6usQEpYg1IjHxDkS3axm0Y4B1tmtVyjs50cJshj
         XUfDUX5UczijolfsJCxGCWhH9WTDtuR8JuboQ6zXU7iB71UyjmJMmkIEoHh3kdWDIVQY
         hLCAoyVX8RZRFnjqA18UTkLktMlrm4+d6XJ8T/zDNLuNtd0kHHsfN7dPbyr/ulIWsq04
         4dUibaGE2cLanbIX+vNrjXkaPEhV477zKvcIhoipcRbGsJ8/d79tTAPfX2/bSc+WyiVI
         LJBw==
X-Forwarded-Encrypted: i=1; AFNElJ8X+Pqsk6EBtoKB3HAYe1NwwIX9mIO9VQAmJfDQqkVIz0oXbD4KUaNXrnBsIPvRiqQ/d2jK7w3aon1/TvNC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxso+rGOp6YXTjsQWfDV2KRQ79Hl7Hksl8qITpFhLbZ9tTIqDZY
	h1YpK7+/dgHNwAkgS8kj6KB8Mg0UYdSfCthXa595LNRatpDl7otP4wGeVIauJ/ze0Cfpm4+EdB1
	8QBNQ3IyWNQJYWPfnet8E/BF0BLkqIy9OK1mQWvWUGKv+AfGh8oLZ97NH5dgXKcYh9XLp
X-Gm-Gg: AeBDievYTLUDVlGr0S60WhgJZyWqMBNcxQ/IEeBqHxo7CXz6NqBd3KrXRl4G86KlieN
	hKGLD4WdbLheMsIsQQ3R+o4Pnt8VuxG45OW1d1sRz4Tyeq+wXe0LeEf+BZyguAqeEHdsRsg5eg1
	dZDkmT6ClrMiCMzc8MLyevaImnyMFL3n+AzNQTNZ6/ChJEyzg+ZdbGSWlGW/poGPTUMqqnBeRQV
	+f9XWc+TrFAIZJMMhByuimndpNCPxFIW+mjMv5xhdWEhHJ9EWvP3BUremS3+dEzdQF/elK0wG65
	HvD8CsA9NAgOUbOjisG5OLCYJN1b1HsvfLrg6pyz07Ww1+5dkjKym2eEST/LENgf5QYp4/qrf/9
	6rbWimtq0NDVGz0sJnOFMgs9kXfrHE8lTIf1RSut2holfu6ObycG1FbOJeXZy/PpLApARtMnDYB
	7t2/WdjCjUU0YG23D2sD8FlfUHztO6pUCvBQRdh4pg9rvKKQ==
X-Received: by 2002:ac8:5e48:0:b0:50d:af3a:d8ed with SMTP id d75a77b69052e-50e36c495a7mr241650981cf.41.1776736504874;
        Mon, 20 Apr 2026 18:55:04 -0700 (PDT)
X-Received: by 2002:ac8:5e48:0:b0:50d:af3a:d8ed with SMTP id d75a77b69052e-50e36c495a7mr241650601cf.41.1776736504424;
        Mon, 20 Apr 2026 18:55:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41ab29ae4sm3026380e87.4.2026.04.20.18.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 18:55:03 -0700 (PDT)
Date: Tue, 21 Apr 2026 04:55:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/13] drm/msm: Allow CAP_PERFMON for setting SYSPROF
Message-ID: <dfczwbybemcfqetfbymrtuempyp6f23k535pqarkadi3wltncq@b6u6vgx3q26y>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-6-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420222621.417276-6-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: qnl-7SzaxmlSAmko7IogsIAGtYQ94d_3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAxNiBTYWx0ZWRfXzCv/Xv5uk26F
 dhJXKfmmLmx3EvxnOt/QRoeOP5JUixmrfJQHGXdi82Mg1xCXQ8n5EN1QlTj7OTPbwTLwLwXi+mo
 BrX02cL0gjCQk0PK9IBELuGgZzWmoj1CB3gT2AEfUnxQOvxuLU3sjxrWKQPDrZrwbc4EwAkELn4
 IZwNtCUBD9q5hmWnDIA966V4+oSq2EmDBeSVMopZ8bSXad+6aezZVewik46Np0HA4sOcw8ABK9X
 MTu61Hd2rGCBOeDgkE63XWjp6e6elwQU3+dgkvov5fajZjOsHALsZsxrFQsiwVl9rPdvz9orosW
 CAgQHtyzMi3Zocu/tPEZoJaH38jJoxcGWWPYXR9NWqD8iztqw6dshTSi3bqHfN/ZiLtLADm+WFa
 r8QIQdHs/HH7yFu+zziaas23aFmIIVbesGCzJ+iGWHjt4dR6URNjYTWFgGfRKGU1HFNf6NI/HaD
 PiES4ZBSMWS9eO6D3OA==
X-Authority-Analysis: v=2.4 cv=XMoAjwhE c=1 sm=1 tr=0 ts=69e6d8f9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=prs2R5FM1gg_gDYrfJkA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: qnl-7SzaxmlSAmko7IogsIAGtYQ94d_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_05,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210016
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103866-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 3912A43558A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 03:25:27PM -0700, Rob Clark wrote:
> Use perfmon_capable() which checks both CAP_SYS_ADMIN and CAP_PERFMON.
> This matches what i915 and xe do, and seems more appropriate.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

