Return-Path: <linux-arm-msm+bounces-96076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BokMrjNrWmL7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 20:27:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CA3231E79
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 20:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB2FC3009F02
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 19:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D676346AD6;
	Sun,  8 Mar 2026 19:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFSPuFoJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gC4GUuU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F068C285C80
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 19:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772998067; cv=none; b=GdPd9PiWiBANNyD+LJjMQc7krApyJDyYnlKCp3WWUi3tbtpDk+sek+8hH6EDcR8GT1Gfn7qPBcNIQsrv6p08PfggD3ra6eQLpqg6Gd/kSUZyEs58w3WvSE/z3B5r7e2uobvuyj6w0zZYoPJ+QORqON9EWMglZhOyUDDzHq7oPK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772998067; c=relaxed/simple;
	bh=/7Sn8DxPT3KkxIrltZkAY2FehAZ3oqRtWCKEqwtg1bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7C64sBLbrAIg+MuT2ZHOprm+2nvczk2yVZSOu2UubH84KpZRJLOUqlM9HqzMLlEtkzwKjhc3c53eQmlrH2cNiNhDkgjS7yabm+JQvoBhcfBXCUE14IxGUlCzoIEUBZlBXJ9lt2ZOU379z5YU9xK8ZaA/yw/qqL0fQS2bjze4AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFSPuFoJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gC4GUuU9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6283PEVh1131786
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Mar 2026 19:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yvhx0hHAKfkZNVagkFb9Vhg0
	n3xxbR9f3Gh39D0w35g=; b=oFSPuFoJloQVraPqj+MjVcOxkYVlbs8mVdJ6pbYq
	t60RM9jHlPydfzUeO1VD5BBK3rZJvLE7Q3kEeRrFFI90Xy8boYK/Io5jzByRPfgq
	4P9QdpaXfnW+BhKsHOTAdo0zGO20xSNCilUDAX/G//kFdPjsLP1zcZ46gqHnkrSn
	5sQo8rjd0PaWPUDvIAdRzQzeYzIqtY/sunn1lq6DhzjDHzH+nGwxLNZp192YqOOe
	mvzAvK6aEkw8i3/Rwjd9lLrGGKvZLzkFXuaIJbuH8V12q5RZ7iThQcrfpAEuHVPr
	I6JfordXVPvYpdCfPvqRt8u8cruwkY9qR41AWurll0LRyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8axe5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 19:27:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7de0e161so632491385a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 12:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772998064; x=1773602864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yvhx0hHAKfkZNVagkFb9Vhg0n3xxbR9f3Gh39D0w35g=;
        b=gC4GUuU9ok/uNNLP8YtnFix1vM6SrsY57Yjv39VwD8Qut/R83o+6RxKCIIMvpfSPlq
         BdwfNWefL2Qq0hrZEUxAfOqfpSbdoGqxFOQ6BZmKbu9qBbGcOvObnAm3CwbVMnNx1tXQ
         lgTf5ABkd4MBYhCUPwzsiRd/e8zqRbKbaGtcavMQjunHRrEgUvkj8yEZxrs208pxO25U
         sgGn/qNrSP+18qp6O9+33wknsU6r25h7EvDBJ8qkMG2H1OWZ0qNlvS2eWbq+QOsQzE8F
         vQ0RE6le3B49JUlw9jjyjUmIVJS/LIpqgaWIM6j5phvGSujH05V8TYAXyfEG8vJG/VbV
         VCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772998064; x=1773602864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvhx0hHAKfkZNVagkFb9Vhg0n3xxbR9f3Gh39D0w35g=;
        b=rC4TF3+8jQVnxmNnWZ/iIoyBgLVywrkvxN46HF7efhkZAlPYUJO0N5GfIOgIX5AcrL
         dYEot0FzOWo6cVMmK2BzIDy1mKyHmq0dgBBhJEh5w0PG19rZuHWq7aP9pblsqDaJh4vo
         QWmBr8QsDOR+ZEJMPdF9UwJYF9wFxESL1I2AYxRmoM5SIkaoZvimibJF9qKrCdmWS6tI
         mNifZNzlXzZFWUmGNOobEjzC2DEAl8f9DI2/AiO99kCPRVP0ZlkSqZd2Dd7lqSuRc55c
         IBJEHekBLJxtLKYfo2FQexIntfqK6bLci8Zt03JfrO0DjjhDWr7/vU3xiq54v4m0dMRf
         I9hA==
X-Forwarded-Encrypted: i=1; AJvYcCUVew7N4CAGkWPjUXdWbpXhUbbNpa1oddV7sAETQx3ExTpIOAeQ0Z56FLNYddvOWVNdlntzumPxbRsZiNwI@vger.kernel.org
X-Gm-Message-State: AOJu0Yynm0JOhQscxqTeamva6oA8vF5PCgvzz9BmYaDBk/peBfoKAnpT
	/Y7rRK3Ig2lQBPRUekoU8XlNzsolwYrqa13BpN7URmbsLS2PNSl2dfqXQEYc4JYo/O1JauPwDzq
	Q3eD6kXJ7RqKc/u0VyTKQIGkfBBnifqFZqxzTZIDD8eHS5bF8fQ+QEcmn+roxKr5qyRKT
X-Gm-Gg: ATEYQzzqRKikrYk7gpvAXpc6qE80mXVlQAy4eBAjRdnj2fxcCywsC92Kvr0yNLuw7g+
	KM4D4I3cc9C0d9uDZfirs9Dwbp8l4S/Kmhz1OD/U1ZMGjqsUiKJsJV+DeIfLLnqrAjUtr76K7p3
	TBADioQGraYOvQteF4iim/lYztA53wOiExwyRua4c/BeDtRIEU4oRNVleF4ElZWGlmNHSkhhtGP
	EIO5008PdfgsD/PhrvgPkxmEjc0XAPYz54CJ7Pctf9WsG1QrX0qUmlSkflybcQUfpJDV/vXZn0z
	mojxN5zL1hbSbp96QtrXyZ+w5QDoNmEZK+Bl7uL89b6oue9LpueZ9HB7EdMSvDNgeV1D7AH65vE
	ep+JIvtQycv8m0M4EFFfh0p+UD9AuBSGg5i86gLYBBJAB1FSk5TUFo7m3u9GAeNhdE+e6VImJgc
	tCxCK+t1/8UAAPAROMB/5GG4W4VV3BJb+4RCQ=
X-Received: by 2002:a05:620a:4bc4:b0:8cd:7cea:ae9f with SMTP id af79cd13be357-8cd7ceac583mr374001685a.36.1772998064077;
        Sun, 08 Mar 2026 12:27:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4bc4:b0:8cd:7cea:ae9f with SMTP id af79cd13be357-8cd7ceac583mr374000485a.36.1772998063516;
        Sun, 08 Mar 2026 12:27:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d03d319sm1603817e87.38.2026.03.08.12.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 12:27:41 -0700 (PDT)
Date: Sun, 8 Mar 2026 21:27:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
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
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/6] drm/panel: Add driver for Novatek NT35532
Message-ID: <kvq4py5svidg7c4tu2kxwpj6fnsod66kq555pwchd44nfdjejk@yvpk4ismso7r>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-2-aa2c330572c0@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-rimob-new-features-v1-2-aa2c330572c0@protonmail.com>
X-Proofpoint-ORIG-GUID: nguU60dGJwFzbP1HRPG8YDEYYIr4SB78
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE4MCBTYWx0ZWRfX3om8cbWcdPv3
 F12v5NvVdmoRH0xPh4L1NePVerbDDMsRpsw6xKelrvLrxvQGEe/+lRIGJH3sUrufVZW9+wV0q2D
 3pmXcdBwwgxIlxxfkFhRgB5qQNuehsMXdhWwW8sMDrjaynXewBrs0ATzP+baT5ZPwUcLyaRdqeQ
 EplA7PXforP0Bo64r2vAADWq6dkmXmtayLS1MZOUAc+qXSBh9tUJCNwb5DmTgNiBTRSywJ+0dSP
 tmaxQhB/5OQWGmN0pY8Lk+xASl56OaPTwfGF3asQ8QU2BwvaeH2F+ODSR+pU1J70Eba/FgWzLQ/
 4Yv6gEkwMukNyBo98poiKm0c3rA/xdTBJKIfkpJRdFdCSQwKKfoWAJOg/r881r4bLF+OxPJvVJw
 aWLzOXc86/E3uo8b+AULEe4HrPShrxCrjmi+QUXIfBQjFTCg0cIENMEg9P1ga/mQtBOpYf2fmeU
 3/blj/8Ls0Q2gCkkypQ==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69adcdb0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=sfOm8-O8AAAA:8
 a=VwQbUJbxAAAA:8 a=43JGVj5kcgoAPVrWvbgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: nguU60dGJwFzbP1HRPG8YDEYYIr4SB78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080180
X-Rspamd-Queue-Id: 45CA3231E79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96076-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 04:52:42PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add support for Novatek NT35532-based 1080p video mode DSI panel.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  11 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt35532.c | 767 ++++++++++++++++++++++++++
>  4 files changed, 780 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 12243feb0b27..d854804dc8cc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8143,6 +8143,7 @@ DRM DRIVER FOR NOVATEK NT35532 PANELS
>  M:	Cristian Cozzolino <cristian_ci@protonmail.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml
> +F:	drivers/gpu/drm/panel/panel-novatek-nt35532.c
>  
>  DRM DRIVER FOR NOVATEK NT35560 PANELS
>  M:	Linus Walleij <linusw@kernel.org>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 307152ad7759..4eb9691ab552 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -500,6 +500,17 @@ config DRM_PANEL_NOVATEK_NT35510
>  	  around the Novatek NT35510 display controller, such as some
>  	  Hydis panels.
>  
> +config DRM_PANEL_NOVATEK_NT35532
> +	tristate "Novatek NT35532-based DSI video mode panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select VIDEOMODE_HELPERS
> +	select DRM_KMS_HELPER
> +	help
> +	  Say Y or M here if you want to enable support for Novatek
> +	  NT35532-based 1080p video mode DSI panels.
> +
>  config DRM_PANEL_NOVATEK_NT35560
>  	tristate "Novatek NT35560 DSI command mode panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index aeffaa95666d..f2b3d9b7abee 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -49,6 +49,7 @@ obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
>  obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
>  obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
> +obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35532) += panel-novatek-nt35532.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35560) += panel-novatek-nt35560.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35532.c b/drivers/gpu/drm/panel/panel-novatek-nt35532.c
> new file mode 100644
> index 000000000000..51ba548d0a8b
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35532.c
> @@ -0,0 +1,767 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
> + * Copyright (c) 2026 Cristian Cozzolino <cristian_ci@protonmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct novatek_nt35532 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct regulator_bulk_data *supplies;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static const struct regulator_bulk_data nt35532_supplies[] = {
> +	{ .supply = "vsn" },
> +	{ .supply = "vsp" },
> +};
> +
> +static inline struct novatek_nt35532 *to_novatek_nt35532(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct novatek_nt35532, panel);
> +}
> +
> +static void nt35532_reset(struct novatek_nt35532 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static int nt35532_on(struct novatek_nt35532 *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0x01);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6e, 0x80);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x68, 0x13);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0x02);

If this goes to be resent for any reason, could you please insert an
empty line before 0xff, 0xNN wries?

> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfb, 0x01);

[...]

> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x11, 0x00);

I suppose this is MIPI_DCS_EXIT_SLEEP_MODE,

> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x29, 0x00);

MIPI_DCS_SET_DISPLAY_ON

> +	mipi_dsi_msleep(&dsi_ctx, 50);
> +
> +	return dsi_ctx.accum_err;
> +}
> +

-- 
With best wishes
Dmitry

