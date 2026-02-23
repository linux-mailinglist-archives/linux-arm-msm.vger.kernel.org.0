Return-Path: <linux-arm-msm+bounces-93792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePfQCnOsnGlnJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:37:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB6617C731
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93C8F3006B1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AD836F426;
	Mon, 23 Feb 2026 19:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcojuaHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPssqxbt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E66036999C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771875440; cv=none; b=YoCgjzFueaygCzCPG2rggDDGWwEUnpavkTny54fQ/2zQrp8Ond0Y/1QfiCFxsbcsCAvQUiVDOMBGcDxHc+OKkdMBJZMqagAymt+jnw7iCHttXDXlwewHu/XQNAmMMAQxDQcszXG47k9GBIUjxx53LW7BOUWglP+2Ahf5Nv0a8Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771875440; c=relaxed/simple;
	bh=dpcdw6HrZlKZ5WvsDe6i+/oyDluDfAkrqsWHu5TVt2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGtghsWCRaQ/pqpk3bYc8xdg8kRteOeZACqS7tGDU/5HMJhryBLWzz+itYUJ9BcNSE7Ype8FDR/qH5xiytNIdbTNRezEQ2JpfdPBY0X9zFLJ6vedlzjmTP414nnjdge0S/q6FNLklCziR5GeZoAI/JkzeQIyJf2axUhMfD70hyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcojuaHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPssqxbt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIoCao3409247
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eY/T1hA+HF6UhSUVKBJ0gs+zsZZBPbjvoFStA+IANlE=; b=OcojuaHG4QO4uQun
	soP7EQgSuvGdGKhiYsOrHqgSJ7Vok7GLD5FiZUnuIQ3XMmlK47PtQz5ry1D8A7Jz
	x/zFVCdhjcAV+P6MVNXEjFWD/tXuJurkWu4EL5jmTbLPorC1ZEg/0F/bUBE9OpVa
	rORdxeJNvFzpNsjbQ4q3755MH6Eg2pjTqHOt3ut/F8i4r/QGOvRQaFahz3TGX1cY
	ykOuuZTa/izUW84bIooPevfj99se6YzlFhbcRvpzhvArMdoIfArzhlrvCujDy8pP
	hJy1uIz1JXP90arn8+LJiC4Z7o5hMGpoYIHA/9qFl6Bohf3R+zQziYoKQqZYxPjs
	pwkJmA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8tsp04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:37:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c881d0c617so4232953785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771875438; x=1772480238; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eY/T1hA+HF6UhSUVKBJ0gs+zsZZBPbjvoFStA+IANlE=;
        b=jPssqxbtho0z8sIKKi44KN+IYhkxBUntaQiGLphhPU5vmB1T5WV5hLRIhrThCRPWS4
         45qGWgqNAVksiHql6r4Xu2bMqh3HiceRT7+jd8D/RIYzmNF/4LzGnD2i9cqIAuUwbyZ5
         Q7WS+xB3uRSgBShXO1R8pF4MbvKpNDD0dfjzo9Ods7hUU3wgkxhS1eTJgbrp4ghNKlBx
         9qKKEjXD0T+bDzWA3dD7tM0M1ZKa3mMwzJcvzWeycwiv7S1Ma26m4D6MgEmCsHvpcjYl
         QGP9yZHdAbYgRwCBHPGgkO68fdhNMts5pv9A29RY1/b8+JQ7IH9Q0zf0vJpcW+NEdEEe
         4tOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771875438; x=1772480238;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eY/T1hA+HF6UhSUVKBJ0gs+zsZZBPbjvoFStA+IANlE=;
        b=rO+0hxLicsXP++OONqgAEIzulFR6ajKJ95LtQMy4ACyyRDuFuxrX2KnlonQpa1n3dc
         wKmaZ0yuh6jCGcHl+Php5XOu3xy40PmS7JpOtA7xbShj4IGApG/UjZbhiQUy+7bguflH
         AwpcS2kLKl8uqVyMmPmbe5DcqJEHdszvJsH8VIss/fkfyoclBz4sQFmDXn4Ov+lxvvd4
         YwMp1AdKjN6ESPciFQ5wpydSL2IHPzc9RXROL89obuD+cS/e9nTfNKZRsgrpXMr+vKUB
         CSK2Rk9tWI5VsvVZ0Bx8Plf8K0brUdL8nH6y14bLdaLP8Dc7mQWKIymYnR5t9bTIjFop
         MqAA==
X-Forwarded-Encrypted: i=1; AJvYcCX426ETzIkURmkPgm4eGwlvcizPRTnqze+jIHlPfuEx8zOxzz9odf4fdEY31DA3juruygm37AJ3RT10zth7@vger.kernel.org
X-Gm-Message-State: AOJu0YzgL0BE6aaJRHWzK1fDbuIX4ZDLtvI7ZAaxWo1ccwX1fSFJJNAf
	1CbQ/08sZWfM0ZLgBsSQY9TMe+bMnIft0unA2mPX5AgmugyQjeBoUltNndBD9Sp9Fef510aEWGj
	bpBJcfZeG4JGuVlLxcOptY1BH+/hV3kMkN9C7uYxmC09tLimC+ZkewBVoOK58YOwJMxzZ
X-Gm-Gg: AZuq6aJ/8egNOO88gB1StiEV64ezCFZigrYKZQEXlIp68OrX77hlNfZCiBACrl5nt3X
	u4mII2JshSKYjQXg7ZjwhctxsMwYJNe08HsMQtXi19p4OB3TORtLdjLUoRJLLgGzVpEg7GZaLiB
	QGY2STlXvInWNVxUDCoMoZX0UP5hQFxg2i37vMehniO2nPPbIM1+Bl4ExUuwkuGxQfUhTgCnfGs
	rFCQDtFfoLUvCF7OVEU7ngXl4UG2C4/0AqRAGeWd2qthNt9lPLwOk2goidLbWNHmJU9V86zFXmT
	5SYou/JSacJHTcuNzaB4HkrrGxDQqjqDxj0n+m04BMVspmo70Q+E0podzNBEL8tpkEgTRGMa1Vo
	ovw4JrJmZuW6PFMqnfiP5CzUx/t7S9pTysWKv1LRVGbqZxLac3fcxaorLAB+b0alTEHadzYsEn/
	asPSPKVxftexWyNqMK7D2PLSOIRxs1G59sSfg=
X-Received: by 2002:a05:620a:f06:b0:8b2:e8a0:f4e with SMTP id af79cd13be357-8cb8ca9e3e5mr1205848085a.77.1771875437590;
        Mon, 23 Feb 2026 11:37:17 -0800 (PST)
X-Received: by 2002:a05:620a:f06:b0:8b2:e8a0:f4e with SMTP id af79cd13be357-8cb8ca9e3e5mr1205842485a.77.1771875437007;
        Mon, 23 Feb 2026 11:37:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb3ea5bsm1755489e87.42.2026.02.23.11.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:37:15 -0800 (PST)
Date: Mon, 23 Feb 2026 21:37:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] drivers: gpu: drm: panel: Add Samsung S6E8FCO
Message-ID: <5ibwkfovm2vvpin475c47lueomscnetwv6myglxqtaw7x26l2m@q6p5vye7itnh>
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
 <20260223-panel-patches-v1-2-7756209477f9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223-panel-patches-v1-2-7756209477f9@gmail.com>
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=699cac6e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=sfOm8-O8AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5_deXYglJ-IJTFlCAz8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: ksoa1HGHTO0VCpj7Y5nRHJw_vrAaN8x4
X-Proofpoint-GUID: ksoa1HGHTO0VCpj7Y5nRHJw_vrAaN8x4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE3MCBTYWx0ZWRfX5Xky1H7+YDi3
 NE6ifxz39QNkf/0OkVM1nVUvDF1j+Ayvj1PuddCPRuAvFr+rURv8McJFU8H3B6UML3pnPwh8DTt
 2SaM1jpKi6afn7Q+vQdy4y/XH2JIO2gu3FdJa2lm24t67u0hfhXO4gmBLMGksemJIS1FEOg7LCM
 TF65TOfIqxv5QlFT0fOWFyJEVRo6g1QdfmHiSBTCDjH7dS2SJcgqcl2NWWAFas3YV20cAaGCIw3
 VC3U71eRVQ/QaRRKzo3oDPPx3zgDz466YOBiYxYCbmoPd365IOUOSlGpWPAQn80w/ITH+r4mGWi
 WOre+NxwqXP6YxRCV+MSwJ91WaSJSEec1c29e+UHXmvJAFWV8Ucl+/vwet3NfczcoHcQcrqACul
 IuTBsNbHE2FGHypMNYZJAHO29rCt1tyQHkJ1s6VgOAJWs9yBc9zmL7ihmQtRsxEYJJF/oiGnLXn
 T54Vb6vRCwtXWioHHNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230170
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93792-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,protonmail.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AB6617C731
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 04:24:03PM +0200, Yedaya Katsman wrote:
> Add driver for Samsung S6E8FCO DSI video mode panel, used in
> Xiaomi Mi A3 mobile phone.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  12 ++
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e8fco.c | 293 ++++++++++++++++++++++++++
>  4 files changed, 307 insertions(+)

Please change the subject to follow "drm: panel: foo bar baz".

With that in place:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 545d4cf68b9ac27765c7981e668e32cfecf3366b..238b5332eaf0e0cfb9834084e24671ccaee79939 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8187,6 +8187,7 @@ DRM DRIVER FOR SAMSUNG S6E8FCO PANELS
>  M:	Yedaya Katsman <yedaya.ka@gmail.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
>  
>  DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
>  M:	David Heidelberg <david@ixit.cz>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 7a83804fedca1b688ce6fbe4295ec9009007e693..734640bb3f73c83e9273573aeb720ea1ba20862f 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -893,6 +893,18 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
>  	  ~5.6 inch AMOLED display, and the controller is driven by the MIPI
>  	  DSI protocol with 4 lanes.
>  
> +config DRM_PANEL_SAMSUNG_S6E8FCO
> +	tristate "Samsung S6E8FCO DSI video mode panel"
> +	depends on OF
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_MIPI_DSI
> +	select VIDEOMODE_HELPERS
> +	help
> +	  Say Y or M here if you want to enable support for the Samsung video
> +	  mode panel S6E8FCO. The panel has a 6.09 inch AMOLED display, with
> +	  a resolution of 720x1560.
> +	  Found in the Xiaomi Mi A3 smartphone (xiaomi-laurel).
> +
>  config DRM_PANEL_SAMSUNG_SOFEF00
>  	tristate "Samsung SOFEF00 DSI panel controller"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index b9562a6fdcb38bfd0dfee9e8c11e16149ada4386..54eca60e5b57328ea94ed7880f4dead981f87fc1 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -91,6 +91,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24) += panel-samsung-s6e88a0-ams4
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams452ef01.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01) += panel-samsung-s6e8aa5x01-ams561ra01.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8FCO) += panel-samsung-s6e8fco.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
>  obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LQ079L1SX01) += panel-sharp-lq079l1sx01.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c b/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..0a1a1c680ee143d2429a6e1ea59a4fdd16b156b4
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2025 Kamil Gołda <kamil.golda@protonmail.com>
> +// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> +// Copyright (c) 2026, The Linux Foundation. All rights reserved.

Hmm, so Kamil worked on it before it was written by LF? Are you sure
that the year here is correct?

> +

> +
> +static const struct backlight_ops s6e8fco_samsungp_bl_ops = {
> +	.update_status = s6e8fco_samsungp_bl_update_status,
> +	.get_brightness = s6e8fco_samsungp_bl_get_brightness,

Does it actually return the written value?

> +};
> +

-- 
With best wishes
Dmitry

