Return-Path: <linux-arm-msm+bounces-106624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK4eHTG1/WkXhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:04:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E56A34F4B6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE446309C06B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 09:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658C733064A;
	Fri,  8 May 2026 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofeS1Rd3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a45L+mMn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB6E37AA8B
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234254; cv=none; b=c4fIVsIvWDSdKeijTPuI/n680YG+jXj758FWWwYoaYVNMqVinbOvnH/sjOyxZyA1zUTNcfnIUdXg+em+KoqP9zFeG8GgHu6qFPYWTnx9cGh/XVQ+rYa2Go6gZKeIIHT+rxEOoQiPO5a9P7KSqVLHVTNeEwXsmFkMxXHvHfxmCaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234254; c=relaxed/simple;
	bh=5E58D+EVQJVFrRxJAbfWFijvIQe461itWawamqbK6Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijj+C6JXASztGrf3hHeKHYgRzQ/ux3VZvtrm1AjVoxxvhLIq2CXgkh73LCz/GxSy6cYvwGx7pf5hQmwPyg2gq4rxCG+e9Cc3ARpOsRHaK6CmZZp01nD8aw8Cn1dtnhaght9ErQuWM3uHCHfPtjJklS9jZT5v38AJP3Q677OJm0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofeS1Rd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a45L+mMn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486GG4E4069395
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 09:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VOKsL2J49RtwwStWfXi2hXlW
	idwW72y1RKXh369+Eps=; b=ofeS1Rd3Q1DU1m+cYgr83/9VZmuty+jzKYGTCmm5
	MHwXoUZouZe8U3f1KN+BqaBTeMTvdhYOIWyfHRFKygYXWbLN7jR7XniVBid8hZ47
	2AZ0+z9s3Wk5hlTeyGvgS6xOaxRYuD1W4lLSS5r0nuXksr966uUUgS5JqK0ss33h
	5Ejflfbto3v7U28/jbnXJIwFEtRhkZEIVfNCXSMZZIrMyCGOd4cO2teDXM/NDjD6
	uUr1WawKgtsNGfUirXeHN1rLorLfZ+OGHo6yer3YAuzUkKTl/UAhuaTqPtOimRYM
	sTcVkZSpjsbTLQBPZUYEDCzctYjJytqLBK9UT891qGXUcg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp2cnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 09:57:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d890580e1so31653711cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234251; x=1778839051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VOKsL2J49RtwwStWfXi2hXlWidwW72y1RKXh369+Eps=;
        b=a45L+mMnjq3U8BMd5BaTdka0WdnbpOwG37T4RzK6FqRoaMpjIud0oh8v6/GiYhCgzd
         I5hhnSCOy6wZXHY6GBnk/MvME7k1viwNrFa3Ssx1rrQw3CoGO4C7AQlrY1xRgsZ1OiPq
         20k8uILZsfnzQHsQmFZfsPmkfxcbhN/pD8VkWrFX1VwCVyPd3GL04umksDEsTRKk61ny
         /7dPVVp/8fS+Zia7vEbqvJs8Nv5HhHmxHfGAU3OhV9peWFpYe93mGUB6hC3mODSkX2Ko
         LzV7E8luGV3w2/j8ATwv3invork4SQFrbYuX0rqKoSm7LkT18m5Kp8rzFiziO22dFZVO
         sPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234251; x=1778839051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOKsL2J49RtwwStWfXi2hXlWidwW72y1RKXh369+Eps=;
        b=honf7Kw/QIpQBQpABMRoXiWdUQKI7CZtYW+gWPEStWdykyzMbjUMkLWSCDIv1AfZLg
         kWHQDPciX0GAP1lPKpBqIoUzh83AtjdqShkPmY0IdcfJfkWSvOsGwsxRMg2RQyFCRErh
         YQLd5b9IzDwZS6b+tN9GPIS0c08PDueTXYTczlSmB6kpIQ+7OMSEp/sQ17RPxpwB62pD
         KZuEPJA9tO47Ha+Hixu8RXOl4lnW2bVFM9AzUmSxElHz3baZ9MQ3/ciczc7BoFz1gB7t
         Z1WcOiHNLeLPnfyqy6SY1ihdClVr2wL5uY/teEpcPZ+Kebn0vtd8oTKmtX48zeZVht0h
         gVSw==
X-Forwarded-Encrypted: i=1; AFNElJ+0lIapk/5VL/9W+OfeOEv61NDD1puxkmOZophHbMIMR1yOlmu4jVU4vTYomE8NC9DRSaXMAk93IqA06dg/@vger.kernel.org
X-Gm-Message-State: AOJu0YyOw5uLFwoCyJIKFGJdr9it5S0K9dUakyWeeq0NPvwlil92APJK
	16+wJTtCGQ92y1nYvuALApahNjPg4ra36H4Foj6c9FG8LLfGEhVFgphwfVj3gJIvaDRuMAvzRAR
	RAt3aSf26h6BAwDJd15NxZGGDT6C1HKVqMt+Q63IlsolvL19j+3neLz4w6Goi6eR6RIPe
X-Gm-Gg: AeBDiev5Osp/GiJU+4WwTv5sCOzz7x9fpvj4qIAoWwTwRWhyF7jZglpzmlW4UbhOMgw
	Wssv/DBPAWvEwDI2idzRyj6gWLa2M+IHHPHXuaM1zqAqcNtr07QZ/OReX3mSDXBxy78GMej6IqQ
	tr4zSWIS4kcdgAWS+PLzdRWbWwcrgY0tLLI1UG0Vn39vX7Ay5v41aNFrMYm2b+5nEXM/3WmOG/A
	R5QXS2AK8KHFa0cWhakwK/eZk3Qm8yFVKKed/8Pnh68vrytZGfY7EcMjLMTE3bQ5KrHrdyIikOi
	Emr4cVi1/p6zVysrk6pEmFAeiJE/lLoq5RAajiy0nAljR8b1Uu+JfaEPCKsjKiwdBluQVAb/rdT
	GQWIVQwwPiT1PfRELmbox7/YlylUmgifJaafFpYaf6gGttrKQuFd2iAueDoYC95BR6qrXv0gBhK
	9MF4hUhasVvwaVFiZfQs2xDdz5OvwG+l3iKkNtf682UJ/nMw==
X-Received: by 2002:ac8:5953:0:b0:50f:b3d2:6ee1 with SMTP id d75a77b69052e-51461fa0395mr155370811cf.31.1778234251079;
        Fri, 08 May 2026 02:57:31 -0700 (PDT)
X-Received: by 2002:ac8:5953:0:b0:50f:b3d2:6ee1 with SMTP id d75a77b69052e-51461fa0395mr155370361cf.31.1778234250536;
        Fri, 08 May 2026 02:57:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm375257e87.62.2026.05.08.02.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:57:29 -0700 (PDT)
Date: Fri, 8 May 2026 12:57:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC
 support
Message-ID: <n26qxqcft7rh24a77h454py2ye4kgzxiy6ib363vmuatp36mp6@otavb4hckcdw>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
 <20260508-shikra_mailbox_and_rpm_changes-v2-4-ab76fd9e71de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v2-4-ab76fd9e71de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMiBTYWx0ZWRfX/NmUaY/vCn+H
 4fOHXftlInDK4FZ98youyQJr6FxnkNAKawWMHKrVViLnIonRn7x0Eg80roxAOowm8kp051w29/m
 r3Mbl83DvsKQJBBUW3oiviI9vjcrtqsO5iDIkNkv2s2kfl+uai2GmdtTRsPlcLdP2u8jVUPq/1a
 A5Pak4N/U1F2f4c+643Bsus69fOhZXaI+i5ay1VSkG9hRMPpsQx2ER6UoWUYVWZ94KUEcouhrnp
 FWWp97xCpIBrJVbha0N1NITd9dmtYuvs3LXRZ0Sqc316YgXdVrTfL+uyqHcLheDnvITLWbacoc+
 UnhNRgRBCGYoMb70QaFx+pLfa6p8rdYRM95HqmxKWlU19agbiKUWpZOTX8VgudQ5Kc3bvaVMKgd
 gX8go2qIs+gyQkWZrQvXteF5KVIr/JTg+E4bRWgwMGla0glC5MuAJX5utDe9fEXNzI9KhhWJO32
 fGz2ZOgfHt5P7yDowuQ==
X-Proofpoint-ORIG-GUID: gdfcpUMo4Q7Pm0wk1zueppB_axMs-ZFC
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fdb38c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=GA4JE4aC73f7OREyLVIA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: gdfcpUMo4Q7Pm0wk1zueppB_axMs-ZFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080102
X-Rspamd-Queue-Id: E56A34F4B6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106624-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 12:49:50PM +0530, Sneh Mankad wrote:
> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 
> Enable Shikra APCS IPC support by adding the compatible.
> It reuses apps_shared_apcs_data.

With the DT bindings in place this patch is not required and useless.

> 
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>  	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
>  	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
> +	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>  	{}
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

