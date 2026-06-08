Return-Path: <linux-arm-msm+bounces-111646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yEc0L6QzJmqHTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:14:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EFA652674
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:14:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TD1OsXAg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KyOmUviq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111646-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111646-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FBA73009565
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 03:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156CD31F988;
	Mon,  8 Jun 2026 03:14:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC1832BF24
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 03:14:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888480; cv=none; b=ZNdzsi9mOTT6nxrHIrwv2/cb5xsE50X1M0Sg8NQkkyzC6Ab+qBlqaEgUh9W2Pdd6f/DECiWHctj1ya3/de31tL1Fd0dsz2IfIRUsu2GtB9mloD4RGMAKn/+ZMjRUvlTJ6CHS3DOhSwvlp0e5mDyMFlGPYMAwwLZ66Vg7PC2WhNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888480; c=relaxed/simple;
	bh=J6GR7Si5iI6uBvrP/qs8cEY8iIjk49htdTwqbM/Ie0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqJDvoaXtcViwwsbcvcMqkwgrj0pcEY3LwwLXuFargQdlQCMhrx2aoE5hbPDwNfCtLf9rQ5BPwuL7LgL4b5ZZcNqLPNVmtcPsD09D2Q7B21NP9uUghDZ6JV5IGqhKjaHaC2HZqjLIOvDr1LJBDXdjemEkmnvTLCbN1tPQspgFHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TD1OsXAg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KyOmUviq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580F56t1512562
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 03:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+AZEdKKpOwHfkzjxlDVyOlIJN1Ra392uAlGrjFZ7pw=; b=TD1OsXAgA4dm5Qjc
	ss91jopf0knnP/yc2cYeGQhCyyYcrWP9fLJMzWqp004iTgKFfRsVvGHWo1h/VXbd
	kPqjH59WOuftdgiY7pku3tB6DJCIsnIaK11J6nNEHiQHZHJeEFhlMuMbyVAx1lJD
	ANe+9G9oZ0L6gVY4Gis2qdDxL1Fz6WlB/HowEDENv5tbtjrazOXmoqax8zApyNEx
	wFGvoi/5tIRd/B8MqAzqL3aHqyq5FDgxD1Nv2N3VMocMInpftody5/7Vd3Tx4IJa
	boNtECO0Km2eVexEViMtc/aa/qyCZI7h6kJWJQa8VMfgadvtEtE41o9T8qF1tdya
	3uslDg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadw9gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:14:37 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963bc9a24f0so3916591241.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780888476; x=1781493276; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j+AZEdKKpOwHfkzjxlDVyOlIJN1Ra392uAlGrjFZ7pw=;
        b=KyOmUviqgvF4KJqVvIi9fF8ybi31HtOwrNNLhYhFG1KEDGrZAN0pUuid0sOaladwFq
         ZHY6/kIIBVHuXLNK+Na/38V9pz85kHgAIm+RJMw2dR2ORjGLVfbRtNmC/ddz5ZZWi8HZ
         +ZjYTa6iyKpx4vSGwHSigNGrr9ocNQhFXuQN8AcIvQfuRpD4K7GGOP+W7GN88A+Qa0nL
         0D82eLMV3d8PS7vD4/IDvL8bNyACKSeLiem0u5NiJBPg3y9qUsJbGo5ztFy8/cRxzG7s
         Mf6InW7dZOl+xqoqFI21xZthVMPhMKuS9eWQYjq82Gb5nM3hWZEM+rR6YomeRhiZJumG
         4T9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888476; x=1781493276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+AZEdKKpOwHfkzjxlDVyOlIJN1Ra392uAlGrjFZ7pw=;
        b=VaW1MIWo3k6Fh28INzydgAPOHnTY9FFQ+t9w75B9NJ+GX2hVvfOf/fMjhfaeQAGzZc
         GvPCxl2LnyiH8kTbIGa6nv5jCd74sNlw7ZG3pK1zQmKvxFTdCvzJ+sC5N0CSnYrjlo9P
         5mWXCgSrnT9PEzQg11YzDvrQVou8GU5sw+9sXelOZUFV63WUI6Ymhl6pAlKy4xz3LMe2
         JSih+NrKYOXWlIdYZQXvK8RXCbrNX4DC2O0pX7QdHA6NypQXApltnsBJgNxtE915oPxQ
         UtI9rL4bMTnz4mG5OqWWeuCunDvNCum6nzqVkZ+aCX7isTVgvxbQVQZ/Px2OKNiZjuPJ
         P1oQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zVp8EDntML4FInv3jCgjoZs+vSBIe7orNzJ6XGq5N7pxZ11mP4xZli4gMp78mk5oVdvTLcmITxW8ZBXxo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0f8UvIxmOZ6SdAAVMa205HwATW3J68VxGT8L2v2XeqlQAA2bJ
	Ad5LAoRmEkRRSE/Yvo9IX7Es8Qwf9uKh4+5x0Ay/ESDiaQRTxVWZ/XHcTQlEeoavjMzUTGt84Xp
	T/n8sV6CWiXETOuwECUtXXi5enmhf1wmCyfAtZ7TA49xqWNS3RWO/l+MdYUwQlBe4r3yRGc7VH8
	G4
X-Gm-Gg: Acq92OHAIuxOcb5NoTiCzSwpJXXVw9X3aw8qnFQo/tUWJNrL/zyET+Sjyp3aO8uTTxX
	T+qg04mgjlSaTBioSes2RoUIgiRy+cS2xrp2nvHHikzhIqOQbufY0h+eybwHTwzJxQNBDdDlMLG
	AX/6gbN7VuW5u8aYNecqL1fB6cUSKRpLAfYc0v13zow5NS7Vz77uZznsVNeW92xZ5LkxrEwkQFd
	mDw4Mfc/q7H9ST39VNbFD5qSwuwAbqczQ4+1xEwkkKcKvrVF6GTiz6qoOVK5BgiwdYZUTKcGAdO
	X7bPmn2fUTtQU7NcHtHFgaz5zgS0NDQWWEbE+9G2neGWrtdZeCCYPiOjFV4cxAfNAl1WLWsVtBD
	FLbERXkBr/z1vWizFWg+MHg7WHDH6VVMZ21W7r6WSDCA1oDQSfC0KV+ls3WRIBx0VachM7Nne6T
	5DnK+mEvCqFTSZOxEVWJGybtQorkihfRyfgkXoeO2R8glDXA==
X-Received: by 2002:a05:6102:5694:b0:62a:1bba:64ee with SMTP id ada2fe7eead31-6feed1adc0amr6648315137.6.1780888476604;
        Sun, 07 Jun 2026 20:14:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5694:b0:62a:1bba:64ee with SMTP id ada2fe7eead31-6feed1adc0amr6648300137.6.1780888476219;
        Sun, 07 Jun 2026 20:14:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b90421dsm3426125e87.30.2026.06.07.20.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:14:34 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:14:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Lukasz Luba <lukasz.luba@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: qcom: add pm8901-temp-alarm
Message-ID: <t25hkdgberbqu6bolvvyhu4jqxbjfyjcwdc2af76z5dorhexvm@azczmhlkjgz4>
References: <cover.1780148149.git.github.com@herrie.org>
 <386f3cef9d50d61f588f99706d9f979c56f8bab8.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <386f3cef9d50d61f588f99706d9f979c56f8bab8.1780148149.git.github.com@herrie.org>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a26339d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=cTwmTnRGAAAA:8 a=O01ZJP_XdAIdQBp6JKkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=sptkURWiP4Gy88Gu7hUp:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: duN4C3BR-EF1_Alu8ldI2_jXR8eQJqSZ
X-Proofpoint-ORIG-GUID: duN4C3BR-EF1_Alu8ldI2_jXR8eQJqSZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyNiBTYWx0ZWRfX+Tk/T2GH+Jzd
 D6qEnfw/+GWmxE0Ub4GQp4u2uHZvz8w3H1o7wATfqGlI9Fnt4pNaD0B1tp056zEYKzGQSiXPxZa
 mxOU7u9w8V09XpRKzGTYcueHALLZdhfTHyYz0aumeX7CT7YCLclsp4RzQavbUDwBIt0j4BMTHDV
 5uSPa0NohdmEoiePzvXVWp+qOdLGpGe3jNF5C6xyBBT2ynf9ii0jc1frTKBbLCLq79AucBY/weO
 RqGAzq6BVm+Dr+kIuQltxotAF+YSXIGKpYMsolSoB0aP31eYcL+sxB8X7pTiAqMZTgGU4ygdGzT
 QevZUT2Cx9uvoKHiutz8j9G62EJsS7x3OQk2LCQJzfFmuboeESHMBoDesZUHAC6WyHCo1vXO7fM
 5hdm+VeeGqCIi9A/Q5npVXAPqiCn3TC6sKlwlCXc92giR8ghcvFCmHbLj+rW96rzB5bHvjqPt+S
 sjQFG5KrODb428rzTeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080026
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-111646-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:amitk@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@kernel.org,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:lukasz.luba@arm.com,m:rafael@kernel.org,m:robh@kernel.org,m:thara.gopinath@gmail.com,m:rui.zhang@intel.com,m:conor@kernel.org,m:krzk@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,arm.com,gmail.com,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,azczmhlkjgz4:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,devicetree.org:url,herrie.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32EFA652674

On Sat, May 30, 2026 at 04:00:39PM +0200, Herman van Hazendonk wrote:
> Add the binding for the temperature-alarm block inside the Qualcomm
> PM8901 PMIC (companion to the PM8058 on MSM8x60). The driver exposes
> the PM8901 die-temperature trip stages (105 / 125 / 145 C) to the
> thermal framework via a thermal-zone, with stage 3 wired as a
> critical trip so the kernel issues orderly_poweroff() when the part
> overheats.
> 
> The binding describes the SSBI sub-node address, the GIC interrupt
> the alarm raises on a stage transition, and the parent PMIC
> reference.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  .../thermal/qcom,pm8901-temp-alarm.yaml       | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml b/Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml
> new file mode 100644
> index 000000000000..569943b4aedc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/qcom,pm8901-temp-alarm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PM8901 PMIC Temperature Alarm
> +
> +maintainers:
> +  - Herman van Hazendonk <github.com@herrie.org>
> +
> +description: |
> +  PM8901 is a secondary PMIC paired with PM8058 on MSM8x60 family
> +  (MSM8260/MSM8660/APQ8060) platforms. It exposes an over-temperature
> +  alarm block at SSBI offset
> +  0x23 (CTRL) / 0x24 (PWM) with four selectable thresholds and three
> +  escalating stages. Unlike PM8058, there is no raw die-temperature
> +  ADC channel — the driver decodes the stage + threshold pair into a
> +  representative millicelsius value.

Don't describe the driver in the bindings.

> +
> +  Two PMIC-internal interrupts are exposed: a stage-transition alarm
> +  (TEMP_ALARM, PM8901 IRQ block 6 bit 4 == 52) and a hi-temp alarm
> +  (TEMP_HI_ALARM, block 6 bit 5 == 53).

I think, register definitions are too verbose for the bindings.

> +
> +  The driver registers a thermal-of sensor; board DTs declare trip
> +  points and a critical-trip action against it.

The same.

> +
> +properties:
> +  compatible:
> +    const: qcom,pm8901-temp-alarm
> +
> +  reg:
> +    description: SSBI offset of the temp-alarm CTRL register.
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Stage-transition alarm interrupt (TEMP_ALARM).
> +      - description: Hi-temperature alarm interrupt (TEMP_HI_ALARM).
> +
> +  interrupt-names:
> +    items:
> +      - const: alarm
> +      - const: hi-alarm
> +
> +  "#thermal-sensor-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - "#thermal-sensor-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    ssbi {
> +      pmic {
> +        compatible = "qcom,pm8901";
> +        #interrupt-cells = <2>;
> +        interrupt-controller;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pm8901_temp: temp-alarm@23 {
> +          compatible = "qcom,pm8901-temp-alarm";
> +          reg = <0x23>;
> +          interrupts = <52 IRQ_TYPE_EDGE_RISING>,
> +                       <53 IRQ_TYPE_EDGE_RISING>;
> +          interrupt-names = "alarm", "hi-alarm";
> +          #thermal-sensor-cells = <0>;
> +        };
> +      };
> +    };
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

