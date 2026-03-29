Return-Path: <linux-arm-msm+bounces-100561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YRbWAGJxyGmkmAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 01:25:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 483F93504A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 01:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C30823015464
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 00:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CF42E65D;
	Sun, 29 Mar 2026 00:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4Ult+bg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FuGhpiMG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD7040DFA2
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774743903; cv=none; b=ewLKwAnU4U7LgZNU7TRmdlDeXieyOFwzPD3OwITEHMMsHGi5PVNq5v1UMjj0YNqsgapfIwseQ7p63Bkedg3Cs3rcgqwOePzBSZasim/VjJ9rwjvNVJBYhwElmdR0AiZVQeMYcKuGlBi8jn6YpZCLHdcvcnKT7PVAsANXaCGUwb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774743903; c=relaxed/simple;
	bh=YqOtM1wN01cFYeScCM5gmMBZldOF91h46FatJBBLVa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjX6V+t3B7IcZovxnBRH/BMLvQpUglnbvuNi6sPq12KnHnEnboPpvK02JTe3SrUuf8yIUjqxtPWPfnYxs6OP6HdmZ132+eJLNGz4n50ItEkyWiJ8+WgXkx0SDdrBJWmp/JRkq1F1X4YM8uSgOlzb4ULze5kghpLwqrukpWo7fo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4Ult+bg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FuGhpiMG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S3SjFh2061852
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HUOEicf8kvoElEElyXiEl4ay
	MNeZrpns2xYrgTBKlO4=; b=L4Ult+bggWTIwX62SS7FZHmS1w9OAekPtHxV3Mue
	/8dLAFMvY9uFrXwy61vnUbU2QpfEfwPtMO05SFYv7OWkapgEHblc2Atku+1IAkpe
	FDZniQRtUdRiGybxGLTu4LdzqRoa5fa5z2pSffNFi3qn8T9xs/gqBUVgSJOIsGqk
	SllVRHdVVJtshEmF3xjPUTyM8P6VzUUkzOs8GufnbmIUWRj5pieIfjbyUGXfscHU
	D3ucHXOMI0ahwKLyBA6kjk9nVcUHWDPHGZhOTlmHqNNrN624R3XauNda5INNShPv
	zaXDdyahITU5NvRbx3Uo+hJAcH52pf/nXGrYKubyg0i+jA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d672u9sex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:25:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093b92f327so91229501cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 17:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774743900; x=1775348700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HUOEicf8kvoElEElyXiEl4ayMNeZrpns2xYrgTBKlO4=;
        b=FuGhpiMGshCC4defAgF9TCHSNjF2ByeWHmpKGgb8y9U1cPWPKnBoqiyexZFx9NFGcX
         nyBnkpXsiZvL8eO+7zBQPU0yVauCE8+Rs6Qt4UCWRjw9p4Mnv+WMdaobWd7dy1idECVu
         gv0Fk7MugT/vfq7prtdDIZic5aYCtQpmJUGPmWL8NOO1ct4leg9gOpZjJZq36YbDCOaJ
         RmxiyFlxJuuf+HjwUF3NKSr0lPwz6+DW+p0F6X9U4calVc3HoZWT6QSgzNn1NBPoHuVm
         AlNxnaokMS8vZWhHb4touNKRoHBTSwq0kD4Rg81JuwC0nvf3LCgqvISW1Py2EwZFMq03
         mAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774743900; x=1775348700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUOEicf8kvoElEElyXiEl4ayMNeZrpns2xYrgTBKlO4=;
        b=o9HmCD1u/SlzXdjyyTs7R1nPeGsoFcHTl5fkA/pn0FItSLQoRURZd4KX+iAcNE3+KW
         4EDENqObxnr7KcB2KQg+jFjqpgYWcm+uJkAavseEr3gTHqjK8FtvKjxZSL1egmqGW8JH
         w3DeHkNI4dhByyXh54S0lwf0qpP7PsFuHHwwrt+wzyuA9HIKxe5bxGhmfdIvXVOHzNcU
         DuoylJLaJcHTjWLacCtZh5mh7Tkeqis9UHml5gZiaUzDeDV/2pyAgXn0pgpjiDnkNobY
         nfTTAn0g+HpXqAW6tU24hXkLRboZSQsg3Kl4K4F31uexltOOf8VjGyERZywyxzEuBzQ1
         hEJg==
X-Forwarded-Encrypted: i=1; AJvYcCWRfwmxPUk2XE/Wl2HGExKYWBFCu+JcLBjiLBpe4O72UVgtmXVd6+pS5WnkQDCqNVJtqfiSTw1x4q0wmQdn@vger.kernel.org
X-Gm-Message-State: AOJu0YwdD++atLby7JE7ZkbUomTpWKJJ/Uz1gYQ2JwK0Q5CRNke4ysKy
	n21/82ZSbDlhYEgtFmWQpU1X2oWqAPlDFUjWgfsvHE5ZrcN1FnKHnIZ1QRjLitM9VDu0shuiTun
	qoskgp0nKXk1TLVrr2VFw89ApyoGLY2mAh2TsBpgl37M/VYYx6tbPnP4fvQ0SmqWJzIv2
X-Gm-Gg: ATEYQzxZ8KSSo6cgW8i1fmD8wP+6T2Nt+H3pA7BjWzJmj5vE3x8lie9njvtxGf6Cw//
	aOED3liCDXvp1Qq1mrhjO8Y+0odtNGm25SnH4R9whlSZ1MeVw71p6QqAz8fVSLCrMM8Wonhu8K9
	qB4iLHWiWcLGlcGimKZHMnL74bmO2NnhIDp1f1e8/vnk79xlUZiLCLFovKMx1/D1HGLDl9TJv4P
	dhQ+UddvTuouzaqmBXgQPwokzkd1goEm693TYtMC2v6lkaWSl/LLP1F97dHJ3LCDbQlTZ8IGz7i
	1vxSJLgRa4QSasZGoMvKP7FXidR+RFSz5s0/s7jb7pDPhNqZCQRcE4RjfDaEuf7yVF1YEmQzvbH
	rrgROAZSLaEvrixtpgUBQWnHY9d4UGqTgSKqZdOSdL8ynyTP3XRYJTQSByr6rAgRQIN1cOkYcHO
	D114ydnJNXoOeeSER8LKKdbaZHn58Im74uLls=
X-Received: by 2002:ac8:588d:0:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50ba39c2c9fmr98680721cf.67.1774743899935;
        Sat, 28 Mar 2026 17:24:59 -0700 (PDT)
X-Received: by 2002:ac8:588d:0:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50ba39c2c9fmr98680421cf.67.1774743899489;
        Sat, 28 Mar 2026 17:24:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145dcddsm748410e87.73.2026.03.28.17.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 17:24:56 -0700 (PDT)
Date: Sun, 29 Mar 2026 02:24:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH] drm/msm/disp/dpu: consider SSPP line width during mode
 valid
Message-ID: <v37m6z5le4rk56b7pinr5wbi7l7s2bbgkggglx4eog6w7ja77f@lvyxc5tks2bs>
References: <20260328-msm-next-v1-1-12ac4e27c670@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328-msm-next-v1-1-12ac4e27c670@oss.qualcomm.com>
X-Proofpoint-GUID: OrTHFpQ4zmY_HOW-VUbx6as8djX3TBDI
X-Proofpoint-ORIG-GUID: OrTHFpQ4zmY_HOW-VUbx6as8djX3TBDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDAwMSBTYWx0ZWRfX7dVKTkPJhyW7
 GY4FnPxs837rpyQDmJw0dv+D1IGCGM/9tBnl7CZGJtlQWY5f3aM4TQj1oNc9e1hti5Nyl9sNvoY
 nwJGibZwxQiuh+lPbgwWSECZ/ZaNBVq7UUgKgY6rBGLr53MZ6B6cSOR0KQhHZ7MHJeKuspXCEC2
 k5noVJ4a95Xfpf5pBtQs0665NX7PUUtXL5OUHcFPUoclqu5v9yA4q6IUIexrbGlSbpPtFob7Khr
 3ErvR5eubS2ZPxI0GEQ7qz0V7Kuqqyq1dCG7viXs5iuVwinOR34s7tomkp88OafocavP4r/sWOs
 M3ivSfq4pzQV0p31sxj3Rr2hxKEOVII9fGf7r/x4po3/WH4HrMfU9VdPBr769Qqm0tCjFNo81wZ
 q9t9a/MICVYP3WIfaHeVnUCd2ENFbKyqs12tq34JNPlzXAxpQiMiowk8rGEZFJzWtSxto1zFGYX
 orHv9pzljQ6za9pvSSg==
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=69c8715c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jl6yBGYvvWoCh8uJDikA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290001
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100561-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 483F93504A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 10:45:35PM +0530, Vishnu Saini wrote:
> Few targets have lesser SSPP line width compared to mixer width,
> SSPP line width also needs to be considered during mode valid
> to avoid failures during atomic_check.

Technically this is not correct. There is no requirement for the
planes to cover the whole CRTC. Nor is there a requirement to use only 2
rectangles to cover the screen. As such, it is perfectly fine in
mode_valid, if CRTC is wider than 2x max_linewidth. It would be an error
if the user tries to stretch 2 rectangles in such a case.

> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry

