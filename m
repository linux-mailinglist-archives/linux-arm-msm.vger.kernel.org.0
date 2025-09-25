Return-Path: <linux-arm-msm+bounces-75195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B83BA1720
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 900773AC4C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A165F1339B1;
	Thu, 25 Sep 2025 21:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0VOHOhW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1337B21ADA7
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758834017; cv=none; b=ZKq816JXz9duNFVRXj3bAf5Z//RHamS75sqDYWwpjO3MtpSsvKWjlPtJQzKpcUG6vRiM/oXgcjLdURtf6oIUEyzCs3sZ79mqHr3mEwNfwulNapV7Nl0HpgzxeAgggwnl2A0AZ4TSrg7mWi21x0fnp46ChEfKPoS3rpTtAgq0QIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758834017; c=relaxed/simple;
	bh=T4iNv5cr2miRA9ws/Q/OPuwuH/G+wg5LNI8CS99kHMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnF15ieNHHQZl92EQ/fbQreH2E4NiB2AEfXcERTf0tZsHHLe7YHWwKrAqkoUSSgDbJqkp8FWDU1jQYVCfjVny6wE/IOglrWJYCqpp1fjI8fKoxMXqmrP4ADiTkjUzOflk6X1+yKXHRZ9ZSFNK6DjyURu4vubKE2QAZUiNGrvU3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M0VOHOhW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQwAB002766
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J0Sf/sBWadKXsMJGTZZ12sEI
	LrsGXuVR6yrh2onEh/I=; b=M0VOHOhWE/Cx9fVGigWqZ3bYbPn0y1apqtVbeGMd
	lnrnbt8IQaVzwyMIw+itSBFXgJJ0XYnavQSHF/Vrmd8aqExIL/6rW03dZcfulQAv
	f23oJXiTbEI3W3VbDrBT2G8PPgXwNxKUnHTKLKkRJaFW0qaaGaLy0q07AM/rMH8e
	/eOeSiWuZQzRBwm4cR8yqWqHOaOrVleQ753l8Fe7BYKuA9X73d1EoPp8iIUX64hz
	zQ7M8Wirx4vT94oRenIRmOUOH0Gf0FW92p6lC3XgoUv6f/IENciZXOnJy2rK9cfV
	vD5fNIxK8JDKaxVBuSw0AjB4L9KPJQTmo+N2xxTZAT/pwg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0trd4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:00:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d77ae03937so39246801cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758834007; x=1759438807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0Sf/sBWadKXsMJGTZZ12sEILrsGXuVR6yrh2onEh/I=;
        b=CQ3A6/0ynsH24uTDkBf2sU+FjFKyesO+EjhIeC/XQoL9uzpIcn4JRH9+MK76GlVGu/
         W2dNaKo+fsIK3QajL71RXS8DMRl7q6COYrs5mHmrY1kCg6UVT2P9k1B/Zdt1Sllomnsx
         ahlT2uABdLr1thu0QYpeLncCf7JYKj0aaRtI1vIAE8Ea7JUP5kdyemddBD/TD7TLJZZv
         OQhsaEqWNuT5oLBXN1Gdhsttsen3CYom8zS/bpXOHnf0uOLsWTb+AXFZOXRzUfic629G
         UD/ZN4O23D2SANapwAaHusUFeM5qorYoIshVA5g/k+b7n90WZhTBbz9SQJnQLXTMJ+eT
         0mRw==
X-Forwarded-Encrypted: i=1; AJvYcCVy+vl8OoLDMUign/XssjeBR+CyrWvMbrP5JvugVlLCaPV7LvFcpinABpsmaNDNE0PQ2sdwodZLIygki8/o@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwr2T3vdbNKM4itfMoit6H1oeXQ7R7TyzGOWOjJPDJlRM8pNUE
	8LWMN/f9tiKNMcGOc1eK0Nx6Cc8xy9TPiFjnLkfYqAXiI7SmXVsAevSVfOg4lrb0sXz9D6mR73f
	Ki+z9pITIrSfPT3JXGEgH1cuCTDPSm1RvVxz/GJ0x7+wHBlTJjIuDTP36DQtqQDOr+FlI5kv3Sk
	7Y
X-Gm-Gg: ASbGncuJCCcKcNwvVh1hkDhCPrFdMT6N/D/yiO44+TVrMIf1dsowSjy5IfFJPA/oZYE
	vTKCOFbHYrtlRk4B7K3N6iju0nCnaQSlNn/jtC/fa3w0AqcPolN+iOAzK2SgXz09EzI3ow2imiz
	iVsmnWJzcDj+xks5GuK0LpOCxm+a7d2WsNKDx8+1g/mfAJ/fQ8aE67hbs66HfpNrb8Xq/xXS/+7
	LqRNa+rPCjoAoh7aBU++32b/JcOxRz9oa8lhwnDZJUs74z3LIWZm7K4s9sJmGcJwl31bERaaqmI
	V8vIY3x8PIANiFsycw2Dhkn5rtkXRIqrhck7JaCTJl1dSc4b7j66Z6g+nY4JotA3x4rP/MVJTA5
	1nDCE4YbcWTgelhfRSHKG7EYBNt8zAqj0Rd3awxphxhy6F0vpPcQv
X-Received: by 2002:a05:622a:a94a:20b0:4db:16f6:9049 with SMTP id d75a77b69052e-4db16f69d23mr37264641cf.70.1758834006834;
        Thu, 25 Sep 2025 14:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSqyJMyZZeC0SdYv6VOMpLT31YAW82OV1CV5+LhKhpeDE/XPG6jushTLuxUA1OesOxbqQQ/g==
X-Received: by 2002:a05:622a:a94a:20b0:4db:16f6:9049 with SMTP id d75a77b69052e-4db16f69d23mr37264331cf.70.1758834006373;
        Thu, 25 Sep 2025 14:00:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313dd66fesm1110678e87.54.2025.09.25.14.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:00:05 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:00:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/panel: samsung-sofef00: Invert reset gpio
 polarity
Message-ID: <anrdocs56hbunj7ga573kopcol34pw5cklrwneqevpfhhlm2bc@qvih2y7vm7q7>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-7-9293016768f7@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-s6e3fc2x01-v1-7-9293016768f7@ixit.cz>
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d5ad5d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=RX7N6JFfHuZ5v-HjQggA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ayK9_dbgGgNk2Vs0uqUUcWmJnf3wdzPn
X-Proofpoint-ORIG-GUID: ayK9_dbgGgNk2Vs0uqUUcWmJnf3wdzPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX393RqvZIgOti
 1DJ25p9J/J39l86s+Rpiid8FAOwC3ha8WzlBv0DUGL5Pld63Iwm/P3aOTrhDeLA6TW6orgOQo4X
 oIJT9IHF1q3qaojevscgYx9pCDFe9Y/uZelZpYfOcFX6Okzv3lGw6aDjb0t7gWectTSSEfIaWlS
 +u9ed3F5Nl7XZPQlYEpSZ2nBFa/oCSIZW+ah1iv5/yDEG73sJtdCMxjnV6MPqN8Y9IZ7ouy2k7t
 KH4GbuYFKSb2wNdMpwJafqr/LCNZg2Jl/FCHiBljgUE5d/mlQfEmFVqeiN0PMrxrwx/VhDDwArv
 y0whJnm0Er1SIv7RfGvbHIn96xQhYhttZ4wtLpXnK9331zBL/5b6ZIinlIXBF/yMFTWyjG1LyHB
 Gi7z0uzTn7q3PTu0UDMD4THPhpCTHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 11:12:53AM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Follow the device-tree change for OnePlus 6/6T and invert the reset
> polarity in the driver.

Reset is usually active-low. On most of the boards it is described as
RESET#.

> 
> Fixes: 5933baa36e26 ("drm/panel/samsung-sofef00: Add panel for OnePlus 6/T devices")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry

