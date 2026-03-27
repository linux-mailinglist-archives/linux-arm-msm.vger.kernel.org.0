Return-Path: <linux-arm-msm+bounces-100376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDJ6KEKwxmmiNgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:28:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A80103476EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DA863053B1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E243C346E44;
	Fri, 27 Mar 2026 16:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EhaMoWgP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icrrug/Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39FD347BDB
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628224; cv=none; b=ZP9JjY8+zlJpH0L1+7JjL9wzvlhJdFD3okCA6fHf4fAQWNt4vKrWTO5pfjxlt+GapbkxfUMptsCucoJIKLlEpL+IKFaSxjD403sQpnI0UJKRqpD3RhQkesQz8GlePoz3EjnHThRJ0rBC3MDxPS0f8xUah5i62iCaG4Q31yehbfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628224; c=relaxed/simple;
	bh=SVdTkeVeyoLe/1KQceMwBisVnJtenJGNsKgIsNp7LRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCsc8HxXNdUXvmGfg2NtvdwkDGvRSTYbDw2t8l0QogPEWspf8toKWDcWA0IzDKL6XhI83npNgEyTlbMuag7PBV/V0a8rg0U6XDP+pH06QmcQL1ConsMu6RAaPnxxFo05VKxvdoKYMGNePsikGgQqCy8gv171Uux8x4INTWdgPcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EhaMoWgP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icrrug/Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhH9k2769230
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0uSEuoFInxVgrwB79dUUBt3ZPYXBustTfB6r5GqV4g=; b=EhaMoWgPsnhiqVsV
	Nd8oSZSoky4XsXx2YeRGcDZypaTTiinDsVBfXcuUhTn+zWujbfYDyryYb59/V2d1
	msvX6uzquKSoiKUM6grtzA/ptTlc9QLxhXJUBgbQFXAZl+Hgq5FXas41nEa6lB+d
	lD+j6uv00oS23F8x8E0uMeOCmZvewQfWQU2jXuJVmJvyulrZizOiXQw0zNZfS8Qe
	yEN1tmzAX85sBFUvmZRnNbmaEMHX8sLZ+4tGUnrrfBblFaxF2/Tm+f2Okt4JmeT5
	0gZr9PcmbNctyCJw5myhyQTEG0GlDvQFS5M4UmsbLcQjUtUNcvREvA7QOfQbPSvU
	N/dLig==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv3tcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:17:02 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1279caef718so2262158c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774628222; x=1775233022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0uSEuoFInxVgrwB79dUUBt3ZPYXBustTfB6r5GqV4g=;
        b=icrrug/QV6WcjG8MOlphALEFcmOttNPIEp3xIkq7zz5chVeLRPKMrKoRIh7g6KxUQD
         PX9NayPAF0oiGYwQqE4YOWOydlVkEZqgGg6AGd0rDp+qR2x1ur6je+BjcmxXvTAwoue6
         ue8DEzMJfXaMYj439viYFENUMdk+/QxlpBcSJjJAVPjhFgY7F0rQkgC1jtdBiuDzBXMI
         W+KfHskW/7pmJy3oZo5LY/fgm41WAgZtud9KAVJ0totI+b77JR5ry7aCjUOo0qlBpcSP
         CQ+MCPB2DDHxQdIlxvLN6nmmYo3eEKbNGV2TNbRyFYVYv1WcEQ8SUl9T8AYNhgtj2v4F
         hHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774628222; x=1775233022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0uSEuoFInxVgrwB79dUUBt3ZPYXBustTfB6r5GqV4g=;
        b=BejV1gbR1n5psoX/ItdqJU1oJRcwsRl7f7KfWUCXc0hrA3x8BUjlbR3qmyBsMOHL7v
         TQccs+5RzBAVv4vsc51/vLUCr1i4Zctp6lXn9UbJZZIEhVYiHQgELHN5SYyKh1yVcwIc
         BeJVk7G0I4Tuq676o8kjkRqMupm79fIPcpzvMViSBitz220Uu6QeS+ACmIrHiWV0wtI9
         fyAQpBpXUA33UKDjWISaX6eOgykCCc2n+6YtHPr+sW/gM08Wz3PDcipRB7OVDIYhbIri
         1Cb9MgxJRSHUCgYo1Gynj3Sxm6P9VGBDkjLBTdEwrwahgUCNE/Re2rdRhUd9uUBLg88t
         6F4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDJlRb2ESPgXrej6scjxAhJw8b5EGNO418Do5QwQ7ceOqyXcVO1JgkaYMGZRNn+xA1stLfO3WNOX1WNMbf@vger.kernel.org
X-Gm-Message-State: AOJu0YxE8xClUMVFssWqkkJ/v0ZzEeDqZaIZSBD66ThQWlcBc2iYq+Br
	Y4oBOwZM/2a3eUPRVmt239saQmru0Jo0yMEfgDL39vPJrbI4oyXfQFPUC/ECr6WNLux8GD0YFGk
	A2tHfy7bO7e2gcG+gCguJHDPcwg6lTDL78knlzTXHTnMWXDOLvqN/sRDMY/tKTZl99ctkCiL9jD
	U3
X-Gm-Gg: ATEYQzwWEAetBRk2CJIGYVkjRtVrOfwWO3KLHY/KB3AcAV2JSR6OibKeOKfl1kqW2JH
	Q0JZsfR7sPHomO5CTEhaBgqmw4nT6vryaBTodrDakvQu8/ShFbtMgnZkHMMh2iETxAPxJwbIf3T
	365X02VpJ1EVgzmM0GZ//rMmnszyGUJj6PVwllJHzLsNl4CNcOoIRBBjdJs35jsWpjX1G1Hys99
	Bp7aEWIpGNt7EHsXJI5atDwbzZYDcsVJUUYj5o3pJCe7TBODNsTKxAw3V+dQ4YAtLrtdb/yk6tC
	ocf+86664Kd7S0yURcaC/tUR0WCGFmMCXQlEgwk1kz5thC/RGTP79ywZLVR0+GDuoNDbWBsz6NX
	1u/v/uU2PJGz2sFKdIvhkIYkWZFjaD4/rhGmstr7H1KCxIQBo/iMjokyZRnO+aAl7uj+Zt4Nn2b
	s=
X-Received: by 2002:a05:7022:618a:b0:12a:6b99:1ad4 with SMTP id a92af1059eb24-12ab286cf5amr1634014c88.11.1774628222067;
        Fri, 27 Mar 2026 09:17:02 -0700 (PDT)
X-Received: by 2002:a05:7022:618a:b0:12a:6b99:1ad4 with SMTP id a92af1059eb24-12ab286cf5amr1633983c88.11.1774628221305;
        Fri, 27 Mar 2026 09:17:01 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa7624247sm8135794c88.11.2026.03.27.09.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 09:17:00 -0700 (PDT)
Message-ID: <5abe5ee7-f054-4e32-ad9a-c9b8f10bc423@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:16:59 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: kcalloc + kzalloc to kzalloc
To: Rosen Penev <rosenp@gmail.com>, linux-kernel@vger.kernel.org
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:QUALCOMM CLOUD AI (QAIC) DRIVER" <linux-arm-msm@vger.kernel.org>,
        "open list:QUALCOMM CLOUD AI (QAIC) DRIVER"
 <dri-devel@lists.freedesktop.org>,
        open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260317003034.71618-1-rosenp@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260317003034.71618-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c6ad7e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=H-3xqeJHN62Qb4ZhkN4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: ZMJ6oXBO_u9_AI0p8ksUl0nOlwgOpfxo
X-Proofpoint-GUID: ZMJ6oXBO_u9_AI0p8ksUl0nOlwgOpfxo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX4vxIEkVc2k7r
 oY0CxjBnuAKfpSPrcsWaA3BUkT1yNp44Lw7Ze+g1+fHcrL4dM0Fj4jgSA+xG/lp1bL4moZyyWbm
 /FeUIuLPnqWJ8nMQp9BVhB0tRHHh5oucztE6AhI7l5NFST2TqrFtrsZ8Ekp3lDDnM/+SGfwMrc4
 LY5EKXNHMqzCcKFQjQZ4HONgRCWq74H8rFV5yWcfIs6m9SSsfENt9cYWs1JypFFlbj5hkI+O21f
 LO4wVmx2J0BXH5N22aFQLM33367+4hSFNto4cImATTIMneyXVNa9JnMXmOIE3KjJ9e9who/7JNK
 iAHy8YO6fhyRMeJLY0F5FshXXY91Tx4OrAjAOMWTurUnV0Xakf0p9qANbicj+vgaj14rt/5R8FX
 568IDvLXEtnbCt0iwBEOqOqAD3p8lc7M0I8dyfuZXwWW60bSjOYozlMAiqTkX4qBbOAzL2DmOMP
 WPHKCyYWqESa/iEqysQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100376-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A80103476EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/2026 6:30 PM, Rosen Penev wrote:
> Combine allocations by using a flexible array member.
> 
> Use __counted_by for extra runtime analysis. Move counting variable
> assignment as required by __counted_by.

This fails to answer "why".  This change is not justified in the commit 
text here.  Please see "Describe your changes" in submitting-patches.

Also would be helpful for you to mention how this was tested (although 
those details don't need to be in the commit text itself).  You are 
touching arguably the core structure of the driver and any mistakes will 
be devastating.

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/accel/qaic/qaic.h     | 4 ++--
>   drivers/accel/qaic/qaic_drv.c | 7 ++-----
>   2 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> index fa7a8155658c..e237020f6aa9 100644
> --- a/drivers/accel/qaic/qaic.h
> +++ b/drivers/accel/qaic/qaic.h
> @@ -152,8 +152,6 @@ struct qaic_device {
>   	struct list_head	cntl_xfer_list;
>   	/* Synchronizes MHI control device transactions and its xfer list */
>   	struct mutex		cntl_mutex;
> -	/* Array of DBC struct of this device */
> -	struct dma_bridge_chan	*dbc;
>   	/* Work queue for tasks related to MHI control device */
>   	struct workqueue_struct	*cntl_wq;
>   	/* Synchronizes all the users of device during cleanup */
> @@ -206,6 +204,8 @@ struct qaic_device {
>   	void			*ssr_mhi_buf;
>   	/* DBC which is under SSR. Sentinel U32_MAX would mean that no SSR in progress */
>   	u32			ssr_dbc;
> +	/* Array of DBC struct of this device */
> +	struct dma_bridge_chan	dbc[] __counted_by(num_dbc);
>   };
>   
>   struct qaic_drm_device {
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 63fb8c7b4abc..ab428ecd26f5 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -405,15 +405,12 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev,
>   	struct drm_device *drm;
>   	int i, ret;
>   
> -	qdev = devm_kzalloc(dev, sizeof(*qdev), GFP_KERNEL);
> +	qdev = devm_kzalloc(dev, struct_size(qdev, dbc, 16), GFP_KERNEL);

I dislike the structure of this change.  16 is now in multiple places, 
and when it will change in the near future, its going to be harder to 
get the update right.  The existing code specifically assigns the value 
and uses the value from that assignment for that reason.

>   	if (!qdev)
>   		return NULL;
>   
> -	qdev->dev_state = QAIC_OFFLINE;
>   	qdev->num_dbc = 16;
> -	qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
> -	if (!qdev->dbc)
> -		return NULL;
> +	qdev->dev_state = QAIC_OFFLINE;
>   
>   	qddev = devm_drm_dev_alloc(&pdev->dev, &qaic_accel_driver, struct qaic_drm_device, drm);
>   	if (IS_ERR(qddev))


