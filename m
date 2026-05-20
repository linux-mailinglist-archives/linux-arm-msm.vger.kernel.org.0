Return-Path: <linux-arm-msm+bounces-108643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO4JCtd0DWrSxgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:46:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 816B258A0A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5643930480B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833B63A5438;
	Wed, 20 May 2026 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0L0DN5b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikHNApbH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51763AB27C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779265680; cv=none; b=ds6dPKUOCKWauxwVFVYz0EvILy3JQ/Eyo4A0akCkpPCJlL5c3mhVstJZ4s/5MQnfHxFYCe+Jr2Agbk8uXDDwYdRBDUipjj74vpUGrsKYZEVztFYS2JzasorANvLrQSpkOBBIAL5KcaE6rgWwqAkp6TBC5QfztfVfC+S2oqmx8/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779265680; c=relaxed/simple;
	bh=VxAoNW25Ujt504peYxTkE8zYDZN7ss6BYNIQX9Q7toM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfmB4UyZM1PQYuR4I7LDFhU63nExxBKstlKF9Ykliua0WhUTS7niuO+pDzVh/sCEBNzqsmMGIOByW58WhauSQVkczKpB0QpgacFjihLhzIYiDSJJ430/TpBEOEQAPCs9DuQ1RO3GW17TnAPyJRBVvTkTsEXa7Msr/m0m42eXlWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0L0DN5b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikHNApbH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K731Nf1725453
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dMP+5E3spei8NZdRJwHgG/2/
	qxpbiRP3qgzbcSPUzi8=; b=P0L0DN5bZDsY4P75O1+TE5maTcjFcMq60HAljLUa
	MrfNh2j5YGd8Z0K/32NLCKEIC9hkJj8buLdtTaifnGBcj8G6MeMva5aX4p6wJkfS
	3/y+84tel81M4+QhUBq9+zp6aVGBj2EnDAlw7ac0rPnXD5vcjo/bC3mXRk48Sknq
	N6sKK/eFQ5g8CbxGwCuwgUoL8cBK+t+PCacqGoe7iJ4LmqdpD5ssXygEe2EwitYB
	9RuUgqDj7IUd5laM8Jew1iTLa5G9D1ZQHoasvbfHm6RPQflp7DZtZezwbOK7RD6G
	9mU5KteR6s9elUK6ymy2W/NEX/aVwwWtLkRFRucX02TKBQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qkt4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:27:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso2771954b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 01:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779265677; x=1779870477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dMP+5E3spei8NZdRJwHgG/2/qxpbiRP3qgzbcSPUzi8=;
        b=ikHNApbH6UaggCHCJEGDCJzAarDhRpK+gsbUfa5B82HJJUYVGTA9M7aY2niLNPDVTA
         8ZnGX1CEraedo2U3R2uY6LVWgShfw4rzRU8AGo5UGu5frj5xYSupzaV0qjFe/nXHwlUS
         p+lyuScrySvzUqCok4OD3mjWH5YiH6eMUTwenl2nuJUZMZvbYmBmgF7ZJTOzC2rIVQuS
         mkMXoZQ4nQ24HoFq3vh+RGQoRoGu8eKLqgX9qqzcQ/cboBFmurFx8YasJib3IXhz+FJ2
         cQLnKEM/e4J/LElATdI5So8qe4Fh2J3MUvmqOdmbqAKxUxa9hLKaCLD0sF5v8Pgv2L+z
         0Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265677; x=1779870477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMP+5E3spei8NZdRJwHgG/2/qxpbiRP3qgzbcSPUzi8=;
        b=NjkK457HQjpc7MACUMEAXTCQ+Yqg4H4lCtgm35AAJVJ6QmmL86k5gR0Kag0xYXpMeY
         fYk7vNsziCwEsvKqUjdjEBRNkikEJa3Zzpnon6L/X96gzsBCOZ8KNfPMQJSy/skS6AOK
         AEzKyWhubrNVnkRqAPrrcsuyVJuYXrdkTGqyXt14WKOM1xmyoL+zHbWXLBCO0vPN1b5e
         7F/0p2XzeNS2FyX4N99jzx+KQWLOoO0NHK/BEAgYA9rIxBR4CfBbbL2MmZgQCUQJUXbU
         I1ID+gG6MaEIRf6x0R1MWigxpiftUpSnEuXBi21RCNYZBucjsO5ZMveAYVWlUxr6Gyvx
         ouQw==
X-Forwarded-Encrypted: i=1; AFNElJ+/TjiwxpuPdjdGyMuqSNeq45yOncWunTp8BPtNUeqKd5eXaU3VmEYz0wiivVCC+JIvwkEjkIDDXAVBD5Ku@vger.kernel.org
X-Gm-Message-State: AOJu0YwSsalrD3TRptpo3WHK3oTU08mmwqDW/VD1ArhcLbAySnnc4KDq
	8exwaXoi0o/pdH3J5fEuzgoiXHzTXIwBT4h27kO5d9ImPSTXwYsmfffv+j6V0gG9QFtKBZFwTPG
	RmEPZTXhy6TFLrP/LdY8Y+RcL0NSx9p3/ukZ1kAG2atmi7TM4U4jp83P3LR60B9OzxkLP
X-Gm-Gg: Acq92OG0Or+gjQbJ0VrNHD8Rn+D6Uy5x+TT1jFfx/eQvlvLsWvDlQTDsJ1LW/RxsGYV
	uXXdzSvrvuBQIz4nK5c+MHC7vFC/b3fHpnZugZPW60bkyM2Q5BemR7Qz1Q1JRgaOce1Sudp+fs8
	EoWyonNOuvSOMrzYLWQniByvnLZXEaxEsPLpLD6+KqNtR08+AFpgskC/fC7me82AvLfk9rCyVre
	G3vhtmJLzVTwNtd6z8nCWw40KVFKc+7U2zSVqKmcbHrGkeTXWAjy9JVdPkrCLUCnwdPqOA7azED
	2NKrluH1BTZVm4M/PJtLd4DiiQWeKb4oYdZFLt5fed82QmrtPVpaFarfem6acVpzyTj/mtF+2a0
	hmiA9Lpe5GQysAUCjg3/nSLrwFYRP5AOxDUE3zbr1sBL/yxfh
X-Received: by 2002:a05:6a00:4c13:b0:83b:a723:d704 with SMTP id d2e1a72fcca58-83f33c2be4amr21997931b3a.19.1779265676918;
        Wed, 20 May 2026 01:27:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c13:b0:83b:a723:d704 with SMTP id d2e1a72fcca58-83f33c2be4amr21997891b3a.19.1779265676390;
        Wed, 20 May 2026 01:27:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196638d0sm24595500b3a.7.2026.05.20.01.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:27:56 -0700 (PDT)
Date: Wed, 20 May 2026 13:57:47 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <20260520082747.7seyyua4gfv256ev@hu-mojha-hyd.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4MCBTYWx0ZWRfXw0GXSUUGLEeQ
 oouyqtFmdHM5oUbl4extOP5IhVmOKukzDAegslKxF7qmPfAKEBfwu8A/65CfRczZsqBGzelhqq2
 SzleHg7W0wH2pzD7YvDeHmtwWeq+v4UKB6tMujqju1/vcrm4+Pix+1jgdbp/fYiC5ZlBs79KpZP
 MSQ8KJg2VqEu8TGEK6DKmBA0/7lGkFWzmfbnI0PkI7mrJN0d6BT7mAVGY7ilSzy9mrMtKL2hwuQ
 MsYdlrR400L3Z6PZUyhZsJKX0FQqMm62XfCnVbrE6ppKAY0/1L9Qb6vbRjlkgVk6ZfHuXAS7hc6
 Xuuks2fYk+D/xydjgpNj7XJ9X/hCoSSaNEl2vQ08hOZ5LPEPhAJpjYb3hav7+4rsXkZLrq7k2Zy
 cTFvj0RP2TKjHVaLjEUmEWkC+J70e3Mqs3dK5iIwyantF244mMgK7ldh6kTzQ7ntWWoQKrnrVxv
 b+zq1Xslwsv0HDHWImw==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0d708d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4OTBKPfHZ21lbMHTwgYA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: OvL5P_GOlzY-MFcVF6NqxOIiJOQBLRa4
X-Proofpoint-ORIG-GUID: OvL5P_GOlzY-MFcVF6NqxOIiJOQBLRa4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200080
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108643-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 816B258A0A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits.
> 
> A new qcom_pas_attach() function is introduced. if a crash state is
> detected for the subsystem, rproc_report_crash() is called. If the ready
> state is detected, it will be marked as "attached", otherwise it could
> be the early boot feature is not supported by other entities. In this
> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> can load the firmware and start the remoteproc.
> 
> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..ac2a00aacd2e 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>  	int region_assign_count;
>  	bool region_assign_shared;
>  	int region_assign_vmid;
> +	bool early_boot;
>  };
>  
>  struct qcom_pas {
> @@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>  	return qcom_q6v5_panic(&pas->q6v5);
>  }
>  
> +static int qcom_pas_attach(struct rproc *rproc)
> +{
> +	int ret;
> +	struct qcom_pas *pas = rproc->priv;
> +	bool ready_state;
> +	bool crash_state;
> +
> +	pas->q6v5.handover_issued = true;
> +	enable_irq(pas->q6v5.handover_irq);
> +
> +	pas->q6v5.running = true;
> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +
> +	if (ret)
> +		goto disable_running;
> +
> +	if (crash_state) {
> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);

I am not sure if this is already discussed, but what if it is the first
crash with recovery and coredump enabled? What would be in the dump,
nothing? As there is no segment, is it expected since Linux did not load
this?

This is even true if it is a crash after a successful attach.

@Sibi, has this series been tested on Glymur with KVM?
I don't see the iommu property in the below patch.
https://lore.kernel.org/lkml/20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com/

-- 
-Mukesh Ojha

