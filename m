Return-Path: <linux-arm-msm+bounces-85136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ADBCBA463
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 05:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C72830184CF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 04:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CA0146D5A;
	Sat, 13 Dec 2025 04:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVC2IzOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pio99yOX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4D2273F9
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 04:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765598569; cv=none; b=TrTiPDgCZ0HCoeYgFVwqVHcHxRk6kftUcu3ZmZak7szb05dQPcGKHCENfNnRqBfXhDHaTfADY7yPPmEd/MhctEz5v+n7T23lWXCVVh5zDJpVncQ0UNIsSjPETVviw7IMmHSqWbbZvPEPMuKNTupug9qX12X5o7wzk+nEI5SA25A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765598569; c=relaxed/simple;
	bh=0MKogGnSoL20C40NceSUiBaIPgiZ3y6eHwdJtwL63tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bv8YkDADIzxMR/EonOArOXMFf3Te0dQNZQExEzCM1z1fkQfK7yNB0v6JlHgcUyOjRNluY1WmbC7yZDMIQBDqet1mZMWErkqKhZyAOqtSI/rYJytJBdBPuE16g6gDCQVyEtvnpeyhpLYef6b/rVwz5s2tAdNk6SHTZTFKOIimYt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVC2IzOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pio99yOX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD2Xmo32104480
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 04:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=krIrLWAixu9t46zq8ZyDKkJP
	caIYHcMtAO/tuk3uLmE=; b=cVC2IzOf9nucZhnAr3gZ8t3dcvAFn+hYXis/U7wm
	RY0Bu3u1cUK+I/d2xctFSU4nlRmqjr1zcmztMyXZzxyd6o2NF61P4MvGJVmKcAmM
	90yQNRB4+FOGM6tdJpjv6xb5TP/SJPaSrok5S92KPVjUhFgg0C5RtTLj4TTPWCoE
	2vlU2WLGOqqvYCT9t3f4FtNCt5aRn66aszyIChZ9xwxysEj3+nXXfztJTjDMCH7p
	atU9TuChBUHpyw3CWhLL22YxdM94NHJbS/yHClETb7srwigtqqys3mSanmDP9MuC
	u++Mvr5SegvLGmHGHOOt1dvyBbuOjSFE4EyjBQi9SIJ8RQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0yff03ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 04:02:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2ea3d12fcso418570885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 20:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765598567; x=1766203367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=krIrLWAixu9t46zq8ZyDKkJPcaIYHcMtAO/tuk3uLmE=;
        b=Pio99yOXNiRpfPk9sNxKUtsYCMAr3dazVud6MTMwrGCQSFysiYmOXSzHKu1HtYg3H/
         2JEfxDpSnpMZ66Sl6f4UZ+ZXprrxEMAv09fF44cEgyh9xym0Ik50IEac9Pj46s4jvIgV
         3cZgWRsiycGkx6Q8BKOl9wKThnT9WNWo2AmwhwAxbiVYKm1ax3qEYffJnzbMT9nQqvDF
         NPNQYtwaOvPJ4dahPJ5fWwCBpYxsAb7Mxe9gw4i67iMAc6ZlmN1zj0ryfNgCL76qTENf
         E8qp23vneR71pM11VqvReZJpcfX96eplOJ5lRNagnNVH81tBniZCW+ajfxlDrB5IfEh7
         gweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765598567; x=1766203367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krIrLWAixu9t46zq8ZyDKkJPcaIYHcMtAO/tuk3uLmE=;
        b=o8ZMOHfxDi4QatFShrvXGu3KwZr17xWC2b3nt2JJ/wnokVzFI08XkRRVzlMH1Kx5cE
         8w+X3fUo3g/Ak0rE6Z5oCBxPd1YTCOm6sZe0e+D0aXz1+uCU4b+nQq9d5/SyGDnCzLoG
         JTUMRXz97+TwkP5UfefzShvPaZ4mQWCYCuDcoZ/LQK7bcu6tyPg2q+kO6FIgOxwsL9/M
         kISLRKN7jCELAMyg9931k42V4N1aA+AG06fPCoeqZnFuMaZ82FJcTmsvyyqX5dbJPdNh
         6pgER3rJdLJApKHxNU3iLurnHW21fQUkJ4HvRQHWXslOZx9yAvPVW+eadOahji350vId
         mH/w==
X-Forwarded-Encrypted: i=1; AJvYcCVh5kkezohQk/4XXws9xjiCdRj79gi4UP7CoyitFgH5mVSrNMLd3kShrglcN9bQ9URBUOvrZ1r7QBXnkFsb@vger.kernel.org
X-Gm-Message-State: AOJu0YwAfTuAWojp8bG46sovLaZ5s2xUtdpEMUc8RHBXFyyd3alKTSo4
	4HaQBWe4Tr/AOlswFnQ8d2F+7p2En/MFiDBQKL4VCM+8XRD3IX3DKOrspsVO005OfgFhiQRG2Eu
	vo1PJDkdgCiMPq1/alN+/QPHf3MqxKCwZnsSxZ34Cf/rHmHapPtnkh8mhjnWFeFT+xW7n
X-Gm-Gg: AY/fxX4aquKx2UCssr4h5wb/DB2klJ4IzMvuVXgk7/rdiR4Qmj+bizrm/tToJ5pjX4l
	Cx11ma9hI9LdozO5HWW2CySSZJcE2pncrTkkgoEUEP/TIvguKhlMcysjn/m8WR2mRigONJGKc3v
	w6ZaebK+xk8LRrjJZJRjcgNnAIdrEL4rSTxnkIdwBHUOI4PdlkFFA5Qpmx0xYKXCRljKzl4Burr
	xcwxuoCPK+iZUPfzFGgKf2aoyZERNJqMwUd85Dpwx5tv6k4q+dNa+lq3kYNPcB5ENqJekYzpJL+
	E9ok2JDEwGlPhTXl53T97XW7C9+ajK4CMaXfJg5846reoPBM3LicMrHEFUQIho5yfskaJrZ0N4Y
	loDEKaeN6w0G3xP/u3Wp8w1M9P6kMUuGaKJMusPXQRpm14zfi/wUg/Vt7iMBQLd6EVq9iACmlZX
	AbaCfOJMlF7eNPs+ctoJes+Wc=
X-Received: by 2002:a05:622a:a18:b0:4ee:403:7f3e with SMTP id d75a77b69052e-4f1d04df845mr58487841cf.19.1765598566547;
        Fri, 12 Dec 2025 20:02:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEc4ximOjQPXVj5aYQYKEhiuT3BE6BDth/OUUa2d+dNwwoMbOuQg7anTaVZtZI83QA+Bbx45Q==
X-Received: by 2002:a05:622a:a18:b0:4ee:403:7f3e with SMTP id d75a77b69052e-4f1d04df845mr58487511cf.19.1765598566091;
        Fri, 12 Dec 2025 20:02:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2fa7fe0sm2582787e87.72.2025.12.12.20.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 20:02:44 -0800 (PST)
Date: Sat, 13 Dec 2025 06:02:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dpu: Add NULL pointer check in
 dpu_crtc_duplicate_state()
Message-ID: <hl7op7zsxzmyttdjv2ijyutnobwjpl2fezaz7ohnlahzatui5y@677c4g676ekn>
References: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
 <20251213-stability-discussion-v1-1-b25df8453526@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213-stability-discussion-v1-1-b25df8453526@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAzMCBTYWx0ZWRfX6vWymcFpxubU
 WMTzAbxmXcFcfuifbdhQbixtQ340NEr+po/fyuZcfLjTg2FIGzyz+cq9f5+fEDyWC5bsKl0cXfx
 q8hVt66CMK7KQV3o5ZRLtPSH4toSX4qSqaAO8jdWOB/fI2korwOXw/OunOiKWNnOKJJjd03mRlb
 8Tz2PgUYTWS7SGc9jWxCJackxEDvzw3g48x4ZtZVp2s0Qy8AiD4tD9QobBNhCk/PnTnPIEtPv8L
 Qy6VyxdBYgnSEJvLpUvlLCJm9cHreL8w/xnml1oV6JwWMMXCujwEJjpgAkuXQdukjOMB9QyR3Bv
 xkcIkzcgxLIgyE7urZsGcVkoiKUD2hWLKGhZILPFw59GTSyBbhvD+EcJ21C8m0YaZNhrJYYmG38
 2zyLZoB7SMGhn92L5/WjrrFG+ausBQ==
X-Authority-Analysis: v=2.4 cv=e8ELiKp/ c=1 sm=1 tr=0 ts=693ce567 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sfOm8-O8AAAA:8 a=NGQ4gkOAZ6mTdP00BBYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: MNaT2zK6bWriT-Aga9durEz34v53BBGT
X-Proofpoint-ORIG-GUID: MNaT2zK6bWriT-Aga9durEz34v53BBGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512130030

On Sat, Dec 13, 2025 at 12:08:16AM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> dpu_crtc_duplicate_state() assumes that crtc->state is always valid,
> but under certain error or teardown paths it may be NULL, leading to
> a NULL-pointer dereference when calling to_dpu_crtc_state().
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Missing Fixes tag.

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index c39f1908ea654..d03666e14d7de 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1114,7 +1114,12 @@ static void dpu_crtc_reset(struct drm_crtc *crtc)
>   */
>  static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
>  {
> -	struct dpu_crtc_state *cstate, *old_cstate = to_dpu_crtc_state(crtc->state);
> +	struct dpu_crtc_state *cstate, *old_cstate;
> +
> +	if (WARN_ON(!crtc->state))
> +		return NULL;
> +
> +	old_cstate = to_dpu_crtc_state(crtc->state);
>  
>  	cstate = kmemdup(old_cstate, sizeof(*old_cstate), GFP_KERNEL);
>  	if (!cstate) {
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

