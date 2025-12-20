Return-Path: <linux-arm-msm+bounces-86022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C526ECD2FDA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 14:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B41F23005522
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 13:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DFD242D7D;
	Sat, 20 Dec 2025 13:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="icc8dDOE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LEZQDEAP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0893A1E64
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 13:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766237834; cv=none; b=lh0Xlkru7jpa/9DZGvZ5kKoqrQZRnFMpyMG1sg++kBZk+m6eRVPVy52LglcKlXo7QZCjdBj7zZTintbA9e8zHFOXNXa2VgOs75xWuzqj1mzVz/Zg0YRqmYJyEVLzB98lB3jMV93IUqtJwRIFsGP66r1eGf+gmsUPoJNEoFCRQTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766237834; c=relaxed/simple;
	bh=dGnvps8ukeLQilQeQDda2j/+IEr+MUbWBkFHxTQOU80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVdgmrY7R1Lanw79v9WH91+lwBmE+P11O85as79ebQwgyjMqGyawVnAkOKaykjdqmPd9WugAZuU9YWbOB5L1fF9yEQZpvK5M8hhkVeaWrCFNqxCv1CHLnGijatafNvBCpcYyWpkjtd1fDk0fBB88D6CCjDD1X0QjyVuUEjEKj4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=icc8dDOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LEZQDEAP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBOnFC3812329
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 13:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=onVr/ykTPBWcVxEDt3BDI+kt
	/cs0vi1mzT38qepZ9rU=; b=icc8dDOEwl6cht5OL0a3XpXioLWuZT4mCuKAVS6k
	6PHSyDQOsD1g+vKvzTMahzUBvLg3HHZ6sDJ9c9mDnrwuezCbqH8PW6r9jLxPqFwM
	Uy1H0JsJ/hH574xb1A9xiGg6Jb2K5Z+Wy2oDFUX61b41XSBpjI0872spNHCwc0O4
	lkw6GvUo/KtdTVdyaE87bUQ2ON9OYe+l10jMUP+squBxcR+eBrTK22vbTvx2Dw7t
	nrg1fbe2yfyXtK6nICOGyH8QcKt01yIZc9EvNbKdasipwve0GPNzwP5d9Bg6paDk
	JXI9vY/9R8lZxQg+r/V7pcbx9O8nyKzs06AAdkSHGdpT3g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru0qjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 13:37:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8823f4666abso63318236d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 05:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766237831; x=1766842631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=onVr/ykTPBWcVxEDt3BDI+kt/cs0vi1mzT38qepZ9rU=;
        b=LEZQDEAPv5/BWxSNVW+Q8X1GELk4ERfuxX8fXCCaMv+/aiYCtPPKvNCAii9K7EyonZ
         mwvD1tDLJ6EfK7Rqz0sOtfvUfxiykryYBn6MEsNidNOe2l1OLYNZgTySgu2YJsrtEg29
         on2BTgIm6I6pkB3QKsRLn9IAXh8AsmCl4vqrqc0ZDIiZ90OxpJ0U0R5nBsbYYDreFQWr
         Ej/K1U9XwCEj3L1wt2wM78BKVCSkfa95dOd6s+3sgZKvbB6IL3fgstK4SVy3rJkp2aaq
         HXmQ8Ph4P7qjB3uxuPGWxwqah1RSG/Y7LldRrZG45v4a1K2VfZxZus8Z83UW0TonXU3a
         iumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766237831; x=1766842631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onVr/ykTPBWcVxEDt3BDI+kt/cs0vi1mzT38qepZ9rU=;
        b=qKeMAovejqr5sIdq11lwp8f4hB4hbc3r2LT45JFJH8TXRmfIfAGKhqQNVzQo8gMuOA
         x/uIePwhqXxbW/MTGSBrJgcjaNndv7Hooysl8DB0PT2gaOhW8S576JFQ7BKwVgdk4Kr1
         HZe+ZbgZ38mYjQ9nAvKyTgy6/BvMrUpew5vbwcLvyr8mKlbeNGifed4QO4NFrx6RDIiy
         NBusWxwsZi+8DSlmISyKWm6uMQkWDQWMFRN+Por+lzwi9G2Xn4Xg+qEVwry+myTtdXfR
         n4eSXAln1t+kWdzsCSGUsZ7xioPIlS/Te2O4TAxlJtg9GTP50emqiJEnjiPcogxbM3eu
         a5Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWrNGc9cY9s5fWna+NHNYw6vHEw86/HHqGjAF+o3opmDowPvphPWiaja20qnh7S4U0ID78bHNFoTbhuugOw@vger.kernel.org
X-Gm-Message-State: AOJu0YwGtgU8XV/JGq+5s9sbLX1/fvaWWU3xL7PgGT2RW6ti81UK361K
	RqIxursNfy9GLtCuDZQy88Q6HXaaa5SKJOXOkpvHJOB28tUWaokaKGLXcv0qjv1AGx0uCx+sO5R
	2kCZsyscirt8nLYOn+OufxLcmJmbVFdQzznUUav0To1hZDGomxOXRIH4dzNcJl/BMV0Bw
X-Gm-Gg: AY/fxX7C5R0SY2cWkzQhlV+SrERLoU1n8yuzFF8vApgg0Cf0FuxR07+6Y9IZI9s/Bbc
	YFU+zYDlSaPsIrk0X/oipyhnOd9XKOkm53chtTxwtKRF3Ws8dV2wb9Ww/suzJfxZH1ygX+xi9N2
	s8nWT9r7WbWKLVjaEwuZJ+w5Gj5KSTQ1te11rWSyBhaCmIlZOEU0LUhoowSmZTahenGWd5dlKKi
	4bJQ9XILkaiAZZxrc7az2bjvmYCsWnc/5k9qii++lVl3m17FbYQjZYiD9dATNg8MhWpgMCmzGsd
	nk+MIajRo4vBbjHWE0njbXQVGdt7z2ueFj3/wcjP01wqaXp9i5HYoVh7IFG4rT1N2XWvIKue77q
	WOFWOzNyMlhDzlLcGgyHK15gTolwn0un9kXMMLI4yu9xRDL55XvIYf1SzKmsrWX/Tkabkb1tYYm
	rwEeCPFQ1XtGgPnQhmueeWOPE=
X-Received: by 2002:ad4:54c3:0:b0:888:7bac:7a1a with SMTP id 6a1803df08f44-88d8369ea81mr71771186d6.32.1766237831378;
        Sat, 20 Dec 2025 05:37:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoJmhc0j1QSHWpqeB1INPb1LxQclfOysI5mjmJBEqKXoqG/hNFTCz3XTo6pOZ9BO/LtyeplA==
X-Received: by 2002:ad4:54c3:0:b0:888:7bac:7a1a with SMTP id 6a1803df08f44-88d8369ea81mr71770916d6.32.1766237830925;
        Sat, 20 Dec 2025 05:37:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d64sm1485257e87.49.2025.12.20.05.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 05:37:10 -0800 (PST)
Date: Sat, 20 Dec 2025 15:37:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: maud_spierings@hotmail.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: x1e80100-vivobook-s15: enable
 ps8830 retimers
Message-ID: <ia3f22isuxflakbyphrpsbobvxgmbrr6rwysh7nasqmvwt4h2m@t2x3f3fmbghh>
References: <20251220-asus_usbc_dp-v3-0-5e244d420d0f@hotmail.com>
 <20251220-asus_usbc_dp-v3-1-5e244d420d0f@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-asus_usbc_dp-v3-1-5e244d420d0f@hotmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDExNiBTYWx0ZWRfX079oXMuiQmIq
 Q62WS1ECrET/Z5UZAI6xA5Q4FLxRsksNySmB6IgZ8bYQSIjUYYC0ViIAZu4j28G6hRI85dozmqo
 7jY3dGc97wP0ZN2Cu9/xsGmozECVdNI2O9CVZY0O8SoqKSWfU8WUHZYKW3Ur+gW1L162YSCZgab
 RVjlkxuuxpHFYOploNHBgecdiA6/MEoiqRzg/eoo4Ia5SLpB2s3ns0NqrSfQKYEbuDVCDNqIOUs
 FJv01nUIRoPgrdhGCBGqedA2B2PZ2fZfdzzEkMeE0epVzRT5gB3ikiRG/fy9KWbcd9h/I6lbDsR
 1ZwFeskSjwuZzyX9/gRDWcb7FJoFH10B1daiPpqXImnMqXvlyZKumqrxyTBk2JCpyGY/mlLP9iN
 /Rl6NpoKL02k4Z1SdFyz1zrhlSkj3K6NZLTT3HkCV3314XB4RxfKur3eE+yvX7FsXWMBGnr8Ov5
 mUfdEAePB5eH1MYMEOA==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=6946a688 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8 a=A7QAhaETn3pxQinkG5gA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: D3WBCKtsQeOAkSqM3g8s6BAtTQECqDqI
X-Proofpoint-GUID: D3WBCKtsQeOAkSqM3g8s6BAtTQECqDqI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200116

On Sat, Dec 20, 2025 at 12:38:57PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> The Asus vivobook s15 has two usb type c ports on the left side, these
> use parade ps8830 retimers like the others, enable them to also enable
> dp altmode
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 310 ++++++++++++++++++++-
>  1 file changed, 302 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

