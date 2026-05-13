Return-Path: <linux-arm-msm+bounces-107473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJCQLovOBGrLPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:18:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC3D539C5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 153AC3017519
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D5A3AEB37;
	Wed, 13 May 2026 19:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fC9U2hIq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OesHjkJv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884FF3B4E9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699908; cv=none; b=SppDIgNj2Rlve/0zYNzigNQSRu/9Y8QOiGI9rHvrkxZ4UxnytD3K314xz/kQdWGSox8vWxMW2pHksYZqMt3EOlqMIWMGO9/SLWD6YH8zXvm5h6+O/QNvqV0c3xImXxd3r/Z5HfgiOCh64dnOFZ+0McQNNHWD8u4OCMMjcYsDoLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699908; c=relaxed/simple;
	bh=TOFV5FhHLTg90n8Ys2jf0xrJ28wQs3Tgz03VtgjgC6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqc/01/iNYexwIgRUoilxSVS//AXxPKV/GOpavn1IhW0ekVt884Bt+FRmChcjwODdjkQdLXTJYNd4TGQfwwb75ljlLtwdm+stQAsMJ5ekzvdE0TYB8wPQLeqLcfuxInnE8oro+SNSb+oJLuNNP8t7yC3uWaaTcaRmEzXlbBxyag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fC9U2hIq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OesHjkJv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGuOOX3995749
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dPgTJ9BxVj52ozj6Tom5mPIW
	gYq2r83+vLDiB7tPbgM=; b=fC9U2hIqlrwbWq+tyK8jBrdx5YSB/8GCiBVx+oxa
	Vfdpv9GYH5aW769O2OO3xvamqnkKxhNmrPONO23qZBu8Bi1xMmn0CQdR155rmULY
	rv4xi7JzjeO1VYN516jJ4PC3+Tw/ibVs2QgfbZWF5WTOtTWgT2DLxuWOKWKLSnRY
	EKf159l2xFGvzl9K8EHIklIiLSY00hg6SI1VYgwYP9QsEq2kucCizcHvE2ZlEmT6
	vr8qMEjRLgNo1teIfVC+hHHcIBncKLQn18+/vbwVC9vWP/XiSKiND+vYEZ09cvWI
	qQR9KrB9SND7/UlnN3PInDLrcXyQoMzdnk10y0fu1wR3vA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4w8urksy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:18:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5147078691fso165309421cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778699905; x=1779304705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dPgTJ9BxVj52ozj6Tom5mPIWgYq2r83+vLDiB7tPbgM=;
        b=OesHjkJvcP3WmSihu7uf8mJFNVY4TebH44zh4QYlG6MCJI4NUsB3qCDN6k4J0lwhWO
         Je3KVZai8WOHcTws7Gu0tMcIG0IzY+N5O9eoYAbmbsuvlZu66JQbXDk3dgxEpI0+1E63
         00igX68nVNnrRuVwURlfIdIJPPSxuLo47i4vAk5picPLZ6HAWyMp35tQKNUWEET47ISv
         VlwgcSUlCAgk8NSDR9bITccAX2xtK6yLV1YGVKTawhRSpSBuIYiDEZ/Sk0POjPCDqkXw
         yX/6vJQ3F5INzPd4kpNhdzGccy2KokvVBmR8GOt1oJsbtGKu447RyoC8EQGjeIf8fAb8
         V0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778699905; x=1779304705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPgTJ9BxVj52ozj6Tom5mPIWgYq2r83+vLDiB7tPbgM=;
        b=Z0YAgvgYJ2maQG+YOh9hy27MCu8CiuoLsoakfSh7WCzvElk8EKsmG4mIgeEEBhWmpd
         MI6R84+mEPYHiKzhMv3x5H6wdHpT20PWFOErbe0JUDTvUUUq/f59+DxkiqlSgr7p6iKn
         ZGuuvT5SY4I/hbDEfiCKOLc56YRkDmc8REqq9vNJ2KSA+tDCv72vG7Fq5ZBnC/X3Tf3+
         bbRCrBVxgNEK4tQbxadFWHVew+M+iI6eo78QrucRD8SgdUo443FpEKEZyGEptXJCDVTu
         ZinDI35qVXLpjFAG04ZrSVmr5fd3ibNBtPc1TpXyOjVIEa6UFCInqElKRMf6xNx85exz
         QUcA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZzMXFAeX+rL/CD9EHzFde03pDeiIPD3ZIHvzmF1L5NQ0Kc8MR8cZV6x/D6psPmZ4x95yDYrKrPf6HYlhW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4d/sbWIhKJjMsM9jWv/zggliDJkI5fbwvB/+ZCA/x0B2f9/zh
	i56RejrEtFAUEfiHDgNQtv3XuEnbvBvra4jL419QilrQe7BZOzws3e20xgnUfpxjCt84ZaAa9B/
	PpHn8RrmTzB+soXO3drwYrqHLFHlft3vPKqoo+WyxVC8YGjQmpzoEV2AeGzeHpRMWk22P
X-Gm-Gg: Acq92OE9BfXwRVdZPLDJ87nYQm7/+UUmqeYfM5grbkTdVDmgewz5xyeBbn37RJzYLEt
	UU6cCavOxY3sYQlCSJG+t3Rt3iFMF3+loFZ7LBoAtA3LVWdAHozvlIFKLDul3HukqzczYK6dk1y
	sNgV/numTgm+HZmSsqQtgH1CogT4QzISJmuVy0rzYukUScIaffz4mIW2rtLYLtVKptyyhPbJRAx
	Uis7vNQp2B2sOr0blCXDMVvzMDD0zlT1HFt7yVsfpepwML9T2h0RM4ZbYYpAzexQWqMMXxT5Yg1
	wGDQMujgxCTm2ZA+2i/CkULM4BTgP1D+fgHsLLqxrwIZS6y3ckp1/SX6Rvy8AI91euhd0GZZw9p
	2mUbrOlfdR6fDvX/JhKrWfTcdbu4dyTsPTvN2MfUouVsdplE/c4fToEymHyenkKmMADJJ1s7Y2Z
	Y/nO9iOLpUm8Dyhk3FE/qIviER82zB2yoNdlg=
X-Received: by 2002:a05:622a:190d:b0:50f:bc35:aae with SMTP id d75a77b69052e-5162ff73829mr61259171cf.52.1778699904728;
        Wed, 13 May 2026 12:18:24 -0700 (PDT)
X-Received: by 2002:a05:622a:190d:b0:50f:bc35:aae with SMTP id d75a77b69052e-5162ff73829mr61258141cf.52.1778699903767;
        Wed, 13 May 2026 12:18:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cab2808sm626681fa.19.2026.05.13.12.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 12:18:22 -0700 (PDT)
Date: Wed, 13 May 2026 22:18:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
Message-ID: <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WP1PmHsR c=1 sm=1 tr=0 ts=6a04ce81 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=OX9z2a93DQOUP5chVv8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: n3O5XfPdtFDnpm3FENdeApAdX5E38vO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE5MSBTYWx0ZWRfX1zRUCFcj+MCs
 gsgU1uxgsph8itR/bMOi/Mq9ZXlACSPPU60BYoFQXAI5iQ38Eyvijq2dyczw8A4jmjiHrx/JcoB
 8W64nj8J0meIyqr5z0XMbaHG9thOT58z+6QPO6wJkOUAGk8J+VEmu/giLIY9p7kuFsTi8YXGa27
 pqfgMmS49oDSkVmqFTFTDuagKabL234EXk6Wb899UXF8Zv9LhD1kOsbpjfsPhOds3jmj8kSKbp7
 nT64dQ4gUBYkT6VJafNps1s+60FyEentz8crpvRyU3slHwotpdn3M6evT4yiaItARBOZgivUMZC
 XEM15PiSKE6b+h8rJFvS0oXg59PmszlGXF0yGGvgDDEFd5vig50vFcWwW6KbZdVJ6mihiA8UAXV
 0i0MGrqdHzKSiU+zd/XV3KzopsyPkrg/R4TQcb4sVa8JGsH4YzdNQdj2s1Oycmep7hm8UaMXs06
 QuMU4Q7oaPq0Ol+UQ6g==
X-Proofpoint-ORIG-GUID: n3O5XfPdtFDnpm3FENdeApAdX5E38vO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130191
X-Rspamd-Queue-Id: 3CC3D539C5A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107473-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 12:17:31AM +0530, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
> for the Qualcomm Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 51 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..4d43201b9ada 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1457,6 +1457,54 @@ static const struct qcom_pas_data sc7280_wpss_resource = {
>  	.ssctl_id = 0x19,
>  };
>  
> +static const struct qcom_pas_data shikra_cdsp_resource = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp.mbn",
> +	.pas_id = 18,
> +	.minidump_id = 7,
> +	.auto_boot = false,

Why? It should be true for CDSP.

> +	.proxy_pd_names = (char *[]){
> +		"cx",
> +		NULL
> +	},

Hmm, SM6115 didn't have proxy votes here. Is it requried?

> +	.load_state = "cdsp",
> +	.ssr_name = "cdsp",
> +	.sysmon_name = "cdsp",
> +	.ssctl_id = 0x17,
> +	.smem_host_id = 5,
> +	.region_assign_vmid = QCOM_SCM_VMID_CDSP,

This makes no sense without region_assign_count

> +};
> +
> +static const struct qcom_pas_data shikra_lpaicp_resource = {
> +	.crash_reason_smem = 682,
> +	.firmware_name = "lpaicp.mbn",
> +	.dtb_firmware_name = "lpaicp_dtb.mbn",
> +	.pas_id = 0x56,
> +	.dtb_pas_id = 0x57,
> +	.minidump_id = 0,
> +	.auto_boot = true,
> +	.ssr_name = "lpaicp",
> +	.sysmon_name = "lpaicp",
> +};
> +
> +static const struct qcom_pas_data shikra_mpss_resource = {
> +	.crash_reason_smem = 421,
> +	.firmware_name = "qdsp6sw.mbn",

Why is it not modem.mbn?

> +	.pas_id = 4,
> +	.minidump_id = 3,
> +	.auto_boot = false,
> +	.decrypt_shutdown = true,
> +	.proxy_pd_names = (char *[]){
> +		"cx",
> +		NULL
> +	},
> +	.load_state = "modem",
> +	.ssr_name = "mpss",
> +	.sysmon_name = "modem",
> +	.ssctl_id = 0x12,
> +	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,

Again, this doesn't make sense without region_assign_count. At which
point you can use sc8180x_mpss_resource instead.

> +};
> +
>  static const struct qcom_pas_data sm8650_cdsp_resource = {
>  	.crash_reason_smem = 601,
>  	.firmware_name = "cdsp.mdt",
> @@ -1571,6 +1619,9 @@ static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
>  	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource },
>  	{ .compatible = "qcom,sdx75-mpss-pas", .data = &sm8650_mpss_resource },
> +	{ .compatible = "qcom,shikra-cdsp-pas", .data = &shikra_cdsp_resource },
> +	{ .compatible = "qcom,shikra-lpaicp-pas", .data = &shikra_lpaicp_resource },
> +	{ .compatible = "qcom,shikra-mpss-pas", .data = &shikra_mpss_resource },
>  	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init },
>  	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init },
>  	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

