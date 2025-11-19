Return-Path: <linux-arm-msm+bounces-82425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D09AC6D1D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0343B3498AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 07:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF2032144F;
	Wed, 19 Nov 2025 07:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WL+x2GdQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RS+kszBi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31F1321F31
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537379; cv=none; b=To7M/7A4NtABbQJk7TGo8hTG22FmWpz/Any/nEHWRByoEYsQr8ZE41T+r9MqWVVodMHQ80PqqR+UcbtXsrjrviF59DzJDmySlND2pHVlgI7lqOQCMm3gKb8DCfqcN3frOXyL5mzGztUJ/PifnnAFTRA9S4g5caCPBWdBa/KbSWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537379; c=relaxed/simple;
	bh=zg/ZWTxcyR3E8ps5zz0SNuakKqCsCLPwWf6gsRPSY/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Izl/V7drEVAHYwgW08zwIOUCpR/mSl23yeLu1FER/Qx+wK7U/2J3GTJsUxIt5I7+PjQrnk0Engtd/O2RY2jmYU0BPDMJyzdFxzUmgR94/0TNa7Oc5mODLZON7GrIzZibR559DS5qibjlrLi8s6zcFAMgs/o2aJkrjeqLuZDCHlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WL+x2GdQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RS+kszBi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ3x9CI839661
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R0I0UG4zGGjNwh/RIuy9/Cv4
	md8bLt+9za1Gu7nmthw=; b=WL+x2GdQEMmowdQurSYGLt+bx6s4g4MN0XdG5Jtm
	0gkXU76EjdeWu6aznZqPR3MrtazsOfncLPxCUc0gnMtub+xmM03z9ruxCdYziC7I
	x0ayru3OONZQuHHuBtxkMrvPh5VPaEVnSaWO1O++fJbWrj/MoA94xFJeevTe2zKT
	+JfAPvOSlyciRedVdqFz68x3PUa+uBnpn93Iv6GHp3vKmAHZ2dcN1A2N7VQ20a/p
	qVnRT7E4LctLhnyVspOA4hMd3DAPbXvkRlXzun+8yJDRobQEhFr4hVQShxhPTwkW
	9w4muAmwEk33omR5A5AgN8TCJvdDpeEWKscEHvBurgRmGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6fg8has-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:29:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ff3de05so204563931cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 23:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763537376; x=1764142176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0I0UG4zGGjNwh/RIuy9/Cv4md8bLt+9za1Gu7nmthw=;
        b=RS+kszBivInjrBI/W5LZn4NjZmTCiHpigp9kyz1Y6uTlarHDTn8EjmCZc+AM7Mp6q3
         Mu9aWqqZrAHSy7G4wIc4ox69VvuX7cj7KviX6yVxo9jBcTBomjksJ70qbeI6/VvEGvc8
         gZ7TOXOcyoq9Jy0j51Em3F4ygygxSt9tjfw35gXORzCIcbfy1Gfstr6UL5ura47DS6j0
         wc8+XHe4nIhevQJqMSvfXE47WfuzsHb+scq5tQRVKQAjI/xGe1qhwmM/1HhRJRwNL6wO
         eBBq3xq3NNDScfE7Vp/W+f2jf0frukBP2OFaYEj1V/icyvbInHV80uZ/fQBeGmsSuNnG
         KGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537376; x=1764142176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0I0UG4zGGjNwh/RIuy9/Cv4md8bLt+9za1Gu7nmthw=;
        b=lfHfnQdTiA9xtRM5KOq40ceLei1pP9adhbGNopS+t4A2EZ07ZLMtJwx/5Msb4uRaTO
         p9xQVrI9gKwDyexGnO0umlGo7Wm/WIEMnhg8OdNOzyFPth88TWv3QcMyHJTbGpWkBC7G
         I6CT4D1ZRiPIoP14I5G88DYxjz4MygMDH9gtKtP+TRS4XmqP62ufF8WaAaQMxhqk2cbn
         Rr4al2l98rvDFrM4b7yP0U+SfWMnDRtk6ydBb2RJDd/jViLI3RM2UvvS/M4a+6VryaG+
         f3kBSHqoXq/b7VrHa38BzvjR6Qxepx1A3FHuPuqEx7un7ZKQwMPyQWdsdy0h5ivMJ0zl
         5g4w==
X-Forwarded-Encrypted: i=1; AJvYcCWPtcC9H/YRam91B7/eyUKTxbZRLfFoomJgyNwivIgx5F+zhhyKPkxx2uA6QVv7is9qaTmqMtOkECiFFxfO@vger.kernel.org
X-Gm-Message-State: AOJu0YyY7JQg8gYBi4g0qYw2FmwCFoLBz8f0yKDPSf6VEi3yOAICa+RC
	5OL8mYd5izzooj3WT2IzIN9xs/BeAaXSsyOkeXuLoUENaIdkON5nluSW5tsWMFw3lOsfJoUIj96
	ATyztIF9BrFjZxwEvRwuRXFD+k73kwax0kOlM4yIgw0iQsewbLIdfiHzlLA6+kiTUQGXX
X-Gm-Gg: ASbGncuWeJJlieSDAhePYFZPldKe+0Sf/eRjzRMeAe6dvygkguDndHfbNDO/WeIXr6f
	ibdqAw4aH4PS4nKH0lbPxyCg8g4AUvD19iUjXzYMjiNAkg1oNW7xN25Qov9A1bshuzukOhaPzKD
	MfMBlh/BOpunjJYx+Hd29VEU/wGmmgW8G+jiA+VUmgxG8XU61TjS4PUSKqdh226L1OEK7G940cP
	v3SNzmzI0jAZpnCeBvGEju8IURnNem0lTk5WzVFFReHiS5K/Q1QFQW6x0NafbJmHqteRw8N1qcj
	a2qU3DSSsPK0CZWnAq01P2stOlk3zSxmbFmn+RapmdbQ/F0+i/DcHdLNqXUVs3Z9GpAz4XeghUf
	lPgzQWLtRhzQkRECJVqXheMcvUNANwkYVdp+gqVUXTvV54ABWFiRRRSXWCky3pS+rzChTA/nSHh
	/X5UzjFMSC1Kyu6Oo8OPm1a+w=
X-Received: by 2002:a05:622a:15d1:b0:4ed:2edb:92b9 with SMTP id d75a77b69052e-4edf215c83fmr244114871cf.81.1763537375823;
        Tue, 18 Nov 2025 23:29:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFictIHYpBDF3F1JcOpRfw7SDn9ivbKXF+srwLX7+H+SCRJ4BCDfaThoIwHFC5rvT+6K9oHOQ==
X-Received: by 2002:a05:622a:15d1:b0:4ed:2edb:92b9 with SMTP id d75a77b69052e-4edf215c83fmr244114741cf.81.1763537375408;
        Tue, 18 Nov 2025 23:29:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b33acsm4552020e87.33.2025.11.18.23.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:29:34 -0800 (PST)
Date: Wed, 19 Nov 2025 09:29:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 6/8] drm/panel: sw43408: Switch to
 devm_regulator_bulk_get_const
Message-ID: <nrudzu7r7mzvjni7xt32owix7dd2arpimelk2a73h6eviekptw@fcbvniyakvg2>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-6-317a2b400d8a@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-pixel-3-v3-6-317a2b400d8a@ixit.cz>
X-Proofpoint-GUID: utEd0IcIDUr__C-quCrtn5YKOsy9qJSi
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=691d71e0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dnSpDUa8s3b1Pn1JWGwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1NyBTYWx0ZWRfXxIKm/s3mu9sy
 VZzeW1QoerHsA46XQl7LJDCdV32wsvkQR53cjxlonJtOxPpJofP7PgO+B33jLDfmnUH4koU6+Jg
 l8kAEvnzk7gfTyGaq6ZbMQuUsOVz+svQLtEgl2WFB/PxeEgonuh52VgmTy/2/8fhwh6fLY9fcmw
 hnsZa+1RFgjci9JbXQp0aJV67F+nqflcj+AcO60pQe1I+BAG0p5bCuNSJOJ7M85/j1c0Coo7sOK
 B1+JdyySigs3bIXdV8bV0Zf0jCaqoiX4ThfIUZlBPrLuCKCVxNQ2Vlq+847T8UejoDxHnbn1w84
 Zs0C65jMKpOWs36j/jGhqKamfbo8ngwSgsHfgITbl4y+fWsZEpUXI3ZJE/vgnVEiKHGLjfeUspR
 esWQo+Tp3hAjCyq/3c2DUK7RuYtKCg==
X-Proofpoint-ORIG-GUID: utEd0IcIDUr__C-quCrtn5YKOsy9qJSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190057

On Tue, Nov 18, 2025 at 12:30:41PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Switch to devm_regulator_bulk_get_const() to stop setting the supplies
> list in probe(), and move the regulator_bulk_data struct in static const.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

