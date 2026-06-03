Return-Path: <linux-arm-msm+bounces-111068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZYiuC8WwIGoF6wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 00:55:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 256D963BAE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 00:55:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="TM/8JfnZ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ZTfy/D0v";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111068-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111068-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F79E3017E94
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 22:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0206949551D;
	Wed,  3 Jun 2026 22:54:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E283D47D0
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 22:54:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527295; cv=none; b=m0ASRMAHcsaQM/Z8nMfClrNKKxnwTb/LUEODmtQTchGgl9BsX4TGfxfL6rKgZdMuXm8fZTBRWooX6befGKj+yQ2BmVmnCxv10Zn3gUp8irr7AERY3M8pfjfkJv3fxnwxKBwrR1TNf9q633kQQGkblx6ZHVM8aVciigzMEdeT06Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527295; c=relaxed/simple;
	bh=EPMI7DCE37nSjt9Ex/1o+56sJPnrjphSFvIbrzqCcG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qskDxQMX5D8wOEmGbWYQVK1wj5WKjh4U+WgutqVlY6cntlRQE0Hz6IW97B+nd1z214S9HISlnTcnri+4DLSl9V4DxabqJMsWvzj1KIslBWZ+9B3NX6Pt0sUAbP0AQFiQ63+5wlAq71msDotdKHK3VYwvgak1om+9hbRdXZf5NtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TM/8JfnZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTfy/D0v; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653H7Wr92368054
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 22:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g4NoLES+Y6RKixutpEbG860lmzjYy+mynRRPEoFmsdw=; b=TM/8JfnZXDAhmHun
	bK4oYjPMqFq8pyapSZaVOQoFvWwbvec77IPcI/KMvE9FJGeS0LqHzzNfOJf8OqBt
	elH15Dh8UVQkno0E62McFRnuqfW2yMQeUWvJynel/a2qZZkKrUi1IIUVMUg0hPxb
	Owx3piNxyxZNkZJmawIZji1PgwMIZVx7g8eAP2KLoiiN7IRLyD+o+VYE7r1DpFeQ
	uuT2ce2cgWa2UgkTDg+7DOyG1MeCyYqsz2XAAsJf3h2RxbEQqXxo1IAdYW1MnEOu
	NDpZRWhscx2W1wod1lnWmXSt2gZk7SB/79+BrA6rpXZbXlX/Vh1Lk6tKmPHSkhOc
	wJqr+w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gk1jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:54:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6e9280ea589so49956137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 15:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780527292; x=1781132092; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g4NoLES+Y6RKixutpEbG860lmzjYy+mynRRPEoFmsdw=;
        b=ZTfy/D0v7Njj655WGAw4vtXKgcpn2AgKhVynHTgOFCwtyvTBYEgLiFT+WLgwXLR4Ip
         xCXJhnB+1QjudzoGsoKqkJr2nT+7Ux1A1oqbxoruSdGQYll1JnK+KIsSfG5t+nG+sAN0
         xSYXTU00MxTzxHE439xO8TVN4upT5cc+bamkGCHxt39Mb37LxduN0hdopLpiZblLJbmW
         8pHKXSn9/gINvBPjRcXFIui4M9yKeZBD4+DLooIBZPgeZsIYaAqYSyJr+wK0KWXDUcvx
         imHFg1gUTZb1uFhSVJXmA4zqmfQws7negHd2sz6kzKRFpXr9KQQiFKWzROWoId4tD90g
         PcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527292; x=1781132092;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4NoLES+Y6RKixutpEbG860lmzjYy+mynRRPEoFmsdw=;
        b=cWuKfyj3j0idYOXaH9J6kMUUGccdmNn9rh4nzkh/HiscZArHTfR5QOLJhHl/veVPaV
         /yq1tpCePjkwWq2G6RQRyQtxu99HPOdh9x7rlN8Fm0IaD2w0Pta9+EeigZpELmY8676M
         WUxl7Q4QMWcfyt8tXrZ2t15GDjrya4AdBQrZkm6W1uXQrR4RfsRGJMJocllzXvf53Rpi
         qoIQmI1cIQl6bzempBnJ+FU54J3IlcyMpFDij4fxHpHC5J6xhQUcC5LJnE3H325jceG0
         Ch9jQ/5JcaX/ej4iia6v6rRTIxLhXl5KmyEKuOZdvJr+VJBSggfPWMIqgngCEbQuyuKT
         140Q==
X-Forwarded-Encrypted: i=1; AFNElJ9lc/uVfzVZi3PLf5X2cyhwVnPBmL+It4B1bVdxWBDJhTGip5VumG/bUy5dCdLbb9hwQkHPOSNMONKF5RgX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8hPvAgf5EpqBHMdS0ZtORErJGWZrp8tk1+hEKcmXRTKTz71zS
	uxFcngb72vmrNhVnMc6B8Fs7yMQTfJlAbdf4s2oDICHfLy0uTa1WgkfAtOsacHjpugffwIL6zcD
	lvD1YLYfhVjGwXk4JpWAfMYZ4rIiDG2FsjP/PjoOqLSMOjdleWbZxIyXAJOp6ULQRXsxE
X-Gm-Gg: Acq92OGw2eVpPqLJIGZzUodsD6deA39u+xv6FQlIkAlCoUG6GTEFVAn7DC+Jg0qUpBm
	I5dh3Kadid7OmXFsThhDrbAgjlDpd6+U/E8NwcPAJqm21jbBU7OlYKkdfYC1Pc82eyP46QLWFDY
	XZrJs8qvQBnN4tNWk8TeKD0hNjvLcVjce087REEKi7uRy4PMc3HG0v8cteqSXB5ozMLeBDso9aJ
	51+YDIgK+KGSIyKKshUh6JMe7s0tgztbp4O0K29sHj7rf7PjDouYyPJGj8c7LHzuWr5nlAqg/Ud
	ljHaZr4SpAdQiLPKNWmnhFKP5Qvzbdb+numhv1+LRYUK/WFM1P4/FmeFqcdbW+O+TY5kXy6DpvW
	TBSkwqHKol2kB5Gc4KSA9syfGBtXLBcobilDybvEj/e0W/2QVuFavhIb8HY2IOZ3jM7bKFLg1sD
	3k2g91FhbelE3DWkWYj3voyGmeaZYmIn49enHy9yMsJ3LMfw==
X-Received: by 2002:a05:6102:5129:b0:613:e996:3014 with SMTP id ada2fe7eead31-6ec7237dad6mr3448538137.20.1780527292298;
        Wed, 03 Jun 2026 15:54:52 -0700 (PDT)
X-Received: by 2002:a05:6102:5129:b0:613:e996:3014 with SMTP id ada2fe7eead31-6ec7237dad6mr3448525137.20.1780527291750;
        Wed, 03 Jun 2026 15:54:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fba62sm890057e87.19.2026.06.03.15.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:54:50 -0700 (PDT)
Date: Thu, 4 Jun 2026 01:54:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: djakov@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: add MSM8x60 NoC driver
Message-ID: <f36o7gjzvnf3rmys2z6f2pq47ndx2py6mqsjnkhdcfnnn44hvc@wcfrbcvin5w3>
References: <20260603163410.2312712-1-github.com@herrie.org>
 <20260603163410.2312712-3-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603163410.2312712-3-github.com@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyMyBTYWx0ZWRfX0ZWNHFOYFDDG
 ZNT4qqEdc0wY2jH1EQXr0ehi9iweGTaoyWH+jGhfozx0JcNQDBK0OtGdXtQ6ywZNhLUzl0g3NJq
 GT/HCLqMpO92Yvjao3bghQV7XCe/9FJEUhrchphBRdJQQNGh1iXmvTRYBYJrxQDa7Edg+1l1xOH
 Xe2j3ejdziSznG/Ndor1KxKiBnU5gJYs+ihpgy9KJ+2lWGl7ACsfsx6q8sSSRVHzNkEqu3RolCc
 ep0Z0N8yibb2SggyNrQIOtn5a0dZ4vsJnw8c0kangbuFPftGYzUWhxSKTdWCR1wSv6cuAtZtUnn
 FMpFZrV1csvIZ1jc/yYJzXjOQHPoV++PafD7SWp1NWv+FOMBl4IEFIxrAIGw2NNFwlLDCXVLlWF
 YPA4AdzLdVm5sB+0GJyHbF1zYdIsB+C+sOh/sx4QF+0I/VR8S4J8Djg+ubRRg5GuD9OUBqC3+5o
 xCKHDHV8r4wlvZAoINg==
X-Proofpoint-GUID: 8EadhCIHQK67Jpjv6SG9tNvKKqJFWGRF
X-Proofpoint-ORIG-GUID: 8EadhCIHQK67Jpjv6SG9tNvKKqJFWGRF
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a20b0bd cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=cTwmTnRGAAAA:8
 a=vW-hlcJimHXVMuZkqwUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030223
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111068-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,herrie.org:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,wcfrbcvin5w3:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 256D963BAE5

On Wed, Jun 03, 2026 at 06:34:10PM +0200, Herman van Hazendonk wrote:
> Add a Qualcomm interconnect driver for the MSM8x60 family modelling the
> four NoC fabrics (APPSS, System, MMSS, DFAB) that connect masters and
> slaves on these Scorpion-class SoCs. The driver implements the
> interconnect-provider API to manage bandwidth between specific masters
> and slaves via the RPM arbitration tables.
> 
> Each fabric carries:
>   - A bus clock (managed via clk_bulk APIs) whose rate is the
>     aggregated bandwidth divided by the fabric bus width, with a
>     minimum floor of 384 MHz to prevent USB starvation observed when
>     the fabric drops to the previously-used 266 MHz minimum.
>   - An RPM arbitration buffer (arb / bwsum) that the RPM firmware
>     consumes via its shared-memory protocol; commits go via the
>     qcom-rpm driver's set_resource API.
> 
> msm8660_get_rpm() pins the supplier with device_link_add() before
> reading drvdata so an unbind/rebind window cannot leave a stale
> qcom_rpm pointer. clk_bulk_prepare_enable is paired with a
> devm_add_action_or_reset cleanup so an EPROBE_DEFER from the RPM
> lookup does not leak the prepare/enable refcount across retries. The
> fabric rate cap uses min_t(u64,...) so a bandwidth request exceeding
> 4 GiB/s cannot wrap through u32 truncation into a near-zero clock
> rate that would halt the interconnect.

Thanks for working on this.

> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/interconnect/qcom/Kconfig             |   14 +
>  drivers/interconnect/qcom/Makefile            |    2 +
>  drivers/interconnect/qcom/msm8660.c           | 1147 +++++++++++++++++
>  .../dt-bindings/interconnect/qcom,msm8660.h   |    6 +-
>  4 files changed, 1166 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/interconnect/qcom/msm8660.c
> 
> +
> +/*
> + * RPM fabric arbitration data format (from legacy vendor kernel msm_bus_fabric.c):
> + *
> + * Each u16 arb entry: bit 15 = tier (1=TIER1 high priority), bits 14-0 = BW
> + * Bandwidth is in 128KB units (bytes >> 17).
> + * Two u16 values are packed into each u32 RPM register word.
> + *
> + * Buffer layout: [bwsum pairs] [arb pairs]
> + * bwsum[slave_port] = total bandwidth to that slave
> + * arb[(tier-1)*nmasters + master_port] = per-master arbitration entry
> + */
> +#define ARB_BWMASK		0x7FFF
> +#define ARB_TIERMASK		0x8000
> +#define ARB_TIER1		1
> +#define ARB_TIER2		2
> +
> +static const struct clk_bulk_data msm8660_afab_clocks[] = {
> +	{ .id = "bus" },
> +	{ .id = "bus_a" },
> +	{ .id = "ebi1" },
> +	{ .id = "ebi1_a" },

What clocks are those? Please provide the actual dt-bindings schema
(together with the examples). In the past we had bus / bus_a clocks for
the SMD-RPM-based interconnects, but lyter they were ripped out and
replaced with the direct voting for the resources.

> +};
> +
> +
> +/*
> + * Node definitions with RPM port mapping.
> + *
> + * DEFINE_QNODE(_name, _id, _buswidth, _mas_port, _slv_port, _tier, links...)
> + *
> + * _mas_port: master port index for RPM ARB array (-1 if not a master)
> + * _slv_port: slave port index for RPM bwsum array (-1 if not a slave)
> + * _tier: master priority tier (ARB_TIER1=1, ARB_TIER2=2, 0 if N/A)
> + */
> +#define DEFINE_QNODE(_name, _id, _buswidth, _mas, _slv, _tier, ...)	\

Please expand the macro.

> +	static struct msm8660_icc_node _name = {			\
> +		.name = #_name,						\
> +		.id = _id,						\
> +		.buswidth = _buswidth,					\
> +		.num_links = COUNT_ARGS(__VA_ARGS__),			\
> +		.links = { __VA_ARGS__ },				\
> +		.mas_port = _mas,					\
> +		.slv_port = _slv,					\
> +		.mas_tier = _tier,					\
> +	}
> +

[...]

> +/*
> + * Look up the RPM that owns fabric arbitration writes.
> + *
> + * Returns NULL if the DT does not have a "qcom,rpm" phandle (in which
> + * case the caller silently drops RPM ARB and runs the fabric purely
> + * via clk_set_rate).
> + *
> + * Returns ERR_PTR(-EPROBE_DEFER) if the RPM device exists in DT but
> + * its driver has not finished probing yet, or if device_link_add()
> + * fails. The caller is expected to propagate this so the interconnect
> + * driver gets retried once the RPM is ready.
> + *
> + * On success returns the qcom_rpm handle and pins the RPM device
> + * lifetime to ours via a consumer-supplier device link, so the
> + * devres-allocated qcom_rpm cannot be freed while we still hold a
> + * pointer to it.
> + */
> +static struct qcom_rpm *msm8660_get_rpm(struct device *dev)
> +{
> +	struct device_node *rpm_np;
> +	struct platform_device *rpm_pdev;
> +	struct device_link *link;
> +	struct qcom_rpm *rpm;
> +
> +	rpm_np = of_parse_phandle(dev->of_node, "qcom,rpm", 0);
> +	if (!rpm_np) {
> +		dev_dbg(dev, "no qcom,rpm phandle, RPM ARB disabled\n");
> +		return NULL;

Here and further, return dev_err_ptr_probe().

> +	}
> +
> +	rpm_pdev = of_find_device_by_node(rpm_np);
> +	of_node_put(rpm_np);
> +	if (!rpm_pdev) {
> +		dev_dbg(dev, "RPM device not found yet, deferring probe\n");
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	/*
> +	 * Pin the supplier BEFORE reading its drvdata. The device link
> +	 * (MANAGED, the default state) prevents the RPM driver from being
> +	 * unbound while we hold the link, which closes the window where a
> +	 * concurrent unbind+rebind could free the qcom_rpm pointer between
> +	 * dev_get_drvdata() and the link being established. If the link
> +	 * cannot be added (e.g. supplier is in the process of being
> +	 * removed) we defer and retry.
> +	 */
> +	link = device_link_add(dev, &rpm_pdev->dev,
> +			       DL_FLAG_AUTOREMOVE_CONSUMER);
> +	put_device(&rpm_pdev->dev);
> +	if (!link) {
> +		dev_warn(dev, "failed to add device link to RPM, deferring\n");
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	/*
> +	 * Safe to read drvdata now: the device link pins the supplier so
> +	 * it cannot be unbound until our consumer (this interconnect
> +	 * provider) is unbound first.
> +	 */
> +	rpm = dev_get_drvdata(&rpm_pdev->dev);
> +	if (!rpm) {
> +		dev_dbg(dev, "RPM not ready, deferring probe\n");
> +		device_link_remove(dev, &rpm_pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	return rpm;
> +}
> +
> +static int msm8660_icc_probe(struct platform_device *pdev)
> +{
> +	const struct msm8660_icc_desc *desc;
> +	struct msm8660_icc_node * const *qnodes;
> +	struct msm8660_icc_provider *qp;
> +	struct device *dev = &pdev->dev;
> +	struct icc_onecell_data *data;
> +	struct icc_provider *provider;
> +	struct icc_node *node;
> +	size_t num_nodes, i;
> +	int ret;
> +
> +	desc = of_device_get_match_data(dev);
> +	if (!desc)
> +		return -EINVAL;
> +
> +	qnodes = desc->nodes;
> +	num_nodes = desc->num_nodes;
> +
> +	qp = devm_kzalloc(dev, sizeof(*qp), GFP_KERNEL);
> +	if (!qp)
> +		return -ENOMEM;
> +
> +	data = devm_kzalloc(dev, struct_size(data, nodes, num_nodes),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	data->num_nodes = num_nodes;
> +
> +	qp->bus_clks = devm_kmemdup(dev, desc->bus_clks,
> +				    desc->num_clks * sizeof(*desc->bus_clks),
> +				    GFP_KERNEL);
> +	if (!qp->bus_clks)
> +		return -ENOMEM;
> +
> +	qp->num_clks = desc->num_clks;
> +
> +	/*
> +	 * MSM8660 fabric clocks are managed by RPM firmware and may not be
> +	 * available in mainline Linux yet. Once the clock provider exists,
> +	 * we want to honour it; until then we run without per-fabric clock
> +	 * scaling. The crucial part is that -EPROBE_DEFER means "the
> +	 * provider exists but hasn't probed yet" and MUST be propagated so
> +	 * we get retried; only other errors (genuine -ENOENT, etc.) get
> +	 * downgraded to "no clocks, continue".

Please limit to -ENOENT only.

> +	 */
> +	ret = devm_clk_bulk_get_optional(dev, qp->num_clks, qp->bus_clks);
> +	if (ret == -EPROBE_DEFER)
> +		return ret;
> +	if (ret) {
> +		dev_warn(dev, "Failed to get bus clocks: %d (continuing without clock scaling)\n",
> +			 ret);
> +		qp->num_clks = 0;
> +	}
> +
> +	if (qp->num_clks) {
> +		ret = clk_bulk_prepare_enable(qp->num_clks, qp->bus_clks);
> +		if (ret) {
> +			dev_warn(dev, "Failed to enable bus clocks: %d\n", ret);
> +			qp->num_clks = 0;
> +		} else {
> +			/*
> +			 * Register the cleanup right after a successful
> +			 * prepare_enable so any later -EPROBE_DEFER or other
> +			 * probe error path (e.g. msm8660_get_rpm failing
> +			 * with -EPROBE_DEFER below) does not leak a clock
> +			 * prepare/enable reference across the retry.
> +			 */
> +			ret = devm_add_action_or_reset(dev,
> +				msm8660_icc_clk_release, qp);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	/* Set up RPM fabric arbitration */
> +	qp->desc = desc;
> +	if (desc->rpm_resource >= 0) {
> +		qp->rpm = msm8660_get_rpm(dev);
> +		if (IS_ERR(qp->rpm))
> +			return PTR_ERR(qp->rpm);
> +		if (qp->rpm) {
> +			int arb_size = desc->nmasters * desc->ntieredslaves;
> +
> +			qp->bwsum = devm_kcalloc(dev, desc->nslaves,
> +						 sizeof(u16), GFP_KERNEL);
> +			qp->arb = devm_kcalloc(dev, arb_size,
> +					       sizeof(u16), GFP_KERNEL);
> +			qp->rpm_buf = devm_kcalloc(dev, desc->rpm_buf_size,
> +						   sizeof(u32), GFP_KERNEL);
> +			if (!qp->bwsum || !qp->arb || !qp->rpm_buf) {
> +				dev_warn(dev, "RPM buffer alloc failed, ARB disabled\n");
> +				qp->rpm = NULL;
> +			} else {
> +				int rc;
> +
> +				dev_info(dev, "RPM fabric ARB enabled (%d masters, %d slaves, %d tiered)\n",
> +					 desc->nmasters, desc->nslaves,
> +					 desc->ntieredslaves);
> +
> +				/*
> +				 * One-shot sleep-context vote of zero bandwidth.
> +				 * Without an explicit SLEEP_STATE write, RPM has no
> +				 * fabric bandwidth target for deep-sleep and may
> +				 * keep the active vote applied indefinitely,
> +				 * preventing DDR from dropping its rate when CPUs
> +				 * power-collapse. The buffer is devm_kcalloc'd so
> +				 * it is all-zero at this point — written before
> +				 * any consumer can drive an active vote that would
> +				 * dirty it.
> +				 *
> +				 * msm8660_rpm_commit() writes ACTIVE_STATE only;
> +				 * SLEEP_STATE remains zero for the provider's
> +				 * lifetime, so this vote does not need refreshing.
> +				 */
> +				rc = qcom_rpm_write(qp->rpm,
> +						    QCOM_RPM_SLEEP_STATE,
> +						    desc->rpm_resource,
> +						    qp->rpm_buf,
> +						    desc->rpm_buf_size);
> +				if (rc)
> +					dev_warn(dev, "RPM fabric sleep vote failed: %d\n",
> +						 rc);
> +			}
> +		}
> +	}
> +
> +	provider = &qp->provider;
> +	provider->dev = dev;
> +	provider->set = msm8660_icc_set;
> +	provider->aggregate = msm8660_icc_aggregate;
> +	provider->xlate = of_icc_xlate_onecell;
> +	provider->data = data;
> +	provider->get_bw = msm8660_get_bw;
> +
> +	icc_provider_init(provider);
> +
> +	for (i = 0; i < num_nodes; i++) {
> +		size_t j;
> +
> +		if (!qnodes[i])
> +			continue;
> +
> +		node = icc_node_create(qnodes[i]->id);

Please switch to the dynamic ICC node numbers (see icc-rpmh)

> +		if (IS_ERR(node)) {
> +			ret = PTR_ERR(node);
> +			goto err_remove_nodes;
> +		}
> +
> +		node->name = qnodes[i]->name;
> +		node->data = qnodes[i];
> +		icc_node_add(node, provider);
> +

-- 
With best wishes
Dmitry

