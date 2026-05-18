Return-Path: <linux-arm-msm+bounces-108235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCwgHnE9C2oJFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:25:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDDC570D9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85B95303351A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF0B3F54D8;
	Mon, 18 May 2026 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l37PBrSh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWN4+Q6v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0314230F7FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121413; cv=none; b=FeWIogxGVnCAsvEYtdhKfUeWNOEANJf5vk06XIYCtrkRpEaOuaplrDcwo4Vqa3SpnLEpWVS/8J5L9CW6RHcSUYpRXoR23W69WERqwHe1NGsznusnpMpheRABj43W+ERJwR+Pq5XULnnsSgeQl44zPm0Mv/zK2WtPVgM6qbWzLak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121413; c=relaxed/simple;
	bh=tO3z090rRbcX5pmiGRfyA9Zzc5BIvANllEa32FwAi7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joIhfhYU7L96bc6mligD3b2Zcs+P5p6QpCozlW9dqHwXNdmtX0fqvPpq2yTXa+dcjOOQBI/nxBG4hyB/0T/Yn0FA9wR1JMbfOsk/TBtfavffFWmhOSbOeXyB07Fu7RDGhZSYzaGpx+CmFYB8G6oAqVu1E/OV72YMx92Og13b3hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l37PBrSh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWN4+Q6v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IBHRqL2482392
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gyj20zFPQU0YdpUQ3SEBwQ7T
	+Hy4BwpnqNdcqHAgNN4=; b=l37PBrShjS/DftgrLAos7X9eXE0g7oM0XSWc+ijq
	ShHRDXQmEQbtv+4yvYBK0Nff+8PvYOtf8bBzEht1ptdcrfJ92hkUsJ7EN3sbg3IW
	0eZK/oUjUWpbPUgTa0PSEnxVcH+d7F1OTh6oGqi/2JXh8sSF9dqWUtBrak8O8dq+
	J0Wjma729XVBOzE07bVZ3Gyv8U0lSoRtVll6h1gg59fpGl7EIIlEV+2DFQSpMBLW
	JTRhrj8aJm5r2WEk+VQJS+MPqe1tJHdaACzj4+e8wyIeY3TBLyyYR4aVLmrE1LWa
	IDCUhfwqvmqIOxkwucEr8i9M+4PSxJV/lekhFvKRNLVf+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81rvh5hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:23:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5162ee45a77so67607431cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779121409; x=1779726209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gyj20zFPQU0YdpUQ3SEBwQ7T+Hy4BwpnqNdcqHAgNN4=;
        b=QWN4+Q6vunDN5mpUjQ5+M7TfR/jpaBSyPso8Gc/+9tnd9tZdxmLzuq+vrNYpTrZwFt
         t0SGuh2F5nMCm0/rqEWTLb7G6YkvCLm5/r87VN2iAaC0hFDs/6pdLsX4OQ9FdcCYySJu
         InvSj5/ykbD2WymDsbmlLDqK+X30VOc1WaYmoiz1Cu7ZuGz7ZZ2fWdAiuFxaGMvAo+x5
         lsBMt+eE1+3iRPriDIapzRQZkOHs3M/3BSjQ763AJgm0oAuxZAY1TqVcvEmD12QU9GoG
         p264puHrDNEZ4009WEN7cHDozn44xF/uT/0yzBovquJ6FD6Q/0RmN6mbvIL/NcmmX1+r
         TsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779121409; x=1779726209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyj20zFPQU0YdpUQ3SEBwQ7T+Hy4BwpnqNdcqHAgNN4=;
        b=HBaCucE50OMfCo0kMw/RPEco3LTv2HpQL5khzxQHwhdUqbgCHEnLtslUnhnP3qqWgY
         kgCCtPqRCStzcRWsM5AhwSMLO7RmgPFDjTZaCF/tGH9r8hJM9shtYaJs2lg2bDm3RpsM
         U1iqGa1OZMLMoQp2sPHshhHkV1PenVD5rO16F5OyANzwCl7HKI9Q8QaCwo6p3UuAiT1j
         mj7g6WOrQ1bNkGpBF7Xe3SEUClSn7uSpeqEgqKYShKWik54dWW7GpyLsGJOpwoeqFGku
         +KIRSLt4EWd37WbLHspvn8DWn5PwxHSNJvRwFPIvQnu/jiciuWeIkhF3iEoQhDWHjpNZ
         6Uyw==
X-Forwarded-Encrypted: i=1; AFNElJ+dfCV3+cFdHYGWtYXvhYfAN10cdRuoztm9tEWMua1E9R8Umsp6N3vrtGgEJV/hy7mTaFXY0YZTHVoKcJN/@vger.kernel.org
X-Gm-Message-State: AOJu0YzdEMQIya9AOhrQgTCOdLyYYWTVfmwuA3qk9JYMNCjQOR7orJN+
	cFzxDG65oas1rA56QWHbsoj9/6GYVVPoJawYbTHUmpQbK3+zUheWpVisTDo4NQoTScAIsqlo3zH
	s7TtAjvILpsn4puKwNjPMK2xHiNS1O9zfYi98fR84Vw699qOBhRI/lvVSH6f5DMNpinB0
X-Gm-Gg: Acq92OEJXvNOzuoeHv60VcSXhZB9g0quTbj3V6BU69I3KxbK9L80a1XWk9LoJNmwtBl
	FLEXwtUI4kSb6Gp1B6/iW7s1LsJmQjV+2V9SqDeluN3sajGXfYnR309hxtnNexkQ0th+x73ELxU
	EWcSavQL3hbY7AQfbI0yEvFCxojtrQFWPmiqLC78M4yBrn3BglyJ6Ijtj3yJM2kUDy6eLJ7II9G
	yRuVwJuNvjdHBk+UULauS5DvZf5XWlXrCRe62qdCvsHz8u/AZme4KoxxlzWyMh1S6skE6OovU8p
	dRbPBQuIc/ykk0Na/dP07wVFUf5Q4PtUImIrZFtuiRXH8AOS0lKN1JWspJKwMLCzgbAMejRopMd
	hDKOZAD8oLqvG+0O5ZSS8TMhjq7BnPgJvGf82BLCgYZpbLtqROLAb3mOcBGPFGgkqmh7xczvXQ+
	93l5j6COQnrU8uMWynd0sEjvAeZCZumZt0J2OOqRWADAbzLQ==
X-Received: by 2002:a05:622a:2614:b0:50f:bb54:d3d2 with SMTP id d75a77b69052e-5165a22f4admr198883871cf.51.1779121409063;
        Mon, 18 May 2026 09:23:29 -0700 (PDT)
X-Received: by 2002:a05:622a:2614:b0:50f:bb54:d3d2 with SMTP id d75a77b69052e-5165a22f4admr198883411cf.51.1779121408560;
        Mon, 18 May 2026 09:23:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc12asm3425637e87.42.2026.05.18.09.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:23:27 -0700 (PDT)
Date: Mon, 18 May 2026 19:23:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
Message-ID: <ss3deh6wb4bjasig2r56bhl6opygpkid2ixztzdsegqgayuvdk@vgy4ytjzyife>
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2MCBTYWx0ZWRfX0nzzlsCU5ior
 FspIJlMPaE2Xm2aXV0IRgOMmPfIEH1hzd7WjEpsh2qgzMobO8+QFuADQhqZZ9N382D04OB84bMS
 xwdLkC1o9F+soNuuRxMoB6ONUYVCl19Y+nEnTDt2Y4zwbPYG5TuzqVpTju83UYxP3uNgVk6GBiT
 BMUjwVYOB6QdBSn1ygUpjX6jmNUlscuQauXTibPbbE+kC1cgdVXb3DupG3OB7DESxzM1hL37Bat
 wL5FlH3v5LccVbAUbdhpd2ezLOpIr8kUdkGX6v/we977KxybOXUudDi9e01kdvS18JjBtWg1pbg
 RrAgFVm5zezF6EHjjxqtO4mRK6yuMkxMrtVaZflyobEvd/QvaRxIji11OK5v4WGbU3++x6iJLYp
 k2oBUNAc28TbhtKiODdxrJgShJcOFC5XTR62HSMc/ZkaONl2LccXVpH2WT76WsVOWWZ+nOptXXN
 Vnjyxt+Gt1aVhjNAszg==
X-Proofpoint-GUID: 4bVS8GsecNC4bLoBTijbhMwhyFRUlu2t
X-Proofpoint-ORIG-GUID: 4bVS8GsecNC4bLoBTijbhMwhyFRUlu2t
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a0b3d01 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=tXmTSpkHiUSfUerXbTcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180160
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108235-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CDDC570D9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
> ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
> The DLC DLC0697 1080x1920 LCD panel is based on this controller.
> 
> The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
> supply (vddi), positive LCD bias supply (avdd) and negative LCD bias
> supply (avee). The panel operates in video burst mode with four data
> lanes using RGB888 pixel format.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---
>  .../bindings/display/panel/ilitek,ili7807s.yaml    | 80 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 87 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> new file mode 100644
> index 000000000000..93c511d03c00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/ilitek,ili7807s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek ILI7807S-based DSI panels
> +
> +maintainers:
> +  - Arpit Saini <arpit.saini@oss.qualcomm.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - dlc,dlc0697
> +      - const: ilitek,ili7807s
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  reset-gpios: true
> +
> +  backlight-en-gpios:
> +    description: Backlight enable GPIO (active high)

Is this actual GPIO or the GPIO-controlled supply?

> +
> +  vddi-supply:
> +    description: I/O voltage supply (1.8V)
> +
> +  avdd-supply:
> +    description: Positive LCD bias supply (AVDD), typically +5.5V
> +      (range 4.5V to 6.3V)
> +
> +  avee-supply:
> +    description: Negative LCD bias supply (AVEE), typically -5.5V
> +      (range -6.3V to -4.5V)
> +

-- 
With best wishes
Dmitry

