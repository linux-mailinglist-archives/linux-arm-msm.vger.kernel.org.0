Return-Path: <linux-arm-msm+bounces-114287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8QvVE8KCO2oaZAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:09:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1346A6BC09A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:09:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CqSNSF8R;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AtU+nECq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114287-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114287-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89E343029538
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413F538C421;
	Wed, 24 Jun 2026 07:09:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51D638B7D2
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:09:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284985; cv=none; b=bqDuSjgec6bdIw4bf/mzyeeIpi47YvOxxNbZmU9Ch/UAZGNtGMsWN2oyU9zzWkXR5/os7sMgmgeD3mU1/Nu9xDzlP5cPeeiW7S4iDSD14fKCPzxAK7gaoAoSp2S4YP3IfceY1eUIX8Nc8xBDQfPXvFgkgvkZtT5OKO/DKmExDXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284985; c=relaxed/simple;
	bh=RRx0OyRJz0v0mrnwaN1jNi07aomWPrzKeKJkv5FozUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZYcCShWuLJBDk9O1oYpDMCNGkGh6UMpxQGwwKldv0S8DRmfpX/i1zrmSMvw37OEucyCLBU4ZANmD7ZZ6fIevYkjGgVJSszlKUU3xidfaRbWmoqRCpFoWO88g2ycgGKRdw3IqU9gLRrn3nJVh+PDsalFmDBdCvOrLm3ikuoCLjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqSNSF8R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtU+nECq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uHhc2460740
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9IlgppSiWE3A++/+8Jg0JE1d
	yFq8UkZtwHjTf83GQSA=; b=CqSNSF8Rqf0pNDc7O+3VMu1tS9uje5cNKkWUDAFa
	X66EoINLpg0k9UV/S7cSa9Q7Bv8cQwFnjx6OADk2/vaS276XWBzwDXEgu8Bv0H/0
	GFel0v5uUfmBvgNoY29FTbwGc9SrT+aYHQfTJjQSbUQsf5F2PdSn1LOrDtunMzl7
	eaMSKirlJrXTvAS0gPDApH0V09l5RMTZP/VQL5elHWBTi9hnJUq0SqeY1fkssyrf
	P6lrYVVb91MmPvCvdPnA0TVIEFNIDDqpXSKUOMXYmuc8XtZR/Z0oHNAajthEPePB
	aHhVYB3T0W1PaRGRb4sah5my+ax+tT+9M4RI2na5dQsCQg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh3mfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:09:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c76be5dd09so5235285ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 00:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782284980; x=1782889780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9IlgppSiWE3A++/+8Jg0JE1dyFq8UkZtwHjTf83GQSA=;
        b=AtU+nECqipZg9U6KEQYU/YcD9o8dm/YSXEYbrn8tdc7Raa6oK9qx9v7hIIIJrTFh0Z
         UT4gG35X8l6C1cZEK6IyeGGamcUQVYnRglM5o53VBHsyV8zfsi5hRPnjb0sCkeYtis5C
         wT9FcAbzudfUvvqEDwkz7QNv++ddsuK6bJDvYHYDr7lWsIx3Os4TXo3AS04MQYUkxPmL
         W4xUnRJr0dDTLZ1poc1xC1V9TedWzTfwDt2wUq0hgAnFbmzMHKz5TEzdrNmju/h2X/N7
         YgqN36P0x555ufRqQEeXYE3w8MsBNh71ImoPCzKZwclmppdzT2Gyn2fMGqkZZ86+Pt7v
         gbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284980; x=1782889780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IlgppSiWE3A++/+8Jg0JE1dyFq8UkZtwHjTf83GQSA=;
        b=IjVqs/CCbYD+8/6g7oV3/9lC1hObkU/D/gX8Xl6t7igogXg1IikcFCV4rrGdVa4vwu
         ihz+1l1pCsDK70zTzZ8rkCFhExOWS752+Jw1oL5a8ISnu++PtrDst1l/ZZMqTSKSVo2q
         k88HdQITXr83G+/iiqLFhsa1SDFOUGPMKa8PEi94sD5V3fLqR4h63LouIHJejNeWUcoe
         4LTUqgXFv96UMRI9nNLScCxReZBGPUzWluN0YT/kZq8qekeft8bvgdGj5M/+3QrGKQ6S
         enoZm5YLV7D6tBa47uEt2rmPUujANWEMqJaINgqTrTXWQrBdWSqvQ4RhBZ1Hldr10IMr
         D8kg==
X-Forwarded-Encrypted: i=1; AHgh+Rod3yuhXxOlMVP0vwDoPZiuJSrR/4rl+Wk0a2ts58x2TuiivB+ZonlX2Iqi+462K91BFwZIJlfHKSo9GWvy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3aQw0rZBMZ+F0FBCewuLdNDlP6szgTsMhDfs2+YAMjMI7KONH
	T87e8P4sxks/AjHwOzROnazZrDX7OhyRvSQqsQ2gda05frn2hCLvilFPk6Zox81cVVHdo8FaQml
	6GJAyGd/s22hq3aKqDhNWOYw9xJR69qykc8rAhfp1jbChyBhMLZKBxDc9eW1IyHqB1UBm
X-Gm-Gg: AfdE7cnjgHCG6NejJVGOsN+RdvQsqO8J/C3WhZXnXpbNfNv8J90mwoUWmdoTozQNXlG
	X9dHDpmy0pCDcEhSX7BHPXLKjzopQRufxwTI/e4yuP4HLtT2aW8XjuEht7X/NS0akTXJuZZaQV6
	etlY5MuVtX9Ulg1ozFbZptJIEmBey1AKJXVzNv7IUuUN7iskPRPWSjzsYzCSSX1YUI3dJWIalns
	NHgoLvVBJC84kYwVwmQ5Hd1NDHwgzlGzC9J7ArjabBLCsRLdUWNOeBrFvwekF5nUejp8xcW2i98
	ZmCRob9O4S5/tdxyfk7qj9rlmk+ok4bm6XHtVW6P9JVrsxoXRCXnsXsLgsEun+VI2xX6sluqmDG
	xb86YcnmSPrsyfAYLtajD13u0xRznW9RjbnlzRQ==
X-Received: by 2002:a17:902:ea12:b0:2c6:a76c:3c6a with SMTP id d9443c01a7336-2c7e1465892mr24755045ad.9.1782284979667;
        Wed, 24 Jun 2026 00:09:39 -0700 (PDT)
X-Received: by 2002:a17:902:ea12:b0:2c6:a76c:3c6a with SMTP id d9443c01a7336-2c7e1465892mr24754725ad.9.1782284979115;
        Wed, 24 Jun 2026 00:09:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af590sm147977225ad.17.2026.06.24.00.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 00:09:38 -0700 (PDT)
Date: Wed, 24 Jun 2026 12:39:29 +0530
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
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v7 6/6] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Message-ID: <20260624070929.vvvtjdoe73xwa7lh@hu-mojha-hyd.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
 <20260623-knp-soccp-v7-6-1ec7bb5c9fec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-knp-soccp-v7-6-1ec7bb5c9fec@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA1NyBTYWx0ZWRfX39btehIRLeyU
 gDWyhHpLn3ziDkpeNHJw8L7lU3w8ivvK/n09huo+yDjRZVQRYjKcIv6RX3R/FUrz698imhHDk29
 Eog8Zpf5HkwwPBG9XmmuXG8+ay1rmnwE7Fpeb6/POygKx0iY1QdNsM0R0vmVOaw/Ug17vPDtvFl
 YZXiIt4QyMFNyifeQwA1W4L7rRXspfdEXTSEPFWg9iOcQTU+uzZ0XdsOg2OXnN60dT67wTIBP8g
 uTDQGED4C7TbJUtj4Hdpsg2mY+5s/FyCT42Y8SYBxYAvLQ3NHJc3TKEiX/pAW1dsa50VU0zPgvR
 NFN+lXlzpM8q3m4e8mL2uTqM4swkur4O2+8IUexektbY4E7N/YgcFS1bYTTtyLaWr9ElMsUBMuN
 yrH0zqHczXszeFu10/xZK0QgeVvFrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA1NyBTYWx0ZWRfXxdfx4y9VZhR7
 xgYh8tmJUFUguPjJ9YAhAM0Qg1llHRB5tDsoikKWyoy9RlQEMD/EJ8prnGEvWAwSocXUEzYo4vl
 3fYWQn4ebalzHT5j8lwKKKVQASZqicc=
X-Proofpoint-GUID: CgoWX9H6KRIrmOMJfBrLDPQk-vDwue_W
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3b82b4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VPJvJ4v_ho0jEmeUjHsA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: CgoWX9H6KRIrmOMJfBrLDPQk-vDwue_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114287-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-mojha-hyd.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:bibek.patro@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konradybcio@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1346A6BC09A

On Tue, Jun 23, 2026 at 03:05:22AM -0700, Jingyi Wang wrote:
> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> It provides a solution for control-plane processing, reducing per-subsystem
> microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
> platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 8a0bb4b2e71c..60a4337d9e51 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1640,8 +1640,26 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
>  	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
>  };
>  
> +static const struct qcom_pas_data kaanapali_soccp_resource = {
> +	.crash_reason_smem = 656,
> +	.firmware_name = "soccp.mbn",
> +	.dtb_firmware_name = "soccp_dtb.mbn",
> +	.pas_id = 51,
> +	.dtb_pas_id = 0x41,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "soccp",
> +	.sysmon_name = "soccp",
> +	.auto_boot = true,
> +	.early_boot = true,
> +};
> +
>  static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
> +	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
>  	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
>  	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
>  	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },
> 

Since, this is fully compatible with Hawi SoC, I tested it on Hawi SoC.

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Hawi SoC

-- 
-Mukesh Ojha

