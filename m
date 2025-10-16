Return-Path: <linux-arm-msm+bounces-77640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EA0BE557B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 22:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34FE21A6824E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 20:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B6B2DEA8C;
	Thu, 16 Oct 2025 20:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HY3ukzu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCA12DF15A
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760645620; cv=none; b=tutgH/ApWIXgE0jtBYky8Y0Xssr+9GNmMGT2NdzfIZZiRWzp2LPjpfeHcNH7Ob+zy3brQEuK+95f3kVnQHSf10uvTRV/3oKaGi+7C01PXVahLSwLEQ/eevsUM0SL5anqIIrTGkf2efnhwFKOBLAhQQwV7dbuzNUJ2+mOt92JI9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760645620; c=relaxed/simple;
	bh=O7HvVyjJWh1+92gHAyUFdd6vnnoG1EgYJyiOAiUnPK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJqVsl7yYM7HLwdxWSHcYd0tWKCuVW1JbEGuAvx4l5EtUO1T3rN31g8/YC74JoCk+3ZNXKgTHcU0xGw7BbJTr4L8kiAWTGxh1/3oszmjxJ7kEV7QD3Az2Op5biR+h6SsIp/QEPWkUNDRnejoohWb5czCmKIE2fdPoVwVArtDih4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HY3ukzu+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GDWaco004155
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BVqwkBK7C+4usBpdqeZOce1X
	iXkyQyUXbdkjEjS/bvA=; b=HY3ukzu+mNfhq+d/Pav+sgGVuIBjQ2C0Xa5fFe4m
	RoVC2bd+U7S7UezPZ+2AeaAstaYXsDQM0yhWD8nM3fxwMhGP+nb6zOrYt4PNrjaU
	pLYvuQqICD6pu6gLAajfBAX41NUM9t6yrlBTHWdLs5cCyo6PbYrCWurmgInHZRdB
	ThVV6saOvhr1g3uzrrYXu2hsi0j4zbiTkDgby0JX6GbojHGsMxNTAvw+2U+uezM1
	oM4Pz0mgkR3/gkBtyJFMTs2FeX7Kwgi/wk6cP4UhzS1TVF358V4+P2R+xR6RmeA0
	2eQf8/JcjdyAqfUngA4CUyPqLWZctf2TGVWvXkpYEq/Y5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwuynx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:13:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85dd8633b1bso895227785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760645616; x=1761250416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVqwkBK7C+4usBpdqeZOce1XiXkyQyUXbdkjEjS/bvA=;
        b=bz5AauoecboeH3AdWndBO37pfyEzF9Qi+qA43vvusR9x5P9GvX4Frgi/54PI2ATsw2
         QPILpkrTozRfWwuflaozWfo/ZxgoWtc0wTmRM9ptpuV7H93W4558rnmwjZ/daewrynGS
         HRVXx97t+ROrBjvg2dWU02Ihg6FQeTH4jP6mgcad/pssjEw7ZmsKYzSPXWH1sh60Pqkf
         NOBvX8XH06UEN2Ve3Tmsf8ajO8GVbqPDuV9QjpXEnyu/EN76efGoZBdm9KBvA4voQbCv
         RUZ4c4BJqWMZTkbIgtDpIMbr3PsO5uRUVPbjJP5OepBgiflmzkBxNZPrJtgKFl5FtEgS
         2PmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjvq9UEwyhAhZgsGH6yWSImcSSODHDW4xGRkHCL8brdWhYDWFLTyfUx38h6o5pwBejVPW8SQnBSyZNqQTO@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ3cEnfKjc8yJD0GF+tX0a7+4JTPaZCo2nnft+IcqlzFn6gNbL
	rVzsS0kFxi61KLQqN9EpFo1D7QA2gTO+/705a4zrjWm7gbh10i2IZpmVP8RfudHP78vmrL4aAD+
	f7CCDWPCF/7mVo67gMPS8usWuTN7/k482NzwTqfRQ9xEL/2YArVfu7YF1c0R2WMs4dOfA
X-Gm-Gg: ASbGnctvKSd7qbRwOvYzsGoA8pIJfx+t51HXzZajXLQ0CadqYLT0A1hyOB8l1TitY34
	LGnR50RYgIca4Ak9b1Ym6QII6oChnf1hNtzRvB0B6qRoJCbSTn2PXv3c+24ovTD+aPUydKyfLsZ
	S9B8PVTM35OhtEpdM3iUdBc+6Kizc9+9Z9rCMyFAJBlg2/yy2No6vnc0s7fvzzMldNl/oUn8Qiw
	PNTJSZtZvQrou3SuPl8DMiGiNgItcl7aXZhda5Czee9CzhYn+ppOfka0WCITeZpqaH23SP1nONx
	v1RJYwEoe+UdgP6P0jw3nW9SXRdOdmnmSsAse54EApfzmkKHJJmgtk8/F92HSCuY37e8EXC4lec
	vNXh8BXPsTTdwKjpXrsEXh08hFxhgHmUsvjkAf/jnr4hSIr8qV9aTydZ8F9Lcww5i9TSUcyz/4P
	e6RQthITu0Sts=
X-Received: by 2002:ac8:5790:0:b0:4d5:eedd:688d with SMTP id d75a77b69052e-4e890fdfa5amr71048591cf.30.1760645616398;
        Thu, 16 Oct 2025 13:13:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxGdezOd1qF+LssL/Y7iPaJQpkE4Smw0fe36efmwylumTn5FP8jrXp4xfot/RsukELYTcXfw==
X-Received: by 2002:ac8:5790:0:b0:4d5:eedd:688d with SMTP id d75a77b69052e-4e890fdfa5amr71048241cf.30.1760645615972;
        Thu, 16 Oct 2025 13:13:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563a48sm7309026e87.83.2025.10.16.13.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:13:35 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:13:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: sdm845-oneplus: Implement panel
 sleep pinctrl
Message-ID: <f5guyszcggcjnsp52uwexw3gfbcb5vakpydcr2g5blpblsgg44@qzx23rn6ycco>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-6-ce0f3566b903@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-6-ce0f3566b903@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX/1NarGQDkwt3
 F/qn0wZ2lEQKHxdQJyw5NQdqtCVz9yTnRB8cEeyE/VydqDxxfoojlWMpmOVZy5qilzQSwdqEHUS
 nLiScp16MHNZPD+H6PNnEoHiFSrnt0AENa6SDQDReTUNRBRJwB/Z5NamhzXMlGAufNQbD3Yubki
 9TYcIHI5+Nc9xysRSojNouQ5iu28bnfSPPz8J2UuEaRaXftgl0CtR5DSzGpdiEd08IlJiU+/IfF
 fvJbZNFvA34k9+J2XdWBq2N5BDhJ4o0yMvBdP+97niqkbteNca86qYOXFWouMTaEfWcAd5xvXKZ
 /9N4lX/QTD7cxoRNhKKCtGbMEYUgVGkF9v7WEBfruwEW7WQZlxKZG/cUyPqyvf4J1i7kxK1eaaB
 r+wmQAzY2mPwDb9VC2FtACuNG6JzfQ==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f151f1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=WaRAvzN972V7znxJzTQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: evdvMzPk3BIk_Dz7rU4kWGj9G57q37TL
X-Proofpoint-ORIG-GUID: evdvMzPk3BIk_Dz7rU4kWGj9G57q37TL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

On Thu, Oct 16, 2025 at 06:17:01PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We can DSI pin from 8mA to 2mA while suspend, do it.
> 
> In theory, should give us extra 2 hours of idle battery life.
> 
> cosmetic: sort pinctrl properties.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 26 +++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

