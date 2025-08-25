Return-Path: <linux-arm-msm+bounces-70738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F60B34904
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 19:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40451207EB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 17:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D733090DF;
	Mon, 25 Aug 2025 17:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPuI7xgC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198330748E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756143356; cv=none; b=JDHLwrog0VcEazTdfK993skgIlrjZjOT7AOJsviPMIO8dOs+fi3lBRK9GK8WEtQciuFxwxa2qsJHBZrewqFxZqSph+N/HvgLKSqPwOdln2P3Ay2Rp6/diOHH9cxUVPQmDEcTJAUi6R5z6e/oQxiCqi3ff+7TpbydMnNebqiWf1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756143356; c=relaxed/simple;
	bh=BOyBU6FwOBa3s5GaJJW7i4euH9xw6aUAb1TTNkN8MNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcjnjUmvGm/L2ibKfF+M9QW8wFCNhbIiFAgtCpazUi0lrE0/+u6ajL+bM0oCpAje9lJ2Q6XrIF/xf5PPKxI/NGeNuQvzkM3jlJQye8KVGB1sMfqrUTIKc4vqwO4EJL//PNbIOVbJNbjRlecBzSz76lh325T59EopA0yVZ1pQaV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fPuI7xgC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFV2vU006924
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kwa3vdgYtv702TKjlFEOUh4f
	oh4EffxBoohd+2TNwQ0=; b=fPuI7xgCZfYig0MelwbZl/WiuZxk9xEJf4+qVP/U
	euVwGsfDiQaNX9IVShE/1HWHt2YyS5lASSrMkJFCBxbMHQNrckcW3zDu4OCWONSG
	i8ySVPHaiVRitazJkR6LGBeTvKM0iy6sDqyPNBiUn9krj8qZ/IxWdoq3Uloxqr7P
	jH6VV0V1z8yAT0KuYWu3EY5jPsD3lQ8AcW1nDry4aXfRwRf+fy5VwuOe/OLPJ9xE
	quiI+uxUGZdivA1drOhdtZlcwR9FMBYBAUnemKfpr5JRzYFKoJug2rNjicCjs4qk
	VeXPBBsBe5yaqxoxAHrsZnnoHPSQ8QB3C5858cTbtnz0gA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unnvbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:35:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b2d09814efso21479541cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756143351; x=1756748151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwa3vdgYtv702TKjlFEOUh4foh4EffxBoohd+2TNwQ0=;
        b=ljxSvscnvKMdnA0rn7l8ba7j9pxJ10k4aGZ4lS//7ltvd11ZGMTaSMFZUmJzKv2I8z
         VatN6+lCfGbhjte+yB85pAC1H7gq3G19BAMeWfgqH02ZjK/wiz+gg4+WYRG0UoGhiv+/
         VrOGNGw8Y+Uk/0UARCLmVpKrwSbwfivMX/S4sVneo4rsUebzXwnp1EuFuAONmfG26Hb8
         Z2BVRHtG7TqlMxbf6s5Y4knox+ICVnC1F283Ma/OAvDzCKmNUkrddDkuaQ1Bq5gUS3m1
         iC0vt9/SPb/HbJZkQgXxMN+/dM4M/QLFaNamHJJUdGpr92t3CJxToV/lN+6EwOPL3xgd
         UlnA==
X-Forwarded-Encrypted: i=1; AJvYcCUYJCdYUsXye53cFeUf+2IvhqOxAKHYtKpcxd6kOa9/xSOZ0u/UpF+w8/oWo/ZiBb99vfBBxqvyZZSgd8ke@vger.kernel.org
X-Gm-Message-State: AOJu0YzyNYRDjpu1lRTR5dEO7sIsfSsgcZ7m8UqJSposvBIWvTz4Ye5M
	JSHROLrQv8HKB/+rxo/GlXZ3dU8hJkESPV0ftu8isgUA9n0aomeFdm85N5kwvbMrJ7hTmu/KbJ3
	A/183z7WFTeVHDmtjW3CvGHMit5wdAYkbOyYxRB7ryESN69yyAfupqbGlgHV5bL6OqqFF
X-Gm-Gg: ASbGnctBSu70QRQ4jW9fHQI57Yx/1puZO97s5ma/KIuLpfYitor+VWq7ziliK8GCplD
	pKbbh5ZHX23Bp7FnkBw81+3d3XL1ySop7jeAN7DU1YmQCQp9oYuxTAfHkroTv2OcgRHkkVlAlMc
	fL5Kf6xI4ftdEHuAw3I5LKri/nZVCjqhngCoIv62L19PwSR+vcxS9J/pw0w/RpmKgzzsD+Iki7p
	TZWdHMjzr9BexJS36RForzS99PtaENxCqmsqIQlRXRvejjOnvNTwfGseqf9kFllt+XtR0sdQa5E
	6Qduod0P4h2dgFEWdhB6/Y2+DkcKOW2YWvFnkZXBRw0nEiJKMEb/Z6iE0qdJgX6mlrZ0cfwaz3N
	HYjRZbZfgKA3/fTbh76fdKYO7TebrlqOr7hk9IUcFkst+WrYL7TQO
X-Received: by 2002:ac8:5885:0:b0:4b2:8ac4:ef8a with SMTP id d75a77b69052e-4b2aab57b3bmr163573641cf.69.1756143351067;
        Mon, 25 Aug 2025 10:35:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEnoMIrJ7Zrpfy4CLQqO45/pFwcr6T7pVHZ+N32uTDgh7RXtgJOi343oTo0GJcof/9i3w5fw==
X-Received: by 2002:ac8:5885:0:b0:4b2:8ac4:ef8a with SMTP id d75a77b69052e-4b2aab57b3bmr163573211cf.69.1756143350550;
        Mon, 25 Aug 2025 10:35:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e609f72sm16550321fa.71.2025.08.25.10.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:35:49 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:35:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 09/38] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
Message-ID: <5g73qgwgog2ch36faqiyluhsci7ungrxnovm4qgidk6n52qa3w@lpkgkzlofyvb>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-9-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-9-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: z3Ip9BnsTySlYIOzC75ojJjlum1QzAet
X-Proofpoint-ORIG-GUID: z3Ip9BnsTySlYIOzC75ojJjlum1QzAet
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ac9ef8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=z21d-uj4LOo1IgCTbOgA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX97FK9fmpmmpy
 4p7jhV7SVRhBMYPvKy8dkk5wrT/Lm2OtaxXjSPm9FdW/1lkRQY74NRgz969ptyzPeQyuFR18sRH
 AmnKFHyTZm2Z/IH57zkr3ftnnwoSOWAQFKL3oh+JKZd4HDoxirYEhPmVoVF7bwEb9cibAp3nNFk
 FnY47MkaEAUIeL9Lm0wVKQVdEspc7Woxsbpu4bIoJd3JRqOHkzhkikOZHBhWAO58KPnWruaub/F
 q9Xn9xqdb1ngYRUkUg57nDGh91eC3on/7rrkb1X2isb87NJ6jBahYbyx4aZM5fxfGNCj/jHj+WO
 YM3x/tJxS7AVLoQz0hKwUeVNJzICjJktDxNBEM2W5I71bVZCYAXkia8tlzS0O4ftWgoRf7hIG0H
 x37o73L2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

On Mon, Aug 25, 2025 at 10:15:55PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Split dp_ctrl_off() into stream and link parts so that for MST
> cases we can control the link and pixel parts separately.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 8 ++++----
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    | 3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

