Return-Path: <linux-arm-msm+bounces-99760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMOyB7Ebw2mJoQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 00:18:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD7C31DAE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 00:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6883308684E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DFF3CAE6D;
	Tue, 24 Mar 2026 23:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="btU7iNDb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLCKJ5vL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FDF35C185
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 23:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774394278; cv=none; b=mszzvKrS68B6zmgMFdDELcYCpeuEEFB2MQcTlPxce7JVxyNmYYfdirnS9OkzhhBngnKBFwJ1cl+dIV7FEn3gg8yQZkqISbedtLb3++AK/WdUiCFZRJrxZyBRD2XcR2uziCnYtDnOehs4aX6KKiFljaMst2wdy+m9nc1+Q7OePXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774394278; c=relaxed/simple;
	bh=pE7oP9GMA+5Msc58ZMUaHgUyNlMovSG6AN1Nw70TWW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NP75vPhV4hRB5rAVcrNn2TO7FUSrq1t/HBRKcvN6PrDi0eETvwdjBdj3+7k9Gy+oNsgGDZyFChW2PEIb5ZMi4DBu3ZEjQ7YPexNNx2hYkOicFJRS28Wz9Us+rciSIGYW/OsZipkd4DrqzuX37jsFEdsj7nxcG+iKDkWJ+NlploI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=btU7iNDb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLCKJ5vL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCtAB2807972
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 23:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3It4PEVy+km3wKWvS2USN+N6
	bgWyxf4GAl8CNmjXKHM=; b=btU7iNDbIn+XICdGqWd4uUtBGaqIJLOJtGhXwtJq
	Z9cHFsMAL66L2rU/LF2hfb33Dso5bO2cCbnZ+73wB9rqB0qQhOEbckb/jk/TPfKd
	JmkA1kQewK0xLyRRXLJyJ1eSczNPVXFahHxL5HHm7/iwYNuTpatjaajVq1kU0tIS
	F76g+lrwq8s9zQpcdprXGvBypqKYHVUm7XAxaoXcPOTJjTh9iR1yWT5q4Lz3PlET
	RlGUnXY0R6/gJ2Albe0RPKgvtfI3mEkNZXxKkP7WTHze8IRbHQipEgUtLji9O0dR
	mxkcQHahknwzAlj8mRh7HsAp2RanJMkGpqyuIkQikknVPg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9ejewr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 23:17:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091327215dso1422231cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774394275; x=1774999075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3It4PEVy+km3wKWvS2USN+N6bgWyxf4GAl8CNmjXKHM=;
        b=DLCKJ5vLxdUxZIkrcKwE6x0cErFKwociAEYWT0bf1qO90hMQGO8pcmyQv7snBS9X34
         /b3U+UBZQcsz+v1ppVfw0qwf7IYtYqDBEzEstFWbtUKGP1hLTJCLZQ1f25GIG9EsVut1
         BJ4Dsf+TDxTjAPsLSPpcrXItXU86QICP52KMC1j5eTf244T7iUWVLHF6uwm1YZHuThKO
         pG4MqUg1M/SlkTAUg7c/+XZDm9DT6hagS+sxYAJjVvY8Muvmv3+v6qRtDeiREu3nFRM8
         nQP6VuNCxryS/FFf5XxXBpEERFhXXrTfyiyEK37HJpnkiuYh1nrzwHjs07PyEcxvfxZ4
         eHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774394275; x=1774999075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3It4PEVy+km3wKWvS2USN+N6bgWyxf4GAl8CNmjXKHM=;
        b=RhgC/WYfiNL06RlFzBCmMbgTRfALArcbv6KD0Yf15F140QozApJsTZ1je0cbMyZG4g
         waq6weRBMwkJuUTT4js/Fvrj360JuXTpBc/G6PqX8VKiVJmp7jb6i/j7GlEGO1udCN76
         o8niy5Tjop25ImQLAmLAMWE7AhFim0IVOWOmkNm3QwKo4HRtZpsQaVvW41I4SXIqRVFm
         6O12qDgueVkxm9omk5IzZ9Tbct+heujE2VHNpaaV2HkuKdQgKkHHZowVBiHQVl4ndQIA
         dQDN5Uq3DaZ46hQLLjZiQF4qa7gL4+HcDn/jh7T2vobGFvPEjOs6Sm1ngq8cQH13e2m+
         Z9eg==
X-Forwarded-Encrypted: i=1; AJvYcCVuz0F8TGnjnp5IV3STfZrXVyUXe4xsKsLDUHq3G9u4/fLX6xJJO/n2GbTSa5TPtGftOaaNmvU7IzOs0Iuq@vger.kernel.org
X-Gm-Message-State: AOJu0YwKJs7p/SfZoMobMPxLkobnCuI8AemKZsGytTk+TAVHjxweIAxM
	GF0LbKiQGhx65Z9E432lqYRM0OXJv8XaJvERA17rW4XyM+vGhTwEwK4QItRqn1oh+d6Yhac7OZD
	UtjwW5oxAZ5krEg0tSArQNRAujDaLO8DBfrDcKtwaRZ+bL3hzGrjviCRmCqQ6vUjjTMJJ
X-Gm-Gg: ATEYQzw7pn951v6aH2zNUsbGRzBHl/QwL+yFsrS6EgN1v5quXcXJSyLkFvHye4+y52Y
	sCLTqtDS5uNQZyiHH+bsoARYqdOU1KN6linSpZsB9RI+tjcn2kZ1y2ExJNzz0t7cRfQ25B6GD8n
	wQxLj5KGMH4frpsjAIEhaxrTXQAxNg25N1WZjBETFkVOph2uz/uUPF6a0wSnPC2ICKIXMjzOxt5
	EBvtZ+Ok7vwwjN6Z+FrrnAnu+NqMQtwfsuJFT0Fqd8qk45vbLJKHEYaD39Fk7XbSKuFlX5X7Ghp
	3qXKOBeAzivSFCYLtyA7eVsgNMTD/4c1PpNSXKzv/aOlQRCp8koCiOw1YTYRBS//L7ne6pMUAo6
	6Kx7uPs3ZwxwW0ky4EK9ONw2WAnmrtj682ZSTS1kr8dW1R/bRdcJPf1M5p/TWQV3zYtXhFsXp0X
	czzhQmLMsTdOFeU8cxyRZVpeuvAtdzPevhnW8=
X-Received: by 2002:ac8:4993:0:b0:508:ff31:47f1 with SMTP id d75a77b69052e-50b80e27924mr17236541cf.50.1774394275274;
        Tue, 24 Mar 2026 16:17:55 -0700 (PDT)
X-Received: by 2002:ac8:4993:0:b0:508:ff31:47f1 with SMTP id d75a77b69052e-50b80e27924mr17236361cf.50.1774394274817;
        Tue, 24 Mar 2026 16:17:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cf93sm3387648e87.84.2026.03.24.16.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 16:17:53 -0700 (PDT)
Date: Wed, 25 Mar 2026 01:17:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: bjorn.andersson@oss.qualcomm.com, konradybcio@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, wenst@chromium.org
Subject: Re: [PATCH] arm64: defconfig: Enable Pwrctrl and Pwrseq drivers for
 PCI
Message-ID: <ctxo5pd44amrso2ece3mxvfiaz6piv442xgywywryvmowx7lrf@cwwkbosppc57>
References: <20260324073931.23739-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324073931.23739-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hMFE_jjTJ0PZ9js3f7btstlTY2yxOSpQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3OSBTYWx0ZWRfX+Eu/cTvBQxPF
 NOKx9cjyDky2+ojRU2NtsmHRY2U0tWg1qg2ylnspR1EkcQccVDMzG6r4uPODQ1BjS4QMJPOBaRt
 BTbNBMu1HAxdjy7rMB3xp+aivG6hIOMp8TVy60TlIN8CtahucAwWGfeEUhGhVMLgIm/AxsQz7Px
 MNqUwjtByh6aakTAEYvmcFUsepOB/Or51+2cT1VKDmQ2Wjm+V54hswIrK7myybsqZepaPU+BCRk
 ae50HUMoeyeGAOB/CA+rg4jPuxOWVwVh5ZfoQf6M0MwBjf3EyczdSc5DffMi7eAhxFGf69LeGed
 uOHXJXDZNUHMXfTQrAQly/8pK1Gtdbtnhkkh30k6ChhiapchaV4J+D15XzhfAFI30G7wc2U4/MW
 O1IUpE70KNaeXFl0hWdINzZcwHju7+ngNuj4KzaO5taUErqcjrq1nFdgSkvNSieGTLlXzSx0hR8
 /uBTO1zSgYXQAVOR75A==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c31ba4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=vI3K0WheX7ZiOrKn820A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: hMFE_jjTJ0PZ9js3f7btstlTY2yxOSpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240179
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99760-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7DD7C31DAE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 01:09:31PM +0530, Manivannan Sadhasivam wrote:
> PWRCTRL_GENERIC driver handles the power supply to the PCI slots and simple
> endpoint devices and POWER_SEQUENCING_PCIE_M2 handles the power supply to
> the PCIe M.2 connectors.

... which is required for a wide variety of ARM64 hardware, starting
from X Elite laptops...

With something like that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> 
> Note that CONFIG_PCI_PWRCTRL_SLOT is renamed to CONFIG_PCI_PWRCTRL_GENERIC in
> pci tree. But I presume no conflict since the PCI controller drivers themselves
> select this symbol as of now. I plan to drop those selections from controller
> drivers after v7.1-rc1.
> 
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 8a5309bb2029..597e013f709d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -259,6 +259,8 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
>  CONFIG_PCI_ENDPOINT=y
>  CONFIG_PCI_ENDPOINT_CONFIGFS=y
>  CONFIG_PCI_EPF_TEST=m
> +CONFIG_PCI_PWRCTRL_GENERIC=m
> +CONFIG_POWER_SEQUENCING_PCIE_M2=m
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_FW_LOADER_USER_HELPER=y
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

