Return-Path: <linux-arm-msm+bounces-52848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F36A0A75C3A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 23:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 628903A9175
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 21:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AC61DE2C2;
	Sun, 30 Mar 2025 21:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LAxadOv/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F951DE3A6
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 21:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368668; cv=none; b=L7OX9Cj8LdQeHozli8TT8v+i1vD3vwCmzsT5O5Uy88c4CTdHWGuzDosexP5/6VUvd5WYw5Wx5dnBl770aY5jy51GX/nPlVkPY6r/JyYC9TlPkH85L/elvCktdCRqe46ilrm58iEPjgUDXrQq4haVZopYjPy3iSxYXSFwUOuMVF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368668; c=relaxed/simple;
	bh=dAb6et7R+5U2Q/pQWvN8p9t66Q4+NAntA9+n8TZt30A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YetYxFvBEkQ2Fbl+4hiLbDVlhdPrKU+S+6aHnD8bzD53fNauWgd6pglB+gS55PZXlDHuj+ajIMSpPpLOSdaHiG7DSs0PPg0rU0uLiKCLgWWos4uAASGt54CtNVxcTucoVF1MlABcQpM0IM3SSly89RMrDVWLpl+y3tBtU0Z/pIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LAxadOv/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UJdneC002502
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 21:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3X6Nn/r33CGbszSe9hk9BLTV
	HHvnvfD6wtlycd8PuBg=; b=LAxadOv/QHvLzwTQTwB3SYZYC72e1jYrqWv/qDpd
	3mixVkWbNjF7qyV2alXTrJfQKGRfn1NiPni5dioCJY9VDEbpWIM1CyK7Oy4xd/VF
	rvdA6567kyK2G+Chew3tH/QpCQuNoKeQKgtWP8FlaMqdwGSGA2Qp5B0VfKTSzWEo
	3Xugxb0frz1mMyHeNZvrChpulHPC0tP16pm0hUgzbEtXPQrBaz6PyCo0hUBsOv7Z
	sJecBIu6El9/mQSQg5taaCPquKPGB32Tfaw/ebxGQwwl6mRaCcKZKRoXuRcWp8De
	umML/35bYneJ84VjyURMEbcoiOElCB/mlBcXnF1Q+zPX9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhjyht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 21:04:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5750ca8b2so642625585a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 14:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368664; x=1743973464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3X6Nn/r33CGbszSe9hk9BLTVHHvnvfD6wtlycd8PuBg=;
        b=heXyoJKJcMQeucH0zt+gzdX8UJkSZ33255hA3IkxP96fo+i+oZmGCZatbXUTpWrc+z
         6HDXTJuSvBtq5F4+PvXIX8QTNolAk1u//UAqsNtHdqlrR4ZE3dhnSG50N00FYPzJANIE
         YSlQd2lZbDZHTgZEri76PMuxC3rMKk9NGSRqv0WWsU+y9BS3BzFl1tcwoWL0GJ7kioeH
         FGqNiUFPk4BOWGpP7SOPyqmz21vGEfawxhpiUsqyu3+ZQXTYm2ihQ7rImsmUq+GzqajA
         Chedm/SkwKOS79yo+8PLXb502bgRJFkQWJqa2ANxDEyM/Bir8S5HOtr6FIr9fEpKyf8N
         +bjg==
X-Forwarded-Encrypted: i=1; AJvYcCVUgcPtTGYlNhRYCU8rIT+Dt3AB6gqXg0tfVW7sdUOE5QIrbBWhH1HQnHAhl5P5VggxUYPYsgVDY32ghikD@vger.kernel.org
X-Gm-Message-State: AOJu0YycRU24qWu4iHfLlAEIMQDaRMuqQjHCnRYQWoRwob56UXXcGSb7
	sR8QnvfZlE3eAyhHx6thOBjjy5p8AJ2zfAXmOD+hUoCuIE7p9bhWKhAey+RTE9xBSGSk8iItViK
	kqYJWFaR+Qb7Vzfx2QP0wIML8Q10p6csNg9DlkU7/prUXt4YMesN6FHu6Qvwq84hV
X-Gm-Gg: ASbGncu22rX3mruCx+WjlckjKDyRw7x7ATeGtbBBcDZU/vI31NNxZU8/bcZ6sT83sZF
	CInOxmWSjWdezq7IXaXjn+T5GJK8egsxtT3flDjGIl8kjMWfVTn3/+2YFPmMWVH+qmGBIV17TIu
	UvSkLQnZO5KJnZENbGKumxGsxSfoaPEH++xapei/KcSfnK0tJRQ0hOuFMutvnVXjao77b59qGDK
	T2hIGnaXjtvPFgFbsglCRwFZ6QhJGJ34qUBZEFMucSZJMcHkwM7lqHhlwZQrc4Lopxbp8kWpYqS
	BHV/4Mi1NlE6WN32dmiCs/HEXNy123FljqDgqGcujhOPAxQFyTswqWQZBaHbTiIIzT22Gr9SWEG
	6iiQ=
X-Received: by 2002:a05:620a:2602:b0:7c5:9788:1762 with SMTP id af79cd13be357-7c69087dd85mr976180985a.45.1743368664307;
        Sun, 30 Mar 2025 14:04:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFecXN9y0zoQAa8fj/MXgg/6i+xjGFaT9P8pLvrmKMOlDv1NT79vP3JOyImWAorOmGWxcr0PQ==
X-Received: by 2002:a05:620a:2602:b0:7c5:9788:1762 with SMTP id af79cd13be357-7c69087dd85mr976178985a.45.1743368663997;
        Sun, 30 Mar 2025 14:04:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b4ccd3sm11858171fa.66.2025.03.30.14.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:04:21 -0700 (PDT)
Date: Mon, 31 Mar 2025 00:04:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <toxbemskkjxel3xp7ddkon64x4uetiqjw3bnqdxu7kuercxybh@swnbp4dpw2cf>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
X-Proofpoint-GUID: 9tPatH-vXWDEVvXKsfzf_GqEff-LZ608
X-Proofpoint-ORIG-GUID: 9tPatH-vXWDEVvXKsfzf_GqEff-LZ608
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67e9b1d9 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=YrjviDGP2Rj_hCM7jl4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=962 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300148

On Sun, Mar 30, 2025 at 08:31:07PM +0100, Christopher Obbard wrote:
> According to the eDP specification (VESA Embedded DisplayPort Standard
> v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> the MIN value as the effective PWM bit count.
> 
> This commit updates the logic to clamp the reported
> DP_EDP_PWMGEN_BIT_COUNT to the range defined by _CAP_MIN and _CAP_MAX.
> 
> As part of this change, the behavior is modified such that reading both
> _CAP_MIN and _CAP_MAX registers is now required to succeed, otherwise
> bl->max value could end up being not set although
> drm_edp_backlight_probe_max() returned success.
> 
> This ensures correct handling of eDP panels that report a zero PWM
> bit count but still provide valid non-zero MIN and MAX capability
> values. Without this clamping, brightness values may be interpreted
> incorrectly, leading to a dim or non-functional backlight.
> 
> For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> supports AUX backlight control and declares a valid 11-bit range.
> Clamping ensures brightness scaling works as intended on such panels.
> 
> Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

