Return-Path: <linux-arm-msm+bounces-92809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB8qAstUj2lqQQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:43:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FD3138549
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CCEA300ACAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 16:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC78361DD3;
	Fri, 13 Feb 2026 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvfm7hlJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTcAqrEv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E23623EA88
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771001030; cv=none; b=sxRgPRkC93T8Wt1z3yw5vsTk7YVCGPS4aZFzePciM2CTQrk+nlPLtRsPxuGD5e8bBwWZUMvMhefsGytT3uDhmYDxMFwOzQXgpH8ZhKhaax8OqB0gf5McyKtXyoYpCFjo8tkwx0nfQUhyb77xsx81F3GVEvYaEVMg1ixFpGxqn6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771001030; c=relaxed/simple;
	bh=iubqTQGUgCMkl+SEYsqDyxit1aR7Csz7OLJXVLRTcys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fLi9ap52XlG9RaPV/tZhS8Ra1heAK383fZtlAJfRIhVZZp5gIwIwZFlchbfriOqe+fpa5YubXl0LoxMNLein6VBWERY7/VbKVXzIOJIVxZg5SxP7S2JoTKgQb3FqRua8jDGVohlND0jCz3gQD9X02N/8I4k8xy049WDyNaLevFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvfm7hlJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTcAqrEv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DBWKwP1756247
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=21pPGFIL/zCrhSvYIYVV0SyF
	kdzI1vjuhcaXVxySdG0=; b=kvfm7hlJLc3wLBNsbbesNIzs3hQZgCZWipk7fD3z
	uRk4coh/UiQF6uAiwpD2bK7+6ph07QbnRnxGr8aJO8Qh2TUJw4OEqYY8H+pZ5g+y
	IHwroE234Iw8XooYJHKBEdyFVX+lgGx9FGF4fr3NDeBHofKZmcmgbsRBZTfApJAx
	6MY5axkXXMB7irXO3FKnL+uqGlrIVJ0PkvYe4SIvgXBuWfUYB+Zti//ML7Jlwv90
	8iAtiZ714vGRgSfQzvxt8jfDsuKbZ5prDCMyu962PkpZOX++UQc21CjBdPlroVOW
	GfVo39Rrxxr8kDPVUZOtPj+SCSe9l/I9KeqP/dVrFAesMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9mb14c8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:43:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4b8e9112so9198785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 08:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771001027; x=1771605827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=21pPGFIL/zCrhSvYIYVV0SyFkdzI1vjuhcaXVxySdG0=;
        b=LTcAqrEvseVqS1WQZ7l8wrGEK/8DZ/PWE04Zj52JRNsq4sY8UgMZuEahx4NHIlE7vX
         W8IAQ/F+X/qYxO1eFG21XUme8ID8J5Azxdrd474mCy+AmCk1dZhCu3oeo1ZlGpHdFRAs
         eLn876nMpBj8kUaFq0Xzms1L5dW61vxX6KyOgICwRLJA/raCuUQyNuX1j5HL0oLlK6ht
         yu/aKW71+VdHZrZKknneZd6SO6NaQtNRSPy+Cv3K9NsDumEZ+Ef2WyuCF8+8ZSdX8He4
         7DIeVs69N78OaAEHH18jcsuYTlz0Z+h9Qo+IJKGfGQvvC2+DqDso1n1U0uTMKE9Zr3EM
         EAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771001027; x=1771605827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21pPGFIL/zCrhSvYIYVV0SyFkdzI1vjuhcaXVxySdG0=;
        b=VcgbXMBDdC9wbqNTRNBnd9RuTOLNUFiHs+3oLaDOebE7VWuJAijs9Mr6LeLyrrgknO
         6Bqu6jz+9E/9W38UV9GGQ/edCuoYZ++QfaM0bJw/JFjpjbTRpPnk87iV/9wXOZ58zyrC
         blQitPIx8jvyTX7S+Jt1YVmBKqZFcwhp/fQqK0gGoxtdkchdLTpD6d95wrzgoT5fZreT
         kvw83FrZQpWDWAWQ3fzj1Kpv9zdGfEaMRgUx/BEXvJOZt4rRnD2RW3x4M08h/qRH5u1c
         J4GkwzjyGZEiwMJWrAIRrhW+BbASzbW7xSKApwOZ1IxsEZ4sQ/0tS6FyrnIEhYCQAfTQ
         WNhA==
X-Forwarded-Encrypted: i=1; AJvYcCXDubk4FacwIG5XPGuTTVn7uIJu66Qnsvvrlfcz1M+M3zBFxLCghXqPRzq9a/75e4veMafOP0NMRQYL2vyy@vger.kernel.org
X-Gm-Message-State: AOJu0YwHXQrDDbhhW55GpvfErn6NJkTV8tEAPhTe/Ve+oCW9dsNbPvwL
	c0hKUaCHTAD2kmiRQJog1hp/TngMcOHRBo3rQn4l1ZKtwRsYavWSwW5gR+14Ts4LEXvMB+XgM0X
	8JOcUv8C1csbQ1gQg6N8A1P5l5AsEnjqQyjYbirlsmJ0URDZLGf0TpqSBA77Kdi84/b8p
X-Gm-Gg: AZuq6aJNAd1MjBukKlDk2NSwHb1+cmWfglLJ5tgSUkPqQYeYsZ3d9n0N6Vd+mRg+YUG
	e+l1djZebNPTToWx8yJn2BAJ6zOTjAOxDDRVJvpUQbP4upcqT/B3mkomRBbXU7Hqof72XSOLk6e
	wQ1yLKjLxP2Fiyoc6s3z2FiY+BiZQ0SzdWervmonksEJVJxlYMuTqyDcgu6xlsyQZ0497+EteVW
	UYrtwWSYiP8ZwfwbHQY9s6NYCzWyuiA/kKUs1sGT/GI9n2U5tWQ1GnFCsy2ydK1AZ7gr+oWhQdB
	pSS6mMyTxT/fthFMGMht1GSpCdvb3GamZ+uxgxj07j5cAuZPtAQ3dNGKcBJV5jueZaZL6AqIWlH
	rIARVpCxXUZjmYdPXfkR0ozbXQYTa8fBfesFtpmOZApCczVw42k0A5G79sDUWkku4qZqMADCyLy
	rqCnW8waVCJivS3T4AjgcquLB3fhkvpg2CbEY=
X-Received: by 2002:a05:620a:691a:b0:8c6:ee09:5eae with SMTP id af79cd13be357-8cb421628bbmr291426785a.0.1771001026647;
        Fri, 13 Feb 2026 08:43:46 -0800 (PST)
X-Received: by 2002:a05:620a:691a:b0:8c6:ee09:5eae with SMTP id af79cd13be357-8cb421628bbmr291423485a.0.1771001026154;
        Fri, 13 Feb 2026 08:43:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5ddfsm13919101fa.23.2026.02.13.08.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 08:43:45 -0800 (PST)
Date: Fri, 13 Feb 2026 18:43:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
Message-ID: <674jl5pvmoq3vktnc7vpasn43ncx4jj4zhaiegbmek7kqtseod@e7tkjv3uzjq2>
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
 <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEyOCBTYWx0ZWRfX8C9dRS0QoQop
 kTKji9XrSw9YgqgUoANcDiql62AFFKKueQKpcDU/OpyGvXDRrWMy7LaMgN3BXh0VEw89E4/9UHw
 Q09+DiRu9+bLjGwjgEq6RQpAWcxIvFwqGY7g5H3mzLdLyottVhlYtReBsqlzJhiP8FhYWWfVfxb
 fmP5XDnBALxzjyzyrmpGje3ghm+lFP9fq+bLl8iR4JDGH8ogbzxQthNwad0z9dUuBGNmnVlNdfI
 iLicDm7c0QfclGfX+WGuaMy5UCqigI57V2UzkmyHPgp4EmfwcsSPmzaWTpnCjItfWDeYuNCcdcc
 eJ4Loq3zI/f3+Z4RPNQWuPZb4nYx6vHwlkRU5Vt13PeYJ3tb/HfUJj+zWv4n5yGFxoJAPwjG1+i
 OjP18sNhj4kq2fNvm/wbN5X2ku2SPZEIg+7r7iwkvMlUcNCB6EhJynk8wpF0nDYhOuV9u6Coge7
 DhWT/mlmCTKJhLSzt/g==
X-Proofpoint-ORIG-GUID: IWvuVTnON45XY0qsLCY9F9AZkI9eLaYS
X-Authority-Analysis: v=2.4 cv=asC/yCZV c=1 sm=1 tr=0 ts=698f54c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=6cJ-CjKpxfkWJcI31lMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IWvuVTnON45XY0qsLCY9F9AZkI9eLaYS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92809-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99FD3138549
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:54:25PM +0800, Jun Nie wrote:
> dpu_plane_atomic_check_nosspp() currently handles both plane
> validation and plane splitting. For better simplicity and to
> facilitate future refactoring, move the splitting logic into
> its own dedicated function.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 51 ++++++++++++++++++++++---------
>  1 file changed, 36 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

