Return-Path: <linux-arm-msm+bounces-114713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v94+EAjkPmqZMgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 22:41:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C865E6D00D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 22:41:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Xjkds+57;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VwC+Nb8E;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114713-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114713-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF3C13026AD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 20:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6699D3BF660;
	Fri, 26 Jun 2026 20:41:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27BB3BF676
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:41:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782506502; cv=none; b=RUnBgKiQZNNkpLsIB6NSL4kOfUKxp5t9GPfY3zygb4YYIH9NwtCRgb3t86h35e2dwsj+wAvVabN1VY7LqjsQAceUuV196yiZkcZIYFoXNOunKh6gqjf0TwhnzN7ML4cQstZ5iMGkvK5nWQC2asjpnj6lemXb+PfswWHy0a/f/8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782506502; c=relaxed/simple;
	bh=2Ulc0SWF8262TTAGsof0ZzS0ft816yhExp9dW2keXn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKTmYFa4uGQSJaNCDtBDZV0/ZPxLX+y1c3+KHOCWmpJo2260QNkbAqa5ncWgIaqfkgAAqv+Cr1wSwYz6KmvfccCCwKwupttSvt6KDPzUtYrZ+kFYRwfFCtlTr5YxE832EzvN+p0lhot1FCgq3WFpaBxr88CcLCPefwdap3H6Z9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xjkds+57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwC+Nb8E; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8arp1980854
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1uaGDXBW7Kq2zoKPgn7o7FFe
	mmz8E/gP79jq5g9mVQc=; b=Xjkds+57Dv5n2+7wLveuOQqMfFuJrIZOpRqz/qhM
	eHoWOqTwnj+3hWHvxA1thaGFnVYtXyvor2zE0dd/sQ8+abmgcg/5SH4VRJEYeT+L
	UdwOiw8MfZyRXVBIYBd4aM9+HIhpwfFU8YyTh+fZAIHDbdyBi3N9O7E2V6S7kXZg
	KaNnf14O8VmBYlRWfXZotB+23q8UB6Jj4OC33y8x7sY7uweeHfWSnsEYUptaAXH+
	n6Vk8UKy4NF1H673BpD/gnMbmvKwE+OR+oEMnNx7Lq+G87RX7TavqULlmEagm7Zb
	dfxkLUCRHOd6El0gHdbE7/EdugdJqsxLlzTzYTp5Jok5ZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1p2ttj74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:41:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915f6ff639aso320735785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 13:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782506499; x=1783111299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1uaGDXBW7Kq2zoKPgn7o7FFemmz8E/gP79jq5g9mVQc=;
        b=VwC+Nb8EEr5+KJ8sEELK9Gs3oYQh4uZ2WnJxfBhbTe3e5BN8d792ri6VkCaKeSIVOb
         0OGdaMVZqs6tHIRR4yay7wlNCBS+dP4MeR4WI4aHOVohRtT0kEckGgVpsl6HlY55Ueva
         MGEnn4Dy4yKllpeWLbItihWor2PZ7xxS1sGr9fryFTzkH1tFcSfahpMioeU4iqRZg8ZW
         k6LOipcMioQRa1tggWUmpIQw1O1JLQhoPVb5d1HFPJU+nzub2aKSxidvhQrIv/ewpqSC
         uaj02dQsE5xo1zj1oE/P+O+C6V97UcJbhDuW8UeUIdEFejgmKq4syw9TXybxDvIjWWbH
         hz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782506499; x=1783111299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uaGDXBW7Kq2zoKPgn7o7FFemmz8E/gP79jq5g9mVQc=;
        b=BqM3XcdfNGwtOw7qiMSL/7ZBYRLTFc2byUQThQ1IJ1XFP8cwWfXbHz79t9XUAn1kdF
         +9PKRNZyVm2fBf1noXtPh/3QcpRmz6hi2KyCJaDEpawo9OzZf5h4BlM32lh74MQ+3TWY
         oEnSRwsOgchW8GpyflwbMC/85gXRHN5+itIOsZrVnSjrawiaSf3df1BABUcdEn8HK1UU
         jUAvmDRjDGi3L25Nn5PJNR5OXSu2G6G7WBD9C8bPC6WK2VGvhfhE/lBbKqSt7qtxlkPa
         Zj5GNNKxjb/qJ8T4WT8ybuP3i1Ja5Xx81Bp4Q6Kmbb1L40QYbN0z84LXnwTPeRz9V9dF
         Gdvw==
X-Forwarded-Encrypted: i=1; AFNElJ+dSeh5ZQyXri/EiFYRKiNcjV6iCe4XVNVi6aB2hUbnxXD+FoJD58rIBP7bMxRiE4ANy3XgimrA6VhGNi0h@vger.kernel.org
X-Gm-Message-State: AOJu0YwTRIi6xHy4nStrj85ApgAZG5sS7dWBHacbctZVWwtexs4fF6+H
	4cN6ulBkPMJMEaffPLUp3hDguAcqEBvYLkCprRggyfb8gzn68kfYMuHCaEGaTmngY0srihgRf8+
	FfTQ16+K6kMvcn7F1USC/E120BMGljBGJQ2nN237No4JTq1R6RuTzFbp8zFhlV36ZrSyv
X-Gm-Gg: AfdE7cl0ZlCAaSjH7mrNzxAPOwnD5vCKlZqOB/S/7j4/BszH3uOfG6EgQy1Q7k1/MZw
	4eY7zJfb/lakJUPwbAhcc2tKhxd1+jNim4HF4WvNedPiZGpPQZHc5t++GiH5NkoJGPwzyYpNk0V
	H4/MfNxdOL7+S5jOY8a3YUFKDDgfVz5rYQhcZEIPmEYVpa6Hn4BhlUtbOxSbg2HT6PxNQVm+rTR
	J+H+YKP/NrRVUeznmidkBrxGXaWr1cInTXNfqyfva2dZmlMyy7pA4FeCVwkOQMMyCnG5gJc8blG
	Q99a4/flG5oLPtRZW6unziNGTOBp6uBINDWtWr3awZy83113ZrqBvCDALwE7l/H+tDq3cX3gDO8
	j5OsLrEqPAPmQZ9/KO+ls1KMzv3GfFVMesEZOG6v4hGEIX2u2L+fY9qHdMjKhF9MIFYyN4ljAod
	/U/0moLTLr1JiEKPEIpJZMQY4B
X-Received: by 2002:a05:620a:44d4:b0:925:eb05:d194 with SMTP id af79cd13be357-9293d4b2daamr1286064985a.57.1782506498910;
        Fri, 26 Jun 2026 13:41:38 -0700 (PDT)
X-Received: by 2002:a05:620a:44d4:b0:925:eb05:d194 with SMTP id af79cd13be357-9293d4b2daamr1286057785a.57.1782506498017;
        Fri, 26 Jun 2026 13:41:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b1b143fsm52646381fa.39.2026.06.26.13.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:41:35 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:41:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ayushi.makhija@oss.qualcomm.com,
        rajeevny@qti.qualcomm.com
Subject: Re: [PATCH v3 2/2] drm/panel: add Ilitek ILI7807S panel driver
Message-ID: <5pvhrsikc3spr5jworztun7pjpgnkfihxvqd3dthhn7yeoud56@vcajuuwqplvo>
References: <20260624-ili7807s-v3-0-ddf37052a289@oss.qualcomm.com>
 <20260624-ili7807s-v3-2-ddf37052a289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624-ili7807s-v3-2-ddf37052a289@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE3MCBTYWx0ZWRfX+JKxYVG7sZqJ
 vuEKoI6qNq/U/Kf5qkNGQqpyvZnFFqYqZSeJimFhL6aaDDTgKWbDdIfioSoxXVJ/FT+ofB/fXxe
 mvAWlCV68DIlFgEnMkKZXAu5eMo11ZA=
X-Proofpoint-GUID: _XC6SI_2B9sHfZFBnVZd5X-kvIJZcP_g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE3MCBTYWx0ZWRfX0V1lKYmfgLCo
 ojeC5eGryME4aAEyI4zgn9/rrdMGOF+KZJAza7fppUPIa14yzchOaphEmvmNs+OQ1a4oHa4NrVD
 PZjE+oIlZ7Ij4tYZNQlwmPWR5qutUNZx3D4PjhHbagr6AsLGb+k5L8iOxGk6zOl1V9/FeVrMAwr
 NLEU8cbo1rBz7dJFd/1AomySGScsY1uvXtaFulXYkS08TyysBt4XuDJJI/PaLjKsNatiRzKg/Pc
 UGJKGfE756QC/nWvr9Zxm4281BsVAz2rdfNsY/D1/YIPPKFhLV/h2gZdz2nkEh6cAZjrf+1SK8T
 Kn0zH0V1qCYiQ885pp2aSTnzHvxVBT2Jj5ROj0pgkvq8b8GuNNjezJuzJXeU46/9D+bWaFAoK0M
 28g0avWz+0FZ9WaSiVXRi0CbQZTrHt+roevAI4OSWHJ+IZiThWgH4XYgbH/26Q2kN2YpjCwhFon
 pMXqDf5UiTXHVsmenFg==
X-Proofpoint-ORIG-GUID: _XC6SI_2B9sHfZFBnVZd5X-kvIJZcP_g
X-Authority-Analysis: v=2.4 cv=IM8yzAvG c=1 sm=1 tr=0 ts=6a3ee403 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=UkQgNfaBbZvMdpwfnggA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114713-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arpit.saini@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ayushi.makhija@oss.qualcomm.com,m:rajeevny@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,qti.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,vcajuuwqplvo:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C865E6D00D6

On Wed, Jun 24, 2026 at 02:23:52PM +0530, Arpit Saini wrote:
> Add a DRM panel driver for the DLC DLC0697 1080x1920@60Hz MIPI DSI
> panel based on the Ilitek ILI7807S display controller.
> 
> The panel operates in video burst mode with four data lanes using
> RGB888 pixel format.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  12 ++
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-ilitek-ili7807s.c | 293 ++++++++++++++++++++++++++
>  3 files changed, 306 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 7450b27622a2..1cbaac1bf545 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -264,6 +264,18 @@ config DRM_PANEL_HYDIS_HV101HD1
>  
>  	  If M is selected the module will be called panel-hydis-hv101hd1
>  
> +config DRM_PANEL_ILITEK_ILI7807S
> +	tristate "Ilitek ILI7807S-based panels"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y if you want to enable support for panels based on the
> +	  Ilitek ILI7807S display controller, such as the DLC DLC0697
> +	  1080x1920 MIPI DSI panel.
> +
> +	  If M is selected the module will be called panel-ilitek-ili7807s.
> +
>  config DRM_PANEL_ILITEK_IL9322
>  	tristate "Ilitek ILI9322 320x240 QVGA panels"
>  	depends on OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index c2c5cf817116..c3002b351cb8 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112B) += panel-himax-hx83112b.o
>  obj-$(CONFIG_DRM_PANEL_HIMAX_HX83121A) += panel-himax-hx83121a.o
>  obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
>  obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
> +obj-$(CONFIG_DRM_PANEL_ILITEK_ILI7807S) += panel-ilitek-ili7807s.o
>  obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
>  obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
>  obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
> new file mode 100644
> index 000000000000..8ddfab2693ec
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct panel_desc {
> +	const struct drm_display_mode *mode;
> +	unsigned int lanes;
> +	enum mipi_dsi_pixel_format format;
> +	unsigned long mode_flags;
> +	void (*init)(struct mipi_dsi_multi_context *dsi_ctx);
> +};
> +
> +struct ili7807s {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	const struct panel_desc *desc;
> +
> +	struct regulator_bulk_data *supplies;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static const struct regulator_bulk_data ili7807s_supplies[] = {
> +	{ .supply = "vddi" },
> +	{ .supply = "avdd" },
> +	{ .supply = "avee" },
> +};
> +
> +static inline struct ili7807s *to_ili7807s(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct ili7807s, panel);
> +}
> +
> +static void ili7807s_reset(struct ili7807s *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);

This looks like the reset being active-low. Please define it as is in
the DT and use normal (hold = 1, drop = 0) semantics in the driver.

> +}
> +
> +static void dlc0697_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
> +{
> +	mipi_dsi_dcs_soft_reset_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x78, 0x07, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x35, 0x00);

mipi_dsi_dcs_set_tear_on_multi()

> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5e, 0x09, 0x99);

MIPI_DCS_SET_CABC_MIN_BRIGHTNESS

> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);

MIPI_DCS_WRITE_CONTROL_DISPLAY

> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x55, 0x01);

MIPI_DCS_WRITE_POWER_SAVE

> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x51, 0x3f, 0xff);

mipi_dsi_dcs_set_display_brightness_large_multi(). Also please use
0x1fff instead of the full brightness.

> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 20);
> +}
> +
> +static int ili7807s_on(struct ili7807s *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;

Drop, set it in probe()

> +
> +	ctx->desc->init(&dsi_ctx);
> +
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;

Drop

> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int ili7807s_off(struct ili7807s *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;

Drop

> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;

Drop

> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int ili7807s_prepare(struct drm_panel *panel)
> +{
> +	struct ili7807s *ctx = to_ili7807s(panel);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(ctx->panel.dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	msleep(20);
> +
> +	ili7807s_reset(ctx);
> +
> +	ret = ili7807s_on(ctx);
> +	if (ret < 0) {
> +		dev_err(ctx->panel.dev, "failed to initialise panel: %d\n", ret);
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
> +	return ret;
> +}
> +
> +static int ili7807s_unprepare(struct drm_panel *panel)
> +{
> +	struct ili7807s *ctx = to_ili7807s(panel);
> +	int ret;
> +
> +	ret = ili7807s_off(ctx);
> +	if (ret < 0)
> +		dev_err(ctx->panel.dev, "failed to disable panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
> +
> +	return 0;
> +}
> +
> +static int ili7807s_get_modes(struct drm_panel *panel,
> +			      struct drm_connector *connector)
> +{
> +	struct ili7807s *ctx = to_ili7807s(panel);
> +
> +	return drm_connector_helper_get_modes_fixed(connector, ctx->desc->mode);
> +}
> +
> +static const struct drm_panel_funcs ili7807s_panel_funcs = {
> +	.prepare = ili7807s_prepare,
> +	.unprepare = ili7807s_unprepare,
> +	.get_modes = ili7807s_get_modes,
> +};
> +
> +static int ili7807s_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return ret;
> +}
> +
> +static const struct backlight_ops ili7807s_bl_ops = {
> +	.update_status = ili7807s_bl_update_status,
> +};
> +
> +static struct backlight_device *ili7807s_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type           = BACKLIGHT_RAW,
> +		.brightness     = 0x3fff,
> +		.max_brightness = 0x3fff,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &ili7807s_bl_ops, &props);
> +}
> +
> +static const struct drm_display_mode dlc0697_mode = {
> +	.clock = 131911,

= (1080 + 18 + 2 + 16) * (1920 + 26 + 4 + 20) * 60 / 1000

> +
> +	.hdisplay    = 1080,
> +	.hsync_start = 1080 + 18,
> +	.hsync_end   = 1080 + 18 + 2,
> +	.htotal      = 1080 + 18 + 2 + 16,
> +
> +	.vdisplay    = 1920,
> +	.vsync_start = 1920 + 26,
> +	.vsync_end   = 1920 + 26 + 4,
> +	.vtotal      = 1920 + 26 + 4 + 20,
> +
> +	.width_mm  = 0,
> +	.height_mm = 0,

Do you really don't know the dimensions of the panel you are
contributing?

> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +

-- 
With best wishes
Dmitry

