Return-Path: <linux-arm-msm+bounces-107328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOy9JmyDBGrVKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:58:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9067E53484E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0D6930015AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DDC21B905;
	Wed, 13 May 2026 13:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erl5IoFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aiz1A0Sp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8663F413C
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680048; cv=none; b=FhNhRoOdQUoUfN+BaEJNyHaQC0pFWM2b+0PzLkmyziKLq89S80y3tQC43L87DbzzgzTISSQLjnVwmwvK9DZCMbq1LktEFMM4vkhc88JqgPAUD82VCypB+UG5l3US7EQ/zDjJpc/SYQPAXTVwApcfSFaXzE98QYpESAsDiFHP6Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680048; c=relaxed/simple;
	bh=PFMRWD1DzQUsbBzuHK/L3Y9G3Gpl6I9x5VQNYXCV6uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRL+gdSTvosG7TUpiHgbGFK+oeVFQezky6XzyMfeqK/3i2fwxpprg1fUOIofGIhzu2clsqHNIy8ioF8f4RwM7M5oZk0JuLelw/G1EADcgVZURqKrKb+DtVw5pPB56O7Yu4Edj6V8eyf++LD1QdxaycTQXBuVx7l50IQx85peU/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erl5IoFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aiz1A0Sp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWox9978342
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gF9m9TlU439Pia82PPMay5Pd
	uiP3AVmilaTFV8rnjwc=; b=erl5IoFj7hZmKlle1t2SU1AbF7+yoZbDYxwXbYoc
	WcN7vE88IQs9T5qa0B7guptaUFApBLVZsT+3baHrTtq8jT52vl96uSK/rLCPq0WJ
	lzHUhbyg7lLerNL82KxLoIrVwy1D48aOFoQwRNiqg/kBzTdE8H7tALci44lMt43U
	cv1KUhlTw5oRGwJKGGDXFKbZ+VZg045glNAqNLORKRV2hZclcMDGJsLHSrBXgTWj
	JzNwhukw9hpl1MqT4aEw1WlK2+Kwt7UEuscfcrUffESGFLg9q5vGQZzsCxkI4Klp
	NFVTfMXdMFLeyBiZZFVnDO/s7yUJvJ+r4P+7xHRtKQmSsQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9vgpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:47:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6312af106fcso9665189137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680045; x=1779284845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gF9m9TlU439Pia82PPMay5PduiP3AVmilaTFV8rnjwc=;
        b=aiz1A0SpYBEPgKyIaq5jlVTKgN/9Nq4DWrkyt++xyRiKhY5g5Ab5ds8yoWYGVKOnZZ
         bpWqpQ5UV/Bo1EGONL83muKJxrGL7hUaZZ/T1/kuFr7AMtwZ3/wIe7JbujVrJKP9IKSg
         TmwzZYTzCfkLFwiicaI5wvT75tKaodSO9S37adgSrTsqyfQtqBzpLXblc5xdVgturOld
         MSmrDGykRFHJ8fZVXEv9LZPzG4YkJybP0nb41cqYQQWJv0xXK/WCH4D+9u3twh0bV2dG
         8NqgW+5Bi1sICG0+YyreSvde7jhDF/BA0Iwfdakthk3rjBM3pdutum+2J875PcqwYdGQ
         tIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680045; x=1779284845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gF9m9TlU439Pia82PPMay5PduiP3AVmilaTFV8rnjwc=;
        b=UNqqIQgbD41b2l6t7wcmJy+V0RsEt2sDirzIAFy5tJvnokFtugefuPVb/+0XzeTyVw
         ekPEyvUaqvz2aL3SWJI76T3ZAuFUXtAZSuo2LNQCzuSu9b2i4wOnMZx2OWjBLs9UmXuN
         sPM1i0S/HIYRIa0FSaTK4nRAXsyiiQncXyuKZpKM9S437iApihmmduc7f0ICYygpcSFz
         oUIMybvGl1nj9ZjyQGbtcGXdHtloYzpFQHUXte+ufDhcXdtkDXnvvGAh8EdbqHxX6bel
         grIAXi/mrdsBN0qZmkUfScIL/XTIvNqvs5D/NEFPY4S0JSDISq0mGboP3QIhVvMFc34k
         9cZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kLuxgtIW59ef9gk5z0CkgFfbVBzpQY9F9MLtaMpFEB8ds7mfJTrsfSocC0YkiKYvrSO6A8AjtAgP1BN/u@vger.kernel.org
X-Gm-Message-State: AOJu0YyX/lx34hvCelEpOb8JMcpJUD4SEDEQ4po/9cadjc6g6Kw0/5zg
	PnXg8/pOmxnmUHOCvaOKaRkyiloO/l8xvvHT2cp5tjIS4ikmNF918R1x93ZrI0Z0hLKEUwfq1ox
	2kOGzK9Gs5xK5zJEoy8JKY4Zxn29nrfbYvnAkRu9qLSwM/7VB93at1mL8eihlMRyRoZh/
X-Gm-Gg: Acq92OH1/+LidlxKfhDFEK4LPs71VSjnIkkn2hNeSpjEk3CWXnCBcankit9MoCa/tmc
	bBNOo88vIa0I7GIFYUfYzQerUeYbkRV5yM87iAbhlSn1BcV7mvGYxc7H130tKkipcYaby1+d/eM
	v/0kMqDyEYyVw+fH3eC+n1RcFnntT3cJJu93dDSk0KC9Xfvvo4hslh9zshLStoM+Sj2dQPabzcL
	cQovsE339FzAuuyu4+SSPpDKEIOif6S0v6fk3EPbwvKl0heYvK35H/V7f2xw+/2R7spNWbb1BFY
	irWeXudzSTJPMt+XP4PpJ+BuScKmxOM+QbKVLYViV/K2+ZLhoYhUAwRCQ4y8k/7Mk7H3zUc2wWt
	zUqU2RSLh/6G+IDmEHkG3wZIJ9vHYq/Y2q6cDRUGUGTtqdIyAjt5aF92RT1Ya+bS5A1QZ5BYV0E
	OUcqtEzQaeNSF7BvCI3+3AbcCGq2rBAaZmhrM=
X-Received: by 2002:a05:6102:1512:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-637a6c28831mr1286297137.2.1778680045491;
        Wed, 13 May 2026 06:47:25 -0700 (PDT)
X-Received: by 2002:a05:6102:1512:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-637a6c28831mr1286271137.2.1778680044935;
        Wed, 13 May 2026 06:47:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b225sm4025242e87.83.2026.05.13.06.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:47:23 -0700 (PDT)
Date: Wed, 13 May 2026 16:47:20 +0300
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
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
Message-ID: <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
 <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
 <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MiBTYWx0ZWRfX8aztT9oBH0Qp
 HwuZP+RpeDWwktll0y16R4Rk8nzo5UMsXvKrxDuhJ98kg3w7ZW115tiWEgddy3db7HuBDg8FKeR
 70wm8t+DHpvgPZ9AUbodWA72enXukF7rLm6ymLipBJ/9oCjUVb5AURCDlC+OH94yzfXiwz0SIMS
 rswQAXdRGSnxZSBc+lOuU1bilHD0aFM4Z5ucqf9/qdOlIcM1CquIh+z0nT4m9HcwoPtuKpE4Oo8
 Je7yeyzxr9+yjiSLsSpVKXYGsRkIICw/yraaNua4WQaRFhgi/LkUxxWlsjIGell9yRrAN6WY7DT
 7VU1ACkOpAyAY89GFuY9PZO5WYWEAFn4b/uEYSJK+Q+MLEoucAKpHBRdCaERN5xrfU3tno63Rj/
 t1Ys2Pe5LfHzTppEfo5tvgLe1Av77q+5ehc5NoxYN/6rvUV6pTH6xKGjE8E7HET3rh2gO86pdlY
 h0LYqfJb+NEQaqtQCYA==
X-Proofpoint-GUID: qwT18ZxbLBZNbWAb9osp1xVii-22PSXe
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a0480ee cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=T-6Eqvt1JYRBjGg4ocMA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: qwT18ZxbLBZNbWAb9osp1xVii-22PSXe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130142
X-Rspamd-Queue-Id: 9067E53484E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107328-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 10:37:20PM +0530, Vishnu Reddy wrote:
> 
> On 5/9/2026 1:52 AM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
> >> The current clock and power domain enum names are too generic. Rename
> >> them with a vcodec prefix to make the names more meaningful and to easily
> >> accommodate vcodec1 enums for the secondary core for glymur platform.
> >>
> >> No functional changes intended.
> >>
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
> >>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
> >>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
> >>  .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
> >>  .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
> >>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 21 +++++++-------
> >>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 +++++++++++---------
> >>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 33 +++++++++++-----------
> >>  8 files changed, 67 insertions(+), 63 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> index 55ff6137d9a9..30e9d4d288c6 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> @@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
> >>  extern const struct iris_platform_data sm8750_data;
> >>  
> >>  enum platform_clk_type {
> >> -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> >> +	IRIS_AXI_VCODEC_CLK,
> >>  	IRIS_CTRL_CLK,
> >>  	IRIS_AHB_CLK,
> >> -	IRIS_HW_CLK,
> >> -	IRIS_HW_AHB_CLK,
> >> -	IRIS_AXI1_CLK,
> >> +	IRIS_VCODEC_CLK,
> >> +	IRIS_VCODEC_AHB_CLK,
> >> +	IRIS_AXI_CTRL_CLK,
> > Why AXI_CTRL is better than AXI1?
> 
> Glymur has 3 AXI clocks: axi_vcodec0, axi_ctrl, and axi_vcodec1. Using
> positional names like AXI0/AXI1/AXI2 doesn't convey their purpose, whereas
> naming them as AXI_VCODEC_CLK, AXI_CTRL_CLK makes the intent clearer,
> especially when platforms differ in the number of AXI clocks they expose.

=> commit message

> 
> >
> >>  	IRIS_CTRL_FREERUN_CLK,
> >> -	IRIS_HW_FREERUN_CLK,
> >> +	IRIS_VCODEC_FREERUN_CLK,
> > Can we at least group them too?
> >
> >>  	IRIS_BSE_HW_CLK,
> > Is BSE a core or a codec clock?

Unanswered

> >
> >>  	IRIS_VPP0_HW_CLK,
> >>  	IRIS_VPP1_HW_CLK,
> >> @@ -206,7 +206,7 @@ struct icc_vote_data {
> >>  
> >>  enum platform_pm_domain_type {
> >>  	IRIS_CTRL_POWER_DOMAIN,
> >> -	IRIS_HW_POWER_DOMAIN,
> >> +	IRIS_VCODEC_POWER_DOMAIN,
> >>  	IRIS_VPP0_HW_POWER_DOMAIN,
> >>  	IRIS_VPP1_HW_POWER_DOMAIN,
> >>  	IRIS_APV_HW_POWER_DOMAIN,

-- 
With best wishes
Dmitry

