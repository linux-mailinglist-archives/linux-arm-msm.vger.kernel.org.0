Return-Path: <linux-arm-msm+bounces-99403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAYhH7SkwWknUQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:38:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D63D2FD5CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AFB0302141B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8733E022B;
	Mon, 23 Mar 2026 20:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OxwgLxct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PMvX3yxZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D47318EF6
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774298287; cv=pass; b=VA97h6xo/sCtOAm0IbaCYSxXbULZiEAgB7yzE3T1dZzVGzgy/iZD8yVc6LGJ64O0WOAXDOFnHtd/s6rUXMNIZBm7SZ0zRz0O7CyvjdMI/6W1PQYDxnb9tJztZyMnHMzSpsMgYTcLQWZlG7xqWg+qA3RYVlSlyvIdaq6edA4mlHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774298287; c=relaxed/simple;
	bh=L73fQ3IwBExIozuvgEyjM8AR7PBEbJm97CoqQ2v2y0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ofzbvm6c5rH6nNBgRKOJ/IA2mZFV1GqfCLo4coGyGB0au/jb65fvQqb6f3/GvnbhiFAYb2w8+SZ7IKnuQEuxMMPBuEkIIRX2jSuOErZ8Xr1gF72WFnnCE/bd6P3R3KYzfcVnAfmKCxDWEvHwlP0+Ar9StEvF0be15VeGBwlQS3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OxwgLxct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PMvX3yxZ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqgmX3170992
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=qypMYrroSdezLsUd7cUleaPAQK3tXijyEbNi7LtRU4w=; b=Ox
	wgLxctj4OZzGKg4UwQp6tulnkF6VIN+56Tvl6n6ue0gG3jr7EZK/OFBbOCMmAiZH
	Qj/Gi/5n4AHKx3/0VfsxoHncAXuJIj6FCZtSUr3+k6rYuGobYXVoBXWehhTfNViV
	/fV372lMtVYI56THpgMEmZrSFiA2RT2Zp7S7N0BmlQ37QI7wWOUZ5lIIYe2qkpEp
	iN6xEDzmo7Tkr3rHO2h6K8Zou4jvSCwzBuEUh0/9Wi9yTcZvYD0G49UmhHwEt+zr
	8bYRoc9wLqvMcLrm4L4ZwPvP0yiPXBb0q26EZlvl50TC3HYeHFTi8cxTL4lNRlzN
	FtJEZw/SU3vOL3fLrL4g==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r21n84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:38:03 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-66308f16ea1so6522223eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774298283; cv=none;
        d=google.com; s=arc-20240605;
        b=hKF7MOfiXR1DwXj6qGZNnaE/I5w9SIoAaSjn9u40I9YxQNqkGmReNfq7KfkcMmARAH
         ZRhlGRtkHV4Nipj4MjHZGcl2mT82nwTBlb1gEeMZNxFE0sCQDpyqwXZTltJbPO9wXpLr
         9nSC1oYUdSQ6bLepltTj76SnFQgT2JL04xP9Mfwl91ppWRUKJ+1xM7ryD65b3vB7SECV
         umd4n3Qcz/EYeoMk6agpPoqP8O8NIV/dUgSHhokaxvA//HexLgdM/DWLRiMcN52GMIiu
         RtAhxwj9hGjh9qrXCUZqB1I6mY+gdwkrPLVKMJREaOTNWLKJlcb0bxBDolB4Ljidb6kz
         IBmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=qypMYrroSdezLsUd7cUleaPAQK3tXijyEbNi7LtRU4w=;
        fh=7FkrPyh7aog5vcdjU3i/HsePGWCBRRHOSUTXulhyXp4=;
        b=abLcG9XEYCmKRa1deLOLn3Mis6b1ay6aV8cc1wQe3mqndy2eeQmTiklMydfEkUjf4m
         r0N9lEFTnmj73gjloE9exHNXY+2uatHPcusPBs62tuD1hmLB+l7U7a0vx0AMkd1su/Em
         /rWbsu7tU/yP946pMdjKKfHc8nDRsXyU42B9KH/Yyo15tKojF8j6GGPy1xXEg4FpHGV9
         JbcibwOAoJ81Q8REDR6qUJYNWUajAEoHh+5xyqmrCNXhZsCZTWjBvSBp83gUtyIcTqt7
         LmPDNHDwzQkOSnSrJys8vcCWejNVlpZmBIUv+B0HnxY6Ppjigc6bmMuGeGYkgjWhC5bb
         793g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774298283; x=1774903083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qypMYrroSdezLsUd7cUleaPAQK3tXijyEbNi7LtRU4w=;
        b=PMvX3yxZbrOy+Um3N4SCYsxmR76EfS2+xfOtUOQCXpWKb0X1QqEgt6udCOVxvc3QLy
         hoWIqwFhNxUWbtJhw1lKx+a8KhF4aChDpYWwDiBjd35fD/+a1dvhIbFAERhnIIEjXNcS
         /Qaxg/RSfjNcY9xNIrkNcwEjXkruVbdbbRmzEhQSxydE37qixCk30a/pAE8pGLR5ZPrj
         Fk7lqdSZCMyQ1vHAZ5VS8K9Q4DTt0Rbp2nuE0eV1DleuAz2HjFhZbulh7QrHuOHF33Ae
         qRrTm6RaogEz3qXF8NybRFWaegwTRYy0qnfq1JNuIZQCgwFRm+JVdZOXtJjxkgfvR8p4
         nAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774298283; x=1774903083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qypMYrroSdezLsUd7cUleaPAQK3tXijyEbNi7LtRU4w=;
        b=mglGP/sSyhIm02dESoBpwFIO7z0aAmqBI5AMqMMmBTytrv+oqgB71RTAGqC80yrI+W
         VNmy3DbaUzf2n0vh2ilje1rQ1CmpG5JgmnzSLLGjoeM+9/0lS4QBZsLXeiaVyctJLsgi
         Poc78ND0oZYCOENFE2BX4DHtMzDfURhgZ6BB2sOeH1io8d/WcvBJBWXBWP7PFokWlQJG
         eWXnZ+C+4xbS0j2ItWy6PLtdYNVeO/Hq8JWTjYagY7YsZhC+t7wNGyXDj/Rjp+wDyJJ2
         EWan6pfDI6C5TXQLWCXSGxPoPM8f/GvVLbLHTTFwPpA3OYFf390R7yAPYjiBo4IXkhK/
         9kWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg61DcCTaaE18A8FfJohDpeaX/S0LTnvX9qfVZ0ybWSNt+mEGc3+vQf/O30JfeAWvUFX8gwVLDCcIc4CUp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4WmhdrwELs6zcWJheXYo+Z2FQuoBFkF87ciXZEPJAfm29ULeg
	VlWkpFxkv1YwjEqEoW6BMe2u2m73/XLK7Sk+ZC+Oe93r8PCtzvVw37AvR2EIoQB22zWgktqxuwk
	3ndJVD3UHOqR9igjW4qkXkXHlKwWQFicoDhT4FxhOlxIeuYrF65SrCpuoAlwkX59uRBeODhqBMo
	uIAIG22Paknb9JjpWoqUWGGDXq2VszHOdx1ZMvY5tnXf8=
X-Gm-Gg: ATEYQzyJBod5TmgNPBFEjaqxj8NTYz7qbZM38qq/t1glR8Yan4G7TPTXrTZ0raX8KUt
	5bpkAON/S1DCKxaR4a/raDuWG1jUB7LbYmqPGSaAk5D2+rqCwIedYWZ1Fd89tZf3d71UiIlp4v5
	NXKOxGWaAUeG+nrLWTuJqgtP1J9b/9lPstz1rg4AukeuBNUW5f2YET4KsCWGWulOhIl570DWTCz
	uxRHMJTMapd+Jm7eC0k+MN2+IkxIoZv3RQVSg==
X-Received: by 2002:a05:6820:160b:b0:67d:ee3c:9ad4 with SMTP id 006d021491bc7-67dee3cba9fmr2510235eaf.1.1774298282606;
        Mon, 23 Mar 2026 13:38:02 -0700 (PDT)
X-Received: by 2002:a05:6820:160b:b0:67d:ee3c:9ad4 with SMTP id
 006d021491bc7-67dee3cba9fmr2510222eaf.1.1774298282085; Mon, 23 Mar 2026
 13:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com> <20260324-a8xx-gpu-batch2-v1-12-fc95b8d9c017@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-12-fc95b8d9c017@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:37:50 -0700
X-Gm-Features: AQROBzDynikIebC1QNf7dTP-npSQujbxNMJmxWjLbwDutWftcNbPlmn0jTGkAU0
Message-ID: <CACSVV03ciF890bDpqcqVhhHeLv0hx1whNgq0RUUKTyAfVopOWA@mail.gmail.com>
Subject: Re: [PATCH 12/16] drm/msm/a6xx: Add SKU detection support for X2-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1a4ab cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=7z8P23FROURhuZ24mNkA:9
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: XMkVO2uIrq3o411DRD9WZ9gGjxZqCZ-M
X-Proofpoint-ORIG-GUID: XMkVO2uIrq3o411DRD9WZ9gGjxZqCZ-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE1MiBTYWx0ZWRfX6fpRbiAdbHCy
 lOcZ00Z4xOPJ581VTRSYtBw860REy3PMHv2e6pRu1tLa51NwGYDExq908Q2pXi/6V53V9Jf2DWt
 HjmrtKIj5dncpdnc2PuG1cn24hC6jA7oyB+zZFz6A80e7tDaJaOgzMM2GTN+TU6+bJapNhLighq
 rEQjg3WOR0IUTbpEDKc3WxxVYBfO8jIKFtC2X2ilD19sMRyvqt3bBwO8ZGy0/dmy4QqydTbY4wd
 k1d0KO1OdW6PwUdOVx9WJhsxo1er/jgdZaR3rbW6gfm+/EDZqA/RMiRS/ExyTKL8W4w/uQoaP0B
 WqW6g0kYPayc+29HKizgERYRYQCnRJdiQOvKx6RviJraD0VqGl4CEMonrwWqVvmcgghCO++bWvR
 dTwvQh6Et19jRmwyDsAsCrqPbW1RAru1xubvAIWYvnd79au8QEblL4whM5kZ0LeZ99gcF3CPzKX
 eYo3QSKU+2EyBihgDlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99403-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: 1D63D2FD5CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 1:13=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> Adreno X2-85 series present in Glymur chipset supports a new mechanism
> for SKU detection. A new CX_MISC register exposes the combined (or
> final) speedbin value from both HW fuse register and the Soft Fuse
> register.
>
> Implement this new SKU detection along with a new quirk to identify the
> GPUs that has SOFT SKU support. Also, enable this quirk for Adreno X2-85
> and add its SKU table to the catalog.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  6 ++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  9 +++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 41 +++++++++++++++++++++=
+-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  5 ----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  1 +
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  4 +++
>  6 files changed, 53 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index 79a441e91fa1..d7ed3225f635 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1731,6 +1731,7 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_dev=
ice *dev)
>         struct adreno_gpu *adreno_gpu;
>         struct msm_gpu *gpu;
>         unsigned int nr_rings;
> +       u32 speedbin;
>         int ret;
>
>         a5xx_gpu =3D kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
> @@ -1757,6 +1758,11 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_de=
vice *dev)
>                 return ERR_PTR(ret);
>         }
>
> +       /* Set the speedbin value that is passed to userspace */
> +       if (adreno_read_speedbin(&pdev->dev, &speedbin) || !speedbin)
> +               speedbin =3D 0xffff;
> +       adreno_gpu->speedbin =3D (uint16_t) (0xffff & speedbin);
> +

I will confess to not expecting to see a5xx changes in a patch adding
x2-85 sku detection :-)

Maybe split the code-motion out of adreno_gpu_init() into it's own commit?

BR,
-R

>         msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
>                                   a5xx_fault_handler);
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/=
msm/adreno/a6xx_catalog.c
> index f6b9792531a6..758bc7bd31f6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1902,7 +1902,8 @@ static const struct adreno_info a8xx_gpus[] =3D {
>                 .gmem =3D 21 * SZ_1M,
>                 .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
>                 .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -                         ADRENO_QUIRK_HAS_HW_APRIV,
> +                         ADRENO_QUIRK_HAS_HW_APRIV |
> +                         ADRENO_QUIRK_SOFTFUSE,
>                 .funcs =3D &a8xx_gpu_funcs,
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .protect =3D &x285_protect,
> @@ -1922,6 +1923,12 @@ static const struct adreno_info a8xx_gpus[] =3D {
>                                 { /* sentinel */ },
>                         },
>                 },
> +               .speedbins =3D ADRENO_SPEEDBINS(
> +                       { 0,   0 },
> +                       { 388, 1 },
> +                       { 357, 2 },
> +                       { 284, 3 },
> +               ),
>         }, {
>                 .chip_ids =3D ADRENO_CHIP_IDS(0x44050a01),
>                 .family =3D ADRENO_8XX_GEN2,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index cbc803d90673..0fe6d803e628 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2552,13 +2552,33 @@ static u32 fuse_to_supp_hw(const struct adreno_in=
fo *info, u32 fuse)
>         return UINT_MAX;
>  }
>
> -static int a6xx_set_supported_hw(struct device *dev, const struct adreno=
_info *info)
> +static int a6xx_read_speedbin(struct device *dev, struct a6xx_gpu *a6xx_=
gpu,
> +               const struct adreno_info *info, u32 *speedbin)
> +{
> +       int ret;
> +
> +       /* Use speedbin fuse if present. Otherwise, fallback to softfuse =
*/
> +       ret =3D adreno_read_speedbin(dev, speedbin);
> +       if (ret !=3D -ENOENT)
> +               return ret;
> +
> +       if (info->quirks & ADRENO_QUIRK_SOFTFUSE) {
> +               *speedbin =3D a6xx_llc_read(a6xx_gpu, REG_A8XX_CX_MISC_SW=
_FUSE_FREQ_LIMIT_STATUS);
> +               *speedbin =3D A8XX_CX_MISC_SW_FUSE_FREQ_LIMIT_STATUS_FINA=
LFREQLIMIT(*speedbin);
> +               return 0;
> +       }
> +
> +       return -ENOENT;
> +}
> +
> +static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6=
xx_gpu,
> +               const struct adreno_info *info)
>  {
>         u32 supp_hw;
>         u32 speedbin;
>         int ret;
>
> -       ret =3D adreno_read_speedbin(dev, &speedbin);
> +       ret =3D a6xx_read_speedbin(dev, a6xx_gpu, info, &speedbin);
>         /*
>          * -ENOENT means that the platform doesn't support speedbin which=
 is
>          * fine
> @@ -2592,11 +2612,13 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_d=
evice *dev)
>         struct msm_drm_private *priv =3D dev->dev_private;
>         struct platform_device *pdev =3D priv->gpu_pdev;
>         struct adreno_platform_config *config =3D pdev->dev.platform_data=
;
> +       const struct adreno_info *info =3D config->info;
>         struct device_node *node;
>         struct a6xx_gpu *a6xx_gpu;
>         struct adreno_gpu *adreno_gpu;
>         struct msm_gpu *gpu;
>         extern int enable_preemption;
> +       u32 speedbin;
>         bool is_a7xx;
>         int ret, nr_rings =3D 1;
>
> @@ -2619,14 +2641,14 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_d=
evice *dev)
>         adreno_gpu->gmu_is_wrapper =3D of_device_is_compatible(node, "qco=
m,adreno-gmu-wrapper");
>
>         adreno_gpu->base.hw_apriv =3D
> -               !!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
> +               !!(info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
>
>         /* gpu->info only gets assigned in adreno_gpu_init(). A8x is incl=
uded intentionally */
> -       is_a7xx =3D config->info->family >=3D ADRENO_7XX_GEN1;
> +       is_a7xx =3D info->family >=3D ADRENO_7XX_GEN1;
>
>         a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
>
> -       ret =3D a6xx_set_supported_hw(&pdev->dev, config->info);
> +       ret =3D a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info);
>         if (ret) {
>                 a6xx_llc_slices_destroy(a6xx_gpu);
>                 kfree(a6xx_gpu);
> @@ -2634,15 +2656,20 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_d=
evice *dev)
>         }
>
>         if ((enable_preemption =3D=3D 1) || (enable_preemption =3D=3D -1 =
&&
> -           (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
> +           (info->quirks & ADRENO_QUIRK_PREEMPTION)))
>                 nr_rings =3D 4;
>
> -       ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, config->info->func=
s, nr_rings);
> +       ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, info->funcs, nr_ri=
ngs);
>         if (ret) {
>                 a6xx_destroy(&(a6xx_gpu->base.base));
>                 return ERR_PTR(ret);
>         }
>
> +       /* Set the speedbin value that is passed to userspace */
> +       if (a6xx_read_speedbin(&pdev->dev, a6xx_gpu, info, &speedbin) || =
!speedbin)
> +               speedbin =3D 0xffff;
> +       adreno_gpu->speedbin =3D (uint16_t) (0xffff & speedbin);
> +
>         /*
>          * For now only clamp to idle freq for devices where this is know=
n not
>          * to cause power supply issues:
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 10d9e5f40640..826661cb7988 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1184,7 +1184,6 @@ int adreno_gpu_init(struct drm_device *drm, struct =
platform_device *pdev,
>         struct msm_gpu_config adreno_gpu_config  =3D { 0 };
>         struct msm_gpu *gpu =3D &adreno_gpu->base;
>         const char *gpu_name;
> -       u32 speedbin;
>         int ret;
>
>         adreno_gpu->funcs =3D funcs;
> @@ -1213,10 +1212,6 @@ int adreno_gpu_init(struct drm_device *drm, struct=
 platform_device *pdev,
>                         devm_pm_opp_set_clkname(dev, "core");
>         }
>
> -       if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
> -               speedbin =3D 0xffff;
> -       adreno_gpu->speedbin =3D (uint16_t) (0xffff & speedbin);
> -
>         gpu_name =3D devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT=
,
>                         ADRENO_CHIPID_ARGS(config->chip_id));
>         if (!gpu_name)
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 29097e6b4253..044ed4d49aa7 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -63,6 +63,7 @@ enum adreno_family {
>  #define ADRENO_QUIRK_PREEMPTION                        BIT(5)
>  #define ADRENO_QUIRK_4GB_VA                    BIT(6)
>  #define ADRENO_QUIRK_IFPC                      BIT(7)
> +#define ADRENO_QUIRK_SOFTFUSE                  BIT(8)
>
>  /* Helper for formating the chip_id in the way that userspace tools like
>   * crashdec expect.
> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/=
drm/msm/registers/adreno/a6xx.xml
> index 3941e7510754..2309870f5031 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> @@ -5016,6 +5016,10 @@ by a particular renderpass/blit.
>                 <bitfield pos=3D"1" name=3D"LPAC" type=3D"boolean"/>
>                 <bitfield pos=3D"2" name=3D"RAYTRACING" type=3D"boolean"/=
>
>         </reg32>
> +       <reg32 offset=3D"0x0405" name=3D"CX_MISC_SW_FUSE_FREQ_LIMIT_STATU=
S" variants=3D"A8XX-">
> +               <bitfield high=3D"8" low=3D"0" name=3D"FINALFREQLIMIT"/>
> +               <bitfield pos=3D"24" name=3D"SOFTSKUDISABLED" type=3D"boo=
lean"/>
> +       </reg32>
>  </domain>
>
>  </database>
>
> --
> 2.51.0
>

