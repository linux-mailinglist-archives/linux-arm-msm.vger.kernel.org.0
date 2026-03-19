Return-Path: <linux-arm-msm+bounces-98738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D5gNRrpu2kKqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:16:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 399552CB084
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A80A3057EAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D933CD8B4;
	Thu, 19 Mar 2026 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNgM3QvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMvJeIVq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68B225A642
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773922124; cv=none; b=WqiD/DhRaOiK1NQt8pIVQbo6OvJiEJiU3PQ0sW5q239WgkBPUI5uGN6FNZiVWPXO5xso1h/aJpZ6xGKGsQ6WF0BPI8B2BEUn9gq5C3yP2qCId8Nvs5EBepmJUI41QOsuUaVgrB5VbpiH+rHpfEZEMiEmquPkohGtdNQPvvn/vOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773922124; c=relaxed/simple;
	bh=mWLk251Leu9DkyE8HjyGFRlCVfdhm/nGhuWso7bIb4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5H8XrrU5cXukKIw9MPf0RMc0dsMrjI8gyR2V2CbcbwfhywabH/lUfnmv90QqU4l79r4wdc8hci6lnQG+2gINte86pbkR6NxL6glPw1sk2XIiT3dokd5S4n61QfMiUGp0m7pIwPKMX6XHw81q2j1cK+OJzwJYWCxDfmIRTj2bAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNgM3QvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMvJeIVq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73sko1567058
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHo8j6UGq4Y0XJeKDffpEvuDA9pXIKE8XFl4Rb5qjE8=; b=bNgM3QvQTbgqIa2h
	Xv2VgkcssN03X2/03DYJCNKCxRn3fraiJy29TFA13r5F042aGU1bse1AwKnAjZ7e
	DaslRofRC4XVRUX3PYgehz9vwYPZkCqg+X0/PEenQPfx77gZSgfxs9B8ORIs0jHL
	MUfz6DtH6d0xSnX5qVopfVaQTdc4hOeDYkzcwRHwBHwu4LV39+TPE9y/Nozs40jR
	XZtazNAaj4Tz38A2ndYeJ2DD4V4F5OoSNBzP2cqceSrw70uVQyFCVR2oinlLh5gn
	mJl0hHTP9vpfRg6YgGE/d0u4mY8oW5DPDvUPMH6ZtUs5b2xVKQL4QX3w1HRzzjgo
	O8G45g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0akxh8nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:08:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ffeafd52e3so189159137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773922121; x=1774526921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oHo8j6UGq4Y0XJeKDffpEvuDA9pXIKE8XFl4Rb5qjE8=;
        b=OMvJeIVqpko0gs4qcDAxl+Kyl8bVM5zWW004CJWlzJyPg/YuLls0mTdWib/5F/cd59
         jmbO4fvZNRWxknjdWxiOxLD7lbSEnrkMQv4Mlj/aQT5mIMKB+I5cCB7GJ/K1UbNRRQg9
         xWzMrLaYqkvuKk5eyucgN726pATq7urT8toQVhK2OrwJRlGebGIZcbEsRNZzMV3WlPsO
         B+GieMNdrqS2zJbrVFD2LdUQi/HFXqDykG4XBNpEdWlErkbVdtjbuvstcMv9CKalaR3f
         Xm3YB5Ir5eXhkrXmbSfX0dpFT6wSTXpOQEefzFe8E8sTbYX8bC1kl+HuN9dCq6BaweR7
         RErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773922121; x=1774526921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHo8j6UGq4Y0XJeKDffpEvuDA9pXIKE8XFl4Rb5qjE8=;
        b=NlvdvgF6qIR70ImbHgCfRxSyimb2jWroS1XusWfW0Gth+kSFcN4up08W2o/da5VIuM
         9Qs/ka++I+GE9sHPny+GVZikhG5LlhaO3nuZ2B6jLtvISW6bKVZxUckHz6jpsRLHQMnl
         oAkdT/8fjqSIPBBFeGv9GVj9HuZ46Tu22hHoKYv2SYqWnFkX4qChO6FheIEYqOno5dCi
         09AekakoTBQ36EM9kV4rs5AfduJnQ9xOLnMz5p+8v86dLcDUGvk6lJ9DRZ8vGZ9xTCLi
         Ax+N9nWnpfLsI0VFjqS7mxBVKXFQkmg2LIJ428aW7Yo/lM5b8FV7lw4x0K6rNqSWEIHV
         R8jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzWWUFvybkkcYpD5B31UUWQt60LEkwJ4VdeMBuHrMBFQ+veIzESBeKrnfTwrI3HbR8byxHafXtRH3k+iD1@vger.kernel.org
X-Gm-Message-State: AOJu0YyQZm/XUpqw3u5AUFwOPxACRIb4sLyLd0kfU+oR9Hmh/G4jVYus
	37NgCFM/2tAHcXRhXfbYIbarJuaPboKQrKHwnz19hxjQSiYOGDXiIjmj4MzvFwSVbNsYOLWIbJ8
	wfYBqD1WKUAqx1y2C5oL18LHQ2dx1HFzd9o5+qLr296jCspnFANirTJ7J7a7NXZQg+b0oZSpDVy
	vs
X-Gm-Gg: ATEYQzxnjsNpkXF/kBh6yJb0mRdwuVCf6Am5+j8Ro6LpGyI4wJnu/b1rCXy1q+zukV6
	TtxbEMnG+kX/hRheyU3yZj3ltH94587Nx7h3y4lfRj+47Sw+AvgoVB6q4MUmM7w+5ELXxTpfHC1
	8cyBB2fOUFEQX9IHAdl7wxzLZAZdh06y8DGp0AIhF9VsQDOaozXjrVS9F8uUvv3YFRK8zllHKFn
	pYRLeO7TR4CXo3gm0tsVK+FK3xVexoZbLBLY5++a3HlgGPTg1XTPOyQacNh2d4V1t+ae7Lv97jI
	WPZElKiv/QC3uWwXClphrjBCvINPrFcuMnbxyY2yAcnsu7K8Trbwhd2fBF+Fbe47J3xDt0s4Wbb
	ha3dO+hjpZnp5Pgbr+WVNbzD5VvEG1xMfzbVFC/fQkdMNSrvxEcaz9Ea6gK1jlXs2h2xt0b/lbN
	OwaYo=
X-Received: by 2002:a05:6122:5307:b0:56b:8367:c6a9 with SMTP id 71dfb90a1353d-56ba714817fmr1721705e0c.2.1773922121188;
        Thu, 19 Mar 2026 05:08:41 -0700 (PDT)
X-Received: by 2002:a05:6122:5307:b0:56b:8367:c6a9 with SMTP id 71dfb90a1353d-56ba714817fmr1721697e0c.2.1773922120720;
        Thu, 19 Mar 2026 05:08:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f17049acsm439921566b.52.2026.03.19.05.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:08:39 -0700 (PDT)
Message-ID: <a837f6cb-7b15-435e-a30d-22ef437a7cbd@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 13:08:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/msm/dsi: add DSI version >= comparison helper
To: Alexander Koskovich <akoskovich@pm.me>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-2-85b99df2d090@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260319-dsi-rgb101010-support-v3-2-85b99df2d090@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA5NyBTYWx0ZWRfXzGcba//5xlZg
 W3FHSUvONEUFxoWzbzZ0smLMnMPQCo+30tOCeR4Mn6Ka4gi2k1CM3+CJ90OcDUEap3KKHjjfjC9
 RINYyqySIAp30Np7/abKTslFy9RiC57+9K97ZW6VSrJcb30daxHTc88H1JMTVu6nkwU38vXjWaR
 gkhdOUs/gHBcTZI2g4q4AkALvMXtNTQqiaJ37NhXmzEMIZg4oVNAgER+KA7iexrZqysX+J9l5If
 eQ6ZY1y2lMqY+SsTZaVc+naai5OZylcIUoppF6vvgdCEK2GNhG6qOySGIL13qayhjBgLsKqVlg7
 ijZSKyJuQZiVGmN5qbmtA1Sc54aCwH4beP4LjsoYrt5YhjuB+7SQEo2fqvBlhke2m9UE71f7Z3b
 zg0ADsWNkGk+Wy7Vy0b7cMKmzf3WSz6BruFWLLiPUFV9cCRUmy0CehnlGUoxkaRhUHo8XCMaeoK
 SpAAW3gzw69upT3uKRw==
X-Proofpoint-GUID: 9fdIspT6M9syPyWW56NVYATruAg7UhmI
X-Authority-Analysis: v=2.4 cv=ZeMQ98VA c=1 sm=1 tr=0 ts=69bbe749 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dCPkbIS1lotwSDO2_C4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 9fdIspT6M9syPyWW56NVYATruAg7UhmI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98738-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,pm.me:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 399552CB084
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 12:57 PM, Alexander Koskovich wrote:
> Add a helper for checking if the DSI hardware version is greater
> than or equal to a given version, for use in a future change.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index db6da99375a1..6fad9a612d4d 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -782,13 +782,20 @@ static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
>  	dsi_write(msm_host, REG_DSI_CTRL, 0);
>  }
>  
> +static bool msm_dsi_host_version_ge(struct msm_dsi_host *msm_host,

I think that "geq" is more common/obvious, but anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

