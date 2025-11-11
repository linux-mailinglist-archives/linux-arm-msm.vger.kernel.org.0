Return-Path: <linux-arm-msm+bounces-81297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C7AC4EC16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 16:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9D85188D339
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 15:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4EF361DC3;
	Tue, 11 Nov 2025 15:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSTDB5i7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ydkfu8v4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC842FBE0E
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762874136; cv=none; b=dSKT3+AgIhM9dGTVew/CrWTGtXBEhtzwXWC/wyQQ1nica0eLh2D8+P429cNjCR9wGfrS/kxvYoK3vKOF7ZeqIPNk/uUM5H7uQjNM+HQPrclPrLCgfxFk71Ps9O4F7To8CTKDnOUgM59v0HKmyykaAXGJgmAGDLERsZSYrJzn4lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762874136; c=relaxed/simple;
	bh=jJMKBHKf06/KHHLAuhTh2Lx4NraSl2v0NUDCKneUY6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQxVzIydiNOCZR/384sOViPPmHCY79cj+1QtBZk0gEO0oDIv+9bPdLWennQaonE6aVr6r8TEIQ81GpItZ4GYkd18C+f9GHsxo+gGXYRRjfHvBpY/AgY0mp3awADp3TOQ6whQuG3ObGbc04TH2Pe4TyfpCsb8/tSfkcMoBcaaBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSTDB5i7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ydkfu8v4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGYZP2054892
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 15:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CjKKGdy+AMszA14Vtt/l8m3a
	QXJiT6/yjhYIisPUvZQ=; b=SSTDB5i7faGe2QE7r13C7DknfATvEUEtR6fOE4pf
	50B542HFwT3LOJD1vFu4D0e1k/QqsNEc1f3aVTjIsgEe+VI1mvCEPmMHR0dGAk6e
	XWR2R2lI3WC/Sq57FzRf8OHyUfv4Wr7ky25dF1rDbUoC7bvGYkOuY7X7S9PjLqYz
	IYSnBCyf0rClzhrqBrvsQ4Zuta+lBQ9/HIyf3trUWUebQfuBboy9CobPYd+DS0jX
	n2OLJaYH+V8d8hpkWDjRWstWvcot9jlL+2bWbHh8hFboAYTru4xIHSpezam+Ac0V
	W97u58CBQZutu/0nOGaJNXix6hhZKR/AIeGyslOMzZgMjw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac11x18vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 15:15:34 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-937189e71bdso2980095241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 07:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762874133; x=1763478933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjKKGdy+AMszA14Vtt/l8m3aQXJiT6/yjhYIisPUvZQ=;
        b=Ydkfu8v49YHsqXzzlgcLdq9sJZcCIQr3AflNTToXHlbT6U0TMHygQ3HAlsuCE+LG5C
         25Rfc/CLAy/jfCmhonkiA7PR0qGNLeFWtsOS+hleILxrsC/nJmeAQe22zTn2fRFkK4Qn
         xrB+Z+kk6I+pn48iEzFdh7UmNvgoCzpB4IQAsNYObC80IHTo3xJ0pEjArQzki+EDEyg+
         OPAQf3Olm/1S4urmOETZ/f37SejtV6ldaQ0jyyZRyzFcjnF80GnwDxgn5Ryzcung0VCH
         LtWuAzAjIxyaikE6jvBXT/1N15xetglU5mA2tGF2aFciXPj6dXVCKOXc5JtzSAb9OzC2
         ekIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762874133; x=1763478933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjKKGdy+AMszA14Vtt/l8m3aQXJiT6/yjhYIisPUvZQ=;
        b=YHD23RRbR/aL9anwqhWyE7JyTMexXen7I7Hw87oUh0diUCNogMJkUQm+IOMzrrAy5B
         ZI5fj3kCYSAOEgFkANHC49omIDKb0ZZRayG3zaiP4opJkWjCPcCRMniBbkLqR0LyZouk
         Rjt08P06RwbQYEj/ZyNb/EdER/cUqBVNY3BxABRlWqTEivJ3ddR4A/1fBSsOzlTwe7C6
         bupk1uke0x5EHPpQIlGon6YbdJXKSaR9l0YZgCO7oDUt96pONZjT7UZ7AADTnVumdc2L
         AXZDXZjDqnDN68zinefImTjwW0oNvX2D+SvGmQRSbzllCdLMzGwTr25JjGTldpusI3Ep
         U/fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr5gx3hn2QrWuy4B6SAY0augOP+NusmJyJbFnl1nf9UBTqUoBOfUraNbIiO9j70M1WAzEKMds4jGzsmLsN@vger.kernel.org
X-Gm-Message-State: AOJu0YxLaKOONZFr6rdETtGOOcH5bm9WxLZkm9R6jk0t/AzgrlyFHD7p
	6oeXZI6j0BT2KZ00xti+JHtMQoQUsZq6EH8wzp+cUVtBX4ZBu+4+KXvLScNl2prHnqqvYdT+Vml
	soWIwPHEVz4NQIH7ysogcEXtCO5thpUORE8bqoeqf9rUoAE5HazlDrkvoM8bzH3PBQEKi
X-Gm-Gg: ASbGncuKGmgGNKmo8Qwbyk28usa83gdoJirRx7S/GQKMILPsQjOmSjlzCZA9FZdz2xB
	A0x3blj4tYEwEDjp/U1xPWc5Vp/cALEQagvC3sp8Gt+fJejwarMlk+DEQWNG5CTOHfpxAjX7VpU
	fHXNu7n0nyZw0jT5ojbEey+T6+LedPU+bWDFw/H2HBm7YoVfViO2Z+ds3lQO+/Q1jFHCzRnjhi0
	yTKXRdu+nXmDT55t33v+fafxVSMaGAjhMnW/yj9X9UGIn1R2sPx1Utw2HI+ErRrZ5eYXiY6kgaf
	WcSTQ4ugnlcAxQ7ovsFYodnCSQN8qTsX1lBfCh8uAOdSBjtnj6UfD/futQfzlVNLGq+43XEL6lE
	yNihndLJhXSXIOrQBDYm5jjBRf1y02izmbwFhOVszwmgXRVL4N/Z5G9B6QJU1djOvO8fW7tF4q+
	NdhzQLZTIV1OpV
X-Received: by 2002:a05:6122:1da6:b0:557:c86a:6065 with SMTP id 71dfb90a1353d-559b31e0ef8mr3775565e0c.1.1762874133067;
        Tue, 11 Nov 2025 07:15:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEha0gnkPHAna6X9i6xjCWmuSMtW5oxVOyikglWY+DdHiJHzfMsRvKRHE4SLpIP8nCRHU7KvA==
X-Received: by 2002:a05:6122:1da6:b0:557:c86a:6065 with SMTP id 71dfb90a1353d-559b31e0ef8mr3775518e0c.1.1762874132456;
        Tue, 11 Nov 2025 07:15:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f058374sm44648861fa.4.2025.11.11.07.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:15:31 -0800 (PST)
Date: Tue, 11 Nov 2025 17:15:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/msm/disp: fix kernel-doc warnings
Message-ID: <f4pm7d3lkra5sgkuui5md3u4gvvccngrcgqwx2bp7syed2u7x3@ziv5vbcv3wzb>
References: <20251111060353.1972869-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111060353.1972869-1-rdunlap@infradead.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEyMyBTYWx0ZWRfX1YZXg4m7Xv8a
 yj9SW4X3QKqKhZYd2TKD12qaWsI4HuJg5DPK9212fr4QqbDzlhQn3jYxphq/60Pbdv7pjJjuCJt
 T+TThpYOxsjC4/F7qz1TcggkfWcrCP0yiemmzmR+SS8cf6JTpjOJXQSuNCtxBZUpgdEIoyQT+1/
 6GUWccak/8DWjyRCqM1lQoqp6qGFwydLCt6gXmTnnVNThFa4SSrPWj/6aVKrZtQJh/1UsMlm9ao
 HsDU6dFwEeCzKugH2+3gS+SOsLf1fW0Qfq+1QzzpmukLTsEz7LC+OG+mcZD/dN3drr1KCCuTyKS
 fL84LDRTBv/INgbep3zwsdqK2KR9J4yPFmZxPk+hn8oLp5oqdTDv6pPqHhmMGQXBpG93VXnKyQK
 I5WlM4qiHbiZ7rqhc4aTsdzXHTzo6w==
X-Proofpoint-ORIG-GUID: xvPkTot7ySgw2bQLp1-6K6rH2pVCc1Cq
X-Authority-Analysis: v=2.4 cv=L94QguT8 c=1 sm=1 tr=0 ts=69135316 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=rK8zvM0c_VZnkeQV2f8A:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: xvPkTot7ySgw2bQLp1-6K6rH2pVCc1Cq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110123

On Mon, Nov 10, 2025 at 10:03:53PM -0800, Randy Dunlap wrote:
> Fix all kernel-doc warnings in msm_disp_snapshot.h:
> 
> msm_disp_snapshot.h:53: warning: Function parameter or struct member
>  'blocks' not described in 'msm_disp_state'
> msm_disp_snapshot.h:69: warning: Function parameter or struct member
>  'node' not described in 'msm_disp_state_block'
> msm_disp_snapshot.h:69: warning: Excess struct member 'drm_dev' description
>  in 'msm_disp_state_block'
> msm_disp_snapshot.h:95: warning: No description found for return value
>  of 'msm_disp_snapshot_state_sync'
> msm_disp_snapshot.h:100: warning: bad line: 
> msm_disp_snapshot.h:117: warning: bad line: 
> msm_disp_snapshot.h:125: warning: bad line: 
> msm_disp_snapshot.h:142: warning: Excess function parameter 'name'
>  description in 'msm_disp_snapshot_add_block'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h |   13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

