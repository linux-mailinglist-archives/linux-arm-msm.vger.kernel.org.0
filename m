Return-Path: <linux-arm-msm+bounces-116434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F7xTIGJOSGoJowAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:05:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3342706316
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:05:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cUlmcldW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="G/w157fn";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116434-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116434-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13A31302674E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D626175A5;
	Sat,  4 Jul 2026 00:05:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EFFC8CE
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:05:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123549; cv=none; b=sJ6fEcfK4by7d0qiujA4DBHtQu+AdbUIbEs9n/BKjYzsVxRX3gJ6WKrLeklZQDnm9hzZBlI0AhsCU3KkWEZ03x91T3Hbkbr2GAVemQmEmTm9cT/icp/XzcXFANpj/BGisbTe5QL/sQl5Sfgn3SbTHAoU5AVsTbRFhYt3o9deyog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123549; c=relaxed/simple;
	bh=HN5m/Ky6KNrB4KekaPSsiduEjRfi7N8uh7rqA+cNKXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bL4mScCKfnWDvYkAmdKXXgFYvTLsEjEOcm6VHrg563pQabF8kUrhPjVlPxyDyKIfAXLs7EFQaY2+nRgG9kSL2Ln6RzTk5aP0ilpFic86ZF3mayqY7lDAwdOqiwJs5LsaafLZmsh7Q+BXDfRGb7zxnrHptK2WH9UbQCuKvqupyKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUlmcldW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/w157fn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPQQt1039827
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kHuhyQoLRKepVYyh4wYVN/ur
	TsPJeX0lcSSiDWnFmtk=; b=cUlmcldWNjC6I14+UZW7DjVLenDeTVTZxGNA+J7a
	2UJyL6OsjBNtIWKAPKqw1HJMbuCeoWps9IzlqzX2kp7/PJgvR4q8OyrVCZHBrWYO
	rTNvItIVVhWsabVqe8gfJ7qErz+H6fTLgjbCFLMiLgiFroJ8urWVp+NnwFjWHfir
	IlZnXs1Fd+Ihkv83yvQo/y2xZwU0ql28/kP4n5y2MiPzFx4iZHZWwXN5LewnZpTw
	03A0bzqUGCRE9Hhpdq69V2+7z4VdAwhp47d05GGetBdCPHE4L9Z9QIPo8rWByZ0I
	Xbg6IyP0QCc4I06SmUngtv7vLlE/dT9gKLZut4a2DxWsjQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a84app1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:05:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92d1cae5939so107781685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783123546; x=1783728346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHuhyQoLRKepVYyh4wYVN/urTsPJeX0lcSSiDWnFmtk=;
        b=G/w157fnjuqpwr2zBE4ckAq/x1lMaQD5MIsF/F7293zzuCcLskRcuE4L6n2IyWEhHY
         D/cT9BcKDVgaV6G2INOYG+2QcbwXfYLUtMILRfZ1pheE8UgYpUaBUzaanFlwv2C/Xk10
         3t9je6wYo7uGzZWhX0GRqeXOXP/o8A2jru7tKJTNKUcU1HAc2790KAR6fmfCOAUnazHa
         0hGnojeOQ6BkkU+fyZaq2zHqleP8Mteiq6a1AUdW/OnjDrRgRLFPi5oMMoI9VeJxH2Vh
         qikd+DST81SmsheuJ2mb6i+Gub3wOT6yZAjuT37VlSSiLoqjLuoAFjwoGVV0ndYxHj4r
         m2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123546; x=1783728346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHuhyQoLRKepVYyh4wYVN/urTsPJeX0lcSSiDWnFmtk=;
        b=EUhNqwElPsHDr9CydbJDy7PYL796cC7oF8j29vZ5FiPVMaSYBeFmDOVV9uYgvniaWl
         YdWxYGGSc/o2Xz/aRKAT2GBJ/aSFxUxe4aJm56/IVHwE5N+wedw8Gx9Ap8I/H1ViW9CT
         zFsleaCxylutj0SvVPVmZYCkYx77Q+71jCnlJzqyvCPg41K2hQS4/vJPIHXb/cSx23sj
         sQFKKMEmD49zWlS031hlOTMLwS1aJ8Sr+3wtoiUCBSDSeI0YN7tiU8DeBEnDJMS8YopI
         U41iNGQiPlQ0buY6n/U4z0NGIMyctnzZAO/vZ8/zOBaeut8eVltAaF56QAUdY+X3qkqx
         sHww==
X-Forwarded-Encrypted: i=1; AFNElJ8P1lX3Isji4wFezFWrwkDXE3mcDwc67IRDcUgehvrNq+ZoUTN4bB3K4F5CvJK4lyDr6W88UvGFIT95pDwq@vger.kernel.org
X-Gm-Message-State: AOJu0YxFUelfBD00Y4JIKR369u5obY8fRL8nnJ34ZqVK9SMeBlv8n3vw
	JTkk/utafoeLL6pcb2bYm3emW0xp04X8F0qiQwH9clo68qrwBBLR1RAMZhmj2lBMbphx5wfrY+d
	y2ilk6C4ApI+B/DsZ2K87YJWBcaIw6W499SIloA5jN2zoC3RzoizSVhpnZO4DfoLVdZ2X
X-Gm-Gg: AfdE7cnB9pv8dFAnSiFZOhEt8iVqDRZA6nnQQegxbRC2KGHntwgI77XD6f3J+XrcjWp
	zo5jKqDcszA4sSBZyrxq1R7FWWrGCAkagnBKTR9s5+z5dN5ACITlK2gTvznm2l+GqEeEgbRSGtZ
	y3+bBICscGaTjsL3g62ex8zjy1uJKJToLskjCvg3zvmBzk50Zlixmrt0oXp/HR7sH/c+RDWzrFf
	gQ0p5yMwRNircxx/XVdwVig2gHEmdqMB1xuFMBknWWcFI+Ov3228+ilDFqHxpMYQv8oXEpHLyc5
	8xNRr5Ns0bJfZ8W5YEgR917lgj7FKotdqy0LURdLJJQYuUI3GSc3POluGeRix31VuVybOMASQ6B
	YdXK7+6lIeHWF4NEDsjzYEn+YSKyWQdNLiNlnoObYfDDDpy3v8sjOLBa1M2PHcZ9/R/vXhK98ku
	cXOvKt2qJz5987M4id9R2KOgCK
X-Received: by 2002:a05:620a:1723:b0:92e:6e55:cc66 with SMTP id af79cd13be357-92e9a4c58b6mr227038385a.47.1783123545566;
        Fri, 03 Jul 2026 17:05:45 -0700 (PDT)
X-Received: by 2002:a05:620a:1723:b0:92e:6e55:cc66 with SMTP id af79cd13be357-92e9a4c58b6mr227035185a.47.1783123545010;
        Fri, 03 Jul 2026 17:05:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377096sm843872e87.25.2026.07.03.17.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:05:42 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:05:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Message-ID: <cwc6a2d4fasizfe54f6yvpgzkczbygjzkcoo4jlnn6tjaw3pei@m3py42bcnooc>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
X-Proofpoint-GUID: 1UpEHJHAjPOMUQdq4YX5zfKdD-Rmecow
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX2vU/OP54TzD5
 s3mp8GEtZ2eLCHn6MPxrjyttvffL5OWYHUodaamIEsJTwp0tZSp3yBiEblExYavkTPYl9+Mk9Fx
 96NnbzJBID8uX72ThqDvwgcDCp7bfnU=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a484e5a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=9O-rVQOD5xMnlwKyy4QA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX1EsXtuT4JROY
 M8Wh4BX/9dD6oESRfbjqUKkLS8d9NJjq7l3CCA2X46KMYtVHACIziv/R5llkNpsq8v0UmKGACta
 FqbFkxfiFwT5PKdS0EYIgVPKqdtzbgK+GOMNPWJk3Zql1gZnftMDJ07lwYPQtN8LvQfiJYiIbkS
 0FoRFoXEOSxBxMeN99fIT+mND1Nsy6b9ypNY/GKezwbrsjbQUzNQwhIslhEXoOwA6Vo8FhG04cH
 x5DZLZ1cIh1g0icYv7TFa2cbOw2Rd/PLfT1hi2f8rGhz8hoHOz2zE8Se403TO2OOt2aSk2mKXp9
 ni0rGxOZuRPgbVDtCWaemhcKCOrl2b4+pkZuJ7gbkljpiyezAMDVr+Qs0pQWUe4jixg3DcBDlAc
 NJpzxotUf4MQzUXVmYHpZKPcq6wj045e4fdk81/IpxaSmlIEB1Be4IHloTnwr9JH9iBGKJCdt7L
 dd1mYam0VJbl6kPuXnw==
X-Proofpoint-ORIG-GUID: 1UpEHJHAjPOMUQdq4YX5zfKdD-Rmecow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030243
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116434-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:elson.serrao@oss.qualcomm.com,m:andersson@kernel.org,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:quic_schowdhu@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3342706316

On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> independent High-Speed UTMI paths, depending on the SoC configuration.
> Each path is distinct, with its own connector/controller connection
> and role-dependent UTMI routing.
> 
> Because the EUD sits between the USB connector and the USB controller,
> it must relay role changes across the UTMI path. In device role, the
> EUD inserts its internal hub into the path to enable debug
> functionality. In host role, the path remains directly connected
> between the PHY and the USB controller, bypassing the EUD hub. These
> hardware constraints require per-path role awareness, as UTMI path
> roles may differ.
> 
> The existing binding models only a single UTMI path and assumes a
> uniform routing model. While sufficient for simple device-role-only
> configurations, this representation does not accurately describe EUD
> hardware when role switching and/or multiple UTMI paths are involved.
> 
> To address this limitation, per-path child nodes are introduced to
> describe individual UTMI paths through the EUD. Each path includes its
> own ports description, allowing controller and connector associations,
> as well as role-aware routing.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  .../bindings/soc/qcom/qcom,eud.yaml           | 55 ++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> index 84218636c0d8..21f75038a81c 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> @@ -45,10 +45,63 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: This port is to be attached to the type C connector.
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^eud-path@[0-1]$":
> +    type: object
> +    description:
> +      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
> +      to associate role-switching behavior with specific port connections, allowing
> +      EUD to manage role transitions independently for each UTMI path.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: Path number
> +
> +      usb-role-switch:
> +        type: boolean
> +        description:
> +          Indicates that EUD should act as a role switch for this path.
> +          In device role, debug mode inserts the EUD hub into the UTMI path. In
> +          host role, the EUD hub is bypassed and UTMI traffic flows directly
> +          between the PHY and the USB controller.
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +        description:
> +          These ports are to be attached to the endpoint of the USB controller node
> +          and USB connector node.
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: This port is to be attached to the USB controller.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: This port is to be attached to the USB connector.
> +
> +    required:
> +      - reg
> +      - ports
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> -  - ports
> +
> +oneOf:
> +  - required:
> +      - ports
> +  - required:
> +      - eud-path@0

Do we really need a separate eud-path node? It doesn't represent any
particular part of the EUD device. Can we simply add more ports to the
ports list?

For example:

ports {
	port@0 { endpoint { remote-endpoint = <&usb0_host>; }; };
	port@1 { endpoint { remote-endpoint = <&connector0; }; };
	port@2 { endpoint { remote-endpoint = <&usb1_host>; }; };
	port@3 { endpoint { remote-endpoint = <&connector1; }; };
};


-- 
With best wishes
Dmitry

