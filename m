Return-Path: <linux-arm-msm+bounces-99025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KmLDkrLvmkWcgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 17:46:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D61572E662C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 17:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92A9B301052D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 16:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD3C318B83;
	Sat, 21 Mar 2026 16:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePyL/e//";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuGBXt4s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8097B2D9ECB
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 16:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774111556; cv=none; b=Vc0+b0D4BLd3O9csGDqR0FTG0Cjv8PW+uFD5biAXqVpYgw958BAXcPF6PxefIieF+wDvwkkn14w4FIHqrT4qHGfkX0Z1HqPWgB64QPIBYk/gfY73bMvblTJ06FZC4CRpFGRpkBJ1SSrRAjfUp2MUtsG9IK56+3EySCa6spSZJaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774111556; c=relaxed/simple;
	bh=uyk4VQ92eC8jVlcr4DpTxR35wJcMa8O+NexB9SlTofc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQMq43Bq7kncmspLX3Dtd1QX2spZJTQPMGXjofjoUsAkuVkYvf1x8g7pA4tDa3OTIugg332M80zdnax39l3FzNgXIQpSdAJ/LtdpQeltnNGvaXs7fkynhR8RZlr4Sdgh3fs8t9i5Kid3J0MRhit58gIpmEs+QDISRwW2iBCSUBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePyL/e//; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuGBXt4s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L4mjf23548594
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 16:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2/N1XFHZigaYi8JcvlnG5wwE
	4V6fkSbgFB8/uIe4z38=; b=ePyL/e//PQz/eiSykNU/683qA09roC+Cafcdp6iD
	KQWOU6EJ1OiYuspTlu9rLOkc4HkvEVVMdoSNb2TUwCRVuDQw2XhlZM0EMtREqSu+
	h73dM3WHOkajbwtUpXGPyzvQVpacwNxDxep0A8WIgbN5hlcHRltXBEDV+bIkfbU5
	J+2k77IO25C0Firn+ZomMWtiLWgKIqOIf/zAVeCTC6LoHG8D5FlK2MX8ixmCMCX4
	c0/xgY5/L5Hk0urp/QvQ+TDVtW2r/4XC3K0FoHU9NavWqqVRHqdXPpUOkgja3YjI
	wSzRnhy+LuO2dzdD8UYkvL0HMO4Z0BLNxD6Ff9vrOm39Wg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1gpk17sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 16:45:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509070bda13so220605141cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 09:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774111553; x=1774716353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2/N1XFHZigaYi8JcvlnG5wwE4V6fkSbgFB8/uIe4z38=;
        b=XuGBXt4sfqVKrr9D3TzwKuYPT1XMdLKoNiHuFhJFOt/n3K1UKE4xDPIrx+JZfNQ5Sz
         uPnIZlX32mowRnlNBHEaWajo42qMR2KNrZu34e624frBniPnfPT1XmccRx5yPCc2nWAf
         nd6gmr8/iDMQLE9KbY2N7PV3YLtAgiye24DpS2EApWv5/UjF828tPMJKgJw+X2LFIfrW
         AdK/rtt24musdhozFvXeLRYxbKcZNW6fiv69CDXhFllbARSdENuGHk9cYjxn8STi+wFd
         9I5G7wW7w60ZBGIt8CA083Vs+3627L1FR3PU3JQ1XpqxTrnnKAOlTBbqf4RMs7glK5q2
         IWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774111553; x=1774716353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/N1XFHZigaYi8JcvlnG5wwE4V6fkSbgFB8/uIe4z38=;
        b=kh4giaPcYdCwZdgJ13Yo2VW+bCjRWsGKud7s8rP/esie36x9umYeuIBDXrwzfGq4Bf
         MQDQoQ4vuYlzCZQ+4wvkmMZZDXODlJfd3m5/FruVGRqMyTauuPXmnc5DlshE4v+3FdSF
         uptwgZVIRRxhSCcHeaZpmYRr+ZOppMeDwEO3IlQ0URUZVwLHFgIAvU770psNLXftkOjX
         okvBdqNFM/N9RfkFE0at7eyD8rxf7d0Ot9kQVXwwuqgAejhfOlPmlIc6Vka0t4DZy47C
         wTjGpD2Q+N0iYOB08SIAOgKPFiVLqr39mpXMlfZfOyrNIxHOHvn7p1j4xyJ3yq5Gfoep
         l38A==
X-Forwarded-Encrypted: i=1; AJvYcCVS3Yqey7H20QlDi1tzQEW2AfzRRpBjfuXuyP7p0+caD3HY04WY4BRH+bNoaIzTz/S0TP7wWXN9yhQTFhtZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyDtJsJiaXGrGWwYf+eKPfuwW/FaV7M6MjRvhj5+DXiEHEGxY1P
	17YUGqbt1QO2Ac2TB9z8x0UZC5KOGx+HRAn1QJOlQhR/BHGnDOPe7VhuJZI7dIf9i1a9kRGCbN+
	1hd1sl8KV2gO+7glAMm57HJiuAJ66bIGeRaiYcNrx0Q3w/wHw0Ia8B2yIGjJ9IFZjsa3k
X-Gm-Gg: ATEYQzxvPHCIH5lf6weZPRERthiHTXVujQ2AfAWOIvu3YZ6DC0vBiRf+6Erd7+1Ubi6
	lEkk7id/cNTKt99byscZBbTuUZi+qXPfqFA7txwpum0jhrMo0L69IOr+bJl2FK+1f/NjIB6Jpe1
	wC0SIMu/jNa9lxlfwK9kZeF4zWTEvU/brUgaVpio70yTDFCAvZEdFVwDKOcHHi+nF7S/EXah4m1
	NskIiuNnvLR2joL15lyAgHnBpQFbdJ5acLItYP3afDvWgALmfH9z8FLlQUV4QsaEwOaoBzK3XBS
	q8kLPpkhLQSVQ7AEW/KJpHh3+lqA9dWA0y1LZAAbU5EWWvHIgXhXOeEN5Mn5tl+YN5kAsjl00Tw
	p7/jfnAdjeJFQnZZD9ZB4AKA5Sq7PVK67XSKTa3btalXXgb2fH48W4bX8zklAHEfeCcUTtZaiwR
	652pifj1kjSj7xw3g6DAZTgGFzIBVEeBoymSs=
X-Received: by 2002:a05:622a:a6d1:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50b4a3c9321mr25856471cf.24.1774111553234;
        Sat, 21 Mar 2026 09:45:53 -0700 (PDT)
X-Received: by 2002:a05:622a:a6d1:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50b4a3c9321mr25856101cf.24.1774111552728;
        Sat, 21 Mar 2026 09:45:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28519f2afsm1227669e87.18.2026.03.21.09.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 09:45:51 -0700 (PDT)
Date: Sat, 21 Mar 2026 18:45:49 +0200
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
Subject: Re: [PATCH v3 1/6] dt-bindings: display: panel: Add Novatek NT35532
 LCD DSI
Message-ID: <sdcfwycey5ykhn2fghun7imx3tjtnwat3ny3mut5dwstl7wvw6@maqrzlycwdn5>
References: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com>
 <20260321-rimob-new-features-v3-1-d4b8ee867de7@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321-rimob-new-features-v3-1-d4b8ee867de7@protonmail.com>
X-Proofpoint-ORIG-GUID: AOSKFCTbIyE6NTgk-dHC0_6H_q1gko2t
X-Proofpoint-GUID: AOSKFCTbIyE6NTgk-dHC0_6H_q1gko2t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDE0MiBTYWx0ZWRfX6P2xvDZ6I0E8
 XlEg3nKlNJ0bx6H8gd8skHqiMX6VxXfOfe8tC5pmQkAu/2wIbj/6nt0kRSOLsNWZvc/leDBBb2N
 qr4tIaIyW6+GhjET6+XTi9mFJVEHU71A84k5FTNZk0wxkLFGPu+7Dyyoev4AZbnlgk+icds8Jkn
 8N2RBJRsqL7qwxTb2yrJvygKZN8vB1rzk6/tT6xeqQ6cMaHPHwiDqmCru7nSZhiYI6KsqGdprfR
 icmoTCPo03W7ugelus0Vu2oYRpB2YvnfXdp4K3lN8CsOf3S6z3POvKQThUrIRDvpDVMq+BlcPOI
 VHRAuOgMAE3dTIMNpyiNf/mbzg9IW6zzormiAkxPveu1OTEuuLztoi3hVVDxkL2BMt3ipWj3Gjs
 DJ+u3QrKAAL1MpinRuqcEwc1wABp6oLw/IGp9LNMX+OpjUSkBTpyFxH4FcUF4/+Or+tLp7UEe0f
 3An3e8EpH7kH5V3UY7g==
X-Authority-Analysis: v=2.4 cv=QKhlhwLL c=1 sm=1 tr=0 ts=69becb42 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=sfOm8-O8AAAA:8 a=VwQbUJbxAAAA:8 a=dSvQR-6XSxectfY1rdkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210142
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99025-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url,protonmail.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D61572E662C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 05:23:20PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Document Novatek NT35532-based DSI display panel.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  .../bindings/display/panel/novatek,nt35532.yaml    | 77 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 82 insertions(+)

> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: novatek,nt35532

This is not enough to identify the panel. This name identifies the
controller inside the panel, however the exact settings (and the
behaviour) would depend on the exact TFT "glass" used with this
controller. Downstream usually doesn't care that much and frequently
just uses the controller name or the the controller with some kind of
"description" like ("wqhd-dsc-cmd").

What does it mean for the upstream:
- Try identifying the actual panel used for the phones. Sometimes
  googling for spare or replacement parts would reveal such a name.
  Sometimes it can be seen as a marking on the cable or on the backside
  of the panel (again, googling).

- If not found, come up with some artificial identifier that would
  identify the controller+glass combo (e.g. "tianma,fhd-video" or
  "lenovo,j606f-boe-nt36523w" (where lenovo,j6006f is a device name and
  boe is a "supplier").

- Either use both strings for compat property:
  compatible = "tianma,fhd-video", "novatek,nt36672a"
  or just the first one.

> +
> +  reg:
> +    maxItems: 1
> +
> +  backlight: true
> +  reset-gpios: true
> +
> +  avdd-supply:
> +    description: positive boost supply regulator
> +
> +  avee-supply:
> +    description: negative boost supply regulator
> +
> +  vci-supply:
> +    description: regulator that supplies the analog voltage
> +
> +  vddam-supply:
> +    description: power supply for MIPI interface
> +
> +  vddi-supply:
> +    description: regulator that supplies the I/O voltage
> +
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - vddi-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "novatek,nt35532";
> +            reg = <0>;
> +
> +            backlight = <&pmi8950_wled>;
> +            reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> +            avdd-supply = <&lab>;
> +            avee-supply = <&ibb>;
> +            vci-supply = <&pm8953_l17>;
> +            vddi-supply = <&pm8953_l6>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a626dee5c106..8ed2866bbd6e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8171,6 +8171,11 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
>  F:	drivers/gpu/drm/panel/panel-novatek-nt35510.c
>  
> +DRM DRIVER FOR NOVATEK NT35532 PANELS
> +M:	Cristian Cozzolino <cristian_ci@protonmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml
> +
>  DRM DRIVER FOR NOVATEK NT35560 PANELS
>  M:	Linus Walleij <linusw@kernel.org>
>  S:	Maintained
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry

