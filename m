Return-Path: <linux-arm-msm+bounces-103049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Jq4CMHf3WkYkgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:33:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 761E33F5FB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CD573033D04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FEF36C9C5;
	Tue, 14 Apr 2026 06:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvF2aEOV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHWyHGvd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0673491DB
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148302; cv=none; b=LRwwNVUJbQ3gopStUPD4OI3wRMc+Rb4lUCqtIOb6bMz5Slcnweq+PBRmFmoUIGGVEcrl3Vhvg3tUSPUvwtCiV7q753hFGxM8rYLuYJxouVuohRro1jn1299NrpJVvZF4YHtRehR65zuXitAjMm7HawAO0rvkVSXqmQU4QBzX5UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148302; c=relaxed/simple;
	bh=3yorD91S2PCr9kdvTE3Asu1xhg52nnJdAe0z8jPVrLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtitGZ2Sw7cQAbBgMurUSa6TYdDf1onuI5xX2XWCQqis9c2ky40r+YLSPt5QkyoJ/QU1SAoEkq3xSWktE3vo4g0xQdjszWJzTPpBYNKjEBaDrrJ52dZmZrEmRlVBBTwQuAA2qoXmuqnSW0E20VdZ6sIL2OFX8H7el9pzSiU+RvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvF2aEOV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHWyHGvd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCasE967261
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0AqUt1pDu47T9baUJ1GcRn/p
	c3CiKRfHdUGiEP+cP3g=; b=DvF2aEOVoqNuKEL8WYSFVwWrm8xA1O7scyzw9eo3
	cfoheAD0GiwmhUpnswk3Y7bUbR/zBXFEbjgSXpi/fZPXJLBjE5TK1dfvx++YApL+
	pAwDrnUQS1bOZOuqs6DWinOX6z4AwipAmzY00wpTYo1UC0kpmry5+GX1N6af+0TH
	dqC5Y6A61IIGnaO7FaEKq+rpO6A5TTnfB2s1p8uDpDTN9dziiUw6PmIMo+yKS+qW
	SqZpsfPL2ShKfXiWu4hGXQW5S1XPFG9+QUTh0kfkbN1I3fa/0/Z0LBa6xHqSnN5H
	F+lhcPBKgzSWHd5y6yyKGCb2aPhaNejlsvCYSg71ujbQHA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v1ana-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:31:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b458add85aso21686965ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 23:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776148298; x=1776753098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0AqUt1pDu47T9baUJ1GcRn/pc3CiKRfHdUGiEP+cP3g=;
        b=WHWyHGvdreZrsst58hxdqv07x/OmbmP3mdYtwZw99HA8YfiS3WxXbaAbBXJeUj4fwv
         WjybwJV+cyX6l0z8zuZJR4sUL5fjaP1rYP6hgx2Ajr4pzL5QMMjCqIPWzO0AEwCBjHxT
         lQyx85usyOr8GqJinEL3XsQYAcpVx/SxDRkwAMraqVAHhnwwxjf2qKdZL1EF4xzFf5ae
         MqDtX2kHH7CZgmAIrlAC069c0dfpPDmMf358z6pYzL+B39Jmvtzkz9KL4M1rqWoaWOo8
         Bf1OGvi3duulzY3AOYZ1YDc4B8nmaGSB0k3NJIuxeoj/17CFyk/coVDD6bLTJqa3EKdy
         GsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148298; x=1776753098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AqUt1pDu47T9baUJ1GcRn/pc3CiKRfHdUGiEP+cP3g=;
        b=jpyNUfaSebEq2aHivOudOE5X2/4dKWFHduxwcE4YFolvIqgWbPgOvlwAKQ3ogPUgV4
         9UuC4aeZna/4gp7AKh5S46Z/dKVBTNJrxxBN35dhrwuaZmWH/V1V/Yk+SzrKVQTI9pr9
         GOfcm8qubVKSQYtzyoL1b9gIOGoQ1mg6wF2CYgOvGMawIfriToNWX1rQjA7JP/EupoIe
         uedlesbtb0JzeBWjX/fTNyhABJZTLfrGat4TA3L7gl7OGYlAfmAGiWFQtyefathyyN5u
         QfYplm9mFTMbTuY+SYm22AaDC/YpNjEnCmAv7QZ8VcUiK7VvrhZN/30Zm8OiFVIt2Uus
         2D4w==
X-Forwarded-Encrypted: i=1; AFNElJ/uG0ViufaXdQhlFQd9jAs2P7JRQKZmlTDgngScqvpeaXoK0WpOE2rbD2argOhwiQHVKwG9WLYkw9l6+Q8l@vger.kernel.org
X-Gm-Message-State: AOJu0YyNxfOL9BAM9MN0ttjyLSLCY+vCj7+BTnz5OgVnNOOlEDYdytf1
	3b5/1fXfGMr/y35V/yo7pkqfuCm7RhHM+AbjGgqEO9mAGe2FjG1esOpqYSBxP42NX0SeJ+JhXm3
	1TaUDGWOJYb37vOHQ6zxYvLzzGiihehFWuhSG5eLVX4uokVA2cjoD6KJTJ601P/xiwhVVKPa1Zp
	MA
X-Gm-Gg: AeBDietScdu6hNl2g+GZEu472mDTA647FhfYniaiYRQoN4Q1q6D+eA5+zJJ9vAAqJIC
	3x8eBccu1levhBdmpkzif+7ZHZ/tBGTqhzHiaQviIEOapz4umkuEgvPPwO8qTk5URCnplkFEC1N
	HJnmHEu10Vbc8EJQog/iqFtIPy6Goc6g9gWNH+ZDeZFMqvDk+iexTf5Cfwu4oevvYmxyXnWn5lz
	qXkPXNm4CG4XkqW8DNyfaKEK7vjlrw2CuwUiRwu05jCkwKimVUtYWj1v2IpXxbOk1SRzlWXf0zZ
	fb9ZhXd9vPVu3UAFAUt1WuWcxdqVV5g69/DmPtbmDRo+6bl3diGKTwALbL8HxFJH/lQGeu2AOar
	FNCcdHu7Y0wBKBD/RuFgK8Tq04eWHniUj/bkMBmec3UeNVwp1
X-Received: by 2002:a17:902:ea05:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2b45f961f07mr61595025ad.5.1776148298198;
        Mon, 13 Apr 2026 23:31:38 -0700 (PDT)
X-Received: by 2002:a17:902:ea05:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2b45f961f07mr61594545ad.5.1776148297500;
        Mon, 13 Apr 2026 23:31:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f469casm134423405ad.81.2026.04.13.23.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:31:37 -0700 (PDT)
Date: Tue, 14 Apr 2026 12:01:28 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 05/11] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Message-ID: <20260414063128.6ass64wfi7nmtzti@hu-mojha-hyd.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1OSBTYWx0ZWRfXxzIY35PJfuUT
 z649zU3xYD1D7z3WdpzitA53Br6bIX4VM/UOim4ArBbCIy2fFxNRNs1WM/D803fy65bQRsXsVlZ
 rvCLVRsZhglofMtAd4XRWbz0qTBrB+t29YVAawD2QM0UZsf2foSix0jKUU7CYsj4iFwJEocMxWH
 noGzeooOjVmTW/Qc2I9vtWZgG55b7VZhyq54U6EHTcyZtQINdocgyl8DOabO7j7QnyE0/GgHUF7
 adq0rfnZTiiPPHKliy/iFsdDo9QYE4uYKcijCQao085yLb+VsSsdyidx/YmDh0P5HBYaaETmIk0
 GogLpuDDKsTjnObtfXAVs3MDU4vdNOCiTi8h1tOhFJO2UI5lSdvJhSOzbo7thghQNm+Y5jS61NI
 yXndUvktya0/wtj/bUA8+r9LJbaijrpnryTDmaTj+Lm3SIzH754FSLe1NlrwanyGfLBfFiLm61T
 XuoyjRImCFBEgQwMAdQ==
X-Proofpoint-ORIG-GUID: tScDviZqH_6ypU2WcVOpiWbNhGYJDG4B
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69dddf4b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=si-WgAoSX2TVzsJGXnMA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: tScDviZqH_6ypU2WcVOpiWbNhGYJDG4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140059
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103049-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 761E33F5FB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:30:01AM +0530, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> or QHEE), which typically handles IOMMU configuration. This includes
> mapping memory regions and device memory resources for remote processors
> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
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
> 
> Additionally, the Iris driver must map the firmware and its required
> resources to the firmware SID, which is now specified via iommu-map in
> the device tree.
> 
> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
>  drivers/media/platform/qcom/iris/iris_firmware.c | 71 +++++++++++++++++++++---
>  2 files changed, 66 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index fb194c967ad4..aa7abef6f0e0 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -34,6 +34,8 @@ enum domain_type {
>   * struct iris_core - holds core parameters valid for all instances
>   *
>   * @dev: reference to device structure
> + * @dev_fw: reference to the context bank device used for firmware load
> + * @ctx_fw: SCM PAS context for authenticated firmware load and shutdown
>   * @reg_base: IO memory base address
>   * @irq: iris irq
>   * @v4l2_dev: a holder for v4l2 device structure
> @@ -77,6 +79,8 @@ enum domain_type {
>  
>  struct iris_core {
>  	struct device				*dev;
> +	struct device				*dev_fw;
> +	struct qcom_scm_pas_context		*ctx_fw;

fw_dev suits better and ctx_fw is always for firmware, maybe pas_ctx is
better.

>  	void __iomem				*reg_base;
>  	int					irq;
>  	struct v4l2_device			v4l2_dev;
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 5f408024e967..93d77996c83f 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/firmware.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/iommu.h>
>  #include <linux/of_address.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> @@ -13,12 +14,15 @@
>  #include "iris_firmware.h"
>  
>  #define MAX_FIRMWARE_NAME_SIZE	128
> +#define IRIS_FW_START_ADDR	0
>  
>  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  {
> +	struct device *dev = core->dev_fw ? core->dev_fw : core->dev;
>  	u32 pas_id = core->iris_platform_data->pas_id;
>  	const struct firmware *firmware = NULL;
> -	struct device *dev = core->dev;
> +	struct qcom_scm_pas_context *ctx_fw;
> +	struct iommu_domain *domain;
>  	struct resource res;
>  	phys_addr_t mem_phys;
>  	size_t res_size;
> @@ -29,13 +33,17 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
>  		return -EINVAL;
>  
> -	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> +	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
>  	if (ret)
>  		return ret;
>  
>  	mem_phys = res.start;
>  	res_size = resource_size(&res);
>  
> +	ctx_fw = devm_qcom_scm_pas_context_alloc(dev, pas_id, mem_phys, res_size);
> +	if (IS_ERR(ctx_fw))
> +		return PTR_ERR(ctx_fw);
> +
>  	ret = request_firmware(&firmware, fw_name, dev);
>  	if (ret)
>  		return ret;
> @@ -52,9 +60,27 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  		goto err_release_fw;
>  	}
>  
> -	ret = qcom_mdt_load(dev, firmware, fw_name,
> -			    pas_id, mem_virt, mem_phys, res_size, NULL);
> +	ctx_fw->use_tzmem = !!core->dev_fw;
> +	ret = qcom_mdt_pas_load(ctx_fw, firmware, fw_name, mem_virt, NULL);
> +	if (ret)
> +		goto err_mem_unmap;
> +
> +	if (ctx_fw->use_tzmem) {
> +		domain = iommu_get_domain_for_dev(core->dev_fw);
> +		if (!domain) {
> +			ret = -ENODEV;
> +			goto err_mem_unmap;
> +		}
> +
> +		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
> +				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
> +		if (ret)
> +			goto err_mem_unmap;
> +	}
>  
> +	core->ctx_fw = ctx_fw;
> +
> +err_mem_unmap:
>  	memunmap(mem_virt);
>  err_release_fw:
>  	release_firmware(firmware);
> @@ -62,6 +88,19 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  	return ret;
>  }
>  
> +static void iris_fw_iommu_unmap(struct iris_core *core)
> +{
> +	bool use_tzmem = core->ctx_fw->use_tzmem;
> +	struct iommu_domain *domain;
> +
> +	if (!use_tzmem)
> +		return;
> +
> +	domain = iommu_get_domain_for_dev(core->dev_fw);
> +	if (domain)
> +		iommu_unmap(domain, IRIS_FW_START_ADDR, core->ctx_fw->mem_size);
> +}
> +
>  int iris_fw_load(struct iris_core *core)
>  {
>  	const struct tz_cp_config *cp_config;
> @@ -79,10 +118,10 @@ int iris_fw_load(struct iris_core *core)
>  		return -ENOMEM;
>  	}
>  
> -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> +	ret = qcom_scm_pas_prepare_and_auth_reset(core->ctx_fw);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
> -		return ret;
> +		goto err_unmap;
>  	}
>  
>  	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
> @@ -93,17 +132,31 @@ int iris_fw_load(struct iris_core *core)
>  						     cp_config->cp_nonpixel_size);
>  		if (ret) {
>  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
> -			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> -			return ret;
> +			goto err_pas_shutdown;
>  		}
>  	}
>  
> +	return 0;
> +
> +err_pas_shutdown:
> +	qcom_scm_pas_shutdown(core->ctx_fw->pas_id);
> +err_unmap:
> +	iris_fw_iommu_unmap(core);
> +
>  	return ret;
>  }
>  
>  int iris_fw_unload(struct iris_core *core)
>  {
> -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +	int ret;
> +
> +	ret = qcom_scm_pas_shutdown(core->ctx_fw->pas_id);
> +	if (ret)
> +		return ret;
> +
> +	iris_fw_iommu_unmap(core);
> +
> +	return ret;
>  }
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

