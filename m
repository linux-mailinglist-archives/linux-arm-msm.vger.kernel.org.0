Return-Path: <linux-arm-msm+bounces-99031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCb0NYLSvmnHeAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 18:16:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 726632E67A4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 18:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE9DB300825E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 17:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8106130AD15;
	Sat, 21 Mar 2026 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JvEB4tIy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jg2Jh2hM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E613255F2D
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 17:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774113408; cv=none; b=iIAXeYfE3XfThkWVTu4fH4pg/1XqdJ2M+K5S5Mw8ojd+wvsOaXTaCZBuk+zmkxf6CSzUtoNT9n6KJ99RvH4RZPxhHzVeuQ/SpNDjz+W2y5xYxnSzlsTHmcqV2dKKtNG4SaWOTQta/wD2gxg+JTm0wulPRmlEnUTeuqkYvjHu5lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774113408; c=relaxed/simple;
	bh=j9QuEdY4Ttd60jD2Y5FZE0uIKUSVvNFZxgHyvO7PN+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKrSU7lpV+9CO1xaaGodHOfWYvajFaNpL8bYVDLOrvUaYt3TTzy9p3O7TGT03iFxhv8pWNtsRDj9WAiJzxaR0UB/v6+5WAEUdKjr2lU7l2fjUMzCOWH6Ijn4aGF8bbT0obdmwgUYzplh6+fMqAWiijfOK6J9FxMnWne8BOaIdUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JvEB4tIy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jg2Jh2hM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L4n41H4020659
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 17:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5/WEKlSuRIQ3y6kLJmolINvh
	UCSFxM2orcg3n1rvkHk=; b=JvEB4tIyiA+gzVx5h+ULOk/e+RLbmaLaiqi/cU4z
	QFmV9OhEurr9W98gb8dSyeg6YZRZX6FIeTKc11d7Ty0qfTnO8L9DA5ac9Bry0Nry
	MQP+qc/58iV3XEj+W/omxMkehv2ybPkxNeHHEDiPIb20TiRxtv2Fy2AFP3lWl0s3
	s++FheJb1Dj5E/J8acvRYETrxcWpAhrvQs4+hrkYkKDkJi5/imE2I4ji0gbQKBOw
	oFumuQmE6OM44y/qc+NeNGxUPovtSuWoensY3S0WghtWtMpBQCeupaSb2Uwf7/zc
	O4q0AmZYh7OMlIxAvIT2QRi9WhV02yh56h060dKzSu2rOg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvh3hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 17:16:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so157190191cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 10:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774113406; x=1774718206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5/WEKlSuRIQ3y6kLJmolINvhUCSFxM2orcg3n1rvkHk=;
        b=Jg2Jh2hMws7iqE2Ypl3eEsCA1tqQy/aJ5ls42O0koVZRaiCppgEPi4TROjrkAKpBBb
         CfM76Kn5wnDyss+4LX+BImVk9XNlMp4nRIg6ZiOyqxozzS13ADgPyg0ocwm6zCvYCOP6
         LbimxXs5cmR1JPB0igLKttEva6MjaOIwXb+xGn9NmALvcdxsKekn/62qVFVT8yrHsM21
         bsg0sFu8EBggMPQ2A52hlfdENf/3+ToZBsAkRaFUmd8Sqq7NXiZQaUAFZW4JRKqx3ejz
         kIeZ6Lqb5zM4iWidqEHWnBoFAdKLxX2ltHFyYlqk2N6iLu20h7LrIXWZK9jwL4qGVpU9
         hJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774113406; x=1774718206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/WEKlSuRIQ3y6kLJmolINvhUCSFxM2orcg3n1rvkHk=;
        b=sDyY8LzrFCaBvhzkRd9pj1vIHyYZVkU0PWGotjHkAZHHk/B8x45n9t1gzPKtnf11AQ
         458mWheRShb1nDgE+pbtoGfESEBEwYjGLFv6wL1BdcQhgx/D49C0REPKVDPLsjaR/BNd
         dqYsbBZJrec+Eg8UJm9ew9FZv/1Xow8uo8m4rWKPoS2DvM4GrpURrcPIdiTtcEcoIZSR
         BhDpG+jXGq1kBRq0aIFHyxv0R8huO0Ym1tLS2bEMsrifVX96F89Ss9qnKe0PSoYgEKd/
         pJm07TMzQWWX7hx67HT1ebW4PxcnEKRXawXPWnRWNPvyHWltJJCQ8WgIaHPG2IXn+BOp
         zzBA==
X-Forwarded-Encrypted: i=1; AJvYcCXiAZsLLbLE/Bsj24YOGPd08N9N08X8c8QdfpKMZ8IQXenAEE9tsgk9NamDUILcIzow8h90lt1CTd732vE7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9gzdFfU5UzuD+f6SRRKwU7zv8DRivqyc90+YP/a6s4OpDLTKr
	cPIqz+RM26Ku9hXnOY9mI/6YbA5AG228KQuZ163nx/YmwZQZpUTjZX/YW3QLWztNwptV6ULPAuF
	M8G4Dn2NM+9WtBf8VhU0Z51LSABQAm8MX7vAjbffm91k8aa1IRtFVqt3Pk/42jCJ6XNoh
X-Gm-Gg: ATEYQzyn+mcXz67a1Xc0BDL07wgsT90X0S7YoszxD72QkfS2lDnM8ZYwMMDQ+2wCC9f
	TWxs+NELV/PdUN6sUXrxUBRPhgY69ddj/YFucQmDWoV4fYWIM0/71hhUtjhCw+JPfoDIkQLny98
	gJcl6ocKIDCd269YFoyWeFqlHqNqlbgPNpWIu5yfaJr4X1MvgZnW4Eljnt/xGlHMcQ0EDEQodY5
	5W2RKifSwcsptUj/Ul7OdKnIhAd+JdQJx3w8SZqIqh9ygF2Pl0HxaNZUgNROtMStVA4lL3ipppo
	20KOS45lT58qoK0qcXsEcr1g5w+9p/YvuZc5OelmQeJp/kK351ng9omjaU3DX6Ytwhfz72MsMaX
	ngs595UNA8BUQqtQe9OdcmCjX+QZKKGn8pl44fEqURtmnLaRyIVL4KnI8RD28Zwx5TAedYLypGb
	Uj9Zjjqkx4xZKnx/oHxd2x0tNzf7pfyFr9pIk=
X-Received: by 2002:a05:622a:588b:b0:4ee:1e82:e3f4 with SMTP id d75a77b69052e-50b375d0dc7mr119534471cf.64.1774113405552;
        Sat, 21 Mar 2026 10:16:45 -0700 (PDT)
X-Received: by 2002:a05:622a:588b:b0:4ee:1e82:e3f4 with SMTP id d75a77b69052e-50b375d0dc7mr119534101cf.64.1774113405142;
        Sat, 21 Mar 2026 10:16:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f73sm1223501e87.54.2026.03.21.10.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 10:16:42 -0700 (PDT)
Date: Sat, 21 Mar 2026 19:16:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/5] drm/meson: handle RGB101010 in format switches
Message-ID: <lu6cjjfcrmhebizkuf3hcghgktlyvw7f7docmoo5v47r2uidvu@c3rqozgop4i2>
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
 <20260321-dsi-rgb101010-support-v4-2-eb28ecebbfe8@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321-dsi-rgb101010-support-v4-2-eb28ecebbfe8@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDE0NiBTYWx0ZWRfX4iKhjKFssHbo
 QbVPuTBqYMiciJWwFpqLrfbDUHwYvCZ9HoltzJjUur2fCZJdvKd7vKasfkENmEcGILZBf9zEICQ
 yQQMYd+c5qDxijF0qZmcznpLJFe+gMUQaOSny83tgcAwLwZm5BRtuWrXJWa7Dzh/h+eCE1pprd2
 T7VO5Njp3/ehDRpYkA4WqtgZI22YgOaosS7wPYecJTkwhaelMJvXyJEtadbj8Tlr22NKmqTvZj9
 6Zc0oSktGW1rY5gzYnbpwOdwpbYzzcZm3HM/zBw/pmJydX+9thSvVomo5MFDOail+OeZQo7Ka6R
 3BxQcwKQqJT900O9egr5jvFjJjB2y51lvlb3XrRzzNvuHPfPxDlZsyrQN1WPBob1XSI9URd+TY9
 mZgadHVjR0Xl+v6QCBnT6DTFbSz8ynANN7zFnwfPpmg/YzBnxiMbs37cBAJ4xHiRvDQDmKBbo/W
 9gmUOtR0whWtKRJiS8w==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69bed27e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=4dpF3GFcmnioVf4f6KwA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: YZR7hQ7AqB74qhLSpcgm_Wi5dYA9Z2pI
X-Proofpoint-GUID: YZR7hQ7AqB74qhLSpcgm_Wi5dYA9Z2pI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210146
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99031-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,googlemail.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 726632E67A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 07:52:30AM +0000, Alexander Koskovich wrote:
> Add RGB101010 to the unsupported format cases to fix -Wswitch warnings
> introduced by the addition of the new pixel format.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> index 66c73c512b0e..59fc0083d318 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -119,6 +119,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>  		dpi_data_format = DPI_COLOR_18BIT_CFG_2;
>  		venc_data_width = VENC_IN_COLOR_18B;
>  		break;
> +	case MIPI_DSI_FMT_RGB101010:
>  	case MIPI_DSI_FMT_RGB666_PACKED:
>  	case MIPI_DSI_FMT_RGB565:

This would need to be changed again and again as we add more pixel
formats supported by the MIPI DSI panels. I think it would make more
sense to use 'default:' here instead of listing all of them here.

>  		return -EINVAL;
> @@ -232,6 +233,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_data,
>  		break;
>  	case MIPI_DSI_FMT_RGB666:
>  		break;
> +	case MIPI_DSI_FMT_RGB101010:
>  	case MIPI_DSI_FMT_RGB666_PACKED:
>  	case MIPI_DSI_FMT_RGB565:

And here

>  		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry

