Return-Path: <linux-arm-msm+bounces-93842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL1hB4PYnGkFLwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:45:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB3617E888
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 417B33043D50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 22:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2957376490;
	Mon, 23 Feb 2026 22:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RxwZI8N7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGlrrlUs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818A837B40C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886705; cv=none; b=RhDLOjve4blyHIcDisEKmsamcxTucSs7hax0aSlwNqsQdR5StGR1badkLN2rwmutDEnYZ9gkKTJL9QOBkmTP7pR+koIW6x5zFd8+ZuJwGtwhCr0M9tXN/XFFiHvoowNphkPGn2AEDC/s2tlKKe0cS00qocWiYX2KXmXApDjERxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886705; c=relaxed/simple;
	bh=TdtJJEcR36eOIcMiT4ZO5zoHynLWdppAn7a7AhllwY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEm3jVUJ85DG/aJE2/f+JZ+gQ6PdV6nO/aTTa/m20C/WrIRi1XAF3uEG5K/vzJ9goZDZfLQAdyjrTN5spaVoD6dTMA94Nx5KweVtwq9ltFMVg5cMQJPFXSPQjx0AaKKEsWqm72BolE6OEyWjmiPXTssslxXuBl9ddQsyxkeYHdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RxwZI8N7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGlrrlUs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NH0urA109958
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4uwG+VSOUPiQWFQC4n/buq2e
	c1Jxta6TBA66E35NxDU=; b=RxwZI8N7h8IyqIggGJxquVH3UCDbV1q5LiSJ+ilt
	DdciWWZZ87rygoZLFTX7IFnxwhjw3a2NekubPTReBbZdvT5/4SSjyEZb+WDNYh8A
	WQ8gdZL650EWkFAtysqxYKeuW8qApHFcT2N74xuR4TKihkr/XGpCrAqdNYDAxs/1
	NT49p75lSokhEFFtzG1AVZFQmoeq3548hEiK7Iw7IhrArm4kDLXTLXWIURFHHJWi
	f4G+rooV2wwz+HpS0+nJec8gygbF88Xa8UpYvzXt/UceJ+BeoiwcqyxKG4b6W0ho
	FxvSAPylmmsj5J5FZAGJVokXdrAbR8YEUY10TUTO78Pghg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtx08yba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:45:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8946f51b8c8so324936936d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771886703; x=1772491503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4uwG+VSOUPiQWFQC4n/buq2ec1Jxta6TBA66E35NxDU=;
        b=BGlrrlUsaYnDNAC13g45zk3eXYZ2UD8zpmT2ba0Mnq+SduTNYLA1DueMIBUQBlqqSA
         l1JObMWhNJ3mhCLLiZXflHK4jGVzpTWJsPAYVN0ogCSDUg22YXi8oHCQDrfguxOVI4zH
         OTTRei76I9AdItGDAm+gKbcvzQib/ONe+C2Wc8xlzJy/AZ1O5h3GUusWysNiGshu++R9
         MljHy2UaTtIzWH9WrX86GqN8R7M5gd4vZXx1WUyLEgC2pPFvxnSYoQkl7lo51xw8hMe8
         TttKn5JlIsjLQ91mPyS9tF/QAXi/EIRn3TwKk9NKJIr1UZOZ2pX6ixUexVd75OOLBYda
         jNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771886703; x=1772491503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4uwG+VSOUPiQWFQC4n/buq2ec1Jxta6TBA66E35NxDU=;
        b=E9xJ0NkxEUvFuzwfXKrWci6W67w74mF/GFoSF1p/TbU0QuvtFMC+hJEa6bEvZckBFg
         xArNkC9a7gabx37DugrUh8jauZFd/1ZvAMNKmxfnxyq7l7EMmxSJIEsLqCinjOOtdIYJ
         MSHYxZJDkjlZuYIS464XMnR/jQU6DzpkdH4hBLWGdd4T2FVEjCPvDdgEmT9NXUY2eW6O
         DTzOw2jytv/ZTdn8Z8nOukucCd83V+mnKJVkgzotCbXiSCuqOKya5lXV3itqGon3UdXD
         bUpraUd1OTWvFimNQ9Vs5t81ydd0T6sVhbbIZQqAo6kfmzkKtIh4aYd7k9KRXUpauc/P
         Yk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNGoqfZDUR/NOQrHqBwA9t/Y05F13/HbBInhy0pHT1EQMnzgtVkZBTtM/JTzvMdQBUqL4e6PDgZS1mcmKZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/oTWmHR8kngXgKH6HLTsHS/Y2msdi7FtBVblpYSR49qvP22SM
	97CMGY26nAd9GMGW5VTCj4dplCCu6uWsGO9eJYIH7NVGNp52Tz0gu2ZZUrv84fk/ESjgZBiDQxw
	veglNw4Sc/e8N5AWDVMGvG9YM7AL3nI8+oLm+zNteQljpqJRj5aye4Fj4Q4wINC94Q9l0
X-Gm-Gg: AZuq6aJ9VdvF17gcRU4gChJKfPawzMEZZ17VRYjd9Fl6TEdxhW3mHLbl0+ALoLZ8udD
	nJxjQqzJ8WLcOq2ee24YEDjmYG8QF3s+FWigFOXLbnHqhr9aHMxmhbFx93HD+P8p+dL6m5AmQaD
	fkKyo8o/S3Xj104nSov+u39Kf2Q7oBwjVNAFQ0rbCifLNTEBhcF9vcK/5povgiwws8hxvfcHyK9
	apzwg8t2ZnjHTz28Lw2AIusFjif8GRt0A0Uj3Sbm0URhV0Dc/ftMyvyG9ZYhC3FzoRP3ZuQRX2r
	nwaitdhjowA3jJVzdw1m7E8038KZxKEf86ZMQ6Zpfi1XfmXX1zsM/0yM9U11VklAWNtq23MNB9O
	4W/8US3l9Mw0gz7vM/C2XZJzdaXF1z+Acg8EJPNDsA3CffvASr4LxkdBl/zmZFbLBYR5aNvJHb+
	8PKqTeF1MmCPyF3i/d7IFzNem0YN0GhqnIWf0=
X-Received: by 2002:a05:620a:4727:b0:8ca:2bab:a0f9 with SMTP id af79cd13be357-8cb8c9dfd2bmr1406786585a.1.1771886702342;
        Mon, 23 Feb 2026 14:45:02 -0800 (PST)
X-Received: by 2002:a05:620a:4727:b0:8ca:2bab:a0f9 with SMTP id af79cd13be357-8cb8c9dfd2bmr1406783685a.1.1771886701837;
        Mon, 23 Feb 2026 14:45:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb3e9a2sm1832057e87.55.2026.02.23.14.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:45:01 -0800 (PST)
Date: Tue, 24 Feb 2026 00:44:58 +0200
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
Subject: Re: [PATCH RFC 04/18] accel/qda: Add built-in compute CB bus for QDA
 and integrate with IOMMU
Message-ID: <ox7jnqkjo3frhbgpp63sse7ram72obihe4qlbbn4z22wbw4szr@7pzoeecdvsyg>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mNqjyVmLpw3Qq7A-A4Z0cSg-uv77ssmk
X-Authority-Analysis: v=2.4 cv=euvSD4pX c=1 sm=1 tr=0 ts=699cd86f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=m81VUDHjpZwfiQc3ckkA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: mNqjyVmLpw3Qq7A-A4Z0cSg-uv77ssmk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NyBTYWx0ZWRfX+wuZD9xa6A2X
 j1a3bQRXqyD9dnx7Kdblwdfr9YNj2BdpyY7mO3rlvf+NGIhcbpMJ+FTqCChldAoXuraVZB/bYOv
 cWfO3wgnR6bC8M7MfKZcUWe5vR/XMw2kWBcn8E08skI60XZB0/qvFWgz3DN7m8c2ErtF3LDvOTN
 eWZfIdSay1m+m272Oe/dKZYROsqDRSLSR4x1WafVD+KUHjeRw+GpLn9It+F4jxeSHYIHq7LtGei
 WA1LJqr0zgUJU5k3a74dr4U2BkkzHpBfyoc+qN5/VqTyM+Ua/bBOSmkSdmuDf+ZKf+JJQ8Ve8Nx
 YbNehjQM+2FP1zeKlurnfd0gqjRpedwUFu1AnAWXdWWz25cS1jS9Y9JgFCGFjINDrZaK9Hdxtnn
 pVHvMGR94QFBIyNDdxzRaFjYge6L6IGd/gccM1pvLaUSKu2C7lRsroa8JOnFyt+mGFTyhZ927fO
 9vSoqSb562gKNJPuq7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230197
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93842-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DB3617E888
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:38:58AM +0530, Ekansh Gupta wrote:
> Introduce a built-in compute context-bank (CB) bus used by the Qualcomm
> DSP accelerator (QDA) driver to represent DSP CB devices that require
> IOMMU configuration. This separates the CB bus from the QDA driver and
> allows QDA to remain a loadable module while the bus is always built-in.

Why? What is the actual problem that you are trying to solve?

> 
> A new bool Kconfig symbol DRM_ACCEL_QDA_COMPUTE_BUS is added and is

Don't describe the patch contents. Please.

> selected by the main DRM_ACCEL_QDA driver. The parent accel Makefile is
> updated to descend into the QDA directory for both built-in and module
> builds so that the CB bus is compiled into vmlinux while the driver
> remains modular.
> 
> The CB bus is registered at postcore_initcall() time and is exposed to
> the IOMMU core through iommu_buses[] in the same way as the Tegra
> host1x context-bus. This enables later patches to create CB devices on
> this bus and obtain IOMMU domains for them.

Note, there is nothing QDA-specific in this patch. Please explain, why
the bus is QDA-specific? Can we generalize it?

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/Makefile              |  1 +
>  drivers/accel/qda/Kconfig           |  5 +++++
>  drivers/accel/qda/Makefile          |  2 ++
>  drivers/accel/qda/qda_compute_bus.c | 23 +++++++++++++++++++++++
>  drivers/iommu/iommu.c               |  4 ++++
>  include/linux/qda_compute_bus.h     | 22 ++++++++++++++++++++++
>  6 files changed, 57 insertions(+)
> 
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index 58c08dd5f389..9ed843cd293f 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -6,4 +6,5 @@ obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
>  obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
> +obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda/
>  obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> \ No newline at end of file
> diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
> index 484d21ff1b55..ef1fa384efbe 100644
> --- a/drivers/accel/qda/Kconfig
> +++ b/drivers/accel/qda/Kconfig
> @@ -3,11 +3,16 @@
>  # Qualcomm DSP accelerator driver
>  #
>  
> +
> +config DRM_ACCEL_QDA_COMPUTE_BUS
> +	bool
> +
>  config DRM_ACCEL_QDA
>  	tristate "Qualcomm DSP accelerator"
>  	depends on DRM_ACCEL
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on RPMSG
> +	select DRM_ACCEL_QDA_COMPUTE_BUS
>  	help
>  	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
>  	  This driver provides a standardized interface for offloading computational
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index e7f23182589b..242684ef1af7 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -8,3 +8,5 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>  qda-y := \
>  	qda_drv.o \
>  	qda_rpmsg.o \
> +
> +obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> diff --git a/drivers/accel/qda/qda_compute_bus.c b/drivers/accel/qda/qda_compute_bus.c
> new file mode 100644
> index 000000000000..1d9c39948fb5
> --- /dev/null
> +++ b/drivers/accel/qda/qda_compute_bus.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <linux/device.h>
> +#include <linux/init.h>
> +
> +struct bus_type qda_cb_bus_type = {
> +	.name = "qda-compute-cb",
> +};
> +EXPORT_SYMBOL_GPL(qda_cb_bus_type);
> +
> +static int __init qda_cb_bus_init(void)
> +{
> +	int err;
> +
> +	err = bus_register(&qda_cb_bus_type);
> +	if (err < 0) {
> +		pr_err("qda-compute-cb bus registration failed: %d\n", err);
> +		return err;
> +	}
> +	return 0;
> +}
> +
> +postcore_initcall(qda_cb_bus_init);
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 4926a43118e6..5dee912686ee 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -33,6 +33,7 @@
>  #include <trace/events/iommu.h>
>  #include <linux/sched/mm.h>
>  #include <linux/msi.h>
> +#include <linux/qda_compute_bus.h>
>  #include <uapi/linux/iommufd.h>
>  
>  #include "dma-iommu.h"
> @@ -178,6 +179,9 @@ static const struct bus_type * const iommu_buses[] = {
>  #ifdef CONFIG_CDX_BUS
>  	&cdx_bus_type,
>  #endif
> +#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
> +	&qda_cb_bus_type,
> +#endif
>  };
>  
>  /*
> diff --git a/include/linux/qda_compute_bus.h b/include/linux/qda_compute_bus.h
> new file mode 100644
> index 000000000000..807122d84e3f
> --- /dev/null
> +++ b/include/linux/qda_compute_bus.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QDA_COMPUTE_BUS_H__
> +#define __QDA_COMPUTE_BUS_H__
> +
> +#include <linux/device.h>
> +
> +/*
> + * Custom bus type for QDA compute context bank (CB) devices
> + *
> + * This bus type is used for manually created CB devices that represent
> + * IOMMU context banks. The custom bus allows proper IOMMU configuration
> + * and device management for these virtual devices.
> + */
> +#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
> +extern struct bus_type qda_cb_bus_type;
> +#endif
> +
> +#endif /* __QDA_COMPUTE_BUS_H__ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

