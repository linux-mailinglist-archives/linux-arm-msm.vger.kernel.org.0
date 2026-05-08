Return-Path: <linux-arm-msm+bounces-106736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P7TEb9F/mlFogAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 22:21:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A194E4FB6F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 22:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3F30301FD6D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 20:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF603E5581;
	Fri,  8 May 2026 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAe7u21T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9x2Pb9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88B5303C97
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 20:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271614; cv=none; b=SC2bP0h6T6DIxHG7f/gYVSrU3zKJ8VT15nZ1uVPA1eE9wSTUzW8ZaXNbpxWzcLSviuaDHrjHwdNLmxTE/ezL0Jnq8lP6UJ8xyRPAhFnwxc/o73N1FjWdZOi5TvAQwLBrZ4gEQqG3g1YFyqHtJ5GKciKxqtbUrzfxWyfntzmqTIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271614; c=relaxed/simple;
	bh=2ttoDRFvuARsXM73aSa/iyFGnllYGs0qVza3Mt5VlKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNtJA1/lxKRBzyhHhm/6TvxiWFUyUDewpE2S0CU2q71g93sSJZiltiDLnS4PZwAMFvTuAEXCqQseYPm57vUk54Gh0YfmKyTNzVlaQYncUUhgw/6CmeodqB49XYHndu1Fz4tDHRb4bKfYzkgkpwIkdwEGcdR2bdeYh9K3ZLdV0/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAe7u21T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9x2Pb9b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G52wl1116771
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 20:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eo2cOr8LDHMQe3YBBwdT+ufW
	1HrZes1kP3AFsqymXKw=; b=VAe7u21Tk5sv2zpIwGJ6bUhWuVUFeT0XndTet4P+
	9Eep8twjpYbsFCH2JKEciZfmJcwDe1taNnOnwCqsWZJWgC3YlrQVZ408StwSuWgX
	AIkvLpZqWnCbTQfcH0AopSeFsBa+Eynnf0ZYCyZOes2qNHLDCBpmBJyyPCM0b3cA
	mry54d3Pe7BJoKVK+wsJwgb+RAG/dsROP/9thN9+2YLzHjeAGsyDYSoxtOVzPsgb
	ZevysEOhlcZZ9fCCwcdi8+/mlvExcXn5rW+U9HaSK9T5o7bendZqUueIzI0+rIXC
	OtjHNY5JTaWS/jBSuaFXWvG3ZnCu0RgND2tvlu2E1vaEiQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1pgtqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 20:20:11 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95d2ad5df14so3891521241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 13:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778271610; x=1778876410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eo2cOr8LDHMQe3YBBwdT+ufW1HrZes1kP3AFsqymXKw=;
        b=B9x2Pb9be+0RerTSX5QeZiPfQj2OZNhIjiqVa7eCf49qUlnFwH3tGM2SkGlbQRXr0M
         bBu4e+RNcVwdvmM3ZjNwHKVJp7tqAE8ZKOlldW36yDCji/kyjfQsfT07JWFCINkezSrw
         EsSuM48bjRlqGg5irFg386HoXw0mGQPhkcK4vgTitoxaHdnrvaEbvkljLRF0jTzrmO9u
         erEyve+L3dVqy+AObn0kZuAmyXrZ5NhmeIru0C6JWH8h8qIgw30l7oSW00sGpzvd3+YK
         dsNw7ACoUDt2r+b580qiv+eeKDXU1mkpCAiv1Lki2QvWsKpbWavg1QlpNE5a42UThJ5G
         2SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778271610; x=1778876410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eo2cOr8LDHMQe3YBBwdT+ufW1HrZes1kP3AFsqymXKw=;
        b=AKvQjhKYTjhnzUmmsLkpeDvyza+3qNNodiwdZ7NY1+hKfpTyWlhw/nj0/BP6u5o9p9
         7wWD04wUWW9LOwvAGdJZorhmdrXjvEZk3CoVQv77w3GQvhE6UhMnwNwYMRwRDa4DIurk
         qX7GGOsRC/KhOXOwYc4/bNnpGsejOtFasNDsd8s1cPwPsko+LtSs29w+A23sXLedDs+g
         PAhViMUsnxvq9pfrO/C+9cdk+A1JatmJ1/kAyjEPNmW+eULGNO8PD1FI4DKtTZO7lNzx
         aNWTbz1i/5uioU/cRe+7yIAbK9x2GCRMdH4M+l/WCfa3/n2AzuQUAMKmQlTZIdPAeIZp
         jnxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DQ0TVeppBEmZOko/gPtZ+p6ryJBjkQVYDZrGjNQhTXik7tINeCCMN6ENwwlY+oqrEyLlePb+pJpU6QAMR@vger.kernel.org
X-Gm-Message-State: AOJu0YwShdm815rJRtuu/0rleRWwLKOmOeKTDFAqdSm3bnubcWIDZprx
	SWP/NgARfuQGtpRnDRcMeW3aMcdAy0ppdKGVuCC1SVNc6StfLcl6+wARE4b29debJ7UDGBJB+kN
	z9cHKT3T4NJn4c4jFm7c8UMDSDUmXGWtq/Z91EIpCHXSWrdQJ9JKrL8ctFqLzUwjlXeBS
X-Gm-Gg: Acq92OHa7/TdSjcqe45vAb2ya5Hy+mdWBnTWYLZHjM34squjJ2RD1Mn2aH+2wO+TLXC
	YXr7NYiYKXPpr/GpQyD05U2RXue/+6qtJpXyx9onHMY+MYrFeMsKNuAoNF5ZRauD6Jl8QN8HNl+
	20e47AHQSTq/sMUDQUyXdgFUQeF1BgWi6zp1Q4w/3aGLrpib3MGXLx9VXStxKS5gkHT4EQwM2kS
	w46fEj/HNhiV3yKb2o/dQUAeWMLBm3CuGak3yM15RKmaZ2SvyRE+rX2EvhxcuwtqzfeSRA+I8jZ
	o08ssYHzSbyHp8fqU+8Yt1UkOOt7JHs6VQxBY8Od6ibqsclfQMeYinnQHG1VuE8hSwJOPes+k55
	CZzL5lK9ttop/47IxmI/sh2VaeiK2f3WzUPcoLnzFsFB4ECgG/vXpAWbaUXT+6CCuRsYKiKYZXo
	4mtJY4jD18RqpQ4NeRv90R6+aobGOGqiGAhbk=
X-Received: by 2002:a05:6102:580e:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-63141fa0939mr2402770137.29.1778271610172;
        Fri, 08 May 2026 13:20:10 -0700 (PDT)
X-Received: by 2002:a05:6102:580e:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-63141fa0939mr2402741137.29.1778271609727;
        Fri, 08 May 2026 13:20:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm797786e87.45.2026.05.08.13.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:20:08 -0700 (PDT)
Date: Fri, 8 May 2026 23:20:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <elhlmmmisecn7vylpsboiicn7dn4umrggktabyixthmevdv7eo@a4keayee2um7>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-GUID: 08hZLe8k1bvVzYX965rAfR-6sPJiq77X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIwMCBTYWx0ZWRfXzinaa6NKaHRO
 Ypon6nITrqw4G7K+6o4OS4rFM3MdXbbuRflRbBsYVogCFeNnD7kw5P73PeKEpLZc5OdqxJ5XeZu
 2OhnUTL6xHjgdLGd0rBMk47FzNoe7PirlqcJSEYrI+4nE8E7BbEtF0gwIyjcMY09RjzdOS+Tk+j
 pyHKbx4iBEc4CptNAJIURX7d7MCtSQMdFKfr8ZjFR5DEomDvr/9A56IPozGCMZGZCAxK0WF2gLS
 +mMX1Vn1sePHgTJnqGz2qYdbPiS92cQTEq3DPriyW9KSQHWonGuEM72SG2zCNjbtCvWF55+ICQ9
 +uTjp0bS8xydpMrJfNR2O2C72p7owF8pV3zM/Y3qI/hPpFNqaUX6X+mkeSaxaPVaVXkWsttm+fo
 h87MxiftDoDhf9lDQ8tvByXRwuf6mhAlB8Q+6nxTfhIuI2gAUmnoVIe9/UK/CkuRmcZ35RZmpK6
 +HmI/MwYvh57xK1PSyQ==
X-Authority-Analysis: v=2.4 cv=COwamxrD c=1 sm=1 tr=0 ts=69fe457b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=BowHXwPdtatiOUMbaTwA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 08hZLe8k1bvVzYX965rAfR-6sPJiq77X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080200
X-Rspamd-Queue-Id: A194E4FB6F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106736-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:29:56AM +0530, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> or QHEE), which typically handles IOMMU configuration. This includes
> mapping memory regions and device memory resources for remote processors
> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are

No the calls to those functions are not intercepted. Doesn't hypervisor
simply implement the SCM calls?

> later removed during teardown. Additionally, SHM bridge setup is required
> to enable memory protection for both remoteproc metadata and its memory
> regions.
> 
> When the hypervisor is absent, the operating system must perform these
> configurations instead.
> 
> Support for handling IOMMU and SHM setup in the absence of a hypervisor
> is now in place. Extend the Iris driver to enable this functionality on
> platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).

I fail to identify, which changes correspond to this description. If
it's about the PAS context creation, could you please be more specific?

> 
> Additionally, the Iris driver must map the firmware and its required
> resources to the firmware SID, which is now specified via iommu-map in
> the device tree.

Why? You miss the most important part here.

> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
>  drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
>  2 files changed, 66 insertions(+), 10 deletions(-)
> 

-- 
With best wishes
Dmitry

