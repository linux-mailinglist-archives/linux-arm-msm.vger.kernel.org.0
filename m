Return-Path: <linux-arm-msm+bounces-108295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O62OWuNC2p1IwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 00:06:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66171574427
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 00:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98BAC303C7F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CB339EF0B;
	Mon, 18 May 2026 22:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cLIN78ED";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fmQ8YwEg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B758257827
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141833; cv=none; b=FUaq8tyayP/EbZD5sRfAlHj+43eIyUWWX63cDEn4qbrxi6xoqXfA6QXZqwOYtLQL5tmaC6OS52/vJ2gWIarMkyMFcjBpLR/ddLEQOuSwoDGes7zKlbTnIU9DcZG3dS+eAtwct8ACWZVcVs1inc4r0c34BFgWBKMgu47QLLKR/wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141833; c=relaxed/simple;
	bh=pRUyYmmgY+SMR9KdaJVku27H+nF27hTsbqOt+3i5IxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpZDn9xUt5Fp8319OMvQRgAaQu8TKegILzsov6rI9AEl+jr+YwsGN++u6yQ+XJciAmJTE1CqD/f5cxHmL+qq6EsrZ9waPCFfPjOHuYvQTVlBdO3RKY7fE1so6tQlVd02TKFtJ9RAb1suY9u9RbwJBH50ADS+4ggMIVroU8gLMXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cLIN78ED; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fmQ8YwEg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IJDFX61890393
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WE/ZmXbZ2mfp389Bj3cAnUFxz1Swq6CCIkSQGONfjZE=; b=cLIN78EDFFiNAjev
	u2f9Q3NT1U18ZtdPQHtVAvR0CUQaEqqJ7I8GG/ok/NDd/z2XYst5Hq95Azi8j4iw
	I6H/Si8LHc9J6BQWd6YIh4aJfCmsUiZW170SEAtI/G1OIqbWPkuM4pGDOXGq8UXa
	puavL74s/a5jSyQwetFqDDrpqUMyJCGYdBjjTUV0Ekds5L0k9npwiWVm9qamOHBD
	d08Vl81jP+Hiw3/aQmM6mMk51V84IjSLaBGrsbUzoDa+cBHXwiMTjfRLL/3NY5zF
	5Qoug7NPigTcG7PDiZih6e01PEP2yEaRYhsZrBmGDJNG1amDGt9RWy0dsDHFDaug
	R9Fhhw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82pw24bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:03:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb6d713ddso2949421cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 15:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779141830; x=1779746630; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WE/ZmXbZ2mfp389Bj3cAnUFxz1Swq6CCIkSQGONfjZE=;
        b=fmQ8YwEgdU1f/METYCbXH/4/zSUMYsPbH6TbnRBwuBGkL8egbsFt5LC4xTDQ3JZrF3
         sCD30wKGuarPqi2X4wOLvT9itsljyOoClNFv/ZPqtRF7ch4KCnQPHtOI86etd7DMTEV4
         3FwjAkvV6cu/O0ZxbAxUdHtFho8NmROMD2g08456uWr1V51pLQetyur2ZCyqhunEIbaj
         ed8ORVsPkR4hG0ALezpJPMuskdMm33XeD9ZHGe8h6E13XJfkRTsBT9cA50fV1nUaoXP7
         V2R9eEu4oT1i5mMH6lDksFSU00ypCO3fwAn8ulYDeXsvVrbh/8RHwKpvwGXiRsuJgdbt
         ePIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141830; x=1779746630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WE/ZmXbZ2mfp389Bj3cAnUFxz1Swq6CCIkSQGONfjZE=;
        b=hgv59bxMTG3/2knw6dUmtj5atO2KlltqQ7VuhGPrLbkGo36M47XiEMd0yoOKgbA7wx
         l+qBKdr6ZrhAf0xafvhrvTONVA8dQkQwEXERI2Px5u0xP5mdM4QDHWgyJLFVIJO8/9fb
         767coypvydikLrCmBtuOLEmMZu8LbSdu+3lOPP1bV9fhvVW1ZKK8KqITW3LQAO3n0nfT
         cm72TvXsYTm4y5/Y/WoGTDY9Y5p+XLtOD5Z3wuLrCx65uUlzZZ0svSkp0WXnsEKgnXSV
         8AABrrJmczZdldH+9/ulXJBE2f+NG25ln8KHUDU6Ox9dPHjqf/EbIueq3DVyATsB4tX/
         Sl+g==
X-Gm-Message-State: AOJu0Yx7Z8IXt6vzs99CeNjwJAMLPQ6ecEWGYDR5Z1F0eLT0g0nwUQoV
	0hg49wZKfXWEh4DXJCWqyHC+wef86JPRwBSGtxcSglUZv5Z2qbzNKYHiKJdjht+RqKt/pj/26+F
	9ueg00f/sS9druDbG0rkDG5HjMg7hnQVtf/ec2/G5+o1XZWV+F8vdBOb3rkOU+KSLC+pQ
X-Gm-Gg: Acq92OGrXGMGQcVCT2Btg9S1ASV7E3oy6fpEssBCbPq2mpH8EkGVUaAAVDwMbW4zx3a
	llRod7RNw+K7ofIn6yqwbjHXNMJFXPKgP7DhSS1i4sSMNuD38he/Tl9HUSvlIW8ApSiZ48cs8A7
	0R+wzbO1b3elFCnVvDJcm2+EY+rj4Io8SwTL4UbTK+shpMOOUV+VfBnJ1Eytxagtm4yYVENhSdF
	zUzyeyDcSlI2k7dzr0IJ6wA2dJ2Tyg0zHuK+Bo8WFFWepogVdhE8h4YgBT6BvSkPJymOBa7worQ
	7VpbuqrvJoy56+0LnB4G/35NhTtv2nqiJVByQs5TSXq9exwHTqLliHPLEgiBUa6tcaLO1IF/tYT
	mQqR7uHoO4+g2zAARsqcsXUnyvNVhHjdsY9/Fb4a7m1DFk4WghMA6bxoGUiO6dqLPahrv0wwAar
	y6SG0oMX4OPqiK2Ru0bskF2YG6znKJZC9hvPo=
X-Received: by 2002:a05:622a:1444:b0:50d:8e6b:96ac with SMTP id d75a77b69052e-5165a31a533mr227093131cf.58.1779141830374;
        Mon, 18 May 2026 15:03:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1444:b0:50d:8e6b:96ac with SMTP id d75a77b69052e-5165a31a533mr227092541cf.58.1779141829745;
        Mon, 18 May 2026 15:03:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a619sm3598182e87.27.2026.05.18.15.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:03:48 -0700 (PDT)
Date: Tue, 19 May 2026 01:03:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: taygoth <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH 2/6] dt-bindings: usb: add Qualcomm PMI8998 Type-C
 controller
Message-ID: <3cdjn22kjsjlhfd7mt34uldmkxdquxexydefkfd5hpm2cfdusi@dqhhsl2ux4sv>
References: <cover.1779127507.git.taygoth@gmail.com>
 <5f4271701066943ead54f82003ab282c4b39f3da.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f4271701066943ead54f82003ab282c4b39f3da.1779127507.git.taygoth@gmail.com>
X-Authority-Analysis: v=2.4 cv=a6AAM0SF c=1 sm=1 tr=0 ts=6a0b8cc7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=pGLkceISAAAA:8 a=fpthWuqRuR8fFdR_s3QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDIxOSBTYWx0ZWRfX+0Gc3LM6oKrL
 5UyPVHgk8HP47NrUOWLzd27XYIR7Qq7qO1DMNGhUhPM75zG8CG8PU1+A7gRMZl0QQKWbL9S6JJ6
 5pAdYvauhuuT0H3tS9PBPYMXoTupP6SE9p5xXXUPD/JGyYf689v57VWrFxXN7fsh/hiv3eZGwFn
 upIoHgupOnluWIQsBTG2Wn4sMTwHvJPM/OR+Y3Ik11pYi1QFuwrKF+O6y32Z7AIFaHjtVDy9j9D
 Ufz/G1UV3ct/aQv5KbkyKvl7kQ8oY7PgF/wTZILK9EivYrFbwkQ5oAvDxndEM3qtKKwWJGjv6BL
 h3M6jax0bHTSYHBPUAY4YC2Av0ltImxToKIvtVUL6zH9/Rl9rJD53rjV8ASLwApjIhgmyOc3jOm
 ibBOI1yekfUEtv4Zh9iuuWtIARoMlsWocAKDd2lJlpM22Y1PSf+4fMFpxY83VkSPlZqaksPAXBj
 u506lkqkO3bN5N5dWNA==
X-Proofpoint-GUID: YUtnsdkpqfjIe3mHWB5oXc6AKL3_mp3F
X-Proofpoint-ORIG-GUID: YUtnsdkpqfjIe3mHWB5oXc6AKL3_mp3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180219
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108295-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,0.0.5.20:email,oss.qualcomm.com:dkim,0.0.0.0:email,devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 66171574427
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 01:22:47AM +0500, taygoth wrote:
> The PMI8998 PMIC integrates a USB Type-C detection block in its SMB2
> charger USBIN region at offset 0x1300. The block performs CC sensing,
> debounce and Rp/Rd resolution in hardware and reports role changes
> through a single consolidated "type-c-change" interrupt.
> 
> This is architecturally distinct from the qcom,pmic-typec binding
> (PM8150B / PMI632 family) which exposes a granular 8-16 IRQ topology
> fanned out per Type-C event for a software TCPM state machine. PMI8998
> has neither the per-event IRQs nor a register layout compatible with
> the TCPM code path, so this binding describes a separate hardware-
> managed role-switch controller.
> 
> Signed-off-by: taygoth <taygoth@gmail.com>
> ---
>  .../bindings/usb/qcom,pmi8998-typec.yaml      | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
> new file mode 100644
> index 000000000000..f2814f5ce3de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/qcom,pmi8998-typec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PMI8998 USB Type-C role-switch controller
> +
> +maintainers:
> +  - Maxim Furman <taygoth@gmail.com>
> +
> +description:
> +  The PMI8998 PMIC integrates a USB Type-C detection block inside its SMB2
> +  charger USBIN region at offset 0x1300. CC sensing, debounce and Rp/Rd
> +  resolution are performed in hardware, and the negotiated role is reported
> +  through a single consolidated "type-c-change" interrupt.
> +
> +  This block is distinct from the TCPM-based qcom,pmic-typec controllers
> +  (PM8150B, PMI632, etc.) — PMI8998 lacks the granular per-event interrupt
> +  topology those parts expose and the driver therefore translates the
> +  hardware-decided role directly into a usb_role_switch_set_role() call
> +  rather than running a software TCPM state machine. Power Delivery is not
> +  supported by this binding.
> +
> +properties:
> +  compatible:
> +    const: qcom,pmi8998-typec
> +
> +  reg:
> +    maxItems: 1
> +    description: Type-C SPMI register base offset (typically 0x1300).
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - const: type-c-change
> +
> +  vdd-vbus-supply:
> +    description:
> +      VBUS source regulator enabled when the controller transitions to
> +      USB host mode so bus-powered downstream peripherals can be powered.

We probably need to fix this for PM8150B too... This should be
connector's vbus-supply instead. I'll send a patch for the existing
devices.

> +
> +  connector:
> +    type: object
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - connector
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pmic {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        typec@1300 {
> +            compatible = "qcom,pmi8998-typec";
> +            reg = <0x1300>;
> +
> +            interrupts = <0x2 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
> +            interrupt-names = "type-c-change";
> +
> +            vdd-vbus-supply = <&pmi8998_vbus>;
> +
> +            connector {
> +                compatible = "usb-c-connector";
> +                label = "USB-C";
> +                power-role = "dual";
> +                data-role = "dual";
> +                try-power-role = "sink";
> +
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@0 {
> +                        reg = <0>;
> +                        pmi8998_hs_in: endpoint {
> +                            remote-endpoint = <&usb_1_dwc3_hs>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

