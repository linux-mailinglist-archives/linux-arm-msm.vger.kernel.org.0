Return-Path: <linux-arm-msm+bounces-68323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D10B205B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0923169789
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8BF26E6E7;
	Mon, 11 Aug 2025 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCgSXoXw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D201267F58
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908569; cv=none; b=WdkfrPTVTtPiR8e1JbzyNJCiRaHPkKxBK5xLIw9qpQQTDoxGnByaShYBkyDqev7eA/l1XHtQ1SZ9ajEVZKFy0e9oSZ8g/kZRMI0h23pLSA66GtS8H8OJ+uSmHQ5x41/2W9RL1JMcUavq21WDbpGmNivjDFgunPHI4UG1P4wXd9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908569; c=relaxed/simple;
	bh=4O4wE5pRYlDgkxtxd7NsA6Lt5tQ/BPgrzJSeGwx+NmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OODa8wKBkQsHPLNCtamBbBzL9P6JOSaiBnHDbQs9csHlGruPOMKqhRX+nfireyiOq/D2rWS7wuyRul5FIEobH5pnyU2ArHU3+Tm1LIdyIePeLIW+TymRJDks1Cgf6skqHqdRExOMV7hKaPA/VrpP/qdseU+EC2JtWpM0wDZtxu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCgSXoXw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dCra007636
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=THBO3Ht6NQgUDeA8sx/NDTH/
	SHFPOK+ez6KiHqIf758=; b=ZCgSXoXwxACGoxz5slStTGYzUoW024sR1/qxOGY3
	bwvghtj9Wa2fgvS/D5rLFQPz1rDU50j8kAuNQLZ6boWvIo0BEtaVGOImPiwL1DDx
	2U/SJRru2AmJPjpkEauj1opJ/mrJcyx77UwAkC9kcNrcqD05vMIB8CMPV9sHEqrn
	jfGb0HUsk812wD6iHfJ35jmQnHNraks+f+hRrYHbPb1eKYq/e7bwJxOZHF4sTZlI
	JuWyw8nQ+7NnGdsElSd547SBqwC1Q7AWZ3eG9mhMTiQOtE9tpY1KLLoxuVTI5Ca3
	zjzWZHG2WymBkExvB+yQYK+XVwBwMhOBL1BASqKNiikeCQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fm7wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:36:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b06908ccacso100827751cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908566; x=1755513366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THBO3Ht6NQgUDeA8sx/NDTH/SHFPOK+ez6KiHqIf758=;
        b=TZ36cfxt92PNkzIRtH+AIu428SRuFXiXLhbOKU63plE4fN5WlFOKDxAmRp4Pjrt3Yf
         En5RF3iB6fYuVHpvYzLOW+ulIuACkI52POMH2n350RWw54+N6JyN4q09AN0Y+OuzZ4pu
         gwbnoqFGeL1oZuvhB8BoszkiF+5sMtb1D2k/bJ1U6e3pA/6/qNnFytDbc+gOETUYUdWw
         YDxkaBhFIeynRVMiL8ZyRrbZnuD0KT01ehsKauM31MnG+LeqbL2vlcf950eclOWHewCd
         QC3X+Pm7bxTF1Op6b2zEoIP3TehjlurAHHx7319bbNgk95DCq6wJDUm1+gpSVFOOTyv7
         wJgg==
X-Forwarded-Encrypted: i=1; AJvYcCUCbirB7/9sM/zc10C1PIlAuXzVRI9EmnNl1X2pc9bWUyswRiNXlFMz6OUELs8fPxIw6yTY9qGwFH38PTpX@vger.kernel.org
X-Gm-Message-State: AOJu0YyXMgTZPBTtKPk1acdjOi/M8OYca1tD8gzEe+xoDXscoyfwMpBr
	acw4lqNA05D6LGw5djUHWCPmkA3TMbhG6ZLga+O3T+d950k36yn/S5fDTnfBK5lnwI9teeHAvzS
	wkCm+YbdIk8haj5nxUcH+AdPRSiimn/WMY7RQ+GOjCCRo+7RPW5hvbC1zolXSHb7iIq9X
X-Gm-Gg: ASbGncsfpJxmI42ElvrN1fMAy1fQ2BDyvw18dan0iqONGgl5OgIiFMuGN8Ksa939Ob0
	TAUuHclo1E0H00Yr2atH3Wg/8xp1f2T3Kg3kzKbg13jIwzlb/FINrTlWA/MSkgpwDiW7P7e9sjN
	xHeeWKPJh9vTlMjHePt7pzWANCdFT54sKQmJ0j0vvOmw8tAN2cX7KsgNvobGRdSNCJsqAP0WmkP
	+HyHlEs0kHLpOKerJXz7saLMVhMwwF8I8jqWn+BCaJ4/jkn56s2mfJBkoqANmqjMr4xoVDgBZD+
	wZIx6mWtb4LeMizzJvDoSvnj2kymWnIS8PHB3ow/iQBPzAuY9hVeQKAsCx1anwZzmz7V9jgYnju
	lfa7dyKngJurFjtIlpRc94kJ/YOre0MfsVJ1NIB15ub6k9bT+MeL6
X-Received: by 2002:a05:622a:28e:b0:4ae:fcf0:be94 with SMTP id d75a77b69052e-4b0aed448b3mr160849481cf.24.1754908565685;
        Mon, 11 Aug 2025 03:36:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw7HtgnbrmY5IK3DxlGzc/b7uNHN6VMIXvm5Uhzn47fOPoo6rohuiiCW0D4J13E9SUX5IOMw==
X-Received: by 2002:a05:622a:28e:b0:4ae:fcf0:be94 with SMTP id d75a77b69052e-4b0aed448b3mr160849231cf.24.1754908565258;
        Mon, 11 Aug 2025 03:36:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca6274sm4249936e87.140.2025.08.11.03.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:36:04 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:36:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
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
Subject: Re: [PATCH v2 7/7] drm/msm/hdmi_phy_8998: convert from round_rate()
 to determine_rate()
Message-ID: <ycnscnqj5nkoaqlvtmvgmr3yixx2nyhlah5lchhjbhdkrodo6c@ugkj43u7mvvi>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
X-Proofpoint-GUID: ec6MFiAyUl4Pj8mSvmh_KW3Er8TqY-yW
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=6899c797 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX27M6++dL88YY
 QtMPVilYCk2QSyvbLFAG6GIB6te6mEg3id0qAgs8iF38KEV1YSDUBD8F5aQEtw4zQzwKkLgS8WA
 vBiI75pYyF9aMTKFJGaTRlPcKSkAP/XK9RihBX+Mtmj8m+uumZFqHU5T2FYs+zPM2r/OtPSBuxv
 TBHBODMMfxqgyI7ku7O/NBM+ihwrPH6u5OkeVKFZlC+IsWV7ov8ArG46uDst0MdKhtV5RERGCA0
 o0NUZ4HYH4/S9OBWxGyb+oRhjv2Keal4UG4Ts5859ijS9ukZ4VVSoxhY3KzueKB5nn8uWm84yIE
 Z3phG9SU79S1PxtrwAa2EPCWxYG7bcAiBP9Fr/HcGN2Ss1ypLmeuXdOQqZbWGvehhnhjnMN36Ey
 fh73IRiX
X-Proofpoint-ORIG-GUID: ec6MFiAyUl4Pj8mSvmh_KW3Er8TqY-yW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003

On Sun, Aug 10, 2025 at 06:57:31PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

