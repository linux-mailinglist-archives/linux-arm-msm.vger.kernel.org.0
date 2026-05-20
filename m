Return-Path: <linux-arm-msm+bounces-108763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEd6FInGDWr93AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:34:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F72058FB25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C03D31097C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBC33ED101;
	Wed, 20 May 2026 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSDgISG+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fySq+QkB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573A83E9C12
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286348; cv=none; b=CnnsgQePVuojfAUuzd0MlgrDawQpFa/BBPKBhDvqKUyZ/vIny+ujMeMbMbmvODb8257yBx28bcCJy6aJUU2olxJ+SfzzpnpMdDjStfsCcvHpmiPUCe3dWwXdViyOVHo2PtODjatxshVdixqCkE5kEXfxNHtRpW2P4VfrlnDUsW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286348; c=relaxed/simple;
	bh=phSB63IMl2A6TqoNdQoL+sK0co7BbyjOBYGwKZxoYCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6sDhJDyIYdlVfWJ+DsdjJ769bc9Jv91OGhQMIqZ3rw+PcEQ6ZRaXoacDDpCVUeXt08Vxr6XSfShLzQfqDbuKagGFlzCZM0bG+x1xDzvM3dgsD1+W843fm5Iio4ew+MWKE2klmpYsZwLsBmOahmWhBHXhsU8Y8GXf6LRfGHbaaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSDgISG+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fySq+QkB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDWurm1725320
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fjc/US0eOmCaq8NJVQ5/t7CluwSHuURJ7uN+zaRxrGg=; b=cSDgISG+AOhCmG7R
	DKix72vBfFMmRS7S5JLtuxJgxQ5rA/o91om6pqfXovLaO82aNU3pJLEx7Gv0w3Ug
	qklISnqIKD1ip2d4rvBvU+6XC7jC9BWp+gRYSFso1oPY6GoHyKUX47jeqU9hr37g
	8pWE99iqikCzwkoGHLhOJd11rwpLAsHX9X/w7Lek/kn7r5oD+xRa0sJXoOVy/WnM
	NV+qkDCcoAS8bHvgs08mfpJZKKDCqHndlwYjJWsFwgx1my1puF+DciEmUIXIs2rN
	km8/aItafF6gKi9C0DxV81h2ZXVjN04qiOwEdHsHyj4VN2y+BPsuO4z755cJEnAz
	b6Bgdg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qn348-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:12:25 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f69a1a9f5so15411485e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779286344; x=1779891144; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fjc/US0eOmCaq8NJVQ5/t7CluwSHuURJ7uN+zaRxrGg=;
        b=fySq+QkBHyvfVg5TFo8gpI8HkNM1Ng/1QHz4IuPGOzl+MfRG2xXAUQIAz9DeOpSbB9
         dHOgYxdxOci0YXFqZ6lk70dv3WLnWbh+diDXc9nfGvlwS21keFRhWlc4TKjQPQYeg9ps
         zV0WxZScCrIjhfRqTnweZP7UqDcROFXSv4OR4uWlD8llItO53gBt2XR+Pf9FoTA7Rxcj
         0/ykAYAc/2/KASmS1rm15MEdEEeAb/oUz5eqwudT7R2aFAbj66jg+i49UIMU/1E0Aj8S
         rUtKS6rnGB0ehHauCOB07bqZKVopvHhpYzci5DOG8Oaj0vgJAtqBXCVLVCo5IS6tOfYC
         fyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286344; x=1779891144;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fjc/US0eOmCaq8NJVQ5/t7CluwSHuURJ7uN+zaRxrGg=;
        b=F/uTryJmRej0V/gm2zAauViJqAajdi8RWddGe8cIeH95vIE0ghgFp+WbgIGT0ekICx
         /x2l4EilEVjN9ZCvM3pnK2ajt8wEAT0AXViUAouVbOfaeX7ZW8NXGrhXonS4zVKv+F7Z
         om2e/8m/T6tzL/RIOIL1/a3Hvm9B/OB4OA5le0veE9E+Z3SKYeKH6DUQUr8oLGvkDVQL
         0u5tbXLE9aGsAXpt4Y52d4pbPculkIsFmRHnviQr7qDXPEXdvoIJSIx5u3Eeii3h6XUK
         M9NwY6LgGSCX4KzpanZAp9wJXXWIRjotSpnuT/Hnkr7B/SHxq6mblkSAQvLFdjyvVd73
         4Mmg==
X-Forwarded-Encrypted: i=1; AFNElJ9C/KNuzoySuS6815yUXW6NGmwGE9zugsLKCIhSeQOXbMK6Fp96+tosCtDXSRYiBn6sB02BxT8zRL+H91EO@vger.kernel.org
X-Gm-Message-State: AOJu0YzGxkJ4M0IxGWjUA2wC1exzFxzb2T2jdOloHRrqxZegxOxjGUYX
	/sUiOQbuoIVIu+ajqKOw0DJJX72iAhnpuH2lzccR/NspnPromYrm8GBCRHPDpUjs1q+R3Dv5H69
	+q7ItdcFx+UxfiqIGev86II9Cslt7B06r5MFmbl5yIGFmO9FDRRVb9PBTTbddNIXla8lc
X-Gm-Gg: Acq92OHtVnquPn5ujh0xeAoQbfpT69bWl2ioo7ofHvitjBPJd9HBUCcIiJCpyIde9Hm
	oO1h2E9lhfDGJv7eIuFC6ciSxfLqfokLzNsGA9GawMWJe6+Vl0aj2V/yXRs+/5dAfVZnKqyNWSG
	ngRbYODW0R8LGl+T5yMsBl+1KdhwbCtj13Tqqor9OcgSXhXEB2CCnPnb6QxkKhc/cWGRYRfNk2v
	+ovJYtgzJr7gJEGevhLEK0LXr/srpTRe6miUzHphVY1pHO1v3/CTlWXJHNZyVNN+wjPBSo9kY3h
	FThbQKna+fvIusSlwQXAL0M3HObYDwrMJzM+U8q3Lg9N5SRtTGPm1EhkEvOVNiSDyVqYRY15N7V
	xrEOPyAe0hL/YYo9eWP8rGHA2Fw9hjEDJxXyq3iSF7aIh5xF73j43WoJIRo3jiJroNxXcWmKZOq
	8B67CoPQkhwshY76Uk7q0SBseK72CV52DyGbs=
X-Received: by 2002:a05:6122:2676:b0:57d:6d56:11ff with SMTP id 71dfb90a1353d-57d6d56133cmr2372267e0c.9.1779286343936;
        Wed, 20 May 2026 07:12:23 -0700 (PDT)
X-Received: by 2002:a05:6122:2676:b0:57d:6d56:11ff with SMTP id 71dfb90a1353d-57d6d56133cmr2372208e0c.9.1779286343311;
        Wed, 20 May 2026 07:12:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cec52sm4960154e87.72.2026.05.20.07.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:12:22 -0700 (PDT)
Date: Wed, 20 May 2026 17:12:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ekansh.gupta@oss.qualcomm.com
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 02/15] accel/qda: Add QDA driver documentation
Message-ID: <paiohsil5pmvm7cf6jxrhaj2225bgvlt3scrag4x6gbkyosow5@l4tbakbnxcvo>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-2-b2d984c297f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519-qda-series-v1-2-b2d984c297f8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzOCBTYWx0ZWRfX/yOk03klHNxo
 Ii/7jSaQWXn9NqwAwpaEfscQ9C8cdYaIQIxIjjwSfFJ2A+FIotD/j1RWhFhFxE/kAnPNhRdNkVU
 9uSGOjmo6R/DQYtBI2j7sa24NbepoXv/OxRMuoUet3vtqXYZFCnsUdT/2gBFs7EPNhajw8eS2jk
 GiMREYCrSbk9RoStKWIttcPCEPDE7vsJF1Nw6EWkzahv/0iCYObaQcKqCmy31HsZoBy6I9V5+4g
 VuBJvuKkZZkJ/dPezTLLwrv6BJn+lv/4A9dw8Es7K2RrbfZj35VogwU9Bfh03GCS0Gqi+b0clp3
 DkJ3OXg09xNCgWanwvbYJnziNo8QlZlDVGdI0RVHBe6Hj/9iva/je2hCrtXZbYTbC/aVfWcGp3q
 M0PFCfi3vAVpERW6mrEI8058ARaPq2jwzoZOKzoSobk8yDd+ZWRh+Hf8Ncm3nnsfWFQlGo4OGR5
 pxgAzBslp+oV80naLwg==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0dc149 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=x97SpM1XRKmEcGPL2ZkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 1vbWLkQHZ3W9ZPDWSFEr0wZTJ_pC1sX1
X-Proofpoint-ORIG-GUID: 1vbWLkQHZ3W9ZPDWSFEr0wZTJ_pC1sX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108763-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foo:url,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F72058FB25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:45:52AM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Add documentation for the Qualcomm DSP Accelerator (QDA) driver under
> Documentation/accel/qda/. The documentation covers the driver
> architecture, GEM-based buffer management, IOMMU context bank
> isolation, and the RPMsg transport layer.
> 
> The user-space API section describes the DRM IOCTLs for session
> management, GEM buffer allocation, and remote procedure invocation via
> the FastRPC protocol, along with a typical application lifecycle
> example. Sections for dynamic debug and basic testing are also
> included.
> 
> Wire the new documentation into the Compute Accelerators index at
> Documentation/accel/index.rst.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  Documentation/accel/index.rst     |   1 +
>  Documentation/accel/qda/index.rst |  13 ++++
>  Documentation/accel/qda/qda.rst   | 146 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 160 insertions(+)
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
> index 000000000000..013400cf9c25
> --- /dev/null
> +++ b/Documentation/accel/qda/index.rst
> @@ -0,0 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +==================================
> +accel/qda Qualcomm DSP Accelerator
> +==================================
> +
> +The QDA driver provides a DRM accel based interface for Qualcomm DSP offload.
> +It uses the FastRPC protocol and integrates with DRM and GEM infrastructure
> +for device and buffer management.
> +
> +.. toctree::
> +
> +   qda
> diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
> new file mode 100644
> index 000000000000..9f49af6e6acc
> --- /dev/null
> +++ b/Documentation/accel/qda/qda.rst
> @@ -0,0 +1,146 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +=====================================
> +Qualcomm DSP Accelerator (QDA) Driver
> +=====================================
> +
> +Introduction
> +============
> +
> +The QDA driver is a DRM accel driver for Qualcomm's DSPs. It provides a
> +DRM accel based interface for Qualcomm DSP offload, supporting workloads
> +such as AI inference, computer vision, audio processing, and sensor offload
> +on Qualcomm SoCs. It uses the FastRPC protocol and integrates with DRM and
> +GEM infrastructure for device and buffer management.
> +
> +Key Features
> +============
> +
> +*   **DRM accel Interface**: Exposes a standard character device node
> +    (e.g., ``/dev/accel/accel0``) via the DRM accel subsystem.
> +*   **FastRPC Protocol**: Implements the FastRPC protocol for communication
> +    between the application processor and the DSP.
> +*   **GEM Buffer Management**: Uses the DRM GEM interface for buffer
> +    allocation, lifecycle management, and DMA-BUF import/export.
> +*   **IOMMU Isolation**: Uses IOMMU context banks to enforce memory isolation
> +    between different DSP user sessions.
> +*   **Modular Design**: Clean separation between the core DRM logic, the
> +    memory manager, and the RPMsg-based transport layer.
> +
> +Architecture
> +============
> +
> +The QDA driver consists of several functional blocks:
> +
> +1.  **Core Driver (``qda_drv``)**: Manages device registration, file operations,
> +    and DRM accel integration.
> +2.  **Memory Manager (``qda_memory_manager``)**: A flexible memory management
> +    layer that handles IOMMU context banks. It supports pluggable backends
> +    (such as DMA-coherent) to adapt to different SoC memory architectures.
> +3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
> +
> +    * **``qda_gem``**: Core GEM object management, including allocation, mmap
> +      operations, and buffer lifecycle management.
> +    * **``qda_prime``**: PRIME import functionality for DMA-BUF interoperability
> +      with other kernel subsystems.
> +
> +4.  **Transport Layer (``qda_rpmsg``)**: Abstraction over the RPMsg framework
> +    to handle low-level message passing with the DSP firmware.
> +5.  **Compute Bus (``qda_compute_bus``)**: A custom virtual bus used to
> +    enumerate and manage the specific compute context banks defined in the
> +    device tree. The bus was introduced because IOMMU context banks (CBs) are
> +    synthetic constructs — not real platform devices — making a platform driver
> +    an incorrect abstraction for them. The earlier platform-driver approach also
> +    had a race condition: device nodes were created before the RPMsg channel
> +    resources were fully initialized, and because ``probe`` runs asynchronously,
> +    applications could open a CB device and attempt to start a session before
> +    the underlying transport was ready. The compute bus makes CB lifetime
> +    explicitly subordinate to the parent QDA device, closing that window.
> +6.  **FastRPC Core (``qda_fastrpc``)**: Implements the protocol logic for
> +    marshalling arguments and handling remote invocations.
> +
> +User-Space API
> +==============
> +
> +The driver exposes a set of DRM-compliant IOCTLs:
> +
> +*   ``DRM_IOCTL_QDA_QUERY``: Query DSP type (e.g., "cdsp", "adsp")
> +    and capabilities.
> +*   ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE``: Initialize a new process context
> +    on the DSP.
> +*   ``DRM_IOCTL_QDA_REMOTE_INVOKE``: Submit a remote method invocation (the
> +    primary execution unit).
> +*   ``DRM_IOCTL_QDA_GEM_CREATE``: Allocate a GEM buffer object for DSP usage.
> +*   ``DRM_IOCTL_QDA_GEM_MMAP_OFFSET``: Retrieve mmap offsets for memory mapping.
> +*   ``DRM_IOCTL_QDA_REMOTE_MAP`` / ``DRM_IOCTL_QDA_REMOTE_MUNMAP``: Map or unmap
> +    buffers into the DSP's virtual address space. Each accepts a ``request``
> +    field selecting between a legacy operation (``QDA_MAP_REQUEST_LEGACY`` /
> +    ``QDA_MUNMAP_REQUEST_LEGACY``) and an attribute-based operation
> +    (``QDA_MAP_REQUEST_ATTR`` / ``QDA_MUNMAP_REQUEST_ATTR``).

Explain, what happens in the users don't map the buffers into the DSP
space. Will DRM_IOCTL_QDA_REMOTE_INVOKE handle the mapping or not? What
is the difference between those two modes?

Would the driver benefit from using GPUVM?

> +
> +Usage Example
> +=============
> +
> +A typical lifecycle for a user-space application:
> +
> +1.  **Discovery**: Open ``/dev/accel/accel*`` and use
> +    ``DRM_IOCTL_QDA_QUERY`` to identify the DSP domain served by that
> +    device node.
> +2.  **Initialization**: Call ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE`` to
> +    establish a session and create a process context on the DSP.
> +3.  **Memory**: Allocate buffers via ``DRM_IOCTL_QDA_GEM_CREATE`` or import
> +    DMA-BUFs (PRIME fd) from other drivers using ``DRM_IOCTL_PRIME_FD_TO_HANDLE``.
> +4.  **Execution**: Use ``DRM_IOCTL_QDA_REMOTE_INVOKE`` to pass arguments and
> +    execute functions on the DSP.
> +5.  **Cleanup**: Close file descriptors to automatically release resources and
> +    detach the session.

I'd have expected the description of the actual example. I.e. clone the
app from https://the.addr, prepare clang >= NN.MM, QAIC (https://foo),
run make, run the app, check the results. I'd remind that DRM Accel has
a very specific requirement of having the working toolhain in the
open-source.

> +
> +Internal Implementation
> +=======================
> +
> +Memory Management
> +-----------------
> +The driver's memory manager creates virtual "IOMMU devices" that map to
> +hardware context banks. This allows the driver to manage multiple isolated
> +address spaces. The implementation uses a DMA-coherent backend to ensure data consistency
> +between the CPU and DSP without manual cache maintenance in most cases.

GEM usage?

> +
> +Debugging
> +=========
> +The driver includes extensive dynamic debug support. Enable it via the
> +kernel's dynamic debug control:
> +
> +.. code-block:: bash
> +
> +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_debug/control
> +
> +Testing
> +=======
> +The QDA driver can be exercised using the ``fastrpc_test`` utility from the
> +FastRPC userspace library. Run the test application:

pointer

> +
> +.. code-block:: bash
> +
> +    fastrpc_test -d 3 -U 1 -t linux -a v68
> +
> +**Options**
> +
> +``-d domain``
> +    Select the DSP domain to run on:
> +
> +    * ``0`` — ADSP
> +    * ``1`` — MDSP
> +    * ``2`` — SDSP
> +    * ``3`` — CDSP *(default on targets with CDSP)*
> +
> +``-U unsigned_PD``
> +    Select signed or unsigned protection domain:
> +
> +    * ``0`` — signed PD
> +    * ``1`` — unsigned PD *(default)*
> +
> +``-t target``
> +    Target platform: ``android`` or ``linux`` *(default: linux)*
> +
> +``-a arch_version``
> +    DSP architecture version, e.g. ``v68``, ``v75`` *(default: v68)*
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

