Return-Path: <linux-arm-msm+bounces-108769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kE0VEifFDWql3AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:28:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A176C58FA0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A48FD312E575
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8828F3EA94E;
	Wed, 20 May 2026 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALUpjjFB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkmMI7t3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AF13EC2DB
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286784; cv=none; b=A8fr04ipjvzjQ9aVW04MX4AXMq7ehHQ1XXzDX9efen4KbSx+OptWC5NgO7b3xlal/GBtz3AhLCnZJeECs0vyFzsh+gtkhyvbxd3HmqmgjMYhsmoOrbWkFgROGtrEcSQ8QbanH4g4yhJC0hRoTDnWX4tMnBqTAPe4GaOQXJRPjBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286784; c=relaxed/simple;
	bh=DMTLcSSqYbiNklajRubHOzCvFLHpiGd2ZFM94JYucrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBP2Gj8nnuGCTMJi2KT7ODaCXY73wEUILbn7zYDMU0z8euw1cH8z8iKxSGkTO3PP/BSSGimlGBWyMzliWNrBStb1FXI+ekV7dPi8q1+Q5Fow+4658BuvK2kLW/eb7ClBuCAAIHA2osREmOmY7j0qEcgAnbic+HEhxsINLcZh+sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALUpjjFB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkmMI7t3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oWaB1178224
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjNnASAt5iqKMaT3xE7uUJEpw63hfaVPY06gYhwCG3U=; b=ALUpjjFBst8BY3aC
	gOVk9qIAjwkF0BFDiaZNf9nqmOMsjJs6YBOZjvUYoyjzKJES5I7Bp9/7wErcw+ka
	PTYeKXlYY4eWoga3fIvf3iTh2CJeSoj/e5gh3qPEzZ755lLiqL2uld+bypupgzR/
	5Jklc/hboMwP9hjsGRxAom9Y8z1w8hi0tF3293ei998qkwD7ZZ+QAh4orsZdepl5
	ztd1OxFWfW4p2FRevkhHwf6Bukfbko9l9a5ae13G1ug/Ycoh7ime1IE9ldm4XOe9
	xwxCl0VV+4rZ9WFmR3xSyBuuhTqD4MkHKBSeVhD9ncwVBi+n8mdgyxlm8jox0fPh
	zhtsoQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6rxux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:19:30 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-439e3568bf0so6006635fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779286769; x=1779891569; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jjNnASAt5iqKMaT3xE7uUJEpw63hfaVPY06gYhwCG3U=;
        b=YkmMI7t3MHX9jXG2vOPRpTcMCCtFizY+O4xnLXRAPsEguMTqo/Iiky/6gdU4nHncyC
         qsjxISqc9/XEDhuEvB85A/gGbZ2r7Jf6c931tfePoWGaiR8N5l1NiOd4DlRonfW0SJP2
         VuGnvtOCYc4wetpsLQ1JngElB0lc1NVhTDGR/XrZ7A4SuZsNQBZ5jhFr+WGR38H2KtuY
         Ox90Ff7m5fxyLYgeT7ZAnjp5H+Ldi75ifC5qvXYGIwXdFjXiUU2FqgYaeWsxeEKemG4L
         5X0AGkN6QaKkFhS83AEnGrL7O6h9E42bntpWApX0sF9oth2K9GlHstVU6Q6osAXv9068
         doAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286769; x=1779891569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjNnASAt5iqKMaT3xE7uUJEpw63hfaVPY06gYhwCG3U=;
        b=h9219prCaUM2eXIQuYuFZl/Vjd/Syb14QvxZFlF6sGkA1cg1TEYCAlX8vmW3IpriM1
         Jp39SgpWVMmQAuk0383TilaJE1K0vvYqQcA5QUVre+D6ANfPii4dfjMF7jiPeJ4vRXNB
         UE/NewXCz8FwnsayPxeCVgGBXc45pIcM8c1m8PrO+LTEz46QG2upW4jQpkvCQiA/tCge
         3OpvNuN+N2lMRBjE/cqzCm5EJR7gIZzPYNIi9mcCQsgvrtP/BM+zsMuQ7UtYJjSkzvwy
         k170FYifj+4bKUkIC2KWEnSDJF6EbWut2+73Nd1O9TZqj8wnBEqazojsYLvkiL6l85ts
         z15Q==
X-Forwarded-Encrypted: i=1; AFNElJ+BQg5nUIfCP2ioggorL83kigyunIcUboZ0ks39157eyKttmWynlYW4NxUOu2LjLGN2OgjCWqI3ZtieBIXB@vger.kernel.org
X-Gm-Message-State: AOJu0Yymk9H2KDMYutFam4Rri09lU+45RXs4SiocV/QLwAsIYf2+rimv
	vT2bzW6ZWNdwKVFDkEaXVd1876p10Id+miPftiz4rO7F6DD5wwZLRzVCKtxLoBwpH3yRzoNBtm9
	KIZySnL832jFPRXI5m6GdJ/UjutBX4USEX9Lq9iv8gMnSQl5G6HYpziCtT78NYOU/cHYq
X-Gm-Gg: Acq92OFEhCwZVHoodDhnho837dVD/MxSV7+r3aaeA62Mj35heO8aiTlnm2cnOTPIlYu
	T9KSOm4QEG04qVv434+mtKknw5/B1Wke73K+5uqUitM4EAcyOrNpIg2nQsiiJD14rCQScXrsZ9N
	iaZwGa3+C3ZzjpMwCY6i8EBdWzLxxNw4x+V1r0lK44cpK1CxtYVPl1jAqKfpSH2PhxGG4nZvPNi
	/jnS58WjFI1I0k3SRerqAbFQV5mlSfeBdFbnsQjcz6eJCn02S6Bq8kcmqwC5l08l4qlGeJpH5cJ
	glv4hdAv+DdmFoBg66VG4svUZnFl8rRZ4i2u1p5Rt4ZmMprRLK5pWufJSrfPayKVb74GO4IU7+Z
	AwMRqtlJmlUScPqN/thX89uDdEB+E7nTKjy8X9edcZad7T2IAN1wdOCqeW+yHNzgpJeKoDSwIjk
	fc9r+LaVcgAotKWLkvZ+a/1YHaHjEl6rs7Ofw=
X-Received: by 2002:a05:6820:4b8c:b0:699:90a5:106b with SMTP id 006d021491bc7-69c942f73a1mr14792736eaf.24.1779286769474;
        Wed, 20 May 2026 07:19:29 -0700 (PDT)
X-Received: by 2002:a05:6820:4b8c:b0:699:90a5:106b with SMTP id 006d021491bc7-69c942f73a1mr14792713eaf.24.1779286768912;
        Wed, 20 May 2026 07:19:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc462sm4990268e87.45.2026.05.20.07.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:19:27 -0700 (PDT)
Date: Wed, 20 May 2026 17:19:26 +0300
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
Subject: Re: [PATCH 04/15] accel/qda: Add compute bus for QDA context banks
Message-ID: <gnlpw4ijwtjv43nhcv5iirhjnuc7dntx5vucdrhnxeyznyxa5x@t65o5owldu5s>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-4-b2d984c297f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519-qda-series-v1-4-b2d984c297f8@oss.qualcomm.com>
X-Proofpoint-GUID: _kMw3kGWPKO9pv_Xz3-LVlVxeFkLQbZy
X-Proofpoint-ORIG-GUID: _kMw3kGWPKO9pv_Xz3-LVlVxeFkLQbZy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzOSBTYWx0ZWRfX+ipHxNIluCen
 vGJD4fs3FdDtam0Tb22BpqaWF3gGJgL6o7X75+z9v7t+MG7FcCBlV1ou5MAX5t8oENIv7PuZgfh
 2arxN85+WgT3ZBZdbdGr7Je94XJ4E1rt+udiYjQUp+e37zMUN46eqVrnW19SvwjveqFO5TGNT+f
 +4B9rOaCiJZaUBzwBp4QHz+4wBKZuVsHVE+4ru3c5++A6wV83Dp+2mTrain9DOQ0xotJZ8Jne79
 XTZOUJcd4Z5HDKEbpKfQLT8oEzUG83FvfGcaV7scI3xiMmKUNTgF5iUPyC/V+r81tsAkU1Ni7Fh
 u8Ax4QVoVYsqa9CpUK5OFinD9OhYv1lsi3MFivOCSGT3tHLzzcFNrFOpu5ltK7LzlSGkwUd2q49
 eONNkcUmULkaRQNTXsISuwAxJlg0An1fnU0MWjxS7z/c5C4UuQC8DG/S0dn+2YqhxJk0pwQJQjC
 dJ789kkA4Uqf64cII+g==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0dc2f2 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=cV-vn9ENGD0yosCfWX4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200139
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108769-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A176C58FA0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:45:54AM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Introduce a custom virtual bus (qda-compute-cb) for managing IOMMU
> context bank (CB) devices used by the QDA driver.
> 
> IOMMU context banks are synthetic constructs — they are not real
> platform devices and do not appear as children of a platform bus node
> in the device tree. Using a platform driver to represent them was
> therefore incorrect and introduced a probe-ordering race: device nodes
> were created before the RPMsg channel resources were fully initialized,
> and because probe runs asynchronously, user-space could open a CB
> device and attempt to start a session before the underlying transport
> was ready.
> 
> The qda-compute-cb bus solves this by allowing the main QDA driver to
> create CB devices explicitly and under its own control, making their
> lifetime strictly subordinate to the parent qda_dev. The bus provides
> a dma_configure callback that calls of_dma_configure() so that each CB
> device gets its own IOMMU domain derived from its device-tree node,
> enabling per-session memory isolation.
> 
> The bus type and the CB device constructor (create_qda_cb_device) are
> exported for use by the QDA memory manager.
> 
> A hidden Kconfig symbol (DRM_ACCEL_QDA_COMPUTE_BUS) is introduced and
> automatically selected by DRM_ACCEL_QDA so that the bus initialisation
> runs via postcore_initcall before any QDA device probes.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/Makefile              |  1 +
>  drivers/accel/qda/Kconfig           |  4 +++
>  drivers/accel/qda/Makefile          |  2 ++
>  drivers/accel/qda/qda_compute_bus.c | 68 +++++++++++++++++++++++++++++++++++++
>  include/linux/qda_compute_bus.h     | 32 +++++++++++++++++
>  5 files changed, 107 insertions(+)
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

Ugh. The previous line should be enough (but don't trust me).

>  obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> \ No newline at end of file
> diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
> index 484d21ff1b55..2a61a4dda054 100644
> --- a/drivers/accel/qda/Kconfig
> +++ b/drivers/accel/qda/Kconfig
> @@ -3,11 +3,15 @@
>  # Qualcomm DSP accelerator driver
>  #
>  
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
> index dbe809067a8b..424176f652a5 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -8,3 +8,5 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>  qda-y := \
>  	qda_drv.o \
>  	qda_rpmsg.o
> +
> +obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> diff --git a/drivers/accel/qda/qda_compute_bus.c b/drivers/accel/qda/qda_compute_bus.c
> new file mode 100644
> index 000000000000..c59d977e924d
> --- /dev/null
> +++ b/drivers/accel/qda/qda_compute_bus.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/qda_compute_bus.h>
> +#include <linux/slab.h>
> +
> +static int qda_cb_bus_dma_configure(struct device *dev)
> +{
> +	return of_dma_configure(dev, dev->of_node, true);
> +}
> +
> +const struct bus_type qda_cb_bus_type = {
> +	.name = "qda-compute-cb",
> +	.dma_configure = qda_cb_bus_dma_configure,
> +};
> +EXPORT_SYMBOL_GPL(qda_cb_bus_type);
> +
> +static void release_qda_cb_device(struct device *dev)
> +{
> +	of_node_put(dev->of_node);
> +	kfree(dev);
> +}
> +
> +struct device *create_qda_cb_device(struct device *parent_device, const char *name,
> +				    u64 dma_mask, struct device_node *of_node)
> +{
> +	struct device *dev;
> +	int ret;
> +
> +	dev = kzalloc_obj(*dev);
> +	if (!dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dev->release = release_qda_cb_device;
> +	dev->bus = &qda_cb_bus_type;
> +	dev->parent = parent_device;
> +	dev->coherent_dma_mask = dma_mask;
> +	dev->dma_mask = &dev->coherent_dma_mask;
> +	dev->of_node = of_node_get(of_node);
> +
> +	dev_set_name(dev, "%s", name);
> +
> +	ret = device_register(dev);
> +	if (ret) {
> +		put_device(dev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return dev;
> +}
> +EXPORT_SYMBOL_GPL(create_qda_cb_device);
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
> diff --git a/include/linux/qda_compute_bus.h b/include/linux/qda_compute_bus.h
> new file mode 100644
> index 000000000000..90bf248c7285
> --- /dev/null
> +++ b/include/linux/qda_compute_bus.h
> @@ -0,0 +1,32 @@
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
> +extern const struct bus_type qda_cb_bus_type;
> +
> +struct device *create_qda_cb_device(struct device *parent_device, const char *name,
> +				    u64 dma_mask, struct device_node *of_node);
> +#else
> +static inline struct device *create_qda_cb_device(struct device *parent_device,
> +						  const char *name, u64 dma_mask,
> +						  struct device_node *of_node)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +#endif
> +
> +#endif /* __QDA_COMPUTE_BUS_H__ */
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

