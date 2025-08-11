Return-Path: <linux-arm-msm+bounces-68312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E6FB20584
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ED9F18A23D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C260C221721;
	Mon, 11 Aug 2025 10:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNwlm7V6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E621723D2B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908413; cv=none; b=LeGdLAVDBw160yNU0SDZ3UDJgr/j/OA+uNziKIVEQKaicTSyjDgsx1b8Cyi9BrgQ0TgZnKS6EU/X84Zak1Q/qHWah3F5RbNJfMuLZqC/CZpnMYYHuyc9/35cFH1cbLIWBIPQwbI4lKC/0OwUmI516QZKWw2M8YiNX8ej6yP8oDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908413; c=relaxed/simple;
	bh=kHespbBD/Wze4n3BwKAN4MIeNGa9Z3EOBJc+ZThJyHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiHyfJyHkxJwanIoRFHcDIv+56XE/Hh8YNc+sOSE5A7f+YTeq8xPe+Oo73Ppdlfk5sKHRvgdh8NEpadFsQlmR4sTq9LI2PRZenetDWk2WZL/lx19+eqL8529mW+4/CcMArEy2o4VcOroeo1veludfdM9evgAPvciUG09lBCvgIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNwlm7V6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dJBV007895
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xUcHQjufN96j50i8isc5wxtk
	0rBCIWP/iFq3mpKJof0=; b=gNwlm7V69ms0r2+cku8n+dYK4oiEv8wxmw6sru2F
	Dk/5KoJBMvxCi9HJT6QDLQ3Nett6DKGwwY59zakWxEg40Ymp9nzDezXM+OJ5yt+Y
	1nY0GpVWZ/6hbiswN2N4c0/hhvjImsQDCzoH99Ig5NZ2flAhlrMleMnIcT7yPyB0
	0Chrjc6IHQhVTqXz0vSj5b+ERott85Z80cfK7wk9Vx+acOzAo3A4uwvQ5pMt86mn
	29iqKTey/mXBSylxXJI5iJcaqO1N2np4T746Z0sArngEa2PJfH+oesilWmOIwypI
	Ply3VV5RBqbNi+32nC14rD1yOKWuh2sTgeS8+cT0fPm0ug==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fm7je-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b08898f776so106902321cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908409; x=1755513209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUcHQjufN96j50i8isc5wxtk0rBCIWP/iFq3mpKJof0=;
        b=QGvJI/iKhiDizSImXzIR0RRsiptB6+ZMgD9AcozLvEeLzVJOrOoWyfnahbBvXdaz0n
         mUyy4Zq7PcagkJY2EdPjeW9HrGgIqNX6NePgQZcIWuZjDGZ5f2WXqibMwRrfDJsJXX+X
         yoz0+ZgzpSb27MmIC4bcx9SArgzY+mb+tLLSCaFXwTl9AfZy663RDWy47mWwCNkrVXLC
         BO8HVE4AVW7+GQJHIquGNRiPjM2vot1zgpYhHLHoGNgmD6mW/CWLiYVBjUE6ju3ZjcCg
         ftuv6Kbz6fTg+q2AtO9kmQ5bhHxewQVQR1t1HWbjUzBn0mEiBsrwImn6f1rivXvLcnY4
         HlmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw4we+M3smJGw3hIqApDph3zkU0HKRvdka0Yi6bFjc8+lTLMfXPAsMu87sHy5oYVSa1yHB9Q6t2dt8j8h8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1GJh/PBEQJlc8Kz8DidDqEWO6gFIMoP3FHHvtdg/q2IJANhKY
	wg7ZkcMNLSFd9rP8WuL1kgifh3oFTKKTpsSNKHqjE80VSDL+ay4o/x3CdscYX1gzAUkPQjRi5XB
	Hs2wHaLim6dnJ5OTDNjvNjkwmn8WyP0085c7M8ykXWhFaOT7FvIVtL7SjXr6Cbhd0MyV9
X-Gm-Gg: ASbGncs5h/qfAcnGDBUEQ5AOZAfbD1vtx21yi8zKITOIYr0bsGBXL7YVqOd0qilgMO9
	XFTgZol63LAA4VHKd38UGiuzOWXEfseR5OLpfvCksWrxCAyD4vQD1ncPOJPafyTCyTYoAN8PfSS
	Fy0vVyu5IZl5TQzN5qHEryZocKy3V/jGZAZNd4EXsgl96p9wEuDTuU/E8B/+yDaiGxHP9gL9SAc
	jH9fpH2kZEG9hapBAVPPMhKf1x9nHDmQlREhi8fkyc25wEky/a1/URhH5GbB4DPTA5Gj4uqcpf9
	j4eybKQKb2GXxesRBluOpnXGJD0cMtitR4E7lp5QvpRgPuPOyfZygJmnsav3pRsPP2ohkvwFCl8
	sBXL4aslRpfYlw6p9Mp/FkP7146s/yRYqAuTvSGEWvZqr1o/DUcdf
X-Received: by 2002:ac8:7dc3:0:b0:4af:1fbb:3a05 with SMTP id d75a77b69052e-4b0aed802cemr172661051cf.58.1754908409490;
        Mon, 11 Aug 2025 03:33:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK5+d1EPtwxEZN7NaQibr0TadKLirlbN/cpnuNlgXjLHPDePtrYQxufGwDmRoZ5/mmER8t8g==
X-Received: by 2002:ac8:7dc3:0:b0:4af:1fbb:3a05 with SMTP id d75a77b69052e-4b0aed802cemr172660611cf.58.1754908408908;
        Mon, 11 Aug 2025 03:33:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bddasm4246799e87.39.2025.08.11.03.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:33:28 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:33:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] drm/msm/dsi_phy_28nm_8960: convert from
 round_rate() to determine_rate()
Message-ID: <m4a5sw7ghzepzjh5rzxltyktmgqocaacbkulpbwsl2alqbqjhs@st5qillinrnb>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
X-Proofpoint-GUID: 7IvD3jMVV5j91mpmDgeNsIV0BYONuYTe
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=6899c6fa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX5f7A6VtheCsm
 2oPn1jksGQpCksVmeIOHOyL1PsvaQzF/eJ2Qvbop4ecuWlWiOaJwRu0mL8eDEzNxWxCA5DDE4fo
 0P85jN9LIg2+ZivjcXJHjo180x54QZU0z+P4WyfRrT24fA5LMvITK1l7r9qMw6HI2O4ciCLBUu0
 IOWObuGTI/rqif8tottO+DCFi6jDHWsHu7jLkwUknMpd8ey+AnQQ8XB89tgnQuSzZYSPm7FnhcR
 S3i34rwLAuVFtlHKf9g5o6NZvmRQIUz2TfdiuCcsMbWgDyz+TasIeC4KahZ6BQYnHuaH1tldwDr
 aAyfEwr3d/sIV0WPTivsg4WJbTf7fpXgl++dduITitc7jPk/IcxqD/pOegTJGXdM2DYp7U+LeWj
 BzyU7BiS
X-Proofpoint-ORIG-GUID: 7IvD3jMVV5j91mpmDgeNsIV0BYONuYTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003

On Sun, Aug 10, 2025 at 06:57:27PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 32 ++++++++++++-------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

