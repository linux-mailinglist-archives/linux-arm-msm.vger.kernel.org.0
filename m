Return-Path: <linux-arm-msm+bounces-93819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBZZGi3EnGnJKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 22:18:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EA517D7D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 22:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9B043007A6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B397D378823;
	Mon, 23 Feb 2026 21:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoFxN9xd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NfCf20zh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5256E378811
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 21:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771881471; cv=none; b=uGCOsdYsTv7N1MVRjy2619CdUbF35WGpJ+WwfOGfuHiuyD/HFgy9/W5aXqQAwhf+9Qzd0O1z+6xToBMCFoERrUtJ6G1/YvzC24INj4vxgKAGPBBOcT1LhZc+8/bA2s+x/AP7DCALKnOVgo9dfLOULkPYY8FmgtSjngxoeQ5JJWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771881471; c=relaxed/simple;
	bh=mcsMlkfZBrp0xwp5kW6abPbA5/MnShYN1DFsrDFrxvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RohDMhUbd+UHCPfpAIiHcT4iVm6IptZxUot9lJeVORK2OOJJRRxE2e6enEEIy0T55PFy9ndI1WuQIlR3j9jnCwNRs0yyzIJxXdp5HPHMRekNceJ1VeKJYRPXbC+Druci7IvVUNCFt+ExkjWqdDR5zjTLBo4R8bJU31M/lXG1Zb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YoFxN9xd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NfCf20zh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NDsIGx185289
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 21:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1FKuQnvI/JR7GzRu2Av4diW6
	kuTld28E3cs1g9PwsAw=; b=YoFxN9xdqfbroHf6OUjrfeAF5dcbf7gSGyLivvOc
	kkug/Sl/B92VQYI6SW1xgHu+pHZXEwVdpTkCTlQ2jV4IZVg3iFKd6CRtcwcg/TzD
	KGu5qcchqKgXjob0deTMRKfqx51EqgZ7MVFOOGDWxJhYVCXFCRhnasQiB7JYdn2f
	BcAn6lh6U3TIpqUSSj89ZaraZmfqJeP7rR3nnLyt8S3Z8BSG29AeXYU80fRGVz+R
	GDnZgpU2jF1LHs6R2mFCn5srpSXKzfECXKj1HcmdrFZRYC6JZZYKgkH7nr2cya0q
	hhaLZGVnm3jJb9ybOYXaYiCDyCJZWBe98V42AThT0Zw7ug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69hbn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 21:17:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70d16d5a9so3997427185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771881468; x=1772486268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1FKuQnvI/JR7GzRu2Av4diW6kuTld28E3cs1g9PwsAw=;
        b=NfCf20zhS2Ip4PttkRVZV3F8HGtQ2U35VfwPO2CDklsAdL9p9wHvxDsWtw+HKbmxXI
         SbmCnsJMBlmmVy/7XvgSk3KdH1YwUkpzZZbAgNCeLkpuxVuJKboJNDeXWHNENHw0OBjF
         f6Oa+axQiAjDW2+gfR20FbXwsjzadV/dzz5u5sTNYsalxjbZ76OtHruwLrLSK+H6VINf
         VQOwKoZ05fOi58E3BctqcC8v/znR/ZGSCtWTERDGA59Sm5+7nTJ1a1Ys5CfY4rygwZRv
         fTcGGsfubaXAA74+svFdVTxpnikVPr1KZe9anOnD7TY9AD+c5Qn84NnmhVNqCkOXoUyV
         sDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771881468; x=1772486268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FKuQnvI/JR7GzRu2Av4diW6kuTld28E3cs1g9PwsAw=;
        b=s5G2DUblKykT9jF9tfXzK3BvgqwHKJYbH44ipJueBa8zzP7qpwJ/cjV4QuRQPvuJmt
         /O2m93TaaMkWaGsfObmwrmKsqnD8cxHphtYMb0gC7IguqgaWKYRVd7vcmbuHb37yC9hj
         ZGIRCQ0yLoDoi2NI6F7STJXkczRjqQk2/aNU5tPyUvjVqL9eLQWFSpbfr6xPgrrnhA2s
         jsYnVwbfNjpRTEoJyhzoMp0Ip56zUYFttmDE8uyX/C6bYCBfc1FmwXCH5G69NfXajaiH
         xDMabMDMrL7Qd0hs/j8gZ9KlpUcgWae9L61vTA+jp2HrLCDMIsUwGc6veqCu7gCjy28X
         gCvw==
X-Forwarded-Encrypted: i=1; AJvYcCXzGO0dllISr1qddXAcxDGhtwvx2XDkfV1VgN5xgPQAs22YELCxXO6Px4m7lBmQMrKDe7MnKYZVVo4wW2Qg@vger.kernel.org
X-Gm-Message-State: AOJu0YxNO2Xh7iGdYRug3rad4mr9PhurKYhfS0xWnsaXC8MeiXwK+5S0
	EFLwiKduAnXG6EIwLjTcbu1lwk78K+NevyqYlu/aOW3EaSMAYrWAJ+Z+17bgAuJTtM8DHvbTv3+
	4yQ+T61I3cn2fGaKlhphK9RK4w0k5+XX7xsB18lreqDuACC4rJq4jkeo6+X968YuY+FrQ
X-Gm-Gg: AZuq6aIN71lk9cr6sizdhL2ONwtRlBmhkT3nU/5K8Hkg0NEPO6VuUuZJwnXO5eAzBHw
	8FY4P2eSWQr9t3btoqD8wtU8jYyVear+eekLFzyJNH2LqXR7IQ6awwvvGc441xA30Oc7ZhdXT+V
	d9vZ0YCjnHsiZaO995LgrMriLtBWEJro2bJKsSNWLkpy0B+vLSWERJvqGJy0AXu6UpXRtNiGF6X
	+U/ALcTyz6/nuFDgDXI/f3r5tLzIHWF+VvhKG/LlWlZkL882LP5kJLDBKkJ5tsMOKzgdrf3/XFq
	t9y+q8R6i2tMSKtMY87rE64CepHNeCL/NZZiLCitnSWkaRwAuGj7Vo3JW61BEOX3y3EylEjjdWH
	EkEjV47dkOOTnvqe50iCt7Bz4x9ZVvkHk5WBevq+X/nl7jeWjezyNNimCdtJOeMPmtpzXrr//v+
	XnK86cVEqMjYuQWzvqeyYfUprd8JmUeWJdymo=
X-Received: by 2002:a05:620a:294f:b0:8cb:54d6:7ba with SMTP id af79cd13be357-8cb8c9d1e69mr1226696485a.7.1771881468107;
        Mon, 23 Feb 2026 13:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:294f:b0:8cb:54d6:7ba with SMTP id af79cd13be357-8cb8c9d1e69mr1226692085a.7.1771881467537;
        Mon, 23 Feb 2026 13:17:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7aab220sm17369921fa.37.2026.02.23.13.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:17:46 -0800 (PST)
Date: Mon, 23 Feb 2026 23:17:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
Message-ID: <jyd3ufisoz4xcfe2dvu26odesaz2czj22jn46qswkzz6ocg4zu@6krzvyvirkmo>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699cc3fd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=KKZUDU7hoNn2ThC74tMA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: YASSkR4b92PxsiWv9KO3643p2OWIAXYC
X-Proofpoint-GUID: YASSkR4b92PxsiWv9KO3643p2OWIAXYC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE4NSBTYWx0ZWRfX+SOiYk12La74
 btV7mL+MbTmNZwiFOpCkj+kdH4K9VsyXUixlB9KonRc6yBZBwTiwV6eDWa+TysTadwAYYIi4FAq
 fc4ykvYhUVeG15K114oAPioZrbgn0sc5zijpe3R7C69faeKV+U1VTQOcuiAoydQgA1JT/ap9DOf
 gVBxihkB4CuflrpNry9essfjk/NMsXQj2YVAr8SgoLuedI+BJOd6hUs/D/nfRGU/v4riwtON0Bl
 6TaTk6q0qVe/FtYO9N7AYag6paQqiS5mUaadRKG1K8cXyJF/cWRe+9whnSFizDxtWkz/zT5/i2r
 bdPZLzTPNjsZ/5ZSOVv9HwSb/7igJUOxYeQbZ4xH71jPRZvAi2mEtttJrd4LT4gyMi/4mqfPk7T
 2//HL/guHKZZvAKcaS+5fvuZg2fI/7vetEtg4ZHen9wwZ3qdASk60JRYfjs4vpbrIXSI4tpIUUn
 kho204jzDLAQw+adGHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230185
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93819-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88EA517D7D4
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:38:55AM +0530, Ekansh Gupta wrote:
> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
> integrated in the DRM accel subsystem.
> 
> The new docs introduce QDA as a DRM/accel-based implementation of
> Hexagon DSP offload that is intended as a modern alternative to the
> legacy FastRPC driver in drivers/misc. The text describes the driver
> motivation, high-level architecture and interaction with IOMMU context
> banks, GEM-based buffer management and the RPMsg transport.
> 
> The user-space facing section documents the main QDA IOCTLs used to
> establish DSP sessions, manage GEM buffer objects and invoke remote
> procedures using the FastRPC protocol, along with a typical lifecycle
> example for applications.
> 
> Finally, the driver is wired into the Compute Accelerators
> documentation index under Documentation/accel, and a brief debugging
> section shows how to enable dynamic debug for the QDA implementation.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  Documentation/accel/index.rst     |   1 +
>  Documentation/accel/qda/index.rst |  14 +++++
>  Documentation/accel/qda/qda.rst   | 129 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 144 insertions(+)
> 
> diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
> index cbc7d4c3876a..5901ea7f784c 100644
> --- a/Documentation/accel/index.rst
> +++ b/Documentation/accel/index.rst
> @@ -10,4 +10,5 @@ Compute Accelerators
>     introduction
>     amdxdna/index
>     qaic/index
> +   qda/index
>     rocket/index
> diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qda/index.rst
> new file mode 100644
> index 000000000000..bce188f21117
> --- /dev/null
> +++ b/Documentation/accel/qda/index.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +==============================
> + accel/qda Qualcomm DSP Driver
> +==============================
> +
> +The **accel/qda** driver provides support for Qualcomm Hexagon DSPs (Digital
> +Signal Processors) within the DRM accelerator framework. It serves as a modern
> +replacement for the legacy FastRPC driver, offering improved resource management
> +and standard subsystem integration.
> +
> +.. toctree::
> +
> +   qda
> diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
> new file mode 100644
> index 000000000000..742159841b95
> --- /dev/null
> +++ b/Documentation/accel/qda/qda.rst
> @@ -0,0 +1,129 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +==================================
> +Qualcomm Hexagon DSP (QDA) Driver
> +==================================
> +
> +Introduction
> +============
> +
> +The **QDA** (Qualcomm DSP Accelerator) driver is a new DRM-based
> +accelerator driver for Qualcomm's Hexagon DSPs. It provides a standardized
> +interface for user-space applications to offload computational tasks ranging
> +from audio processing and sensor offload to computer vision and AI
> +inference to the Hexagon DSPs found on Qualcomm SoCs.
> +
> +This driver is designed to align with the Linux kernel's modern **Compute
> +Accelerators** subsystem (`drivers/accel/`), providing a robust and modular
> +alternative to the legacy FastRPC driver in `drivers/misc/`, offering
> +improved resource management and better integration with standard kernel
> +subsystems.
> +
> +Motivation
> +==========
> +
> +The existing FastRPC implementation in the kernel utilizes a custom character
> +device and lacks integration with modern kernel memory management frameworks.
> +The QDA driver addresses these limitations by:
> +
> +1.  **Adopting the DRM accel Framework**: Leveraging standard uAPIs for device
> +    management, job submission, and synchronization.
> +2.  **Utilizing GEM for Memory**: Providing proper buffer object management,
> +    including DMA-BUF import/export capabilities.
> +3.  **Improving Isolation**: Using IOMMU context banks to enforce memory
> +    isolation between different DSP user sessions.
> +
> +Key Features
> +============
> +
> +*   **Standard Accelerator Interface**: Exposes a standard character device
> +    node (e.g., `/dev/accel/accel0`) via the DRM subsystem.
> +*   **Unified Offload Support**: Supports all DSP domains (ADSP, CDSP, SDSP,
> +    GDSP) via a single driver architecture.
> +*   **FastRPC Protocol**: Implements the reliable Remote Procedure Call
> +    (FastRPC) protocol for communication between the application processor
> +    and DSP.
> +*   **DMA-BUF Interop**: Seamless sharing of memory buffers between the DSP
> +    and other multimedia subsystems (GPU, Camera, Video) via standard DMA-BUFs.
> +*   **Modular Design**: Clean separation between the core DRM logic, the memory
> +    manager, and the RPMsg-based transport layer.
> +
> +Architecture
> +============
> +
> +The QDA driver is composed of several modular components:
> +
> +1.  **Core Driver (`qda_drv`)**: Manages device registration, file operations,
> +    and bridges the driver with the DRM accelerator subsystem.
> +2.  **Memory Manager (`qda_memory_manager`)**: A flexible memory management
> +    layer that handles IOMMU context banks. It supports pluggable backends
> +    (such as DMA-coherent) to adapt to different SoC memory architectures.
> +3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
> +
> +    * **`qda_gem`**: Core GEM object management, including allocation, mmap
> +      operations, and buffer lifecycle management.
> +    * **`qda_prime`**: PRIME import functionality for DMA-BUF interoperability,
> +      enabling seamless buffer sharing with other kernel subsystems.
> +
> +4.  **Transport Layer (`qda_rpmsg`)**: Abstraction over the RPMsg framework
> +    to handle low-level message passing with the DSP firmware.
> +5.  **Compute Bus (`qda_compute_bus`)**: A custom virtual bus used to
> +    enumerate and manage the specific compute context banks defined in the
> +    device tree.

I'm really not sure if it's a bonus or not. I'm waiting for iommu-map
improvements to land to send patches reworking FastRPC CB from using
probe into being created by the main driver: it would remove some of the
possible race conditions between main driver finishing probe and the CB
devices probing in the background.

What's the actual benefit of the CB bus?

> +6.  **FastRPC Core (`qda_fastrpc`)**: Implements the protocol logic for
> +    marshalling arguments and handling remote invocations.
> +
> +User-Space API
> +==============
> +
> +The driver exposes a set of DRM-compliant IOCTLs. Note that these are designed
> +to be familiar to existing FastRPC users while adhering to DRM standards.
> +
> +*   `DRM_IOCTL_QDA_QUERY`: Query DSP type (e.g., "cdsp", "adsp")
> +    and capabilities.
> +*   `DRM_IOCTL_QDA_INIT_ATTACH`: Attach a user session to the DSP's protection
> +    domain.
> +*   `DRM_IOCTL_QDA_INIT_CREATE`: Initialize a new process context on the DSP.

You need to explain the difference between these two.

> +*   `DRM_IOCTL_QDA_INVOKE`: Submit a remote method invocation (the primary
> +    execution unit).
> +*   `DRM_IOCTL_QDA_GEM_CREATE`: Allocate a GEM buffer object for DSP usage.
> +*   `DRM_IOCTL_QDA_GEM_MMAP_OFFSET`: Retrieve mmap offsets for memory mapping.
> +*   `DRM_IOCTL_QDA_MAP` / `DRM_IOCTL_QDA_MUNMAP`: Map or unmap buffers into the
> +    DSP's virtual address space.

Do we need to make this separate? Can we map/unmap buffers on their
usage? Or when they are created? I'm thinking about that the
virtualization. An alternative approach would be to merge
GET_MMAP_OFFSET with _MAP: once you map it to the DSP memory, you will
get the offset. 

> +
> +Usage Example
> +=============
> +
> +A typical lifecycle for a user-space application:
> +
> +1.  **Discovery**: Open `/dev/accel/accel*` and check
> +    `DRM_IOCTL_QDA_QUERY` to find the desired DSP (e.g., CDSP for
> +    compute workloads).
> +2.  **Initialization**: Call `DRM_IOCTL_QDA_INIT_ATTACH` and
> +    `DRM_IOCTL_QDA_INIT_CREATE` to establish a session.
> +3.  **Memory**: Allocate buffers via `DRM_IOCTL_QDA_GEM_CREATE` or import
> +    DMA-BUFs (PRIME fd) from other drivers using `DRM_IOCTL_PRIME_FD_TO_HANDLE`.
> +4.  **Execution**: Use `DRM_IOCTL_QDA_INVOKE` to pass arguments and execute
> +    functions on the DSP.
> +5.  **Cleanup**: Close file descriptors to automatically release resources and
> +    detach the session.
> +
> +Internal Implementation
> +=======================
> +
> +Memory Management
> +-----------------
> +The driver's memory manager creates virtual "IOMMU devices" that map to
> +hardware context banks. This allows the driver to manage multiple isolated
> +address spaces. The implementation currently uses a **DMA-coherent backend**
> +to ensure data consistency between the CPU and DSP without manual cache
> +maintenance in most cases.
> +
> +Debugging
> +=========
> +The driver includes extensive dynamic debug support. Enable it via the
> +kernel's dynamic debug control:
> +
> +.. code-block:: bash
> +
> +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_debug/control

Please add documentation on how to build the test apps and how to load
them to the DSP.

> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

