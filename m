Return-Path: <linux-arm-msm+bounces-86040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C46FCD3408
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06573301275B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 16:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9AA2D8DD4;
	Sat, 20 Dec 2025 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lew08moB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eDUuAP7P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EB9150997
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766249531; cv=none; b=aTx1keoQizlkbKmvUv9/5gNsCODMhPvE0ZMuB6YJNfigNcTtoTNn1kaRtv+9iX7pCJABhh6fVdQztnhIqqN9LWrQMWvnBhT8DT32+pW8d2vzzX2b3nne/7QnmG6aTlhfVvk+uKl0OQJm4Tnr58IZ546+9BDRdiL7o76HWUC6ONU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766249531; c=relaxed/simple;
	bh=OPq2jgXtjTjqBqxOYiuLvmvpLqAJDVsRGupbqBGx7rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iT7LIBQ2/RkcsaojWVGIc/ptSXuiB80KpeaUPJvNwEK2s3XWZyjB6EJtkkPXUbiXxniKz6GQ9ofXMwXoz8GtApQb9yQyt0TuiA3dr0t48o7AjgtoNa82sMtOm42etIYdfj3uMaNa+9/ixLeny/OzukeMziF3Y5ur62uVIKGdmjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lew08moB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDUuAP7P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBRvFk3650203
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=md820MSJFmMhxzBhoy9K+H94
	1G1BAf7npRq1mwTR9kI=; b=Lew08moBKmsRyNrL9SesOrsXUaVNS0HMRZ6xjred
	dIzNReB6N8e/4pAtN4YPXoTQR6By4GSvBp+61ubKABL2PmWQk8+SR8swpBmSHbbN
	QfhgGr2697eMHBLSs9TYNAcgC4U0NpgdgYk+WGPCRM7EFJgoHyX2vMCw2Q670yrz
	55yenpkIGWRxOnV9Iei8/HLHV98+BffG+4SdXsVnaEMNkWVkZxXs6YsDYAjRwzJG
	FKrW3pQtblUqMgk3I9sTqH3BU7KD/EZ1GoQ9c4styrV2QeWcVr8TASDSHVs1umf5
	Kl3UQmcl0aB5ulsv5svVbeRcjyyTFsiVvVy0Ifs55vncAw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrws099-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:52:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so83594421cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 08:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766249528; x=1766854328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=md820MSJFmMhxzBhoy9K+H941G1BAf7npRq1mwTR9kI=;
        b=eDUuAP7PYK8x7i5RG6R9xFIxhRm+sP+7Wb0inki1JaA1OrrKNaki/e1gf1aNx0EEeF
         B3yGTA5mDr8+gIs3WaCmbe4/05BnSETAz3tjbXno8a2KQcu/BF2IG4ZszCaQ5rmzHvKP
         K/JovzF4D4AHWG9sACIy2yPiF+R4xTP1941exQUREbrIOnnL/Jvskfq9BdB4PwVB0tpE
         Gm7oKnGKNGMK3cpIfiWlauhAm00iuCDuCEIMWRkplSpVcG9+a8QS0/Bgh7YFQs6tplAJ
         FOwUroJvwJtDRDtMIHELouV1HnhJnANQxLTyGnY4r24bn72h9vPKCXTOGR8Fo4+MHrIq
         XmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766249528; x=1766854328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=md820MSJFmMhxzBhoy9K+H941G1BAf7npRq1mwTR9kI=;
        b=gvf4wqSkZJ84ShvTz2fk8ljDjCkEoa8T/wqD1fRL1f55CxTjI+TYEuea2tG3VAnbkr
         L3ZPGfS15qcWeyhj79ZNDXrAnsQFwdINZX2s6gG9fJYme5x1hqef7fAu8A9hL+cD9SaN
         6qxB80CsuQ9A2s6ugLkhwkpgRx6skfARWs8NoSv2ZswWsGwm29rpmYWmw6wW5MV04u+y
         8vHQE6wT3s/P4DmI2xAYflO6KL/OQ/zrNMXTIavz54Vb5Szn8OKQ2XCqCRUMlLOc57m6
         8H9rnngfdn53bEO/CjYst+g0kXHqSfKrG3W4YCAyOO9vu2w/iKaW8HLpsGddudT4PHg+
         LFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMwmcNpGFsSaYTbbZrVsPX9a+m7wxJNQrMenC2jKqUzF7RjKoxIl3Av1iCSmfZnX3Kw1yxYMI3ac1eIDuS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzq/T6VRt6Cz3e4lZplrxSsl71JN3g6Y2h9HsC2IpirYetOKh2
	H54WRoHhMVQKuYDs2b9EDNoPu51fsWPirju5ChJh+eRXVNED5qQsMSskdxKTXpAhWezS3KtcLok
	YBq7DPq6mhST6G0+UvkMD0Kqv39o0ZNY10Vktyd5mohG5+19b13dno6V/nGFc7B4hLZfcVhbxHt
	N3
X-Gm-Gg: AY/fxX6bYnHgdJEZ52pQQfYINLCoNlGm3Hgmr0TNgrVaI4Qs+wRT9MLjvysTJfqwjkT
	DGw61vY7NSYIkbzJ9RS+Fnf5ByWz0Ws72Av9AUndBgSu9T9c2Lvs6CmHrV/a3ZN6Tqmmlb9EC2C
	CWNkuvDcf5ijKOqm6k6Y/5vzoYE4MTf3EELns1tqienw4CdNra1fxMEYDLYtXUWtq3Fm/z0U00N
	mi9Md1mYhSurc0U+57PRC10IY13gwETl7jm9qtKSyAc4ebhOKu8m/ZI7N1aj8QTJfgmDmHxVwBq
	naPEPt3rdXgY17+UqB6DGwC6WziLFEL/kkvYHAwBa0dkQ5bzmIBJc1fIyj8cztLObga3upmS4Oy
	k9Y8P3Lsq5tctSRWAsdsCFlGAgz6XSdVtPijReb5pJXvX8fkIIacAVyyEABw5oblVfXJJD83Lf5
	KalU1DP1SAiMJ+3lNPK3rN+Bg=
X-Received: by 2002:ac8:7f81:0:b0:4f3:4b53:a917 with SMTP id d75a77b69052e-4f35f43a9damr148411961cf.22.1766249528040;
        Sat, 20 Dec 2025 08:52:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6MpmVZ7ZQhZ40pLdCdrBIOL53YEAOVIlZxLQot31bDGrYAK4K35/1+HqCakHdqkzMA7+JTA==
X-Received: by 2002:ac8:7f81:0:b0:4f3:4b53:a917 with SMTP id d75a77b69052e-4f35f43a9damr148411641cf.22.1766249527582;
        Sat, 20 Dec 2025 08:52:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b36dsm13394911fa.30.2025.12.20.08.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:52:05 -0800 (PST)
Date: Sat, 20 Dec 2025 18:52:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/6] drm/msm: mdss: Add Milos support
Message-ID: <475izg5bi56oefqtqkvqeyspx2por66zrw4tgqbb3f2ziaghyt@tccm73sl2u2e>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
X-Proofpoint-GUID: Svl3BDT7zQ8G9caugEhohWPVNerHRMHZ
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=6946d439 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Ybx_Rsa12JF0X6GijNIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NiBTYWx0ZWRfX5uDMacHxVa7A
 PIJVidJcwe8+Gh5ki1/UiwjNJaz77sW9MOkO24qHsPwn9bW7PhSVUlrRFAZYHlJ8YrbvBeyaxi6
 8Q4EFCBXKRdFyQZgbdpMcrdcQbGP/Ie4BNwUlyRtyMr6R6hmkwXevuoB5Jf0m/BV0zAdjYPjDyr
 W9fayPb9RNc+fnhZJtVkgwH07inhacvNN2f0+rpK//cnWZzHy2q41ynI9pBW1GYYImETHbqQA5Q
 1EjR4iYsqWMW45Z1mmyd5ce5aRY/60DRqe4BlivNqh79kas5Cc+IPLBYawUhZmWVnyhtcQZyJb9
 dM5yxtD9EXdnzHGNN8kNZyhk/uyBUxzG3ZcJKtHycvUxHY2TN172T/DBFA+hlhBTD97o+U06CT1
 zgJtngLQ6ODHOBCF5K9k2kwPTcCsXUxevWFZnuFVpT86uGwGBoJ2nSmYP1Sssgmx7O+dUW3WOuX
 4K2sWG9AT84N0Xv7/9A==
X-Proofpoint-ORIG-GUID: Svl3BDT7zQ8G9caugEhohWPVNerHRMHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200146

On Fri, Dec 19, 2025 at 05:41:09PM +0100, Luca Weiss wrote:
> Add support for MDSS on Milos.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Though 14000 seems lower than the value for all other platforms.

-- 
With best wishes
Dmitry

