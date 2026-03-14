Return-Path: <linux-arm-msm+bounces-97658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB02Agy9tGnvsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:42:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF5128B468
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94C003007B37
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD0C1FC0EA;
	Sat, 14 Mar 2026 01:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LiYCor0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qq8UUB9q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1761B0439
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773452550; cv=none; b=rLVnghcSx9EN6YVLpdecydBEseQMI029DQPbCQiMDbtnIM4xMGqNBhKyiicOrEgxaX9SuBo7WokZ8kmllN1z6/1yPEjUbjHJI4kWjPPrWIXCsXXyWxheNWxqhHCGFLQ+q9QCR+OQh/P9E+Hz3TSk/WUiBE4IOXTfSvFSuNG7gU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773452550; c=relaxed/simple;
	bh=36js7P4EDgXjSd5WKGAFDE5TiYa6s9ZyxFvT9jGbqRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFqj7jD2pkbI+a6ZAnfvXiRgqZ/LfTQ2bPFmsbF6mHcLZK30hA6Od70eTn8ovlIWSxJ9k7rCAN2XM8F4MjAwKm9dMg8lgFaMhINAWY4Vrh15s0O7XAHmVi5C64B6IkjloWzCubfo454/g9auJHWd5pzS/baTgX0ntZUACvUQJrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LiYCor0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qq8UUB9q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DHY3n21499474
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dxoSV/2rDE6WRGUecrEbFLSj
	R1a4x9YNBijPolO5Lx4=; b=LiYCor0bSzIfq9ypzW1I/BriGHPZZkGXtcOwXHra
	gDRlQqzQVsEuIGtmXi5N/MGjNNEhN+3LajWcEbRduwvWnE6R6JMyC738X32Oq4Ja
	0bQ92wku7pdJe3kdFskQ/3B5WA4rDjY/r9BsTq2nR4I6j134wJLBSZ1VbMiDZAOd
	sYqNXtcTSfW/z225w+ZJzKmNbp7rBeUHU7iiJWIg6Vm1DmSjF8+x8H9eWs45cUc6
	kMbM3muFdRdzV0Uf/I0mOLv60DY9/iQuJAKE7bBQsVIzzkUSMbWY48mkP0eRuQwx
	aJc9jlzS/GodW+fzzHx0j6eN1BbEjBRcHA37RGy29OV6XA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hjuge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:42:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509114d7418so44255091cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773452547; x=1774057347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dxoSV/2rDE6WRGUecrEbFLSjR1a4x9YNBijPolO5Lx4=;
        b=Qq8UUB9qZeuiAC+HWtNGSTw5Hq/3/0GMnRotGT5FKf1iyZep4OIF0N8IJvUbx8cdap
         RepWBz8cTaeMkfpUQbQFFcGLEUL0GSB07BrhY4XM1aoE0/9oSKsSaQB2DGUTtksp0WlU
         0+k556N2m58QeT8nhGO56ZnodqZ0Hk+MLt/3zFLWgPuI4RONT76aV91sC4hrlhAegJrr
         9aFmpy30xi3HSxIRL9hBj5Y1LrnidV0rmPf8urNU6eOUPN7y9kZFrU+aJttizEUIT9L0
         eMbDT4P+JtVL+jz3t8h4N4exchLUslcyjXWTpSIZHtyvb/D7OqzJGfSIT5PeENriCzCa
         WrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773452547; x=1774057347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxoSV/2rDE6WRGUecrEbFLSjR1a4x9YNBijPolO5Lx4=;
        b=HeAt5OsT/lESqNnqTO1vHz0rX9Ml5IJTE72E8aoLemfcQwBwdZXaJUhLkmMjiTcPpC
         8vhLC3s3Q99kB30QhT+qcplM2dbeKFk90DI8wuO7mUFT5RXhwfettaokQU4Tx6i80rq4
         9AiQ4vhzJXfhPaDYlosb1HAuDK5V5J9Sv0eCLigy7u20T9O++D2IkW3aG5GHx1qSxfuK
         mhP0XepCdNeVfjScdBLYBLofRaPtNcUorqvxtvyIi6vaXZ0P1eGvI1eiF1BacYWmOdvK
         HqKvLAgHhDmncTMdHxs9eK7JlpGEXJNIgBqurttnlTXkg6/7cuhX6Fy2yidOdP+ayA6r
         0XxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWePvsc83eEknLx941cN6xxZhFBwnbRdhHjVqVjwNJf9r1XJkB1tX6omaGvdrgB5IjReZW90kdKd8I2+SFA@vger.kernel.org
X-Gm-Message-State: AOJu0YznH2/up5xR0c2HDn74leOHwsN08/aBnmdo9RxVk+bdcyhlUCEG
	UzY4QPX5gld1GBge4dZcbIsaSSsjT/R4iql06k0JxLj9zWkWCMBniiOMQPn/fM3288FFhR87SE8
	BgiFVtCD4gcp5/hs0AobkhLHa7NlSiXlcWPofQh7Bv61QSVhdKTUUZtn+jZ7G5WQDlpBb
X-Gm-Gg: ATEYQzw0cqXtl8rRM9/OSCkBoHfZXuNtTfAwN/Etb5nmjd4fic7hrigX9gOy7J9hHkf
	IvKv9UEy5QhWWFSUtCd80y8/k/2R6uEFUmPA5woA/yzSqYlloQafl7mVDI0sqpfsMxrwdm+RyMu
	+de/1zK9hUMdsxN03E6wY9DUNg391sRQ8hpWic4p6U+qi238se57FEMl0oLV5M5m8mg797Oem7a
	p5mxFYP8YtaWGFFvYn+tmLHSssPB5xIpZT4BkgBBKssnY7smdL8hoWvu4CmrCYx7j3vzC1ptf+K
	rUIxX9LVGX213XjHpCmoBiviW4jINOBLyw0Rd1y7Z68brLu2Cyqit8D5M2D6ai+fEcKMZe4OcGD
	ILC0k6FLD7VCq2DWB8zEn+NNjuHUgzHB/xLZKcR27KpFMI5JvIJftQpfXvUcEbzFpFg8MIOmNrF
	g2wVh0xv0UYtuy1NxLax140EKICO4itYx2/94=
X-Received: by 2002:ac8:580e:0:b0:509:277c:a28a with SMTP id d75a77b69052e-50957d1623bmr75849361cf.24.1773452547053;
        Fri, 13 Mar 2026 18:42:27 -0700 (PDT)
X-Received: by 2002:ac8:580e:0:b0:509:277c:a28a with SMTP id d75a77b69052e-50957d1623bmr75849201cf.24.1773452546496;
        Fri, 13 Mar 2026 18:42:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15981e963sm1448727e87.64.2026.03.13.18.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:42:24 -0700 (PDT)
Date: Sat, 14 Mar 2026 03:42:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH] interconnect: qcom: sm8450: Fix NULL pointer dereference
 in icc_link_nodes()
Message-ID: <xsc47isjkoozsyip3jfk7byyywi3iq5gp3ldmrvuolthzfegbf@qz7cmcro532m>
References: <20260314012933.350644-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314012933.350644-1-vladimir.zapolskiy@linaro.org>
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b4bd03 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=dC--IIKdycn-tNnL_gkA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 2Z8z79iKV402k8PAi7AEg48RBdrKzXLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAxMSBTYWx0ZWRfX1pkNEprUtQ0N
 P1/LRTSHsqpa5lG5ml6KPDLjFAdcMs4gx7zm1gspANV+jcuxXG9ZM/uEggpHVeCaXraU1VesJfy
 Hk4zgucvbNBFuXi8c7d/gnfa4L7U2TKszc2RcPG1F/1q1c3cVtgxryxtd/eoLxADBtHHVBpcvr+
 Y0yglSsNwGlDJKIj0PT6BGKJ/IauD5LWUmQQyuUIhc/BjdYEKbN8X3urW3fIIc+UCfC4ivBxyJV
 jEw3bAWCwukGEmQ8tvdzFWLmuBRv0ZWJHIaBXf2t1wc4tnKSRIBPMwqu6RK35gzmYbKZ3BFxCF1
 PeoaRhPy5eAiKs3F8l+0BVglCFj5/IuiRLcHjsx+24ec5IrypWi4kbkT1Xfw5JuqB1TI1m1SVt5
 AGEK8fFn0SFc4pEan061AT6eYSYCO/FCSO7YjZnm6eS2dedEDATF/ezQgwwUWTQahtAkoSGDXDx
 Mm/EGS5lb/oo65SGGFQ==
X-Proofpoint-GUID: 2Z8z79iKV402k8PAi7AEg48RBdrKzXLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_05,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140011
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97658-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0CF5128B468
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 03:29:33AM +0200, Vladimir Zapolskiy wrote:
> The change to dynamic IDs for SM8450 platform interconnects left two links
> unconverted, fix it to avoid the NULL pointer dereference in runtime,
> when a pointer to a destination interconnect is not valid:
> 
>     Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
>     <...>
>     Call trace:
>       icc_link_nodes+0x3c/0x100 (P)
>       qcom_icc_rpmh_probe+0x1b4/0x528
>       platform_probe+0x64/0xc0
>       really_probe+0xc4/0x2a8
>       __driver_probe_device+0x80/0x140
>       driver_probe_device+0x48/0x170
>       __device_attach_driver+0xc0/0x148
>       bus_for_each_drv+0x88/0xf0
>       __device_attach+0xb0/0x1c0
>       device_initial_probe+0x58/0x68
>       bus_probe_device+0x40/0xb8
>       deferred_probe_work_func+0x90/0xd0
>       process_one_work+0x15c/0x3c0
>       worker_thread+0x2e8/0x400
>       kthread+0x150/0x208
>       ret_from_fork+0x10/0x20
>      Code: 900310f4 911d6294 91008280 94176078 (f94002a0)
>      ---[ end trace 0000000000000000 ]---
>      Kernel panic - not syncing: Oops: Fatal exception

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

