Return-Path: <linux-arm-msm+bounces-109148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A1DOhxqD2oDLgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 22:25:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8B05ABBD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 22:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A648C3026596
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 20:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B77407CC2;
	Thu, 21 May 2026 20:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wq1ZWwGM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWr0vRVq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B07D3C7689
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 20:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779395096; cv=none; b=tKHnMx7RHwGKXK2VZDjwtNxlTXLJKjClbxnz4SLkhnQs4kIbJS3+JbvAGdd2juQmJ0V58kqv/SOae4az8F8mFLyUAizc126hf00QwU5jJixe+KktUc7gZ7Mwqr/cN0ylX6wamDYQvOIkLg1SHrFai9FR7Y1kDhPU1DMVpQ+5EXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779395096; c=relaxed/simple;
	bh=vPO2GmySY1g58rauJNIBOGRdQrRJRxCSfgbg0PjtyNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aoyf2H0XXmylmcJWcGxyWfNK+QVrr3GX4FHTtLv1U6H+Q5B04HTJ/WnfYLOWFySWg0QByHG0LOQY2B9ubkA8PTxlQya/As5hfUIaEMLpy7wp4pstUYc9E+Hdq0LmCcawXudXxD9FwUX8wsGj6AD23TfgTzRngin+/D6Qo94GfpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wq1ZWwGM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWr0vRVq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LGkDeN399407
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 20:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uVZRuQgXpH0oQJeuIfFR9OF/
	de+BK41TUpqDLiYGHME=; b=Wq1ZWwGMecMD5NVPKIOYE9ctSizCoksfbiV/DtAR
	ug+x1NAZq3nL1jlGbubQc9CX5Fi1girxaGiwVP4M3OODnbCBN+GXCxq/ODI8uii2
	DjsUhscHCxigu+UUf9GZNyck1zPSlfiDudU9I4V9nPS5lLKxsa3rrXEaRSrFmaYb
	NVNxm9wQdn94izhth8ljAYnR80o7t8jM/LInx72TNX3SCd8UQCz6S+AD37ZCNhrO
	OTCPyAIg6RUg/45c9UrK7leqwwn2SjNQVewKjpM+3hhkbOcxrQg9Mw+jjtuf/Q/M
	qzjiiZifEXm4LZ6DxAsrHxLbgNWipX04YoWus9jT56tj6A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9rv2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 20:24:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514551d5f2aso249456241cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779395092; x=1779999892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uVZRuQgXpH0oQJeuIfFR9OF/de+BK41TUpqDLiYGHME=;
        b=DWr0vRVq2iHDhwhwhbw8bRBTOD+K+Lm+FpVf8XS1r45Zg2c7YUoIsOm3zlsCCt2f8a
         BgMrCHVsjrZSZQk+N22x+j5QVOFBUJdOx01ngQxpQitKyjCvuwpV1OWqYYymgm4Qx4Ve
         UBJlSZn7MTd27nk49P9oRDKZKHMnPOy8gx4CLR3ZfIP98MjsAvcfvk9vH0vG4/i1zOrO
         MQyvyNQPsjddltfufSVps2XJe7bBHWqb5Pv58UZWvHcUF2e7KJFRuVfQTOEQjySjgE94
         nUmANUPqnqOx9A0xczJsm3NmWJCRhx7/8hfCschkBgWU81OPWIdfI8yCnsIQzqhTxZqb
         noBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779395092; x=1779999892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVZRuQgXpH0oQJeuIfFR9OF/de+BK41TUpqDLiYGHME=;
        b=eyJTE6sgQIg+jpjZo0JchYkBAT9f/diFqxVLWJELS9U0tDQeaWiQe8/wrnCWVP9U8h
         udQSsEb25jc0QwRfiBqB4JJlo57dASSOB9fF6szzFvw6CdSkrzXaa0hyFLndS/qZ3SDB
         2bb5FwkW5YDTzrVOmEg8GrVjaf16BY/5Moio47Ias3KkdXdT6QCL/2AXzAtzsGKfAhCo
         eEjdKzTcrVzCQMbZxLVwFPQ8pPHEFfO8G2kbvqYr7H+YNbbZkZiB0jN1Ulcjp6p2lq2e
         804K+YsteXuYgBqGYBl9MptlQhSl454KsBJ35B4op/KSMcoWefD/YiOsKEYn5TZtrSWU
         vszg==
X-Forwarded-Encrypted: i=1; AFNElJ8xON59Tl43Pgj5HorDz8c2cAfqq+3yfosgC+RuSb4guRbDfXtLuMLXBDq5gwgTBbNTAKlyzLEQNp4cTn4L@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7jqzxWmivDxqgHFXXGZ9RPQxf30a8BnVt46/Q+DNTIMqB2TUg
	/854zSKj56rjIKHI41sKrpzcDjwAkUotL8P9+3fDnIroDShCbu8vB6S0+aE42ziHDT17FcdDZkJ
	VMmXqHjTj5prUHeYiWJtZEqRHNk1zxXUu7+3iRy09Ke2H98wWi/IM6iTJbRRguJIw0D/o
X-Gm-Gg: Acq92OH4+pye46zjatskqj/6wkZ6gvGzXDYPMkBLxafXLFthLMz5l3RejzQZ0rxAqEB
	gl3CEegvDpem5E2FSNzsxoN47yLEwECBrjep44aqvnhU3u4MFk/tKkwCjVDzkQF7Oi+h4IDCcD9
	We0B45+wNuIo5oWkYo9F2Vcv0/a1+GAw3d/5zq5UXtfi+RWzB1XhklEvusqjkhG5+6mxgRTNKK9
	aY8FROld9wKtryPhn0IZcSAGQ4FKV4fhqOGLKk8Dcl0vVvtjmczIVxt71sV95xBPz7E5QloJ6TO
	fZma/JahYFRvmwtebAI8heRYETCqRLyaJy9jGUS6A7v0SsLlElqGTJ+l6LTxSbEHtZi7Y/XxXN5
	h5cJYMQFqo8THgqUzhKXRTP2dNk6rq9ak6OTPCCi2bmCgJr70SJ0DXw/C9NuiI2jKf3CMQEu8+y
	leFcys8cgWoP/lWb4bGXUR3A5y2tqp/BP2kdk=
X-Received: by 2002:a05:622a:5d3:b0:50e:d330:f62d with SMTP id d75a77b69052e-516d43fb5d4mr13701501cf.56.1779395092146;
        Thu, 21 May 2026 13:24:52 -0700 (PDT)
X-Received: by 2002:a05:622a:5d3:b0:50e:d330:f62d with SMTP id d75a77b69052e-516d43fb5d4mr13701151cf.56.1779395091633;
        Thu, 21 May 2026 13:24:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395d9665f78sm209971fa.27.2026.05.21.13.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 13:24:49 -0700 (PDT)
Date: Thu, 21 May 2026 23:24:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/5] dt-bindings: display: Add Synaptics R63455 panel
 support
Message-ID: <2w6cpuzwxht2dv7a3xj57ukuzqa2b77ba2syl2ewdmq5bprczb@g3rm2k7e4l4h>
References: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
 <20260521-sm8650-7-1-bonded-dsi-v4-4-a4dd5e0850f1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-4-a4dd5e0850f1@linaro.org>
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a0f6a15 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=5IMEwuT189ni8Q75ZTYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RBSKtkDo0MJkefTcuWJUNEr4wJp0nflv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDIwNSBTYWx0ZWRfX+90Mrdqlsnk+
 cMPNnayHTRT0e2k5hJFzIlY46M2lxOF+T3v7bD7uROOywARHWRY6alL7FbVUkmgKM8hOUgPDhwo
 TNLmuIfUm3z5KKG59VePcjm9/ltAYey7HsDbOZZwo6s+M5ugeTwgHMIMBdRX2JQ0eimw3eZ3Hyz
 gQD54B4l4td/H4GP7g0ELQqEcEFoKWCGXS7qt2gKf8ZGYcVGrtZYL/EGi4MMIa9hcUSxhXaaLTS
 EO934nQXyEOHwgzdOI3EW11hOW3xsy1fq537M5o4nucpB1jx4WUVFJ7GsNoZxwu+BaC2/bFovCB
 mbfENfUTCBDDMGJNrA4y6OIyGPxFsXofTJ50X72xMnrdlur/vehcKacV1VjmAj+D8aNvpx4oZsH
 kw+NDdawrVxXJU/FeODwbfXbNoEOAMS/roKaRUJygP3+6uNUMqpkmLlSAErwVw/IhG+sRmrfbTa
 TyjWOmdh8x9R6Bi4PbA==
X-Proofpoint-ORIG-GUID: RBSKtkDo0MJkefTcuWJUNEr4wJp0nflv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210205
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109148-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.1:email,qualcomm.com:dkim,devicetree.org:url,0.0.0.0:email,linaro.org:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A8B05ABBD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 10:46:06PM +0800, Jun Nie wrote:
> Add support for the dual-panel system found in the virtual reality device.
> This system consists of two physical 2160x2160 panels, each connected via
> a MIPI DSI interface. The backlight is managed through DSI link.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../bindings/display/panel/synaptics,r63455.yaml   | 125 +++++++++++++++++++++
>  1 file changed, 125 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml
> new file mode 100644
> index 0000000000000..a94b355ed9557
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/synaptics,r63455.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synaptics R63455 based dual 2160x2160 MIPI-DSI Panel
> +
> +maintainers:
> +  - Jun Nie <jun.nie@linaro.org>
> +
> +description:
> +  Synaptics R63455 is a Virtual Reality Display Driver and VR Bridge, used in
> +  pair in Headset devices. The Virtual Reality Display complex is composed of
> +  two strictly identical display panels, each driven by its own DSI interface
> +  but forms a single virtual display for the human eye perception and thus
> +  requires a strict synchronization of the two display panel content update.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - sharp,ls026b3sa06
> +        - boe,vs026c4m-n52-6000
> +      - const: synaptics,r63455
> +
> +  reset-gpios:
> +    maxItems: 2
> +    description: 2 reset pins for 2 physical panels
> +
> +  left-pos-supply:
> +    description: Positive 5.7V supply for left panel

So, is the R63455 driving both panels or are there two panels, each
having R63455 controller? What if somebody gets a single Sharp panel and
wants to use it in their device? How will it match these bindings?

> +
> +  right-pos-supply:
> +    description: Positive 5.7V supply for right panel
> +
> +  left-neg-supply:
> +    description: Negative 5.7V supply for left panel
> +
> +  right-neg-supply:
> +    description: Negative 5.7V supply for right panel
> +
> +  left-backlight-supply:
> +    description: Backlight 21V supply for left panel
> +
> +  right-backlight-supply:
> +    description: Backlight 21V supply for right panel
> +
> +  vdda-supply:
> +    description: core 1.8V supply for panels
> +
> +  ports: $ref: /schemas/graph.yaml#/properties/ports
> +
> +required:
> +  - compatible
> +  - reset-gpios
> +  - left-pos-supply
> +  - left-neg-supply
> +  - right-pos-supply
> +  - right-neg-supply
> +  - left-backlight-supply
> +  - right-backlight-supply
> +  - vdda-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    &mdss_dsi0 {

Please drop the MDSS specifics, there should be one (or two) DSI busses,
driving your panels. The rests are details which are not necessary for
the example.

> +        vdda-supply = <&vreg_l3i_1p2>;
> +        status = "okay";
> +
> +        qcom,dual-dsi-mode;
> +        qcom,master-dsi;
> +
> +        panel: panel@0 {
> +            compatible = "sharp,ls026b3sa06", "synaptics,r63455";
> +            reg = <0>;
> +
> +            reset-gpios = <&pm8550_gpios 3 GPIO_ACTIVE_HIGH>,
> +                          <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
> +
> +            left-pos-supply = <&vpos_left>;
> +            left-neg-supply = <&vneg_left>;
> +            right-pos-supply = <&vpos_right>;
> +            right-neg-supply = <&vneg_right>;
> +            left-backlight-supply = <&backlight_left>;
> +            right-backlight-supply = <&backlight_right>;
> +
> +            vdda-supply = <&vreg_l12b_1p8>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    panel0_in: endpoint {
> +                        remote-endpoint = <&mdss_dsi0_out>;

What is mdss_dsi0_out?

> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    panel1_in: endpoint {
> +                        remote-endpoint = <&mdss_dsi1_out>;
> +                    };
> +                };
> +            };
> +    };
> +
> +    &mdss_dsi0_out {
> +            remote-endpoint = <&panel0_in>;
> +            data-lanes = <0 1 2>;
> +    };
> +
> +    &mdss_dsi1_out {
> +            remote-endpoint = <&panel1_in>;
> +            data-lanes = <0 1 2>;
> +    };
> +...
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

