Return-Path: <linux-arm-msm+bounces-105070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFuLDjcP8WmXcQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 21:49:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF34148B57C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 21:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C010A306A431
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB70383C88;
	Tue, 28 Apr 2026 19:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eexcb2dt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fy/wrPpP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE209379EF5
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 19:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777405457; cv=none; b=uxDu7N+tM3hzbC8Fw4/VR6elH/Ipg6xhwQWoY1k0n0otvLQMUE4HF6I6m41puF3i4zHSGxM+3goN+eRKrYoFmsXHEKwkla8u8JTj26dPUWAkHDPfgKNdW7ANCGolaqP5urm0859U8n+RBAmGTQVSGuBrhqWt8fWL5iKo/2ztGgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777405457; c=relaxed/simple;
	bh=D2N+RdJsvuXrvspZ8hJeIUDpWcBWipQa9UtEyPXYIvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoP2QoGsm+6lZUMwk+ljKj51NhDqsL9HLOcWm06+PMei2vHTOWhdGwAgcQigbbfx+xseRmDiVKZ73n32/NFV2MA0OsAQZwD+B3BWjzts9H1ymgesiz4c7dj1kT0Za5u+bwki29alktMConNiG9u43ie0iHI5mDreZcjWzvAtmSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eexcb2dt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fy/wrPpP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SGtADI2984630
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 19:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xN5+FvXyhjHZgxw/ab3OvPn3pd5vOjGOlb2vyCAzntI=; b=Eexcb2dtcnaAmQxg
	FOBp+Kc+8StcMY4Dr58+F9Oq1wRQteIE1IyYof1H3ITr9bWPjdgK4q7jzwqsRWqo
	v6w9nYIzg9shCshZYHpqQjrg9/D4XlXzFgttUiRyBtP+LUJptHzwJHHMPCBjmHvA
	KdICCGUMH/IuUoEesGv5yvPcRdnt6E0LZi+iyU0pnU37KyvMiXL1wNK7znCAVkRw
	gUdQQep3hbnIQbLY4RmGK++Fjfa0E8RKFR2z4C2I787LCQydIAMhctQCRmk4hFIJ
	XhCQ1WKqDyDE0VOKR53J7bwcv+OwPnk2FZkO8MQ8089q5sUS6rQhZ9E1MuBu9dgX
	d3k/cw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1rka4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 19:44:15 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f71e90581so9899329e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777405454; x=1778010254; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xN5+FvXyhjHZgxw/ab3OvPn3pd5vOjGOlb2vyCAzntI=;
        b=fy/wrPpP5LTgNMlpvPmKIjqbiRh+CbjOC7ioxeRnt1zJG8sFn5gf/Nb87k4udEebFf
         DyEZz6CsQQlDDxs99a4oL54xj0kfRieF7MGOw5mogqN5ze3oX4PLRs7Qiu/xfWDBuwqU
         9XwLgBpwJ6J/wSiqGYS2YT4m/MbQM1RZzcr1eNY8GXU5DU2jDdKO1e0qnHLnyhZo+5Nj
         p5nQ4Nsu8ywV36T+7PQxMB6GKUyjrELE1N/zqYNKBBL0CKzd0tKU7DyfeWRIg36HOnwK
         m+RYXycoU/+/gPB2uJZlO4XrEPOOVVCOM9VOo+x2q4fdHYsVtS3o/6ddg81RoE72KThR
         0QkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777405454; x=1778010254;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xN5+FvXyhjHZgxw/ab3OvPn3pd5vOjGOlb2vyCAzntI=;
        b=SETwXi8JAJfWMR9PW8Tw2oKEs+WkpmXiv2Kg5n6dy737nMzKzj6BT0Q168tlKl+AEZ
         dgBU5/E7yxud/YsTLzwx6F7AqQV7EXpY86iAVdD+xk2Hux+oxpB3VEdvSTAyfz66w++B
         eZ9ZBLVP5S+FEQWqKjc53LMAJacDG0aH12ZoTjvr3XU/ITYPQTsWWz6A5X0OXBUKnlaX
         Xwx7tDj7XI5yxb04RH9FQ3ixFf4DZo/jPudTRUJsNxWwLIjiYqy89tMiXse+34NdraDh
         5dD1a6o3jR8i0seYSkP8hMCJay2LOak/fp2sM7uAqRozJMwlYuJ0sWqE4szYq/7xf0CM
         4+Dw==
X-Forwarded-Encrypted: i=1; AFNElJ9vsu7URa6+GukwS1D/IWsCx4Ch0MIH2g6x/Oo2yOReuo4IEIi8q+k0H1y+KgQfqLvkurIPPfHD7jcemevW@vger.kernel.org
X-Gm-Message-State: AOJu0YxcKht8XwBr8oKjXjA2kjSUiFLaxgKa1ZrWc2j5BuWUws5XO7qb
	vz9zfwyiDKUXAXrHkM6ypWnRFm7fClKQ8T1/Ph1wD59Fx01TYTwsnfjhG4QJJtouGHxidstTVnE
	OfeRXYFTMwwrSXUFg6Mje0Xv/swPGitMQleNtCvc9FyHcIlGRv1MnkciRD2I5QjqdqR0z
X-Gm-Gg: AeBDieuwUCJlSY0QVsCFHnCneMiCoTCP0ajPJDwyH8/T0co1QSrMYxif9iSlZdzX3nm
	/Kz+BeMPUGig0H6uqc7M3D27QCXEGJr8tC2JGq/zCjQsUyq7PizfckJfAI3MpTAqtdwkDSo2Kzb
	8Pe4usY/qw1H6SNJdhXR1Z486HV2rWTnU8AwmL1cGw2IIExtmC3i1nRb5Ua/j5J3Bp/FwU8RFwO
	KnUG2fZMq3DjKxrNLAEoWRF79b3e1rEYMQoevFBWZ8rYPEWp9vp8WOw3Rd/MwpQxAWk3k2KWP6q
	HQSSgrZ1ExpV3crB90m6jKNcyjmwTPR3mdBjgSfizZw+UsHtvvqOvJpYJBEuIQ/D8WZX3B0j7H+
	IT2RODqLjDaHq0/KRxYGaHmPnjDND659igqJg066K+GuJJRjpaL2aSqYCMnfDE7zvGXJJiBGyx1
	pKrnxgXVxh2qfYGebfizYY3AIXFDBjyLTAVpSIiHRw0BaotA==
X-Received: by 2002:a05:6122:3310:b0:570:f5d3:e499 with SMTP id 71dfb90a1353d-573a568ca94mr2636791e0c.10.1777405454007;
        Tue, 28 Apr 2026 12:44:14 -0700 (PDT)
X-Received: by 2002:a05:6122:3310:b0:570:f5d3:e499 with SMTP id 71dfb90a1353d-573a568ca94mr2636778e0c.10.1777405453562;
        Tue, 28 Apr 2026 12:44:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3924d3ea4d6sm710461fa.41.2026.04.28.12.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 12:44:12 -0700 (PDT)
Date: Tue, 28 Apr 2026 22:44:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>, Kees Cook <kees@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Don't use UTS_RELEASE directly
Message-ID: <mv57z4zk7usobxokpn2xyevag5rzty5oawk3sojmtyjjypcegz@afqkudsy4xfn>
References: <20260428144553.1103785-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260428144553.1103785-2-u.kleine-koenig@baylibre.com>
X-Proofpoint-GUID: xB44nOJx4V9TU5RcLArXcT-prSDen941
X-Proofpoint-ORIG-GUID: xB44nOJx4V9TU5RcLArXcT-prSDen941
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f10e0f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=IpJZQVW2AAAA:8
 a=EUspDBNiAAAA:8 a=Smz39SCUmq805RTcPQQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=zgiPjhLxNE0A:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE5MiBTYWx0ZWRfX3zrxngoqVphL
 F+QxXgUZtPH9qDDoluPkMSthdKjZfxKd43ZIFb1ecI+47s/ZuZas1BetBHNXbJ3MRAQRuG0nYNB
 sU4QtU4R/KappeEOfHxJyehLK07ruKtQGEB4cOvASNNSsmnChxyY4gDovhg2ykba5zDHZjGMFIf
 vT31H9P2Ykt5KCw66uwWbmT0Ep5Uq4l3yaXDtH4WYi8b3ngejrJW+eEVcBNMi705Rcnh6YJAr+m
 gygEAkyozNk+midkaqwsiDQun49dWYZJbqPY059ohgBAn23z5zerkEZ0t06lY4dOHt0prsKcdTc
 dlEoCnHjT/OBRu02YJpD5C/Nq0F9hiEKsM5bAo8GQRZi+g9KubYUcm0uLveeLDdIRlSreothGIg
 UpbuCE6ZG2I68O91IGak+fTzl1wyKHGSR1DDDlmbQKbZ68nDaAjPMHuBT//DSr46IuEbd3J9Kyw
 t86pEd2BL3Liwj6vwdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280192
X-Rspamd-Queue-Id: CF34148B57C
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
	TAGGED_FROM(0.00)[bounces-105070-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,linux.intel.com,baylibre.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 04:45:53PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> UTS_RELEASE evaluates to a static string and changes quite easily (e.g.
> uncommitted changes in the source tree or new commits). So when checking
> if a patch introduces changes to the resulting binary each usage of
> UTS_RELEASE is source of annoyance.
> 
> Instead of using UTS_RELEASE directly use init_utsname()->release which
> evaluates to the same string but with that a change of UTS_RELEASE
> doesn't affect msm_disp_snapshot_util.o or msm_gpu.o.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 4 ++--
>  drivers/gpu/drm/msm/msm_gpu.c                     | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

