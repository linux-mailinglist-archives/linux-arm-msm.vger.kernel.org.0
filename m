Return-Path: <linux-arm-msm+bounces-91030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFsKCp0RemnH2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:39:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA1DA23BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 958E3300794F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC1222541C;
	Wed, 28 Jan 2026 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqvPLrUX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3I1S4Or"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC9F352C41
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769607578; cv=none; b=AughbuvRpsxGSMDcFJ/tm+0lJ7Q+ZDKjeAPq7Xxs2XcGxTpaw5+rKay2N9wXiuNPVaTHT8QU+F48aqA+Gs7UFRW6rV3M+ofb+WyvFd8yGeuk3+3Toyn2t+lfOJBKKm4A/C9jEINMFM+Pm4hrCOhKAAXNxWbgLe4fb2B+ZWSBKjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769607578; c=relaxed/simple;
	bh=Yuhgk/g+6xGbvKXzWEAPzhlJQV277cXRA5wZQdup1vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzsO+4H48O/BUcopky2ay9Hz/klKglmn+Q3Im/Yd5qzRDX5WlZVE4tgeg5lV1YvU3mqJdy24tLpGBqgJ/TvIowYZiFK2o/vH6ook3AzO6JgWjmMNVH3vdNO31rVn8Sdwi5tN8RMHvBS52OAVwpFs/yRdCIHv8AWqnWQ2vwqbjUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqvPLrUX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3I1S4Or; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92cvW041993
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O0osrPFbOmiLuUfjxs6qOPLzwDxoVeeFwe/w5K5EmiY=; b=AqvPLrUXHLL3QCAK
	DyR2H42rHtAQGvGHUchvEeAneNPKtcrsyejkuFdT4Iw9QiIi6MgefzzHMtdHkmnd
	ln+bXy/ngfBwiwR4K055lRzgVep+6clClhNIgVkgUP5o9L1gOJ3ov/hOl04laSAO
	wj4s4x9Ttpsz37VOBpabOgOtzF4vsCv0EYXdvK4J2Tf7Ym91CGIEnBvXG1jlIlvr
	T6PJs9CzL99BlgRX4hGnKnf6G0lTkFPOYfmDJznldaKeDNyS6JVDF7N5JH3vGgHO
	cyUmaTgxLX8ro1k7KwrD7k5lgW/x8RFY9Bp9LbmusE579YAbF2wfgVg4U6/PG59p
	fFY2lg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355u8jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:39:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88fd7ddba3fso27650536d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 05:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769607576; x=1770212376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0osrPFbOmiLuUfjxs6qOPLzwDxoVeeFwe/w5K5EmiY=;
        b=L3I1S4OrhBecmARehVfdrpqV/mtd/XKso8r0Nltsnu30FHjlsIOcFxs0n6AZCR3ITs
         EZoEAMx2vVN74Hbz+arfwN7LXCqUGcMCdvx/JfKcY85Ua5OAxX87fP9sYOqH7whnf8NC
         mVuKp5mOD4LLHnH4l3e2jNy0hsgLgF3MHbU+tPokCi4TcROJ1fg7xKQkUMg6jhQLfGVP
         HCwfdbmiOQNJAES4wAwJCF3Cg1Fj5pVC8z0yh4JXXW8FYSVFDLQ+1ddzP95sB6QJpdLD
         67hstoW8TXmcoQnuPWOfGXCy8wJ5zWpPWZ2twtaNLTu1qthjBAbgRlYdWn28Ou6XRCw8
         wzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769607576; x=1770212376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0osrPFbOmiLuUfjxs6qOPLzwDxoVeeFwe/w5K5EmiY=;
        b=DIUaKPCZBQhz6fnWpsixWbfWb/ZFrg5FCeoMe+AEJoHiw0qlDviXVFi0MOi+k9mZZs
         +h76lCeyRBDraMpNPQb4oQlSee9K0fKQzsPsxZN3d4F1bmt1Qczqk2vcpRnMVN3bpEBn
         5N0JajSFm6r30lZjLGSwSvGpsB2ger8qYUVZbNYG3ZKBUcfrk/paWTag+eryJzfMMq8p
         mLn8zl+FdIuOQphjQ/43S3esTANL29/oaRdy4SBpWL+69XEyGgEICg81hU0VtPgPnopS
         yM9riNSAnrDK8LRJzGrWuBNklN49vxyj5/V18KsssScMbcAk2siBsuDq4Qt4h4rTbiic
         4zMg==
X-Gm-Message-State: AOJu0Yxwv8EkOgQ3ENBEdLtPmHkS0fiZpm502NKCE0iypYM77OX6/+DK
	EuCzZnTwEh/xssVuz8ZRLGizhlDIOLdvhYPMX8qbdrg3L6ukYm1xbDb+D3mE6a73wMdMVkamxSk
	030Ig8+di0k+vtlL8GZCB1QTUrJPsUZucb5zjSYQVnY7wC0Aq899lpN2T8yXyQOI+Ouaf
X-Gm-Gg: AZuq6aIXSvyF2PlP05E39tR2zyBHmigbYr+RocKoHbbW9YI5+Qar/MIEZQNsot+m8EY
	+CNiNoGVQ2NFt4g0ySkZ8c9ZWsvg9JRLt4YmoxAH1khJ764swIOgRn+unxqUcKD19pllIYzjAJV
	hEllX7NnM5AK4yROZb8PNPO/n3ydjJzYc3lBQh4WyHBloU5OZG/dN2icsez4CiQ+SQoigi/ASnC
	SDyRH7gYOdJQR5v1i/8YAlyyw0nN+UbauTtdEIS8THfzhMAp42irw8FrPA1cPyVy6/JvuT7Nb9o
	oXdCltYNDIh6+IaDGpIf39yaKmSWE+H8WvAwOsyX76xqF3fMIUQRbgGetOQj8pHbM6VebTPw7Jt
	AMOqzACgIKRvncrRtmVEBdm724qFrZkLpF1Q3Scod08JDBEj1lf9Gtp2CY/WjUr15A2o=
X-Received: by 2002:a05:6214:3304:b0:894:8fc0:13cf with SMTP id 6a1803df08f44-894dcd227e1mr3737376d6.5.1769607575836;
        Wed, 28 Jan 2026 05:39:35 -0800 (PST)
X-Received: by 2002:a05:6214:3304:b0:894:8fc0:13cf with SMTP id 6a1803df08f44-894dcd227e1mr3737086d6.5.1769607575450;
        Wed, 28 Jan 2026 05:39:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469e45fsm1500146a12.24.2026.01.28.05.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:39:34 -0800 (PST)
Message-ID: <2d28b5d0-c5f4-4085-b2d0-18128b021416@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 14:39:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] firmware: qcom: scm: Add SCM storage interface
 support
To: Junhao Xie <bigfoot@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <20260126-scm-storage-v2-v2-1-fa045c7e7699@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-scm-storage-v2-v2-1-fa045c7e7699@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=697a1198 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ksxQWNrZAAAA:8 a=vnTlnYwSaAcbgi9v49MA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: mhQyyXRpPFaFXg9R7zB0RajoFQdxbiT4
X-Proofpoint-GUID: mhQyyXRpPFaFXg9R7zB0RajoFQdxbiT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExMSBTYWx0ZWRfXww0169mvP/50
 eNAXHWhtUrYujeKrT9aH30E9sDvODSmf4l6p2ybiBMjA+2/icMMnwWHRXJzM7ElejtgGudf0Hp6
 VQXw4ReseU5DeDybN0hlltojY8xCntSnziVah0yJi3saVugg/+kCAgKITnpAmJvpIMbYCmS6Z2i
 RB7EcKL7OZP33Phw7Xu+NKt872MxDQxVhghOEsdKsQzhV2nZe8DzXS1IzAi7AUQJzlLf8gURkZ7
 0BKOLX3jV7xQJ8KJX/bxuh6EtCEd1cQcx3ODJpnOXDEhATokfBWpHsT9xcVveihiuCGT+WrbOV9
 yRgK437nIPYzNPRyUDvS8X8q5oyvG6EioeFXHCvgUuI/teCnAuCPHZBx9AIZCcWi6YqnszejrVm
 7VYGJ74QBro2RTbodhzbzPuj7hhxNvMkvYEqQYBLi8bOnq3s48G/ecE58wqACevIFffUNUlfVOE
 ajLXlwO0Ntaz5Lvo1cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91030-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9DA1DA23BD
X-Rspamd-Action: no action

On 1/26/26 12:44 PM, Junhao Xie wrote:
> Add infrastructure to support accessing TrustZone-protected storage
> devices through SCM (Secure Channel Manager) calls. Some Qualcomm
> platforms protect their firmware storage (typically SPI NOR flash)
> via TrustZone, making it inaccessible from the non-secure world.
> 
> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
> Tested-by: Xilin Wu <sophon@radxa.com>
> ---

[...]

> +int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
> +			      enum qcom_scm_storage_cmd_id cmd_id,
> +			      u64 lba, void *data, size_t size)

Please add kerneldoc, as this is an exported function

> +{
> +	struct qcom_scm_storage_payload *payload __free(qcom_tzmem) = NULL;
> +	struct qcom_scm_res scm_res = {};
> +	struct qcom_scm_desc desc = {};
> +	phys_addr_t payload_addr;
> +	size_t buf_size;
> +	int ret;
> +
> +	buf_size = sizeof(*payload);
> +	if (data)
> +		buf_size += size;
> +
> +	payload = qcom_tzmem_alloc(__scm->mempool, buf_size, GFP_KERNEL);
> +	if (!payload)
> +		return -ENOMEM;
> +
> +	memset(payload, 0, buf_size);

You're overwriting the data part a line below, let's just zero out the
cmd+details (sizeof(*payload)) part

> +	if (data)

(please add a \n above - normally

foo = xyz;
if (abc)
	...

implies the condition takes into account the previous line)

[...]

> +	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_STORAGE,
> +					 QCOM_SCM_STORAGE_CMD))
> +		return;
> +
> +	ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
> +					QCOM_SCM_STORAGE_GET_INFO,
> +					0, &info, sizeof(info));

I'm curious what happens if the call is available but SPINOR is not
populated onboard..

I thiiiink it should return STORAGE_RESULT_INVALID_PARAMETER but I'm not
a 100% sure. Guess we'll see down the road.


> +	if (ret < 0) {
> +		dev_warn(scm->dev, "scm storage get info failed: %d\n", ret);
> +		return;
> +	}
> +
> +	total_blocks = le64_to_cpu(info.total_blocks);
> +	block_size = le32_to_cpu(info.block_size);
> +
> +	dev_dbg(scm->dev, "scm storage size %llu bytes\n",
> +		total_blocks * block_size);
> +
> +	storage_dev = platform_device_alloc("qcom_scm_storage", -1);

-1 is PLATFORM_DEVID_NONE

Let's use PLATFORM_DEVID_AUTO to allow potentially multiple instances of
this driver being spawned down the road

Konrad

