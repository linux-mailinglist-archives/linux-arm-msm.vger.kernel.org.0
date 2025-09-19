Return-Path: <linux-arm-msm+bounces-74240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0946B8AF08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 20:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B21B1C8334F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 18:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E9E258EC2;
	Fri, 19 Sep 2025 18:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7q0S1/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C74E254AF5
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758307015; cv=none; b=WRlV/XpWAhjSy3rvIqt242XA8REmk/btGKWzeEUBMtR3Tti+tdeiXYm2Gdx0IwbS0hiHtlhBseriFQWV/f2BUzHnFxFYwXwaBOv8aNp60AB9oQlqVJF6L13L1drwp4QhKL2IXgMh94V6QS3vOyooZ9D7qu+dSaREsnC7Fks2kAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758307015; c=relaxed/simple;
	bh=IaLYIZc2t4TteSa/Pl69q9ZnKun5P0ZXuMJw+fMVLMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPIjinTVgxQPptXhC5FYHYG89AJB7+Oinz+UctnXz04AaJNaVDEL8A+LNDc6XXgADbHvNKjlhQIB1yzJxy1l0bme93yDxrFn51kWY/oldKATmrsDczhTViDTnQ8jmRcu9T2pxvKsop27wJZX+8NVqofiudi4JNZUQQFc8CZS+zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7q0S1/5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JEE0Hq018046
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vRz1jj9Fk7FMvLwwInOIipNq
	laSA7q8QqUGbRTS/cL8=; b=T7q0S1/56oKp3yty86n14aDdpqh/9Z1ndST+684P
	M2XBtNCbRl+Y5bvzIB0ml05IE2bRW/vvQyB3DpluNUjouIkOiWYFGDdEUJXm5oPm
	yWhbufNtTvxpjoOgWUOrRlSRFmvIosvpaxA0oEzFhH5Wq8XHfdHBipJ5tzHOmGow
	YxHsR0LJrAh7hqTmVoQLeK3AtjKvv2VnQThzWUSVNolN9Iiq1EKBy3fwV5T89ppF
	pymjmt/7ch301Tv4NWMQuyPLQ/f73afpyyF1I0AxtjY+x3tk/Gx8TadDISYMx7fX
	y9x2ai+Q62BIQCndoS1Vd0saC/kxj07IvK3yvyZ4coBvvQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982deg35d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:36:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b7ad72bc9fso48427931cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 11:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758307011; x=1758911811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRz1jj9Fk7FMvLwwInOIipNqlaSA7q8QqUGbRTS/cL8=;
        b=ZtIbaIvh3CUUjBPM+6yU5Jh7S6hu7pZdfP9hf2ZfUljkiMpUTNo806PB0bqz9R9ARG
         Uz6beoBuHxaMOe6ab3uUlWQcda6/bduwrkuvfkchX46OBqk1bU7C0dbVAbIRqwNI8KAt
         1grkPonfoDDxy0/DsEoxkiXAeHFF4wSH+c2xTG/1yfItISkdtKG8/2LphrAmDi3TEvjX
         uszheYWOpYOG8kl2o3bT8GSdn2/6V0snTkxuVGS0py6/TsuS1jdqtyPTb8eFP31RE3PP
         ThIiD5CJKdj8XkXOmH7X/V2S/JTMUcS5kAR815eARyWto8t+GboTjRxipQcgyPY/aQn0
         k8iw==
X-Forwarded-Encrypted: i=1; AJvYcCWLv+uVV1Y5i9p787aIWSuDNOKf1inRk3PNynV7ejfTZkvP1Ec+2wyT+XWONgqnCzQSHGzWfNAJ//u4TzeW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyn9sPW9yA0PzyU8wEgAzo9ssusfMdGBX2wxiM3T6zl8MW9l2V
	ljoRG3Lp2E70goQfnTXjSjwgrZ3JjGSbrcICesx7CeggVt/G5q3m1BrKZPpsgt7nk7OjrqjivvA
	wse9tWD6gIfwlpn9u8pGQ2SrTMM+mGa8oYKqtiRB1AbYHHEVx8hlXtMohnsSS1Q8NrOES
X-Gm-Gg: ASbGncv1IFY9rKuROBjz8IdQspWyrX/rk5o5mCnjv1KYFtR0XY9ZYkrtkVHkKqQbiuq
	i+zOT83paCnSJD71goxxTVePgN1fvtPNfFEAyfZZpgcW4jSYZhSmMPLgACae4N79Cmsn/j+6PaL
	WdNZcQLGgwB1sLYx+NwatUDQvf49yqHB07jPq75Vn9zO5NXom2DI70cOA5/Sa+6tNNVU7ob2zBU
	rnAVA5DY384TjeTw8ap2h5fbUZDnGhQ0Os9q6vG+Q87GXsOUX9t9Px+A8ZeXB6lCkZrIFw8tI0w
	IzorAKzKPJS8CNFkHHmLwFG7+yqhnrQShxASFxHSP2haVq44aCa2K31nXHbOSAafcXymTWj0NBt
	iqVSrV85VcKGcn52rk0f329WljuNOdbfo6VtKqEpXNvXE43Ftwejw
X-Received: by 2002:a05:622a:8e:b0:4b6:22c0:28b2 with SMTP id d75a77b69052e-4c06fc17cd2mr44749431cf.35.1758307011146;
        Fri, 19 Sep 2025 11:36:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7BZxgFDyOXsNj9/jIpPAudBj4ew/yuL0jMxO3583dHiffWIBP3ZgD++Hgh8WNcx79iLjzSQ==
X-Received: by 2002:a05:622a:8e:b0:4b6:22c0:28b2 with SMTP id d75a77b69052e-4c06fc17cd2mr44749081cf.35.1758307010702;
        Fri, 19 Sep 2025 11:36:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa4809fasm13689321fa.68.2025.09.19.11.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 11:36:50 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:36:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: glymur: Fix the gpio and egpio pin
 functions
Message-ID: <whhmtqfa62q2cstagywz2hesk6t3h3o7hxlcn47gjmodjttm35@lobzyyzv2sxv>
References: <20250919-pinctrl-qcom-glymur-fixes-v1-0-426ea410aa94@linaro.org>
 <20250919-pinctrl-qcom-glymur-fixes-v1-2-426ea410aa94@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-pinctrl-qcom-glymur-fixes-v1-2-426ea410aa94@linaro.org>
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68cda2c4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=CQ4xJWP5GyeMjeXyLdoA:9
 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: e_mu3L0WDmQ7-_6PkfmUD8xXnpZoVJ7t
X-Proofpoint-ORIG-GUID: e_mu3L0WDmQ7-_6PkfmUD8xXnpZoVJ7t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfXz9pbDRLtNf6A
 uYk/DtiYrBZ9xL4m6uM4iDLal9afOfNOlD0hRbupNGjl0Q/5eCTsOiAGKQV7vp+kz9uJdYuU5bl
 bBnyc5bvhqzKroRV9FGeyMv2KlUyfBK7CxFwwcEuhAtj2oHruDDUNlYZ4qn8viWhqJ9sUjEjiz0
 8fGFEdYHGTHoBUqhH6Iuw7kijNik/XhGxoYkH1ybUVKN/3LhP5mcsKao20Fiw0Sxm7tsrHillVo
 rgjWxQ8sOcpVu18yXRpv4Pr+dS0l4OLzsorYKriDohiW0xEps/kRrnLAJRWh3v6jl4ceyyEwplc
 +7sn8HSSD57ICNTRybjRLLsuz4wFRYB/l5a82YOtn4i/+DreY/ZQJBvRAReERIjQ4WbpRoWsP/T
 ymt1id1B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182

On Fri, Sep 19, 2025 at 03:17:12PM +0300, Abel Vesa wrote:
> Mark the gpio/egpio as GPIO specific pin functions, othewise
> the pin muxing generic framework will complain about the gpio
> being already requested by a different owner.
> 
> Fixes: 87ebcd8baebf ("pinctrl: qcom: Add glymur pinctrl driver")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-glymur.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

