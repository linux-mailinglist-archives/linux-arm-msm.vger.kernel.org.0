Return-Path: <linux-arm-msm+bounces-73196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F0EB53FD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 03:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 061A93A1EDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 01:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1160131E49;
	Fri, 12 Sep 2025 01:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9Iwwt9J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285E3128819
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757640305; cv=none; b=PTl39miSOJRxwz+uwa/Ge0/kgSk6rw4ZZdBdxBrmLnZqpe96NPgkUYtblugKiGSETGIxOD9rvp3fCSNsUiTu99KJrmJAUONijSAmvMQSXGUKwOUN3czgs3TmNS5P2uxtalBmXoRjQP0WQv9/I40j566ogsZAYRw/nFSUZTz/PK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757640305; c=relaxed/simple;
	bh=OXbPd0+GhJaf3PtjeJYGSP6S/zKaFbPnKgsQKZXpZqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpxhPLQQYaBUtP1vdALDyy9Vhr9W2nywenPwmTnowuSo1vizDjlhkM+0CsyfJhOYdPPoMYREscVeZ+sQbB+mfD3O/acJdzX76+mxhTQaX8lCI8Eimh9UET+u0ofiA7UXwRlx0yEocYLdImgcw6neH99qk/+LrAb1PVOeUH2XZD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9Iwwt9J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BJlTF9008188
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jVL5pFMdzfmtJDJqaALS6MKa
	H/CYA6RWxHVUSd0whRA=; b=Y9Iwwt9J07xqyPZyLzirtvGTfSjHJt09X6aPx4IM
	5POqfmcnjfJVtTO5/hpE5TrcUBPl3rE+xTqDE2rlFVAB/al+OJCeK686UlLyg7xX
	yORbypKnJPaJtWCfJGZKXCouDKsWEMSsOSYPSzyMx9sFPzK44E4DkUp/qgDxvmuR
	pssa7RBjWk1wm7liEMXUMJBoNYJ0HIembptxXEw4L1v0tsamZ3JevPVKWWMAPRtv
	gbnlBfOkH4PEsGK4Spu4aE0xLVq9eYLq5m/J5vjYUGhtFHcw8ZfwBDPniyAaOSCS
	R0eQ8dHfGryL+QgnO9tgEzdSPgc0E/nD7UO3PStRdnuQlA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapt2tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:25:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b31bea5896so15086641cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 18:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757640302; x=1758245102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVL5pFMdzfmtJDJqaALS6MKaH/CYA6RWxHVUSd0whRA=;
        b=w9MZCf69EU/x8dJ6oHXnxJoMboDlcIFPYzCdy+fIGgIgtKf7gGfO258IZLvuQo7HGR
         YS32cFUcMYfwcAEvtZIdUsrtfz95r02B1oX0om5aSJvh7cz2lTG0m8kWu5Yt9w/7iL+I
         Ega6cnD/CWu8eYT0CVuOCDEV2suTx/TIRE6BnJx04L6Edbz8Bfj1+fY2vNavxYBWO/bW
         U9xbMSMG4JGl4xspwKWB4cBAGLlZoofaRJs5pTO+7mOjJsUbs36nrTrzlbGM10XGSSRV
         XAslfZ8ZbIzmduQhOG5AZkFVTlD2566RIF9JJR4v+0oYjmUYpbSXW8mgO9VrIOec4S4V
         8heQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5+4BBArAW7+uHFHnQFeYMWklUQlvYZqdRWbsQpD12k9EIJ58gtheYpfLYcfv2ls8ZheNTT7Rb43BixpV4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/+UNfwUoZTzdlyRUM4ZWbJtfZaz89GaQ7V3ruG5Q7OWwDJl4S
	Lf/sJAxuvNUXSXjTgKuGY/W+00EGJex13C0iHLAW4fSqxJO+6jRBW8k4YpdnUf24Oo4flhFSXC6
	YFu04duCT5VThs7L3gc8oQgRjQQBZv91Tp/5UM7h0aDO8pGH20WIjl70sT57Rj/9SVuqL
X-Gm-Gg: ASbGnct9WJiH5jWVk1leJK0LKunDuQUrs671qLkBM7UkWOp4t0UGsqkfUmIpQTsU3H6
	DY6w0eYLZdOmUe3PUuIXy1prIqMNebVQflgh/htEHASUlP7CmIgw4uYK8ccK++PTJ+lhg4Da5tQ
	n4QNXq3QyxM37vSXdLzdXmU20V7udHDStATfL1accPAcisc0JENF/kUwW3uKASkMlu370Z2Ti7f
	sKn11mrwaYJTOC++rzn5AsfK6CD40HkJa1OhMfJy4T/aEuhblTJZfjQDQzupjnGHFfCopJ44qpb
	KY6ECkee5HJysoz9ALhNv/Z6hih4pH+YO9czw9nOIqnNGN32E818aUYeIHJWF8g4cPHaXaG5CXz
	WJQYWScvQ3RvKCjDqLP/gRkkN3taiosQ72W9sd4QOZhcrOt+WJjtn
X-Received: by 2002:a05:622a:514a:b0:4b4:c44f:1a7b with SMTP id d75a77b69052e-4b77d0bd2f7mr18790091cf.62.1757640302356;
        Thu, 11 Sep 2025 18:25:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+QdUbchdxCgWR0jpxz6S1/KovEnrGHT20/GZYw265IPlYpgXYKdIaCAtbH/9CHq+GGr04EQ==
X-Received: by 2002:a05:622a:514a:b0:4b4:c44f:1a7b with SMTP id d75a77b69052e-4b77d0bd2f7mr18789701cf.62.1757640301746;
        Thu, 11 Sep 2025 18:25:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c692daesm788199e87.26.2025.09.11.18.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 18:25:00 -0700 (PDT)
Date: Fri, 12 Sep 2025 04:24:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 04/13] phy: qcom: qmp-usbc: Add QCS615 DP PHY
 configuration and init data
Message-ID: <3ihzpsmf3btzeltxggdnbheji6bdeornravua76adw5dhotztu@e3fca2prl45r>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-4-2702bdda14ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-4-2702bdda14ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c3766f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LEMoh8uNuNVMCwR6SuoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: zaIq_O1s0LEJDVk8yZbTtd2i7aFwJj3P
X-Proofpoint-ORIG-GUID: zaIq_O1s0LEJDVk8yZbTtd2i7aFwJj3P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX2V9z5Rrg/9oJ
 taRicHFtb+0Iky6lYAmavLGgzemV+ZtUbW2wgSth4mA1QylQgVHlsI5RJ0P49JH5HR6T1E5KY8C
 WhH5N5ap/qrLZU2zl0wfHeR6tyqVIWUYjhJegLNAYQlWDoicrZYXiQsGy4qgEXgCpL8zOLEUSKD
 WyWZkl7ZOtOfVwBVN6gM3ro+PYWZqR1p+GjHCkGD1Ev2d663Z25LsJnWJMd4QoRZLElPkxbtUsr
 HclqRvht8dO4RMWRiWrVKlRs1DP6+Vulie+wkt0GB2CuFAawmBKjnz9FsKjZhuA0TV0TnMPuWyN
 pOwTDu0qAph8bQTzvc4wKu6rtea6biZHCwnBI7t91KTG8e5t2TJYNCe8V9r9YVaNId8z3W0bm43
 H2UOr+dm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

On Thu, Sep 11, 2025 at 10:55:01PM +0800, Xiangxu Yin wrote:
> Introduce QCS615 hardware-specific configuration for DP PHY mode,
> including register offsets, initialization tables, voltage swing
> and pre-emphasis settings.
> 
> Add qcs615-qmp-usb3-dp-phy compatible string to associate QCS615
> platform with its USB/DP switchable PHY configuration.

This should be the last patch in the series: once you add the compatible
string, it is expected that it works.

The patch LGTM.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 141 +++++++++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)
> 

-- 
With best wishes
Dmitry

