Return-Path: <linux-arm-msm+bounces-106997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EI3oFUMwAmq/ogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 21:38:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FB6515318
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 21:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53139300E69B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813504D2EC9;
	Mon, 11 May 2026 19:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z1MrYHlc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6uvEcPJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9855D47CC7C
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 19:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778528301; cv=none; b=WFdMWtW48r5vDbT5PObSrilvVJ5N+ZvIWqEFzRdIF39aEt/v8qSbJuShX6HKipAmpTeMZniaPA52fyZb/ushV/8LaCHnbfiGaKVdOOkOThd+RyDSkEJmw+mGslRHhDRRgwFOTtoAg1SN1JLEOF9ptVCrPMP6HfsJJvV1gMXJNMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778528301; c=relaxed/simple;
	bh=YgVYYP3Z+i2pOAe90PAyPCQxgTw07VJcuWy++jWvJ+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bs1MAox1xPp5LGOz2D6SpQ4bp9CIc1oMoXxcNXyY7pclSQreQ0te/IelA+jFfsuUdADnKJR5aRoEjLVuHFqRv0zjnSLm8cGs/ABP2BgVGr4y/GdET4At/Ci6ZcNoABPcYQ3cYyeGC45DXUerT5IRDwODMWMidDm3aJVV8e+leUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z1MrYHlc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6uvEcPJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BEFZpZ1850451
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 19:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qEUadrYYD3NO3KbmiC7HNGDA
	adVJC90gp6VqwRYpT80=; b=Z1MrYHlctUgKa3Ec/J8ccxp+NMvokOd1Fj8MIEgs
	myKOrGm4YoMCA5gvUUBLtKz0wbLCz0swgaKzoQDL5uxFaT6aaYJK//CWUIigHD1z
	gOrvPakN9AO5QCvDA3yR9DGSzxDrKZelLjdAeu+G4Ag0PjXRfI5j4UjTgl/cctb4
	y2KmRX7/mU+D61jNupoE4iEFBlA8GKlyDe1BZFYJZtIHvKfJ/t6WSdm39sGdfAqQ
	4qq82G8MBdWar3Pcvc8rYtAiF86Txiv4tGCfaSts3ppM40KJYhhrwiMI+K1UVbpW
	gl67DCoWnl52JDJTqMpve5Ov8U0fI36+HZt+a0yRWOq//w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3bfvjrhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 19:38:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d6bf346adso64639541cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778528292; x=1779133092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qEUadrYYD3NO3KbmiC7HNGDAadVJC90gp6VqwRYpT80=;
        b=B6uvEcPJ8vlCrkIJuDQvfpTSmnXldm7j4ETOVF012kYDRvLAXFPQvumWTXPvV+AEBU
         yjETsrOcwvRJiXorMYJ9ZY1nlOkk6w6B5mYFLQFUJnbhcOWXgN4/VWupkcwlT45Ve+v1
         WiP2DP/yjt4XuXyfTivG1LU1gSExUO38Kf+sF/MJ3YgVAAhO2/bqQnmIvmqQXQk25vAa
         DVq5sisM1/cCJyDwja/PUCmDyl3qFcYlEPQ7D8sVhGS1ajwt4SVxh3f7epbw5FN73vDt
         NWipjQVkPvf9LHOtdheoX/RZ6sfykwJtAatwolKELeoQL+Un0RNYsljeDeiIlpAUTqG+
         pdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778528292; x=1779133092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEUadrYYD3NO3KbmiC7HNGDAadVJC90gp6VqwRYpT80=;
        b=WzHxvhiQthsMZ9WPBp22Fbl6Pb+vXSxvwDf3ocmRdS/HWe8QMNKvXAszUorv8bNGIO
         j1qWNtiEsy79l+juVkrJ0eJGhTbI0fchzSdh+GlrPonILQkTbRso3RbTukDDblMwQBKN
         u9XrU2XroImJ7xnNZmNzC+5YLDm5dFnExgKYUsI8DnGlQBXwuFdccH5/vZqbQKXxXXOa
         g3zh54t4FZlAb/GzPOGQz8dne+NnHkztCIVKmZmrradRF99V0+Gm7RIEK6tI3eraPH2B
         TzsU4bKTuafzsFmosOMjH5rVtkyxwdKZVvy+g2a5Y3YsPhrK0VVR4AGiSTK2jIxdhiUP
         nLQw==
X-Gm-Message-State: AOJu0Yw6/qz7NUZF3zwfnudUcVA8H9bV+1GdkhbESro59RNB0I/Aq+e+
	lloxu7G6GVQSBRBw4EPbdB4Hg5Q6hrMbz9acflPncwph/zFZfSFLozar9K2oV9kMuMH2QNUVZtP
	e2zlfYondos5QByUXiyhbmWQ4P3tyKDSGuULd2opCF9XpErrJpQv0IOsBDQpHYVgEj35N
X-Gm-Gg: Acq92OEN9ioBlhEwnAC/ldDFfNR13sp5mdXbYXItOeTWfb2HyJrkujoDcoT/Z1ZWlCS
	X2nq0VYIvt53CBDdvoXoue1+7ZOC64V8cCfGqDuni2bsEnjEI/pCgU7SMfy+a51JrEdr+rJwH1o
	BEsiOOhYi+2OSWa48/DOLoSIevmPCTMhMjkkoELQjw1ia31V3ADhE0/QZMFUXGcvFFRF3XDDtZc
	E3uQmzm/tondo7G3GmsQTGqQb7EyEaOTGBHr6kAJDTXi2/54XUGDdW8krNvIAXN+zT3/0yA7lZQ
	dNQuLLc4JRCTJiWqPid9kASdvORwj4818JBg49jRt2CM5w43xHIlquv6g+6oQGZE8eVxg9uSrWS
	WFhVPf7aYInrtdzjeHRyxjORRBkqOBxXgEFAHQyBSwkwo8YfFXBreUxQxx4ZfZLQ9RAqx1uczL0
	0fBeoqXX5fJlYn8UvRSLc7qdiwybCWZzRHHPo=
X-Received: by 2002:a05:622a:15c5:b0:50d:83e0:3216 with SMTP id d75a77b69052e-514a0b8e93dmr166046331cf.49.1778528291967;
        Mon, 11 May 2026 12:38:11 -0700 (PDT)
X-Received: by 2002:a05:622a:15c5:b0:50d:83e0:3216 with SMTP id d75a77b69052e-514a0b8e93dmr166045761cf.49.1778528291366;
        Mon, 11 May 2026 12:38:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c66facc2sm1374275e87.22.2026.05.11.12.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:38:10 -0700 (PDT)
Date: Mon, 11 May 2026 22:38:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/8] drm/panel-edp: Add panel for Surface Pro 12in
Message-ID: <cqvo676xianuevg426nmawttqkrxs3lzubftb433daujuyoqey@zzfmois6njiz>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
 <44d976999b592fb4993bd95238e56cc4d9e228f7.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44d976999b592fb4993bd95238e56cc4d9e228f7.1778498477.git.harrison.vanderbyl@gmail.com>
X-Authority-Analysis: v=2.4 cv=Fa4HAp+6 c=1 sm=1 tr=0 ts=6a023025 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=qSFih8ieVIkKGe2oThUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: I98bjcZ8W1zb113Lt91oiNU2rFb9gZ0j
X-Proofpoint-ORIG-GUID: I98bjcZ8W1zb113Lt91oiNU2rFb9gZ0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIwOCBTYWx0ZWRfX90wcy3o4O+rF
 68UzB5rSxhDg2NPgTHMCvZeXY55qbnt4TSvLYtzAQD0wl82p0tz2On23RkJaDLS3C4MhfhILXJs
 XvYAhhYRSoMUA0rJL+Z8nG9p8qao6AFbAjrbqOjwVu5lM2wPkXgOO+IKFhMFHnN3AdsyL9Os7LC
 YKGIeZUbOurnU4whdndYcL2EO7uCUdJxuTgpeZ8qkAUlR/n5g6EaKNvBg6EDxvDmUG3yKEOntdI
 3pSrcbxyVLWA4ka2MOFW2YCrRL+rpEblLtxR/gxQwaENbK6SgKme9XYXIDcmXHEwnTQ+PfALxne
 Q0BtxNP+6oUnKk8Gjch5vSZFrXeypvPWkpAJ/IKghMv7FwRrvrEqnqwRGn2iHLNNzkiTHBfYtOp
 NAg/PAaURUGbMgvmxme1LxqR2cYUI1LZyABQLMK76Bhk7wT+7ttcge270NZFpTNYDXaCJ4Z+KCR
 VoUrcZ3JM+o/0rQSdEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110208
X-Rspamd-Queue-Id: 54FB6515318
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106997-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 12:40:55AM +1000, Harrison Vanderbyl wrote:
> Add an entry for the BOE NE120DRM-N28 panel,
> used in the Microsoft Surface Pro 12-inch.
> 
> The values chosen were tested to be working fine
> for wake from sleep and hibernation.

Could you please include panel's EDID in the commit message (see how
other panels are added to panel-edp.c)

> 
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 497dcd48f57b..2cf52f03c217 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -2020,6 +2020,7 @@ static const struct edp_panel_entry edp_panels[] = {
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c26, &delay_200_500_p2e200, "NV140WUM-T08"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
> +	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cc9, &delay_200_500_e50, "NE120DRM-N28"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf2, &delay_200_500_e200, "NV156FHM-N4S"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf6, &delay_200_500_e200_d100, "NV140WUM-N64"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

