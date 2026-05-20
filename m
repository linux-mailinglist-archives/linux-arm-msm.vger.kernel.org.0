Return-Path: <linux-arm-msm+bounces-108666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SD02MCKEDWonygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:51:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A54158B1AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5EC3C3020284
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332E33D1A97;
	Wed, 20 May 2026 09:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cl1688BZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GjwLG7Ek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E233D16EC
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270676; cv=none; b=h0M/oaT42jauwSZ/yyNshBUfQiNqT4eZpWwfcLgut+Htn5+qKvf4Eq+8LC+OtQ9jDMtq2Z9vkArsIc0766U7f2iBZOaMQUnpphdVBmhn5fse2Qkq2uh8Zh1iTfaq/xlOsqwctqO7dxdKhUDs/cMRTFN3j9Ek35zBiWYm0K0rpqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270676; c=relaxed/simple;
	bh=BSDCKdbPmmqef4a4dQE8eZ3Fd+Ux83KbrpkTQrYytFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VX8I/T8wMObgCRrDeSf1L3YlRfXZ1jvIih7A1IQzGAXmEQ2PyeB+1pKzytX/GwF888UWkdbH3T5CEVoKcJi7pjDb98KrqwXXCOs439+DghrnntY5DOK6ArHFXr+M1NgL/TnmO1tdRARD4YORp9p9llaZg7Tgr3rU/upDBKf02QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cl1688BZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GjwLG7Ek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7GIH72063888
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qudxujwPQrKCX8KF36qTSp7r
	GgcLFYs8qlZy6UZ5I3c=; b=cl1688BZxhwZ/fM1Tq+tR1JOl7OF4o8e6fjVDGky
	oZQZIZQblVOZpkaMlVQM/XsrxhXfYLbIrgtElvNS5RV6c1YmLmE5Qa/Khoz+PiIA
	wsy3rNIOxgpUwwGIE/IaQVFpVwhHMPUHWg6E8wWR8SLx3UHJQdj5isVR2BVgejDJ
	FtAzB20AvG2n7CoN85hVF8xNcLkH0ff2D6mwU6Mq7vOxw34q7SbpYWV1s2u0lPaf
	LBEL6K3QF6yOcOCUU+APZnqoT29jWnk3GGgfAzaNNzXGAmJS0fKLDTKWs57Eq0i0
	JtQfDVWsUiCXPEl5k/otCO0xfW3p7Soy63Lvh7bzAGEasQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t42ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:51:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516879bf1a7so121991011cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779270672; x=1779875472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qudxujwPQrKCX8KF36qTSp7rGgcLFYs8qlZy6UZ5I3c=;
        b=GjwLG7EkG7o/rbjVKiywCqfNIF6aZRsOG9SbjZX6eaIlT7DDCZW6TvUfflq+2UwLEl
         /3gSs9gToJz06fTw4WXZ3wib+j5jl9bJ7eLT5UuTwch7kpRIW4q3l6vzg94DB3MqdQf+
         zbj9Sv+B/2+gsdgdtcIymrGLH+lppj17U7vCpwp3XLWNPtOqjvIRJeN3Qp2JV3DXnxr6
         K9O9tKTCGvUudLwO93/57/YXadgROuVAIYPho0QZNEXrYh+qz67cuHPCAmg/tmomL7YA
         5grwbIJRUqmIe3clYOxYh8K0Lb+eVWGaCmMR+WngjjLsqxXcYgIohFJE1J4mlKqowafT
         IsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779270672; x=1779875472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qudxujwPQrKCX8KF36qTSp7rGgcLFYs8qlZy6UZ5I3c=;
        b=I4awDLuuYYgE2E5iT6K2WYJSCr5W2p8DMlAsaqg4zBFArnEunJrGChDq+HNF5Lu3Z1
         0wmXc2vvdvfeOPGZ3usG2L/4NQC/SCGFAW9QcfcXsKrW7HKWDRNzzX1QBZ85iJJw2APw
         17uNDQYXiR4e866BprS6nrUzm2GKAZBSf+bdVFJr6cTnA6BegyAaimyskO2jDNEPRi5a
         HaLBCCH1wYv6V7Ly3rmfJS3MM5rZanDOV8kYVEqV1O+GigjcVG+pEZJ1G/zOnZ9igbEH
         +AVy1W0UUROeDIlhKUQCt4pNHlavsOPtl8twEE8r1hs4GAQG9yS/OCrzmPpI+kOEhgiY
         /K/w==
X-Forwarded-Encrypted: i=1; AFNElJ80TYi5ARGUIAAzaI1dev8DMa0XI6dWNpQzXqbzeLrpwl8VehZGTu3DlZScmXbJ4gdD0lCexbEx17ndmrEH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/lWrY5TaO9l+cfuq2BMFI7saUlp8/d40vGCT2cI4TTIwN83ut
	P3kz5P4ETIwN6oXS9DVE5LOu48cdzYGgmikzZX4SQxRNtlDVhaAhtZMa8JssSfimihJKV9ECoBz
	bFyXYulobfIQhe9GBIEvv/dM5MhIGZ2FOQxSybkzEE2gbXIE4W5r8+kBRlg8VD/Iv3xBx
X-Gm-Gg: Acq92OFHIh9Tsxz97n+C6Dpfspw2Wja9EyAcI52xdsH4N9HnpBYP3fzbRcn7U9iAE6W
	VS5gQtzYKToLevAos6hTjsoULrNq/lH7FfL0Dq28cmLKkKBsupNQDDxpuzLR3rlq91/OU1cq9ZK
	JaCZySPvzQtcwX9Zx6m+1fGKuBCgvAS+mMr1XZy4qLy34bn6B1UjTB5gQNgy3HxhFl+ahAK4SBN
	LAz3VuoAMX5iwjkWbFC+kO85twOR0om99qWsgCKJHz87/FWbOuMjLTsmIpbiUJaJ0/avKPueawT
	g9ZYOA5TsU+VB+ak3hZRUmZWiHIIjn9vrVeTMc4P7hukP34ijeCfiUbFWFzpy/P2uKzAaWO8Rj6
	bGV3NLU6bjnr/sYD6Wgr9jKpSg6TtHI3zAJKUJ9tywWAA9uMi+OYm9L22ghurwn/LyoTwALEsyc
	eXi1nlzP/D0lzYtArtTHdLw9uXNpsysMc4qZo=
X-Received: by 2002:ac8:7dce:0:b0:50d:af03:c9ca with SMTP id d75a77b69052e-5164193ed6bmr330459101cf.38.1779270672219;
        Wed, 20 May 2026 02:51:12 -0700 (PDT)
X-Received: by 2002:ac8:7dce:0:b0:50d:af03:c9ca with SMTP id d75a77b69052e-5164193ed6bmr330458821cf.38.1779270671761;
        Wed, 20 May 2026 02:51:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11f2e6sm4783109e87.37.2026.05.20.02.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:51:10 -0700 (PDT)
Date: Wed, 20 May 2026 12:51:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Brian Masney <bmasney@redhat.com>, David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msm/hdmi: Use the common TMDS char rate
 constants in 8996 PHY
Message-ID: <s6tvsuf5fzm5gho3g4vfw2tlg5ayy7jtwbvwyu4zj6yhs35dtn@q2qoewdj4jek>
References: <20260519144712.1418302-1-javierm@redhat.com>
 <20260519144712.1418302-8-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519144712.1418302-8-javierm@redhat.com>
X-Proofpoint-GUID: sP__ITT9IH52METpfge6S_CbR-CBZ6_U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NCBTYWx0ZWRfX3XgV2bBm0ix+
 JhM2Vuqdb0U+61y//7cmucc9nOQ8jl6Hlhsv5Hcw73qOkD55oAKkj/sN5RiUZ+SAruHEh35lCLv
 X+1Xxn1sYW9z4sVWYU4hW6oWfLUs3F9d2m3+SKscm4GAfHmBhm+fc+XFzXHnbUw+8rTyXQH3ttJ
 W/e1dc7ugVMe9MhLtLNUV/VdIJMIaqo+Z/y/yZu1MspZagg+ldDmcsBv/zfwdxy+r7okTz0fDQV
 05REVBlVxTYIbOV0OB2bt2YHSkkbLZ/oIcIRLL9vMAu0M5Wl3rJEa0L/E6RE8xZZ8HFCPSOHUIv
 hr+J1eR+s8zZcAplfBAmqM401cqGNXByXiuqtWmv6lfgHxfpDYTLqAvNFm1tcT5xikxHhIO9m4k
 yehMWYev351kSN9lMD2kl6zaJkzTZ/BEIoi2g9AxcdjVfx/fXITSI3Gu36npIzf6n1ywhTHXhh8
 myS1Z9CLdSnn/cI18qg==
X-Proofpoint-ORIG-GUID: sP__ITT9IH52METpfge6S_CbR-CBZ6_U
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0d8410 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ZqDtBnPIfa8uGWz8rTwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200094
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108666-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.dev,redhat.com,gmail.com,oss.qualcomm.com,somainline.org,poorly.run,ffwll.ch,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A54158B1AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 04:47:03PM +0200, Javier Martinez Canillas wrote:
> Replace the driver local defines, for the minimum and maximum TMDS char
> rates, with shared constants defined in <drm/display/drm_hdmi_helper.h>.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

